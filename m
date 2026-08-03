Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027DE352FA5
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Aug 2026 22:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785797213; cv=none; b=u+Q3YIA2YMWrMIpBAMVO71me2KTrSmmg8XpZUwKmw4NoHTixTLLNiVPsucyYW/mgTkQcytAq4vv7uJ3rOyr8QasU6VKDEiCwWinYnPf9W6ZyOmdLoI/xvV8oAS9MvBbBhc5Y/56Ixdh9KwmhejWCU7FwFOMZf7EMQfeSsKpARa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785797213; c=relaxed/simple;
	bh=5tbCsIkuWnh/+feW39XlsgLYnfiXgMune293hAEu2BQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FNDgSUOh69ljrc0kVGlIe+8aa9Sq3cs5G4c9mKtFzoTMLGze11zrDN1VzTkxudAtsSr9PCwQ1C89YjlXpUPfbG31XsIA8VhliChuba06veGe99YesHnlIOUV2yp7zevb33SiKWo94dmUTzkv6iM9W6e8Lb4a+CZcAbjsW1uesms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYHwhT6t; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYHwhT6t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785797210; x=1817333210;
  h=date:from:to:cc:subject:message-id;
  bh=5tbCsIkuWnh/+feW39XlsgLYnfiXgMune293hAEu2BQ=;
  b=NYHwhT6tsj6p47TygaFJuY45vLwHdNfC1IIWfc/zTwKQZpLMhBRR0is9
   REtgCCDUyphAn0PUbfVLbzGxcd3/UrLQnpiMWaKaQkVmjmH0Gikn7NM8m
   u+bSvmjdQ2g6GWfhMjVyDZgYUl/dzCwRSSO3NEdzXkGegfUS00f9CdHJV
   KcnBIo8zDn51TGk+GOEOM+06OnjtzKowiZdEYEE/L4twTyArISk8dRzPb
   h/kz5MRv238AKQlSZhVrixcrp175LmU4zna8/f+n5qZ0JD8/Obn/psXty
   J8NaasWNdIyG+alG2E3pyPOX9plJst3ANPye3aEPVThse/YkGk9x+vtoB
   w==;
X-CSE-ConnectionGUID: 7xJraGleTbuOh44Sv7tkzw==
X-CSE-MsgGUID: 96bGH5NYTW+HXWdf314NSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="111898746"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="111898746"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 15:46:49 -0700
X-CSE-ConnectionGUID: V1Bjm/tFRfqLFivKYJuI9w==
X-CSE-MsgGUID: 9vxpA592Tkau+w4WcLma8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="266463717"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Aug 2026 15:46:48 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wr1Qj-000000008BV-45Cp;
	Mon, 03 Aug 2026 22:46:45 +0000
Date: Tue, 04 Aug 2026 06:46:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member
 'fail_beneficial' not described in 'ttm_pool_alloc_iter'
Message-ID: <202608040656.nwHxvQVC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Matthew-Brost/drm-ttm-pool-Allow-backing-off-reclaim-at-the-beneficial-order/20260804-020729, commit: 666394082521ea634cd0b5d3a3d4382daaab438d"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Matthew Brost <matthew.brost@intel.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-ttm-pool-Allow-backing-off-reclaim-at-the-beneficial-order/20260804-020729
head:   b45c1612afb888ca40dc7bc945edd3a1d7155c0a
commit: 666394082521ea634cd0b5d3a3d4382daaab438d drm/ttm: Add fault injection for beneficial-order allocation failures
date:   5 hours ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260804/202608040656.nwHxvQVC-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608040656.nwHxvQVC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608040656.nwHxvQVC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member 'pool' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member 'tt' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member 'ctx' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member 'alloc' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member 'restore' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member 'beneficial_order' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member 'gfp_flags' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member 'order' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member 'page_caching' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member 'allow_pools' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member 'fail_beneficial' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member 'p' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member 'pool' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member 'tt' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member 'ctx' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member 'alloc' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member 'restore' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member 'beneficial_order' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member 'gfp_flags' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member 'order' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member 'page_caching' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member 'allow_pools' not described in 'ttm_pool_alloc_iter'
>> Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member 'fail_beneficial' not described in 'ttm_pool_alloc_iter'
   Warning: drivers/gpu/drm/ttm/ttm_pool.c:817 struct member 'p' not described in 'ttm_pool_alloc_iter'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
