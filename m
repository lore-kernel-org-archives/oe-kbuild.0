Content-Type: multipart/mixed; boundary="===============9196565219896762529=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3630/3746] mm/huge_memory.c:1796 change_huge_pmd() warn: bitwise AND condition is false here
Date: Thu, 03 Feb 2022 14:14:27 +0800
Message-ID: <202202031437.KwWOvBlW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9196565219896762529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Huang Ying <ying.huang@intel.com>
CC: Baolin Wang <baolin.wang@linux.alibaba.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   6abab1b81b657ca74b7c443e832d95c87901e75b
commit: c558ddc081042d9aedbcc99994cac12ea38c2847 [3630/3746] memory tiering=
: skip to scan fast memory
:::::: branch date: 26 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-m031-20220131 (https://download.01.org/0day-ci/arc=
hive/20220203/202202031437.KwWOvBlW-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/huge_memory.c:1796 change_huge_pmd() warn: bitwise AND condition is fals=
e here

vim +1796 mm/huge_memory.c

84c3fc4e9c563d Zi Yan             2017-09-08  1777  =

c558ddc081042d Huang Ying         2022-02-02  1778  	if (prot_numa) {
c558ddc081042d Huang Ying         2022-02-02  1779  		struct page *page;
e944fd67b625c0 Mel Gorman         2015-02-12  1780  		/*
e944fd67b625c0 Mel Gorman         2015-02-12  1781  		 * Avoid trapping fau=
lts against the zero page. The read-only
e944fd67b625c0 Mel Gorman         2015-02-12  1782  		 * data is likely to =
be read-cached on the local CPU and
e944fd67b625c0 Mel Gorman         2015-02-12  1783  		 * local/remote hits =
to the zero page are not interesting.
e944fd67b625c0 Mel Gorman         2015-02-12  1784  		 */
c558ddc081042d Huang Ying         2022-02-02  1785  		if (is_huge_zero_pmd(=
*pmd))
0a85e51d37645e Kirill A. Shutemov 2017-04-13  1786  			goto unlock;
0a85e51d37645e Kirill A. Shutemov 2017-04-13  1787  =

c558ddc081042d Huang Ying         2022-02-02  1788  		if (pmd_protnone(*pmd=
))
0a85e51d37645e Kirill A. Shutemov 2017-04-13  1789  			goto unlock;
e944fd67b625c0 Mel Gorman         2015-02-12  1790  =

c558ddc081042d Huang Ying         2022-02-02  1791  		page =3D pmd_page(*pm=
d);
c558ddc081042d Huang Ying         2022-02-02  1792  		/*
c558ddc081042d Huang Ying         2022-02-02  1793  		 * Skip scanning top =
tier node if normal numa
c558ddc081042d Huang Ying         2022-02-02  1794  		 * balancing is disab=
led
c558ddc081042d Huang Ying         2022-02-02  1795  		 */
c558ddc081042d Huang Ying         2022-02-02 @1796  		if (!(sysctl_numa_bal=
ancing_mode & NUMA_BALANCING_NORMAL) &&
c558ddc081042d Huang Ying         2022-02-02  1797  		    node_is_toptier(p=
age_to_nid(page)))
c558ddc081042d Huang Ying         2022-02-02  1798  			goto unlock;
c558ddc081042d Huang Ying         2022-02-02  1799  	}
ced108037c2aa5 Kirill A. Shutemov 2017-04-13  1800  	/*
3e4e28c5a8f01e Michel Lespinasse  2020-06-08  1801  	 * In case prot_numa, =
we are under mmap_read_lock(mm). It's critical
ced108037c2aa5 Kirill A. Shutemov 2017-04-13  1802  	 * to not clear pmd in=
termittently to avoid race with MADV_DONTNEED
3e4e28c5a8f01e Michel Lespinasse  2020-06-08  1803  	 * which is also under=
 mmap_read_lock(mm):
ced108037c2aa5 Kirill A. Shutemov 2017-04-13  1804  	 *
ced108037c2aa5 Kirill A. Shutemov 2017-04-13  1805  	 *	CPU0:				CPU1:
ced108037c2aa5 Kirill A. Shutemov 2017-04-13  1806  	 *				change_huge_pmd(=
prot_numa=3D1)
ced108037c2aa5 Kirill A. Shutemov 2017-04-13  1807  	 *				 pmdp_huge_get_a=
nd_clear_notify()
ced108037c2aa5 Kirill A. Shutemov 2017-04-13  1808  	 * madvise_dontneed()
ced108037c2aa5 Kirill A. Shutemov 2017-04-13  1809  	 *  zap_pmd_range()
ced108037c2aa5 Kirill A. Shutemov 2017-04-13  1810  	 *   pmd_trans_huge(*p=
md) =3D=3D 0 (without ptl)
ced108037c2aa5 Kirill A. Shutemov 2017-04-13  1811  	 *   // skip the pmd
ced108037c2aa5 Kirill A. Shutemov 2017-04-13  1812  	 *				 set_pmd_at();
ced108037c2aa5 Kirill A. Shutemov 2017-04-13  1813  	 *				 // pmd is re-es=
tablished
ced108037c2aa5 Kirill A. Shutemov 2017-04-13  1814  	 *
ced108037c2aa5 Kirill A. Shutemov 2017-04-13  1815  	 * The race makes MADV=
_DONTNEED miss the huge pmd and don't clear it
ced108037c2aa5 Kirill A. Shutemov 2017-04-13  1816  	 * which may break use=
rspace.
ced108037c2aa5 Kirill A. Shutemov 2017-04-13  1817  	 *
ced108037c2aa5 Kirill A. Shutemov 2017-04-13  1818  	 * pmdp_invalidate() i=
s required to make sure we don't miss
ced108037c2aa5 Kirill A. Shutemov 2017-04-13  1819  	 * dirty/young flags s=
et by hardware.
ced108037c2aa5 Kirill A. Shutemov 2017-04-13  1820  	 */
a3cf988fcb8830 Kirill A. Shutemov 2018-01-31  1821  	entry =3D pmdp_invalid=
ate(vma, addr, pmd);
ced108037c2aa5 Kirill A. Shutemov 2017-04-13  1822  =

cd7548ab360c46 Johannes Weiner    2011-01-13  1823  	entry =3D pmd_modify(e=
ntry, newprot);
b191f9b106ea1a Mel Gorman         2015-03-25  1824  	if (preserve_write)
288bc54949fc26 Aneesh Kumar K.V   2017-02-24  1825  		entry =3D pmd_mk_save=
dwrite(entry);
292924b2602474 Peter Xu           2020-04-06  1826  	if (uffd_wp) {
292924b2602474 Peter Xu           2020-04-06  1827  		entry =3D pmd_wrprote=
ct(entry);
292924b2602474 Peter Xu           2020-04-06  1828  		entry =3D pmd_mkuffd_=
wp(entry);
292924b2602474 Peter Xu           2020-04-06  1829  	} else if (uffd_wp_res=
olve) {
292924b2602474 Peter Xu           2020-04-06  1830  		/*
292924b2602474 Peter Xu           2020-04-06  1831  		 * Leave the write bi=
t to be handled by PF interrupt
292924b2602474 Peter Xu           2020-04-06  1832  		 * handler, then thin=
gs like COW could be properly
292924b2602474 Peter Xu           2020-04-06  1833  		 * handled.
292924b2602474 Peter Xu           2020-04-06  1834  		 */
292924b2602474 Peter Xu           2020-04-06  1835  		entry =3D pmd_clear_u=
ffd_wp(entry);
292924b2602474 Peter Xu           2020-04-06  1836  	}
f123d74abf9157 Mel Gorman         2013-10-07  1837  	ret =3D HPAGE_PMD_NR;
56eecdb912b536 Aneesh Kumar K.V   2014-02-12  1838  	set_pmd_at(mm, addr, p=
md, entry);
0a85e51d37645e Kirill A. Shutemov 2017-04-13  1839  	BUG_ON(vma_is_anonymou=
s(vma) && !preserve_write && pmd_write(entry));
0a85e51d37645e Kirill A. Shutemov 2017-04-13  1840  unlock:
bf929152e9f6c4 Kirill A. Shutemov 2013-11-14  1841  	spin_unlock(ptl);
cd7548ab360c46 Johannes Weiner    2011-01-13  1842  	return ret;
cd7548ab360c46 Johannes Weiner    2011-01-13  1843  }
cd7548ab360c46 Johannes Weiner    2011-01-13  1844  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9196565219896762529==--

