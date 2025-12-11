Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618DB156661
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 22:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765491896; cv=none; b=L/jzHGGfTwPP8/2wwOdXwW3uJw1CBlUUpgHDpbm20iRX287nqUeezAI98W5S88zZ7Z5ePCD5R4CX9WYzFCQ9JHpT2ehYXU73PRo5xpcRRdXROZb0pbDT8ZUoFANT7zI+y/Z4pPLguuoEDc8DsO5U0WZ81F278nmGXfbbiINDxSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765491896; c=relaxed/simple;
	bh=T5JAQAMXI8GThV8ZMlBGGjDhwxmU94hBCxuOrkSGOFY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bYeXrRUBt7Jde6xVTk1U4GES35bH6EDYKp4/lih+rjV5x9NU2xiha0FwwO91IPMrAfwqjyvunrRGFqqeI1dui/H68KEeqHLd9e8IKlDFdkB2H9D9awRsHtdszIXx20XLKOvVRc+PaEqW7GEOHPaXG/MThmOCjl/umx4PhFrG/Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mOU6BGAo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mOU6BGAo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765491894; x=1797027894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T5JAQAMXI8GThV8ZMlBGGjDhwxmU94hBCxuOrkSGOFY=;
  b=mOU6BGAognvjY/Vx227ovi2GnwTRzQJ3Z7WcrWyaFug9iCGw1DdQdS38
   H16zgi9V8Z17QFGhmQRs5GXsSnHGWCP9RcC6ovfo4VwOtqUHMuwtHY/C+
   a48muc/fToenKilVDRK4in/w/x5CKsp3yH82hbBfLtqwHIT+EzyguO3c9
   Zx3kyXUz7+f8dph7G9N8LIm3UbHEg29JzcC2ykMuOnudRIKBafGtiUBpE
   hLubkqMGkMSYfQGBug9Pn7tCmr5JVxx7OQiiFgmYAaG+89VR7LbmxOQ//
   1es5ED1TBTbG8mIMwOoYFbkrATuFPBUB466apAgxJtRrtY2Mm7J/dTEMP
   A==;
X-CSE-ConnectionGUID: Yl3oLzpsRjeOFIuMrLcWuA==
X-CSE-MsgGUID: LbbPRHe8T9qdW1NKaSFdzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="85092549"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="85092549"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 14:24:54 -0800
X-CSE-ConnectionGUID: wHubV0D0RTyj+8MxO9gOLQ==
X-CSE-MsgGUID: vSYcTlIJQnKDvkT3RQHbUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196204496"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 11 Dec 2025 14:24:53 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTp5e-000000001Cy-1uj4;
	Thu, 11 Dec 2025 22:24:50 +0000
Date: Thu, 11 Dec 2025 23:24:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2270/13643]
 arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: dma@60020000
 (nvidia,tegra124-apbdma): $nodename:0: 'dma@60020000' does not match
 '^dma-controller(@.*)?$'
Message-ID: <202512112323.YTDDLa0K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5ce74bc1b7cb2732b22f9c93082545bc655d6547
commit: 7a430af7d135be5042f14987bce16f6b40a3f694 [2270/13643] dt-bindings: dma: nvidia,tegra20-apbdma: Add undocumented compatibles and "clock-names"
:::::: branch date: 21 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-2055-20251209 (https://download.01.org/0day-ci/archive/20251211/202512112323.YTDDLa0K-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4125e73cdc6188cca4c1c72b72e2b2d85c157483)
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512112323.YTDDLa0K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512112323.YTDDLa0K-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1108.15-1118.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1148.15-1158.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1187.15-1197.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra124-pcie']
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gk20a']
>> arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: dma@60020000 (nvidia,tegra124-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /i2c@7000d000/pmic@40: failed to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra124-dfll']
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /ahub@70300000: failed to match any schema with compatible: ['nvidia,tegra124-ahub']
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vdd-cpu-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
--
   arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi:29.9-32.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: / (google,nyan-big-rev7): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 2147483648, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra124-pcie']
   arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gk20a']
>> arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: dma@60020000 (nvidia,tegra124-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: /i2c@7000d000/pmic@40: failed to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra124-dfll']
   arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: /ahub@70300000: failed to match any schema with compatible: ['nvidia,tegra124-ahub']
   arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vdd-cpu-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
--
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1108.15-1118.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1148.15-1158.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1187.15-1197.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra124-venice2.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra124-pcie']
   arch/arm/boot/dts/nvidia/tegra124-venice2.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gk20a']
>> arch/arm/boot/dts/nvidia/tegra124-venice2.dtb: dma@60020000 (nvidia,tegra124-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
   arch/arm/boot/dts/nvidia/tegra124-venice2.dtb: /i2c@7000d000/pmic@40: failed to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-venice2.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra124-dfll']
   arch/arm/boot/dts/nvidia/tegra124-venice2.dtb: /ahub@70300000: failed to match any schema with compatible: ['nvidia,tegra124-ahub']
   arch/arm/boot/dts/nvidia/tegra124-venice2.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nvidia/tegra124-venice2.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
