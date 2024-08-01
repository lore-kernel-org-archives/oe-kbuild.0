Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C311EB48A
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Aug 2024 20:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722542693; cv=none; b=djqUpCSe8f5cuXnfADemGeO2l5JoqLvLFP9sM7Jp4FD3sz0RBbQCIH1/tarm9SYJiYalUEOokO//Tyr56zCLZdLKUQCNZkg4YbgmP+UPVCtXBhHolISgxafd8VbL8ysqLEk1RARXziw5cB/8BSMQJXD26q6nu1xtQEo5b00K2HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722542693; c=relaxed/simple;
	bh=GJokjF/J+6hAzwic1dxyYqENv2QXg63xVyNGLiHhfvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mp4CPoqd6WSMb6N2q3CF2zttHFUlEQSz+MmhAj/dKraFtS4kh0Vj2KPbMIGqO2DzNUYXGw36ZG+N9SWvukN8rI5HTeQ7DOFVNMF7Pv23Vcwyrqmdxzj0ltT+AK8YM4YnTeihXhpEiOBYBvf3/5EIe+TSeIv9Hao0aiComoI41jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YemZi/kG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YemZi/kG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722542690; x=1754078690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GJokjF/J+6hAzwic1dxyYqENv2QXg63xVyNGLiHhfvE=;
  b=YemZi/kG9BAz3J91AFwCV/Q7T7FItPcCDeUX4k8/JEeZF/qZJeXGJznA
   9dFRIHSiPFUNYhe7sG5rn1OXC9Fy8f/eYsHIpZFCOqB71Z9MKPjdHbhsO
   ia/WHHn/kzXje6ibTC/IsW0VJs1DNtUBAEexmfkeaQ9mcyfV8Gn2B/wx4
   Fg3+QfJAXrrQkumHd9QKgYVvfPfA3ctCdexLfWrZ3cERwvKFF+8xlgkgx
   SmIjT2QTeO6omb4m9OxCrYgeEgSP4W3CbPTXe8erTSrf8mqN6a/B5WTbP
   hqtDl4C76rDXtBEPZ7w6Lt1adSAlwCNXuzFYM0C+mPDMIZtxBoGt8+FNb
   w==;
X-CSE-ConnectionGUID: WpKXx3JDRly/AcCTxcuSVA==
X-CSE-MsgGUID: cmarHOvkS1GtHpmaN7VahA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="24321541"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; 
   d="scan'208";a="24321541"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 13:04:50 -0700
X-CSE-ConnectionGUID: vbiom6xYQ62SlLwkeeyzow==
X-CSE-MsgGUID: 7KMqGXo9SkORZ7+2ffDm2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; 
   d="scan'208";a="55391809"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Aug 2024 13:04:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZc2Y-000vzY-0j;
	Thu, 01 Aug 2024 20:04:46 +0000
Date: Fri, 2 Aug 2024 04:04:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-platforms:kvm-arm64/asahi-base-6.11 1/29]
 arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning
 (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202408020416.O04TJwBK-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: Janne Grunau <j@jannau.net>
CC: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/asahi-base-6.11
head:   0619e126e13837cf7e2cc8dfda13d762d37dc10a
commit: e51898b8e8998b332a855f3c5df4c6aeed82e57d [1/29] Merge remote-tracking branch 'jannau/v6.10/bits/000-devicetree' into kvm-arm64/asahi-base-6.11
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-003-20240801 (https://download.01.org/0day-ci/archive/20240802/202408020416.O04TJwBK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240802/202408020416.O04TJwBK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408020416.O04TJwBK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:497.22-500.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:487.14-501.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:503.14-512.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:276.29-281.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:502.39-521.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:523.39-542.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
>> arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:147.42-150.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:215.9-224.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:264.9-273.5: Warning (graph_child_address): /soc/dcp@38bc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:89.9-98.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:421.9-430.5: Warning (graph_child_address): /soc/dcp@315c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:511.9-520.5: Warning (graph_child_address): /soc/audio-controller@39b504000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:532.9-541.5: Warning (graph_child_address): /soc/audio-controller@39b508000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t8112.dtsi:463.28-466.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:468.34-471.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:473.22-476.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112-j413.dts:185.14-195.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j413.dts:197.14-206.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:718.30-724.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:1148.43-1151.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8112.dtsi:706.10-715.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:919.10-928.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:940.10-949.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:1538.10-1547.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t8103.dtsi:442.28-445.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:447.34-450.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:452.22-455.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103-j274.dts:119.14-128.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j274.dts:130.14-139.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:644.30-650.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:1122.43-1125.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103.dtsi:632.10-641.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:909.10-918.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:930.10-939.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:1340.10-1349.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t600x-common.dtsi:492.34-495.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-common.dtsi:497.22-500.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:306.14-315.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:317.14-326.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:276.29-281.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:502.39-521.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:523.39-542.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
>> arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:147.42-150.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:215.9-224.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:264.9-273.5: Warning (graph_child_address): /soc/dcp@38bc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:89.9-98.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:421.9-430.5: Warning (graph_child_address): /soc/dcp@315c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:511.9-520.5: Warning (graph_child_address): /soc/audio-controller@39b504000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:532.9-541.5: Warning (graph_child_address): /soc/audio-controller@39b508000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t8112.dtsi:463.28-466.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:468.34-471.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:473.22-476.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112-j415.dts:203.14-217.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j415.dts:219.14-228.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:718.30-724.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:1148.43-1151.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8112.dtsi:706.10-715.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:919.10-928.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:940.10-949.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:1538.10-1547.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t602x-common.dtsi:611.22-614.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:487.14-501.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:503.14-512.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:388.29-393.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:314.39-333.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:335.39-354.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
>> arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:376.9-385.5: Warning (graph_child_address): /soc/dcp@389c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:610.9-619.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:89.9-98.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:241.9-250.5: Warning (graph_child_address): /soc/dcp@315c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t8112.dtsi:463.28-466.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:468.34-471.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:473.22-476.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112-j473.dts:168.14-177.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j473.dts:179.14-188.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:718.30-724.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:1148.43-1151.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8112.dtsi:706.10-715.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:919.10-928.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:940.10-949.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:1538.10-1547.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t602x-common.dtsi:601.28-604.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t602x-common.dtsi:606.34-609.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t602x-common.dtsi:611.22-614.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:306.14-315.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:317.14-326.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:388.29-393.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:314.39-333.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:335.39-354.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
>> arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:376.9-385.5: Warning (graph_child_address): /soc/dcp@389c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:610.9-619.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:89.9-98.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:241.9-250.5: Warning (graph_child_address): /soc/dcp@315c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:323.9-332.5: Warning (graph_child_address): /soc/audio-controller@39b504000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:344.9-353.5: Warning (graph_child_address): /soc/audio-controller@39b508000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t8112.dtsi:463.28-466.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:468.34-471.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:473.22-476.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112-j493.dts:189.14-199.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j493.dts:201.14-210.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:718.30-724.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:1148.43-1151.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8112.dtsi:706.10-715.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:919.10-928.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:940.10-949.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:1538.10-1547.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t8103.dtsi:442.28-445.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:447.34-450.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:452.22-455.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103-j457.dts:95.14-104.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:644.30-650.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:1122.43-1125.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103.dtsi:632.10-641.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:909.10-918.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:930.10-939.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:1340.10-1349.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t8103.dtsi:442.28-445.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:447.34-450.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:452.22-455.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103-j293.dts:212.14-222.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j293.dts:224.14-233.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:644.30-650.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:1122.43-1125.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103.dtsi:632.10-641.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:909.10-918.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:930.10-939.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:1340.10-1349.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t602x-common.dtsi:601.28-604.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t602x-common.dtsi:606.34-609.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t602x-common.dtsi:611.22-614.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:306.14-315.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:317.14-326.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:388.29-393.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:314.39-333.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:335.39-354.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
>> arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:376.9-385.5: Warning (graph_child_address): /soc/dcp@389c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:610.9-619.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:89.9-98.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:241.9-250.5: Warning (graph_child_address): /soc/dcp@315c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:323.9-332.5: Warning (graph_child_address): /soc/audio-controller@39b504000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:344.9-353.5: Warning (graph_child_address): /soc/audio-controller@39b508000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t8103.dtsi:442.28-445.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:447.34-450.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:452.22-455.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103-j456.dts:122.14-131.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:644.30-650.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:1122.43-1125.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103.dtsi:632.10-641.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:909.10-918.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:930.10-939.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:1340.10-1349.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t8103.dtsi:442.28-445.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:447.34-450.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:452.22-455.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103-j313.dts:146.14-155.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j313.dts:157.14-166.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:644.30-650.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:1122.43-1125.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103.dtsi:632.10-641.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:909.10-918.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:930.10-939.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:1340.10-1349.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +12 arch/arm64/boot/dts/apple/spi1-nvram.dtsi

61ec8881c359dd Janne Grunau 2023-09-30 @12  	flash@0 {

:::::: The code at line 12 was first introduced by commit
:::::: 61ec8881c359dd494d8da60327f1b85a2f168153 arch: arm64: apple: Add spi1-nvram.dtsi

:::::: TO: Janne Grunau <j@jannau.net>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
