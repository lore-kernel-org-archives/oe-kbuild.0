Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462A418C2C
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 07:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771225644; cv=none; b=SIWds4Y1BMoea4BIzcPWNgWKkeV0gQmQvyWAc91sxoKFqBvJImBAFw1QElsbv0a7e1WGeb6FIhqcVBKTyARIQp5BP9OIsiaNF30ue2Gie3TSocrPDmr2Bj/iD/pjWJIm9MdNAeDZ4nBJT50ub/ExQS6cqEXOuGQGsjf8OBAXBKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771225644; c=relaxed/simple;
	bh=X8goodA65SYLX85XHYt1vVLwv75XlVGp5g6iasoAqlY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UtM9LlhKNir1Wm2L45QHq28gXdIa/D99LslR1OY6N+wjbtgB9eSEZ+8ZaFm/CxyE/L0d7O3Oumt8e9oruHQtcMHhAo2jp9CBqPACnoz3CDkKx2QG1zWckZ1jLySc7XtDb3fMvSUGk0H1hMeiqLOhnc4iI+4mzYRvaJamhjc8wGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GWrSWdlj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GWrSWdlj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771225642; x=1802761642;
  h=date:from:to:cc:subject:message-id;
  bh=X8goodA65SYLX85XHYt1vVLwv75XlVGp5g6iasoAqlY=;
  b=GWrSWdljbzhY8f3CGTtq5tImsqEK3zbK+8kvS4Ds97nhz8Tzv+y59Xgo
   m0fps4hWGEtGPB99I/Z2/XIxqh7ePrhJPZwp9rlWQp9Oo1WBQi2x7fjIS
   gMSvRRZnVUVq0XflBj4u79I7q0RkL9eviyJdImk/Ehmgnx/2woUToiwr/
   XgkQFqhozZ9GekmaUvZoySPNPlGt9/1XOcm500Lgnlw9A7nCy5xaIuRqY
   0dQyhKahRfHDw8zyv4NvTrbCWxhV34SgEKR1Tz6w4Du3cO6JliFBlB+8s
   SylWey/n+VpmhLic+mpML7Scj3v5uNmfHTRLKf7gs9luRqRX103T8KZuf
   w==;
X-CSE-ConnectionGUID: OtAv1o7XQNCK5Bn8UqaKrQ==
X-CSE-MsgGUID: csiLegRpRxOqrV2ZErRB1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="76156529"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="76156529"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 23:07:21 -0800
X-CSE-ConnectionGUID: C5pabb/RQtyG8OBGBtUYkw==
X-CSE-MsgGUID: 3PXgZxUsRaGFKduz8B4RIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="251183773"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 15 Feb 2026 23:07:20 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrshS-000000002Kr-007j;
	Mon, 16 Feb 2026 07:07:18 +0000
Date: Mon, 16 Feb 2026 08:07:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb:
 /pcie@1003000: failed to match any schema with compatible:
 ['nvidia,tegra210-pcie']
Message-ID: <202602160832.GGVpF1Th-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Aaron Kling <webgeek1234@gmail.com>
CC: Thierry Reding <treding@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
commit: ba97758a63b78f7e494ebdfb74ba8a8af702a33a arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer Kit support
date:   4 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-2051-20260215 (https://download.01.org/0day-ci/archive/20260216/202602160832.GGVpF1Th-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602160832.GGVpF1Th-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602160832.GGVpF1Th-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra210.dtsi:31.3-41: Warning (interrupt_map): /pcie@1003000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: vi@54080000 (nvidia,tegra210-vi): 'avdd-dsi-csi-supply' does not match any of the regexes: '^csi@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: dma@60020000 (nvidia,tegra210-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: pmic@3c (maxim,max77620): False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /usb-phy@7d000000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: usb-phy@7d004000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /usb-phy@7d004000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: cpu@0 (arm,cortex-a57): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: cpu@0 (arm,cortex-a57): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active', 'cpu-critical', 'cpu-hot', 'cpu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: thermal-zones: mem-thermal:cooling-maps: 'dram-active', 'dram-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
