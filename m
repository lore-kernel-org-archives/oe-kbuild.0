Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B97E1D54FE
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Feb 2025 15:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288376; cv=none; b=o+CqWpV2pLHE3TLLvU4nZ2mFL758M8EbIz6alt024pm3T3RZdWfR1MJ27AsqzRd46ETiveSIBb5ItB8Q5OOXDAHJbs62bXrRLm950WPnQZEanmX2kTwQV2Mw0saujPJDDB28V0TpleZbSF/npbDtVuwmJZRWrkx/jjfQ9VuAgJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288376; c=relaxed/simple;
	bh=fmlt5ntrJe9fXkkro3CLTujwqR31W1teCwmpvLnYaXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O79g5AOYwupxD1LcSpY/ucd0AHVTKzkl+tH380Mjcvdv7n6yFZd/bGSvdvZGFIYpfxCo/sT+lho7jgKZPx+80Spf6TuYE/+8d855Ee3hhzOEyxUj2NhrFEkxlvldHOb1YKub6DvMpbKIrl6YCzrZwTl2kVPuf5/dyl455EJ4Wa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jg8Rhuro; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jg8Rhuro"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739288370; x=1770824370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fmlt5ntrJe9fXkkro3CLTujwqR31W1teCwmpvLnYaXk=;
  b=Jg8RhurouDe95y7a1ynWKYQmuuCr8g9bydkq2S2FVTcG/vAxfBEPksoy
   1SMAwjaCP6Qn+dBiUF4V+MW9hMPs5g03xkc5buRU9iRG99ordEyH1rceI
   L3rNfLk1Qnn5X7PcbcM7GspUPoOpYwwrpY5QbY/3FdIeMFMvo/o5QO6rf
   4PBdYqwiYiQuofBIKC6iFytSyZ0biY3Q73JFHQSzQ/lGR+oj0onpU2Vzf
   nLhatjoqxX7h5TaqoKryG28TaVzPbjq+TxgFUnI/BIEco/IX4mwkt8clG
   vXB5q7s06pEzdMyya1e9iHhdJnfmgtCAWTLAwZB/xa03PHtfvJIdBIyzS
   A==;
X-CSE-ConnectionGUID: pmrMDQ+NQj+HykO29lczTA==
X-CSE-MsgGUID: S97/TAzTQIOv2cuT1tNoFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43571863"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="43571863"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 07:39:29 -0800
X-CSE-ConnectionGUID: Vb8W5AZkSduEol3Hul7O+g==
X-CSE-MsgGUID: qYro5a/2T9C2vZ+ycEX3LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113439546"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Feb 2025 07:39:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thsM8-0014Mh-2W;
	Tue, 11 Feb 2025 15:39:24 +0000
Date: Tue, 11 Feb 2025 23:39:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 184/191]
 arch/arm64/boot/dts/apple/t8112.dtsi:682.22-719.5: Warning
 (avoid_unnecessary_addr_size): /soc/dcp@231c00000: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202502112334.7t4Y1afg-lkp@intel.com>
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
commit: d93249b760cdeed55ccd1f3416c7db759ce8ea73 [184/191] fixup! arm64: dts: apple: t8112: Add dcp/disp0 nodes
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250210 (https://download.01.org/0day-ci/archive/20250211/202502112334.7t4Y1afg-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502112334.7t4Y1afg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502112334.7t4Y1afg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112.dtsi:470.28-473.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:475.34-478.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:480.22-483.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112-j413.dts:190.14-200.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j413.dts:202.14-211.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:721.30-727.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/apple/t8112.dtsi:682.22-719.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@231c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:1151.43-1154.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8112.dtsi:709.10-718.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:922.10-931.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t8112.dtsi:470.28-473.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:475.34-478.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:480.22-483.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112-j415.dts:208.14-222.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j415.dts:224.14-233.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:721.30-727.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/apple/t8112.dtsi:682.22-719.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@231c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:1151.43-1154.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8112.dtsi:709.10-718.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:922.10-931.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t8112.dtsi:470.28-473.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:475.34-478.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:480.22-483.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112-j473.dts:168.14-177.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j473.dts:179.14-188.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:721.30-727.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/apple/t8112.dtsi:682.22-719.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@231c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:1151.43-1154.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8112.dtsi:709.10-718.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:922.10-931.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:943.10-952.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t8112.dtsi:470.28-473.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:475.34-478.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:480.22-483.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112-j493.dts:194.14-204.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j493.dts:206.14-215.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:721.30-727.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/apple/t8112.dtsi:682.22-719.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@231c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:1151.43-1154.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8112.dtsi:709.10-718.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:922.10-931.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +682 arch/arm64/boot/dts/apple/t8112.dtsi

2d5ce3fbef3242 Hector Martin     2023-03-07    16  
2d5ce3fbef3242 Hector Martin     2023-03-07    17  / {
2d5ce3fbef3242 Hector Martin     2023-03-07    18  	compatible = "apple,t8112", "apple,arm-platform";
2d5ce3fbef3242 Hector Martin     2023-03-07    19  
2d5ce3fbef3242 Hector Martin     2023-03-07    20  	#address-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07    21  	#size-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07    22  
31aa7b972f62e0 Asahi Lina        2022-11-25    23  	aliases {
31aa7b972f62e0 Asahi Lina        2022-11-25    24  		gpu = &gpu;
31aa7b972f62e0 Asahi Lina        2022-11-25    25  	};
31aa7b972f62e0 Asahi Lina        2022-11-25    26  
2d5ce3fbef3242 Hector Martin     2023-03-07    27  	cpus {
2d5ce3fbef3242 Hector Martin     2023-03-07    28  		#address-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07    29  		#size-cells = <0>;
2d5ce3fbef3242 Hector Martin     2023-03-07    30  
2d5ce3fbef3242 Hector Martin     2023-03-07    31  		cpu-map {
2d5ce3fbef3242 Hector Martin     2023-03-07    32  			cluster0 {
2d5ce3fbef3242 Hector Martin     2023-03-07    33  				core0 {
2d5ce3fbef3242 Hector Martin     2023-03-07    34  					cpu = <&cpu_e0>;
2d5ce3fbef3242 Hector Martin     2023-03-07    35  				};
2d5ce3fbef3242 Hector Martin     2023-03-07    36  				core1 {
2d5ce3fbef3242 Hector Martin     2023-03-07    37  					cpu = <&cpu_e1>;
2d5ce3fbef3242 Hector Martin     2023-03-07    38  				};
2d5ce3fbef3242 Hector Martin     2023-03-07    39  				core2 {
2d5ce3fbef3242 Hector Martin     2023-03-07    40  					cpu = <&cpu_e2>;
2d5ce3fbef3242 Hector Martin     2023-03-07    41  				};
2d5ce3fbef3242 Hector Martin     2023-03-07    42  				core3 {
2d5ce3fbef3242 Hector Martin     2023-03-07    43  					cpu = <&cpu_e3>;
2d5ce3fbef3242 Hector Martin     2023-03-07    44  				};
2d5ce3fbef3242 Hector Martin     2023-03-07    45  			};
2d5ce3fbef3242 Hector Martin     2023-03-07    46  
2d5ce3fbef3242 Hector Martin     2023-03-07    47  			cluster1 {
2d5ce3fbef3242 Hector Martin     2023-03-07    48  				core0 {
2d5ce3fbef3242 Hector Martin     2023-03-07    49  					cpu = <&cpu_p0>;
2d5ce3fbef3242 Hector Martin     2023-03-07    50  				};
2d5ce3fbef3242 Hector Martin     2023-03-07    51  				core1 {
2d5ce3fbef3242 Hector Martin     2023-03-07    52  					cpu = <&cpu_p1>;
2d5ce3fbef3242 Hector Martin     2023-03-07    53  				};
2d5ce3fbef3242 Hector Martin     2023-03-07    54  				core2 {
2d5ce3fbef3242 Hector Martin     2023-03-07    55  					cpu = <&cpu_p2>;
2d5ce3fbef3242 Hector Martin     2023-03-07    56  				};
2d5ce3fbef3242 Hector Martin     2023-03-07    57  				core3 {
2d5ce3fbef3242 Hector Martin     2023-03-07    58  					cpu = <&cpu_p3>;
2d5ce3fbef3242 Hector Martin     2023-03-07    59  				};
2d5ce3fbef3242 Hector Martin     2023-03-07    60  			};
2d5ce3fbef3242 Hector Martin     2023-03-07    61  		};
2d5ce3fbef3242 Hector Martin     2023-03-07    62  
2d5ce3fbef3242 Hector Martin     2023-03-07    63  		cpu_e0: cpu@0 {
2d5ce3fbef3242 Hector Martin     2023-03-07    64  			compatible = "apple,blizzard";
2d5ce3fbef3242 Hector Martin     2023-03-07    65  			device_type = "cpu";
2d5ce3fbef3242 Hector Martin     2023-03-07    66  			reg = <0x0 0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07    67  			enable-method = "spin-table";
2d5ce3fbef3242 Hector Martin     2023-03-07    68  			cpu-release-addr = <0 0>; /* To be filled by loader */
2d5ce3fbef3242 Hector Martin     2023-03-07    69  			operating-points-v2 = <&ecluster_opp>;
2d5ce3fbef3242 Hector Martin     2023-03-07    70  			capacity-dmips-mhz = <756>;
2d5ce3fbef3242 Hector Martin     2023-03-07    71  			performance-domains = <&cpufreq_e>;
2d5ce3fbef3242 Hector Martin     2023-03-07    72  			next-level-cache = <&l2_cache_0>;
2d5ce3fbef3242 Hector Martin     2023-03-07    73  			i-cache-size = <0x20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07    74  			d-cache-size = <0x10000>;
2d5ce3fbef3242 Hector Martin     2023-03-07    75  		};
2d5ce3fbef3242 Hector Martin     2023-03-07    76  
2d5ce3fbef3242 Hector Martin     2023-03-07    77  		cpu_e1: cpu@1 {
2d5ce3fbef3242 Hector Martin     2023-03-07    78  			compatible = "apple,blizzard";
2d5ce3fbef3242 Hector Martin     2023-03-07    79  			device_type = "cpu";
2d5ce3fbef3242 Hector Martin     2023-03-07    80  			reg = <0x0 0x1>;
2d5ce3fbef3242 Hector Martin     2023-03-07    81  			enable-method = "spin-table";
2d5ce3fbef3242 Hector Martin     2023-03-07    82  			cpu-release-addr = <0 0>; /* To be filled by loader */
2d5ce3fbef3242 Hector Martin     2023-03-07    83  			operating-points-v2 = <&ecluster_opp>;
2d5ce3fbef3242 Hector Martin     2023-03-07    84  			capacity-dmips-mhz = <756>;
2d5ce3fbef3242 Hector Martin     2023-03-07    85  			performance-domains = <&cpufreq_e>;
2d5ce3fbef3242 Hector Martin     2023-03-07    86  			next-level-cache = <&l2_cache_0>;
2d5ce3fbef3242 Hector Martin     2023-03-07    87  			i-cache-size = <0x20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07    88  			d-cache-size = <0x10000>;
2d5ce3fbef3242 Hector Martin     2023-03-07    89  		};
2d5ce3fbef3242 Hector Martin     2023-03-07    90  
2d5ce3fbef3242 Hector Martin     2023-03-07    91  		cpu_e2: cpu@2 {
2d5ce3fbef3242 Hector Martin     2023-03-07    92  			compatible = "apple,blizzard";
2d5ce3fbef3242 Hector Martin     2023-03-07    93  			device_type = "cpu";
2d5ce3fbef3242 Hector Martin     2023-03-07    94  			reg = <0x0 0x2>;
2d5ce3fbef3242 Hector Martin     2023-03-07    95  			enable-method = "spin-table";
2d5ce3fbef3242 Hector Martin     2023-03-07    96  			cpu-release-addr = <0 0>; /* To be filled by loader */
2d5ce3fbef3242 Hector Martin     2023-03-07    97  			operating-points-v2 = <&ecluster_opp>;
2d5ce3fbef3242 Hector Martin     2023-03-07    98  			capacity-dmips-mhz = <756>;
2d5ce3fbef3242 Hector Martin     2023-03-07    99  			performance-domains = <&cpufreq_e>;
2d5ce3fbef3242 Hector Martin     2023-03-07   100  			next-level-cache = <&l2_cache_0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   101  			i-cache-size = <0x20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   102  			d-cache-size = <0x10000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   103  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   104  
2d5ce3fbef3242 Hector Martin     2023-03-07   105  		cpu_e3: cpu@3 {
2d5ce3fbef3242 Hector Martin     2023-03-07   106  			compatible = "apple,blizzard";
2d5ce3fbef3242 Hector Martin     2023-03-07   107  			device_type = "cpu";
2d5ce3fbef3242 Hector Martin     2023-03-07   108  			reg = <0x0 0x3>;
2d5ce3fbef3242 Hector Martin     2023-03-07   109  			enable-method = "spin-table";
2d5ce3fbef3242 Hector Martin     2023-03-07   110  			cpu-release-addr = <0 0>; /* To be filled by loader */
2d5ce3fbef3242 Hector Martin     2023-03-07   111  			operating-points-v2 = <&ecluster_opp>;
2d5ce3fbef3242 Hector Martin     2023-03-07   112  			capacity-dmips-mhz = <756>;
2d5ce3fbef3242 Hector Martin     2023-03-07   113  			performance-domains = <&cpufreq_e>;
2d5ce3fbef3242 Hector Martin     2023-03-07   114  			next-level-cache = <&l2_cache_0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   115  			i-cache-size = <0x20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   116  			d-cache-size = <0x10000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   117  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   118  
2d5ce3fbef3242 Hector Martin     2023-03-07   119  		cpu_p0: cpu@10100 {
2d5ce3fbef3242 Hector Martin     2023-03-07   120  			compatible = "apple,avalanche";
2d5ce3fbef3242 Hector Martin     2023-03-07   121  			device_type = "cpu";
2d5ce3fbef3242 Hector Martin     2023-03-07   122  			reg = <0x0 0x10100>;
2d5ce3fbef3242 Hector Martin     2023-03-07   123  			enable-method = "spin-table";
2d5ce3fbef3242 Hector Martin     2023-03-07   124  			cpu-release-addr = <0 0>; /* To be filled by loader */
2d5ce3fbef3242 Hector Martin     2023-03-07   125  			operating-points-v2 = <&pcluster_opp>;
2d5ce3fbef3242 Hector Martin     2023-03-07   126  			capacity-dmips-mhz = <1024>;
2d5ce3fbef3242 Hector Martin     2023-03-07   127  			performance-domains = <&cpufreq_p>;
2d5ce3fbef3242 Hector Martin     2023-03-07   128  			next-level-cache = <&l2_cache_1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   129  			i-cache-size = <0x30000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   130  			d-cache-size = <0x20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   131  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   132  
2d5ce3fbef3242 Hector Martin     2023-03-07   133  		cpu_p1: cpu@10101 {
2d5ce3fbef3242 Hector Martin     2023-03-07   134  			compatible = "apple,avalanche";
2d5ce3fbef3242 Hector Martin     2023-03-07   135  			device_type = "cpu";
2d5ce3fbef3242 Hector Martin     2023-03-07   136  			reg = <0x0 0x10101>;
2d5ce3fbef3242 Hector Martin     2023-03-07   137  			enable-method = "spin-table";
2d5ce3fbef3242 Hector Martin     2023-03-07   138  			cpu-release-addr = <0 0>; /* To be filled by loader */
2d5ce3fbef3242 Hector Martin     2023-03-07   139  			operating-points-v2 = <&pcluster_opp>;
2d5ce3fbef3242 Hector Martin     2023-03-07   140  			capacity-dmips-mhz = <1024>;
2d5ce3fbef3242 Hector Martin     2023-03-07   141  			performance-domains = <&cpufreq_p>;
2d5ce3fbef3242 Hector Martin     2023-03-07   142  			next-level-cache = <&l2_cache_1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   143  			i-cache-size = <0x30000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   144  			d-cache-size = <0x20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   145  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   146  
2d5ce3fbef3242 Hector Martin     2023-03-07   147  		cpu_p2: cpu@10102 {
2d5ce3fbef3242 Hector Martin     2023-03-07   148  			compatible = "apple,avalanche";
2d5ce3fbef3242 Hector Martin     2023-03-07   149  			device_type = "cpu";
2d5ce3fbef3242 Hector Martin     2023-03-07   150  			reg = <0x0 0x10102>;
2d5ce3fbef3242 Hector Martin     2023-03-07   151  			enable-method = "spin-table";
2d5ce3fbef3242 Hector Martin     2023-03-07   152  			cpu-release-addr = <0 0>; /* To be filled by loader */
2d5ce3fbef3242 Hector Martin     2023-03-07   153  			operating-points-v2 = <&pcluster_opp>;
2d5ce3fbef3242 Hector Martin     2023-03-07   154  			capacity-dmips-mhz = <1024>;
2d5ce3fbef3242 Hector Martin     2023-03-07   155  			performance-domains = <&cpufreq_p>;
2d5ce3fbef3242 Hector Martin     2023-03-07   156  			next-level-cache = <&l2_cache_1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   157  			i-cache-size = <0x30000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   158  			d-cache-size = <0x20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   159  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   160  
2d5ce3fbef3242 Hector Martin     2023-03-07   161  		cpu_p3: cpu@10103 {
2d5ce3fbef3242 Hector Martin     2023-03-07   162  			compatible = "apple,avalanche";
2d5ce3fbef3242 Hector Martin     2023-03-07   163  			device_type = "cpu";
2d5ce3fbef3242 Hector Martin     2023-03-07   164  			reg = <0x0 0x10103>;
2d5ce3fbef3242 Hector Martin     2023-03-07   165  			enable-method = "spin-table";
2d5ce3fbef3242 Hector Martin     2023-03-07   166  			cpu-release-addr = <0 0>; /* To be filled by loader */
2d5ce3fbef3242 Hector Martin     2023-03-07   167  			operating-points-v2 = <&pcluster_opp>;
2d5ce3fbef3242 Hector Martin     2023-03-07   168  			capacity-dmips-mhz = <1024>;
2d5ce3fbef3242 Hector Martin     2023-03-07   169  			performance-domains = <&cpufreq_p>;
2d5ce3fbef3242 Hector Martin     2023-03-07   170  			next-level-cache = <&l2_cache_1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   171  			i-cache-size = <0x30000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   172  			d-cache-size = <0x20000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   173  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   174  
2d5ce3fbef3242 Hector Martin     2023-03-07   175  		l2_cache_0: l2-cache-0 {
2d5ce3fbef3242 Hector Martin     2023-03-07   176  			compatible = "cache";
2d5ce3fbef3242 Hector Martin     2023-03-07   177  			cache-level = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   178  			cache-unified;
2d5ce3fbef3242 Hector Martin     2023-03-07   179  			cache-size = <0x400000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   180  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   181  
2d5ce3fbef3242 Hector Martin     2023-03-07   182  		l2_cache_1: l2-cache-1 {
2d5ce3fbef3242 Hector Martin     2023-03-07   183  			compatible = "cache";
2d5ce3fbef3242 Hector Martin     2023-03-07   184  			cache-level = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   185  			cache-unified;
2d5ce3fbef3242 Hector Martin     2023-03-07   186  			cache-size = <0x1000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   187  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   188  	};
2d5ce3fbef3242 Hector Martin     2023-03-07   189  
2d5ce3fbef3242 Hector Martin     2023-03-07   190  	ecluster_opp: opp-table-0 {
2d5ce3fbef3242 Hector Martin     2023-03-07   191  		compatible = "operating-points-v2";
2d5ce3fbef3242 Hector Martin     2023-03-07   192  		opp-shared;
2d5ce3fbef3242 Hector Martin     2023-03-07   193  
2d5ce3fbef3242 Hector Martin     2023-03-07   194  		opp01 {
2d5ce3fbef3242 Hector Martin     2023-03-07   195  			opp-hz = /bits/ 64 <600000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   196  			opp-level = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   197  			clock-latency-ns = <7500>;
5028b0dfbc561b James Calligeros  2023-09-03   198  			opp-microwatt = <26000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   199  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   200  		opp02 {
2d5ce3fbef3242 Hector Martin     2023-03-07   201  			opp-hz = /bits/ 64 <912000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   202  			opp-level = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   203  			clock-latency-ns = <20000>;
5028b0dfbc561b James Calligeros  2023-09-03   204  			opp-microwatt = <56000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   205  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   206  		opp03 {
2d5ce3fbef3242 Hector Martin     2023-03-07   207  			opp-hz = /bits/ 64 <1284000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   208  			opp-level = <3>;
2d5ce3fbef3242 Hector Martin     2023-03-07   209  			clock-latency-ns = <22000>;
5028b0dfbc561b James Calligeros  2023-09-03   210  			opp-microwatt = <88000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   211  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   212  		opp04 {
2d5ce3fbef3242 Hector Martin     2023-03-07   213  			opp-hz = /bits/ 64 <1752000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   214  			opp-level = <4>;
2d5ce3fbef3242 Hector Martin     2023-03-07   215  			clock-latency-ns = <30000>;
5028b0dfbc561b James Calligeros  2023-09-03   216  			opp-microwatt = <155000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   217  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   218  		opp05 {
2d5ce3fbef3242 Hector Martin     2023-03-07   219  			opp-hz = /bits/ 64 <2004000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   220  			opp-level = <5>;
2d5ce3fbef3242 Hector Martin     2023-03-07   221  			clock-latency-ns = <35000>;
5028b0dfbc561b James Calligeros  2023-09-03   222  			opp-microwatt = <231000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   223  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   224  		opp06 {
2d5ce3fbef3242 Hector Martin     2023-03-07   225  			opp-hz = /bits/ 64 <2256000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   226  			opp-level = <6>;
2d5ce3fbef3242 Hector Martin     2023-03-07   227  			clock-latency-ns = <39000>;
5028b0dfbc561b James Calligeros  2023-09-03   228  			opp-microwatt = <254000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   229  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   230  		opp07 {
2d5ce3fbef3242 Hector Martin     2023-03-07   231  			opp-hz = /bits/ 64 <2424000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   232  			opp-level = <7>;
2d5ce3fbef3242 Hector Martin     2023-03-07   233  			clock-latency-ns = <53000>;
5028b0dfbc561b James Calligeros  2023-09-03   234  			opp-microwatt = <351000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   235  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   236  	};
2d5ce3fbef3242 Hector Martin     2023-03-07   237  
2d5ce3fbef3242 Hector Martin     2023-03-07   238  	pcluster_opp: opp-table-1 {
2d5ce3fbef3242 Hector Martin     2023-03-07   239  		compatible = "operating-points-v2";
2d5ce3fbef3242 Hector Martin     2023-03-07   240  		opp-shared;
2d5ce3fbef3242 Hector Martin     2023-03-07   241  
2d5ce3fbef3242 Hector Martin     2023-03-07   242  		opp01 {
2d5ce3fbef3242 Hector Martin     2023-03-07   243  			opp-hz = /bits/ 64 <660000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   244  			opp-level = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   245  			clock-latency-ns = <9000>;
5028b0dfbc561b James Calligeros  2023-09-03   246  			opp-microwatt = <133000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   247  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   248  		opp02 {
2d5ce3fbef3242 Hector Martin     2023-03-07   249  			opp-hz = /bits/ 64 <924000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   250  			opp-level = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   251  			clock-latency-ns = <19000>;
5028b0dfbc561b James Calligeros  2023-09-03   252  			opp-microwatt = <212000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   253  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   254  		opp03 {
2d5ce3fbef3242 Hector Martin     2023-03-07   255  			opp-hz = /bits/ 64 <1188000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   256  			opp-level = <3>;
2d5ce3fbef3242 Hector Martin     2023-03-07   257  			clock-latency-ns = <22000>;
5028b0dfbc561b James Calligeros  2023-09-03   258  			opp-microwatt = <261000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   259  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   260  		opp04 {
2d5ce3fbef3242 Hector Martin     2023-03-07   261  			opp-hz = /bits/ 64 <1452000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   262  			opp-level = <4>;
2d5ce3fbef3242 Hector Martin     2023-03-07   263  			clock-latency-ns = <24000>;
5028b0dfbc561b James Calligeros  2023-09-03   264  			opp-microwatt = <345000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   265  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   266  		opp05 {
2d5ce3fbef3242 Hector Martin     2023-03-07   267  			opp-hz = /bits/ 64 <1704000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   268  			opp-level = <5>;
2d5ce3fbef3242 Hector Martin     2023-03-07   269  			clock-latency-ns = <26000>;
5028b0dfbc561b James Calligeros  2023-09-03   270  			opp-microwatt = <441000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   271  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   272  		opp06 {
2d5ce3fbef3242 Hector Martin     2023-03-07   273  			opp-hz = /bits/ 64 <1968000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   274  			opp-level = <6>;
2d5ce3fbef3242 Hector Martin     2023-03-07   275  			clock-latency-ns = <28000>;
5028b0dfbc561b James Calligeros  2023-09-03   276  			opp-microwatt = <619000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   277  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   278  		opp07 {
2d5ce3fbef3242 Hector Martin     2023-03-07   279  			opp-hz = /bits/ 64 <2208000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   280  			opp-level = <7>;
2d5ce3fbef3242 Hector Martin     2023-03-07   281  			clock-latency-ns = <30000>;
5028b0dfbc561b James Calligeros  2023-09-03   282  			opp-microwatt = <740000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   283  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   284  		opp08 {
2d5ce3fbef3242 Hector Martin     2023-03-07   285  			opp-hz = /bits/ 64 <2400000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   286  			opp-level = <8>;
2d5ce3fbef3242 Hector Martin     2023-03-07   287  			clock-latency-ns = <33000>;
5028b0dfbc561b James Calligeros  2023-09-03   288  			opp-microwatt = <855000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   289  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   290  		opp09 {
2d5ce3fbef3242 Hector Martin     2023-03-07   291  			opp-hz = /bits/ 64 <2568000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   292  			opp-level = <9>;
2d5ce3fbef3242 Hector Martin     2023-03-07   293  			clock-latency-ns = <34000>;
5028b0dfbc561b James Calligeros  2023-09-03   294  			opp-microwatt = <1006000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   295  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   296  		opp10 {
2d5ce3fbef3242 Hector Martin     2023-03-07   297  			opp-hz = /bits/ 64 <2724000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   298  			opp-level = <10>;
2d5ce3fbef3242 Hector Martin     2023-03-07   299  			clock-latency-ns = <36000>;
5028b0dfbc561b James Calligeros  2023-09-03   300  			opp-microwatt = <1217000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   301  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   302  		opp11 {
2d5ce3fbef3242 Hector Martin     2023-03-07   303  			opp-hz = /bits/ 64 <2868000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   304  			opp-level = <11>;
2d5ce3fbef3242 Hector Martin     2023-03-07   305  			clock-latency-ns = <41000>;
5028b0dfbc561b James Calligeros  2023-09-03   306  			opp-microwatt = <1534000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   307  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   308  		opp12 {
2d5ce3fbef3242 Hector Martin     2023-03-07   309  			opp-hz = /bits/ 64 <2988000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   310  			opp-level = <12>;
2d5ce3fbef3242 Hector Martin     2023-03-07   311  			clock-latency-ns = <42000>;
5028b0dfbc561b James Calligeros  2023-09-03   312  			opp-microwatt = <1714000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   313  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   314  		opp13 {
2d5ce3fbef3242 Hector Martin     2023-03-07   315  			opp-hz = /bits/ 64 <3096000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   316  			opp-level = <13>;
2d5ce3fbef3242 Hector Martin     2023-03-07   317  			clock-latency-ns = <44000>;
5028b0dfbc561b James Calligeros  2023-09-03   318  			opp-microwatt = <1877000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   319  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   320  		opp14 {
2d5ce3fbef3242 Hector Martin     2023-03-07   321  			opp-hz = /bits/ 64 <3204000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   322  			opp-level = <14>;
2d5ce3fbef3242 Hector Martin     2023-03-07   323  			clock-latency-ns = <46000>;
5028b0dfbc561b James Calligeros  2023-09-03   324  			opp-microwatt = <2159000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   325  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   326  		opp15 {
2d5ce3fbef3242 Hector Martin     2023-03-07   327  			opp-hz = /bits/ 64 <3324000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   328  			opp-level = <15>;
2d5ce3fbef3242 Hector Martin     2023-03-07   329  			clock-latency-ns = <62000>;
5028b0dfbc561b James Calligeros  2023-09-03   330  			opp-microwatt = <2393000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   331  			turbo-mode;
2d5ce3fbef3242 Hector Martin     2023-03-07   332  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   333  		opp16 {
2d5ce3fbef3242 Hector Martin     2023-03-07   334  			opp-hz = /bits/ 64 <3408000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   335  			opp-level = <16>;
2d5ce3fbef3242 Hector Martin     2023-03-07   336  			clock-latency-ns = <62000>;
5028b0dfbc561b James Calligeros  2023-09-03   337  			opp-microwatt = <2497000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   338  			turbo-mode;
2d5ce3fbef3242 Hector Martin     2023-03-07   339  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   340  		opp17 {
2d5ce3fbef3242 Hector Martin     2023-03-07   341  			opp-hz = /bits/ 64 <3504000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   342  			opp-level = <17>;
2d5ce3fbef3242 Hector Martin     2023-03-07   343  			clock-latency-ns = <62000>;
5028b0dfbc561b James Calligeros  2023-09-03   344  			opp-microwatt = <2648000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   345  			turbo-mode;
2d5ce3fbef3242 Hector Martin     2023-03-07   346  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   347  	};
2d5ce3fbef3242 Hector Martin     2023-03-07   348  
31aa7b972f62e0 Asahi Lina        2022-11-25   349  	gpu_opp: opp-table-gpu {
31aa7b972f62e0 Asahi Lina        2022-11-25   350  		compatible = "operating-points-v2";
31aa7b972f62e0 Asahi Lina        2022-11-25   351  
31aa7b972f62e0 Asahi Lina        2022-11-25   352  		/*
31aa7b972f62e0 Asahi Lina        2022-11-25   353  		 * NOTE: The voltage and power values are device-specific and
31aa7b972f62e0 Asahi Lina        2022-11-25   354  		 * must be filled in by the bootloader.
31aa7b972f62e0 Asahi Lina        2022-11-25   355  		 */
31aa7b972f62e0 Asahi Lina        2022-11-25   356  		opp00 {
31aa7b972f62e0 Asahi Lina        2022-11-25   357  			opp-hz = /bits/ 64 <0>;
31aa7b972f62e0 Asahi Lina        2022-11-25   358  			opp-microvolt = <400000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   359  			opp-microwatt = <0>;
31aa7b972f62e0 Asahi Lina        2022-11-25   360  		};
31aa7b972f62e0 Asahi Lina        2022-11-25   361  		opp01 {
31aa7b972f62e0 Asahi Lina        2022-11-25   362  			opp-hz = /bits/ 64 <444000000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   363  			opp-microvolt = <603000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   364  			opp-microwatt = <4295000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   365  		};
31aa7b972f62e0 Asahi Lina        2022-11-25   366  		opp02 {
31aa7b972f62e0 Asahi Lina        2022-11-25   367  			opp-hz = /bits/ 64 <612000000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   368  			opp-microvolt = <675000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   369  			opp-microwatt = <6251000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   370  		};
31aa7b972f62e0 Asahi Lina        2022-11-25   371  		opp03 {
31aa7b972f62e0 Asahi Lina        2022-11-25   372  			opp-hz = /bits/ 64 <808000000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   373  			opp-microvolt = <710000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   374  			opp-microwatt = <8625000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   375  		};
31aa7b972f62e0 Asahi Lina        2022-11-25   376  		opp04 {
31aa7b972f62e0 Asahi Lina        2022-11-25   377  			opp-hz = /bits/ 64 <968000000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   378  			opp-microvolt = <775000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   379  			opp-microwatt = <11948000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   380  		};
31aa7b972f62e0 Asahi Lina        2022-11-25   381  		opp05 {
31aa7b972f62e0 Asahi Lina        2022-11-25   382  			opp-hz = /bits/ 64 <1110000000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   383  			opp-microvolt = <820000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   384  			opp-microwatt = <15071000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   385  		};
31aa7b972f62e0 Asahi Lina        2022-11-25   386  		opp06 {
31aa7b972f62e0 Asahi Lina        2022-11-25   387  			opp-hz = /bits/ 64 <1236000000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   388  			opp-microvolt = <875000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   389  			opp-microwatt = <18891000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   390  		};
31aa7b972f62e0 Asahi Lina        2022-11-25   391  		opp07 {
31aa7b972f62e0 Asahi Lina        2022-11-25   392  			opp-hz = /bits/ 64 <1338000000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   393  			opp-microvolt = <915000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   394  			opp-microwatt = <21960000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   395  		};
31aa7b972f62e0 Asahi Lina        2022-11-25   396  		opp08 {
31aa7b972f62e0 Asahi Lina        2022-11-25   397  			opp-hz = /bits/ 64 <1398000000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   398  			opp-microvolt = <950000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   399  			opp-microwatt = <22800000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   400  		};
31aa7b972f62e0 Asahi Lina        2022-11-25   401  	};
31aa7b972f62e0 Asahi Lina        2022-11-25   402  
2d5ce3fbef3242 Hector Martin     2023-03-07   403  	timer {
2d5ce3fbef3242 Hector Martin     2023-03-07   404  		compatible = "arm,armv8-timer";
2d5ce3fbef3242 Hector Martin     2023-03-07   405  		interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   406  		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
2d5ce3fbef3242 Hector Martin     2023-03-07   407  		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   408  			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   409  			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   410  			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   411  	};
2d5ce3fbef3242 Hector Martin     2023-03-07   412  
2d5ce3fbef3242 Hector Martin     2023-03-07   413  	pmu-e {
2d5ce3fbef3242 Hector Martin     2023-03-07   414  		compatible = "apple,blizzard-pmu";
2d5ce3fbef3242 Hector Martin     2023-03-07   415  		interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   416  		interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   417  	};
2d5ce3fbef3242 Hector Martin     2023-03-07   418  
2d5ce3fbef3242 Hector Martin     2023-03-07   419  	pmu-p {
2d5ce3fbef3242 Hector Martin     2023-03-07   420  		compatible = "apple,avalanche-pmu";
2d5ce3fbef3242 Hector Martin     2023-03-07   421  		interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   422  		interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   423  	};
2d5ce3fbef3242 Hector Martin     2023-03-07   424  
2d5ce3fbef3242 Hector Martin     2023-03-07   425  	clkref: clock-ref {
2d5ce3fbef3242 Hector Martin     2023-03-07   426  		compatible = "fixed-clock";
2d5ce3fbef3242 Hector Martin     2023-03-07   427  		#clock-cells = <0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   428  		clock-frequency = <24000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   429  		clock-output-names = "clkref";
2d5ce3fbef3242 Hector Martin     2023-03-07   430  	};
2d5ce3fbef3242 Hector Martin     2023-03-07   431  
e7d8ca798ffe2f Janne Grunau      2023-02-02   432  	clk_200m: clock-200m {
e7d8ca798ffe2f Janne Grunau      2023-02-02   433  		compatible = "fixed-clock";
e7d8ca798ffe2f Janne Grunau      2023-02-02   434  		#clock-cells = <0>;
e7d8ca798ffe2f Janne Grunau      2023-02-02   435  		clock-frequency = <200000000>;
e7d8ca798ffe2f Janne Grunau      2023-02-02   436  		clock-output-names = "clk_200m";
e7d8ca798ffe2f Janne Grunau      2023-02-02   437  	};
e7d8ca798ffe2f Janne Grunau      2023-02-02   438  
2d5ce3fbef3242 Hector Martin     2023-03-07   439  	/*
2d5ce3fbef3242 Hector Martin     2023-03-07   440  	 * This is a fabulated representation of the input clock
2d5ce3fbef3242 Hector Martin     2023-03-07   441  	 * to NCO since we don't know the true clock tree.
2d5ce3fbef3242 Hector Martin     2023-03-07   442  	 */
2d5ce3fbef3242 Hector Martin     2023-03-07   443  	nco_clkref: clock-ref-nco {
2d5ce3fbef3242 Hector Martin     2023-03-07   444  		compatible = "fixed-clock";
2d5ce3fbef3242 Hector Martin     2023-03-07   445  		#clock-cells = <0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   446  		clock-output-names = "nco_ref";
2d5ce3fbef3242 Hector Martin     2023-03-07   447  	};
2d5ce3fbef3242 Hector Martin     2023-03-07   448  
f68bb847349e41 Janne Grunau      2022-11-20   449  	/* Pixel clock? frequency in Hz (compare: 4K@60 VGA clock 533.250 MHz) */
f68bb847349e41 Janne Grunau      2022-11-20   450  	clk_disp0: clock-disp0 {
f68bb847349e41 Janne Grunau      2022-11-20   451  		compatible = "fixed-clock";
f68bb847349e41 Janne Grunau      2022-11-20   452  		#clock-cells = <0>;
f68bb847349e41 Janne Grunau      2022-11-20   453  		clock-frequency = <533333328>;
f68bb847349e41 Janne Grunau      2022-11-20   454  		clock-output-names = "clk_disp0";
f68bb847349e41 Janne Grunau      2022-11-20   455  	};
f68bb847349e41 Janne Grunau      2022-11-20   456  
155fc27e8722bc Janne Grunau      2022-12-03   457  	/* Pixel clock? frequency in Hz (compare: 4K@60 VGA clock 533.250 MHz) */
155fc27e8722bc Janne Grunau      2022-12-03   458  	clk_dispext0: clock-dispext0 {
155fc27e8722bc Janne Grunau      2022-12-03   459  		compatible = "fixed-clock";
155fc27e8722bc Janne Grunau      2022-12-03   460  		#clock-cells = <0>;
155fc27e8722bc Janne Grunau      2022-12-03   461  		clock-frequency = <0>;
155fc27e8722bc Janne Grunau      2022-12-03   462  		clock-output-names = "clk_dispext0";
155fc27e8722bc Janne Grunau      2022-12-03   463  	};
155fc27e8722bc Janne Grunau      2022-12-03   464  
31aa7b972f62e0 Asahi Lina        2022-11-25   465  	reserved-memory {
31aa7b972f62e0 Asahi Lina        2022-11-25   466  		#address-cells = <2>;
31aa7b972f62e0 Asahi Lina        2022-11-25   467  		#size-cells = <2>;
31aa7b972f62e0 Asahi Lina        2022-11-25   468  		ranges;
31aa7b972f62e0 Asahi Lina        2022-11-25   469  
31aa7b972f62e0 Asahi Lina        2022-11-25   470  		uat_handoff: uat-handoff {
31aa7b972f62e0 Asahi Lina        2022-11-25   471  			reg = <0x0 0 0 0>;
31aa7b972f62e0 Asahi Lina        2022-11-25   472  			no-map;
31aa7b972f62e0 Asahi Lina        2022-11-25   473  		};
31aa7b972f62e0 Asahi Lina        2022-11-25   474  
31aa7b972f62e0 Asahi Lina        2022-11-25   475  		uat_pagetables: uat-pagetables {
31aa7b972f62e0 Asahi Lina        2022-11-25   476  			reg = <0x0 0 0 0>;
31aa7b972f62e0 Asahi Lina        2022-11-25   477  			no-map;
31aa7b972f62e0 Asahi Lina        2022-11-25   478  		};
31aa7b972f62e0 Asahi Lina        2022-11-25   479  
31aa7b972f62e0 Asahi Lina        2022-11-25   480  		uat_ttbs: uat-ttbs {
31aa7b972f62e0 Asahi Lina        2022-11-25   481  			reg = <0x0 0 0 0>;
31aa7b972f62e0 Asahi Lina        2022-11-25   482  			no-map;
31aa7b972f62e0 Asahi Lina        2022-11-25   483  		};
31aa7b972f62e0 Asahi Lina        2022-11-25   484  	};
31aa7b972f62e0 Asahi Lina        2022-11-25   485  
2d5ce3fbef3242 Hector Martin     2023-03-07   486  	soc {
2d5ce3fbef3242 Hector Martin     2023-03-07   487  		compatible = "simple-bus";
2d5ce3fbef3242 Hector Martin     2023-03-07   488  		#address-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   489  		#size-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   490  
2d5ce3fbef3242 Hector Martin     2023-03-07   491  		ranges;
2d5ce3fbef3242 Hector Martin     2023-03-07   492  		nonposted-mmio;
fed55afe76a709 Hector Martin     2023-04-11   493  		/* Required to get >32-bit DMA via DARTs */
fed55afe76a709 Hector Martin     2023-04-11   494  		dma-ranges = <0 0 0 0 0xffffffff 0xffffc000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   495  
31aa7b972f62e0 Asahi Lina        2022-11-25   496  		gpu: gpu@206400000 {
31aa7b972f62e0 Asahi Lina        2022-11-25   497  			compatible = "apple,agx-t8112", "apple,agx-g14g";
31aa7b972f62e0 Asahi Lina        2022-11-25   498  			reg = <0x2 0x6400000 0 0x40000>,
31aa7b972f62e0 Asahi Lina        2022-11-25   499  				<0x2 0x4000000 0 0x1000000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   500  			reg-names = "asc", "sgx";
31aa7b972f62e0 Asahi Lina        2022-11-25   501  			interrupt-parent = <&aic>;
31aa7b972f62e0 Asahi Lina        2022-11-25   502  			interrupts = <AIC_IRQ 697 IRQ_TYPE_LEVEL_HIGH>,
31aa7b972f62e0 Asahi Lina        2022-11-25   503  				<AIC_IRQ 698 IRQ_TYPE_LEVEL_HIGH>,
31aa7b972f62e0 Asahi Lina        2022-11-25   504  				<AIC_IRQ 699 IRQ_TYPE_LEVEL_HIGH>,
31aa7b972f62e0 Asahi Lina        2022-11-25   505  				<AIC_IRQ 700 IRQ_TYPE_LEVEL_HIGH>,
31aa7b972f62e0 Asahi Lina        2022-11-25   506  				<AIC_IRQ 713 IRQ_TYPE_LEVEL_HIGH>;
31aa7b972f62e0 Asahi Lina        2022-11-25   507  			mboxes = <&agx_mbox>;
31aa7b972f62e0 Asahi Lina        2022-11-25   508  			power-domains = <&ps_gfx>;
31aa7b972f62e0 Asahi Lina        2022-11-25   509  			memory-region = <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>;
31aa7b972f62e0 Asahi Lina        2022-11-25   510  			memory-region-names = "ttbs", "pagetables", "handoff";
31aa7b972f62e0 Asahi Lina        2022-11-25   511  
31aa7b972f62e0 Asahi Lina        2022-11-25   512  			apple,firmware-version = <12 4 0>;
31aa7b972f62e0 Asahi Lina        2022-11-25   513  			apple,firmware-compat = <12 4 0>;
31aa7b972f62e0 Asahi Lina        2022-11-25   514  
31aa7b972f62e0 Asahi Lina        2022-11-25   515  			operating-points-v2 = <&gpu_opp>;
31aa7b972f62e0 Asahi Lina        2022-11-25   516  			apple,perf-base-pstate = <1>;
31aa7b972f62e0 Asahi Lina        2022-11-25   517  			apple,min-sram-microvolt = <780000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   518  			apple,avg-power-filter-tc-ms = <300>;
31aa7b972f62e0 Asahi Lina        2022-11-25   519  			apple,avg-power-ki-only = <9.375>;
31aa7b972f62e0 Asahi Lina        2022-11-25   520  			apple,avg-power-kp = <3.22>;
31aa7b972f62e0 Asahi Lina        2022-11-25   521  			apple,avg-power-min-duty-cycle = <40>;
31aa7b972f62e0 Asahi Lina        2022-11-25   522  			apple,avg-power-target-filter-tc = <1>;
31aa7b972f62e0 Asahi Lina        2022-11-25   523  			apple,fast-die0-integral-gain = <200.0>;
31aa7b972f62e0 Asahi Lina        2022-11-25   524  			apple,fast-die0-proportional-gain = <5.0>;
31aa7b972f62e0 Asahi Lina        2022-11-25   525  			apple,perf-boost-ce-step = <50>;
31aa7b972f62e0 Asahi Lina        2022-11-25   526  			apple,perf-boost-min-util = <90>;
31aa7b972f62e0 Asahi Lina        2022-11-25   527  			apple,perf-filter-drop-threshold = <0>;
31aa7b972f62e0 Asahi Lina        2022-11-25   528  			apple,perf-filter-time-constant = <5>;
31aa7b972f62e0 Asahi Lina        2022-11-25   529  			apple,perf-filter-time-constant2 = <200>;
31aa7b972f62e0 Asahi Lina        2022-11-25   530  			apple,perf-integral-gain = <5.94>;
31aa7b972f62e0 Asahi Lina        2022-11-25   531  			apple,perf-integral-gain2 = <5.94>;
31aa7b972f62e0 Asahi Lina        2022-11-25   532  			apple,perf-integral-min-clamp = <0>;
31aa7b972f62e0 Asahi Lina        2022-11-25   533  			apple,perf-proportional-gain = <14.85>;
31aa7b972f62e0 Asahi Lina        2022-11-25   534  			apple,perf-proportional-gain2 = <14.85>;
31aa7b972f62e0 Asahi Lina        2022-11-25   535  			apple,perf-tgt-utilization = <85>;
31aa7b972f62e0 Asahi Lina        2022-11-25   536  			apple,power-sample-period = <8>;
31aa7b972f62e0 Asahi Lina        2022-11-25   537  			apple,ppm-filter-time-constant-ms = <34>;
31aa7b972f62e0 Asahi Lina        2022-11-25   538  			apple,ppm-ki = <205.0>;
31aa7b972f62e0 Asahi Lina        2022-11-25   539  			apple,ppm-kp = <0.75>;
31aa7b972f62e0 Asahi Lina        2022-11-25   540  			apple,pwr-min-duty-cycle = <40>;
31aa7b972f62e0 Asahi Lina        2022-11-25   541  			apple,core-leak-coef = <1920.0>;
31aa7b972f62e0 Asahi Lina        2022-11-25   542  			apple,sram-leak-coef = <74.0>;
31aa7b972f62e0 Asahi Lina        2022-11-25   543  		};
31aa7b972f62e0 Asahi Lina        2022-11-25   544  
31aa7b972f62e0 Asahi Lina        2022-11-25   545  		agx_mbox: mbox@206408000 {
31aa7b972f62e0 Asahi Lina        2022-11-25   546  			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
31aa7b972f62e0 Asahi Lina        2022-11-25   547  			reg = <0x2 0x6408000 0x0 0x4000>;
31aa7b972f62e0 Asahi Lina        2022-11-25   548  			interrupt-parent = <&aic>;
31aa7b972f62e0 Asahi Lina        2022-11-25   549  			interrupts = <AIC_IRQ 709 IRQ_TYPE_LEVEL_HIGH>,
31aa7b972f62e0 Asahi Lina        2022-11-25   550  				<AIC_IRQ 710 IRQ_TYPE_LEVEL_HIGH>,
31aa7b972f62e0 Asahi Lina        2022-11-25   551  				<AIC_IRQ 711 IRQ_TYPE_LEVEL_HIGH>,
31aa7b972f62e0 Asahi Lina        2022-11-25   552  				<AIC_IRQ 712 IRQ_TYPE_LEVEL_HIGH>;
31aa7b972f62e0 Asahi Lina        2022-11-25   553  			interrupt-names = "send-empty", "send-not-empty",
31aa7b972f62e0 Asahi Lina        2022-11-25   554  				"recv-empty", "recv-not-empty";
31aa7b972f62e0 Asahi Lina        2022-11-25   555  			#mbox-cells = <0>;
31aa7b972f62e0 Asahi Lina        2022-11-25   556  		};
31aa7b972f62e0 Asahi Lina        2022-11-25   557  
2d5ce3fbef3242 Hector Martin     2023-03-07   558  		cpufreq_e: cpufreq@210e20000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   559  			compatible = "apple,t8112-cluster-cpufreq", "apple,cluster-cpufreq";
2d5ce3fbef3242 Hector Martin     2023-03-07   560  			reg = <0x2 0x10e20000 0 0x1000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   561  			#performance-domain-cells = <0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   562  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   563  
2d5ce3fbef3242 Hector Martin     2023-03-07   564  		cpufreq_p: cpufreq@211e20000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   565  			compatible = "apple,t8112-cluster-cpufreq", "apple,cluster-cpufreq";
2d5ce3fbef3242 Hector Martin     2023-03-07   566  			reg = <0x2 0x11e20000 0 0x1000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   567  			#performance-domain-cells = <0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   568  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   569  
5c2897c843cbcc Janne Grunau      2023-04-15   570  		display_dfr: display-pipe@228200000 {
5c2897c843cbcc Janne Grunau      2023-04-15   571  			compatible = "apple,t8112-display-pipe", "apple,h7-display-pipe";
5c2897c843cbcc Janne Grunau      2023-04-15   572  			reg-names = "be", "fe", "mipi";
5c2897c843cbcc Janne Grunau      2023-04-15   573  			reg = <0x2 0x28200000 0x0 0xc000>,
5c2897c843cbcc Janne Grunau      2023-04-15   574  				<0x2 0x28400000 0x0 0x4000>,
5c2897c843cbcc Janne Grunau      2023-04-15   575  				<0x2 0x28600000 0x0 0x100000>;
5c2897c843cbcc Janne Grunau      2023-04-15   576  			power-domains = <&ps_dispdfr_fe>, <&ps_dispdfr_be>, <&ps_mipi_dsi>;
5c2897c843cbcc Janne Grunau      2023-04-15   577  			interrupt-parent = <&aic>;
5c2897c843cbcc Janne Grunau      2023-04-15   578  			interrupts = <AIC_IRQ 614 IRQ_TYPE_LEVEL_HIGH>,
5c2897c843cbcc Janne Grunau      2023-04-15   579  				<AIC_IRQ 618 IRQ_TYPE_LEVEL_HIGH>;
5c2897c843cbcc Janne Grunau      2023-04-15   580  			interrupt-names = "be", "fe";
5c2897c843cbcc Janne Grunau      2023-04-15   581  			status = "disabled";
5c2897c843cbcc Janne Grunau      2023-04-15   582  			iommus = <&displaydfr_dart 0>;
5c2897c843cbcc Janne Grunau      2023-04-15   583  		};
5c2897c843cbcc Janne Grunau      2023-04-15   584  
5c2897c843cbcc Janne Grunau      2023-04-15   585  		displaydfr_dart: iommu@228304000 {
5c2897c843cbcc Janne Grunau      2023-04-15   586  			compatible = "apple,t8110-dart";
5c2897c843cbcc Janne Grunau      2023-04-15   587  			reg = <0x2 0x28304000 0x0 0x4000>;
5c2897c843cbcc Janne Grunau      2023-04-15   588  			interrupt-parent = <&aic>;
5c2897c843cbcc Janne Grunau      2023-04-15   589  			interrupts = <AIC_IRQ 616 IRQ_TYPE_LEVEL_HIGH>;
5c2897c843cbcc Janne Grunau      2023-04-15   590  			#iommu-cells = <1>;
5c2897c843cbcc Janne Grunau      2023-04-15   591  			power-domains = <&ps_dispdfr_fe>;
5c2897c843cbcc Janne Grunau      2023-04-15   592  			status = "disabled";
5c2897c843cbcc Janne Grunau      2023-04-15   593  		};
5c2897c843cbcc Janne Grunau      2023-04-15   594  
6bf54c0f30cb21 Hector Martin     2023-09-08   595  		isp_dart0: iommu@22c4a8000 {
6bf54c0f30cb21 Hector Martin     2023-09-08   596  			compatible = "apple,t8110-dart";
6bf54c0f30cb21 Hector Martin     2023-09-08   597  			reg = <0x2 0x2c4a8000 0x0 0x4000>;
6bf54c0f30cb21 Hector Martin     2023-09-08   598  			#iommu-cells = <1>;
6bf54c0f30cb21 Hector Martin     2023-09-08   599  			interrupt-parent = <&aic>;
6bf54c0f30cb21 Hector Martin     2023-09-08   600  			interrupts = <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>;
6bf54c0f30cb21 Hector Martin     2023-09-08   601  			power-domains = <&ps_isp_sys>;
6bf54c0f30cb21 Hector Martin     2023-09-08   602  			status = "disabled";
6bf54c0f30cb21 Hector Martin     2023-09-08   603  		};
6bf54c0f30cb21 Hector Martin     2023-09-08   604  
6bf54c0f30cb21 Hector Martin     2023-09-08   605  		isp_dart1: iommu@22c4b4000 {
6bf54c0f30cb21 Hector Martin     2023-09-08   606  			compatible = "apple,t8110-dart";
6bf54c0f30cb21 Hector Martin     2023-09-08   607  			reg = <0x2 0x2c4b4000 0x0 0x4000>;
6bf54c0f30cb21 Hector Martin     2023-09-08   608  			#iommu-cells = <1>;
6bf54c0f30cb21 Hector Martin     2023-09-08   609  			interrupt-parent = <&aic>;
6bf54c0f30cb21 Hector Martin     2023-09-08   610  			interrupts = <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>;
6bf54c0f30cb21 Hector Martin     2023-09-08   611  			power-domains = <&ps_isp_sys>;
6bf54c0f30cb21 Hector Martin     2023-09-08   612  			status = "disabled";
6bf54c0f30cb21 Hector Martin     2023-09-08   613  		};
6bf54c0f30cb21 Hector Martin     2023-09-08   614  
6bf54c0f30cb21 Hector Martin     2023-09-08   615  		isp_dart2: iommu@22c4bc000 {
6bf54c0f30cb21 Hector Martin     2023-09-08   616  			compatible = "apple,t8110-dart";
6bf54c0f30cb21 Hector Martin     2023-09-08   617  			reg = <0x2 0x2c4bc000 0x0 0x4000>;
6bf54c0f30cb21 Hector Martin     2023-09-08   618  			#iommu-cells = <1>;
6bf54c0f30cb21 Hector Martin     2023-09-08   619  			interrupt-parent = <&aic>;
6bf54c0f30cb21 Hector Martin     2023-09-08   620  			interrupts = <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>;
6bf54c0f30cb21 Hector Martin     2023-09-08   621  			power-domains = <&ps_isp_sys>;
6bf54c0f30cb21 Hector Martin     2023-09-08   622  			status = "disabled";
6bf54c0f30cb21 Hector Martin     2023-09-08   623  		};
6bf54c0f30cb21 Hector Martin     2023-09-08   624  
6bf54c0f30cb21 Hector Martin     2023-09-08   625  		isp: isp@22a000000 {
6bf54c0f30cb21 Hector Martin     2023-09-08   626  			compatible = "apple,t8112-isp", "apple,isp";
6bf54c0f30cb21 Hector Martin     2023-09-08   627  			iommus = <&isp_dart0 0>, <&isp_dart1 0>, <&isp_dart2 0>;
6bf54c0f30cb21 Hector Martin     2023-09-08   628  			reg-names = "coproc", "mbox", "gpio", "mbox2";
6bf54c0f30cb21 Hector Martin     2023-09-08   629  			reg = <0x2 0x2a000000 0x0 0x2000000>,
6bf54c0f30cb21 Hector Martin     2023-09-08   630  				<0x2 0x2c4c4000 0x0 0x100>,
6bf54c0f30cb21 Hector Martin     2023-09-08   631  				<0x2 0x2c4c41b0 0x0 0x100>,
6bf54c0f30cb21 Hector Martin     2023-09-08   632  				<0x2 0x2c4c4430 0x0 0x100>;
6bf54c0f30cb21 Hector Martin     2023-09-08   633  			interrupt-parent = <&aic>;
6bf54c0f30cb21 Hector Martin     2023-09-08   634  			interrupts = <AIC_IRQ 269 IRQ_TYPE_LEVEL_HIGH>;
6bf54c0f30cb21 Hector Martin     2023-09-08   635  			power-domains = <&ps_isp_sys>, <&ps_isp_set0>,
6bf54c0f30cb21 Hector Martin     2023-09-08   636  				<&ps_isp_set1>, <&ps_isp_set2>, <&ps_isp_fe>,
6bf54c0f30cb21 Hector Martin     2023-09-08   637  				<&ps_isp_set4>, <&ps_isp_set5>, <&ps_isp_set6>,
6bf54c0f30cb21 Hector Martin     2023-09-08   638  				<&ps_isp_set7>, <&ps_isp_set8>, <&ps_isp_set9>,
6bf54c0f30cb21 Hector Martin     2023-09-08   639  				<&ps_isp_set10>, <&ps_isp_set11>,
6bf54c0f30cb21 Hector Martin     2023-09-08   640  				<&ps_isp_set12>;
6bf54c0f30cb21 Hector Martin     2023-09-08   641  
6bf54c0f30cb21 Hector Martin     2023-09-08   642  			apple,dart-vm-size = <0x0 0xa0000000>;
6bf54c0f30cb21 Hector Martin     2023-09-08   643  			status = "disabled";
6bf54c0f30cb21 Hector Martin     2023-09-08   644  		};
6bf54c0f30cb21 Hector Martin     2023-09-08   645  
f68bb847349e41 Janne Grunau      2022-11-20   646  		disp0_dart: iommu@231304000 {
f68bb847349e41 Janne Grunau      2022-11-20   647  			compatible = "apple,t8112-dart", "apple,t8110-dart";
f68bb847349e41 Janne Grunau      2022-11-20   648  			reg = <0x2 0x31304000 0x0 0x4000>;
f68bb847349e41 Janne Grunau      2022-11-20   649  			#iommu-cells = <1>;
f68bb847349e41 Janne Grunau      2022-11-20   650  			interrupt-parent = <&aic>;
f68bb847349e41 Janne Grunau      2022-11-20   651  			interrupts = <AIC_IRQ 553 IRQ_TYPE_LEVEL_HIGH>;
e92dfa56e24764 Hector Martin     2022-12-13   652  			power-domains = <&ps_disp0_cpu0>;
0d58d372232e27 Janne Grunau      2023-11-06   653  			apple,dma-range = <0x0 0x0 0xf 0xffff0000>;
f68bb847349e41 Janne Grunau      2022-11-20   654  			status = "disabled";
f68bb847349e41 Janne Grunau      2022-11-20   655  		};
f68bb847349e41 Janne Grunau      2022-11-20   656  
f68bb847349e41 Janne Grunau      2022-11-20   657  		dcp_dart: iommu@23130c000 {
f68bb847349e41 Janne Grunau      2022-11-20   658  			compatible = "apple,t8112-dart", "apple,t8110-dart";
f68bb847349e41 Janne Grunau      2022-11-20   659  			reg = <0x2 0x3130c000 0x0 0x4000>;
f68bb847349e41 Janne Grunau      2022-11-20   660  			#iommu-cells = <1>;
f68bb847349e41 Janne Grunau      2022-11-20   661  			interrupt-parent = <&aic>;
f68bb847349e41 Janne Grunau      2022-11-20   662  			interrupts = <AIC_IRQ 553 IRQ_TYPE_LEVEL_HIGH>;
e92dfa56e24764 Hector Martin     2022-12-13   663  			power-domains = <&ps_disp0_cpu0>;
0d58d372232e27 Janne Grunau      2023-11-06   664  			apple,dma-range = <0x8 0x00000000 0x7 0xffff0000>;
f68bb847349e41 Janne Grunau      2022-11-20   665  		};
f68bb847349e41 Janne Grunau      2022-11-20   666  
f68bb847349e41 Janne Grunau      2022-11-20   667  		dcp_mbox: mbox@231c08000 {
f68bb847349e41 Janne Grunau      2022-11-20   668  			compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
f68bb847349e41 Janne Grunau      2022-11-20   669  			reg = <0x2 0x31c08000 0x0 0x4000>;
f68bb847349e41 Janne Grunau      2022-11-20   670  			interrupt-parent = <&aic>;
f68bb847349e41 Janne Grunau      2022-11-20   671  			interrupts = <AIC_IRQ 535 IRQ_TYPE_LEVEL_HIGH>,
f68bb847349e41 Janne Grunau      2022-11-20   672  				<AIC_IRQ 536 IRQ_TYPE_LEVEL_HIGH>,
f68bb847349e41 Janne Grunau      2022-11-20   673  				<AIC_IRQ 537 IRQ_TYPE_LEVEL_HIGH>,
f68bb847349e41 Janne Grunau      2022-11-20   674  				<AIC_IRQ 538 IRQ_TYPE_LEVEL_HIGH>;
f68bb847349e41 Janne Grunau      2022-11-20   675  			interrupt-names = "send-empty", "send-not-empty",
f68bb847349e41 Janne Grunau      2022-11-20   676  				"recv-empty", "recv-not-empty";
f68bb847349e41 Janne Grunau      2022-11-20   677  			#mbox-cells = <0>;
f68bb847349e41 Janne Grunau      2022-11-20   678  			power-domains = <&ps_disp0_cpu0>;
f68bb847349e41 Janne Grunau      2022-11-20   679  			resets = <&ps_disp0_cpu0>;
f68bb847349e41 Janne Grunau      2022-11-20   680  		};
f68bb847349e41 Janne Grunau      2022-11-20   681  
f68bb847349e41 Janne Grunau      2022-11-20  @682  		dcp: dcp@231c00000 {
f68bb847349e41 Janne Grunau      2022-11-20   683  			compatible = "apple,t8112-dcp", "apple,dcp";
f68bb847349e41 Janne Grunau      2022-11-20   684  			mboxes = <&dcp_mbox>;
f68bb847349e41 Janne Grunau      2022-11-20   685  			mbox-names = "mbox";
f68bb847349e41 Janne Grunau      2022-11-20   686  			iommus = <&dcp_dart 5>;
f68bb847349e41 Janne Grunau      2022-11-20   687  
f68bb847349e41 Janne Grunau      2022-11-20   688  			/* the ADT has 2 additional regs which seems to be unused */
f68bb847349e41 Janne Grunau      2022-11-20   689  			reg-names = "coproc", "disp-0", "disp-1", "disp-2", "disp-3";
f68bb847349e41 Janne Grunau      2022-11-20   690  			reg = <0x2 0x31c00000 0x0 0x4000>,
f68bb847349e41 Janne Grunau      2022-11-20   691  				<0x2 0x30000000 0x0 0x61c000>,
f68bb847349e41 Janne Grunau      2022-11-20   692  				<0x2 0x31320000 0x0 0x4000>,
f68bb847349e41 Janne Grunau      2022-11-20   693  				<0x2 0x31344000 0x0 0x4000>,
f68bb847349e41 Janne Grunau      2022-11-20   694  				<0x2 0x31800000 0x0 0x800000>;
f68bb847349e41 Janne Grunau      2022-11-20   695  			apple,bw-scratch = <&pmgr_dcp 0 4 0x5d8>;
f68bb847349e41 Janne Grunau      2022-11-20   696  			power-domains = <&ps_disp0_cpu0>;
79fda36392622c Janne Grunau      2023-01-09   697  			resets = <&ps_disp0_cpu0>;
f68bb847349e41 Janne Grunau      2022-11-20   698  			clocks = <&clk_disp0>;
f68bb847349e41 Janne Grunau      2022-11-20   699  			phandle = <&dcp>;
d93249b760cdee Janne Grunau      2025-02-09   700  			// required bus properties for 'piodma' subdevice
d93249b760cdee Janne Grunau      2025-02-09   701  			#address-cells = <2>;
d93249b760cdee Janne Grunau      2025-02-09   702  			#size-cells = <2>;
f68bb847349e41 Janne Grunau      2022-11-20   703  
f68bb847349e41 Janne Grunau      2022-11-20   704  			disp0_piodma: piodma {
f68bb847349e41 Janne Grunau      2022-11-20   705  				iommus = <&disp0_dart 4>;
f68bb847349e41 Janne Grunau      2022-11-20   706  				phandle = <&disp0_piodma>;
f68bb847349e41 Janne Grunau      2022-11-20   707  			};
9227eb64b4ab27 Janne Grunau      2023-11-13   708  
9227eb64b4ab27 Janne Grunau      2023-11-13   709  			ports {
9227eb64b4ab27 Janne Grunau      2023-11-13   710  				#address-cells = <1>;
9227eb64b4ab27 Janne Grunau      2023-11-13   711  				#size-cells = <0>;
9227eb64b4ab27 Janne Grunau      2023-11-13   712  				port@0 {
9227eb64b4ab27 Janne Grunau      2023-11-13   713  					reg = <0>;
9227eb64b4ab27 Janne Grunau      2023-11-13   714  					dcp_audio: endpoint {
9227eb64b4ab27 Janne Grunau      2023-11-13   715  						remote-endpoint = <&dpaudio0_dcp>;
9227eb64b4ab27 Janne Grunau      2023-11-13   716  					};
9227eb64b4ab27 Janne Grunau      2023-11-13   717  				};
9227eb64b4ab27 Janne Grunau      2023-11-13   718  			};
f68bb847349e41 Janne Grunau      2022-11-20   719  		};
f68bb847349e41 Janne Grunau      2022-11-20   720  
f68bb847349e41 Janne Grunau      2022-11-20   721  		display: display-subsystem {
f68bb847349e41 Janne Grunau      2022-11-20   722  			compatible = "apple,display-subsystem";
f68bb847349e41 Janne Grunau      2022-11-20   723  			/* disp_dart0 must be 1st since it is locked */
f68bb847349e41 Janne Grunau      2022-11-20   724  			iommus = <&disp0_dart 0>;
f68bb847349e41 Janne Grunau      2022-11-20   725  			/* generate phandle explicitly for use in loader */
f68bb847349e41 Janne Grunau      2022-11-20   726  			phandle = <&display>;
f68bb847349e41 Janne Grunau      2022-11-20   727  		};
f68bb847349e41 Janne Grunau      2022-11-20   728  
2d5ce3fbef3242 Hector Martin     2023-03-07   729  		sio_dart: iommu@235004000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   730  			compatible = "apple,t8110-dart";
2d5ce3fbef3242 Hector Martin     2023-03-07   731  			reg = <0x2 0x35004000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   732  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   733  			interrupts = <AIC_IRQ 769 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   734  			#iommu-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   735  			power-domains = <&ps_sio_cpu>;
2d5ce3fbef3242 Hector Martin     2023-03-07   736  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   737  
2d5ce3fbef3242 Hector Martin     2023-03-07   738  		i2c0: i2c@235010000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   739  			compatible = "apple,t8112-i2c", "apple,i2c";
2d5ce3fbef3242 Hector Martin     2023-03-07   740  			reg = <0x2 0x35010000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   741  			clocks = <&clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   742  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   743  			interrupts = <AIC_IRQ 761 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   744  			pinctrl-0 = <&i2c0_pins>;
2d5ce3fbef3242 Hector Martin     2023-03-07   745  			pinctrl-names = "default";
2d5ce3fbef3242 Hector Martin     2023-03-07   746  			#address-cells = <0x1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   747  			#size-cells = <0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   748  			power-domains = <&ps_i2c0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   749  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07   750  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   751  
2d5ce3fbef3242 Hector Martin     2023-03-07   752  		i2c1: i2c@235014000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   753  			compatible = "apple,t8112-i2c", "apple,i2c";
2d5ce3fbef3242 Hector Martin     2023-03-07   754  			reg = <0x2 0x35014000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   755  			clocks = <&clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   756  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   757  			interrupts = <AIC_IRQ 762 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   758  			pinctrl-0 = <&i2c1_pins>;
2d5ce3fbef3242 Hector Martin     2023-03-07   759  			pinctrl-names = "default";
2d5ce3fbef3242 Hector Martin     2023-03-07   760  			#address-cells = <0x1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   761  			#size-cells = <0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   762  			power-domains = <&ps_i2c1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   763  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07   764  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   765  
2d5ce3fbef3242 Hector Martin     2023-03-07   766  		i2c2: i2c@235018000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   767  			compatible = "apple,t8112-i2c", "apple,i2c";
2d5ce3fbef3242 Hector Martin     2023-03-07   768  			reg = <0x2 0x35018000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   769  			clocks = <&clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   770  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   771  			interrupts = <AIC_IRQ 763 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   772  			pinctrl-0 = <&i2c2_pins>;
2d5ce3fbef3242 Hector Martin     2023-03-07   773  			pinctrl-names = "default";
2d5ce3fbef3242 Hector Martin     2023-03-07   774  			#address-cells = <0x1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   775  			#size-cells = <0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   776  			power-domains = <&ps_i2c2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   777  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07   778  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   779  
2d5ce3fbef3242 Hector Martin     2023-03-07   780  		i2c3: i2c@23501c000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   781  			compatible = "apple,t8112-i2c", "apple,i2c";
2d5ce3fbef3242 Hector Martin     2023-03-07   782  			reg = <0x2 0x3501c000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   783  			clocks = <&clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   784  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   785  			interrupts = <AIC_IRQ 764 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   786  			pinctrl-0 = <&i2c3_pins>;
2d5ce3fbef3242 Hector Martin     2023-03-07   787  			pinctrl-names = "default";
2d5ce3fbef3242 Hector Martin     2023-03-07   788  			#address-cells = <0x1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   789  			#size-cells = <0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   790  			power-domains = <&ps_i2c3>;
2d5ce3fbef3242 Hector Martin     2023-03-07   791  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07   792  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   793  
2d5ce3fbef3242 Hector Martin     2023-03-07   794  		i2c4: i2c@235020000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   795  			compatible = "apple,t8112-i2c", "apple,i2c";
2d5ce3fbef3242 Hector Martin     2023-03-07   796  			reg = <0x2 0x35020000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   797  			clocks = <&clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   798  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   799  			interrupts = <AIC_IRQ 765 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   800  			pinctrl-0 = <&i2c4_pins>;
2d5ce3fbef3242 Hector Martin     2023-03-07   801  			pinctrl-names = "default";
2d5ce3fbef3242 Hector Martin     2023-03-07   802  			#address-cells = <0x1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   803  			#size-cells = <0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   804  			power-domains = <&ps_i2c4>;
2d5ce3fbef3242 Hector Martin     2023-03-07   805  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07   806  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   807  
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   808  		fpwm1: pwm@235044000 {
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   809  			compatible = "apple,t8112-fpwm", "apple,s5l-fpwm";
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   810  			reg = <0x2 0x35044000 0x0 0x4000>;
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   811  			power-domains = <&ps_fpwm1>;
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   812  			clocks = <&clkref>;
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   813  			#pwm-cells = <2>;
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   814  			status = "disabled";
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   815  		};
50aa09ac18fac9 Sasha Finkelstein 2023-04-09   816  
e7d8ca798ffe2f Janne Grunau      2023-02-02   817  		spi1: spi@235104000 {
e7d8ca798ffe2f Janne Grunau      2023-02-02   818  			compatible = "apple,t8112-spi", "apple,spi";
e7d8ca798ffe2f Janne Grunau      2023-02-02   819  			reg = <0x2 0x35104000 0x0 0x4000>;
e7d8ca798ffe2f Janne Grunau      2023-02-02   820  			interrupt-parent = <&aic>;
e7d8ca798ffe2f Janne Grunau      2023-02-02   821  			interrupts = <AIC_IRQ 749 IRQ_TYPE_LEVEL_HIGH>;
e7d8ca798ffe2f Janne Grunau      2023-02-02   822  			clocks = <&clk_200m>;
e7d8ca798ffe2f Janne Grunau      2023-02-02   823  			pinctrl-0 = <&spi1_pins>;
e7d8ca798ffe2f Janne Grunau      2023-02-02   824  			pinctrl-names = "default";
e7d8ca798ffe2f Janne Grunau      2023-02-02   825  			power-domains = <&ps_spi1>;
e7d8ca798ffe2f Janne Grunau      2023-02-02   826  			#address-cells = <1>;
e7d8ca798ffe2f Janne Grunau      2023-02-02   827  			#size-cells = <0>;
e7d8ca798ffe2f Janne Grunau      2023-02-02   828  			status = "disabled";
e7d8ca798ffe2f Janne Grunau      2023-02-02   829  		};
e7d8ca798ffe2f Janne Grunau      2023-02-02   830  
e7d8ca798ffe2f Janne Grunau      2023-02-02   831  		spi3: spi@23510c000 {
e7d8ca798ffe2f Janne Grunau      2023-02-02   832  			compatible = "apple,t8112-spi", "apple,spi";
e7d8ca798ffe2f Janne Grunau      2023-02-02   833  			reg = <0x2 0x3510c000 0x0 0x4000>;
e7d8ca798ffe2f Janne Grunau      2023-02-02   834  			interrupt-parent = <&aic>;
e7d8ca798ffe2f Janne Grunau      2023-02-02   835  			interrupts = <AIC_IRQ 751 IRQ_TYPE_LEVEL_HIGH>;
e7d8ca798ffe2f Janne Grunau      2023-02-02   836  			clocks = <&clkref>;
e7d8ca798ffe2f Janne Grunau      2023-02-02   837  			pinctrl-0 = <&spi3_pins>;
e7d8ca798ffe2f Janne Grunau      2023-02-02   838  			pinctrl-names = "default";
e7d8ca798ffe2f Janne Grunau      2023-02-02   839  			power-domains = <&ps_spi3>;
e7d8ca798ffe2f Janne Grunau      2023-02-02   840  			#address-cells = <1>;
e7d8ca798ffe2f Janne Grunau      2023-02-02   841  			#size-cells = <0>;
e7d8ca798ffe2f Janne Grunau      2023-02-02   842  			status = "disabled";
e7d8ca798ffe2f Janne Grunau      2023-02-02   843  		};
e7d8ca798ffe2f Janne Grunau      2023-02-02   844  
2d5ce3fbef3242 Hector Martin     2023-03-07   845  		serial0: serial@235200000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   846  			compatible = "apple,s5l-uart";
2d5ce3fbef3242 Hector Martin     2023-03-07   847  			reg = <0x2 0x35200000 0x0 0x1000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   848  			reg-io-width = <4>;
2d5ce3fbef3242 Hector Martin     2023-03-07   849  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   850  			interrupts = <AIC_IRQ 739 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   851  			/*
2d5ce3fbef3242 Hector Martin     2023-03-07   852  			 * TODO: figure out the clocking properly, there may
2d5ce3fbef3242 Hector Martin     2023-03-07   853  			 * be a third selectable clock.
2d5ce3fbef3242 Hector Martin     2023-03-07   854  			 */
2d5ce3fbef3242 Hector Martin     2023-03-07   855  			clocks = <&clkref>, <&clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   856  			clock-names = "uart", "clk_uart_baud0";
2d5ce3fbef3242 Hector Martin     2023-03-07   857  			power-domains = <&ps_uart0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   858  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07   859  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   860  
2d5ce3fbef3242 Hector Martin     2023-03-07   861  		serial2: serial@235208000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   862  			compatible = "apple,s5l-uart";
2d5ce3fbef3242 Hector Martin     2023-03-07   863  			reg = <0x2 0x35208000 0x0 0x1000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   864  			reg-io-width = <4>;
2d5ce3fbef3242 Hector Martin     2023-03-07   865  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   866  			interrupts = <AIC_IRQ 741 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   867  			clocks = <&clkref>, <&clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   868  			clock-names = "uart", "clk_uart_baud0";
2d5ce3fbef3242 Hector Martin     2023-03-07   869  			power-domains = <&ps_uart2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   870  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07   871  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   872  
9227eb64b4ab27 Janne Grunau      2023-11-13   873  		sio_mbox: mbox@236408000 {
9227eb64b4ab27 Janne Grunau      2023-11-13   874  			compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
9227eb64b4ab27 Janne Grunau      2023-11-13   875  			reg = <0x2 0x36408000 0x0 0x4000>;
9227eb64b4ab27 Janne Grunau      2023-11-13   876  			interrupt-parent = <&aic>;
9227eb64b4ab27 Janne Grunau      2023-11-13   877  			interrupts = <AIC_IRQ 774 IRQ_TYPE_LEVEL_HIGH>,
9227eb64b4ab27 Janne Grunau      2023-11-13   878  				<AIC_IRQ 775 IRQ_TYPE_LEVEL_HIGH>,
9227eb64b4ab27 Janne Grunau      2023-11-13   879  				<AIC_IRQ 776 IRQ_TYPE_LEVEL_HIGH>,
9227eb64b4ab27 Janne Grunau      2023-11-13   880  				<AIC_IRQ 777 IRQ_TYPE_LEVEL_HIGH>;
9227eb64b4ab27 Janne Grunau      2023-11-13   881  			interrupt-names = "send-empty", "send-not-empty",
9227eb64b4ab27 Janne Grunau      2023-11-13   882  				"recv-empty", "recv-not-empty";
9227eb64b4ab27 Janne Grunau      2023-11-13   883  			#mbox-cells = <0>;
9227eb64b4ab27 Janne Grunau      2023-11-13   884  			power-domains = <&ps_sio_cpu>;
9227eb64b4ab27 Janne Grunau      2023-11-13   885  		};
9227eb64b4ab27 Janne Grunau      2023-11-13   886  
9227eb64b4ab27 Janne Grunau      2023-11-13   887  		sio: sio@236400000 {
9227eb64b4ab27 Janne Grunau      2023-11-13   888  			compatible = "apple,t8112-sio", "apple,sio";
9227eb64b4ab27 Janne Grunau      2023-11-13   889  			reg = <0x2 0x36400000 0x0 0x8000>;
9227eb64b4ab27 Janne Grunau      2023-11-13   890  			dma-channels = <128>;
9227eb64b4ab27 Janne Grunau      2023-11-13   891  			#dma-cells = <1>;
9227eb64b4ab27 Janne Grunau      2023-11-13   892  			mboxes = <&sio_mbox>;
9227eb64b4ab27 Janne Grunau      2023-11-13   893  			iommus = <&sio_dart 0>;
9227eb64b4ab27 Janne Grunau      2023-11-13   894  			power-domains = <&ps_sio_cpu>;
9227eb64b4ab27 Janne Grunau      2023-11-13   895  			resets = <&ps_sio>; /* TODO: verify reset does something */
9227eb64b4ab27 Janne Grunau      2023-11-13   896  			status = "disabled";
9227eb64b4ab27 Janne Grunau      2023-11-13   897  		};
9227eb64b4ab27 Janne Grunau      2023-11-13   898  
2d5ce3fbef3242 Hector Martin     2023-03-07   899  		admac: dma-controller@238200000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   900  			compatible = "apple,t8112-admac", "apple,admac";
2d5ce3fbef3242 Hector Martin     2023-03-07   901  			reg = <0x2 0x38200000 0x0 0x34000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   902  			dma-channels = <24>;
2d5ce3fbef3242 Hector Martin     2023-03-07   903  			interrupts-extended = <0>,
2d5ce3fbef3242 Hector Martin     2023-03-07   904  					      <&aic AIC_IRQ 760 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   905  					      <0>,
2d5ce3fbef3242 Hector Martin     2023-03-07   906  					      <0>;
2d5ce3fbef3242 Hector Martin     2023-03-07   907  			#dma-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   908  			iommus = <&sio_dart 2>;
2d5ce3fbef3242 Hector Martin     2023-03-07   909  			power-domains = <&ps_sio_adma>;
2d5ce3fbef3242 Hector Martin     2023-03-07   910  			resets = <&ps_audio_p>;
2d5ce3fbef3242 Hector Martin     2023-03-07   911  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   912  
9227eb64b4ab27 Janne Grunau      2023-11-13   913  		dpaudio0: audio-controller@238330000 {
9227eb64b4ab27 Janne Grunau      2023-11-13   914  			compatible = "apple,t8112-dpaudio", "apple,dpaudio";
9227eb64b4ab27 Janne Grunau      2023-11-13   915  			reg = <0x2 0x38330000 0x0 0x4000>;
9227eb64b4ab27 Janne Grunau      2023-11-13   916  			dmas = <&sio 0x64>;
9227eb64b4ab27 Janne Grunau      2023-11-13   917  			dma-names = "tx";
9227eb64b4ab27 Janne Grunau      2023-11-13   918  			power-domains = <&ps_dpa0>;
9227eb64b4ab27 Janne Grunau      2023-11-13   919  			reset-domains = <&ps_dpa0>;
9227eb64b4ab27 Janne Grunau      2023-11-13   920  			status = "disabled";
9227eb64b4ab27 Janne Grunau      2023-11-13   921  
9227eb64b4ab27 Janne Grunau      2023-11-13   922  			ports {
9227eb64b4ab27 Janne Grunau      2023-11-13   923  				#address-cells = <1>;
9227eb64b4ab27 Janne Grunau      2023-11-13   924  				#size-cells = <0>;
9227eb64b4ab27 Janne Grunau      2023-11-13   925  				port@0 {
9227eb64b4ab27 Janne Grunau      2023-11-13   926  					reg = <0>;
9227eb64b4ab27 Janne Grunau      2023-11-13   927  					dpaudio0_dcp: endpoint {
9227eb64b4ab27 Janne Grunau      2023-11-13   928  						remote-endpoint = <&dcp_audio>;
9227eb64b4ab27 Janne Grunau      2023-11-13   929  					};
9227eb64b4ab27 Janne Grunau      2023-11-13   930  				};
9227eb64b4ab27 Janne Grunau      2023-11-13   931  			};
9227eb64b4ab27 Janne Grunau      2023-11-13   932  		};
9227eb64b4ab27 Janne Grunau      2023-11-13   933  
9227eb64b4ab27 Janne Grunau      2023-11-13   934  		dpaudio1: audio-controller@238334000 {
9227eb64b4ab27 Janne Grunau      2023-11-13   935  			compatible = "apple,t8112-dpaudio", "apple,dpaudio";
9227eb64b4ab27 Janne Grunau      2023-11-13   936  			reg = <0x2 0x38334000 0x0 0x4000>;
9227eb64b4ab27 Janne Grunau      2023-11-13   937  			dmas = <&sio 0x66>;
9227eb64b4ab27 Janne Grunau      2023-11-13   938  			dma-names = "tx";
9227eb64b4ab27 Janne Grunau      2023-11-13   939  			power-domains = <&ps_dpa1>;
9227eb64b4ab27 Janne Grunau      2023-11-13   940  			reset-domains = <&ps_dpa1>;
9227eb64b4ab27 Janne Grunau      2023-11-13   941  			status = "disabled";
9227eb64b4ab27 Janne Grunau      2023-11-13   942  
9227eb64b4ab27 Janne Grunau      2023-11-13   943  			ports {
9227eb64b4ab27 Janne Grunau      2023-11-13   944  				#address-cells = <1>;
9227eb64b4ab27 Janne Grunau      2023-11-13   945  				#size-cells = <0>;
9227eb64b4ab27 Janne Grunau      2023-11-13   946  				port@0 {
9227eb64b4ab27 Janne Grunau      2023-11-13   947  					reg = <0>;
9227eb64b4ab27 Janne Grunau      2023-11-13   948  					dpaudio1_dcp: endpoint {
9227eb64b4ab27 Janne Grunau      2023-11-13   949  						remote-endpoint = <&dcpext_audio>;
9227eb64b4ab27 Janne Grunau      2023-11-13   950  					};
9227eb64b4ab27 Janne Grunau      2023-11-13   951  				};
9227eb64b4ab27 Janne Grunau      2023-11-13   952  			};
9227eb64b4ab27 Janne Grunau      2023-11-13   953  		};
9227eb64b4ab27 Janne Grunau      2023-11-13   954  
2d5ce3fbef3242 Hector Martin     2023-03-07   955  		mca: i2s@238400000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   956  			compatible = "apple,t8112-mca", "apple,mca";
2d5ce3fbef3242 Hector Martin     2023-03-07   957  			reg = <0x2 0x38400000 0x0 0x18000>,
2d5ce3fbef3242 Hector Martin     2023-03-07   958  			      <0x2 0x38300000 0x0 0x30000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   959  
2d5ce3fbef3242 Hector Martin     2023-03-07   960  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07   961  			interrupts = <AIC_IRQ 753 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   962  				     <AIC_IRQ 754 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   963  				     <AIC_IRQ 755 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   964  				     <AIC_IRQ 756 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   965  				     <AIC_IRQ 757 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07   966  				     <AIC_IRQ 758 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07   967  
2d5ce3fbef3242 Hector Martin     2023-03-07   968  			resets = <&ps_audio_p>;
2d5ce3fbef3242 Hector Martin     2023-03-07   969  			clocks = <&nco 0>, <&nco 1>, <&nco 2>,
2d5ce3fbef3242 Hector Martin     2023-03-07   970  				 <&nco 3>, <&nco 4>, <&nco 4>;
2d5ce3fbef3242 Hector Martin     2023-03-07   971  			power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
2d5ce3fbef3242 Hector Martin     2023-03-07   972  					<&ps_mca2>, <&ps_mca3>, <&ps_mca4>, <&ps_mca5>;
2d5ce3fbef3242 Hector Martin     2023-03-07   973  			dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
2d5ce3fbef3242 Hector Martin     2023-03-07   974  			       <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
2d5ce3fbef3242 Hector Martin     2023-03-07   975  			       <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
2d5ce3fbef3242 Hector Martin     2023-03-07   976  			       <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>,
2d5ce3fbef3242 Hector Martin     2023-03-07   977  			       <&admac 16>, <&admac 17>, <&admac 18>, <&admac 19>,
2d5ce3fbef3242 Hector Martin     2023-03-07   978  			       <&admac 20>, <&admac 21>, <&admac 22>, <&admac 23>;
2d5ce3fbef3242 Hector Martin     2023-03-07   979  			dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
2d5ce3fbef3242 Hector Martin     2023-03-07   980  				    "tx1a", "rx1a", "tx1b", "rx1b",
2d5ce3fbef3242 Hector Martin     2023-03-07   981  				    "tx2a", "rx2a", "tx2b", "rx2b",
2d5ce3fbef3242 Hector Martin     2023-03-07   982  				    "tx3a", "rx3a", "tx3b", "rx3b",
2d5ce3fbef3242 Hector Martin     2023-03-07   983  				    "tx4a", "rx4a", "tx4b", "rx4b",
2d5ce3fbef3242 Hector Martin     2023-03-07   984  				    "tx5a", "rx5a", "tx5b", "rx5b";
2d5ce3fbef3242 Hector Martin     2023-03-07   985  
2d5ce3fbef3242 Hector Martin     2023-03-07   986  			#sound-dai-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   987  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   988  
2d5ce3fbef3242 Hector Martin     2023-03-07   989  		nco: clock-controller@23b044000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   990  			compatible = "apple,t8112-nco", "apple,nco";
2d5ce3fbef3242 Hector Martin     2023-03-07   991  			reg = <0x2 0x3b044000 0x0 0x14000>;
2d5ce3fbef3242 Hector Martin     2023-03-07   992  			clocks = <&nco_clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07   993  			#clock-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07   994  		};
2d5ce3fbef3242 Hector Martin     2023-03-07   995  
2d5ce3fbef3242 Hector Martin     2023-03-07   996  		aic: interrupt-controller@23b0c0000 {
2d5ce3fbef3242 Hector Martin     2023-03-07   997  			compatible = "apple,t8112-aic", "apple,aic2";
2d5ce3fbef3242 Hector Martin     2023-03-07   998  			#interrupt-cells = <3>;
2d5ce3fbef3242 Hector Martin     2023-03-07   999  			interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1000  			reg = <0x2 0x3b0c0000 0x0 0x8000>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1001  				<0x2 0x3b0c8000 0x0 0x4>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1002  			reg-names = "core", "event";
2d5ce3fbef3242 Hector Martin     2023-03-07  1003  			power-domains = <&ps_aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1004  
2d5ce3fbef3242 Hector Martin     2023-03-07  1005  			affinities {
2d5ce3fbef3242 Hector Martin     2023-03-07  1006  				e-core-pmu-affinity {
2d5ce3fbef3242 Hector Martin     2023-03-07  1007  					apple,fiq-index = <AIC_CPU_PMU_E>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1008  					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1009  				};
2d5ce3fbef3242 Hector Martin     2023-03-07  1010  
2d5ce3fbef3242 Hector Martin     2023-03-07  1011  				p-core-pmu-affinity {
2d5ce3fbef3242 Hector Martin     2023-03-07  1012  					apple,fiq-index = <AIC_CPU_PMU_P>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1013  					cpus = <&cpu_p0 &cpu_p1 &cpu_p2 &cpu_p3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1014  				};
2d5ce3fbef3242 Hector Martin     2023-03-07  1015  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1016  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1017  
2d5ce3fbef3242 Hector Martin     2023-03-07  1018  		pmgr: power-management@23b700000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1019  			compatible = "apple,t8112-pmgr", "apple,pmgr", "syscon", "simple-mfd";
2d5ce3fbef3242 Hector Martin     2023-03-07  1020  			#address-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1021  			#size-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1022  			reg = <0x2 0x3b700000 0 0x14000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1023  			/* child nodes are added in t8103-pmgr.dtsi */
2d5ce3fbef3242 Hector Martin     2023-03-07  1024  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1025  
f68bb847349e41 Janne Grunau      2022-11-20  1026  		pmgr_dcp: power-management@23b3d0000 {
f68bb847349e41 Janne Grunau      2022-11-20  1027  			reg = <0x2 0x3b3d0000 0x0 0x4000>;
f68bb847349e41 Janne Grunau      2022-11-20  1028  			reg-names = "dcp-bw-scratch";
f68bb847349e41 Janne Grunau      2022-11-20  1029  			#apple,bw-scratch-cells = <3>;
f68bb847349e41 Janne Grunau      2022-11-20  1030  		};
f68bb847349e41 Janne Grunau      2022-11-20  1031  
2d5ce3fbef3242 Hector Martin     2023-03-07  1032  		pinctrl_ap: pinctrl@23c100000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1033  			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
2d5ce3fbef3242 Hector Martin     2023-03-07  1034  			reg = <0x2 0x3c100000 0x0 0x100000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1035  			power-domains = <&ps_gpio>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1036  
2d5ce3fbef3242 Hector Martin     2023-03-07  1037  			gpio-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1038  			#gpio-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1039  			gpio-ranges = <&pinctrl_ap 0 0 213>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1040  			apple,npins = <213>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1041  
2d5ce3fbef3242 Hector Martin     2023-03-07  1042  			interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1043  			#interrupt-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1044  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1045  			interrupts = <AIC_IRQ 199 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1046  				     <AIC_IRQ 200 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1047  				     <AIC_IRQ 201 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1048  				     <AIC_IRQ 202 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1049  				     <AIC_IRQ 203 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1050  				     <AIC_IRQ 204 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1051  				     <AIC_IRQ 205 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1052  
2d5ce3fbef3242 Hector Martin     2023-03-07  1053  			i2c0_pins: i2c0-pins {
2d5ce3fbef3242 Hector Martin     2023-03-07  1054  				pinmux = <APPLE_PINMUX(111, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1055  					 <APPLE_PINMUX(110, 1)>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1056  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1057  
2d5ce3fbef3242 Hector Martin     2023-03-07  1058  			i2c1_pins: i2c1-pins {
2d5ce3fbef3242 Hector Martin     2023-03-07  1059  				pinmux = <APPLE_PINMUX(113, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1060  					 <APPLE_PINMUX(112, 1)>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1061  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1062  
2d5ce3fbef3242 Hector Martin     2023-03-07  1063  			i2c2_pins: i2c2-pins {
2d5ce3fbef3242 Hector Martin     2023-03-07  1064  				pinmux = <APPLE_PINMUX(87, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1065  					 <APPLE_PINMUX(86, 1)>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1066  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1067  
2d5ce3fbef3242 Hector Martin     2023-03-07  1068  			i2c3_pins: i2c3-pins {
2d5ce3fbef3242 Hector Martin     2023-03-07  1069  				pinmux = <APPLE_PINMUX(54, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1070  					 <APPLE_PINMUX(53, 1)>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1071  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1072  
2d5ce3fbef3242 Hector Martin     2023-03-07  1073  			i2c4_pins: i2c4-pins {
2d5ce3fbef3242 Hector Martin     2023-03-07  1074  				pinmux = <APPLE_PINMUX(131, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1075  					 <APPLE_PINMUX(130, 1)>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1076  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1077  
e7d8ca798ffe2f Janne Grunau      2023-02-02  1078  			spi1_pins: spi1-pins {
2d5ce3fbef3242 Hector Martin     2023-03-07  1079  				pinmux = <APPLE_PINMUX(46, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1080  					<APPLE_PINMUX(47, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1081  					<APPLE_PINMUX(48, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1082  					<APPLE_PINMUX(49, 1)>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1083  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1084  
e7d8ca798ffe2f Janne Grunau      2023-02-02  1085  			spi3_pins: spi3-pins {
e7d8ca798ffe2f Janne Grunau      2023-02-02  1086  				pinmux = <APPLE_PINMUX(93, 1)>,
e7d8ca798ffe2f Janne Grunau      2023-02-02  1087  					<APPLE_PINMUX(94, 1)>,
e7d8ca798ffe2f Janne Grunau      2023-02-02  1088  					<APPLE_PINMUX(95, 1)>,
e7d8ca798ffe2f Janne Grunau      2023-02-02  1089  					<APPLE_PINMUX(96, 1)>;
e7d8ca798ffe2f Janne Grunau      2023-02-02  1090  			};
e7d8ca798ffe2f Janne Grunau      2023-02-02  1091  
2d5ce3fbef3242 Hector Martin     2023-03-07  1092  			pcie_pins: pcie-pins {
2d5ce3fbef3242 Hector Martin     2023-03-07  1093  				pinmux = <APPLE_PINMUX(162, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1094  					 <APPLE_PINMUX(163, 1)>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1095  					 <APPLE_PINMUX(164, 1)>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1096  				// TODO: 1 more CLKREQs
2d5ce3fbef3242 Hector Martin     2023-03-07  1097  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1098  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1099  
50b24768c88883 Janne Grunau      2023-10-28  1100  		dptxphy: phy@23c500000 {
50b24768c88883 Janne Grunau      2023-10-28  1101  			compatible = "apple,t8112-dptx-phy", "apple,dptx-phy";
50b24768c88883 Janne Grunau      2023-10-28  1102  			reg = <0x2 0x3c500000 0x0 0x4000>,
50b24768c88883 Janne Grunau      2023-10-28  1103  				<0x2 0x3c540000 0x0 0xc000>;
50b24768c88883 Janne Grunau      2023-10-28  1104  			reg-names = "core", "dptx";
50b24768c88883 Janne Grunau      2023-10-28  1105  			power-domains = <&ps_dptx_ext_phy>;
50b24768c88883 Janne Grunau      2023-10-28  1106  			#phy-cells = <0>;
50b24768c88883 Janne Grunau      2023-10-28  1107  			#reset-cells = <0>;
50b24768c88883 Janne Grunau      2023-10-28  1108  			status = "disabled"; /* only used on j473 */
50b24768c88883 Janne Grunau      2023-10-28  1109  		};
50b24768c88883 Janne Grunau      2023-10-28  1110  
f2429251da9db2 Hector Martin     2022-02-15  1111  		nub_spmi: spmi@23d714000 {
f2429251da9db2 Hector Martin     2022-02-15  1112  			compatible = "apple,t8112-spmi", "apple,spmi";
f2429251da9db2 Hector Martin     2022-02-15  1113  			reg = <0x2 0x3d714000 0x0 0x100>;
f2429251da9db2 Hector Martin     2022-02-15  1114  			#address-cells = <2>;
f2429251da9db2 Hector Martin     2022-02-15  1115  			#size-cells = <0>;
f2429251da9db2 Hector Martin     2022-02-15  1116  			interrupt-parent = <&aic>;
f2429251da9db2 Hector Martin     2022-02-15  1117  			interrupts = <AIC_IRQ 256 IRQ_TYPE_LEVEL_HIGH>,
f2429251da9db2 Hector Martin     2022-02-15  1118  				<AIC_IRQ 384 IRQ_TYPE_LEVEL_HIGH>;
f2429251da9db2 Hector Martin     2022-02-15  1119  
f2429251da9db2 Hector Martin     2022-02-15  1120  			pmu1: pmu@e {
f2429251da9db2 Hector Martin     2022-02-15  1121  				compatible = "apple,stowe-pmu", "apple,spmi-pmu";
f2429251da9db2 Hector Martin     2022-02-15  1122  				reg = <0xe SPMI_USID>;
f2429251da9db2 Hector Martin     2022-02-15  1123  				#address-cells = <1>;
f2429251da9db2 Hector Martin     2022-02-15  1124  				#size-cells = <1>;
f2429251da9db2 Hector Martin     2022-02-15  1125  
f2429251da9db2 Hector Martin     2022-02-15  1126  				rtc_nvmem@f800 {
f2429251da9db2 Hector Martin     2022-02-15  1127  					compatible = "apple,spmi-pmu-nvmem";
f2429251da9db2 Hector Martin     2022-02-15  1128  					reg = <0xf800 0x300>;
f2429251da9db2 Hector Martin     2022-02-15  1129  					#address-cells = <1>;
f2429251da9db2 Hector Martin     2022-02-15  1130  					#size-cells = <1>;
f2429251da9db2 Hector Martin     2022-02-15  1131  
f2429251da9db2 Hector Martin     2022-02-15  1132  					pm_setting: pm-setting@1 {
f2429251da9db2 Hector Martin     2022-02-15  1133  						reg = <0x1 0x1>;
f2429251da9db2 Hector Martin     2022-02-15  1134  					};
f2429251da9db2 Hector Martin     2022-02-15  1135  
f2429251da9db2 Hector Martin     2022-02-15  1136  					rtc_offset: rtc-offset@100 {
f2429251da9db2 Hector Martin     2022-02-15  1137  						reg = <0x100 0x6>;
f2429251da9db2 Hector Martin     2022-02-15  1138  					};
f2429251da9db2 Hector Martin     2022-02-15  1139  				};
f2429251da9db2 Hector Martin     2022-02-15  1140  
f2429251da9db2 Hector Martin     2022-02-15  1141  				legacy_nvmem@f700 {
f2429251da9db2 Hector Martin     2022-02-15  1142  					compatible = "apple,spmi-pmu-nvmem";
f2429251da9db2 Hector Martin     2022-02-15  1143  					reg = <0xf700 0x20>;
f2429251da9db2 Hector Martin     2022-02-15  1144  					#address-cells = <1>;
f2429251da9db2 Hector Martin     2022-02-15  1145  					#size-cells = <1>;
f2429251da9db2 Hector Martin     2022-02-15  1146  
f2429251da9db2 Hector Martin     2022-02-15  1147  					boot_stage: boot-stage@1 {
f2429251da9db2 Hector Martin     2022-02-15  1148  						reg = <0x1 0x1>;
f2429251da9db2 Hector Martin     2022-02-15  1149  					};
f2429251da9db2 Hector Martin     2022-02-15  1150  
f2429251da9db2 Hector Martin     2022-02-15  1151  					boot_error_count: boot-error-count@2 {
f2429251da9db2 Hector Martin     2022-02-15  1152  						reg = <0x2 0x1>;
f2429251da9db2 Hector Martin     2022-02-15  1153  						bits = <0 4>;
f2429251da9db2 Hector Martin     2022-02-15  1154  					};
f2429251da9db2 Hector Martin     2022-02-15  1155  
f2429251da9db2 Hector Martin     2022-02-15  1156  					panic_count: panic-count@2 {
f2429251da9db2 Hector Martin     2022-02-15  1157  						reg = <0x2 0x1>;
f2429251da9db2 Hector Martin     2022-02-15  1158  						bits = <4 4>;
f2429251da9db2 Hector Martin     2022-02-15  1159  					};
f2429251da9db2 Hector Martin     2022-02-15  1160  
f2429251da9db2 Hector Martin     2022-02-15  1161  					boot_error_stage: boot-error-stage@3 {
f2429251da9db2 Hector Martin     2022-02-15  1162  						reg = <0x3 0x1>;
f2429251da9db2 Hector Martin     2022-02-15  1163  					};
f2429251da9db2 Hector Martin     2022-02-15  1164  
f2429251da9db2 Hector Martin     2022-02-15  1165  					shutdown_flag: shutdown-flag@f {
f2429251da9db2 Hector Martin     2022-02-15  1166  						reg = <0xf 0x1>;
f2429251da9db2 Hector Martin     2022-02-15  1167  						bits = <3 1>;
f2429251da9db2 Hector Martin     2022-02-15  1168  					};
f2429251da9db2 Hector Martin     2022-02-15  1169  				};
f2429251da9db2 Hector Martin     2022-02-15  1170  
f2429251da9db2 Hector Martin     2022-02-15  1171  				scrpad_nvmem@8000 {
f2429251da9db2 Hector Martin     2022-02-15  1172  					compatible = "apple,spmi-pmu-nvmem";
f2429251da9db2 Hector Martin     2022-02-15  1173  					reg = <0x8000 0x2800>;
f2429251da9db2 Hector Martin     2022-02-15  1174  					#address-cells = <1>;
f2429251da9db2 Hector Martin     2022-02-15  1175  					#size-cells = <1>;
f2429251da9db2 Hector Martin     2022-02-15  1176  
f2429251da9db2 Hector Martin     2022-02-15  1177  					fault_shadow: fault-shadow@67b {
f2429251da9db2 Hector Martin     2022-02-15  1178  						reg = <0x67b 0x10>;
f2429251da9db2 Hector Martin     2022-02-15  1179  					};
f2429251da9db2 Hector Martin     2022-02-15  1180  
f2429251da9db2 Hector Martin     2022-02-15  1181  					socd: socd@b00 {
f2429251da9db2 Hector Martin     2022-02-15  1182  						reg = <0xb00 0x400>;
f2429251da9db2 Hector Martin     2022-02-15  1183  					};
f2429251da9db2 Hector Martin     2022-02-15  1184  				};
f2429251da9db2 Hector Martin     2022-02-15  1185  
f2429251da9db2 Hector Martin     2022-02-15  1186  			};
f2429251da9db2 Hector Martin     2022-02-15  1187  		};
f2429251da9db2 Hector Martin     2022-02-15  1188  
2d5ce3fbef3242 Hector Martin     2023-03-07  1189  		pinctrl_nub: pinctrl@23d1f0000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1190  			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
2d5ce3fbef3242 Hector Martin     2023-03-07  1191  			reg = <0x2 0x3d1f0000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1192  			power-domains = <&ps_nub_gpio>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1193  
2d5ce3fbef3242 Hector Martin     2023-03-07  1194  			gpio-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1195  			#gpio-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1196  			gpio-ranges = <&pinctrl_nub 0 0 24>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1197  			apple,npins = <24>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1198  
2d5ce3fbef3242 Hector Martin     2023-03-07  1199  			interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1200  			#interrupt-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1201  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1202  			interrupts = <AIC_IRQ 371 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1203  				     <AIC_IRQ 372 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1204  				     <AIC_IRQ 373 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1205  				     <AIC_IRQ 374 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1206  				     <AIC_IRQ 375 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1207  				     <AIC_IRQ 376 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1208  				     <AIC_IRQ 377 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1209  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1210  
2d5ce3fbef3242 Hector Martin     2023-03-07  1211  		pmgr_mini: power-management@23d280000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1212  			compatible = "apple,t8112-pmgr", "apple,pmgr", "syscon", "simple-mfd";
2d5ce3fbef3242 Hector Martin     2023-03-07  1213  			#address-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1214  			#size-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1215  			reg = <0x2 0x3d280000 0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1216  			/* child nodes are added in t8103-pmgr.dtsi */
2d5ce3fbef3242 Hector Martin     2023-03-07  1217  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1218  
2d5ce3fbef3242 Hector Martin     2023-03-07  1219  		wdt: watchdog@23d2b0000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1220  			compatible = "apple,t8112-wdt", "apple,wdt";
2d5ce3fbef3242 Hector Martin     2023-03-07  1221  			reg = <0x2 0x3d2b0000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1222  			clocks = <&clkref>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1223  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1224  			interrupts = <AIC_IRQ 379 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1225  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1226  
36851da6d0ec07 Janne Grunau      2022-11-15  1227  		efuse@23d2c8000 {
36851da6d0ec07 Janne Grunau      2022-11-15  1228  			compatible = "apple,t8112-efuses", "apple,efuses";
36851da6d0ec07 Janne Grunau      2022-11-15  1229  			reg = <0x2 0x3d2c8000 0x0 0x1000>;
36851da6d0ec07 Janne Grunau      2022-11-15  1230  			#address-cells = <1>;
36851da6d0ec07 Janne Grunau      2022-11-15  1231  			#size-cells = <1>;
36851da6d0ec07 Janne Grunau      2022-11-15  1232  
36851da6d0ec07 Janne Grunau      2022-11-15  1233  			atcphy0_auspll_rodco_bias_adjust: efuse@480,20 {
36851da6d0ec07 Janne Grunau      2022-11-15  1234  				reg = <0x480 4>;
36851da6d0ec07 Janne Grunau      2022-11-15  1235  				bits = <20 3>;
36851da6d0ec07 Janne Grunau      2022-11-15  1236  			};
36851da6d0ec07 Janne Grunau      2022-11-15  1237  
36851da6d0ec07 Janne Grunau      2022-11-15  1238  			atcphy0_auspll_rodco_encap: efuse@480,23 {
36851da6d0ec07 Janne Grunau      2022-11-15  1239  				reg = <0x480 4>;
36851da6d0ec07 Janne Grunau      2022-11-15  1240  				bits = <23 2>;
36851da6d0ec07 Janne Grunau      2022-11-15  1241  			};
36851da6d0ec07 Janne Grunau      2022-11-15  1242  
36851da6d0ec07 Janne Grunau      2022-11-15  1243  			atcphy0_auspll_dtc_vreg_adjust: efuse@480,25 {
36851da6d0ec07 Janne Grunau      2022-11-15  1244  				reg = <0x480 4>;
36851da6d0ec07 Janne Grunau      2022-11-15  1245  				bits = <25 3>;
36851da6d0ec07 Janne Grunau      2022-11-15  1246  			};
36851da6d0ec07 Janne Grunau      2022-11-15  1247  
36851da6d0ec07 Janne Grunau      2022-11-15  1248  			atcphy0_auspll_fracn_dll_start_capcode: efuse@480,28 {
36851da6d0ec07 Janne Grunau      2022-11-15  1249  				reg = <0x480 4>;
36851da6d0ec07 Janne Grunau      2022-11-15  1250  				bits = <28 2>;
36851da6d0ec07 Janne Grunau      2022-11-15  1251  			};
36851da6d0ec07 Janne Grunau      2022-11-15  1252  
36851da6d0ec07 Janne Grunau      2022-11-15  1253  			atcphy0_aus_cmn_shm_vreg_trim: efuse@480,30 {
36851da6d0ec07 Janne Grunau      2022-11-15  1254  				reg = <0x480 8>;
36851da6d0ec07 Janne Grunau      2022-11-15  1255  				bits = <30 5>;
36851da6d0ec07 Janne Grunau      2022-11-15  1256  			};
36851da6d0ec07 Janne Grunau      2022-11-15  1257  
36851da6d0ec07 Janne Grunau      2022-11-15  1258  			atcphy0_cio3pll_dco_coarsebin0: efuse@484,3 {
36851da6d0ec07 Janne Grunau      2022-11-15  1259  				reg = <0x484 4>;
36851da6d0ec07 Janne Grunau      2022-11-15  1260  				bits = <3 6>;
36851da6d0ec07 Janne Grunau      2022-11-15  1261  			};
36851da6d0ec07 Janne Grunau      2022-11-15  1262  
36851da6d0ec07 Janne Grunau      2022-11-15  1263  			atcphy0_cio3pll_dco_coarsebin1: efuse@484,9 {
36851da6d0ec07 Janne Grunau      2022-11-15  1264  				reg = <0x484 4>;
36851da6d0ec07 Janne Grunau      2022-11-15  1265  				bits = <9 6>;
36851da6d0ec07 Janne Grunau      2022-11-15  1266  			};
36851da6d0ec07 Janne Grunau      2022-11-15  1267  
36851da6d0ec07 Janne Grunau      2022-11-15  1268  			atcphy0_cio3pll_dll_start_capcode: efuse@484,15 {
36851da6d0ec07 Janne Grunau      2022-11-15  1269  				reg = <0x484 4>;
36851da6d0ec07 Janne Grunau      2022-11-15  1270  				bits = <15 2>;
36851da6d0ec07 Janne Grunau      2022-11-15  1271  			};
36851da6d0ec07 Janne Grunau      2022-11-15  1272  
36851da6d0ec07 Janne Grunau      2022-11-15  1273  			atcphy0_cio3pll_dtc_vreg_adjust: efuse@484,17 {
36851da6d0ec07 Janne Grunau      2022-11-15  1274  				reg = <0x484 0x4>;
36851da6d0ec07 Janne Grunau      2022-11-15  1275  				bits = <17 3>;
36851da6d0ec07 Janne Grunau      2022-11-15  1276  			};
36851da6d0ec07 Janne Grunau      2022-11-15  1277  
36851da6d0ec07 Janne Grunau      2022-11-15  1278  			atcphy1_auspll_rodco_bias_adjust: efuse@484,30 {
36851da6d0ec07 Janne Grunau      2022-11-15  1279  				reg = <0x484 8>;
36851da6d0ec07 Janne Grunau      2022-11-15  1280  				bits = <30 3>;
36851da6d0ec07 Janne Grunau      2022-11-15  1281  			};
36851da6d0ec07 Janne Grunau      2022-11-15  1282  
36851da6d0ec07 Janne Grunau      2022-11-15  1283  			atcphy1_auspll_rodco_encap: efuse@488,1 {
36851da6d0ec07 Janne Grunau      2022-11-15  1284  				reg = <0x488 8>;
36851da6d0ec07 Janne Grunau      2022-11-15  1285  				bits = <1 2>;
36851da6d0ec07 Janne Grunau      2022-11-15  1286  			};
36851da6d0ec07 Janne Grunau      2022-11-15  1287  
36851da6d0ec07 Janne Grunau      2022-11-15  1288  			atcphy1_auspll_dtc_vreg_adjust: efuse@488,3 {
36851da6d0ec07 Janne Grunau      2022-11-15  1289  				reg = <0x488 4>;
36851da6d0ec07 Janne Grunau      2022-11-15  1290  				bits = <3 3>;
36851da6d0ec07 Janne Grunau      2022-11-15  1291  			};
36851da6d0ec07 Janne Grunau      2022-11-15  1292  
36851da6d0ec07 Janne Grunau      2022-11-15  1293  			atcphy1_auspll_fracn_dll_start_capcode: efuse@488,6 {
36851da6d0ec07 Janne Grunau      2022-11-15  1294  				reg = <0x488 4>;
36851da6d0ec07 Janne Grunau      2022-11-15  1295  				bits = <6 2>;
36851da6d0ec07 Janne Grunau      2022-11-15  1296  			};
36851da6d0ec07 Janne Grunau      2022-11-15  1297  
36851da6d0ec07 Janne Grunau      2022-11-15  1298  			atcphy1_aus_cmn_shm_vreg_trim: efuse@488,8 {
36851da6d0ec07 Janne Grunau      2022-11-15  1299  				reg = <0x488 4>;
36851da6d0ec07 Janne Grunau      2022-11-15  1300  				bits = <8 5>;
36851da6d0ec07 Janne Grunau      2022-11-15  1301  			};
36851da6d0ec07 Janne Grunau      2022-11-15  1302  
36851da6d0ec07 Janne Grunau      2022-11-15  1303  			atcphy1_cio3pll_dco_coarsebin0: efuse@488,13 {
36851da6d0ec07 Janne Grunau      2022-11-15  1304  				reg = <0x488 4>;
36851da6d0ec07 Janne Grunau      2022-11-15  1305  				bits = <13 6>;
36851da6d0ec07 Janne Grunau      2022-11-15  1306  			};
36851da6d0ec07 Janne Grunau      2022-11-15  1307  
36851da6d0ec07 Janne Grunau      2022-11-15  1308  			atcphy1_cio3pll_dco_coarsebin1: efuse@488,19 {
36851da6d0ec07 Janne Grunau      2022-11-15  1309  				reg = <0x488 4>;
36851da6d0ec07 Janne Grunau      2022-11-15  1310  				bits = <19 6>;
36851da6d0ec07 Janne Grunau      2022-11-15  1311  			};
36851da6d0ec07 Janne Grunau      2022-11-15  1312  
36851da6d0ec07 Janne Grunau      2022-11-15  1313  			atcphy1_cio3pll_dll_start_capcode: efuse@488,25 {
36851da6d0ec07 Janne Grunau      2022-11-15  1314  				reg = <0x488 4>;
36851da6d0ec07 Janne Grunau      2022-11-15  1315  				bits = <25 2>;
36851da6d0ec07 Janne Grunau      2022-11-15  1316  			};
36851da6d0ec07 Janne Grunau      2022-11-15  1317  
36851da6d0ec07 Janne Grunau      2022-11-15  1318  			atcphy1_cio3pll_dtc_vreg_adjust: efuse@488,27 {
36851da6d0ec07 Janne Grunau      2022-11-15  1319  				reg = <0x488 0x4>;
36851da6d0ec07 Janne Grunau      2022-11-15  1320  				bits = <27 3>;
36851da6d0ec07 Janne Grunau      2022-11-15  1321  			};
36851da6d0ec07 Janne Grunau      2022-11-15  1322  		};
36851da6d0ec07 Janne Grunau      2022-11-15  1323  
107d3a429ad7fb Hector Martin     2022-02-04  1324  		smc_mbox: mbox@23e408000 {
107d3a429ad7fb Hector Martin     2022-02-04  1325  			compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
107d3a429ad7fb Hector Martin     2022-02-04  1326  			reg = <0x2 0x3e408000 0x0 0x4000>;
107d3a429ad7fb Hector Martin     2022-02-04  1327  			interrupt-parent = <&aic>;
107d3a429ad7fb Hector Martin     2022-02-04  1328  			interrupts = <AIC_IRQ 499 IRQ_TYPE_LEVEL_HIGH>,
107d3a429ad7fb Hector Martin     2022-02-04  1329  				<AIC_IRQ 500 IRQ_TYPE_LEVEL_HIGH>,
107d3a429ad7fb Hector Martin     2022-02-04  1330  				<AIC_IRQ 501 IRQ_TYPE_LEVEL_HIGH>,
107d3a429ad7fb Hector Martin     2022-02-04  1331  				<AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>;
107d3a429ad7fb Hector Martin     2022-02-04  1332  			interrupt-names = "send-empty", "send-not-empty",
107d3a429ad7fb Hector Martin     2022-02-04  1333  				"recv-empty", "recv-not-empty";
107d3a429ad7fb Hector Martin     2022-02-04  1334  			#mbox-cells = <0>;
107d3a429ad7fb Hector Martin     2022-02-04  1335  		};
107d3a429ad7fb Hector Martin     2022-02-04  1336  
107d3a429ad7fb Hector Martin     2022-02-04  1337  		smc: smc@23e400000 {
107d3a429ad7fb Hector Martin     2022-02-04  1338  			compatible = "apple,t8112-smc", "apple,smc";
107d3a429ad7fb Hector Martin     2022-02-04  1339  			reg = <0x2 0x3e400000 0x0 0x4000>,
107d3a429ad7fb Hector Martin     2022-02-04  1340  				<0x2 0x3fe00000 0x0 0x100000>;
107d3a429ad7fb Hector Martin     2022-02-04  1341  			reg-names = "smc", "sram";
107d3a429ad7fb Hector Martin     2022-02-04  1342  			mboxes = <&smc_mbox>;
107d3a429ad7fb Hector Martin     2022-02-04  1343  
107d3a429ad7fb Hector Martin     2022-02-04  1344  			smc_gpio: gpio {
107d3a429ad7fb Hector Martin     2022-02-04  1345  				gpio-controller;
107d3a429ad7fb Hector Martin     2022-02-04  1346  				#gpio-cells = <2>;
107d3a429ad7fb Hector Martin     2022-02-04  1347  			};
107d3a429ad7fb Hector Martin     2022-02-04  1348  
107d3a429ad7fb Hector Martin     2022-02-04  1349  			smc_rtc: rtc {
107d3a429ad7fb Hector Martin     2022-02-04  1350  				nvmem-cells = <&rtc_offset>;
107d3a429ad7fb Hector Martin     2022-02-04  1351  				nvmem-cell-names = "rtc_offset";
107d3a429ad7fb Hector Martin     2022-02-04  1352  			};
107d3a429ad7fb Hector Martin     2022-02-04  1353  
107d3a429ad7fb Hector Martin     2022-02-04  1354  			smc_reboot: reboot {
107d3a429ad7fb Hector Martin     2022-02-04  1355  				nvmem-cells = <&shutdown_flag>, <&boot_stage>,
107d3a429ad7fb Hector Martin     2022-02-04  1356  					<&boot_error_count>, <&panic_count>, <&pm_setting>;
107d3a429ad7fb Hector Martin     2022-02-04  1357  				nvmem-cell-names = "shutdown_flag", "boot_stage",
107d3a429ad7fb Hector Martin     2022-02-04  1358  					"boot_error_count", "panic_count", "pm_setting";
107d3a429ad7fb Hector Martin     2022-02-04  1359  			};
107d3a429ad7fb Hector Martin     2022-02-04  1360  		};
107d3a429ad7fb Hector Martin     2022-02-04  1361  
2d5ce3fbef3242 Hector Martin     2023-03-07  1362  		pinctrl_smc: pinctrl@23e820000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1363  			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
2d5ce3fbef3242 Hector Martin     2023-03-07  1364  			reg = <0x2 0x3e820000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1365  
2d5ce3fbef3242 Hector Martin     2023-03-07  1366  			gpio-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1367  			#gpio-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1368  			gpio-ranges = <&pinctrl_smc 0 0 18>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1369  			apple,npins = <18>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1370  
2d5ce3fbef3242 Hector Martin     2023-03-07  1371  			interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1372  			#interrupt-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1373  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1374  			interrupts = <AIC_IRQ 490 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1375  				     <AIC_IRQ 491 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1376  				     <AIC_IRQ 492 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1377  				     <AIC_IRQ 493 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1378  				     <AIC_IRQ 494 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1379  				     <AIC_IRQ 495 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1380  				     <AIC_IRQ 496 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1381  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1382  
2d5ce3fbef3242 Hector Martin     2023-03-07  1383  		pinctrl_aop: pinctrl@24a820000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1384  			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
2d5ce3fbef3242 Hector Martin     2023-03-07  1385  			reg = <0x2 0x4a820000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1386  
2d5ce3fbef3242 Hector Martin     2023-03-07  1387  			gpio-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1388  			#gpio-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1389  			gpio-ranges = <&pinctrl_aop 0 0 54>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1390  			apple,npins = <54>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1391  
2d5ce3fbef3242 Hector Martin     2023-03-07  1392  			interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1393  			#interrupt-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1394  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1395  			interrupts = <AIC_IRQ 301 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1396  				     <AIC_IRQ 302 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1397  				     <AIC_IRQ 303 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1398  				     <AIC_IRQ 304 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1399  				     <AIC_IRQ 305 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1400  				     <AIC_IRQ 306 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1401  				     <AIC_IRQ 307 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1402  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1403  
3418bd42eece5c Sasha Finkelstein 2024-11-09  1404  		aop_mbox: mbox@24a408000 {
3418bd42eece5c Sasha Finkelstein 2024-11-09  1405  			compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
3418bd42eece5c Sasha Finkelstein 2024-11-09  1406  			reg = <0x2 0x4a408000 0x0 0x4000>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1407  			interrupt-parent = <&aic>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1408  			interrupts = <AIC_IRQ 318 IRQ_TYPE_LEVEL_HIGH>,
3418bd42eece5c Sasha Finkelstein 2024-11-09  1409  				<AIC_IRQ 319 IRQ_TYPE_LEVEL_HIGH>,
3418bd42eece5c Sasha Finkelstein 2024-11-09  1410  				<AIC_IRQ 320 IRQ_TYPE_LEVEL_HIGH>,
3418bd42eece5c Sasha Finkelstein 2024-11-09  1411  				<AIC_IRQ 321 IRQ_TYPE_LEVEL_HIGH>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1412  			interrupt-names = "send-empty", "send-not-empty",
3418bd42eece5c Sasha Finkelstein 2024-11-09  1413  				"recv-empty", "recv-not-empty";
3418bd42eece5c Sasha Finkelstein 2024-11-09  1414  			#mbox-cells = <0>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1415  			status = "disabled";
3418bd42eece5c Sasha Finkelstein 2024-11-09  1416  		};
3418bd42eece5c Sasha Finkelstein 2024-11-09  1417  
3418bd42eece5c Sasha Finkelstein 2024-11-09  1418  		aop_dart: iommu@24a808000 {
3418bd42eece5c Sasha Finkelstein 2024-11-09  1419  			compatible = "apple,t8112-dart", "apple,t8110-dart";
3418bd42eece5c Sasha Finkelstein 2024-11-09  1420  			reg = <0x2 0x4a808000 0x0 0x4000>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1421  			#iommu-cells = <1>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1422  			interrupt-parent = <&aic>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1423  			interrupts = <AIC_IRQ 338 IRQ_TYPE_LEVEL_HIGH>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1424  			status = "disabled";
3418bd42eece5c Sasha Finkelstein 2024-11-09  1425  		};
3418bd42eece5c Sasha Finkelstein 2024-11-09  1426  
3418bd42eece5c Sasha Finkelstein 2024-11-09  1427  		aop_admac: dma-controller@24a980000 {
3418bd42eece5c Sasha Finkelstein 2024-11-09  1428  			/*
3418bd42eece5c Sasha Finkelstein 2024-11-09  1429  			* Use "admac2" until commit "dmaengine: apple-admac:
3418bd42eece5c Sasha Finkelstein 2024-11-09  1430  			* Avoid accessing registers in probe" is long enough
3418bd42eece5c Sasha Finkelstein 2024-11-09  1431  			* upstream (not yet as of 2024-12-30)
3418bd42eece5c Sasha Finkelstein 2024-11-09  1432  			*/
3418bd42eece5c Sasha Finkelstein 2024-11-09  1433  			// compatible = "apple,t8112-admac", "apple,admac";
3418bd42eece5c Sasha Finkelstein 2024-11-09  1434  			compatible = "apple,t8112-admac2", "apple,admac2";
3418bd42eece5c Sasha Finkelstein 2024-11-09  1435  			reg = <0x2 0x4a980000 0x0 0x34000>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1436  			#dma-cells = <1>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1437  			dma-channels = <16>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1438  			interrupts-extended = <0>,
3418bd42eece5c Sasha Finkelstein 2024-11-09  1439  					      <0>,
3418bd42eece5c Sasha Finkelstein 2024-11-09  1440  					      <&aic AIC_IRQ 359 IRQ_TYPE_LEVEL_HIGH>,
3418bd42eece5c Sasha Finkelstein 2024-11-09  1441  					      <0>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1442  			iommus = <&aop_dart 10>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1443  			status = "disabled";
3418bd42eece5c Sasha Finkelstein 2024-11-09  1444  		};
3418bd42eece5c Sasha Finkelstein 2024-11-09  1445  
3418bd42eece5c Sasha Finkelstein 2024-11-09  1446  		aop: aop@24ac00000 {
3418bd42eece5c Sasha Finkelstein 2024-11-09  1447  			compatible = "apple,aop";
3418bd42eece5c Sasha Finkelstein 2024-11-09  1448  			reg = <0x2 0x4ac00000 0x0 0x1e0000>,
3418bd42eece5c Sasha Finkelstein 2024-11-09  1449  			      <0x2 0x4a400000 0x0 0x6C000>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1450  			mboxes = <&aop_mbox>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1451  			mbox-names = "mbox";
3418bd42eece5c Sasha Finkelstein 2024-11-09  1452  			iommus = <&aop_dart 0>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1453  
3418bd42eece5c Sasha Finkelstein 2024-11-09  1454  			apple,aop-target = <0>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1455  			apple,aop-alignment = <128>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1456  			status = "disabled";
3418bd42eece5c Sasha Finkelstein 2024-11-09  1457  
3418bd42eece5c Sasha Finkelstein 2024-11-09  1458  			aop_audio: audio {
3418bd42eece5c Sasha Finkelstein 2024-11-09  1459  				dmas = <&aop_admac 1>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1460  				dma-names = "dma";
3418bd42eece5c Sasha Finkelstein 2024-11-09  1461  				apple,bytes-per-sample = <2>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1462  				apple,clock-source = <0x706c6c20>; // 'pll '
3418bd42eece5c Sasha Finkelstein 2024-11-09  1463  				apple,pdm-frequency = <2400000>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1464  				apple,pdmc-frequency = <24000000>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1465  				apple,slow-clock-speed = <24000000>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1466  				apple,fast-clock-speed = <24000000>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1467  				apple,channel-polarity-select = <256>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1468  				apple,channel-phase-select = <0>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1469  				apple,mic-turn-on-time-ms = <20>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1470  				apple,mic-settle-time-ms = <50>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1471  
3418bd42eece5c Sasha Finkelstein 2024-11-09  1472  				apple,filter-lengths = <0x542c47>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1473  				apple,decm-ratios = [0f 05 02];
3418bd42eece5c Sasha Finkelstein 2024-11-09  1474  				apple,decm-latency = <15>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1475  				apple,coefficients = <
3418bd42eece5c Sasha Finkelstein 2024-11-09  1476  					0x88030000 0x82080000 0x51120000 0x0a230000 0xce3d0000 0x97660000
3418bd42eece5c Sasha Finkelstein 2024-11-09  1477  					0x43a20000 0x9cf60000 0x536a0100 0xe6040200 0x7ece0200 0xaecf0300
3418bd42eece5c Sasha Finkelstein 2024-11-09  1478  					0x2e110500 0x7d9b0600 0x75760800 0xd8a80a00 0xd2370d00 0x82261000
3418bd42eece5c Sasha Finkelstein 2024-11-09  1479  					0x86751300 0x97221700 0x39281b00 0x897d1f00 0x2e162400 0x69e22800
3418bd42eece5c Sasha Finkelstein 2024-11-09  1480  					0x56cf2d00 0x51c73200 0x80b23700 0x87773c00 0x4cfc4000 0xd9264500
3418bd42eece5c Sasha Finkelstein 2024-11-09  1481  					0x47de4800 0xa00b4c00 0xc19a4e00 0x1f7b5000 0x68a05100 0x06035200
3418bd42eece5c Sasha Finkelstein 2024-11-09  1482  					0x4a250000 0x4caf0000 0xc0070200 0x45990400 0x9a840800 0x7d380d00
3418bd42eece5c Sasha Finkelstein 2024-11-09  1483  					0x5f1a1100 0xd9811100 0x80440b00 0x8ee5fbff 0xca32e3ff 0x52c7c4ff
3418bd42eece5c Sasha Finkelstein 2024-11-09  1484  					0xa6bca8ff 0x83e69aff 0xb85ba8ff 0x6baedbff 0xe7d83800 0x2442ba00
3418bd42eece5c Sasha Finkelstein 2024-11-09  1485  					0x33205001 0x6edce201 0x42235802 0x2c509902 0xcffaffff 0x530affff
3418bd42eece5c Sasha Finkelstein 2024-11-09  1486  					0x6623fbff 0xa03ef4ff 0xe668f0ff 0xb835f7ff 0x56ec0400 0x37a30900
3418bd42eece5c Sasha Finkelstein 2024-11-09  1487  					0x00d4feff 0x78a3f5ff 0x03bffeff 0x84d50b00 0xbe0b0400 0x5254f2ff
3418bd42eece5c Sasha Finkelstein 2024-11-09  1488  					0x6d3ff8ff 0xc57f0f00 0xe69e0c00 0x7903efff 0xd533edff 0xecd11100
3418bd42eece5c Sasha Finkelstein 2024-11-09  1489  					0x7d691a00 0xd655eeff 0x8866dcff 0x57261000 0xc78d2e00 0x822ef3ff
3418bd42eece5c Sasha Finkelstein 2024-11-09  1490  					0x6369c4ff 0xcd080700 0x35344b00 0xaf210200 0x83b6a1ff 0xe2d5efff
3418bd42eece5c Sasha Finkelstein 2024-11-09  1491  					0x949b7600 0xf3d72500 0xfffc67ff 0xe3acb6ff 0x521bcc00 0x3c8a8b00
3418bd42eece5c Sasha Finkelstein 2024-11-09  1492  					0x9f0ccdfe 0x5c68ccfe 0x4dc59802 0x82cffb06>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1493  			};
3418bd42eece5c Sasha Finkelstein 2024-11-09  1494  
3418bd42eece5c Sasha Finkelstein 2024-11-09  1495  			aop_als: als {
3418bd42eece5c Sasha Finkelstein 2024-11-09  1496  				// intentionally empty
3418bd42eece5c Sasha Finkelstein 2024-11-09  1497  			};
3418bd42eece5c Sasha Finkelstein 2024-11-09  1498  		};
3418bd42eece5c Sasha Finkelstein 2024-11-09  1499  
7d2cb73a4e1593 Janne Grunau      2023-02-02  1500  		mtp: mtp@24e400000 {
7d2cb73a4e1593 Janne Grunau      2023-02-02  1501  			compatible = "apple,t8112-mtp", "apple,t8112-rtk-helper-asc4", "apple,mtp", "apple,rtk-helper-asc4";
7d2cb73a4e1593 Janne Grunau      2023-02-02  1502  			reg = <0x2 0x4e400000 0x0 0x4000>,
7d2cb73a4e1593 Janne Grunau      2023-02-02  1503  				<0x2 0x4ec00000 0x0 0x100000>;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1504  			reg-names = "asc", "sram";
7d2cb73a4e1593 Janne Grunau      2023-02-02  1505  			mboxes = <&mtp_mbox>;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1506  			iommus = <&mtp_dart 1>;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1507  			#helper-cells = <0>;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1508  
7d2cb73a4e1593 Janne Grunau      2023-02-02  1509  			status = "disabled";
7d2cb73a4e1593 Janne Grunau      2023-02-02  1510  		};
7d2cb73a4e1593 Janne Grunau      2023-02-02  1511  
7d2cb73a4e1593 Janne Grunau      2023-02-02  1512  		mtp_mbox: mbox@24e408000 {
7d2cb73a4e1593 Janne Grunau      2023-02-02  1513  			compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
7d2cb73a4e1593 Janne Grunau      2023-02-02  1514  			reg = <0x2 0x4e408000 0x0 0x4000>;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1515  			interrupt-parent = <&aic>;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1516  			interrupts = <AIC_IRQ 864 IRQ_TYPE_LEVEL_HIGH>,
7d2cb73a4e1593 Janne Grunau      2023-02-02  1517  				<AIC_IRQ 865 IRQ_TYPE_LEVEL_HIGH>,
7d2cb73a4e1593 Janne Grunau      2023-02-02  1518  				<AIC_IRQ 866 IRQ_TYPE_LEVEL_HIGH>,
7d2cb73a4e1593 Janne Grunau      2023-02-02  1519  				<AIC_IRQ 867 IRQ_TYPE_LEVEL_HIGH>;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1520  			interrupt-names = "send-empty", "send-not-empty",
7d2cb73a4e1593 Janne Grunau      2023-02-02  1521  				"recv-empty", "recv-not-empty";
7d2cb73a4e1593 Janne Grunau      2023-02-02  1522  			#mbox-cells = <0>;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1523  
7d2cb73a4e1593 Janne Grunau      2023-02-02  1524  			status = "disabled";
7d2cb73a4e1593 Janne Grunau      2023-02-02  1525  		};
7d2cb73a4e1593 Janne Grunau      2023-02-02  1526  
7d2cb73a4e1593 Janne Grunau      2023-02-02  1527  		mtp_dart: iommu@24e808000 {
7d2cb73a4e1593 Janne Grunau      2023-02-02  1528  			compatible = "apple,t8112-dart", "apple,t8110-dart";
7d2cb73a4e1593 Janne Grunau      2023-02-02  1529  			reg = <0x2 0x4e808000 0x0 0x4000>;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1530  			interrupt-parent = <&aic>;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1531  			interrupts = <AIC_IRQ 848 IRQ_TYPE_LEVEL_HIGH>;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1532  			#iommu-cells = <1>;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1533  
7d2cb73a4e1593 Janne Grunau      2023-02-02  1534  			status = "disabled";
7d2cb73a4e1593 Janne Grunau      2023-02-02  1535  		};
7d2cb73a4e1593 Janne Grunau      2023-02-02  1536  
7d2cb73a4e1593 Janne Grunau      2023-02-02  1537  		mtp_dockchannel: fifo@24eb14000 {
7d2cb73a4e1593 Janne Grunau      2023-02-02  1538  			compatible = "apple,t8112-dockchannel", "apple,dockchannel";
7d2cb73a4e1593 Janne Grunau      2023-02-02  1539  			reg = <0x2 0x4eb14000 0x0 0x4000>;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1540  			reg-names = "irq";
7d2cb73a4e1593 Janne Grunau      2023-02-02  1541  			interrupt-parent = <&aic>;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1542  			interrupts = <AIC_IRQ 850 IRQ_TYPE_LEVEL_HIGH>;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1543  
7d2cb73a4e1593 Janne Grunau      2023-02-02  1544  			ranges = <0 0x2 0x4eb28000 0x20000>;
4caa6733c4950c Hector Martin     2023-04-10  1545  			nonposted-mmio;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1546  			#address-cells = <1>;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1547  			#size-cells = <1>;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1548  
7d2cb73a4e1593 Janne Grunau      2023-02-02  1549  			interrupt-controller;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1550  			#interrupt-cells = <2>;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1551  
7d2cb73a4e1593 Janne Grunau      2023-02-02  1552  			status = "disabled";
7d2cb73a4e1593 Janne Grunau      2023-02-02  1553  
7d2cb73a4e1593 Janne Grunau      2023-02-02  1554  			mtp_hid: input@8000 {
7d2cb73a4e1593 Janne Grunau      2023-02-02  1555  				compatible = "apple,dockchannel-hid";
7d2cb73a4e1593 Janne Grunau      2023-02-02  1556  				reg = <0x8000 0x4000>,
7d2cb73a4e1593 Janne Grunau      2023-02-02  1557  					<0xc000 0x4000>,
7d2cb73a4e1593 Janne Grunau      2023-02-02  1558  					<0x0000 0x4000>,
7d2cb73a4e1593 Janne Grunau      2023-02-02  1559  					<0x4000 0x4000>;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1560  				reg-names = "config", "data",
7d2cb73a4e1593 Janne Grunau      2023-02-02  1561  					"rmt-config", "rmt-data";
7d2cb73a4e1593 Janne Grunau      2023-02-02  1562  				iommus = <&mtp_dart 1>;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1563  				interrupt-parent = <&mtp_dockchannel>;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1564  				interrupts = <2 IRQ_TYPE_LEVEL_HIGH>,
7d2cb73a4e1593 Janne Grunau      2023-02-02  1565  					<3 IRQ_TYPE_LEVEL_HIGH>;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1566  				interrupt-names = "tx", "rx";
7d2cb73a4e1593 Janne Grunau      2023-02-02  1567  
7d2cb73a4e1593 Janne Grunau      2023-02-02  1568  				apple,fifo-size = <0x800>;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1569  				apple,helper-cpu = <&mtp>;
7d2cb73a4e1593 Janne Grunau      2023-02-02  1570  			};
7d2cb73a4e1593 Janne Grunau      2023-02-02  1571  
7d2cb73a4e1593 Janne Grunau      2023-02-02  1572  		};
7d2cb73a4e1593 Janne Grunau      2023-02-02  1573  
b830d7177a9017 Sasha Finkelstein 2024-11-10  1574  		sep_dart: iommu@25d2c0000 {
b830d7177a9017 Sasha Finkelstein 2024-11-10  1575  			compatible = "apple,t8112-dart", "apple,t8110-dart";
b830d7177a9017 Sasha Finkelstein 2024-11-10  1576  			reg = <0x2 0x5d2c0000 0x0 0x4000>;
b830d7177a9017 Sasha Finkelstein 2024-11-10  1577  			#iommu-cells = <1>;
b830d7177a9017 Sasha Finkelstein 2024-11-10  1578  			interrupt-parent = <&aic>;
b830d7177a9017 Sasha Finkelstein 2024-11-10  1579  			interrupts = <AIC_IRQ 282 IRQ_TYPE_LEVEL_HIGH>;
b830d7177a9017 Sasha Finkelstein 2024-11-10  1580  		};
b830d7177a9017 Sasha Finkelstein 2024-11-10  1581  
b830d7177a9017 Sasha Finkelstein 2024-11-10  1582  		sep: sep@25e400000 {
b830d7177a9017 Sasha Finkelstein 2024-11-10  1583  			compatible = "apple,sep";
b830d7177a9017 Sasha Finkelstein 2024-11-10  1584  			reg = <0x2 0x5e400000 0x0 0x6C000>;
b830d7177a9017 Sasha Finkelstein 2024-11-10  1585  			mboxes = <&sep_mbox>;
b830d7177a9017 Sasha Finkelstein 2024-11-10  1586  			mbox-names = "mbox";
b830d7177a9017 Sasha Finkelstein 2024-11-10  1587  			iommus = <&sep_dart 0>;
b830d7177a9017 Sasha Finkelstein 2024-11-10  1588  			status = "disabled";
b830d7177a9017 Sasha Finkelstein 2024-11-10  1589  		};
b830d7177a9017 Sasha Finkelstein 2024-11-10  1590  
b830d7177a9017 Sasha Finkelstein 2024-11-10  1591  		sep_mbox: mbox@25e408000 {
b830d7177a9017 Sasha Finkelstein 2024-11-10  1592  			compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
b830d7177a9017 Sasha Finkelstein 2024-11-10  1593  			reg = <0x2 0x5e408000 0x0 0x4000>;
b830d7177a9017 Sasha Finkelstein 2024-11-10  1594  			interrupt-parent = <&aic>;
b830d7177a9017 Sasha Finkelstein 2024-11-10  1595  			interrupts = <AIC_IRQ 276 IRQ_TYPE_LEVEL_HIGH>,
b830d7177a9017 Sasha Finkelstein 2024-11-10  1596  				<AIC_IRQ 277 IRQ_TYPE_LEVEL_HIGH>,
b830d7177a9017 Sasha Finkelstein 2024-11-10  1597  				<AIC_IRQ 278 IRQ_TYPE_LEVEL_HIGH>,
b830d7177a9017 Sasha Finkelstein 2024-11-10  1598  				<AIC_IRQ 279 IRQ_TYPE_LEVEL_HIGH>;
b830d7177a9017 Sasha Finkelstein 2024-11-10  1599  			interrupt-names = "send-empty", "send-not-empty",
b830d7177a9017 Sasha Finkelstein 2024-11-10  1600  				"recv-empty", "recv-not-empty";
b830d7177a9017 Sasha Finkelstein 2024-11-10  1601  			#mbox-cells = <0>;
b830d7177a9017 Sasha Finkelstein 2024-11-10  1602  		};
b830d7177a9017 Sasha Finkelstein 2024-11-10  1603  
155fc27e8722bc Janne Grunau      2022-12-03  1604  		dispext0_dart: iommu@271304000 {
155fc27e8722bc Janne Grunau      2022-12-03  1605  			compatible = "apple,t8112-dart", "apple,t8110-dart";
155fc27e8722bc Janne Grunau      2022-12-03  1606  			reg = <0x2 0x71304000 0x0 0x4000>;
155fc27e8722bc Janne Grunau      2022-12-03  1607  			#iommu-cells = <1>;
155fc27e8722bc Janne Grunau      2022-12-03  1608  			apple,dma-range = <0x0 0x0 0xf 0xffff0000>;
155fc27e8722bc Janne Grunau      2022-12-03  1609  			interrupt-parent = <&aic>;
155fc27e8722bc Janne Grunau      2022-12-03  1610  			interrupts = <AIC_IRQ 593 IRQ_TYPE_LEVEL_HIGH>;
155fc27e8722bc Janne Grunau      2022-12-03  1611  			power-domains = <&ps_dispext_cpu0>;
155fc27e8722bc Janne Grunau      2022-12-03  1612  			status = "disabled";
155fc27e8722bc Janne Grunau      2022-12-03  1613  		};
155fc27e8722bc Janne Grunau      2022-12-03  1614  
155fc27e8722bc Janne Grunau      2022-12-03  1615  		dcpext_dart: iommu@27130c000 {
155fc27e8722bc Janne Grunau      2022-12-03  1616  			compatible = "apple,t8112-dart", "apple,t8110-dart";
155fc27e8722bc Janne Grunau      2022-12-03  1617  			reg = <0x2 0x7130c000 0x0 0x4000>;
155fc27e8722bc Janne Grunau      2022-12-03  1618  			#iommu-cells = <1>;
155fc27e8722bc Janne Grunau      2022-12-03  1619  			apple,dma-range = <0x8 0x0 0x7 0xffff0000>;
155fc27e8722bc Janne Grunau      2022-12-03  1620  			interrupt-parent = <&aic>;
155fc27e8722bc Janne Grunau      2022-12-03  1621  			interrupts = <AIC_IRQ 593 IRQ_TYPE_LEVEL_HIGH>;
155fc27e8722bc Janne Grunau      2022-12-03  1622  			power-domains = <&ps_dispext_cpu0>;
155fc27e8722bc Janne Grunau      2022-12-03  1623  			status = "disabled";
155fc27e8722bc Janne Grunau      2022-12-03  1624  		};
155fc27e8722bc Janne Grunau      2022-12-03  1625  
155fc27e8722bc Janne Grunau      2022-12-03  1626  		dcpext_mbox: mbox@271c08000 {
155fc27e8722bc Janne Grunau      2022-12-03  1627  			compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
155fc27e8722bc Janne Grunau      2022-12-03  1628  			reg = <0x2 0x71c08000 0x0 0x4000>;
155fc27e8722bc Janne Grunau      2022-12-03  1629  			interrupt-parent = <&aic>;
155fc27e8722bc Janne Grunau      2022-12-03  1630  			interrupts = <AIC_IRQ 578 IRQ_TYPE_LEVEL_HIGH>,
155fc27e8722bc Janne Grunau      2022-12-03  1631  			<AIC_IRQ 579 IRQ_TYPE_LEVEL_HIGH>,
155fc27e8722bc Janne Grunau      2022-12-03  1632  			<AIC_IRQ 580 IRQ_TYPE_LEVEL_HIGH>,
155fc27e8722bc Janne Grunau      2022-12-03  1633  			<AIC_IRQ 581 IRQ_TYPE_LEVEL_HIGH>;
155fc27e8722bc Janne Grunau      2022-12-03  1634  			interrupt-names = "send-empty", "send-not-empty",
155fc27e8722bc Janne Grunau      2022-12-03  1635  			"recv-empty", "recv-not-empty";
155fc27e8722bc Janne Grunau      2022-12-03  1636  			#mbox-cells = <0>;
155fc27e8722bc Janne Grunau      2022-12-03  1637  			power-domains = <&ps_dispext_cpu0>;
155fc27e8722bc Janne Grunau      2022-12-03  1638  			resets = <&ps_dispext_cpu0>;
155fc27e8722bc Janne Grunau      2022-12-03  1639  			status = "disabled";
155fc27e8722bc Janne Grunau      2022-12-03  1640  		};
155fc27e8722bc Janne Grunau      2022-12-03  1641  
155fc27e8722bc Janne Grunau      2022-12-03  1642  		dcpext: dcp@271c00000 {
155fc27e8722bc Janne Grunau      2022-12-03  1643  			compatible = "apple,t8112-dcpext", "apple,dcpext";
155fc27e8722bc Janne Grunau      2022-12-03  1644  			mboxes = <&dcpext_mbox>;
155fc27e8722bc Janne Grunau      2022-12-03  1645  			mbox-names = "mbox";
155fc27e8722bc Janne Grunau      2022-12-03  1646  			iommus = <&dcpext_dart 5>;
155fc27e8722bc Janne Grunau      2022-12-03  1647  			phandle = <&dcpext>;
155fc27e8722bc Janne Grunau      2022-12-03  1648  
155fc27e8722bc Janne Grunau      2022-12-03  1649  			/* the ADT has 2 additional regs which seems to be unused */
155fc27e8722bc Janne Grunau      2022-12-03  1650  			reg-names = "coproc", "disp-0", "disp-1", "disp-2", "disp-3";
155fc27e8722bc Janne Grunau      2022-12-03  1651  			reg = <0x2 0x71c00000 0x0 0x4000>,
155fc27e8722bc Janne Grunau      2022-12-03  1652  			      <0x2 0x70000000 0x0 0x61C000>,
155fc27e8722bc Janne Grunau      2022-12-03  1653  			      <0x2 0x71320000 0x0 0x4000>,
155fc27e8722bc Janne Grunau      2022-12-03  1654  			      <0x2 0x71344000 0x0 0x4000>,
155fc27e8722bc Janne Grunau      2022-12-03  1655  			      <0x2 0x71800000 0x0 0x800000>;
155fc27e8722bc Janne Grunau      2022-12-03  1656  			apple,bw-scratch = <&pmgr_dcp 0 4 0x5e0>;
155fc27e8722bc Janne Grunau      2022-12-03  1657  			power-domains = <&ps_dispext_cpu0>;
155fc27e8722bc Janne Grunau      2022-12-03  1658  			resets = <&ps_dispext_cpu0>;
155fc27e8722bc Janne Grunau      2022-12-03  1659  			clocks = <&clk_dispext0>;
155fc27e8722bc Janne Grunau      2022-12-03  1660  			apple,dcp-index = <1>;
155fc27e8722bc Janne Grunau      2022-12-03  1661  			status = "disabled";
155fc27e8722bc Janne Grunau      2022-12-03  1662  
155fc27e8722bc Janne Grunau      2022-12-03  1663  			piodma {
155fc27e8722bc Janne Grunau      2022-12-03  1664  				iommus = <&dispext0_dart 4>;
155fc27e8722bc Janne Grunau      2022-12-03  1665  			};
9227eb64b4ab27 Janne Grunau      2023-11-13  1666  
9227eb64b4ab27 Janne Grunau      2023-11-13  1667  			ports {
9227eb64b4ab27 Janne Grunau      2023-11-13  1668  				#address-cells = <1>;
9227eb64b4ab27 Janne Grunau      2023-11-13  1669  				#size-cells = <0>;
9227eb64b4ab27 Janne Grunau      2023-11-13  1670  				port@0 {
9227eb64b4ab27 Janne Grunau      2023-11-13  1671  					reg = <0>;
9227eb64b4ab27 Janne Grunau      2023-11-13  1672  					dcpext_audio: endpoint {
9227eb64b4ab27 Janne Grunau      2023-11-13  1673  						remote-endpoint = <&dpaudio1_dcp>;
9227eb64b4ab27 Janne Grunau      2023-11-13  1674  					};
9227eb64b4ab27 Janne Grunau      2023-11-13  1675  				};
9227eb64b4ab27 Janne Grunau      2023-11-13  1676  			};
155fc27e8722bc Janne Grunau      2022-12-03  1677  		};
155fc27e8722bc Janne Grunau      2022-12-03  1678  
2d5ce3fbef3242 Hector Martin     2023-03-07  1679  		ans_mbox: mbox@277408000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1680  			compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
2d5ce3fbef3242 Hector Martin     2023-03-07  1681  			reg = <0x2 0x77408000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1682  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1683  			interrupts = <AIC_IRQ 717 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1684  				<AIC_IRQ 718 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1685  				<AIC_IRQ 719 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1686  				<AIC_IRQ 720 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1687  			interrupt-names = "send-empty", "send-not-empty",
2d5ce3fbef3242 Hector Martin     2023-03-07  1688  				"recv-empty", "recv-not-empty";
2d5ce3fbef3242 Hector Martin     2023-03-07  1689  			#mbox-cells = <0>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1690  			power-domains = <&ps_ans>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1691  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1692  
2d5ce3fbef3242 Hector Martin     2023-03-07  1693  		sart: sart@27bc50000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1694  			compatible = "apple,t8112-sart", "apple,t6000-sart";
2d5ce3fbef3242 Hector Martin     2023-03-07  1695  			reg = <0x2 0x7bc50000 0x0 0x10000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1696  			power-domains = <&ps_ans>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1697  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1698  
2d5ce3fbef3242 Hector Martin     2023-03-07  1699  		nvme@27bcc0000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1700  			compatible = "apple,t8112-nvme-ans2", "apple,nvme-ans2";
2d5ce3fbef3242 Hector Martin     2023-03-07  1701  			reg = <0x2 0x7bcc0000 0x0 0x40000>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1702  				<0x2 0x77400000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1703  			reg-names = "nvme", "ans";
2d5ce3fbef3242 Hector Martin     2023-03-07  1704  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1705  			interrupts = <AIC_IRQ 724 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1706  			mboxes = <&ans_mbox>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1707  			apple,sart = <&sart>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1708  			power-domains = <&ps_ans>, <&ps_apcie_st>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1709  			power-domain-names = "ans", "apcie0";
2d5ce3fbef3242 Hector Martin     2023-03-07  1710  			resets = <&ps_ans>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1711  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1712  
2b67b19a6d7c9d Janne Grunau      2023-02-02  1713  		dwc3_0: usb@382280000 {
2b67b19a6d7c9d Janne Grunau      2023-02-02  1714  			compatible = "apple,t8112-dwc3", "apple,dwc3", "snps,dwc3";
2b67b19a6d7c9d Janne Grunau      2023-02-02  1715  			reg = <0x3 0x82280000 0x0 0x100000>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1716  			interrupt-parent = <&aic>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1717  			interrupts = <AIC_IRQ 1031 IRQ_TYPE_LEVEL_HIGH>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1718  			dr_mode = "otg";
2b67b19a6d7c9d Janne Grunau      2023-02-02  1719  			usb-role-switch;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1720  			role-switch-default-mode = "host";
2b67b19a6d7c9d Janne Grunau      2023-02-02  1721  			iommus = <&dwc3_0_dart_0 0>, <&dwc3_0_dart_1 1>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1722  			power-domains = <&ps_atc0_usb>;
cf3958e5e59f9a Janne Grunau      2022-11-15  1723  			resets = <&atcphy0>;
cf3958e5e59f9a Janne Grunau      2022-11-15  1724  			phys = <&atcphy0 PHY_TYPE_USB2>, <&atcphy0 PHY_TYPE_USB3>;
cf3958e5e59f9a Janne Grunau      2022-11-15  1725  			phy-names = "usb2-phy", "usb3-phy";
2b67b19a6d7c9d Janne Grunau      2023-02-02  1726  		};
2b67b19a6d7c9d Janne Grunau      2023-02-02  1727  
2b67b19a6d7c9d Janne Grunau      2023-02-02  1728  		dwc3_0_dart_0: iommu@382f00000 {
2b67b19a6d7c9d Janne Grunau      2023-02-02  1729  			compatible = "apple,t8112-dart", "apple,t8110-dart";
2b67b19a6d7c9d Janne Grunau      2023-02-02  1730  			reg = <0x3 0x82f00000 0x0 0x4000>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1731  			interrupt-parent = <&aic>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1732  			interrupts = <AIC_IRQ 1035 IRQ_TYPE_LEVEL_HIGH>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1733  			#iommu-cells = <1>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1734  			power-domains = <&ps_atc0_usb>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1735  		};
2b67b19a6d7c9d Janne Grunau      2023-02-02  1736  
2b67b19a6d7c9d Janne Grunau      2023-02-02  1737  		dwc3_0_dart_1: iommu@382f80000 {
2b67b19a6d7c9d Janne Grunau      2023-02-02  1738  			compatible = "apple,t8112-dart", "apple,t8110-dart";
2b67b19a6d7c9d Janne Grunau      2023-02-02  1739  			reg = <0x3 0x82f80000 0x0 0x4000>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1740  			interrupt-parent = <&aic>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1741  			interrupts = <AIC_IRQ 1035 IRQ_TYPE_LEVEL_HIGH>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1742  			#iommu-cells = <1>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1743  			power-domains = <&ps_atc0_usb>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1744  		};
2b67b19a6d7c9d Janne Grunau      2023-02-02  1745  
cf3958e5e59f9a Janne Grunau      2022-11-15  1746  		atcphy0: phy@383000000 {
cf3958e5e59f9a Janne Grunau      2022-11-15  1747  			compatible = "apple,t8112-atcphy", "apple,t8103-atcphy";
cf3958e5e59f9a Janne Grunau      2022-11-15  1748  			reg = <0x3 0x83000000 0x0 0x4c000>,
cf3958e5e59f9a Janne Grunau      2022-11-15  1749  				<0x3 0x83050000 0x0 0x8000>,
cf3958e5e59f9a Janne Grunau      2022-11-15  1750  				<0x3 0x80000000 0x0 0x4000>,
cf3958e5e59f9a Janne Grunau      2022-11-15  1751  				<0x3 0x82a90000 0x0 0x4000>,
cf3958e5e59f9a Janne Grunau      2022-11-15  1752  				<0x3 0x82a84000 0x0 0x4000>;
cf3958e5e59f9a Janne Grunau      2022-11-15  1753  			reg-names = "core", "lpdptx", "axi2af", "usb2phy",
cf3958e5e59f9a Janne Grunau      2022-11-15  1754  				"pipehandler";
cf3958e5e59f9a Janne Grunau      2022-11-15  1755  
cf3958e5e59f9a Janne Grunau      2022-11-15  1756  			#phy-cells = <1>;
cf3958e5e59f9a Janne Grunau      2022-11-15  1757  			#reset-cells = <0>;
cf3958e5e59f9a Janne Grunau      2022-11-15  1758  
cf3958e5e59f9a Janne Grunau      2022-11-15  1759  			nvmem-cells = <&atcphy0_aus_cmn_shm_vreg_trim>,
cf3958e5e59f9a Janne Grunau      2022-11-15  1760  				<&atcphy0_auspll_rodco_encap>,
cf3958e5e59f9a Janne Grunau      2022-11-15  1761  				<&atcphy0_auspll_rodco_bias_adjust>,
cf3958e5e59f9a Janne Grunau      2022-11-15  1762  				<&atcphy0_auspll_fracn_dll_start_capcode>,
cf3958e5e59f9a Janne Grunau      2022-11-15  1763  				<&atcphy0_auspll_dtc_vreg_adjust>,
cf3958e5e59f9a Janne Grunau      2022-11-15  1764  				<&atcphy0_cio3pll_dco_coarsebin0>,
cf3958e5e59f9a Janne Grunau      2022-11-15  1765  				<&atcphy0_cio3pll_dco_coarsebin1>,
cf3958e5e59f9a Janne Grunau      2022-11-15  1766  				<&atcphy0_cio3pll_dll_start_capcode>,
cf3958e5e59f9a Janne Grunau      2022-11-15  1767  				<&atcphy0_cio3pll_dtc_vreg_adjust>;
cf3958e5e59f9a Janne Grunau      2022-11-15  1768  			nvmem-cell-names =  "aus_cmn_shm_vreg_trim",
cf3958e5e59f9a Janne Grunau      2022-11-15  1769  				"auspll_rodco_encap",
cf3958e5e59f9a Janne Grunau      2022-11-15  1770  				"auspll_rodco_bias_adjust",
cf3958e5e59f9a Janne Grunau      2022-11-15  1771  				"auspll_fracn_dll_start_capcode",
cf3958e5e59f9a Janne Grunau      2022-11-15  1772  				"auspll_dtc_vreg_adjust",
cf3958e5e59f9a Janne Grunau      2022-11-15  1773  				"cio3pll_dco_coarsebin0",
cf3958e5e59f9a Janne Grunau      2022-11-15  1774  				"cio3pll_dco_coarsebin1",
cf3958e5e59f9a Janne Grunau      2022-11-15  1775  				"cio3pll_dll_start_capcode",
cf3958e5e59f9a Janne Grunau      2022-11-15  1776  				"cio3pll_dtc_vreg_adjust";
cf3958e5e59f9a Janne Grunau      2022-11-15  1777  
cf3958e5e59f9a Janne Grunau      2022-11-15  1778  			orientation-switch;
cf3958e5e59f9a Janne Grunau      2022-11-15  1779  			mode-switch;
cf3958e5e59f9a Janne Grunau      2022-11-15  1780  			svid = <0xff01>, <0x8087>;
cf3958e5e59f9a Janne Grunau      2022-11-15  1781  			power-domains = <&ps_atc0_usb>;
cf3958e5e59f9a Janne Grunau      2022-11-15  1782  		};
cf3958e5e59f9a Janne Grunau      2022-11-15  1783  
2b67b19a6d7c9d Janne Grunau      2023-02-02  1784  		dwc3_1: usb@502280000 {
2b67b19a6d7c9d Janne Grunau      2023-02-02  1785  			compatible = "apple,t8112-dwc3", "apple,dwc3", "snps,dwc3";
2b67b19a6d7c9d Janne Grunau      2023-02-02  1786  			reg = <0x5 0x02280000 0x0 0x100000>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1787  			interrupt-parent = <&aic>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1788  			interrupts = <AIC_IRQ 1112 IRQ_TYPE_LEVEL_HIGH>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1789  			dr_mode = "otg";
2b67b19a6d7c9d Janne Grunau      2023-02-02  1790  			usb-role-switch;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1791  			role-switch-default-mode = "host";
2b67b19a6d7c9d Janne Grunau      2023-02-02  1792  			iommus = <&dwc3_1_dart_0 0>, <&dwc3_1_dart_1 1>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1793  			power-domains = <&ps_atc1_usb>;
cf3958e5e59f9a Janne Grunau      2022-11-15  1794  			resets = <&atcphy1>;
cf3958e5e59f9a Janne Grunau      2022-11-15  1795  			phys = <&atcphy1 PHY_TYPE_USB2>, <&atcphy1 PHY_TYPE_USB3>;
cf3958e5e59f9a Janne Grunau      2022-11-15  1796  			phy-names = "usb2-phy", "usb3-phy";
2b67b19a6d7c9d Janne Grunau      2023-02-02  1797  		};
2b67b19a6d7c9d Janne Grunau      2023-02-02  1798  
2b67b19a6d7c9d Janne Grunau      2023-02-02  1799  		dwc3_1_dart_0: iommu@502f00000 {
2b67b19a6d7c9d Janne Grunau      2023-02-02  1800  			compatible = "apple,t8112-dart", "apple,t8110-dart";
2b67b19a6d7c9d Janne Grunau      2023-02-02  1801  			reg = <0x5 0x02f00000 0x0 0x4000>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1802  			interrupt-parent = <&aic>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1803  			interrupts = <AIC_IRQ 1116 IRQ_TYPE_LEVEL_HIGH>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1804  			#iommu-cells = <1>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1805  			power-domains = <&ps_atc1_usb>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1806  		};
2b67b19a6d7c9d Janne Grunau      2023-02-02  1807  
2b67b19a6d7c9d Janne Grunau      2023-02-02  1808  		dwc3_1_dart_1: iommu@502f80000 {
2b67b19a6d7c9d Janne Grunau      2023-02-02  1809  			compatible = "apple,t8112-dart", "apple,t8110-dart";
2b67b19a6d7c9d Janne Grunau      2023-02-02  1810  			reg = <0x5 0x02f80000 0x0 0x4000>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1811  			interrupt-parent = <&aic>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1812  			interrupts = <AIC_IRQ 1116 IRQ_TYPE_LEVEL_HIGH>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1813  			#iommu-cells = <1>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1814  			power-domains = <&ps_atc1_usb>;
2b67b19a6d7c9d Janne Grunau      2023-02-02  1815  		};
2b67b19a6d7c9d Janne Grunau      2023-02-02  1816  
cf3958e5e59f9a Janne Grunau      2022-11-15  1817  		atcphy1: phy@503000000 {
cf3958e5e59f9a Janne Grunau      2022-11-15  1818  			compatible = "apple,t8112-atcphy", "apple,t8103-atcphy";
cf3958e5e59f9a Janne Grunau      2022-11-15  1819  			reg = <0x5 0x03000000 0x0 0x4c000>,
cf3958e5e59f9a Janne Grunau      2022-11-15  1820  				<0x5 0x03050000 0x0 0x8000>,
cf3958e5e59f9a Janne Grunau      2022-11-15  1821  				<0x5 0x0 0x0 0x4000>,
cf3958e5e59f9a Janne Grunau      2022-11-15  1822  				<0x5 0x02a90000 0x0 0x4000>,
cf3958e5e59f9a Janne Grunau      2022-11-15  1823  				<0x5 0x02a84000 0x0 0x4000>;
cf3958e5e59f9a Janne Grunau      2022-11-15  1824  			reg-names = "core", "lpdptx", "axi2af", "usb2phy",
cf3958e5e59f9a Janne Grunau      2022-11-15  1825  				"pipehandler";
cf3958e5e59f9a Janne Grunau      2022-11-15  1826  
cf3958e5e59f9a Janne Grunau      2022-11-15  1827  			nvmem-cells = <&atcphy1_aus_cmn_shm_vreg_trim>,
cf3958e5e59f9a Janne Grunau      2022-11-15  1828  				<&atcphy1_auspll_rodco_encap>,
cf3958e5e59f9a Janne Grunau      2022-11-15  1829  				<&atcphy1_auspll_rodco_bias_adjust>,
cf3958e5e59f9a Janne Grunau      2022-11-15  1830  				<&atcphy1_auspll_fracn_dll_start_capcode>,
cf3958e5e59f9a Janne Grunau      2022-11-15  1831  				<&atcphy1_auspll_dtc_vreg_adjust>,
cf3958e5e59f9a Janne Grunau      2022-11-15  1832  				<&atcphy1_cio3pll_dco_coarsebin0>,
cf3958e5e59f9a Janne Grunau      2022-11-15  1833  				<&atcphy1_cio3pll_dco_coarsebin1>,
cf3958e5e59f9a Janne Grunau      2022-11-15  1834  				<&atcphy1_cio3pll_dll_start_capcode>,
cf3958e5e59f9a Janne Grunau      2022-11-15  1835  				<&atcphy1_cio3pll_dtc_vreg_adjust>;
cf3958e5e59f9a Janne Grunau      2022-11-15  1836  			nvmem-cell-names =  "aus_cmn_shm_vreg_trim",
cf3958e5e59f9a Janne Grunau      2022-11-15  1837  				"auspll_rodco_encap",
cf3958e5e59f9a Janne Grunau      2022-11-15  1838  				"auspll_rodco_bias_adjust",
cf3958e5e59f9a Janne Grunau      2022-11-15  1839  				"auspll_fracn_dll_start_capcode",
cf3958e5e59f9a Janne Grunau      2022-11-15  1840  				"auspll_dtc_vreg_adjust",
cf3958e5e59f9a Janne Grunau      2022-11-15  1841  				"cio3pll_dco_coarsebin0",
cf3958e5e59f9a Janne Grunau      2022-11-15  1842  				"cio3pll_dco_coarsebin1",
cf3958e5e59f9a Janne Grunau      2022-11-15  1843  				"cio3pll_dll_start_capcode",
cf3958e5e59f9a Janne Grunau      2022-11-15  1844  				"cio3pll_dtc_vreg_adjust";
cf3958e5e59f9a Janne Grunau      2022-11-15  1845  
cf3958e5e59f9a Janne Grunau      2022-11-15  1846  			#phy-cells = <1>;
cf3958e5e59f9a Janne Grunau      2022-11-15  1847  			#reset-cells = <0>;
cf3958e5e59f9a Janne Grunau      2022-11-15  1848  
cf3958e5e59f9a Janne Grunau      2022-11-15  1849  			orientation-switch;
cf3958e5e59f9a Janne Grunau      2022-11-15  1850  			mode-switch;
cf3958e5e59f9a Janne Grunau      2022-11-15  1851  			svid = <0xff01>, <0x8087>;
cf3958e5e59f9a Janne Grunau      2022-11-15  1852  			power-domains = <&ps_atc1_usb>;
cf3958e5e59f9a Janne Grunau      2022-11-15  1853  		};
cf3958e5e59f9a Janne Grunau      2022-11-15  1854  
2d5ce3fbef3242 Hector Martin     2023-03-07  1855  		pcie0_dart: iommu@681008000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1856  			compatible = "apple,t8110-dart";
2d5ce3fbef3242 Hector Martin     2023-03-07  1857  			reg = <0x6 0x81008000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1858  			#iommu-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1859  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1860  			interrupts = <AIC_IRQ 782 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1861  			power-domains = <&ps_apcie_gp>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1862  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1863  
2d5ce3fbef3242 Hector Martin     2023-03-07  1864  		pcie1_dart: iommu@682008000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1865  			compatible = "apple,t8110-dart";
2d5ce3fbef3242 Hector Martin     2023-03-07  1866  			reg = <0x6 0x82008000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1867  			#iommu-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1868  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1869  			interrupts = <AIC_IRQ 785 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1870  			power-domains = <&ps_apcie_gp>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1871  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07  1872  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1873  
2d5ce3fbef3242 Hector Martin     2023-03-07  1874  		pcie2_dart: iommu@683008000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1875  			compatible = "apple,t8110-dart";
2d5ce3fbef3242 Hector Martin     2023-03-07  1876  			reg = <0x6 0x83008000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1877  			#iommu-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1878  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1879  			interrupts = <AIC_IRQ 788 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1880  			power-domains = <&ps_apcie_gp>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1881  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07  1882  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1883  
2d5ce3fbef3242 Hector Martin     2023-03-07  1884  		pcie3_dart: iommu@684008000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1885  			compatible = "apple,t8110-dart";
2d5ce3fbef3242 Hector Martin     2023-03-07  1886  			reg = <0x6 0x84008000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1887  			#iommu-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1888  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1889  			interrupts = <AIC_IRQ 791 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1890  			power-domains = <&ps_apcie_gp>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1891  			status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07  1892  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  1893  
2d5ce3fbef3242 Hector Martin     2023-03-07  1894  		pcie0: pcie@690000000 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1895  			compatible = "apple,t8112-pcie", "apple,pcie";
2d5ce3fbef3242 Hector Martin     2023-03-07  1896  			device_type = "pci";
2d5ce3fbef3242 Hector Martin     2023-03-07  1897  
2d5ce3fbef3242 Hector Martin     2023-03-07  1898  			reg = <0x6 0x90000000 0x0 0x1000000>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1899  			      <0x6 0x80000000 0x0 0x100000>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1900  			      <0x6 0x81000000 0x0 0x4000>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1901  			      <0x6 0x82000000 0x0 0x4000>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1902  			      <0x6 0x83000000 0x0 0x4000>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1903  			      <0x6 0x84000000 0x0 0x4000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1904  			reg-names = "config", "rc", "port0", "port1", "port2", "port3";
2d5ce3fbef3242 Hector Martin     2023-03-07  1905  
2d5ce3fbef3242 Hector Martin     2023-03-07  1906  			interrupt-parent = <&aic>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1907  			interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1908  				     <AIC_IRQ 784 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1909  				     <AIC_IRQ 787 IRQ_TYPE_LEVEL_HIGH>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1910  				     <AIC_IRQ 790 IRQ_TYPE_LEVEL_HIGH>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1911  
2d5ce3fbef3242 Hector Martin     2023-03-07  1912  			msi-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1913  			msi-parent = <&pcie0>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1914  			msi-ranges = <&aic AIC_IRQ 793 IRQ_TYPE_EDGE_RISING 32>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1915  
2d5ce3fbef3242 Hector Martin     2023-03-07  1916  			iommu-map = <0x100 &pcie0_dart 0 1>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1917  				    <0x200 &pcie1_dart 1 1>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1918  				    <0x300 &pcie2_dart 2 1>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1919  				    <0x400 &pcie3_dart 3 1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1920  			iommu-map-mask = <0xff00>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1921  
2d5ce3fbef3242 Hector Martin     2023-03-07  1922  			bus-range = <0 4>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1923  			#address-cells = <3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1924  			#size-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1925  			ranges = <0x43000000 0x6 0xa0000000 0x6 0xa0000000 0x0 0x20000000>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1926  				 <0x02000000 0x0 0xc0000000 0x6 0xc0000000 0x0 0x40000000>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1927  
2d5ce3fbef3242 Hector Martin     2023-03-07  1928  			power-domains = <&ps_apcie_gp>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1929  			pinctrl-0 = <&pcie_pins>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1930  			pinctrl-names = "default";
2d5ce3fbef3242 Hector Martin     2023-03-07  1931  
2d5ce3fbef3242 Hector Martin     2023-03-07  1932  			port00: pci@0,0 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1933  				device_type = "pci";
2d5ce3fbef3242 Hector Martin     2023-03-07  1934  				reg = <0x0 0x0 0x0 0x0 0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1935  				reset-gpios = <&pinctrl_ap 166 GPIO_ACTIVE_LOW>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1936  
2d5ce3fbef3242 Hector Martin     2023-03-07  1937  				#address-cells = <3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1938  				#size-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1939  				ranges;
2d5ce3fbef3242 Hector Martin     2023-03-07  1940  
2d5ce3fbef3242 Hector Martin     2023-03-07  1941  				interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1942  				#interrupt-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1943  
2d5ce3fbef3242 Hector Martin     2023-03-07  1944  				interrupt-map-mask = <0 0 0 7>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1945  				interrupt-map = <0 0 0 1 &port00 0 0 0 0>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1946  						<0 0 0 2 &port00 0 0 0 1>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1947  						<0 0 0 3 &port00 0 0 0 2>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1948  						<0 0 0 4 &port00 0 0 0 3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1949  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1950  
2d5ce3fbef3242 Hector Martin     2023-03-07  1951  			port01: pci@1,0 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1952  				device_type = "pci";
2d5ce3fbef3242 Hector Martin     2023-03-07  1953  				reg = <0x800 0x0 0x0 0x0 0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1954  				reset-gpios = <&pinctrl_ap 167 GPIO_ACTIVE_LOW>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1955  
2d5ce3fbef3242 Hector Martin     2023-03-07  1956  				#address-cells = <3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1957  				#size-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1958  				ranges;
2d5ce3fbef3242 Hector Martin     2023-03-07  1959  
2d5ce3fbef3242 Hector Martin     2023-03-07  1960  				interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1961  				#interrupt-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1962  
2d5ce3fbef3242 Hector Martin     2023-03-07  1963  				interrupt-map-mask = <0 0 0 7>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1964  				interrupt-map = <0 0 0 1 &port01 0 0 0 0>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1965  						<0 0 0 2 &port01 0 0 0 1>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1966  						<0 0 0 3 &port01 0 0 0 2>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1967  						<0 0 0 4 &port01 0 0 0 3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1968  
2d5ce3fbef3242 Hector Martin     2023-03-07  1969  				status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07  1970  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1971  
2d5ce3fbef3242 Hector Martin     2023-03-07  1972  			port02: pci@2,0 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1973  				device_type = "pci";
2d5ce3fbef3242 Hector Martin     2023-03-07  1974  				reg = <0x1000 0x0 0x0 0x0 0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1975  				reset-gpios = <&pinctrl_ap 168 GPIO_ACTIVE_LOW>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1976  
2d5ce3fbef3242 Hector Martin     2023-03-07  1977  				#address-cells = <3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1978  				#size-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1979  				ranges;
2d5ce3fbef3242 Hector Martin     2023-03-07  1980  
2d5ce3fbef3242 Hector Martin     2023-03-07  1981  				interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  1982  				#interrupt-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1983  
2d5ce3fbef3242 Hector Martin     2023-03-07  1984  				interrupt-map-mask = <0 0 0 7>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1985  				interrupt-map = <0 0 0 1 &port02 0 0 0 0>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1986  						<0 0 0 2 &port02 0 0 0 1>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1987  						<0 0 0 3 &port02 0 0 0 2>,
2d5ce3fbef3242 Hector Martin     2023-03-07  1988  						<0 0 0 4 &port02 0 0 0 3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1989  
2d5ce3fbef3242 Hector Martin     2023-03-07  1990  				status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07  1991  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  1992  
2d5ce3fbef3242 Hector Martin     2023-03-07  1993  			/* TODO: GPIO unknown */
2d5ce3fbef3242 Hector Martin     2023-03-07  1994  			port03: pci@3,0 {
2d5ce3fbef3242 Hector Martin     2023-03-07  1995  				device_type = "pci";
2d5ce3fbef3242 Hector Martin     2023-03-07  1996  				reg = <0x1800 0x0 0x0 0x0 0x0>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1997  				//reset-gpios = <&pinctrl_ap 33 GPIO_ACTIVE_LOW>;
2d5ce3fbef3242 Hector Martin     2023-03-07  1998  
2d5ce3fbef3242 Hector Martin     2023-03-07  1999  				#address-cells = <3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  2000  				#size-cells = <2>;
2d5ce3fbef3242 Hector Martin     2023-03-07  2001  				ranges;
2d5ce3fbef3242 Hector Martin     2023-03-07  2002  
2d5ce3fbef3242 Hector Martin     2023-03-07  2003  				interrupt-controller;
2d5ce3fbef3242 Hector Martin     2023-03-07  2004  				#interrupt-cells = <1>;
2d5ce3fbef3242 Hector Martin     2023-03-07  2005  
2d5ce3fbef3242 Hector Martin     2023-03-07  2006  				interrupt-map-mask = <0 0 0 7>;
2d5ce3fbef3242 Hector Martin     2023-03-07  2007  				interrupt-map = <0 0 0 1 &port03 0 0 0 0>,
2d5ce3fbef3242 Hector Martin     2023-03-07  2008  						<0 0 0 2 &port03 0 0 0 1>,
2d5ce3fbef3242 Hector Martin     2023-03-07  2009  						<0 0 0 3 &port03 0 0 0 2>,
2d5ce3fbef3242 Hector Martin     2023-03-07  2010  						<0 0 0 4 &port03 0 0 0 3>;
2d5ce3fbef3242 Hector Martin     2023-03-07  2011  
2d5ce3fbef3242 Hector Martin     2023-03-07  2012  				status = "disabled";
2d5ce3fbef3242 Hector Martin     2023-03-07  2013  			};
2d5ce3fbef3242 Hector Martin     2023-03-07  2014  		};
2d5ce3fbef3242 Hector Martin     2023-03-07  2015  	};
2d5ce3fbef3242 Hector Martin     2023-03-07  2016  };
2d5ce3fbef3242 Hector Martin     2023-03-07  2017  

:::::: The code at line 682 was first introduced by commit
:::::: f68bb847349e419cf7085981775e5903fe58013b arm64: dts: apple: t8112: Add dcp/disp0 nodes

:::::: TO: Janne Grunau <j@jannau.net>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
