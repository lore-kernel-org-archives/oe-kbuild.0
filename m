Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E5F265616
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Feb 2025 19:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739303579; cv=none; b=d/wgYhniATmQ9RVz6cXrQpXBBWoMv98xNTEG7mXZTATAZ1sBXZCkkiyf4m6he5hX1e21/T1olkz1xVTC/yR1Ezp9gGm5bQt/4pctprrzxwUEy1TvFjmQVmH9DZ7UYuZjU/pWU570GrBLZRBCUjCt3DMxyvVqjrZjmJF5s+FL+aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739303579; c=relaxed/simple;
	bh=mp/VPpz1bhQVTMFEMsWtIE2jwBTiCSXDhgKQ+rhk3jI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fmoSxEpsHQyOO2QPA4WJ33EcbkK/0DH3obM9cNIo1KaIgSfG3GhYB9l9mVQA9aS1sWdtEC1J1EoI621P6g3dtemVKr5N1qFmydfLEoEfVW8MQC3kguiWXcUtVydRWH1wpJOx33mfKGN61Dr3HwMmvMv18DssSl9OL8ObtHWiT6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLD/lX5J; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLD/lX5J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739303578; x=1770839578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mp/VPpz1bhQVTMFEMsWtIE2jwBTiCSXDhgKQ+rhk3jI=;
  b=SLD/lX5JjRJXuPujlguf4D6Imz3BFVCmYBhOzXcEZpsWNJCEIOojm2aE
   /RzdBj37Tw39QeKSTA404ZvpXEo6xGATiWHZL3vf5taIfgyZe4V2Uw43T
   ilWfOdS0ERk+jTuNlcHTvtFSqsiV8tXr7lDzd0wNYJ7ep/dKz5daxhDia
   YTPwi9d9TLiAJxxHVKynjd2j3kSYdPWMBCN6UV5F3FK5Jot7NC3BLePl3
   KSzw3v06nEVtRhSeQiX+zXMyavYLiuYMR+wQX3Vg4OpMGvHEuCvvLixLc
   aghnXGyCYKb6uj/Rszz/Xl1VXr/uwsToIRrwnYRCnQL2dLwKY9G4L5IZC
   w==;
X-CSE-ConnectionGUID: n0bqnNw8RgWSvccLe9hFTg==
X-CSE-MsgGUID: +HabCYqdTzi5tdYH0G2uaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="62408406"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="62408406"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 11:52:56 -0800
X-CSE-ConnectionGUID: ocsD/jfJQ8qyRfP7F63TEg==
X-CSE-MsgGUID: FZGLqMtYRXWbvSLxouiLHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="113116826"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Feb 2025 11:52:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thwJQ-0014dH-1i;
	Tue, 11 Feb 2025 19:52:52 +0000
Date: Wed, 12 Feb 2025 03:52:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 185/191]
 arch/arm64/boot/dts/apple/t602x-die0.dtsi:449.21-485.4: Warning
 (avoid_unnecessary_addr_size): /soc/dcp@389c00000: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202502120339.Sf4ql9Az-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   058e9844046713928f5f78593e66e92da1b0c0c2
commit: 507c2ead0548a84670410f352679bd6213fc1115 [185/191] fixup! arm64: dts: apple: Add initial t602x device trees
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250210 (https://download.01.org/0day-ci/archive/20250212/202502120339.Sf4ql9Az-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120339.Sf4ql9Az-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502120339.Sf4ql9Az-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:611.22-614.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:486.14-500.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:502.14-511.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:487.29-492.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:314.39-333.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:335.39-354.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
>> arch/arm64/boot/dts/apple/t602x-die0.dtsi:449.21-485.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@389c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:475.9-484.5: Warning (graph_child_address): /soc/dcp@389c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t602x-common.dtsi:611.22-614.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:486.14-500.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:502.14-511.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:487.29-492.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:314.39-333.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:335.39-354.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
>> arch/arm64/boot/dts/apple/t602x-die0.dtsi:449.21-485.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@389c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:475.9-484.5: Warning (graph_child_address): /soc/dcp@389c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t602x-common.dtsi:611.22-614.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:486.14-500.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:502.14-511.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:487.29-492.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:314.39-333.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:335.39-354.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
>> arch/arm64/boot/dts/apple/t602x-die0.dtsi:449.21-485.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@389c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:475.9-484.5: Warning (graph_child_address): /soc/dcp@389c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t602x-common.dtsi:611.22-614.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:486.14-500.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:502.14-511.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:487.29-492.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:314.39-333.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:335.39-354.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
>> arch/arm64/boot/dts/apple/t602x-die0.dtsi:449.21-485.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@389c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:475.9-484.5: Warning (graph_child_address): /soc/dcp@389c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t602x-common.dtsi:601.28-604.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t602x-common.dtsi:606.34-609.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t602x-common.dtsi:611.22-614.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:306.14-315.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:317.14-326.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:487.29-492.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:314.39-333.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:335.39-354.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
>> arch/arm64/boot/dts/apple/t602x-die0.dtsi:449.21-485.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@389c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:475.9-484.5: Warning (graph_child_address): /soc/dcp@389c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:741.9-750.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t602x-common.dtsi:601.28-604.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t602x-common.dtsi:606.34-609.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t602x-common.dtsi:611.22-614.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:306.14-315.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:317.14-326.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:487.29-492.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:314.39-333.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:335.39-354.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
>> arch/arm64/boot/dts/apple/t602x-die0.dtsi:449.21-485.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@389c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:475.9-484.5: Warning (graph_child_address): /soc/dcp@389c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:741.9-750.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +449 arch/arm64/boot/dts/apple/t602x-die0.dtsi

56af6878f9d6c0 Hector Martin 2023-04-09 @449  	dcp: dcp@389c00000 {
56af6878f9d6c0 Hector Martin 2023-04-09  450  		compatible = "apple,t6020-dcp", "apple,dcp";
56af6878f9d6c0 Hector Martin 2023-04-09  451  		mboxes = <&dcp_mbox>;
56af6878f9d6c0 Hector Martin 2023-04-09  452  		mbox-names = "mbox";
56af6878f9d6c0 Hector Martin 2023-04-09  453  		iommus = <&dcp_dart 5>;
56af6878f9d6c0 Hector Martin 2023-04-09  454  
56af6878f9d6c0 Hector Martin 2023-04-09  455  		reg-names = "coproc", "disp-0", "disp-1", "disp-2", "disp-3";
56af6878f9d6c0 Hector Martin 2023-04-09  456  		reg = <0x3 0x89c00000 0x0 0x4000>, // check?
56af6878f9d6c0 Hector Martin 2023-04-09  457  			<0x3 0x88000000 0x0 0x61c000>,
56af6878f9d6c0 Hector Martin 2023-04-09  458  			<0x3 0x89320000 0x0 0x4000>,
56af6878f9d6c0 Hector Martin 2023-04-09  459  			<0x3 0x89344000 0x0 0x4000>,
56af6878f9d6c0 Hector Martin 2023-04-09  460  			<0x3 0x89800000 0x0 0x800000>;
56af6878f9d6c0 Hector Martin 2023-04-09  461  		apple,bw-scratch = <&pmgr_dcp 0 4 0x1208>;
56af6878f9d6c0 Hector Martin 2023-04-09  462  		power-domains = <&ps_disp0_cpu0>;
56af6878f9d6c0 Hector Martin 2023-04-09  463  		resets = <&ps_disp0_cpu0>;
56af6878f9d6c0 Hector Martin 2023-04-09  464  		clocks = <&clk_disp0>;
56af6878f9d6c0 Hector Martin 2023-04-09  465  		phandle = <&dcp>;
507c2ead0548a8 Janne Grunau  2025-02-09  466  		// required bus properties for 'piodma' subdevice
507c2ead0548a8 Janne Grunau  2025-02-09  467  		#address-cells = <2>;
507c2ead0548a8 Janne Grunau  2025-02-09  468  		#size-cells = <2>;
56af6878f9d6c0 Hector Martin 2023-04-09  469  
56af6878f9d6c0 Hector Martin 2023-04-09  470  		disp0_piodma: piodma {
56af6878f9d6c0 Hector Martin 2023-04-09  471  			iommus = <&disp0_dart 4>;
56af6878f9d6c0 Hector Martin 2023-04-09  472  			phandle = <&disp0_piodma>;
56af6878f9d6c0 Hector Martin 2023-04-09  473  		};
b29d8ebae9630c Janne Grunau  2024-01-21  474  
b29d8ebae9630c Janne Grunau  2024-01-21  475  		ports {
b29d8ebae9630c Janne Grunau  2024-01-21  476  			#address-cells = <1>;
b29d8ebae9630c Janne Grunau  2024-01-21  477  			#size-cells = <0>;
b29d8ebae9630c Janne Grunau  2024-01-21  478  			port@0 {
b29d8ebae9630c Janne Grunau  2024-01-21  479  				reg = <0>;
b29d8ebae9630c Janne Grunau  2024-01-21  480  				dcp_audio: endpoint {
b29d8ebae9630c Janne Grunau  2024-01-21  481  					remote-endpoint = <&dpaudio0_dcp>;
b29d8ebae9630c Janne Grunau  2024-01-21  482  				};
b29d8ebae9630c Janne Grunau  2024-01-21  483  			};
b29d8ebae9630c Janne Grunau  2024-01-21  484  		};
56af6878f9d6c0 Hector Martin 2023-04-09  485  	};
56af6878f9d6c0 Hector Martin 2023-04-09  486  
56af6878f9d6c0 Hector Martin 2023-04-09 @487  	display: display-subsystem {

:::::: The code at line 449 was first introduced by commit
:::::: 56af6878f9d6c007e28e182fd80fc1acc9b9bb2d arm64: dts: apple: Add initial t602x device trees

:::::: TO: Hector Martin <marcan@marcan.st>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
