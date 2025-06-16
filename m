Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F6F1E5B9E
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Jun 2025 06:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750056630; cv=none; b=FLpD9pg/whOy+5pTmVJ47yKPbvdAd/BGAW4PYJTEbtVh/EKq2YX03w4E0iZTEOecsgdG2KzZGWsqU1cwktBugHCPiahnaJo9TtxtehUh/rb1u4wx4i4vnjYKrRkIWcA2YpNO+e/wvKafgAY0ElH79f1YlM0PKJYvfwlHt++nsGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750056630; c=relaxed/simple;
	bh=e8vdRhXBm/1oxMMfYJd/Bdd3cEV9QaS2s8nwR9U1pAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jRxYdkompf/nSM+u+tC5d2l9/W73udC97GUp+VgYCNkcX2ervTtMAdv0U9FKZz/QQHJbzBlz1r/zY6YIqcrewoc9s7sU182Z1kUhl6uW3kwT48wMunOnEhlkqTKcHqlTiVFFlAUXTN4IGH4hZGFpTW17tneYx5WUc/cyXj4d7Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dDBi0iGv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dDBi0iGv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750056627; x=1781592627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e8vdRhXBm/1oxMMfYJd/Bdd3cEV9QaS2s8nwR9U1pAw=;
  b=dDBi0iGvUCVPl1g1aEcEh4VmYnrXutLNceDRFzsTS2aT3YlKHC9hLLvG
   4VOHWaAFBljwLPpRuaJZ4A5R7csv3u5WWutqcww1+lkPcpVK564LLKI0e
   4UkvjdNz7I21PhFnA+15ZCmYoL96pXuwGF5nLuWr9zo+8vfpuTa3ctVz5
   a0GjdOsimSLY8dLvBqIL+C9ikcEPeCbJOixZcVjjYbIOx7Em/HJsCJdVJ
   e7+bFvLqjsEbYIn2N8FP/jAx+Vxsv9Zh2fZVRZmVBBPzeNZmbsR1h/AJG
   ABIajH92AZqbCzUfhFGqOa/ajOnj2vSW6GQc5rlziNcpqS+LOVEQ/wKQb
   A==;
X-CSE-ConnectionGUID: CqO7ag5mS/WjWIV3677Lew==
X-CSE-MsgGUID: lSLKrhy/QpKJ1GwdsHGz1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63221818"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="63221818"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 23:50:27 -0700
X-CSE-ConnectionGUID: 5zWXF7KmQNudLIkn56axDg==
X-CSE-MsgGUID: tMLV58FUQz+r3hVdPXV1lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="185644047"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Jun 2025 23:50:26 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uR3fj-000Eo2-21;
	Mon, 16 Jun 2025 06:50:23 +0000
Date: Mon, 16 Jun 2025 14:49:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/cma.c:316 list_insert_sorted() error: uninitialized symbol 'mlp'.
Message-ID: <202506161413.MVt5BQ0G-lkp@intel.com>
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
head:   e04c78d86a9699d136910cfc0bdcf01087e3267e
commit: c009da4258f9885c5a3749fc004870db9c0e7a99 mm, cma: support multiple contiguous ranges, if requested
date:   3 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 months ago
config: alpha-randconfig-r072-20250616 (https://download.01.org/0day-ci/archive/20250616/202506161413.MVt5BQ0G-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506161413.MVt5BQ0G-lkp@intel.com/

smatch warnings:
mm/cma.c:316 list_insert_sorted() error: uninitialized symbol 'mlp'.

vim +/mlp +316 mm/cma.c

c009da4258f988 Frank van der Linden 2025-02-28  296  
c009da4258f988 Frank van der Linden 2025-02-28  297  /*
c009da4258f988 Frank van der Linden 2025-02-28  298   * Helper function to create sorted lists.
c009da4258f988 Frank van der Linden 2025-02-28  299   */
c009da4258f988 Frank van der Linden 2025-02-28  300  static void __init list_insert_sorted(
c009da4258f988 Frank van der Linden 2025-02-28  301  	struct list_head *ranges,
c009da4258f988 Frank van der Linden 2025-02-28  302  	struct cma_init_memrange *mrp,
c009da4258f988 Frank van der Linden 2025-02-28  303  	bool (*cmp)(struct cma_init_memrange *lh, struct cma_init_memrange *rh))
c009da4258f988 Frank van der Linden 2025-02-28  304  {
c009da4258f988 Frank van der Linden 2025-02-28  305  	struct list_head *mp;
c009da4258f988 Frank van der Linden 2025-02-28  306  	struct cma_init_memrange *mlp;
c009da4258f988 Frank van der Linden 2025-02-28  307  
c009da4258f988 Frank van der Linden 2025-02-28  308  	if (list_empty(ranges))
c009da4258f988 Frank van der Linden 2025-02-28  309  		list_add(&mrp->list, ranges);
c009da4258f988 Frank van der Linden 2025-02-28  310  	else {
c009da4258f988 Frank van der Linden 2025-02-28  311  		list_for_each(mp, ranges) {
c009da4258f988 Frank van der Linden 2025-02-28  312  			mlp = list_entry(mp, struct cma_init_memrange, list);
c009da4258f988 Frank van der Linden 2025-02-28  313  			if (cmp(mlp, mrp))
c009da4258f988 Frank van der Linden 2025-02-28  314  				break;
c009da4258f988 Frank van der Linden 2025-02-28  315  		}
c009da4258f988 Frank van der Linden 2025-02-28 @316  		__list_add(&mrp->list, mlp->list.prev, &mlp->list);
c009da4258f988 Frank van der Linden 2025-02-28  317  	}
c009da4258f988 Frank van der Linden 2025-02-28  318  }
c009da4258f988 Frank van der Linden 2025-02-28  319  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
