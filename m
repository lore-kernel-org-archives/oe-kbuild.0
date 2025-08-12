Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07FD1804A
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Aug 2025 05:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754975905; cv=none; b=tfxKcqsVIPEcMZKY4bZMsIlNzTnNaUrCS82n4k20zJNaWBIjRNvnaaDCFFOX8HGsEwsZayxU5v2d2YxGVLWHD9ojJdWIkgP4kLQMAQYnY26jJKJFnf4WfmGQT+NE/cyHyBLIc+vEpoNwSQOsb1Km1feavlCHvmPuwnzbHro5Yu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754975905; c=relaxed/simple;
	bh=Fu6hDJX5cuWdMvn3bivdMPFYH2sDyhoG9zhVXFlmOCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RQuaT1/loitLb+rv2N85EcGQBStm6JV8OiYN1h3UoG7J0Cq8pGWMR44IWSXsVkHSACTWmINs5G2wX1c+3Eos2fLEwSUoZ8Ndv0YfQN5n2zaXfFqd1AM+rFoevnUUrcEb5tHQifgw52Qr4jApp/x0De9csRSjogAYCjTDkwqOhC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IGuZTMUN; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGuZTMUN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754975904; x=1786511904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fu6hDJX5cuWdMvn3bivdMPFYH2sDyhoG9zhVXFlmOCI=;
  b=IGuZTMUNhnFPuSRjD/Bv3/oGtM6w8mNoLzPL5CG1djOlgl9AEiCxs7cw
   o35GWgpwVE2UAhQSFXqaGuVlIIJEe/QjCifIlDcXMuH4iHRcHrLfTdxda
   VsI0j+jyut9BVYrDlLB+s9P3gz2fQ2z71hRv2b3tDrS/43N0m8j0BLOld
   P9fkIJtJyeBFlVB8VdYjlkgNLQEKWbdetabOS4/yKGZ2IFxQ85XeH7LU/
   L855PvLEXAM9rcMAzVbqPCwrrUoc3k2W577WeWRKwlEbXgglibWw3bxoz
   FDifMOENQgPiY/4UCOoSLWiLeHa+FpM3bZgR7O4Zn51gid0XsGt2cjlab
   w==;
X-CSE-ConnectionGUID: nd5DzsOtQFGG61vBskDLfQ==
X-CSE-MsgGUID: zwO/0j04QfCa9NwkbUQPzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56269026"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="56269026"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 22:18:23 -0700
X-CSE-ConnectionGUID: jEQT4aNkTES3Vmk1X4j+qA==
X-CSE-MsgGUID: dPGs1xqeQRm3lj/qMd6tdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="170313651"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 11 Aug 2025 22:18:23 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulhOu-0006Qm-11;
	Tue, 12 Aug 2025 05:18:20 +0000
Date: Tue, 12 Aug 2025 13:17:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 93/801] arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb:
 dpll_ck@500 (ti,omap2-dpll-core-clock): reg: [[1280], [1344]] is too short
Message-ID: <202508121333.L2kciVAS-lkp@intel.com>
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
commit: 49e69d839ca051f7cce4e3fc36dd12abf908e537 [93/801] dt-bindings: clock: Convert ti/ti,omap3-dpll-clock to DT schema
:::::: branch date: 5 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250812/202508121333.L2kciVAS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508121333.L2kciVAS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508121333.L2kciVAS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/i2c@48072000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/i2c@48072000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000: failed to match any schema with compatible: ['ti,omap2-dss']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000/dispc@48050400: failed to match any schema with compatible: ['ti,omap2-dispc']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap2-rfbi']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000/encoder@48050c00: failed to match any schema with compatible: ['ti,omap2-venc']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: l4_wkup@49000000 (ti,omap2-l4-wkup): '#address-cells', '#size-cells', 'prcm@6000', 'scm@2000', 'target-module@20000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/omap/ti,omap2-l4.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: prcm@6000 (ti,omap2-prcm): 'clock-output-names' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/omap/prcm.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: dpll_ck@500 (ti,omap2-dpll-core-clock): reg: [[1280], [1344]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,omap3-dpll-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: apll96_ck@500 (ti,omap2-apll-clock): clocks: [[17]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,dra7-apll-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: apll54_ck@500 (ti,omap2-apll-clock): clocks: [[17]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,dra7-apll-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clocks/usb_l4_gate_ick@214: failed to match any schema with compatible: ['ti,composite-interface-clock']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clocks/mdm_gate_ick@c10: failed to match any schema with compatible: ['ti,composite-interface-clock']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clockdomains/gfx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clockdomains/core_l3_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clockdomains/wkup_clkdm: failed to match any schema with compatible: ['ti,clockdomain']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
