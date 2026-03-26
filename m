Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34641186A
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Mar 2026 01:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488880; cv=none; b=lbC8g6IuzlqlcRHAjpd9fl6Trdg+yVVgANm/45d2nobWlkNGWE/tSLN9fLh8HmMUGoSN/lXlfXPceYbEhI81fZHMhxp8K6RYXhjh7/OfuP47dc3WWzRJIc3CLaRW0Nc1CNRls82b6y6PG9x85AdRf3iTdnYRWPvMbqb3u/gbAiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488880; c=relaxed/simple;
	bh=XT8e5bps4eUEzdtVN+wLTWrujQI3yCgZkAwpwaqg3oU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A5YCeZUgL6YekygtvFfxvJuuZsAYAsRYo/CCMmqYAb0zQ7wsYPk+ZWxBYWkXfyHBZnlO/820hO+ZmIDJ3+XiWk2xtSTRgszcUKH7hyxc7nOTngzuXGkBdz7DkkkXPhjWHf+NzyL2G7Jd48Elgxcqw/FOipSUuPibnLeV+n5/ah8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JzSvabjW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JzSvabjW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774488878; x=1806024878;
  h=date:from:to:cc:subject:message-id;
  bh=XT8e5bps4eUEzdtVN+wLTWrujQI3yCgZkAwpwaqg3oU=;
  b=JzSvabjWCIbpeZwnojaVaebRfg7FqA9wv4c7RSxCGiQ3X8giSVKB4VJM
   3FsuVG6b/jZF9lWI/wNVBMxD6a6EEKCmJPRlU/4oXVCyMnX+e73mNDmAl
   1CzWrch8NAH9EfinwsePUCw6WSnXHcngWQX5zl3O9KIYaboTPV87DDJc/
   eHg2eHynPfq1xZlKOoqlYMRhRo2Q5v9ZYHT4Q2JEjt/SAm7aKKzx4scHo
   WdsQx4pR1qAFrqOhn5BGCMl1Bi95f7jLSTx4bO5g9+xzrtfymLrJIHsUa
   wYc8rTrGlteV0EKvCL9H9yAw3AJznXs4V9F3zzJxd0bG05mIY2UZbqPsF
   w==;
X-CSE-ConnectionGUID: GAWwbeUlTqOr8Y8+KDM+Cg==
X-CSE-MsgGUID: xJf2SLu7S/amUKf2ewxT9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="79444943"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="79444943"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 18:34:38 -0700
X-CSE-ConnectionGUID: a6oavygESYu4+So08MLx/g==
X-CSE-MsgGUID: fEqIVSS7S220UZF2eUA/mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="218259642"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 25 Mar 2026 18:34:37 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5ZcI-000000007Cj-4153;
	Thu, 26 Mar 2026 01:34:34 +0000
Date: Thu, 26 Mar 2026 02:34:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v7.1-armsoc/dts64 35/44]
 arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: /soc/dp@27e40000:
 failed to match any schema with compatible: ['rockchip,rk3576-dp']
Message-ID: <202603260251.J0k8yQo0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Gray Huang <gray.huang@wesion.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v7.1-armsoc/dts64
head:   6cb4ec63ba9a5831621cf951b7af55c67beeb97b
commit: 0410731663c952035eacaab03c09a1c0fe663561 [35/44] arm64: dts: rockchip: Add Khadas Edge 2L board
:::::: branch date: 2 hours ago
:::::: commit date: 27 hours ago
config: arm64-randconfig-2051-20260325 (https://download.01.org/0day-ci/archive/20260326/202603260251.J0k8yQo0-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260251.J0k8yQo0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603260251.J0k8yQo0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: /soc/dp@27e40000: failed to match any schema with compatible: ['rockchip,rk3576-dp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
