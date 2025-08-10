Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1973D1E2823
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Aug 2025 07:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754811913; cv=none; b=AzeGj96dEZqHEQ7X0wBuzuwk5LRcXZ0METCeayqGvwql02pxAR5ANA6YE8pvsIbzNc9QZAgxFhvavvxZbmDIO+Y//MSB6weFuLYLemo7v+EeB09nQQV4hwZimp1zEmmXs/o5jtcOg3h46zG+aIcrA29xVJf6Ets6eU1ZCVxtCMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754811913; c=relaxed/simple;
	bh=f2vIzz0DTHmoFcyBO4RLYY0GhlFHZVzRLncdamjV+7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jJUoMXEC9okeLC7mPW7P0WTRqUmqTThZ3arSRjoCRCRBB1kcis7VsS1wGtQMEhxgx0G6gaqseCtJGXKu7YSLbwbuc4n/QAFclPfD6QH5/zq4tX9/VSkGcOtGNdvh0Gu3m3ZD9uEgd+lv/dLwKFOnyzSjJY3onM23nx5G5nLCwjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gh3g9yuo; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gh3g9yuo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754811911; x=1786347911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f2vIzz0DTHmoFcyBO4RLYY0GhlFHZVzRLncdamjV+7w=;
  b=Gh3g9yuoWuNTbHY+vIYfPY7zfut99Ft81XBvxBA28WrXDgEw0DrnmgrA
   wT1XhUEYdqxDczAsO0Ldfa3OL9OVX7afTVyvtwPcAhTVoOnXRkM2ai99C
   IUi3Hq2BwWoF74wL9jAXykcWVzOzqhIDwbrcRk4yZVwPM6qRNalxjzzEv
   x+gba3TC4LEbf7XqI99GIju/fJ3VOh5GJVt5gsjKdOskdDslKFA2hqkfO
   RN/QFoC0sc/PpnnxkraQb0Z0PKD1WsJ7zfC9gGlpUjlqbrPZu+8MEphkH
   HZlCXlHuV1/Xo5VpvwdNtA7YkMbJfnRKOn2280/IU9qIOs+vR20SUPBy3
   g==;
X-CSE-ConnectionGUID: FF0D+BnATyGEUwfOjQ5geg==
X-CSE-MsgGUID: mI3GNM+fRUOY/cSzOrZa+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="57175958"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57175958"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2025 00:45:10 -0700
X-CSE-ConnectionGUID: xvl0yEzRTt2cL/GHD3xMpA==
X-CSE-MsgGUID: NmRuPNFuRkiYsxCx5kMlGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="169862233"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 10 Aug 2025 00:45:10 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ul0jq-0005D2-2f;
	Sun, 10 Aug 2025 07:45:06 +0000
Date: Sun, 10 Aug 2025 15:44:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 38/801] arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb:
 l4_wkup@49000000 (ti,omap2-l4-wkup): '#address-cells', '#size-cells',
 'prcm@6000', 'scm@2000', 'target-module@20000' do not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202508101506.371NcBnP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 3f283d6d2fb88ef0dfb93146461a6b4430e18bbb [38/801] dt-bindings: arm: Convert omap/ti,omap2-l4 to DT schema
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250810/202508101506.371NcBnP-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250810/202508101506.371NcBnP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508101506.371NcBnP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/i2c@48072000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/i2c@48072000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/i2c@48072000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/i2c@48072000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000: failed to match any schema with compatible: ['ti,omap2-dss']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000/dispc@48050400: failed to match any schema with compatible: ['ti,omap2-dispc']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap2-rfbi']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000/encoder@48050c00: failed to match any schema with compatible: ['ti,omap2-venc']
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: l4_wkup@49000000 (ti,omap2-l4-wkup): '#address-cells', '#size-cells', 'prcm@6000', 'scm@2000', 'target-module@20000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/omap/ti,omap2-l4.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000: failed to match any schema with compatible: ['ti,omap2-prcm']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clocks/dpll_ck@500: failed to match any schema with compatible: ['ti,omap2-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clocks/apll96_ck@500: failed to match any schema with compatible: ['ti,omap2-apll-clock']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clocks/apll54_ck@500: failed to match any schema with compatible: ['ti,omap2-apll-clock']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clocks/usb_l4_gate_ick@214: failed to match any schema with compatible: ['ti,composite-interface-clock']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clocks/mdm_gate_ick@c10: failed to match any schema with compatible: ['ti,composite-interface-clock']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clockdomains/gfx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clockdomains/core_l3_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clockdomains/wkup_clkdm: failed to match any schema with compatible: ['ti,clockdomain']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
