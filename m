Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDB813DDAE
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Feb 2025 14:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739629133; cv=none; b=qQoj53KoxgCOzx1sLncDNJzphjumKziXnwLUkn9gQVzMvxDFDtPUWTaiu4jU9qZjqwuyjTjLnG8BCkGV9p9VZz9Xd0/wizbHDsSd/PplUAWO1tKc0rTioTCQ85ut0Wd7RRz/gYZD+toOenrRzkJZYkGWZei7HtFnhZtEZozotwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739629133; c=relaxed/simple;
	bh=RNA7BSRDREGNIUNOUm5E44+FFy5ho5hNMb1QQsaCkJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FdsHm/cm645pw4HroYtVAZgi4jYeXehTtYjj/wEZRnSb/kpO5Xg3v7RZl9XT1OZt3ZccwNsFlIvUn5M66Fkd58BmBLAJQxUJxqAtAbzBo6PE9ueCXaEw+zXx0eg0wc3zB3KzIQ0j/poox+iQNODxIsDjxPHr9J6mjC4DrXpos7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MvHIpV9d; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MvHIpV9d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739629132; x=1771165132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RNA7BSRDREGNIUNOUm5E44+FFy5ho5hNMb1QQsaCkJ8=;
  b=MvHIpV9dNOkj1Grbyfi7s7SV13moBrBsnl1bJTWiKdjL44G38rdihRrb
   vOieK+X5ofA3hSvqQh7pj4onPNnL4MLOX/+V+8MWMGYvqEKNxKnjLcCg9
   DHdi3N41VkaoTaThXJUwnkET6StMzHsWWtKRQCz1oTGtxAFMfszFVZASk
   2VanQAavzJJ6it8AS0qE4ShDUoBNshooUV5ZXD1p/B4fRsJtO2LkhALu1
   E4w7LM0yJ9PD8aBcDh6jDUxXNK1jTRrUe1BgVFfa0MOo9TAEMQRymS39u
   sznQowNejOxgW1l0hLu1nrXJ2nzdALyqheHAb+BXUVGncz1Mk+cP930OM
   g==;
X-CSE-ConnectionGUID: yvWG35r4TsOJG1ci1zraxg==
X-CSE-MsgGUID: 2fJpH1/NQu+0QfvQi8SWiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="51010596"
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="51010596"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 06:18:51 -0800
X-CSE-ConnectionGUID: CKHCBibVQXGtgY3zlM73mQ==
X-CSE-MsgGUID: 90EnLBtVTxmAzS/Zewkitw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136925971"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Feb 2025 06:18:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjJ0K-001AtT-08;
	Sat, 15 Feb 2025 14:18:48 +0000
Date: Sat, 15 Feb 2025 22:18:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:n/str-enable-disable 37/37]
 arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: usb@38100000:
 port@0:reg:0:0: 0 is less than the minimum of 1
Message-ID: <202502152211.XghFx8bG-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux n/str-enable-disable
head:   be260ea63ddd4b5793ee8c617adf6ca6d44fd330
commit: be260ea63ddd4b5793ee8c617adf6ca6d44fd330 [37/37] dt-bindings: usb: usb-device: Replace free-form 'reg' with constraints
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250215 (https://download.01.org/0day-ci/archive/20250215/202502152211.XghFx8bG-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502152211.XghFx8bG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502152211.XghFx8bG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: usb@38100000: port@0:reg:0:0: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: usb@38100000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'port@0', 'port@1', 'snps,parkmode-disable-ss-quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: usb@38100000: port@0:reg:0:0: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mq-dwc3.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: usb@38100000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'port@0', 'port@1', 'snps,parkmode-disable-ss-quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mq-dwc3.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: usb@38100000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks', 'clock-names', 'clocks', 'dr_mode', 'interrupts', 'phy-names', 'phys', 'port@0', 'port@1', 'power-domains', 'reg', 'snps,parkmode-disable-ss-quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mq-dwc3.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: usb-pd@3f: 'extcon' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/ti,tps6598x.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: usb@38100000: port@0:reg:0:0: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: usb@38100000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'port@0', 'port@1', 'snps,parkmode-disable-ss-quirk', 'usb-role-switch' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: usb@38100000: port@0:reg:0:0: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mq-dwc3.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: usb@38100000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'port@0', 'port@1', 'snps,parkmode-disable-ss-quirk', 'usb-role-switch' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mq-dwc3.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: usb@38100000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks', 'clock-names', 'clocks', 'dr_mode', 'interrupts', 'phy-names', 'phys', 'port@0', 'port@1', 'power-domains', 'reg', 'snps,parkmode-disable-ss-quirk', 'usb-role-switch' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mq-dwc3.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: usb-pd@3f: 'extcon' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/ti,tps6598x.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: usb@38100000: port@0:reg:0:0: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: usb@38100000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'port@0', 'port@1', 'snps,parkmode-disable-ss-quirk', 'usb-role-switch' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: usb@38100000: port@0:reg:0:0: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mq-dwc3.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: usb@38100000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'port@0', 'port@1', 'snps,parkmode-disable-ss-quirk', 'usb-role-switch' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mq-dwc3.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: usb@38100000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks', 'clock-names', 'clocks', 'dr_mode', 'interrupts', 'phy-names', 'phys', 'port@0', 'port@1', 'power-domains', 'reg', 'snps,parkmode-disable-ss-quirk', 'usb-role-switch' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mq-dwc3.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: usb-pd@3f: 'extcon' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/ti,tps6598x.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: usb@38100000: port@0:reg:0:0: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: usb@38100000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'port@0', 'port@1', 'snps,parkmode-disable-ss-quirk', 'usb-role-switch' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: usb@38100000: port@0:reg:0:0: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mq-dwc3.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: usb@38100000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'port@0', 'port@1', 'snps,parkmode-disable-ss-quirk', 'usb-role-switch' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mq-dwc3.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: usb@38100000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks', 'clock-names', 'clocks', 'dr_mode', 'interrupts', 'phy-names', 'phys', 'port@0', 'port@1', 'power-domains', 'reg', 'snps,parkmode-disable-ss-quirk', 'usb-role-switch' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mq-dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
