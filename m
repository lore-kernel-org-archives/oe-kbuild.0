Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F94140DFDA
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Mar 2026 00:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774743073; cv=none; b=kXGc3rGCnsefachjlTenTKsA4zqnYL0GOYZ8Z/4oeJJV6Uw6bZNqhfx7gi/Waz0769f3yltCZiHVywB+DlzaN6CMhz0xM9fHMPbg0Hmtoji41LBuP4j7o+/1zYaqOtKXt3F9DEG/zcDqtEU9oLKZTQjS/haazeCgfynFPV0vRIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774743073; c=relaxed/simple;
	bh=vAtZ39d13Lv43J3L3hwngCiunBSySayDakmI6Zzq71Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jrau+KjQEWWcf6YgtIZB7lDls9D4w/yitCmxruOgdEG/pQLBoYFBCwE2CZ/DvCFOr9SNrMWDmT1jbsz+bwaf4tW8H5aB10ZRlImeIQBAoVOqPdNwH2kf9S7ACa/D+odTupL/lUw9AQUBy/fvGDTsdWjzIAU3q6XEnfLdnMhm8bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YWCV7qYd; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YWCV7qYd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774743072; x=1806279072;
  h=date:from:to:cc:subject:message-id;
  bh=vAtZ39d13Lv43J3L3hwngCiunBSySayDakmI6Zzq71Y=;
  b=YWCV7qYdF+BQygp0G2TQtU3+kqCB1FjENMJxa0Lg3oGIjrJKz2eO2YoN
   FQCktsqb/GqwJJsff588NeWMNNo1rI1dMN6lTPxcXYXAk8dUDeS0o5yIc
   kBd9h0j8jqNl2TnP56G78zYVCp8jDYUD3pyrCzhTSSvPUyS+oVuGINDzW
   epK8M0McxyiA1ThfMqW82wRXh0cMDCyenMSG/xKLmt30kqz+z67j+HEVy
   m2uMk566Jd4Ep/EDYPg2KdERgkzZ2oNOkdNHJ3IhZSC1IdlYrw6be77Mc
   iXRytWrxCksk5VJG0ETj4aPIWScM7ssm6CdSdOKnM9BFyXj/PI9ZiUqkG
   Q==;
X-CSE-ConnectionGUID: B5JeTIIfSpKNiXy3/NXcJA==
X-CSE-MsgGUID: t78JwVoEQ/eZIPaC4dmQjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="87250755"
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="87250755"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 17:11:11 -0700
X-CSE-ConnectionGUID: RHsJD2iSQb2AbOCz+m4oyA==
X-CSE-MsgGUID: W1F/93FPTmqWzGDMTqSFZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="224702543"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Mar 2026 17:11:09 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6dkB-00000000Bu5-0bOE;
	Sun, 29 Mar 2026 00:11:07 +0000
Date: Sun, 29 Mar 2026 08:10:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android17-6.18 7/7] mm/cma.c:927
 __cma_alloc() error: we previously assumed 'cma' could be null (see line 921)
Message-ID: <202603290833.9K8Zc8aA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   233c0add490b678592b7a7bf767018cece8826b2
commit: 5d61ead66dce096277985e4f198cd88bb43f3e68 [7/7] ANDROID: mm: Allow GFP_ATOMIC for GCMA
:::::: branch date: 8 hours ago
:::::: commit date: 31 hours ago
config: i386-randconfig-141-20260328 (https://download.01.org/0day-ci/archive/20260329/202603290833.9K8Zc8aA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603290833.9K8Zc8aA-lkp@intel.com/

smatch warnings:
mm/cma.c:927 __cma_alloc() error: we previously assumed 'cma' could be null (see line 921)
mm/cma.c:932 __cma_alloc() warn: variable dereferenced before check 'cma' (see line 927)

vim +/cma +927 mm/cma.c

c009da4258f988 Frank van der Linden 2025-02-28  913  
8a504fbd272ac3 Carlos Llamas        2025-04-21  914  struct page *__cma_alloc(struct cma *cma, unsigned long count,
c009da4258f988 Frank van der Linden 2025-02-28  915  		       unsigned int align, gfp_t gfp)
c009da4258f988 Frank van der Linden 2025-02-28  916  {
c009da4258f988 Frank van der Linden 2025-02-28  917  	struct page *page = NULL;
c009da4258f988 Frank van der Linden 2025-02-28  918  	int ret = -ENOMEM, r;
5d61ead66dce09 Vincent Donnefort    2026-03-19  919  	gfp_t gfp_allowed;
c009da4258f988 Frank van der Linden 2025-02-28  920  	unsigned long i;
c009da4258f988 Frank van der Linden 2025-02-28 @921  	const char *name = cma ? cma->name : NULL;
c009da4258f988 Frank van der Linden 2025-02-28  922  
5d61ead66dce09 Vincent Donnefort    2026-03-19  923  	/*
5d61ead66dce09 Vincent Donnefort    2026-03-19  924  	 * GCMA allows GFP_ATOMIC, while CMA can only do GFP_KERNEL.
5d61ead66dce09 Vincent Donnefort    2026-03-19  925  	 * Both support optional flags NOWARN|NORETRY
5d61ead66dce09 Vincent Donnefort    2026-03-19  926  	 */
5d61ead66dce09 Vincent Donnefort    2026-03-19 @927  	gfp_allowed = GFP_KERNEL | (cma->gcma ? GFP_ATOMIC : 0);
5d61ead66dce09 Vincent Donnefort    2026-03-19  928  	if (WARN_ON_ONCE((gfp & gfp_allowed) == 0 ||
5d61ead66dce09 Vincent Donnefort    2026-03-19  929  		(gfp & ~(gfp_allowed | __GFP_NOWARN | __GFP_NORETRY)) != 0))
e20c2e5ba70ac5 Suren Baghdasaryan   2025-05-02  930  		return page;
e20c2e5ba70ac5 Suren Baghdasaryan   2025-05-02  931  
c009da4258f988 Frank van der Linden 2025-02-28 @932  	if (!cma || !cma->count)
c009da4258f988 Frank van der Linden 2025-02-28  933  		return page;
c009da4258f988 Frank van der Linden 2025-02-28  934  
c009da4258f988 Frank van der Linden 2025-02-28  935  	pr_debug("%s(cma %p, name: %s, count %lu, align %d)\n", __func__,
c009da4258f988 Frank van der Linden 2025-02-28  936  		(void *)cma, cma->name, count, align);
c009da4258f988 Frank van der Linden 2025-02-28  937  
c009da4258f988 Frank van der Linden 2025-02-28  938  	if (!count)
c009da4258f988 Frank van der Linden 2025-02-28  939  		return page;
c009da4258f988 Frank van der Linden 2025-02-28  940  
0cd01c4a5cc140 gaoxiang17           2025-08-21  941  	trace_cma_alloc_start(name, count, cma->available_count, cma->count, align);
08e21e241210a3 Richard Chang        2025-06-05  942  
c009da4258f988 Frank van der Linden 2025-02-28  943  	for (r = 0; r < cma->nranges; r++) {
c009da4258f988 Frank van der Linden 2025-02-28  944  		page = NULL;
c009da4258f988 Frank van der Linden 2025-02-28  945  
c009da4258f988 Frank van der Linden 2025-02-28  946  		ret = cma_range_alloc(cma, &cma->ranges[r], count, align,
c009da4258f988 Frank van der Linden 2025-02-28  947  				       &page, gfp);
c009da4258f988 Frank van der Linden 2025-02-28  948  		if (ret != -EBUSY || page)
c009da4258f988 Frank van der Linden 2025-02-28  949  			break;
c009da4258f988 Frank van der Linden 2025-02-28  950  	}
a254129e8686bf Joonsoo Kim          2014-08-06  951  
2813b9c0296259 Andrey Konovalov     2018-12-28  952  	/*
2813b9c0296259 Andrey Konovalov     2018-12-28  953  	 * CMA can allocate multiple page blocks, which results in different
2813b9c0296259 Andrey Konovalov     2018-12-28  954  	 * blocks being marked with different tags. Reset the tags to ignore
2813b9c0296259 Andrey Konovalov     2018-12-28  955  	 * those page blocks.
2813b9c0296259 Andrey Konovalov     2018-12-28  956  	 */
2813b9c0296259 Andrey Konovalov     2018-12-28  957  	if (page) {
2813b9c0296259 Andrey Konovalov     2018-12-28  958  		for (i = 0; i < count; i++)
6972706f959268 David Hildenbrand    2025-09-01  959  			page_kasan_tag_reset(page + i);
2813b9c0296259 Andrey Konovalov     2018-12-28  960  	}
2813b9c0296259 Andrey Konovalov     2018-12-28  961  
463586e9ff398f Yu Zhao              2024-08-13  962  	if (ret && !(gfp & __GFP_NOWARN)) {
78fa51503fdbe4 Minchan Kim          2021-05-04  963  		pr_err_ratelimited("%s: %s: alloc failed, req-size: %lu pages, ret: %d\n",
a052d4d13d88c2 Patrick Daly         2021-02-25  964  				   __func__, cma->name, count, ret);
dbe43d4d2837da Jaewon Kim           2017-02-24  965  		cma_debug_show_areas(cma);
dbe43d4d2837da Jaewon Kim           2017-02-24  966  	}
dbe43d4d2837da Jaewon Kim           2017-02-24  967  
a254129e8686bf Joonsoo Kim          2014-08-06  968  	pr_debug("%s(): returned %p\n", __func__, page);
c009da4258f988 Frank van der Linden 2025-02-28  969  	trace_cma_alloc_finish(name, page ? page_to_pfn(page) : 0,
c009da4258f988 Frank van der Linden 2025-02-28  970  			       page, count, align, ret);
a67968bd991867 wudihui              2026-02-26  971  	trace_android_vh_cma_alloc_end(cma, page ? page_to_pfn(page) : 0, page, count, align, ret);
43ca106fa8ec7d Minchan Kim          2021-05-04  972  	if (page) {
bbb269206f3c91 Minchan Kim          2021-05-04  973  		count_vm_event(CMA_ALLOC_SUCCESS);
43ca106fa8ec7d Minchan Kim          2021-05-04  974  		cma_sysfs_account_success_pages(cma, count);
43ca106fa8ec7d Minchan Kim          2021-05-04  975  	} else {
bbb269206f3c91 Minchan Kim          2021-05-04  976  		count_vm_event(CMA_ALLOC_FAIL);
43ca106fa8ec7d Minchan Kim          2021-05-04  977  		cma_sysfs_account_fail_pages(cma, count);
43ca106fa8ec7d Minchan Kim          2021-05-04  978  	}
bbb269206f3c91 Minchan Kim          2021-05-04  979  
a254129e8686bf Joonsoo Kim          2014-08-06  980  	return page;
a254129e8686bf Joonsoo Kim          2014-08-06  981  }
5559b861a39dae Carlos Llamas        2025-04-20  982  EXPORT_SYMBOL_GPL(__cma_alloc);
3390547fec3652 Richard Chang        2023-11-29  983  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
