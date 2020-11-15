Content-Type: multipart/mixed; boundary="===============6481991373451086638=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/shmem.c:1920:10: warning: Variable 'hindex' is reassigned a value before the old one has been used. 'break; '
Date: Sun, 15 Nov 2020 18:36:31 +0800
Message-ID: <202011151820.EVQAyN1y-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6481991373451086638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e28c0d7c92c89016c12a677616668957351e7542
commit: 63ec1973ddf3eb70feb5728088ca190f1af449cb mm/shmem: return head page=
 from find_lock_entry
date:   5 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 5 weeks ago
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> mm/shmem.c:1920:10: warning: Variable 'hindex' is reassigned a value bef=
ore the old one has been used. 'break;' missing? [redundantAssignInSwitch]
     hindex =3D round_down(index, HPAGE_PMD_NR);
            ^
   mm/shmem.c:1834:10: note: Variable 'hindex' is reassigned a value before=
 the old one has been used. 'break;' missing?
     hindex =3D page->index;
            ^
   mm/shmem.c:1920:10: note: Variable 'hindex' is reassigned a value before=
 the old one has been used. 'break;' missing?
     hindex =3D round_down(index, HPAGE_PMD_NR);
            ^
>> mm/shmem.c:1920:10: warning: Variable 'hindex' is reassigned a value bef=
ore the old one has been used. 'break;' missing? [redundantAssignInSwitch]
     hindex =3D round_down(index, HPAGE_PMD_NR);
            ^
   mm/shmem.c:1845:10: note: Variable 'hindex' is reassigned a value before=
 the old one has been used. 'break;' missing?
     hindex =3D index;
            ^
   mm/shmem.c:1920:10: note: Variable 'hindex' is reassigned a value before=
 the old one has been used. 'break;' missing?
     hindex =3D round_down(index, HPAGE_PMD_NR);
            ^

vim +1920 mm/shmem.c

c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1782  =

c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1783  /*
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1784   * shmem_getpage_g=
fp - find page in cache, or get from swap, or allocate
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1785   *
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1786   * If we allocate =
a new one we do not mark it dirty. That's up to the
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1787   * vm. If we swap =
it in we mark it dirty since we also free the swap
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1788   * entry since a p=
age cannot live in both the swap and page cache.
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1789   *
28eb3c80871951 Miles Chen              2019-09-23  1790   * vmf and fault_t=
ype are only supplied by shmem_fault:
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1791   * otherwise they =
are NULL.
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1792   */
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1793  static int shmem_g=
etpage_gfp(struct inode *inode, pgoff_t index,
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1794  	struct page **pag=
ep, enum sgp_type sgp, gfp_t gfp,
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1795  	struct vm_area_st=
ruct *vma, struct vm_fault *vmf,
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1796  			vm_fault_t *fau=
lt_type)
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1797  {
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1798  	struct address_sp=
ace *mapping =3D inode->i_mapping;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1799  	struct shmem_inod=
e_info *info =3D SHMEM_I(inode);
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1800  	struct shmem_sb_i=
nfo *sbinfo;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1801  	struct mm_struct =
*charge_mm;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1802  	struct page *page;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1803  	enum sgp_type sgp=
_huge =3D sgp;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1804  	pgoff_t hindex =
=3D index;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1805  	int error;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1806  	int once =3D 0;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1807  	int alloced =3D 0;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1808  =

c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1809  	if (index > (MAX_=
LFS_FILESIZE >> PAGE_SHIFT))
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1810  		return -EFBIG;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1811  	if (sgp =3D=3D SG=
P_NOHUGE || sgp =3D=3D SGP_HUGE)
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1812  		sgp =3D SGP_CACH=
E;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1813  repeat:
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1814  	if (sgp <=3D SGP_=
CACHE &&
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1815  	    ((loff_t)inde=
x << PAGE_SHIFT) >=3D i_size_read(inode)) {
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1816  		return -EINVAL;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1817  	}
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1818  =

c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1819  	sbinfo =3D SHMEM_=
SB(inode->i_sb);
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1820  	charge_mm =3D vma=
 ? vma->vm_mm : current->mm;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1821  =

c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1822  	page =3D find_loc=
k_entry(mapping, index);
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1823  	if (xa_is_value(p=
age)) {
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1824  		error =3D shmem_=
swapin_page(inode, index, &page,
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1825  					  sgp, gfp, v=
ma, fault_type);
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1826  		if (error =3D=3D=
 -EEXIST)
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1827  			goto repeat;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1828  =

c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1829  		*pagep =3D page;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1830  		return error;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1831  	}
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1832  =

63ec1973ddf3eb Matthew Wilcox (Oracle  2020-10-13  1833) 	if (page)
63ec1973ddf3eb Matthew Wilcox (Oracle  2020-10-13  1834) 		hindex =3D page-=
>index;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1835  	if (page && sgp =
=3D=3D SGP_WRITE)
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1836  		mark_page_access=
ed(page);
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1837  =

c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1838  	/* fallocated pag=
e? */
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1839  	if (page && !Page=
Uptodate(page)) {
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1840  		if (sgp !=3D SGP=
_READ)
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1841  			goto clear;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1842  		unlock_page(page=
);
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1843  		put_page(page);
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1844  		page =3D NULL;
63ec1973ddf3eb Matthew Wilcox (Oracle  2020-10-13  1845) 		hindex =3D index;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1846  	}
63ec1973ddf3eb Matthew Wilcox (Oracle  2020-10-13  1847) 	if (page || sgp =
=3D=3D SGP_READ)
63ec1973ddf3eb Matthew Wilcox (Oracle  2020-10-13  1848) 		goto out;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1849  =

c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1850  	/*
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1851  	 * Fast cache loo=
kup did not find it:
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1852  	 * bring it back =
from swap or allocate.
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1853  	 */
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1854  =

cfda05267f7bd0 Mike Rapoport           2017-02-22  1855  	if (vma && userfa=
ultfd_missing(vma)) {
cfda05267f7bd0 Mike Rapoport           2017-02-22  1856  		*fault_type =3D =
handle_userfault(vmf, VM_UFFD_MISSING);
cfda05267f7bd0 Mike Rapoport           2017-02-22  1857  		return 0;
cfda05267f7bd0 Mike Rapoport           2017-02-22  1858  	}
cfda05267f7bd0 Mike Rapoport           2017-02-22  1859  =

800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1860  	/* shmem_symlink(=
) */
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1861  	if (mapping->a_op=
s !=3D &shmem_aops)
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1862  		goto alloc_nohug=
e;
657e3038c4e6fc Kirill A. Shutemov      2016-07-26  1863  	if (shmem_huge =
=3D=3D SHMEM_HUGE_DENY || sgp_huge =3D=3D SGP_NOHUGE)
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1864  		goto alloc_nohug=
e;
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1865  	if (shmem_huge =
=3D=3D SHMEM_HUGE_FORCE)
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1866  		goto alloc_huge;
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1867  	switch (sbinfo->h=
uge) {
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1868  	case SHMEM_HUGE_N=
EVER:
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1869  		goto alloc_nohug=
e;
27d80fa24326b7 Kees Cook               2020-04-06  1870  	case SHMEM_HUGE_W=
ITHIN_SIZE: {
27d80fa24326b7 Kees Cook               2020-04-06  1871  		loff_t i_size;
27d80fa24326b7 Kees Cook               2020-04-06  1872  		pgoff_t off;
27d80fa24326b7 Kees Cook               2020-04-06  1873  =

800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1874  		off =3D round_up=
(index, HPAGE_PMD_NR);
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1875  		i_size =3D round=
_up(i_size_read(inode), PAGE_SIZE);
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1876  		if (i_size >=3D =
HPAGE_PMD_SIZE &&
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1877  		    i_size >> PA=
GE_SHIFT >=3D off)
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1878  			goto alloc_huge;
27d80fa24326b7 Kees Cook               2020-04-06  1879  =

27d80fa24326b7 Kees Cook               2020-04-06  1880  		fallthrough;
27d80fa24326b7 Kees Cook               2020-04-06  1881  	}
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1882  	case SHMEM_HUGE_A=
DVISE:
657e3038c4e6fc Kirill A. Shutemov      2016-07-26  1883  		if (sgp_huge =3D=
=3D SGP_HUGE)
657e3038c4e6fc Kirill A. Shutemov      2016-07-26  1884  			goto alloc_huge;
657e3038c4e6fc Kirill A. Shutemov      2016-07-26  1885  		/* TODO: impleme=
nt fadvise() hints */
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1886  		goto alloc_nohug=
e;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1887  	}
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1888  =

800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1889  alloc_huge:
0f0796945614b7 Mike Rapoport           2017-09-06  1890  	page =3D shmem_al=
loc_and_acct_page(gfp, inode, index, true);
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1891  	if (IS_ERR(page))=
 {
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1892  alloc_nohuge:
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1893  		page =3D shmem_a=
lloc_and_acct_page(gfp, inode,
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1894  						 index, fals=
e);
54af60421822bb Hugh Dickins            2011-08-03  1895  	}
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1896  	if (IS_ERR(page))=
 {
779750d20b93bb Kirill A. Shutemov      2016-07-26  1897  		int retry =3D 5;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1898  =

800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1899  		error =3D PTR_ER=
R(page);
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1900  		page =3D NULL;
779750d20b93bb Kirill A. Shutemov      2016-07-26  1901  		if (error !=3D -=
ENOSPC)
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1902  			goto unlock;
779750d20b93bb Kirill A. Shutemov      2016-07-26  1903  		/*
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1904  		 * Try to reclai=
m some space by splitting a huge page
779750d20b93bb Kirill A. Shutemov      2016-07-26  1905  		 * beyond i_size=
 on the filesystem.
779750d20b93bb Kirill A. Shutemov      2016-07-26  1906  		 */
779750d20b93bb Kirill A. Shutemov      2016-07-26  1907  		while (retry--) {
779750d20b93bb Kirill A. Shutemov      2016-07-26  1908  			int ret;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1909  =

779750d20b93bb Kirill A. Shutemov      2016-07-26  1910  			ret =3D shmem_u=
nused_huge_shrink(sbinfo, NULL, 1);
779750d20b93bb Kirill A. Shutemov      2016-07-26  1911  			if (ret =3D=3D =
SHRINK_STOP)
779750d20b93bb Kirill A. Shutemov      2016-07-26  1912  				break;
779750d20b93bb Kirill A. Shutemov      2016-07-26  1913  			if (ret)
779750d20b93bb Kirill A. Shutemov      2016-07-26  1914  				goto alloc_noh=
uge;
779750d20b93bb Kirill A. Shutemov      2016-07-26  1915  		}
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1916  		goto unlock;
54af60421822bb Hugh Dickins            2011-08-03  1917  	}
ff36b801624d02 Shaohua Li              2010-08-09  1918  =

800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1919  	if (PageTransHuge=
(page))
800d8c63b2e989 Kirill A. Shutemov      2016-07-26 @1920  		hindex =3D round=
_down(index, HPAGE_PMD_NR);
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1921  	else
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1922  		hindex =3D index;
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1923  =

66d2f4d28cd030 Hugh Dickins            2014-07-02  1924  	if (sgp =3D=3D SG=
P_WRITE)
eb39d618f9e80f Hugh Dickins            2014-08-06  1925  		__SetPageReferen=
ced(page);
66d2f4d28cd030 Hugh Dickins            2014-07-02  1926  =

800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1927  	error =3D shmem_a=
dd_to_page_cache(page, mapping, hindex,
3fea5a499d57de Johannes Weiner         2020-06-03  1928  					NULL, gfp & G=
FP_RECLAIM_MASK,
3fea5a499d57de Johannes Weiner         2020-06-03  1929  					charge_mm);
3fea5a499d57de Johannes Weiner         2020-06-03  1930  	if (error)
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1931  		goto unacct;
6058eaec816f29 Johannes Weiner         2020-06-03  1932  	lru_cache_add(pag=
e);
54af60421822bb Hugh Dickins            2011-08-03  1933  =

4595ef88d13613 Kirill A. Shutemov      2016-07-26  1934  	spin_lock_irq(&in=
fo->lock);
d8c6546b1aea84 Matthew Wilcox (Oracle  2019-09-23  1935) 	info->alloced +=
=3D compound_nr(page);
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1936  	inode->i_blocks +=
=3D BLOCKS_PER_PAGE << compound_order(page);
54af60421822bb Hugh Dickins            2011-08-03  1937  	shmem_recalc_inod=
e(inode);
4595ef88d13613 Kirill A. Shutemov      2016-07-26  1938  	spin_unlock_irq(&=
info->lock);
1635f6a74152f1 Hugh Dickins            2012-05-29  1939  	alloced =3D true;
54af60421822bb Hugh Dickins            2011-08-03  1940  =

779750d20b93bb Kirill A. Shutemov      2016-07-26  1941  	if (PageTransHuge=
(page) &&
779750d20b93bb Kirill A. Shutemov      2016-07-26  1942  	    DIV_ROUND_UP(=
i_size_read(inode), PAGE_SIZE) <
779750d20b93bb Kirill A. Shutemov      2016-07-26  1943  			hindex + HPAGE_=
PMD_NR - 1) {
779750d20b93bb Kirill A. Shutemov      2016-07-26  1944  		/*
779750d20b93bb Kirill A. Shutemov      2016-07-26  1945  		 * Part of the h=
uge page is beyond i_size: subject
779750d20b93bb Kirill A. Shutemov      2016-07-26  1946  		 * to shrink und=
er memory pressure.
779750d20b93bb Kirill A. Shutemov      2016-07-26  1947  		 */
779750d20b93bb Kirill A. Shutemov      2016-07-26  1948  		spin_lock(&sbinf=
o->shrinklist_lock);
d041353dc98a63 Cong Wang               2017-08-10  1949  		/*
d041353dc98a63 Cong Wang               2017-08-10  1950  		 * _careful to d=
efend against unlocked access to
d041353dc98a63 Cong Wang               2017-08-10  1951  		 * ->shrink_list=
 in shmem_unused_huge_shrink()
d041353dc98a63 Cong Wang               2017-08-10  1952  		 */
d041353dc98a63 Cong Wang               2017-08-10  1953  		if (list_empty_c=
areful(&info->shrinklist)) {
779750d20b93bb Kirill A. Shutemov      2016-07-26  1954  			list_add_tail(&=
info->shrinklist,
779750d20b93bb Kirill A. Shutemov      2016-07-26  1955  				      &sbinfo-=
>shrinklist);
779750d20b93bb Kirill A. Shutemov      2016-07-26  1956  			sbinfo->shrinkl=
ist_len++;
779750d20b93bb Kirill A. Shutemov      2016-07-26  1957  		}
779750d20b93bb Kirill A. Shutemov      2016-07-26  1958  		spin_unlock(&sbi=
nfo->shrinklist_lock);
779750d20b93bb Kirill A. Shutemov      2016-07-26  1959  	}
779750d20b93bb Kirill A. Shutemov      2016-07-26  1960  =

ec9516fbc5fa81 Hugh Dickins            2012-05-29  1961  	/*
1635f6a74152f1 Hugh Dickins            2012-05-29  1962  	 * Let SGP_FALLOC=
 use the SGP_WRITE optimization on a new page.
1635f6a74152f1 Hugh Dickins            2012-05-29  1963  	 */
1635f6a74152f1 Hugh Dickins            2012-05-29  1964  	if (sgp =3D=3D SG=
P_FALLOC)
1635f6a74152f1 Hugh Dickins            2012-05-29  1965  		sgp =3D SGP_WRIT=
E;
1635f6a74152f1 Hugh Dickins            2012-05-29  1966  clear:
1635f6a74152f1 Hugh Dickins            2012-05-29  1967  	/*
1635f6a74152f1 Hugh Dickins            2012-05-29  1968  	 * Let SGP_WRITE =
caller clear ends if write does not fill page;
1635f6a74152f1 Hugh Dickins            2012-05-29  1969  	 * but SGP_FALLOC=
 on a page fallocated earlier must initialize
1635f6a74152f1 Hugh Dickins            2012-05-29  1970  	 * it now, lest u=
ndo on failure cancel our earlier guarantee.
ec9516fbc5fa81 Hugh Dickins            2012-05-29  1971  	 */
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1972  	if (sgp !=3D SGP_=
WRITE && !PageUptodate(page)) {
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1973  		int i;
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1974  =

63ec1973ddf3eb Matthew Wilcox (Oracle  2020-10-13  1975) 		for (i =3D 0; i =
< compound_nr(page); i++) {
63ec1973ddf3eb Matthew Wilcox (Oracle  2020-10-13  1976) 			clear_highpage(=
page + i);
63ec1973ddf3eb Matthew Wilcox (Oracle  2020-10-13  1977) 			flush_dcache_pa=
ge(page + i);
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1978  		}
63ec1973ddf3eb Matthew Wilcox (Oracle  2020-10-13  1979) 		SetPageUptodate(=
page);
ec9516fbc5fa81 Hugh Dickins            2012-05-29  1980  	}
bde05d1ccd5126 Hugh Dickins            2012-05-29  1981  =

54af60421822bb Hugh Dickins            2011-08-03  1982  	/* Perhaps the fi=
le has been truncated since we checked */
75edd345e8ede5 Hugh Dickins            2016-05-19  1983  	if (sgp <=3D SGP_=
CACHE &&
09cbfeaf1a5a67 Kirill A. Shutemov      2016-04-01  1984  	    ((loff_t)inde=
x << PAGE_SHIFT) >=3D i_size_read(inode)) {
267a4c76bbdb95 Hugh Dickins            2015-12-11  1985  		if (alloced) {
267a4c76bbdb95 Hugh Dickins            2015-12-11  1986  			ClearPageDirty(=
page);
267a4c76bbdb95 Hugh Dickins            2015-12-11  1987  			delete_from_pag=
e_cache(page);
4595ef88d13613 Kirill A. Shutemov      2016-07-26  1988  			spin_lock_irq(&=
info->lock);
267a4c76bbdb95 Hugh Dickins            2015-12-11  1989  			shmem_recalc_in=
ode(inode);
4595ef88d13613 Kirill A. Shutemov      2016-07-26  1990  			spin_unlock_irq=
(&info->lock);
267a4c76bbdb95 Hugh Dickins            2015-12-11  1991  		}
54af60421822bb Hugh Dickins            2011-08-03  1992  		error =3D -EINVA=
L;
267a4c76bbdb95 Hugh Dickins            2015-12-11  1993  		goto unlock;
e83c32e8f92724 Hugh Dickins            2011-07-25  1994  	}
63ec1973ddf3eb Matthew Wilcox (Oracle  2020-10-13  1995) out:
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1996  	*pagep =3D page +=
 index - hindex;
54af60421822bb Hugh Dickins            2011-08-03  1997  	return 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1998  =

59a16ead572330 Hugh Dickins            2011-05-11  1999  	/*
54af60421822bb Hugh Dickins            2011-08-03  2000  	 * Error recovery.
59a16ead572330 Hugh Dickins            2011-05-11  2001  	 */
54af60421822bb Hugh Dickins            2011-08-03  2002  unacct:
d8c6546b1aea84 Matthew Wilcox (Oracle  2019-09-23  2003) 	shmem_inode_unacc=
t_blocks(inode, compound_nr(page));
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  2004  =

800d8c63b2e989 Kirill A. Shutemov      2016-07-26  2005  	if (PageTransHuge=
(page)) {
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  2006  		unlock_page(page=
);
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  2007  		put_page(page);
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  2008  		goto alloc_nohug=
e;
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  2009  	}
d189922862e03c Hugh Dickins            2012-07-11  2010  unlock:
27ab700626f048 Hugh Dickins            2011-07-25  2011  	if (page) {
54af60421822bb Hugh Dickins            2011-08-03  2012  		unlock_page(page=
);
09cbfeaf1a5a67 Kirill A. Shutemov      2016-04-01  2013  		put_page(page);
54af60421822bb Hugh Dickins            2011-08-03  2014  	}
54af60421822bb Hugh Dickins            2011-08-03  2015  	if (error =3D=3D =
-ENOSPC && !once++) {
4595ef88d13613 Kirill A. Shutemov      2016-07-26  2016  		spin_lock_irq(&i=
nfo->lock);
54af60421822bb Hugh Dickins            2011-08-03  2017  		shmem_recalc_ino=
de(inode);
4595ef88d13613 Kirill A. Shutemov      2016-07-26  2018  		spin_unlock_irq(=
&info->lock);
59a16ead572330 Hugh Dickins            2011-05-11  2019  		goto repeat;
59a16ead572330 Hugh Dickins            2011-05-11  2020  	}
7f4446eefe9fbb Matthew Wilcox          2017-12-04  2021  	if (error =3D=3D =
-EEXIST)
54af60421822bb Hugh Dickins            2011-08-03  2022  		goto repeat;
54af60421822bb Hugh Dickins            2011-08-03  2023  	return error;
^1da177e4c3f41 Linus Torvalds          2005-04-16  2024  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  2025  =


:::::: The code at line 1920 was first introduced by commit
:::::: 800d8c63b2e989c2e349632d1648119bf5862f01 shmem: add huge pages suppo=
rt

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6481991373451086638==--

