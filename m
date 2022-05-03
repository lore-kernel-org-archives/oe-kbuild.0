Content-Type: multipart/mixed; boundary="===============6063525274534519489=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7461/8237] mm/shmem.c:1916 shmem_getpage_gfp() warn: should '(((1) << 12) / 512) << folio_order(folio)' be a 64 bit type?
Date: Wed, 04 May 2022 03:57:31 +0800
Message-ID: <202205040358.1OZIIUze-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6063525274534519489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   44a2f39e611ac0bc1f17c288a583d7f2e5684aa7
commit: 94cdf3e8c0bfb3360b7b19038979ee701e4f6158 [7461/8237] mm/shmem: conv=
ert shmem_getpage_gfp to use a folio
:::::: branch date: 12 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
504/202205040358.1OZIIUze-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/shmem.c:1916 shmem_getpage_gfp() warn: should '(((1) << 12) / 512) << fo=
lio_order(folio)' be a 64 bit type?

vim +1916 mm/shmem.c

c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1775  =

c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1776  /*
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1777   * shmem_getpage_g=
fp - find page in cache, or get from swap, or allocate
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1778   *
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1779   * If we allocate =
a new one we do not mark it dirty. That's up to the
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1780   * vm. If we swap =
it in we mark it dirty since we also free the swap
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1781   * entry since a p=
age cannot live in both the swap and page cache.
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1782   *
c949b097ef2e33 Axel Rasmussen          2021-06-30  1783   * vma, vmf, and f=
ault_type are only supplied by shmem_fault:
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1784   * otherwise they =
are NULL.
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1785   */
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1786  static int shmem_g=
etpage_gfp(struct inode *inode, pgoff_t index,
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1787  	struct page **pag=
ep, enum sgp_type sgp, gfp_t gfp,
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1788  	struct vm_area_st=
ruct *vma, struct vm_fault *vmf,
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1789  			vm_fault_t *fau=
lt_type)
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1790  {
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1791  	struct address_sp=
ace *mapping =3D inode->i_mapping;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1792  	struct shmem_inod=
e_info *info =3D SHMEM_I(inode);
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1793  	struct shmem_sb_i=
nfo *sbinfo;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1794  	struct mm_struct =
*charge_mm;
9a44f3462edc49 Matthew Wilcox (Oracle  2022-04-29  1795) 	struct folio *fol=
io;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1796  	pgoff_t hindex =
=3D index;
164cc4fef44567 Rik van Riel            2021-02-25  1797  	gfp_t huge_gfp;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1798  	int error;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1799  	int once =3D 0;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1800  	int alloced =3D 0;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1801  =

c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1802  	if (index > (MAX_=
LFS_FILESIZE >> PAGE_SHIFT))
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1803  		return -EFBIG;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1804  repeat:
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1805  	if (sgp <=3D SGP_=
CACHE &&
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1806  	    ((loff_t)inde=
x << PAGE_SHIFT) >=3D i_size_read(inode)) {
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1807  		return -EINVAL;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1808  	}
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1809  =

c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1810  	sbinfo =3D SHMEM_=
SB(inode->i_sb);
04f94e3fbe1afc Dan Schatzberg          2021-06-28  1811  	charge_mm =3D vma=
 ? vma->vm_mm : NULL;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1812  =

94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1813) 	folio =3D __filem=
ap_get_folio(mapping, index, FGP_ENTRY | FGP_LOCK, 0);
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1814) 	if (folio && vma =
&& userfaultfd_minor(vma)) {
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1815) 		if (!xa_is_value=
(folio)) {
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1816) 			folio_unlock(fo=
lio);
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1817) 			folio_put(folio=
);
c949b097ef2e33 Axel Rasmussen          2021-06-30  1818  		}
c949b097ef2e33 Axel Rasmussen          2021-06-30  1819  		*fault_type =3D =
handle_userfault(vmf, VM_UFFD_MINOR);
c949b097ef2e33 Axel Rasmussen          2021-06-30  1820  		return 0;
c949b097ef2e33 Axel Rasmussen          2021-06-30  1821  	}
c949b097ef2e33 Axel Rasmussen          2021-06-30  1822  =

94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1823) 	if (xa_is_value(f=
olio)) {
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1824) 		struct page *pag=
e =3D &folio->page;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1825  		error =3D shmem_=
swapin_page(inode, index, &page,
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1826  					  sgp, gfp, v=
ma, fault_type);
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1827  		if (error =3D=3D=
 -EEXIST)
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1828  			goto repeat;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1829  =

c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1830  		*pagep =3D page;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1831  		return error;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1832  	}
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1833  =

94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1834) 	if (folio) {
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1835) 		hindex =3D folio=
->index;
acdd9f8e0fed9f Hugh Dickins            2021-09-02  1836  		if (sgp =3D=3D S=
GP_WRITE)
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1837) 			folio_mark_acce=
ssed(folio);
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1838) 		if (folio_test_u=
ptodate(folio))
acdd9f8e0fed9f Hugh Dickins            2021-09-02  1839  			goto out;
acdd9f8e0fed9f Hugh Dickins            2021-09-02  1840  		/* fallocated pa=
ge */
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1841  		if (sgp !=3D SGP=
_READ)
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1842  			goto clear;
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1843) 		folio_unlock(fol=
io);
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1844) 		folio_put(folio);
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1845  	}
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1846  =

c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1847  	/*
acdd9f8e0fed9f Hugh Dickins            2021-09-02  1848  	 * SGP_READ: succ=
eed on hole, with NULL page, letting caller zero.
acdd9f8e0fed9f Hugh Dickins            2021-09-02  1849  	 * SGP_NOALLOC: f=
ail on hole, with NULL page, letting caller fail.
acdd9f8e0fed9f Hugh Dickins            2021-09-02  1850  	 */
acdd9f8e0fed9f Hugh Dickins            2021-09-02  1851  	*pagep =3D NULL;
acdd9f8e0fed9f Hugh Dickins            2021-09-02  1852  	if (sgp =3D=3D SG=
P_READ)
acdd9f8e0fed9f Hugh Dickins            2021-09-02  1853  		return 0;
acdd9f8e0fed9f Hugh Dickins            2021-09-02  1854  	if (sgp =3D=3D SG=
P_NOALLOC)
acdd9f8e0fed9f Hugh Dickins            2021-09-02  1855  		return -ENOENT;
acdd9f8e0fed9f Hugh Dickins            2021-09-02  1856  =

acdd9f8e0fed9f Hugh Dickins            2021-09-02  1857  	/*
acdd9f8e0fed9f Hugh Dickins            2021-09-02  1858  	 * Fast cache loo=
kup and swap lookup did not find it: allocate.
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1859  	 */
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1860  =

cfda05267f7bd0 Mike Rapoport           2017-02-22  1861  	if (vma && userfa=
ultfd_missing(vma)) {
cfda05267f7bd0 Mike Rapoport           2017-02-22  1862  		*fault_type =3D =
handle_userfault(vmf, VM_UFFD_MISSING);
cfda05267f7bd0 Mike Rapoport           2017-02-22  1863  		return 0;
cfda05267f7bd0 Mike Rapoport           2017-02-22  1864  	}
cfda05267f7bd0 Mike Rapoport           2017-02-22  1865  =

5e6e5a12a44ca5 Hugh Dickins            2021-09-02  1866  	if (!shmem_is_hug=
e(vma, inode, index))
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1867  		goto alloc_nohug=
e;
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1868  =

164cc4fef44567 Rik van Riel            2021-02-25  1869  	huge_gfp =3D vma_=
thp_gfp_mask(vma);
78cc8cdc54008f Rik van Riel            2021-02-25  1870  	huge_gfp =3D limi=
t_gfp_mask(huge_gfp, gfp);
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1871) 	folio =3D shmem_a=
lloc_and_acct_folio(huge_gfp, inode, index, true);
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1872) 	if (IS_ERR(folio)=
) {
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1873  alloc_nohuge:
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1874) 		folio =3D shmem_=
alloc_and_acct_folio(gfp, inode, index, false);
54af60421822bb Hugh Dickins            2011-08-03  1875  	}
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1876) 	if (IS_ERR(folio)=
) {
779750d20b93bb Kirill A. Shutemov      2016-07-26  1877  		int retry =3D 5;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1878  =

94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1879) 		error =3D PTR_ER=
R(folio);
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1880) 		folio =3D NULL;
779750d20b93bb Kirill A. Shutemov      2016-07-26  1881  		if (error !=3D -=
ENOSPC)
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1882  			goto unlock;
779750d20b93bb Kirill A. Shutemov      2016-07-26  1883  		/*
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1884  		 * Try to reclai=
m some space by splitting a huge page
779750d20b93bb Kirill A. Shutemov      2016-07-26  1885  		 * beyond i_size=
 on the filesystem.
779750d20b93bb Kirill A. Shutemov      2016-07-26  1886  		 */
779750d20b93bb Kirill A. Shutemov      2016-07-26  1887  		while (retry--) {
779750d20b93bb Kirill A. Shutemov      2016-07-26  1888  			int ret;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1889  =

779750d20b93bb Kirill A. Shutemov      2016-07-26  1890  			ret =3D shmem_u=
nused_huge_shrink(sbinfo, NULL, 1);
779750d20b93bb Kirill A. Shutemov      2016-07-26  1891  			if (ret =3D=3D =
SHRINK_STOP)
779750d20b93bb Kirill A. Shutemov      2016-07-26  1892  				break;
779750d20b93bb Kirill A. Shutemov      2016-07-26  1893  			if (ret)
779750d20b93bb Kirill A. Shutemov      2016-07-26  1894  				goto alloc_noh=
uge;
779750d20b93bb Kirill A. Shutemov      2016-07-26  1895  		}
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  1896  		goto unlock;
54af60421822bb Hugh Dickins            2011-08-03  1897  	}
ff36b801624d02 Shaohua Li              2010-08-09  1898  =

94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1899) 	if (folio_test_la=
rge(folio))
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1900  		hindex =3D round=
_down(index, HPAGE_PMD_NR);
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1901  	else
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1902  		hindex =3D index;
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1903  =

66d2f4d28cd030 Hugh Dickins            2014-07-02  1904  	if (sgp =3D=3D SG=
P_WRITE)
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1905) 		__folio_set_refe=
renced(folio);
66d2f4d28cd030 Hugh Dickins            2014-07-02  1906  =

9a44f3462edc49 Matthew Wilcox (Oracle  2022-04-29  1907) 	error =3D shmem_a=
dd_to_page_cache(folio, mapping, hindex,
3fea5a499d57de Johannes Weiner         2020-06-03  1908  					NULL, gfp & G=
FP_RECLAIM_MASK,
3fea5a499d57de Johannes Weiner         2020-06-03  1909  					charge_mm);
3fea5a499d57de Johannes Weiner         2020-06-03  1910  	if (error)
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1911  		goto unacct;
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1912) 	folio_add_lru(fol=
io);
54af60421822bb Hugh Dickins            2011-08-03  1913  =

4595ef88d13613 Kirill A. Shutemov      2016-07-26  1914  	spin_lock_irq(&in=
fo->lock);
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1915) 	info->alloced +=
=3D folio_nr_pages(folio);
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29 @1916) 	inode->i_blocks +=
=3D BLOCKS_PER_PAGE << folio_order(folio);
54af60421822bb Hugh Dickins            2011-08-03  1917  	shmem_recalc_inod=
e(inode);
4595ef88d13613 Kirill A. Shutemov      2016-07-26  1918  	spin_unlock_irq(&=
info->lock);
1635f6a74152f1 Hugh Dickins            2012-05-29  1919  	alloced =3D true;
54af60421822bb Hugh Dickins            2011-08-03  1920  =

94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1921) 	if (folio_test_la=
rge(folio) &&
779750d20b93bb Kirill A. Shutemov      2016-07-26  1922  	    DIV_ROUND_UP(=
i_size_read(inode), PAGE_SIZE) <
779750d20b93bb Kirill A. Shutemov      2016-07-26  1923  			hindex + HPAGE_=
PMD_NR - 1) {
779750d20b93bb Kirill A. Shutemov      2016-07-26  1924  		/*
779750d20b93bb Kirill A. Shutemov      2016-07-26  1925  		 * Part of the h=
uge page is beyond i_size: subject
779750d20b93bb Kirill A. Shutemov      2016-07-26  1926  		 * to shrink und=
er memory pressure.
779750d20b93bb Kirill A. Shutemov      2016-07-26  1927  		 */
779750d20b93bb Kirill A. Shutemov      2016-07-26  1928  		spin_lock(&sbinf=
o->shrinklist_lock);
d041353dc98a63 Cong Wang               2017-08-10  1929  		/*
d041353dc98a63 Cong Wang               2017-08-10  1930  		 * _careful to d=
efend against unlocked access to
d041353dc98a63 Cong Wang               2017-08-10  1931  		 * ->shrink_list=
 in shmem_unused_huge_shrink()
d041353dc98a63 Cong Wang               2017-08-10  1932  		 */
d041353dc98a63 Cong Wang               2017-08-10  1933  		if (list_empty_c=
areful(&info->shrinklist)) {
779750d20b93bb Kirill A. Shutemov      2016-07-26  1934  			list_add_tail(&=
info->shrinklist,
779750d20b93bb Kirill A. Shutemov      2016-07-26  1935  				      &sbinfo-=
>shrinklist);
779750d20b93bb Kirill A. Shutemov      2016-07-26  1936  			sbinfo->shrinkl=
ist_len++;
779750d20b93bb Kirill A. Shutemov      2016-07-26  1937  		}
779750d20b93bb Kirill A. Shutemov      2016-07-26  1938  		spin_unlock(&sbi=
nfo->shrinklist_lock);
779750d20b93bb Kirill A. Shutemov      2016-07-26  1939  	}
779750d20b93bb Kirill A. Shutemov      2016-07-26  1940  =

ec9516fbc5fa81 Hugh Dickins            2012-05-29  1941  	/*
1635f6a74152f1 Hugh Dickins            2012-05-29  1942  	 * Let SGP_FALLOC=
 use the SGP_WRITE optimization on a new page.
1635f6a74152f1 Hugh Dickins            2012-05-29  1943  	 */
1635f6a74152f1 Hugh Dickins            2012-05-29  1944  	if (sgp =3D=3D SG=
P_FALLOC)
1635f6a74152f1 Hugh Dickins            2012-05-29  1945  		sgp =3D SGP_WRIT=
E;
1635f6a74152f1 Hugh Dickins            2012-05-29  1946  clear:
1635f6a74152f1 Hugh Dickins            2012-05-29  1947  	/*
1635f6a74152f1 Hugh Dickins            2012-05-29  1948  	 * Let SGP_WRITE =
caller clear ends if write does not fill page;
1635f6a74152f1 Hugh Dickins            2012-05-29  1949  	 * but SGP_FALLOC=
 on a page fallocated earlier must initialize
1635f6a74152f1 Hugh Dickins            2012-05-29  1950  	 * it now, lest u=
ndo on failure cancel our earlier guarantee.
ec9516fbc5fa81 Hugh Dickins            2012-05-29  1951  	 */
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1952) 	if (sgp !=3D SGP_=
WRITE && !folio_test_uptodate(folio)) {
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1953) 		long i, n =3D fo=
lio_nr_pages(folio);
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1954  =

94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1955) 		for (i =3D 0; i =
< n; i++)
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1956) 			clear_highpage(=
folio_page(folio, i));
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1957) 		flush_dcache_fol=
io(folio);
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1958) 		folio_mark_uptod=
ate(folio);
ec9516fbc5fa81 Hugh Dickins            2012-05-29  1959  	}
bde05d1ccd5126 Hugh Dickins            2012-05-29  1960  =

54af60421822bb Hugh Dickins            2011-08-03  1961  	/* Perhaps the fi=
le has been truncated since we checked */
75edd345e8ede5 Hugh Dickins            2016-05-19  1962  	if (sgp <=3D SGP_=
CACHE &&
09cbfeaf1a5a67 Kirill A. Shutemov      2016-04-01  1963  	    ((loff_t)inde=
x << PAGE_SHIFT) >=3D i_size_read(inode)) {
267a4c76bbdb95 Hugh Dickins            2015-12-11  1964  		if (alloced) {
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1965) 			folio_clear_dir=
ty(folio);
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1966) 			filemap_remove_=
folio(folio);
4595ef88d13613 Kirill A. Shutemov      2016-07-26  1967  			spin_lock_irq(&=
info->lock);
267a4c76bbdb95 Hugh Dickins            2015-12-11  1968  			shmem_recalc_in=
ode(inode);
4595ef88d13613 Kirill A. Shutemov      2016-07-26  1969  			spin_unlock_irq=
(&info->lock);
267a4c76bbdb95 Hugh Dickins            2015-12-11  1970  		}
54af60421822bb Hugh Dickins            2011-08-03  1971  		error =3D -EINVA=
L;
267a4c76bbdb95 Hugh Dickins            2015-12-11  1972  		goto unlock;
e83c32e8f92724 Hugh Dickins            2011-07-25  1973  	}
63ec1973ddf3eb Matthew Wilcox (Oracle  2020-10-13  1974) out:
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1975) 	*pagep =3D folio_=
page(folio, index - hindex);
54af60421822bb Hugh Dickins            2011-08-03  1976  	return 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1977  =

59a16ead572330 Hugh Dickins            2011-05-11  1978  	/*
54af60421822bb Hugh Dickins            2011-08-03  1979  	 * Error recovery.
59a16ead572330 Hugh Dickins            2011-05-11  1980  	 */
54af60421822bb Hugh Dickins            2011-08-03  1981  unacct:
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1982) 	shmem_inode_unacc=
t_blocks(inode, folio_nr_pages(folio));
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1983  =

94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1984) 	if (folio_test_la=
rge(folio)) {
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1985) 		folio_unlock(fol=
io);
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1986) 		folio_put(folio);
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1987  		goto alloc_nohug=
e;
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1988  	}
d189922862e03c Hugh Dickins            2012-07-11  1989  unlock:
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1990) 	if (folio) {
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1991) 		folio_unlock(fol=
io);
94cdf3e8c0bfb3 Matthew Wilcox (Oracle  2022-04-29  1992) 		folio_put(folio);
54af60421822bb Hugh Dickins            2011-08-03  1993  	}
54af60421822bb Hugh Dickins            2011-08-03  1994  	if (error =3D=3D =
-ENOSPC && !once++) {
4595ef88d13613 Kirill A. Shutemov      2016-07-26  1995  		spin_lock_irq(&i=
nfo->lock);
54af60421822bb Hugh Dickins            2011-08-03  1996  		shmem_recalc_ino=
de(inode);
4595ef88d13613 Kirill A. Shutemov      2016-07-26  1997  		spin_unlock_irq(=
&info->lock);
59a16ead572330 Hugh Dickins            2011-05-11  1998  		goto repeat;
59a16ead572330 Hugh Dickins            2011-05-11  1999  	}
7f4446eefe9fbb Matthew Wilcox          2017-12-04  2000  	if (error =3D=3D =
-EEXIST)
54af60421822bb Hugh Dickins            2011-08-03  2001  		goto repeat;
54af60421822bb Hugh Dickins            2011-08-03  2002  	return error;
^1da177e4c3f41 Linus Torvalds          2005-04-16  2003  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  2004  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6063525274534519489==--

