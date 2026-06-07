Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4156D4071F5
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jun 2026 01:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780796569; cv=none; b=fxzLLYk3m0U1XeWr422FAX/m1Z4fGVjhNqAU2fBtSFmqdn1QixUIHv2Ycgpgz6+zrkHXpyoDVIUOy3lV6t1fNRkM0t+JETRkfn2fr8iA9v0+IjQNggFlBVdWmYFj7NGbdjMCYkPcyVgYRvLV+3cUuZpoFTrYdAYXK1II41li3W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780796569; c=relaxed/simple;
	bh=E39WMuWBxRddNqGA4dUrXldTlrinGs30MZ/u8uyXmYo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UHRTVlyPL5tmC/RYiLBfKkvPtUnBGDvnduDDQys8Z0ClsGq+BTkWlQT/rgiBJMZ1q4N/5U4BL/ltrIlrZtymPBYDiPPmYWqiMjLHtoQfP2TjpEw+mCUIyMsWY1xlg3Di4BgjN1BlQatgpFV08hoC+CkM+TciVx8ErUY0mHqI/p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=erUFd1H7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="erUFd1H7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780796566; x=1812332566;
  h=date:from:to:cc:subject:message-id;
  bh=E39WMuWBxRddNqGA4dUrXldTlrinGs30MZ/u8uyXmYo=;
  b=erUFd1H7qo5dPMDYXyuQ/oifqLnQdvk7T0ZZSWLyHqSDIDy72Zf/f+1J
   g7GIuVX0Xx1EbnaCMsrXwNosA/4gmcmK/pV2segguPjrxiLY2RLkLYpIM
   xQxhp7FrHTfoCROamGYNELT3qD54ZZXRglo48IPFfSaEnYduHwiIhoqOu
   c3JnLnDNw8QJQo2TazqXC5BrgZmpDRqJkEAvtDnKKHMxtzBUzlGXrkYXX
   PTIhKNueEXjyI+aqKJjoqdDv3q0SGc1jnrQknrnZnxVv+e/oUMcr/wFMR
   2bMbFgo2evDigzHMDDS3ihf2bb+/Q83wbKP1SEqjFy8tPUSpsQ1kCBxnT
   A==;
X-CSE-ConnectionGUID: GMPL9BsrTBK3hvh+YLd8dw==
X-CSE-MsgGUID: 66DuWea/RguMvnMiyurGXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="85201829"
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="85201829"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 18:42:46 -0700
X-CSE-ConnectionGUID: PjO5Gue5RHqAT3TmO16qmw==
X-CSE-MsgGUID: dYE9K7EFSsyZB4oC4jwbQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="245025854"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 06 Jun 2026 18:42:44 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wW2XB-000000002y5-3YKF;
	Sun, 07 Jun 2026 01:42:41 +0000
Date: Sun, 07 Jun 2026 03:42:20 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb:
 /soc/edp@27dc0000: failed to match any schema with compatible:
 ['rockchip,rk3576-edp']
Message-ID: <202606070336.SaHa9AJl-lkp@intel.com>
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
TO: Damon Ding <damon.ding@rock-chips.com>
CC: 0day robot <lkp@intel.com>
CC: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Damon-Ding/arm64-dts-rockchip-Add-missing-hclk-for-RK3588-eDP0/20260605-114349
head:   02ed4244ae52e493a5700e9d9048932a28186af5
commit: 02ed4244ae52e493a5700e9d9048932a28186af5 arm64: dts: rockchip: Add eDP node for RK3576
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2051-20260605 (https://download.01.org/0day-ci/archive/20260607/202606070336.SaHa9AJl-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260607/202606070336.SaHa9AJl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606070336.SaHa9AJl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
--
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
--
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
--
>> arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
--
>> arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
--
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
--
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
--
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
--
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
--
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
--
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
--
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
