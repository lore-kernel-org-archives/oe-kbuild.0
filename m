Content-Type: multipart/mixed; boundary="===============5076534409232557452=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hying-caritas:mmotm-2021-12-06 129/268] mm/migrate.c:311 __migration_entry_wait() warn: inconsistent returns 'ptl'.
Date: Sat, 11 Dec 2021 10:03:04 +0800
Message-ID: <202112110943.Fa2Qkr18-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5076534409232557452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alistair Popple <apopple@nvidia.com>
CC: Huang Ying <ying.huang@intel.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://github.com/hying-caritas/linux.git mmotm-2021-12-06
head:   a57b74d47d00793cb27918be5147ede2ece3a37b
commit: 3c4d0562835e755206ada3026d28b0b6b108fa78 [129/268] mm/migrate.c: re=
work migration_entry_wait() to not take a pageref
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021-20211209 (https://download.01.org/0day-ci/arch=
ive/20211211/202112110943.Fa2Qkr18-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/migrate.c:311 __migration_entry_wait() warn: inconsistent returns 'ptl'.

vim +/ptl +311 mm/migrate.c

04e62a29bf157c Christoph Lameter 2006-06-23  283  =

0697212a411c1d Christoph Lameter 2006-06-23  284  /*
0697212a411c1d Christoph Lameter 2006-06-23  285   * Something used the pte=
 of a page under migration. We need to
0697212a411c1d Christoph Lameter 2006-06-23  286   * get to the page and wa=
it until migration is finished.
0697212a411c1d Christoph Lameter 2006-06-23  287   * When we return from th=
is function the fault will be retried.
0697212a411c1d Christoph Lameter 2006-06-23  288   */
e66f17ff71772b Naoya Horiguchi   2015-02-11  289  void __migration_entry_wa=
it(struct mm_struct *mm, pte_t *ptep,
30dad30922ccc7 Naoya Horiguchi   2013-06-12  290  				spinlock_t *ptl)
0697212a411c1d Christoph Lameter 2006-06-23  291  {
30dad30922ccc7 Naoya Horiguchi   2013-06-12  292  	pte_t pte;
0697212a411c1d Christoph Lameter 2006-06-23  293  	swp_entry_t entry;
0697212a411c1d Christoph Lameter 2006-06-23  294  	struct page *page;
0697212a411c1d Christoph Lameter 2006-06-23  295  =

30dad30922ccc7 Naoya Horiguchi   2013-06-12  296  	spin_lock(ptl);
0697212a411c1d Christoph Lameter 2006-06-23  297  	pte =3D *ptep;
0697212a411c1d Christoph Lameter 2006-06-23  298  	if (!is_swap_pte(pte))
0697212a411c1d Christoph Lameter 2006-06-23  299  		goto out;
0697212a411c1d Christoph Lameter 2006-06-23  300  =

0697212a411c1d Christoph Lameter 2006-06-23  301  	entry =3D pte_to_swp_ent=
ry(pte);
0697212a411c1d Christoph Lameter 2006-06-23  302  	if (!is_migration_entry(=
entry))
0697212a411c1d Christoph Lameter 2006-06-23  303  		goto out;
0697212a411c1d Christoph Lameter 2006-06-23  304  =

af5cdaf82238fb Alistair Popple   2021-06-30  305  	page =3D pfn_swap_entry_=
to_page(entry);
ffc90cbb2970ab Xu Yu             2021-06-15  306  	page =3D compound_head(p=
age);
0697212a411c1d Christoph Lameter 2006-06-23  307  =

3c4d0562835e75 Alistair Popple   2021-12-09  308  	migration_entry_wait_on_=
locked(page_folio(page), ptep, ptl);
0697212a411c1d Christoph Lameter 2006-06-23  309  	return;
0697212a411c1d Christoph Lameter 2006-06-23  310  out:
0697212a411c1d Christoph Lameter 2006-06-23 @311  	pte_unmap_unlock(ptep, p=
tl);
0697212a411c1d Christoph Lameter 2006-06-23  312  }
0697212a411c1d Christoph Lameter 2006-06-23  313  =


:::::: The code at line 311 was first introduced by commit
:::::: 0697212a411c1dae03c27845f2de2f3adb32c331 [PATCH] Swapless page migra=
tion: add R/W migration entries

:::::: TO: Christoph Lameter <clameter@sgi.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5076534409232557452==--

