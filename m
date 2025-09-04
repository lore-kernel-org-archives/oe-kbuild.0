Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8382FDC58
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Sep 2025 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756990243; cv=none; b=VmdQZ2sKIwCZ34SMYsZFArDOEx6SIoAyROl0Q7kj/CXBnKykKX8zWaW9fBqa2Cv12MJxtp9hmQAgmccaXkATtwKjmW/4QbF15a+hbD13ubZMXWG2w8g8eZI0QSvGbF8FFVH6TagxJU8iCauZtFlw1qoBn0q+G03uJAhAxmHROkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756990243; c=relaxed/simple;
	bh=yfmb0mM+Q5X3jcBw/zaaAYAWEtDj+yT/6Q4DZPYEBmM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mtmg67glw18UizeN60vJhe2gCqsfRNm9ZDyJnjSk7O4jXKTopS6KJ4FPBi51ZJkc5d3+TwMq5a2XaCSCIDmQ92u7ZxmXIERFlWEvWlQ+pmlfuVu5es8nFz9Fn5DOAWpvAcWASzVfFn7tK9fYZkMqq1raXr2G8ElhmAdYd99dj4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lzX2welR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lzX2welR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756990241; x=1788526241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yfmb0mM+Q5X3jcBw/zaaAYAWEtDj+yT/6Q4DZPYEBmM=;
  b=lzX2welRfJMj733tZPbov22NwPhbpp0Ga/86BsFXqclgArTrcB0q9yIS
   UIRgUw6XnR9oh9rRyfqsAS7kSAPIjh6umS0PRGKWBy/8mGtG1CSnVsaol
   iJS6tHoplPU9PnBpd5k5l+fcXAqxPZRoobi0Ip8MgE6P3tvcCwlncMc8R
   XvAot5t5J8V3J1098u2gsB2DsxRXO1ZexhxTls/hX8KA3zIOMLGzmpuGq
   jeZQZB9CYy0qqtwZkC2ECzK8onzGgiQ9+TpZM32skG6xtwYY2VPrtVmIR
   QuPQB/jrbAR+30mOxftNTtsqQtf46F4R86NN/Dc3eRlzXi1GAFZOXKAma
   g==;
X-CSE-ConnectionGUID: Tjhd7zkAT2qfFmKnEuwi7g==
X-CSE-MsgGUID: B1Ioj5dhS+WkmcDevRAXIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="61960391"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="61960391"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 05:50:41 -0700
X-CSE-ConnectionGUID: qgd6BHAwS/mvck/s0HMunQ==
X-CSE-MsgGUID: sfNgBQ8KRyi4r7N9kHHg+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="202729088"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 04 Sep 2025 05:50:38 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uu9Pz-0005Ix-1j;
	Thu, 04 Sep 2025 12:50:27 +0000
Date: Thu, 4 Sep 2025 20:49:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 8/9] mm: cma: add __cma_release()
Message-ID: <202509042033.mXV6QTN8-lkp@intel.com>
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
In-Reply-To: <20250902124820.3081488-9-wangkefeng.wang@huawei.com>
References: <20250902124820.3081488-9-wangkefeng.wang@huawei.com>
TO: Kefeng Wang <wangkefeng.wang@huawei.com>

Hi Kefeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.17-rc4]
[also build test WARNING on linus/master]
[cannot apply to akpm-mm/mm-everything next-20250904]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/mm-hugetlb-convert-to-use-more-alloc_fresh_hugetlb_folio/20250902-205144
base:   v6.17-rc4
patch link:    https://lore.kernel.org/r/20250902124820.3081488-9-wangkefeng.wang%40huawei.com
patch subject: [PATCH v2 8/9] mm: cma: add __cma_release()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sparc-randconfig-r071-20250904 (https://download.01.org/0day-ci/archive/20250904/202509042033.mXV6QTN8-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509042033.mXV6QTN8-lkp@intel.com/

smatch warnings:
mm/cma.c:964 __cma_release() error: uninitialized symbol 'cmr'.

vim +/cmr +964 mm/cma.c

463586e9ff398f Yu Zhao              2024-08-13  938  
eefd4b3fc6a8c3 Kefeng Wang          2025-09-02  939  static bool __cma_release(struct cma *cma, const struct page *pages,
9871e2ded6c1ff Mike Kravetz         2021-11-05  940  			  unsigned long count)
9871e2ded6c1ff Mike Kravetz         2021-11-05  941  {
c009da4258f988 Frank van der Linden 2025-02-28  942  	unsigned long pfn, end;
c009da4258f988 Frank van der Linden 2025-02-28  943  	int r;
c009da4258f988 Frank van der Linden 2025-02-28  944  	struct cma_memrange *cmr;
eefd4b3fc6a8c3 Kefeng Wang          2025-09-02  945  
eefd4b3fc6a8c3 Kefeng Wang          2025-09-02  946  	pr_debug("%s(page %p, count %lu)\n", __func__, (void *)pages, count);
9871e2ded6c1ff Mike Kravetz         2021-11-05  947  
c009da4258f988 Frank van der Linden 2025-02-28  948  	if (!cma || !pages || count > cma->count)
9871e2ded6c1ff Mike Kravetz         2021-11-05  949  		return false;
9871e2ded6c1ff Mike Kravetz         2021-11-05  950  
9871e2ded6c1ff Mike Kravetz         2021-11-05  951  	pfn = page_to_pfn(pages);
9871e2ded6c1ff Mike Kravetz         2021-11-05  952  
c009da4258f988 Frank van der Linden 2025-02-28  953  	for (r = 0; r < cma->nranges; r++) {
c009da4258f988 Frank van der Linden 2025-02-28  954  		cmr = &cma->ranges[r];
c009da4258f988 Frank van der Linden 2025-02-28  955  		end = cmr->base_pfn + cmr->count;
eefd4b3fc6a8c3 Kefeng Wang          2025-09-02  956  		if (pfn >= cmr->base_pfn && pfn < end && pfn + count <= end)
c009da4258f988 Frank van der Linden 2025-02-28  957  			break;
c009da4258f988 Frank van der Linden 2025-02-28  958  	}
9871e2ded6c1ff Mike Kravetz         2021-11-05  959  
eefd4b3fc6a8c3 Kefeng Wang          2025-09-02  960  	if (r == cma->nranges)
eefd4b3fc6a8c3 Kefeng Wang          2025-09-02  961  		return false;
c009da4258f988 Frank van der Linden 2025-02-28  962  
eefd4b3fc6a8c3 Kefeng Wang          2025-09-02  963  	free_contig_range(pfn, count);
eefd4b3fc6a8c3 Kefeng Wang          2025-09-02 @964  	cma_clear_bitmap(cma, cmr, pfn, count);
eefd4b3fc6a8c3 Kefeng Wang          2025-09-02  965  	cma_sysfs_account_release_pages(cma, count);
eefd4b3fc6a8c3 Kefeng Wang          2025-09-02  966  	trace_cma_release(cma->name, pfn, pages, count);
eefd4b3fc6a8c3 Kefeng Wang          2025-09-02  967  
eefd4b3fc6a8c3 Kefeng Wang          2025-09-02  968  	return true;
9871e2ded6c1ff Mike Kravetz         2021-11-05  969  }
9871e2ded6c1ff Mike Kravetz         2021-11-05  970  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
