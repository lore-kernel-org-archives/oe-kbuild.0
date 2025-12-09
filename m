Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA2E238150
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Dec 2025 07:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765265841; cv=none; b=r9OZJc3Ym0WV2tw55l7bxdRMJvuAutKBEwm+nvt1JTWCXjnkE9hNhmPppeE1U92+Cl3iiw220sXij/aTXmtluwFs47Uxo38Vz3ez44wPRvBrcss3LGd9RcoD5YzfHi6Yx7sEsxJx8irWz5SUyuQcf1lopF4HcjlALyZDnKMcfY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765265841; c=relaxed/simple;
	bh=KVIpFvUR45w/ge6qqTW8b8AsA/xSCphaBu1L1jPYtmY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ivt8/n5rCs1s5ZdpVgiVcpTPPIYUawAhf+Fa7owT5HzktETNC9eFpcyDJVhqwyBkSnM4ck9c60qJB4CI9YRnZgZRCb8bkvPepHJwNVAvB8LkjLzLKBuqmiApoHKMrns2FcSq1RXK5IOxtD3/aNnIE4KnnLy6Y+Kn4C6cyjz6B0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QW+VvXSy; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QW+VvXSy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765265839; x=1796801839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KVIpFvUR45w/ge6qqTW8b8AsA/xSCphaBu1L1jPYtmY=;
  b=QW+VvXSyh4NuDHyTJcTfvuEUQ3ZItBWt5g77OpnZkgjwmqazJHDCRdKh
   +Vlj9hJk73251+s9LueN6vTlyLOM2t5JUTRzbi4hcVwdFHJj2zDaYjooE
   EyH0SVAJmPsHednWP6YS81t4+Cq0DsHz1NTOtmvEFPq+h82tNt1Iyui6g
   V1Gz3ptfgGAUGrx4xbr6XfVpm8cg6gU4H6qzxaWTa6b7yp5Pq0N+KqSrV
   XwD9Ua+4oJxLSJ+GMbitWpo8CSaA9jMhqEjXujQS0XoMTIfslRODArmVj
   W6uGgVRD6+HXjyMkcPTiJDZL8gNy6mYnVrhdDjT0LK21o99wrB+YUAYOU
   w==;
X-CSE-ConnectionGUID: k7s5ZvI1SoSEA/SQfXwehA==
X-CSE-MsgGUID: Ey7/Wgm1SiG1BCrsn+bNhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="77833808"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="77833808"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 23:37:19 -0800
X-CSE-ConnectionGUID: AG6gx9A5Qvy3a2qNdBH6mw==
X-CSE-MsgGUID: fnYGd84xSIek1UddHggOEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="196614272"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Dec 2025 23:37:18 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSsHc-000000001Sv-0KG0;
	Tue, 09 Dec 2025 07:37:16 +0000
Date: Tue, 9 Dec 2025 15:36:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/cma.c:953 cma_release() error: uninitialized symbol 'cmr'.
Message-ID: <202512091537.OhfPyp7D-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Frank van der Linden <fvdl@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cfd4039213e7b5a828c5b78e1b5235cac91af53d
commit: c009da4258f9885c5a3749fc004870db9c0e7a99 mm, cma: support multiple contiguous ranges, if requested
date:   9 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-141-20251209 (https://download.01.org/0day-ci/archive/20251209/202512091537.OhfPyp7D-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512091537.OhfPyp7D-lkp@intel.com/

smatch warnings:
mm/cma.c:953 cma_release() error: uninitialized symbol 'cmr'.

vim +/cmr +953 mm/cma.c

9871e2ded6c1ff Mike Kravetz         2021-11-05  914  
a254129e8686bf Joonsoo Kim          2014-08-06  915  /**
a254129e8686bf Joonsoo Kim          2014-08-06  916   * cma_release() - release allocated pages
a254129e8686bf Joonsoo Kim          2014-08-06  917   * @cma:   Contiguous memory region for which the allocation is performed.
a254129e8686bf Joonsoo Kim          2014-08-06  918   * @pages: Allocated pages.
a254129e8686bf Joonsoo Kim          2014-08-06  919   * @count: Number of allocated pages.
a254129e8686bf Joonsoo Kim          2014-08-06  920   *
929f92f78068a1 Ryohei Suzuki        2019-07-16  921   * This function releases memory allocated by cma_alloc().
a254129e8686bf Joonsoo Kim          2014-08-06  922   * It returns false when provided pages do not belong to contiguous area and
a254129e8686bf Joonsoo Kim          2014-08-06  923   * true otherwise.
a254129e8686bf Joonsoo Kim          2014-08-06  924   */
78fa51503fdbe4 Minchan Kim          2021-05-04  925  bool cma_release(struct cma *cma, const struct page *pages,
78fa51503fdbe4 Minchan Kim          2021-05-04  926  		 unsigned long count)
a254129e8686bf Joonsoo Kim          2014-08-06  927  {
c009da4258f988 Frank van der Linden 2025-02-28  928  	struct cma_memrange *cmr;
c009da4258f988 Frank van der Linden 2025-02-28  929  	unsigned long pfn, end_pfn;
c009da4258f988 Frank van der Linden 2025-02-28  930  	int r;
c009da4258f988 Frank van der Linden 2025-02-28  931  
c009da4258f988 Frank van der Linden 2025-02-28  932  	pr_debug("%s(page %p, count %lu)\n", __func__, (void *)pages, count);
a254129e8686bf Joonsoo Kim          2014-08-06  933  
9871e2ded6c1ff Mike Kravetz         2021-11-05  934  	if (!cma_pages_valid(cma, pages, count))
a254129e8686bf Joonsoo Kim          2014-08-06  935  		return false;
a254129e8686bf Joonsoo Kim          2014-08-06  936  
a254129e8686bf Joonsoo Kim          2014-08-06  937  	pfn = page_to_pfn(pages);
c009da4258f988 Frank van der Linden 2025-02-28  938  	end_pfn = pfn + count;
a254129e8686bf Joonsoo Kim          2014-08-06  939  
c009da4258f988 Frank van der Linden 2025-02-28  940  	for (r = 0; r < cma->nranges; r++) {
c009da4258f988 Frank van der Linden 2025-02-28  941  		cmr = &cma->ranges[r];
c009da4258f988 Frank van der Linden 2025-02-28  942  		if (pfn >= cmr->base_pfn &&
c009da4258f988 Frank van der Linden 2025-02-28  943  		    pfn < (cmr->base_pfn + cmr->count)) {
c009da4258f988 Frank van der Linden 2025-02-28  944  			VM_BUG_ON(end_pfn > cmr->base_pfn + cmr->count);
c009da4258f988 Frank van der Linden 2025-02-28  945  			break;
c009da4258f988 Frank van der Linden 2025-02-28  946  		}
c009da4258f988 Frank van der Linden 2025-02-28  947  	}
c009da4258f988 Frank van der Linden 2025-02-28  948  
c009da4258f988 Frank van der Linden 2025-02-28  949  	if (r == cma->nranges)
c009da4258f988 Frank van der Linden 2025-02-28  950  		return false;
a254129e8686bf Joonsoo Kim          2014-08-06  951  
a254129e8686bf Joonsoo Kim          2014-08-06  952  	free_contig_range(pfn, count);
c009da4258f988 Frank van der Linden 2025-02-28 @953  	cma_clear_bitmap(cma, cmr, pfn, count);
b9ad003af13a1f Anshuman Khandual    2024-02-06  954  	cma_sysfs_account_release_pages(cma, count);
3aab8ae7aace33 Minchan Kim          2021-05-04  955  	trace_cma_release(cma->name, pfn, pages, count);
a254129e8686bf Joonsoo Kim          2014-08-06  956  
a254129e8686bf Joonsoo Kim          2014-08-06  957  	return true;
a254129e8686bf Joonsoo Kim          2014-08-06  958  }
e4231bcda72dae Laura Abbott         2017-04-18  959  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
