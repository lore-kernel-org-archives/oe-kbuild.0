Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14395255
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Aug 2023 00:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693441826; x=1724977826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5XjWZEobY7hayRjs3odtnS/hEAOUdxmliULQPh+IDmQ=;
  b=lsoZ+v41ln6BBu6DcD+NAdRSuyT3GvKhosMYVrUvkv8GDnMI2rZwk234
   Hgj7nyyTNY6Y39cjBLPPAjEdKTa0cLmV/s2I74tnMe1eUrfrZiwuEP7Ob
   wUxhA2c/UcKxT3daNOx9rreC9M8XwUrpeANIVIe119lf3rMUx8OtVJoxZ
   7jvsg0gzVx1sU/lqu4/ZEwAvLDEsNKHcv7Sfoip0v1LGw65A4LPpOewH/
   fOEMtRVzs3TKjwVGJSg+UB0iNaM0+xNYPfh9W3mukUb829eU3lbC559o/
   EeRZSCfK5UVC+Q+bDX/+KjiO6dB054jyfHEK7N1V2Y8p9KGzGNfpOTI8u
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="365984327"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="365984327"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 17:30:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="774286722"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="774286722"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 30 Aug 2023 17:30:24 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbVZo-000APD-0d;
	Thu, 31 Aug 2023 00:30:24 +0000
Date: Thu, 31 Aug 2023 08:29:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sashal-stable:pending-5.10 47/53] mm/memory-failure.c:1926
 soft_offline_page() error: '%pG' must be followed by one of [gpv]
Message-ID: <202308310845.KU1RWOf6-lkp@intel.com>
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
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   7bc636a9c8ac76445b7aac5ad0636c27711cdd80
commit: c60183ae1a1b4adea62af23fe1f18474a2511759 [47/53] mm,hwpoison: refactor get_any_page
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20230831 (https://download.01.org/0day-ci/archive/20230831/202308310845.KU1RWOf6-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230831/202308310845.KU1RWOf6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308310845.KU1RWOf6-lkp@intel.com/

smatch warnings:
mm/memory-failure.c:1926 soft_offline_page() error: '%pG' must be followed by one of [gpv]

vim +1926 mm/memory-failure.c

acc14dc4bd484f Naoya Horiguchi 2016-01-15  1869  
86e057734bd1c4 Wanpeng Li      2013-09-11  1870  /**
86e057734bd1c4 Wanpeng Li      2013-09-11  1871   * soft_offline_page - Soft offline a page.
feec24a6139d46 Naoya Horiguchi 2019-11-30  1872   * @pfn: pfn to soft-offline
86e057734bd1c4 Wanpeng Li      2013-09-11  1873   * @flags: flags. Same as memory_failure().
86e057734bd1c4 Wanpeng Li      2013-09-11  1874   *
86e057734bd1c4 Wanpeng Li      2013-09-11  1875   * Returns 0 on success, otherwise negated errno.
86e057734bd1c4 Wanpeng Li      2013-09-11  1876   *
86e057734bd1c4 Wanpeng Li      2013-09-11  1877   * Soft offline a page, by migration or invalidation,
86e057734bd1c4 Wanpeng Li      2013-09-11  1878   * without killing anything. This is for the case when
86e057734bd1c4 Wanpeng Li      2013-09-11  1879   * a page is not corrupted yet (so it's still valid to access),
86e057734bd1c4 Wanpeng Li      2013-09-11  1880   * but has had a number of corrected errors and is better taken
86e057734bd1c4 Wanpeng Li      2013-09-11  1881   * out.
86e057734bd1c4 Wanpeng Li      2013-09-11  1882   *
86e057734bd1c4 Wanpeng Li      2013-09-11  1883   * The actual policy on when to do that is maintained by
86e057734bd1c4 Wanpeng Li      2013-09-11  1884   * user space.
86e057734bd1c4 Wanpeng Li      2013-09-11  1885   *
86e057734bd1c4 Wanpeng Li      2013-09-11  1886   * This should never impact any application or cause data loss,
86e057734bd1c4 Wanpeng Li      2013-09-11  1887   * however it might take some time.
86e057734bd1c4 Wanpeng Li      2013-09-11  1888   *
86e057734bd1c4 Wanpeng Li      2013-09-11  1889   * This is not a 100% solution for all memory, but tries to be
86e057734bd1c4 Wanpeng Li      2013-09-11  1890   * ``good enough'' for the majority of memory.
86e057734bd1c4 Wanpeng Li      2013-09-11  1891   */
feec24a6139d46 Naoya Horiguchi 2019-11-30  1892  int soft_offline_page(unsigned long pfn, int flags)
86e057734bd1c4 Wanpeng Li      2013-09-11  1893  {
86e057734bd1c4 Wanpeng Li      2013-09-11  1894  	int ret;
feec24a6139d46 Naoya Horiguchi 2019-11-30  1895  	struct page *page;
b94e02822debdf Oscar Salvador  2020-10-15  1896  	bool try_again = true;
86e057734bd1c4 Wanpeng Li      2013-09-11  1897  
feec24a6139d46 Naoya Horiguchi 2019-11-30  1898  	if (!pfn_valid(pfn))
feec24a6139d46 Naoya Horiguchi 2019-11-30  1899  		return -ENXIO;
feec24a6139d46 Naoya Horiguchi 2019-11-30  1900  	/* Only online pages can be soft-offlined (esp., not ZONE_DEVICE). */
feec24a6139d46 Naoya Horiguchi 2019-11-30  1901  	page = pfn_to_online_page(pfn);
feec24a6139d46 Naoya Horiguchi 2019-11-30  1902  	if (!page)
86a66810baa87e Dan Williams    2018-07-13  1903  		return -EIO;
86a66810baa87e Dan Williams    2018-07-13  1904  
86e057734bd1c4 Wanpeng Li      2013-09-11  1905  	if (PageHWPoison(page)) {
c60183ae1a1b4a Oscar Salvador  2020-12-14  1906  		pr_info("%s: %#lx page already poisoned\n", __func__, pfn);
1e0e635be82132 Wanpeng Li      2015-09-08  1907  		if (flags & MF_COUNT_INCREASED)
dd6e2402fad966 Oscar Salvador  2020-10-15  1908  			put_page(page);
5a2ffca3c23333 Oscar Salvador  2020-10-15  1909  		return 0;
86e057734bd1c4 Wanpeng Li      2013-09-11  1910  	}
4e41a30c6d506c Naoya Horiguchi 2016-01-15  1911  
b94e02822debdf Oscar Salvador  2020-10-15  1912  retry:
4e41a30c6d506c Naoya Horiguchi 2016-01-15  1913  	get_online_mems();
c60183ae1a1b4a Oscar Salvador  2020-12-14  1914  	ret = get_any_page(page, flags);
4e41a30c6d506c Naoya Horiguchi 2016-01-15  1915  	put_online_mems();
4e41a30c6d506c Naoya Horiguchi 2016-01-15  1916  
c60183ae1a1b4a Oscar Salvador  2020-12-14  1917  	if (ret > 0) {
6b9a217eda4a13 Oscar Salvador  2020-10-15  1918  		ret = soft_offline_in_use_page(page);
c60183ae1a1b4a Oscar Salvador  2020-12-14  1919  	} else if (ret == 0) {
b94e02822debdf Oscar Salvador  2020-10-15  1920  		if (soft_offline_free_page(page) && try_again) {
b94e02822debdf Oscar Salvador  2020-10-15  1921  			try_again = false;
1f207076740101 Liu Shixin      2021-12-24  1922  			flags &= ~MF_COUNT_INCREASED;
b94e02822debdf Oscar Salvador  2020-10-15  1923  			goto retry;
b94e02822debdf Oscar Salvador  2020-10-15  1924  		}
c60183ae1a1b4a Oscar Salvador  2020-12-14  1925  	} else if (ret == -EIO) {
c60183ae1a1b4a Oscar Salvador  2020-12-14 @1926  		pr_info("%s: %#lx: unknown page type: %lx (%pGP)\n",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
