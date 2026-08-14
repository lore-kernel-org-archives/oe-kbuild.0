Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E72F3D45E6
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Aug 2026 15:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786720118; cv=none; b=lmAXaFRX6C+VmqHusGUgtkSLpTqhj7++Ov7G0sAJZIpzAhBbSaN8doU1+xLHwE4O3g1mwNsKKGpM9Mgnt3qoSvsj+QCltLSteV3mcKrKn2Y0Ja2R4z0KU2Sgk64TgEqJoh7R4/VSVEaxQUyBivpruRA4fYEFeVMC4tORJMN+ELA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786720118; c=relaxed/simple;
	bh=UYkkJNKWm8TRqeepoIQfamejuWYCiBIVO1nO01L/kEI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bjW093P8A8mu5G8wBZvo/+C+zxLkKQ++LKt+IgShDAFOFgJ9GcB0ktY8LnXG9y8ob5as0Y221HXV+aUdOt29FL/fOHGkPklzP5r6CYtAp17t4pftwC9n+kbAYhFmpSv3ezNNsLfs59gWy3d123d0i955aVlfVL46MhsR4nLA/9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Efeod9B1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Efeod9B1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786720115; x=1818256115;
  h=date:from:to:cc:subject:message-id;
  bh=UYkkJNKWm8TRqeepoIQfamejuWYCiBIVO1nO01L/kEI=;
  b=Efeod9B172qNABdgDj+90hUdae621Uutdc3lYvg4kgLxHczEASEuSXix
   kV+kum9czVeqAPDlGHLkjzNYrL2TgW/nzSaKEZvX7vscCbrQ+yDvR3Sxf
   Mu935NeNxPjmrB2DUvi8sl321Ikvf+OOu5zDWs9s0AZk1MbIn2h9ci3LC
   4eAe26Jy95d95GrOYihl0FrQ/hy3jB4PbwoGNuIf/MY05DgJQ9QwzMYIg
   G8kXcqpcnZ19hMynFAO2tclswLxxLGam5YuZSQ+MzaHbfue/H0miowVNZ
   VUwmQf2aKnVNSyZ9lWq2W+PDMByxcAo9s1VsiFXJ11i8O7oAhd/v4+Tw9
   w==;
X-CSE-ConnectionGUID: eQpaE7zrTYyu9xicOFSizw==
X-CSE-MsgGUID: aLEsPsKzTcekO+e5p1Pguw==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="91173531"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="91173531"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 08:08:35 -0700
X-CSE-ConnectionGUID: 0fxKobVqQB66ikAGVnS6wA==
X-CSE-MsgGUID: jyd0Md1QRuuvTNI53ew/iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="260018992"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Aug 2026 08:08:34 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wutWJ-00000000ZMM-1gWC;
	Fri, 14 Aug 2026 15:08:31 +0000
Date: Fri, 14 Aug 2026 23:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/xe/xe_amc.c:94:35: sparse: sparse: incorrect
 type in initializer (different base types)
Message-ID: <202608142314.wvaHJkN1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Heikki-Krogerus/i2c-designware-Global-register-definitions/20260812-202000, commit: 2231c0326f974d6ed4b042c754e673aa9a91726d"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: 0day robot <lkp@intel.com>
CC: Ramesh Babu B <ramesh.babu.b@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Heikki-Krogerus/i2c-designware-Global-register-definitions/20260812-202000
head:   ce9282ec4e31ed8cb9800ad06eacd6f86655a6c4
commit: 2231c0326f974d6ed4b042c754e673aa9a91726d drm/xe/i2c: Fix the interrupt handling
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: parisc-randconfig-r113-20260814 (https://download.01.org/0day-ci/archive/20260814/202608142314.wvaHJkN1-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608142314.wvaHJkN1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608142314.wvaHJkN1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_amc.c:94:35: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short [usertype] vendor @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/xe/xe_amc.c:94:35: sparse:     expected unsigned short [usertype] vendor
   drivers/gpu/drm/xe/xe_amc.c:94:35: sparse:     got restricted __be16 [usertype]

vim +94 drivers/gpu/drm/xe/xe_amc.c

2231c0326f974d Heikki Krogerus 2026-07-22  81  
2231c0326f974d Heikki Krogerus 2026-07-22  82  static const struct amc_request amc_get_alert_reason = {
2231c0326f974d Heikki Krogerus 2026-07-22  83  	.header = {
2231c0326f974d Heikki Krogerus 2026-07-22  84  		.command	= AMC_COMMAND,
2231c0326f974d Heikki Krogerus 2026-07-22  85  		.len		= sizeof(struct amc_request) - 2,
2231c0326f974d Heikki Krogerus 2026-07-22  86  		.address	= AMC_GPU_I2C_ADDR,
2231c0326f974d Heikki Krogerus 2026-07-22  87  		.version	= AMC_VERSION_V1,
2231c0326f974d Heikki Krogerus 2026-07-22  88  		.destination	= AMC_DESTINATION_ID,
2231c0326f974d Heikki Krogerus 2026-07-22  89  		.source		= AMC_SOURCE_ID,
2231c0326f974d Heikki Krogerus 2026-07-22  90  		.flags		= AMC_FLAGS,
2231c0326f974d Heikki Krogerus 2026-07-22  91  	},
2231c0326f974d Heikki Krogerus 2026-07-22  92  	.message = {
2231c0326f974d Heikki Krogerus 2026-07-22  93  		.type		= AMC_MSG_TYPE,
2231c0326f974d Heikki Krogerus 2026-07-22 @94  		.vendor		= htons(PCI_VENDOR_ID_INTEL),
2231c0326f974d Heikki Krogerus 2026-07-22  95  		.command	= AMC_GET_ALERT_REASON,
2231c0326f974d Heikki Krogerus 2026-07-22  96  	},
2231c0326f974d Heikki Krogerus 2026-07-22  97  };
2231c0326f974d Heikki Krogerus 2026-07-22  98  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
