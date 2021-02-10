Content-Type: multipart/mixed; boundary="===============7326998972101120311=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [bcache:for-next 9/19] drivers/md/bcache/nvm-pages.c:238:34: warning: Unsigned variable 'i' can't be negative so it is unnecessary to test it.
Date: Thu, 11 Feb 2021 00:10:53 +0800
Message-ID: <202102110037.werXNIlX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7326998972101120311==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Qiaowei Ren <qiaowei.ren@intel.com>
CC: Coly Li <colyli@suse.de>
CC: Jianpeng Ma <jianpeng.ma@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/colyli/linux-bcache=
.git for-next
head:   78729af1b480ca5a3edb9547b97b59ed3dd72440
commit: 7719cf7684941455e7d6505d2554623a19b7184b [9/19] bcache: initializat=
ion of the buddy
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/md/bcache/nvm-pages.c:
   drivers/md/bcache/nvm-pages.c:173:4: warning: Either the condition '!ext=
ents' is redundant or there is possible null pointer dereference: extents. =
[nullPointerRedundantCheck]
      extents->ns =3D only_set->nss[j];
      ^
   drivers/md/bcache/nvm-pages.c:185:10: note: Assuming that condition '!ex=
tents' is not redundant
        if (!extents) {
            ^
   drivers/md/bcache/nvm-pages.c:173:4: note: Null pointer dereference
      extents->ns =3D only_set->nss[j];
      ^
>> drivers/md/bcache/nvm-pages.c:238:34: warning: Unsigned variable 'i' can=
't be negative so it is unnecessary to test it. [unsignedPositive]
      for (i =3D BCH_MAX_ORDER - 1; i >=3D 0 ; i--) {
                                    ^

vim +238 drivers/md/bcache/nvm-pages.c

384227b99f4131 Qiaowei Ren 2021-02-08  225  =

7719cf76849414 Qiaowei Ren 2021-02-08  226  static void init_nvm_free_space=
(struct bch_nvm_namespace *ns)
7719cf76849414 Qiaowei Ren 2021-02-08  227  {
7719cf76849414 Qiaowei Ren 2021-02-08  228  	unsigned int start, end, i;
7719cf76849414 Qiaowei Ren 2021-02-08  229  	struct page *page;
7719cf76849414 Qiaowei Ren 2021-02-08  230  	long long pages;
7719cf76849414 Qiaowei Ren 2021-02-08  231  	pgoff_t pgoff_start;
7719cf76849414 Qiaowei Ren 2021-02-08  232  =

7719cf76849414 Qiaowei Ren 2021-02-08  233  	bitmap_for_each_clear_region(n=
s->pages_bitmap, start, end, 0, ns->pages_total) {
7719cf76849414 Qiaowei Ren 2021-02-08  234  		pgoff_start =3D start;
7719cf76849414 Qiaowei Ren 2021-02-08  235  		pages =3D end - start;
7719cf76849414 Qiaowei Ren 2021-02-08  236  =

7719cf76849414 Qiaowei Ren 2021-02-08  237  		while (pages) {
7719cf76849414 Qiaowei Ren 2021-02-08 @238  			for (i =3D BCH_MAX_ORDER - 1=
; i >=3D 0 ; i--) {
7719cf76849414 Qiaowei Ren 2021-02-08  239  				if ((pgoff_start % (1 << i)=
 =3D=3D 0) && (pages >=3D (1 << i)))
7719cf76849414 Qiaowei Ren 2021-02-08  240  					break;
7719cf76849414 Qiaowei Ren 2021-02-08  241  			}
7719cf76849414 Qiaowei Ren 2021-02-08  242  =

7719cf76849414 Qiaowei Ren 2021-02-08  243  			page =3D nvm_vaddr_to_page(n=
s, nvm_pgoff_to_vaddr(ns, pgoff_start));
7719cf76849414 Qiaowei Ren 2021-02-08  244  			page->index =3D pgoff_start;
7719cf76849414 Qiaowei Ren 2021-02-08  245  			set_page_private(page, i);
7719cf76849414 Qiaowei Ren 2021-02-08  246  			__SetPageBuddy(page);
7719cf76849414 Qiaowei Ren 2021-02-08  247  			list_add((struct list_head *=
)&page->zone_device_data, &ns->free_area[i]);
7719cf76849414 Qiaowei Ren 2021-02-08  248  =

7719cf76849414 Qiaowei Ren 2021-02-08  249  			pgoff_start +=3D 1 << i;
7719cf76849414 Qiaowei Ren 2021-02-08  250  			pages -=3D 1 << i;
7719cf76849414 Qiaowei Ren 2021-02-08  251  		}
7719cf76849414 Qiaowei Ren 2021-02-08  252  	}
7719cf76849414 Qiaowei Ren 2021-02-08  253  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============7326998972101120311==--

