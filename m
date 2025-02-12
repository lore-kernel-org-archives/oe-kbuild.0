Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D561D63C0
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Feb 2025 09:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739351313; cv=none; b=QNB+eDbqnh6TLMxtctwY277MqTNxIH7+a45bUM1oW6L73zRgmJG3SnDP1kUu0wCMtAC/jmykGBfIhLXI8eBi5rfhHj6lOFtOsYkWQgms/QHbvkc/CbxpmZWKpqGXi2oONVTcO+2tBdqNfIgowFvs46bjVxs/jx0+5884Nh/Xc6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739351313; c=relaxed/simple;
	bh=FLiDrq6IRrVOY88NbKo/o1+1gBJyHyr1IAmXdutiVvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j9EgAaemAyP74Qh9rXTlGLUrIMy8BqMqfYG0cNWcszXfOrq6B1LV7h2leOiv9JB9X7LROtLwam2k/NOYCr3m9ab4n95r4jdH64ZrhGELJ4V52myR5aXrWLKsgRhudygvWEVpwIebekMJG0rbNjFzpDSSsZoIYgI3OIzqUANmHDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P73Ogicd; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P73Ogicd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739351312; x=1770887312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FLiDrq6IRrVOY88NbKo/o1+1gBJyHyr1IAmXdutiVvU=;
  b=P73OgicdojyucZElgcvs/ly2pu3KXnwhmjN6Gp6tmaeL/7Xt0aBFx2KP
   KErjsdz9hYap0YzcTZBJb6KwLFkd1cA7if6rCpEoGDmRjxO051GHZXRkn
   dzWf0XBc707mqxEz+0CNbryV1OITNu9ZSXBEXtjWInPzEpKh/dEVqZk3U
   T5WX9I+4PUHKfMXoAOLBLiJkziwFD0F8LHZxMLCgYt2CGpovnwl2kzBgP
   SXxBkuthVZWptNxRV5ERF304ivsKVM2lhW2nf5ekuVAAYDVX/npLv+aSG
   2t942JLDrxdlfIgOjPnMNf6nbOzld2YTbmIShANSL0Qz4EkcjHakcHAxr
   Q==;
X-CSE-ConnectionGUID: xa3HJMhRRhGmWWALtBIq9g==
X-CSE-MsgGUID: wTnDMxt/TkKIdmJF3vlK5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50218459"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="50218459"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 01:08:31 -0800
X-CSE-ConnectionGUID: 1ydN88yOSYKQS8TQh6cuAA==
X-CSE-MsgGUID: +GVzI/s6TNyufLvpfRAuOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112617690"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Feb 2025 01:08:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti8jL-0015Pn-1f;
	Wed, 12 Feb 2025 09:08:27 +0000
Date: Wed, 12 Feb 2025 17:07:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 188/191]
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi:142.25-179.4: Warning
 (avoid_unnecessary_addr_size): /soc/dcp@28cc00000: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202502121652.8D2tODXY-lkp@intel.com>
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
commit: c9730d62240afcc32349d8ad37ca62312b1c5547 [188/191] fixup! arm64: dts: apple: t600x: Add t6000 dispext device nodes
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250210 (https://download.01.org/0day-ci/archive/20250212/202502121652.8D2tODXY-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502121652.8D2tODXY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502121652.8D2tODXY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:407.29-412.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:508.39-527.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:529.39-548.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:369.21-405.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@38bc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:65.25-102.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@289c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t600x-dieX.dtsi:142.25-179.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@28cc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:147.42-150.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:343.9-352.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:395.9-404.5: Warning (graph_child_address): /soc/dcp@38bc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:92.9-101.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:169.9-178.5: Warning (graph_child_address): /soc/dcp@28cc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:517.9-526.5: Warning (graph_child_address): /soc/audio-controller@39b504000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:407.29-412.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:508.39-527.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:529.39-548.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:369.21-405.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@38bc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:65.25-102.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@289c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t600x-dieX.dtsi:142.25-179.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@28cc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:147.42-150.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:343.9-352.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:395.9-404.5: Warning (graph_child_address): /soc/dcp@38bc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:92.9-101.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:169.9-178.5: Warning (graph_child_address): /soc/dcp@28cc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:517.9-526.5: Warning (graph_child_address): /soc/audio-controller@39b504000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:407.29-412.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:508.39-527.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:529.39-548.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:369.21-405.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@38bc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:65.25-102.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@289c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t600x-dieX.dtsi:142.25-179.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@28cc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:147.42-150.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:343.9-352.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:395.9-404.5: Warning (graph_child_address): /soc/dcp@38bc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:92.9-101.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:169.9-178.5: Warning (graph_child_address): /soc/dcp@28cc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:517.9-526.5: Warning (graph_child_address): /soc/audio-controller@39b504000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:407.29-412.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:508.39-527.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:529.39-548.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:369.21-405.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@38bc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:65.25-102.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@289c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t600x-dieX.dtsi:142.25-179.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@28cc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:147.42-150.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:343.9-352.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:395.9-404.5: Warning (graph_child_address): /soc/dcp@38bc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:92.9-101.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:169.9-178.5: Warning (graph_child_address): /soc/dcp@28cc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:517.9-526.5: Warning (graph_child_address): /soc/audio-controller@39b504000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t600x-common.dtsi:497.22-500.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:306.14-315.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:317.14-326.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:407.29-412.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:508.39-527.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:529.39-548.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:369.21-405.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@38bc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:65.25-102.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@289c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t600x-dieX.dtsi:142.25-179.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@28cc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:147.42-150.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:343.9-352.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:395.9-404.5: Warning (graph_child_address): /soc/dcp@38bc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:92.9-101.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:169.9-178.5: Warning (graph_child_address): /soc/dcp@28cc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:517.9-526.5: Warning (graph_child_address): /soc/audio-controller@39b504000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:538.9-547.5: Warning (graph_child_address): /soc/audio-controller@39b508000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +142 arch/arm64/boot/dts/apple/t600x-dieX.dtsi

98274d4a92ad02 Janne Grunau 2022-10-20 @142  	DIE_NODE(dcpext1):  dcp@28cc00000 {

:::::: The code at line 142 was first introduced by commit
:::::: 98274d4a92ad02dc70b29589e20288d98d3c4b13 arm64: dts: apple: t600x: Add t6000 dispext device nodes

:::::: TO: Janne Grunau <j@jannau.net>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
