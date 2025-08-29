Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EE3283FDE
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Aug 2025 16:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756486635; cv=none; b=mQNIMrRPWFVovgnkCqDp37YLDtandF10h0t/pUFO3NsQfJjH5oH1Uu2q+ELvBteZkFiV0WyzHm2C9DA0o6rHxuJZg1G2i/fTtnHT4OXoAfj7vl0Z1iR21O4bc+NsV5C0GGwYz5PdzWjLX9CZE5Al1sK70nFM5L7Z+xegvlrDtD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756486635; c=relaxed/simple;
	bh=DPaKA+H0xBtRmkVYLURezPnXyMwVwpKfSG/SWU8dhL0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jvkUxA6D7RNlqPIR/Z24726Q7uaTGCBtVfKI4fYdYOxbnHmjJvGt8NjaxLf0PQZZgcnX90vWVlfoYs9QOpF4g3EQchyViu95fUCabQtD254YnpxHpBg8rFAOk3kGy/uqOhU4dC8fQRE3JT736d5+b2bRl798A8koQwUiXmZHVBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nnmRXHw2; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nnmRXHw2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756486634; x=1788022634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DPaKA+H0xBtRmkVYLURezPnXyMwVwpKfSG/SWU8dhL0=;
  b=nnmRXHw2Ptp60AE6eaXH2ONbEwjZ6CncuuBmgTLwu8k1pbXWtzEfBVDh
   4gV9MnmBonxDHMiagI769VXlMtePLS86/B9u+a+Jsb14Tgy8knWVfGRmz
   mfCSMvFn0szOLYkPzWBYn3wZ3hVK2J3WcPw6KWV/EXisdxaAAmuaBAFje
   mi5Ek4Cvtt0wKBbOq4KjeTy17PTtXytideT7CqdxElI2DagvFOKMPFnOR
   hL45SOJiPEi7tc1jaeIc/qqM3QPfnmG7o9AS63dXNfJ1PIHw/GREDclfN
   OQrby6TuXGMK/z1jE6jwf2Kuwl3Ch2sJtqy7g16eWTTmNlyTqXShYSWSv
   g==;
X-CSE-ConnectionGUID: aBmP8fRGSeeJCu7BHsIZOg==
X-CSE-MsgGUID: mTtezfE0RLeH3ZPOOrSmZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58877801"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="58877801"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 09:57:12 -0700
X-CSE-ConnectionGUID: A8OV5ywlTbaw9JbZLJiIEg==
X-CSE-MsgGUID: wyVacvFOSY2kVxIA1WARjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="194091731"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 29 Aug 2025 09:57:11 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1us2PR-000UnC-2o;
	Fri, 29 Aug 2025 16:57:08 +0000
Date: Sat, 30 Aug 2025 00:55:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/cma.c:953 cma_release() error: uninitialized symbol 'cmr'.
Message-ID: <202508300015.esiOX3eO-lkp@intel.com>
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
head:   07d9df80082b8d1f37e05658371b087cb6738770
commit: c009da4258f9885c5a3749fc004870db9c0e7a99 mm, cma: support multiple contiguous ranges, if requested
date:   6 months ago
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
config: i386-randconfig-141-20250829 (https://download.01.org/0day-ci/archive/20250830/202508300015.esiOX3eO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508300015.esiOX3eO-lkp@intel.com/

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
