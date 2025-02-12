Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D378425B697
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Feb 2025 17:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739382267; cv=none; b=dPJ5dIvV10WHYFXYMWKcImJnXXTg/WuwRulEunW/OlNZ0HEn88IiMrBRlN+LYlBAdp0B5VTpPYXzXTKor/ZZVRz2uvRVKB2BpzNTW+H+ehsF1Wuzo3ROCMdFd1JTh4vou8jsvSLKtDH4lWSa2UcEquW9d9WAOjlwi1UkJaq+FJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739382267; c=relaxed/simple;
	bh=wj3oSuqBgzh5hsvXf6+9OpwOkxdgiPx1hLIatf5qEYI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OqLDNL6VUVI1Xd2mqpNdZKxJIQHZWv4AN6gTfv7w7Ihhhy5IJ/WC5d+Kl2bTNMwXigNL5ks/oeNuFmNcMXdXSwdXAeFd5lNYCeieQrdi8S1JvFEv/y2+gVCc1tV9xS7igwC2oYgXX6xQDKOx+UOBW0bKd7w6uvHHh3rBKxyhwag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gAoy6+ii; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gAoy6+ii"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739382265; x=1770918265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wj3oSuqBgzh5hsvXf6+9OpwOkxdgiPx1hLIatf5qEYI=;
  b=gAoy6+iiMhSnlksa+f0H7ORp0uEmlH5+4/amlpXjGptSbsncdVXfYjtk
   3gZ+U/9Tjy6ErB66DjA5gMSciQNEoRXJlJDKG8aQ9ZSROW8Vz1nXnX9l1
   EJrsdtfwbO+BGpkTcZhLM7gnnmEimVNA4Y6qfkLa6feAJOKLVWAaf3OFE
   TE0YgdLls3QS+J/vXMCtxjKP1LD4+1l6YSckIgf8MKHq6R82I2jAoPWMP
   tTn5Hycg7z+ZC0Eccpm0BUv3PUSkC+fjQaDkw5Ts0ydDC32WSfMv4NO8O
   0yTrmEEsGc6kcgw/ND5N0h+Jy19v//3maYTQj8YZjUXYyLvupHvfrklri
   A==;
X-CSE-ConnectionGUID: zBfV6jHIQ0abmtS+p/hnCA==
X-CSE-MsgGUID: 70eJCM/OQtC4vj4LhbgrTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="50274119"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="50274119"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 09:44:24 -0800
X-CSE-ConnectionGUID: 5BcnWDGTSCyacfCx6aGeeg==
X-CSE-MsgGUID: wJBuw+XLQT6SuePLJhOizg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117520727"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Feb 2025 09:44:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiGma-0015w3-25;
	Wed, 12 Feb 2025 17:44:20 +0000
Date: Thu, 13 Feb 2025 01:43:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 190/191]
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi:65.25-102.4: Warning
 (avoid_unnecessary_addr_size): /soc/dcp@289c00000: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202502130115.SNhZDkBI-lkp@intel.com>
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
commit: 202ac1227ba0aecb3ebc19661a896d3504fc11cf [190/191] fixup! arm64: dts: apple: t602x: Add t6020 dispext device nodes
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250210 (https://download.01.org/0day-ci/archive/20250213/202502130115.SNhZDkBI-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502130115.SNhZDkBI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502130115.SNhZDkBI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:486.14-500.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:502.14-511.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:487.29-492.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:317.39-336.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:338.39-357.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:449.21-485.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@389c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:65.25-102.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@289c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:475.9-484.5: Warning (graph_child_address): /soc/dcp@389c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:486.14-500.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:502.14-511.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:487.29-492.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:317.39-336.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:338.39-357.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:449.21-485.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@389c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:65.25-102.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@289c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:475.9-484.5: Warning (graph_child_address): /soc/dcp@389c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:486.14-500.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:502.14-511.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:487.29-492.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:317.39-336.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:338.39-357.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:449.21-485.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@389c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:65.25-102.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@289c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:475.9-484.5: Warning (graph_child_address): /soc/dcp@389c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:486.14-500.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:502.14-511.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:487.29-492.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:317.39-336.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:338.39-357.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:449.21-485.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@389c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:65.25-102.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@289c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:475.9-484.5: Warning (graph_child_address): /soc/dcp@389c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:317.14-326.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:487.29-492.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:317.39-336.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:338.39-357.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:449.21-485.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@389c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:65.25-102.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@289c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:475.9-484.5: Warning (graph_child_address): /soc/dcp@389c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:741.9-750.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:92.9-101.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:244.9-253.5: Warning (graph_child_address): /soc/dcp@315c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:317.14-326.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:487.29-492.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:317.39-336.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:338.39-357.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:449.21-485.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@389c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:65.25-102.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@289c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:475.9-484.5: Warning (graph_child_address): /soc/dcp@389c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:741.9-750.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:92.9-101.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:244.9-253.5: Warning (graph_child_address): /soc/dcp@315c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +65 arch/arm64/boot/dts/apple/t602x-dieX.dtsi

87dbc354acab49 Janne Grunau 2023-08-17 @65  	DIE_NODE(dcpext0):  dcp@289c00000 {

:::::: The code at line 65 was first introduced by commit
:::::: 87dbc354acab49a5282c76dc00f084d734ce389b arm64: dts: apple: t602x: Add t6020 dispext device nodes

:::::: TO: Janne Grunau <j@jannau.net>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
