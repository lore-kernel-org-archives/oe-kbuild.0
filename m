Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C00C342146
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Aug 2026 20:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785790211; cv=none; b=p+NBNkzk2GnfWA8sSqII2CjmUr8AofKYe+HUSFjv/pWeNNcB8J6kEBSdP3o0E0gvO7b+nvUsTczr/nfZMzWX6Jb5WO8Ymw2k+Y+NLMhE8rKLZdp+9jBUO12Q87UajH7k9c52B6GeKxiG3xXx+E/2wsXj7ueyqKAieFDK2dco1R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785790211; c=relaxed/simple;
	bh=m1jiAKXtC2JZjGZJ5PKyAax/7TaLxdF2ytJVqBl9mnA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BcVDMf7nJcmvghHLtHrVdm+oc57rQgAVgRwGnGRwMntQfg+dWCodty1B+W1zXMamvadGJTHabyZ3jXGssN5kNWP5KldrVRUmRxGLKSAMCDu1V8WR9Z7YqgSoy6YVsXvF2O42tdnLyhNwsEB05tT/TUdl70NmJyttZ0cfi7J4I0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QouCOvgy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QouCOvgy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785790210; x=1817326210;
  h=date:from:to:cc:subject:message-id;
  bh=m1jiAKXtC2JZjGZJ5PKyAax/7TaLxdF2ytJVqBl9mnA=;
  b=QouCOvgyHLVpmMAwg53CY5LVBn2YXjQDDlSv7GA64vCx15dXN4tkOezy
   1MZezGRKxg8HPpb+8avqnzvj8evgNrkTIlNFNQjbl4aHTX9JTgooC9CEm
   G3ghAsWUZOj7mqsCAsZr4MqJCpfcir+42x5XcgRuhw/1WAenLky1KF0gl
   yIaKb3TtgP5xpb95SCo9VxVeW9a+oAO2VYdqmU7o4RaCA8T/ZEohSQ8DY
   OixRS5k7fb5hqktiLim6HkKB9ofynDkr55UB+9+aoxSXeOddDOAXQbjx3
   evcs6taLg31VCCUPfWyIAGSUO5K76YVRyeC6JabyR4vSOiqsjPTQv5ybL
   g==;
X-CSE-ConnectionGUID: YEMiAbZLSVObnZAtdu5FAQ==
X-CSE-MsgGUID: QHv0OR6lSeWFT3DsxKuc6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="111892038"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="111892038"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 13:50:09 -0700
X-CSE-ConnectionGUID: z/Vuy1qaRzCSjwBS8old0w==
X-CSE-MsgGUID: /NygIrqySnq+hOYazEJknQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="260717369"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Aug 2026 13:50:08 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqzbp-000000007xf-3d2m;
	Mon, 03 Aug 2026 20:50:05 +0000
Date: Tue, 04 Aug 2026 04:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: drivers/gpu/drm/ttm/ttm_pool.c:815 struct member
 'pool' not described in 'ttm_pool_alloc_iter'
Message-ID: <202608040405.enP3laun-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Matthew-Brost/drm-ttm-pool-Allow-backing-off-reclaim-at-the-beneficial-order/20260804-020729, commit: f0a059037f688d6cf6a0e86dc37a55da497e4935"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Matthew Brost <matthew.brost@intel.com>
CC: 0day robot <lkp@intel.com>

Hi Matthew,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-ttm-pool-Allow-backing-off-reclaim-at-the-beneficial-order/20260804-020729
head:   b45c1612afb888ca40dc7bc945edd3a1d7155c0a
commit: f0a059037f688d6cf6a0e86dc37a55da497e4935 drm/ttm: Introduce ttm_pool_alloc_iter for __ttm_pool_alloc()
date:   3 hours ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260804/202608040405.enP3laun-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608040405.enP3laun-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608040405.enP3laun-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:815 struct member 'pool' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:815 struct member 'tt' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:815 struct member 'ctx' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:815 struct member 'alloc' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:815 struct member 'restore' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:815 struct member 'beneficial_order' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:815 struct member 'gfp_flags' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:815 struct member 'order' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:815 struct member 'page_caching' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:815 struct member 'allow_pools' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:815 struct member 'p' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:815 struct member 'pool' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:815 struct member 'tt' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:815 struct member 'ctx' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:815 struct member 'alloc' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:815 struct member 'restore' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:815 struct member 'beneficial_order' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:815 struct member 'gfp_flags' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:815 struct member 'order' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:815 struct member 'page_caching' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:815 struct member 'allow_pools' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:815 struct member 'p' not described in 'ttm_pool_alloc_iter'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
