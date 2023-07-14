Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5299C14A96
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Jul 2023 17:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689354111; x=1720890111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pkNjYWjKzWFkPwqhIvlnsPzjAGSQq5XrXRWeToHUAu0=;
  b=YSOQHGNy1iYgTYlhNid2TzEoKYfLaZ1/KGfJ7XClMQLnonXl+xiGDI+X
   +stgxJF5ByIWQVh4sMxvEOIjPcPQOXRYhuCQAinHrSErjeL4Vbqm3OGZA
   k3nxLXkU4eByP8b9g4vRXTudugeZoNEMfuipbAnOwDQlgAi4+9VuUJ6yF
   eHailht7Jm+kvRYfYCIoxeunCNOdRhmOlp0P7sUVT4U7hkt2KvzknPT01
   i7JsMJc5J1W6bIsdOX25EcD2gN2HopyrxoI+5xK4WUbRSelTvozgzCTxk
   3Ak9M9u4J/iA1zmGvGSVl75y3Mh2tk/GiXbL0y8rEluZwuzqysRjIaMKc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="431695224"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="431695224"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 10:01:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="752110461"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="752110461"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 14 Jul 2023 10:01:40 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKMAl-0007Zx-1J;
	Fri, 14 Jul 2023 17:01:39 +0000
Date: Sat, 15 Jul 2023 01:00:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2164/2369] mm/khugepaged.c:2230 collapse_file()
 warn: variable dereferenced before check 'cc' (see line 1880)
Message-ID: <202307150037.577RcA62-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Hugh Dickins <hughd@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7c2878be573282a9961c359b806ccf70afe1a6b6
commit: 251ecd321ff5f8674485301bcc33f7093bf7a560 [2164/2369] mm/khugepaged: retract_page_tables() without mmap or vma lock
:::::: branch date: 13 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001-20230713 (https://download.01.org/0day-ci/archive/20230715/202307150037.577RcA62-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307150037.577RcA62-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307150037.577RcA62-lkp@intel.com/

smatch warnings:
mm/khugepaged.c:2230 collapse_file() warn: variable dereferenced before check 'cc' (see line 1880)

vim +/cc +2230 mm/khugepaged.c

f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1835  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1836  /**
99cb0dbd47a15d Song Liu                2019-09-23  1837   * collapse_file - collapse filemap/tmpfs/shmem pages into huge one.
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1838   *
336e6b53d99ae3 Alex Shi                2020-12-14  1839   * @mm: process address space where collapse happens
34488399fa08fa Zach O'Keefe            2022-09-22  1840   * @addr: virtual collapse start address
336e6b53d99ae3 Alex Shi                2020-12-14  1841   * @file: file that collapse on
336e6b53d99ae3 Alex Shi                2020-12-14  1842   * @start: collapse start address
9710a78ab2aed0 Zach O'Keefe            2022-07-06  1843   * @cc: collapse context and scratchpad
336e6b53d99ae3 Alex Shi                2020-12-14  1844   *
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1845   * Basic scheme is simple, details are more complex:
87c460a0bded56 Hugh Dickins            2018-11-30  1846   *  - allocate and lock a new huge page;
a2e17cc2efc727 David Stevens           2023-04-04  1847   *  - scan page cache, locking old pages
99cb0dbd47a15d Song Liu                2019-09-23  1848   *    + swap/gup in pages if necessary;
a2e17cc2efc727 David Stevens           2023-04-04  1849   *  - copy data to new page
a2e17cc2efc727 David Stevens           2023-04-04  1850   *  - handle shmem holes
a2e17cc2efc727 David Stevens           2023-04-04  1851   *    + re-validate that holes weren't filled by someone else
a2e17cc2efc727 David Stevens           2023-04-04  1852   *    + check for userfaultfd
ac492b9c70cac4 David Stevens           2023-04-04  1853   *  - finalize updates to the page cache;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1854   *  - if replacing succeeds:
87c460a0bded56 Hugh Dickins            2018-11-30  1855   *    + unlock huge page;
a2e17cc2efc727 David Stevens           2023-04-04  1856   *    + free old pages;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1857   *  - if replacing failed;
a2e17cc2efc727 David Stevens           2023-04-04  1858   *    + unlock old pages
87c460a0bded56 Hugh Dickins            2018-11-30  1859   *    + unlock and free huge page;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1860   */
34488399fa08fa Zach O'Keefe            2022-09-22  1861  static int collapse_file(struct mm_struct *mm, unsigned long addr,
579c571e2efdb8 Song Liu                2019-09-23  1862  			 struct file *file, pgoff_t start,
34488399fa08fa Zach O'Keefe            2022-09-22  1863  			 struct collapse_control *cc)
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1864  {
579c571e2efdb8 Song Liu                2019-09-23  1865  	struct address_space *mapping = file->f_mapping;
50ad2f24b3b48c Zach O'Keefe            2022-07-06  1866  	struct page *hpage;
12904d953364e3 Jiaqi Yan               2023-03-29  1867  	struct page *page;
12904d953364e3 Jiaqi Yan               2023-03-29  1868  	struct page *tmp;
12904d953364e3 Jiaqi Yan               2023-03-29  1869  	struct folio *folio;
4c9473e87e75a2 Gautam Menghani         2022-10-26  1870  	pgoff_t index = 0, end = start + HPAGE_PMD_NR;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1871  	LIST_HEAD(pagelist);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1872  	XA_STATE_ORDER(xas, &mapping->i_pages, start, HPAGE_PMD_ORDER);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1873  	int nr_none = 0, result = SCAN_SUCCEED;
99cb0dbd47a15d Song Liu                2019-09-23  1874  	bool is_shmem = shmem_file(file);
4c9473e87e75a2 Gautam Menghani         2022-10-26  1875  	int nr = 0;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1876  
99cb0dbd47a15d Song Liu                2019-09-23  1877  	VM_BUG_ON(!IS_ENABLED(CONFIG_READ_ONLY_THP_FOR_FS) && !is_shmem);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1878  	VM_BUG_ON(start & (HPAGE_PMD_NR - 1));
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1879  
50ad2f24b3b48c Zach O'Keefe            2022-07-06  1880  	result = alloc_charge_hpage(&hpage, mm, cc);
9710a78ab2aed0 Zach O'Keefe            2022-07-06  1881  	if (result != SCAN_SUCCEED)
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1882  		goto out;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1883  
cae106dd67b99a David Stevens           2023-04-04  1884  	__SetPageLocked(hpage);
cae106dd67b99a David Stevens           2023-04-04  1885  	if (is_shmem)
cae106dd67b99a David Stevens           2023-04-04  1886  		__SetPageSwapBacked(hpage);
cae106dd67b99a David Stevens           2023-04-04  1887  	hpage->index = start;
cae106dd67b99a David Stevens           2023-04-04  1888  	hpage->mapping = mapping;
cae106dd67b99a David Stevens           2023-04-04  1889  
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  1890) 	/*
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  1891) 	 * Ensure we have slots for all the pages in the range.  This is
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  1892) 	 * almost certainly a no-op because most of the pages must be present
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  1893) 	 */
95feeabb77149f Hugh Dickins            2018-11-30  1894  	do {
95feeabb77149f Hugh Dickins            2018-11-30  1895  		xas_lock_irq(&xas);
95feeabb77149f Hugh Dickins            2018-11-30  1896  		xas_create_range(&xas);
95feeabb77149f Hugh Dickins            2018-11-30  1897  		if (!xas_error(&xas))
95feeabb77149f Hugh Dickins            2018-11-30  1898  			break;
95feeabb77149f Hugh Dickins            2018-11-30  1899  		xas_unlock_irq(&xas);
95feeabb77149f Hugh Dickins            2018-11-30  1900  		if (!xas_nomem(&xas, GFP_KERNEL)) {
95feeabb77149f Hugh Dickins            2018-11-30  1901  			result = SCAN_FAIL;
cae106dd67b99a David Stevens           2023-04-04  1902  			goto rollback;
95feeabb77149f Hugh Dickins            2018-11-30  1903  		}
95feeabb77149f Hugh Dickins            2018-11-30  1904  	} while (1);
95feeabb77149f Hugh Dickins            2018-11-30  1905  
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1906  	for (index = start; index < end; index++) {
e8c716bc681220 Hugh Dickins            2023-06-28  1907  		xas_set(&xas, index);
e8c716bc681220 Hugh Dickins            2023-06-28  1908  		page = xas_load(&xas);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1909  
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1910  		VM_BUG_ON(index != xas.xa_index);
99cb0dbd47a15d Song Liu                2019-09-23  1911  		if (is_shmem) {
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1912  			if (!page) {
701270fa193aad Hugh Dickins            2018-11-30  1913  				/*
99cb0dbd47a15d Song Liu                2019-09-23  1914  				 * Stop if extent has been truncated or
99cb0dbd47a15d Song Liu                2019-09-23  1915  				 * hole-punched, and is now completely
99cb0dbd47a15d Song Liu                2019-09-23  1916  				 * empty.
701270fa193aad Hugh Dickins            2018-11-30  1917  				 */
701270fa193aad Hugh Dickins            2018-11-30  1918  				if (index == start) {
701270fa193aad Hugh Dickins            2018-11-30  1919  					if (!xas_next_entry(&xas, end - 1)) {
701270fa193aad Hugh Dickins            2018-11-30  1920  						result = SCAN_TRUNCATED;
042a30824871fa Hugh Dickins            2018-11-30  1921  						goto xa_locked;
701270fa193aad Hugh Dickins            2018-11-30  1922  					}
701270fa193aad Hugh Dickins            2018-11-30  1923  				}
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1924  				if (!shmem_charge(mapping->host, 1)) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1925  					result = SCAN_FAIL;
042a30824871fa Hugh Dickins            2018-11-30  1926  					goto xa_locked;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1927  				}
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1928  				nr_none++;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1929  				continue;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1930  			}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1931  
3159f943aafdba Matthew Wilcox          2017-11-03  1932  			if (xa_is_value(page) || !PageUptodate(page)) {
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1933  				xas_unlock_irq(&xas);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1934  				/* swap in or instantiate fallocated page */
7459c149ae9ca7 Matthew Wilcox (Oracle  2022-09-02  1935) 				if (shmem_get_folio(mapping->host, index,
7459c149ae9ca7 Matthew Wilcox (Oracle  2022-09-02  1936) 						&folio, SGP_NOALLOC)) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1937  					result = SCAN_FAIL;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  1938  					goto xa_unlocked;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1939  				}
1fec6890bf2247 Matthew Wilcox (Oracle  2023-06-21  1940) 				/* drain lru cache to help isolate_lru_page() */
efa3d814fad151 David Stevens           2023-04-04  1941  				lru_add_drain();
7459c149ae9ca7 Matthew Wilcox (Oracle  2022-09-02  1942) 				page = folio_file_page(folio, index);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1943  			} else if (trylock_page(page)) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1944  				get_page(page);
042a30824871fa Hugh Dickins            2018-11-30  1945  				xas_unlock_irq(&xas);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1946  			} else {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1947  				result = SCAN_PAGE_LOCK;
042a30824871fa Hugh Dickins            2018-11-30  1948  				goto xa_locked;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1949  			}
99cb0dbd47a15d Song Liu                2019-09-23  1950  		} else {	/* !is_shmem */
99cb0dbd47a15d Song Liu                2019-09-23  1951  			if (!page || xa_is_value(page)) {
99cb0dbd47a15d Song Liu                2019-09-23  1952  				xas_unlock_irq(&xas);
99cb0dbd47a15d Song Liu                2019-09-23  1953  				page_cache_sync_readahead(mapping, &file->f_ra,
99cb0dbd47a15d Song Liu                2019-09-23  1954  							  file, index,
e5a59d308f52bb David Howells           2020-09-04  1955  							  end - index);
1fec6890bf2247 Matthew Wilcox (Oracle  2023-06-21  1956) 				/* drain lru cache to help isolate_lru_page() */
99cb0dbd47a15d Song Liu                2019-09-23  1957  				lru_add_drain();
99cb0dbd47a15d Song Liu                2019-09-23  1958  				page = find_lock_page(mapping, index);
99cb0dbd47a15d Song Liu                2019-09-23  1959  				if (unlikely(page == NULL)) {
99cb0dbd47a15d Song Liu                2019-09-23  1960  					result = SCAN_FAIL;
99cb0dbd47a15d Song Liu                2019-09-23  1961  					goto xa_unlocked;
99cb0dbd47a15d Song Liu                2019-09-23  1962  				}
75f360696ce9d8 Song Liu                2019-11-30  1963  			} else if (PageDirty(page)) {
75f360696ce9d8 Song Liu                2019-11-30  1964  				/*
75f360696ce9d8 Song Liu                2019-11-30  1965  				 * khugepaged only works on read-only fd,
75f360696ce9d8 Song Liu                2019-11-30  1966  				 * so this page is dirty because it hasn't
75f360696ce9d8 Song Liu                2019-11-30  1967  				 * been flushed since first write. There
75f360696ce9d8 Song Liu                2019-11-30  1968  				 * won't be new dirty pages.
75f360696ce9d8 Song Liu                2019-11-30  1969  				 *
75f360696ce9d8 Song Liu                2019-11-30  1970  				 * Trigger async flush here and hope the
75f360696ce9d8 Song Liu                2019-11-30  1971  				 * writeback is done when khugepaged
75f360696ce9d8 Song Liu                2019-11-30  1972  				 * revisits this page.
75f360696ce9d8 Song Liu                2019-11-30  1973  				 *
75f360696ce9d8 Song Liu                2019-11-30  1974  				 * This is a one-off situation. We are not
75f360696ce9d8 Song Liu                2019-11-30  1975  				 * forcing writeback in loop.
75f360696ce9d8 Song Liu                2019-11-30  1976  				 */
75f360696ce9d8 Song Liu                2019-11-30  1977  				xas_unlock_irq(&xas);
75f360696ce9d8 Song Liu                2019-11-30  1978  				filemap_flush(mapping);
75f360696ce9d8 Song Liu                2019-11-30  1979  				result = SCAN_FAIL;
75f360696ce9d8 Song Liu                2019-11-30  1980  				goto xa_unlocked;
74c42e1baacf20 Rongwei Wang            2021-10-28  1981  			} else if (PageWriteback(page)) {
74c42e1baacf20 Rongwei Wang            2021-10-28  1982  				xas_unlock_irq(&xas);
74c42e1baacf20 Rongwei Wang            2021-10-28  1983  				result = SCAN_FAIL;
74c42e1baacf20 Rongwei Wang            2021-10-28  1984  				goto xa_unlocked;
99cb0dbd47a15d Song Liu                2019-09-23  1985  			} else if (trylock_page(page)) {
99cb0dbd47a15d Song Liu                2019-09-23  1986  				get_page(page);
99cb0dbd47a15d Song Liu                2019-09-23  1987  				xas_unlock_irq(&xas);
99cb0dbd47a15d Song Liu                2019-09-23  1988  			} else {
99cb0dbd47a15d Song Liu                2019-09-23  1989  				result = SCAN_PAGE_LOCK;
99cb0dbd47a15d Song Liu                2019-09-23  1990  				goto xa_locked;
99cb0dbd47a15d Song Liu                2019-09-23  1991  			}
99cb0dbd47a15d Song Liu                2019-09-23  1992  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1993  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1994  		/*
b93b016313b3ba Matthew Wilcox          2018-04-10  1995  		 * The page must be locked, so we can drop the i_pages lock
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1996  		 * without racing with truncate.
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1997  		 */
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  1998  		VM_BUG_ON_PAGE(!PageLocked(page), page);
4655e5e5f38726 Song Liu                2019-11-15  1999  
4655e5e5f38726 Song Liu                2019-11-15  2000  		/* make sure the page is up to date */
4655e5e5f38726 Song Liu                2019-11-15  2001  		if (unlikely(!PageUptodate(page))) {
4655e5e5f38726 Song Liu                2019-11-15  2002  			result = SCAN_FAIL;
4655e5e5f38726 Song Liu                2019-11-15  2003  			goto out_unlock;
4655e5e5f38726 Song Liu                2019-11-15  2004  		}
06a5e1268a5fb9 Hugh Dickins            2018-11-30  2005  
06a5e1268a5fb9 Hugh Dickins            2018-11-30  2006  		/*
06a5e1268a5fb9 Hugh Dickins            2018-11-30  2007  		 * If file was truncated then extended, or hole-punched, before
06a5e1268a5fb9 Hugh Dickins            2018-11-30  2008  		 * we locked the first page, then a THP might be there already.
58ac9a8993a13e Zach O'Keefe            2022-09-22  2009  		 * This will be discovered on the first iteration.
06a5e1268a5fb9 Hugh Dickins            2018-11-30  2010  		 */
06a5e1268a5fb9 Hugh Dickins            2018-11-30  2011  		if (PageTransCompound(page)) {
58ac9a8993a13e Zach O'Keefe            2022-09-22  2012  			struct page *head = compound_head(page);
58ac9a8993a13e Zach O'Keefe            2022-09-22  2013  
58ac9a8993a13e Zach O'Keefe            2022-09-22  2014  			result = compound_order(head) == HPAGE_PMD_ORDER &&
58ac9a8993a13e Zach O'Keefe            2022-09-22  2015  					head->index == start
58ac9a8993a13e Zach O'Keefe            2022-09-22  2016  					/* Maybe PMD-mapped */
58ac9a8993a13e Zach O'Keefe            2022-09-22  2017  					? SCAN_PTE_MAPPED_HUGEPAGE
58ac9a8993a13e Zach O'Keefe            2022-09-22  2018  					: SCAN_PAGE_COMPOUND;
06a5e1268a5fb9 Hugh Dickins            2018-11-30  2019  			goto out_unlock;
06a5e1268a5fb9 Hugh Dickins            2018-11-30  2020  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2021  
64ab3195ea077e Vishal Moola (Oracle    2022-11-17  2022) 		folio = page_folio(page);
64ab3195ea077e Vishal Moola (Oracle    2022-11-17  2023) 
64ab3195ea077e Vishal Moola (Oracle    2022-11-17  2024) 		if (folio_mapping(folio) != mapping) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2025  			result = SCAN_TRUNCATED;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2026  			goto out_unlock;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2027  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2028  
64ab3195ea077e Vishal Moola (Oracle    2022-11-17  2029) 		if (!is_shmem && (folio_test_dirty(folio) ||
64ab3195ea077e Vishal Moola (Oracle    2022-11-17  2030) 				  folio_test_writeback(folio))) {
4655e5e5f38726 Song Liu                2019-11-15  2031  			/*
4655e5e5f38726 Song Liu                2019-11-15  2032  			 * khugepaged only works on read-only fd, so this
4655e5e5f38726 Song Liu                2019-11-15  2033  			 * page is dirty because it hasn't been flushed
4655e5e5f38726 Song Liu                2019-11-15  2034  			 * since first write.
4655e5e5f38726 Song Liu                2019-11-15  2035  			 */
4655e5e5f38726 Song Liu                2019-11-15  2036  			result = SCAN_FAIL;
4655e5e5f38726 Song Liu                2019-11-15  2037  			goto out_unlock;
4655e5e5f38726 Song Liu                2019-11-15  2038  		}
4655e5e5f38726 Song Liu                2019-11-15  2039  
be2d57563822b7 Baolin Wang             2023-02-15  2040  		if (!folio_isolate_lru(folio)) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2041  			result = SCAN_DEL_PAGE_LRU;
042a30824871fa Hugh Dickins            2018-11-30  2042  			goto out_unlock;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2043  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2044  
be834b2b3da7c7 David Howells           2023-06-28  2045  		if (!filemap_release_folio(folio, GFP_KERNEL)) {
99cb0dbd47a15d Song Liu                2019-09-23  2046  			result = SCAN_PAGE_HAS_PRIVATE;
64ab3195ea077e Vishal Moola (Oracle    2022-11-17  2047) 			folio_putback_lru(folio);
99cb0dbd47a15d Song Liu                2019-09-23  2048  			goto out_unlock;
99cb0dbd47a15d Song Liu                2019-09-23  2049  		}
99cb0dbd47a15d Song Liu                2019-09-23  2050  
64ab3195ea077e Vishal Moola (Oracle    2022-11-17  2051) 		if (folio_mapped(folio))
64ab3195ea077e Vishal Moola (Oracle    2022-11-17  2052) 			try_to_unmap(folio,
869f7ee6f64773 Matthew Wilcox (Oracle  2022-02-15  2053) 					TTU_IGNORE_MLOCK | TTU_BATCH_FLUSH);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2054  
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2055  		xas_lock_irq(&xas);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2056  
e8c716bc681220 Hugh Dickins            2023-06-28  2057  		VM_BUG_ON_PAGE(page != xa_load(xas.xa, index), page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2058  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2059  		/*
a2e17cc2efc727 David Stevens           2023-04-04  2060  		 * We control three references to the page:
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2061  		 *  - we hold a pin on it;
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2062  		 *  - one reference from page cache;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2063  		 *  - one from isolate_lru_page;
a2e17cc2efc727 David Stevens           2023-04-04  2064  		 * If those are the only references, then any new usage of the
a2e17cc2efc727 David Stevens           2023-04-04  2065  		 * page will have to fetch it from the page cache. That requires
a2e17cc2efc727 David Stevens           2023-04-04  2066  		 * locking the page to handle truncate, so any new usage will be
a2e17cc2efc727 David Stevens           2023-04-04  2067  		 * blocked until we unlock page after collapse/during rollback.
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2068  		 */
a2e17cc2efc727 David Stevens           2023-04-04  2069  		if (page_count(page) != 3) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2070  			result = SCAN_PAGE_COUNT;
042a30824871fa Hugh Dickins            2018-11-30  2071  			xas_unlock_irq(&xas);
042a30824871fa Hugh Dickins            2018-11-30  2072  			putback_lru_page(page);
042a30824871fa Hugh Dickins            2018-11-30  2073  			goto out_unlock;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2074  		}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2075  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2076  		/*
a2e17cc2efc727 David Stevens           2023-04-04  2077  		 * Accumulate the pages that are being collapsed.
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2078  		 */
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2079  		list_add_tail(&page->lru, &pagelist);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2080  		continue;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2081  out_unlock:
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2082  		unlock_page(page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2083  		put_page(page);
042a30824871fa Hugh Dickins            2018-11-30  2084  		goto xa_unlocked;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2085  	}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2086  
12904d953364e3 Jiaqi Yan               2023-03-29  2087  	if (!is_shmem) {
09d91cda0e8207 Song Liu                2019-09-23  2088  		filemap_nr_thps_inc(mapping);
eb6ecbed0aa273 Collin Fijalkovich      2021-06-30  2089  		/*
eb6ecbed0aa273 Collin Fijalkovich      2021-06-30  2090  		 * Paired with smp_mb() in do_dentry_open() to ensure
eb6ecbed0aa273 Collin Fijalkovich      2021-06-30  2091  		 * i_writecount is up to date and the update to nr_thps is
eb6ecbed0aa273 Collin Fijalkovich      2021-06-30  2092  		 * visible. Ensures the page cache will be truncated if the
eb6ecbed0aa273 Collin Fijalkovich      2021-06-30  2093  		 * file is opened writable.
eb6ecbed0aa273 Collin Fijalkovich      2021-06-30  2094  		 */
eb6ecbed0aa273 Collin Fijalkovich      2021-06-30  2095  		smp_mb();
eb6ecbed0aa273 Collin Fijalkovich      2021-06-30  2096  		if (inode_is_open_for_write(mapping->host)) {
eb6ecbed0aa273 Collin Fijalkovich      2021-06-30  2097  			result = SCAN_FAIL;
eb6ecbed0aa273 Collin Fijalkovich      2021-06-30  2098  			filemap_nr_thps_dec(mapping);
09d91cda0e8207 Song Liu                2019-09-23  2099  		}
042a30824871fa Hugh Dickins            2018-11-30  2100  	}
042a30824871fa Hugh Dickins            2018-11-30  2101  
042a30824871fa Hugh Dickins            2018-11-30  2102  xa_locked:
042a30824871fa Hugh Dickins            2018-11-30  2103  	xas_unlock_irq(&xas);
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2104  xa_unlocked:
042a30824871fa Hugh Dickins            2018-11-30  2105  
6d9df8a5889c56 Hugh Dickins            2022-02-14  2106  	/*
6d9df8a5889c56 Hugh Dickins            2022-02-14  2107  	 * If collapse is successful, flush must be done now before copying.
6d9df8a5889c56 Hugh Dickins            2022-02-14  2108  	 * If collapse is unsuccessful, does flush actually need to be done?
6d9df8a5889c56 Hugh Dickins            2022-02-14  2109  	 * Do it anyway, to clear the state.
6d9df8a5889c56 Hugh Dickins            2022-02-14  2110  	 */
6d9df8a5889c56 Hugh Dickins            2022-02-14  2111  	try_to_unmap_flush();
6d9df8a5889c56 Hugh Dickins            2022-02-14  2112  
cae106dd67b99a David Stevens           2023-04-04  2113  	if (result != SCAN_SUCCEED)
cae106dd67b99a David Stevens           2023-04-04  2114  		goto rollback;
cae106dd67b99a David Stevens           2023-04-04  2115  
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2116  	/*
a2e17cc2efc727 David Stevens           2023-04-04  2117  	 * The old pages are locked, so they won't change anymore.
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2118  	 */
2af8ff291848cc Hugh Dickins            2018-11-30  2119  	index = start;
12904d953364e3 Jiaqi Yan               2023-03-29  2120  	list_for_each_entry(page, &pagelist, lru) {
2af8ff291848cc Hugh Dickins            2018-11-30  2121  		while (index < page->index) {
50ad2f24b3b48c Zach O'Keefe            2022-07-06  2122  			clear_highpage(hpage + (index % HPAGE_PMD_NR));
2af8ff291848cc Hugh Dickins            2018-11-30  2123  			index++;
2af8ff291848cc Hugh Dickins            2018-11-30  2124  		}
cae106dd67b99a David Stevens           2023-04-04  2125  		if (copy_mc_highpage(hpage + (page->index % HPAGE_PMD_NR), page) > 0) {
12904d953364e3 Jiaqi Yan               2023-03-29  2126  			result = SCAN_COPY_MC;
cae106dd67b99a David Stevens           2023-04-04  2127  			goto rollback;
12904d953364e3 Jiaqi Yan               2023-03-29  2128  		}
12904d953364e3 Jiaqi Yan               2023-03-29  2129  		index++;
12904d953364e3 Jiaqi Yan               2023-03-29  2130  	}
cae106dd67b99a David Stevens           2023-04-04  2131  	while (index < end) {
12904d953364e3 Jiaqi Yan               2023-03-29  2132  		clear_highpage(hpage + (index % HPAGE_PMD_NR));
12904d953364e3 Jiaqi Yan               2023-03-29  2133  		index++;
12904d953364e3 Jiaqi Yan               2023-03-29  2134  	}
12904d953364e3 Jiaqi Yan               2023-03-29  2135  
ac492b9c70cac4 David Stevens           2023-04-04  2136  	if (nr_none) {
ac492b9c70cac4 David Stevens           2023-04-04  2137  		struct vm_area_struct *vma;
ac492b9c70cac4 David Stevens           2023-04-04  2138  		int nr_none_check = 0;
ac492b9c70cac4 David Stevens           2023-04-04  2139  
ac492b9c70cac4 David Stevens           2023-04-04  2140  		i_mmap_lock_read(mapping);
ac492b9c70cac4 David Stevens           2023-04-04  2141  		xas_lock_irq(&xas);
ac492b9c70cac4 David Stevens           2023-04-04  2142  
ac492b9c70cac4 David Stevens           2023-04-04  2143  		xas_set(&xas, start);
ac492b9c70cac4 David Stevens           2023-04-04  2144  		for (index = start; index < end; index++) {
ac492b9c70cac4 David Stevens           2023-04-04  2145  			if (!xas_next(&xas)) {
ac492b9c70cac4 David Stevens           2023-04-04  2146  				xas_store(&xas, XA_RETRY_ENTRY);
ac492b9c70cac4 David Stevens           2023-04-04  2147  				if (xas_error(&xas)) {
ac492b9c70cac4 David Stevens           2023-04-04  2148  					result = SCAN_STORE_FAILED;
ac492b9c70cac4 David Stevens           2023-04-04  2149  					goto immap_locked;
ac492b9c70cac4 David Stevens           2023-04-04  2150  				}
ac492b9c70cac4 David Stevens           2023-04-04  2151  				nr_none_check++;
ac492b9c70cac4 David Stevens           2023-04-04  2152  			}
ac492b9c70cac4 David Stevens           2023-04-04  2153  		}
ac492b9c70cac4 David Stevens           2023-04-04  2154  
ac492b9c70cac4 David Stevens           2023-04-04  2155  		if (nr_none != nr_none_check) {
ac492b9c70cac4 David Stevens           2023-04-04  2156  			result = SCAN_PAGE_FILLED;
ac492b9c70cac4 David Stevens           2023-04-04  2157  			goto immap_locked;
ac492b9c70cac4 David Stevens           2023-04-04  2158  		}
ac492b9c70cac4 David Stevens           2023-04-04  2159  
12904d953364e3 Jiaqi Yan               2023-03-29  2160  		/*
ac492b9c70cac4 David Stevens           2023-04-04  2161  		 * If userspace observed a missing page in a VMA with a MODE_MISSING
ac492b9c70cac4 David Stevens           2023-04-04  2162  		 * userfaultfd, then it might expect a UFFD_EVENT_PAGEFAULT for that
ac492b9c70cac4 David Stevens           2023-04-04  2163  		 * page. If so, we need to roll back to avoid suppressing such an
ac492b9c70cac4 David Stevens           2023-04-04  2164  		 * event. Since wp/minor userfaultfds don't give userspace any
ac492b9c70cac4 David Stevens           2023-04-04  2165  		 * guarantees that the kernel doesn't fill a missing page with a zero
ac492b9c70cac4 David Stevens           2023-04-04  2166  		 * page, so they don't matter here.
ac492b9c70cac4 David Stevens           2023-04-04  2167  		 *
ac492b9c70cac4 David Stevens           2023-04-04  2168  		 * Any userfaultfds registered after this point will not be able to
ac492b9c70cac4 David Stevens           2023-04-04  2169  		 * observe any missing pages due to the previously inserted retry
ac492b9c70cac4 David Stevens           2023-04-04  2170  		 * entries.
12904d953364e3 Jiaqi Yan               2023-03-29  2171  		 */
ac492b9c70cac4 David Stevens           2023-04-04  2172  		vma_interval_tree_foreach(vma, &mapping->i_mmap, start, end) {
ac492b9c70cac4 David Stevens           2023-04-04  2173  			if (userfaultfd_missing(vma)) {
ac492b9c70cac4 David Stevens           2023-04-04  2174  				result = SCAN_EXCEED_NONE_PTE;
ac492b9c70cac4 David Stevens           2023-04-04  2175  				goto immap_locked;
ac492b9c70cac4 David Stevens           2023-04-04  2176  			}
2af8ff291848cc Hugh Dickins            2018-11-30  2177  		}
12904d953364e3 Jiaqi Yan               2023-03-29  2178  
ac492b9c70cac4 David Stevens           2023-04-04  2179  immap_locked:
ac492b9c70cac4 David Stevens           2023-04-04  2180  		i_mmap_unlock_read(mapping);
ac492b9c70cac4 David Stevens           2023-04-04  2181  		if (result != SCAN_SUCCEED) {
ac492b9c70cac4 David Stevens           2023-04-04  2182  			xas_set(&xas, start);
ac492b9c70cac4 David Stevens           2023-04-04  2183  			for (index = start; index < end; index++) {
ac492b9c70cac4 David Stevens           2023-04-04  2184  				if (xas_next(&xas) == XA_RETRY_ENTRY)
ac492b9c70cac4 David Stevens           2023-04-04  2185  					xas_store(&xas, NULL);
ac492b9c70cac4 David Stevens           2023-04-04  2186  			}
ac492b9c70cac4 David Stevens           2023-04-04  2187  
ac492b9c70cac4 David Stevens           2023-04-04  2188  			xas_unlock_irq(&xas);
ac492b9c70cac4 David Stevens           2023-04-04  2189  			goto rollback;
ac492b9c70cac4 David Stevens           2023-04-04  2190  		}
ac492b9c70cac4 David Stevens           2023-04-04  2191  	} else {
12904d953364e3 Jiaqi Yan               2023-03-29  2192  		xas_lock_irq(&xas);
ac492b9c70cac4 David Stevens           2023-04-04  2193  	}
ac492b9c70cac4 David Stevens           2023-04-04  2194  
ac492b9c70cac4 David Stevens           2023-04-04  2195  	nr = thp_nr_pages(hpage);
12904d953364e3 Jiaqi Yan               2023-03-29  2196  	if (is_shmem)
12904d953364e3 Jiaqi Yan               2023-03-29  2197  		__mod_lruvec_page_state(hpage, NR_SHMEM_THPS, nr);
12904d953364e3 Jiaqi Yan               2023-03-29  2198  	else
12904d953364e3 Jiaqi Yan               2023-03-29  2199  		__mod_lruvec_page_state(hpage, NR_FILE_THPS, nr);
12904d953364e3 Jiaqi Yan               2023-03-29  2200  
12904d953364e3 Jiaqi Yan               2023-03-29  2201  	if (nr_none) {
12904d953364e3 Jiaqi Yan               2023-03-29  2202  		__mod_lruvec_page_state(hpage, NR_FILE_PAGES, nr_none);
12904d953364e3 Jiaqi Yan               2023-03-29  2203  		/* nr_none is always 0 for non-shmem. */
12904d953364e3 Jiaqi Yan               2023-03-29  2204  		__mod_lruvec_page_state(hpage, NR_SHMEM, nr_none);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2205  	}
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2206  
a2e17cc2efc727 David Stevens           2023-04-04  2207  	/*
a2e17cc2efc727 David Stevens           2023-04-04  2208  	 * Mark hpage as uptodate before inserting it into the page cache so
a2e17cc2efc727 David Stevens           2023-04-04  2209  	 * that it isn't mistaken for an fallocated but unwritten page.
a2e17cc2efc727 David Stevens           2023-04-04  2210  	 */
284a344ed19dc9 Vishal Moola (Oracle    2022-11-01  2211) 	folio = page_folio(hpage);
284a344ed19dc9 Vishal Moola (Oracle    2022-11-01  2212) 	folio_mark_uptodate(folio);
284a344ed19dc9 Vishal Moola (Oracle    2022-11-01  2213) 	folio_ref_add(folio, HPAGE_PMD_NR - 1);
284a344ed19dc9 Vishal Moola (Oracle    2022-11-01  2214) 
6058eaec816f29 Johannes Weiner         2020-06-03  2215  	if (is_shmem)
284a344ed19dc9 Vishal Moola (Oracle    2022-11-01  2216) 		folio_mark_dirty(folio);
284a344ed19dc9 Vishal Moola (Oracle    2022-11-01  2217) 	folio_add_lru(folio);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2218  
a2e17cc2efc727 David Stevens           2023-04-04  2219  	/* Join all the small entries into a single multi-index entry. */
a2e17cc2efc727 David Stevens           2023-04-04  2220  	xas_set_order(&xas, start, HPAGE_PMD_ORDER);
a2e17cc2efc727 David Stevens           2023-04-04  2221  	xas_store(&xas, hpage);
0175ab610c2df7 Hugh Dickins            2023-04-22  2222  	WARN_ON_ONCE(xas_error(&xas));
a2e17cc2efc727 David Stevens           2023-04-04  2223  	xas_unlock_irq(&xas);
a2e17cc2efc727 David Stevens           2023-04-04  2224  
042a30824871fa Hugh Dickins            2018-11-30  2225  	/*
042a30824871fa Hugh Dickins            2018-11-30  2226  	 * Remove pte page tables, so we can re-fault the page as huge.
251ecd321ff5f8 Hugh Dickins            2023-07-11  2227  	 * If MADV_COLLAPSE, adjust result to call collapse_pte_mapped_thp().
042a30824871fa Hugh Dickins            2018-11-30  2228  	 */
251ecd321ff5f8 Hugh Dickins            2023-07-11  2229  	retract_page_tables(mapping, start);
251ecd321ff5f8 Hugh Dickins            2023-07-11 @2230  	if (cc && !cc->is_khugepaged)
251ecd321ff5f8 Hugh Dickins            2023-07-11  2231  		result = SCAN_PTE_MAPPED_HUGEPAGE;
50ad2f24b3b48c Zach O'Keefe            2022-07-06  2232  	unlock_page(hpage);
ac492b9c70cac4 David Stevens           2023-04-04  2233  
ac492b9c70cac4 David Stevens           2023-04-04  2234  	/*
ac492b9c70cac4 David Stevens           2023-04-04  2235  	 * The collapse has succeeded, so free the old pages.
ac492b9c70cac4 David Stevens           2023-04-04  2236  	 */
ac492b9c70cac4 David Stevens           2023-04-04  2237  	list_for_each_entry_safe(page, tmp, &pagelist, lru) {
ac492b9c70cac4 David Stevens           2023-04-04  2238  		list_del(&page->lru);
ac492b9c70cac4 David Stevens           2023-04-04  2239  		page->mapping = NULL;
ac492b9c70cac4 David Stevens           2023-04-04  2240  		ClearPageActive(page);
ac492b9c70cac4 David Stevens           2023-04-04  2241  		ClearPageUnevictable(page);
ac492b9c70cac4 David Stevens           2023-04-04  2242  		unlock_page(page);
a2e17cc2efc727 David Stevens           2023-04-04  2243  		folio_put_refs(page_folio(page), 3);
ac492b9c70cac4 David Stevens           2023-04-04  2244  	}
ac492b9c70cac4 David Stevens           2023-04-04  2245  
cae106dd67b99a David Stevens           2023-04-04  2246  	goto out;
cae106dd67b99a David Stevens           2023-04-04  2247  
cae106dd67b99a David Stevens           2023-04-04  2248  rollback:
77da9389b9d5f0 Matthew Wilcox          2017-12-04  2249  	/* Something went wrong: roll back page cache changes */
2f55f070e5b80f Miaohe Lin              2022-06-25  2250  	if (nr_none) {
a2e17cc2efc727 David Stevens           2023-04-04  2251  		xas_lock_irq(&xas);
aaa52e340073b7 Hugh Dickins            2018-11-30  2252  		mapping->nrpages -= nr_none;
aaa52e340073b7 Hugh Dickins            2018-11-30  2253  		shmem_uncharge(mapping->host, nr_none);
a2e17cc2efc727 David Stevens           2023-04-04  2254  		xas_unlock_irq(&xas);
2f55f070e5b80f Miaohe Lin              2022-06-25  2255  	}
aaa52e340073b7 Hugh Dickins            2018-11-30  2256  
a2e17cc2efc727 David Stevens           2023-04-04  2257  	list_for_each_entry_safe(page, tmp, &pagelist, lru) {
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2258  		list_del(&page->lru);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2259  		unlock_page(page);
042a30824871fa Hugh Dickins            2018-11-30  2260  		putback_lru_page(page);
a2e17cc2efc727 David Stevens           2023-04-04  2261  		put_page(page);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2262  	}
12904d953364e3 Jiaqi Yan               2023-03-29  2263  	/*
12904d953364e3 Jiaqi Yan               2023-03-29  2264  	 * Undo the updates of filemap_nr_thps_inc for non-SHMEM
12904d953364e3 Jiaqi Yan               2023-03-29  2265  	 * file only. This undo is not needed unless failure is
12904d953364e3 Jiaqi Yan               2023-03-29  2266  	 * due to SCAN_COPY_MC.
12904d953364e3 Jiaqi Yan               2023-03-29  2267  	 */
12904d953364e3 Jiaqi Yan               2023-03-29  2268  	if (!is_shmem && result == SCAN_COPY_MC) {
12904d953364e3 Jiaqi Yan               2023-03-29  2269  		filemap_nr_thps_dec(mapping);
12904d953364e3 Jiaqi Yan               2023-03-29  2270  		/*
12904d953364e3 Jiaqi Yan               2023-03-29  2271  		 * Paired with smp_mb() in do_dentry_open() to
12904d953364e3 Jiaqi Yan               2023-03-29  2272  		 * ensure the update to nr_thps is visible.
12904d953364e3 Jiaqi Yan               2023-03-29  2273  		 */
12904d953364e3 Jiaqi Yan               2023-03-29  2274  		smp_mb();
12904d953364e3 Jiaqi Yan               2023-03-29  2275  	}
12904d953364e3 Jiaqi Yan               2023-03-29  2276  
50ad2f24b3b48c Zach O'Keefe            2022-07-06  2277  	hpage->mapping = NULL;
042a30824871fa Hugh Dickins            2018-11-30  2278  
50ad2f24b3b48c Zach O'Keefe            2022-07-06  2279  	unlock_page(hpage);
cae106dd67b99a David Stevens           2023-04-04  2280  	put_page(hpage);
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2281  out:
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2282  	VM_BUG_ON(!list_empty(&pagelist));
4c9473e87e75a2 Gautam Menghani         2022-10-26  2283  	trace_mm_khugepaged_collapse_file(mm, hpage, index, is_shmem, addr, file, nr, result);
50ad2f24b3b48c Zach O'Keefe            2022-07-06  2284  	return result;
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2285  }
f3f0e1d2150b2b Kirill A. Shutemov      2016-07-26  2286  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
