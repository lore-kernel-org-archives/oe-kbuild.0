Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE3F1F4177
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 04:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754542627; cv=none; b=H4QEycHc4VF2/399Ku5PESwzi3pWBepf8nk540ibVAH8/0EQwZozqyJrrLH2VQ8MFnppKGWvgDnZGfU/gS13E3MCwSpVUHShNd6fLP0gVXDJO+XqD1H19hFedkWU4BTzSYXbcq2d3YkrFZjz9gX6rFeZIKQONTkKbLD45C+8ppk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754542627; c=relaxed/simple;
	bh=esNWjTPzyF71FQai17OSBgdOliLVB7e1zv7ljVVs2TI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FYmUfwwlX6E6j53ByzalnD8YHPf619pdazDguQSDjbePg/h3K3V5gofJcDMLFChUvZK+9Z48Y3wEU1MdL13xLSvJRk76R1kniQSd1C9HeyJQJQ3cjF+Xe4cyarJrvZbM4CoYtbVMRBVuU/PolajgaUOclfjcOyyNAw9/dUvANXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ex3aCavs; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ex3aCavs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754542625; x=1786078625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=esNWjTPzyF71FQai17OSBgdOliLVB7e1zv7ljVVs2TI=;
  b=Ex3aCavsCWYqddQq0vOxb4bY8Y0REz2Xu/FplBi8u2SZvtvHFmZRej7b
   BXn7xnMzncyqox4xrBUi9c4N1PrhoysYxAbvXohu5OLqqbrgA2csMFmfa
   joIXvXKRXdlbZaJxuL2m36pQwWsemIIWc07nalm5qNZm+aNgQB0j0BokA
   5qdWtFZ6FWCL0pCbp+bF0ZVGkmo84iDDbkt2BkUyl245OPStHva9NoXbd
   8Psz2BajPyNZZRzEjSCaVzW1+MlMjoWn0fGYLC9FbEokGY4iPXeseQZlD
   z+MYeLJLT4hTBjX3tuhSDjIYin0oCL2v+Z8Tbvc0Ob3Tn5PxjQ1PIubZr
   w==;
X-CSE-ConnectionGUID: VA+b7P6TQ8qx3uW7SRAvsg==
X-CSE-MsgGUID: 9rw96eblR3iRiRtO7+Nu4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56947800"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56947800"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 21:57:00 -0700
X-CSE-ConnectionGUID: kudNEeKPTpeSEwNfzi0Jsg==
X-CSE-MsgGUID: pfEGI9BITSWbeODJx6tulg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164860562"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 06 Aug 2025 21:56:59 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujsgT-0002OC-0D;
	Thu, 07 Aug 2025 04:56:57 +0000
Date: Thu, 7 Aug 2025 12:56:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 8/801] arch/arc/boot/dts/vdk_hs38.dtb: /
 (snps,axs103): compatible: ['snps,axs103'] is too short
Message-ID: <202508071240.jADsyUBj-lkp@intel.com>
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
commit: 632c0f9807e246d0e203d25b60335ffab87ae192 [8/801] dt-bindings: arc: Convert snps,arc-sdp to DT schema
:::::: branch date: 11 hours ago
:::::: commit date: 29 hours ago
config: arc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071240.jADsyUBj-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071240.jADsyUBj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508071240.jADsyUBj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/vdk_axc003.dtsi:17.11-47.4: Warning (unit_address_vs_reg): /cpu_card: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/vdk_axc003.dtsi:30.29-34.5: Warning (unit_address_vs_reg): /cpu_card/archs-intc@cpu: node has a unit name, but no reg or ranges property
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:9.16-111.4: Warning (unit_address_vs_reg): /axs10x_mb_vdk: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/vdk_axc003.dtsi:24.22-28.5: Warning (simple_bus_reg): /cpu_card/core_clk: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axc003.dtsi:30.29-34.5: Warning (simple_bus_reg): /cpu_card/archs-intc@cpu: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:16.10-34.5: Warning (simple_bus_reg): /axs10x_mb_vdk/clocks: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:94.21-99.5: Warning (simple_bus_reg): /axs10x_mb_vdk/ps2@e0017400: simple-bus unit address format error, expected "17400"
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:36.18-47.5: Warning (interrupt_provider): /axs10x_mb_vdk/ethernet@18000: '#interrupt-cells' found, but node is not an interrupt provider
   arch/arc/boot/dts/vdk_hs38.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
>> arch/arc/boot/dts/vdk_hs38.dtb: / (snps,axs103): compatible: ['snps,axs103'] is too short
   	from schema $id: http://devicetree.org/schemas/snps,arc-sdp.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: / (snps,axs103): memory: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: / (snps,axs103): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 536870912]], '#address-cells': 1, '#size-cells': 1, 'ranges': [[0, 2147483648, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/vdk_hs38.dtb: /rtc: failed to match any schema with compatible: ['snps,archs-timer-rtc']
   arch/arc/boot/dts/vdk_hs38.dtb: cpu_card (simple-bus): archs-intc@cpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: cpu_card (simple-bus): core_clk: 'ranges' is a required property
--
   arch/arc/boot/dts/vdk_axc003_idu.dtsi:18.11-55.4: Warning (unit_address_vs_reg): /cpu_card: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/vdk_axc003_idu.dtsi:31.29-35.5: Warning (unit_address_vs_reg): /cpu_card/archs-intc@cpu: node has a unit name, but no reg or ranges property
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:9.16-111.4: Warning (unit_address_vs_reg): /axs10x_mb_vdk: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/vdk_axc003_idu.dtsi:25.22-29.5: Warning (simple_bus_reg): /cpu_card/core_clk: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axc003_idu.dtsi:31.29-35.5: Warning (simple_bus_reg): /cpu_card/archs-intc@cpu: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axc003_idu.dtsi:37.38-42.5: Warning (simple_bus_reg): /cpu_card/idu-interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:16.10-34.5: Warning (simple_bus_reg): /axs10x_mb_vdk/clocks: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:94.21-99.5: Warning (simple_bus_reg): /axs10x_mb_vdk/ps2@e0017400: simple-bus unit address format error, expected "17400"
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:36.18-47.5: Warning (interrupt_provider): /axs10x_mb_vdk/ethernet@18000: '#interrupt-cells' found, but node is not an interrupt provider
   arch/arc/boot/dts/vdk_hs38_smp.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: / (snps,axs103): compatible: ['snps,axs103'] is too short
   	from schema $id: http://devicetree.org/schemas/snps,arc-sdp.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: / (snps,axs103): memory: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: / (snps,axs103): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 536870912]], '#address-cells': 1, '#size-cells': 1, 'ranges': [[0, 2147483648, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/vdk_hs38_smp.dtb: /cpus/cpu@1: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/vdk_hs38_smp.dtb: /cpus/cpu@2: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/vdk_hs38_smp.dtb: /cpus/cpu@3: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/vdk_hs38_smp.dtb: /gfrc: failed to match any schema with compatible: ['snps,archs-timer-gfrc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
