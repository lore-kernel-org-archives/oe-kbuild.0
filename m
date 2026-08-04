Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E5823E325
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Aug 2026 00:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785803274; cv=none; b=lxtJFBRtJvTbm0vXKxyLON81FtWK6Efs5qnMPJ4C52g5uoCf7c+6VWzdQTdaKrofsMjqR6kUxdW3Y5BH/PHgGDaE2fHyvf1BmYY0e4FgP7PgKM74UBc190wC2PrASzvlKoUdL1jCuqG4kCtbWccdNWieMKhBfcxV5fBgZra74rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785803274; c=relaxed/simple;
	bh=yqg1kxtCmLEPfCt8PW64ztJLjRh2vA0mfiQG2sH1sEU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gUMoVwF2esP7Gfk12A5MGnELvJBhD+cSsHbznWuo8udj6oavshuTF+8hsGBYBL70+jzNjfK5+sCDp2n6h1gFlTjNZ/ZFFjcliWKo/RGHBNOqOo5R8RkDDhiSsKbd75b7dlnMVsKHS1nfedQqOogGuAkB4EF3BOb5QG15LVh5E6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=am9koO/m; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="am9koO/m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785803272; x=1817339272;
  h=date:from:to:cc:subject:message-id;
  bh=yqg1kxtCmLEPfCt8PW64ztJLjRh2vA0mfiQG2sH1sEU=;
  b=am9koO/miIFl7d1iFLpCv7sd1Otna4ORKsBMweMfgD686UHl7+fT/gYC
   EeRRXCQvV3WrrA3RnpKM2FUJMh8IEXbwFYcItAGPfzJJsejJrXhNCzlSh
   xrn2C1DNTqTBBroSnd3ebXS7tDvYlCC7OsxhiKtggQOXhvr7/u7twQCVR
   99/LVvrIiCWw5XR5+CakUXZzEVKf3UzgQdbZwSCNe5rLwKcc0g9Ix9+kC
   JgU4gSqb5SEPiSQ4LLW/uKXhMMUUIyidgz7DZ4sfU2VKfZLdkpS40Jwpc
   uGSa8fKpEipEo5dclQSHMAaM5B5NGoZP7lgT0njf7NN+Y5mKqO5/YOX/e
   A==;
X-CSE-ConnectionGUID: 5rYjXjw6SremroALHXc+DA==
X-CSE-MsgGUID: PHV15NMUT9aC3kYpzjGf/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86427561"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="86427561"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 17:27:52 -0700
X-CSE-ConnectionGUID: a7dIbcISTdqvMJ30UQhGSA==
X-CSE-MsgGUID: QfR12Vt/S2q/CQ74BAN+Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="265619085"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Aug 2026 17:27:51 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wr30X-000000008S9-0hby;
	Tue, 04 Aug 2026 00:27:49 +0000
Date: Tue, 04 Aug 2026 08:27:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member
 'defrag_old_tt' not described in 'ttm_pool_alloc_iter'
Message-ID: <202608040838.ozUwZeq7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Matthew-Brost/drm-ttm-pool-Allow-backing-off-reclaim-at-the-beneficial-order/20260804-020729, commit: 945370e1bf0cd767e69aa40b59f4f674251c4754"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Matthew Brost <matthew.brost@intel.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-ttm-pool-Allow-backing-off-reclaim-at-the-beneficial-order/20260804-020729
head:   b45c1612afb888ca40dc7bc945edd3a1d7155c0a
commit: 945370e1bf0cd767e69aa40b59f4f674251c4754 drm/ttm: Harvest beneficial-order pages on defragmentation moves
date:   6 hours ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260804/202608040838.ozUwZeq7-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608040838.ozUwZeq7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608040838.ozUwZeq7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'pool' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'tt' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'ctx' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'alloc' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'restore' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'defrag_old_tt' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'beneficial_order' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'gfp_flags' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'order' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'page_caching' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'allow_pools' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'fail_beneficial' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'alloc_count' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'old_cursor' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'p' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'pool' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'tt' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'ctx' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'alloc' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'restore' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'defrag_old_tt' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'beneficial_order' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'gfp_flags' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'order' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'page_caching' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'allow_pools' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'fail_beneficial' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'alloc_count' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'old_cursor' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:962 struct member 'p' not described in 'ttm_pool_alloc_iter'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
