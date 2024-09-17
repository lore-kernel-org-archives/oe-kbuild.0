Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4904C3D0
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Sep 2024 07:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726558860; cv=none; b=sUoXN+3OO+0LezXISR3SBmFg4RKfUJZHc7dMocDxQwBJHfWPUwNUqvOfxMIdkb62KYQT7eumTY4R1n1pl+O6ilQwoi0KsOKrs5VPYxtZKC+qDOew7rrv+JLx0G6y88CoTl4GMfVnzGKFASoooDiNet9W/qNzBtOph/7YTOyz6Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726558860; c=relaxed/simple;
	bh=kxx24tDJG78++Vcc7j5qazOTUa/+mZ+MZPGuV28EgbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xk9kZKz42WVRP3dCQcdAbGE3RIFRU4vIi12JE04bt3DPRP/IBw9Qu8j11ZXM/K10PM1wDRsRr4O43iZ5ExhzXzh4u0iixS+dOI6x62FZCBDADPEBXm9qSWRSK6nmgvgOzx4FOYVID9FVPU1ZoXxnHP9pHwxUy9FtuIjNAsVBUu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WyCN9QD+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WyCN9QD+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726558859; x=1758094859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kxx24tDJG78++Vcc7j5qazOTUa/+mZ+MZPGuV28EgbQ=;
  b=WyCN9QD+3+9easU5wsyPYcv5WEBSj7kJTeDuzJVkHxMO3foAedsU1Rkd
   SHyVUiWSDoIYBh20ALNc3w5xuCUmmwM6u6VoY7ezvJLBSOHF+RWnzvhR8
   J6TpSkbm7Z2xHIz4Zl57Sb2ttssanW6k98WAZ6TKBcIcb56Ju6S4Fniqo
   ClUOM8/fuJ7D9s6pIciIeenVmU27Nr2v4KZzwP/b25rAdzzywdoIvC2xS
   udam1iY6kQbvpyxJ8hT9mJHhT55s83bp8sszFxqnF38Hhatu9pyrdIQYo
   UGqMcCX1wPpt0QRYDoOoGEOwLlD5u7jzRaFVq4TiMQvjCi/iJLFZm/He+
   w==;
X-CSE-ConnectionGUID: uuRX4nOyS2+qwod+LFTadQ==
X-CSE-MsgGUID: RIejrpm6SoC41wU1d9xr6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36754313"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="36754313"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 00:40:58 -0700
X-CSE-ConnectionGUID: NccWdwQyTtazdN/i0rYsXA==
X-CSE-MsgGUID: K9XdrMjiQO+5yZddGxwD+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="68775762"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Sep 2024 00:40:56 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqSpS-000AwM-1o;
	Tue, 17 Sep 2024 07:40:54 +0000
Date: Tue, 17 Sep 2024 15:40:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-linux-6.1.y-wip 1/1]
 arch/arm/boot/dts/dra74x.dtsi:313.15-350.5: Warning (unique_unit_address):
 /ocp/interconnect@48800000/target-module@1b0000/vip@0: duplicate
 unit-address (also used in node
 /ocp/interconnect@48800000/target-module@1b0000/cal@0)
Message-ID: <202409171549.OmLkJdZF-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com
CC: Udit Kumar <u-kumar1@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   c1c2f1971fbf6ddad93a8c94314fe8221e7aa6be
commit: c78bdf4f1e46d5b604063416a682470aa716e333 [1/1] ARM: dts: DRA74x: Add the VIP3 node
:::::: branch date: 4 months ago
:::::: commit date: 7 months ago
config: arm-randconfig-002-20240916 (https://download.01.org/0day-ci/archive/20240917/202409171549.OmLkJdZF-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409171549.OmLkJdZF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409171549.OmLkJdZF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/dra7xx-clocks.dtsi:1652.43-1659.4: Warning (unique_unit_address): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/dra7xx-clocks.dtsi:1661.50-1668.4: Warning (unique_unit_address): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/dra7xx-clocks.dtsi:1670.44-1677.4: Warning (unique_unit_address): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558)
   arch/arm/boot/dts/dra76x.dtsi:87.55-97.4: Warning (unique_unit_address): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/dpll_gmac_h14x2_ctrl_ck@3fc: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/dpll_gmac_h14x2_ctrl_mux_ck@3fc)
   arch/arm/boot/dts/dra76x.dtsi:87.55-97.4: Warning (unique_unit_address): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/dpll_gmac_h14x2_ctrl_ck@3fc: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/mcan_clk@3fc)
   arch/arm/boot/dts/dra76x.dtsi:99.63-108.4: Warning (unique_unit_address): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/dpll_gmac_h14x2_ctrl_mux_ck@3fc: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/mcan_clk@3fc)
   arch/arm/boot/dts/dra7xx-clocks.dtsi:242.46-252.4: Warning (unique_unit_address): /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-abe-m2x2-8@1f0: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clocks/clock-dpll-abe-m2-8@1f0)
   arch/arm/boot/dts/dra7xx-clocks.dtsi:1262.58-1272.4: Warning (unique_unit_address): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-pcie-ref-m2ldo-8@210: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-pcie-ref-m2-8@210)
   arch/arm/boot/dts/dra7xx-clocks.dtsi:1346.42-1356.4: Warning (unique_unit_address): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-m2-8@150: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-m2x2-8@150)
   arch/arm/boot/dts/dra7xx-clocks.dtsi:1583.53-1592.4: Warning (unique_unit_address): /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-gpu-core-gclk-mux-24@1220: duplicate unit-address (also used in node /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-gpu-hyd-gclk-mux-26@1220)
>> arch/arm/boot/dts/dra74x.dtsi:313.15-350.5: Warning (unique_unit_address): /ocp/interconnect@48800000/target-module@1b0000/vip@0: duplicate unit-address (also used in node /ocp/interconnect@48800000/target-module@1b0000/cal@0)
   arch/arm/boot/dts/dra7.dtsi:203.28-233.6: Warning (unique_unit_address): /ocp/target-module@51000000/pcie@51000000: duplicate unit-address (also used in node /ocp/target-module@51000000/pcie_ep@51000000)
   arch/arm/boot/dts/dra7.dtsi:24.10-45.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/dra7.dtsi:24.10-45.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'

vim +313 arch/arm/boot/dts/dra74x.dtsi

78b4b165280d3d Gowtham Tammana 2021-06-02  183  
78b4b165280d3d Gowtham Tammana 2021-06-02  184  &l4_per3 {
78b4b165280d3d Gowtham Tammana 2021-06-02  185  	segment@0 {
78b4b165280d3d Gowtham Tammana 2021-06-02  186  		usb4_tm: target-module@140000 {         /* 0x48940000, ap 75 3c.0 */
78b4b165280d3d Gowtham Tammana 2021-06-02  187  			compatible = "ti,sysc-omap4", "ti,sysc";
78b4b165280d3d Gowtham Tammana 2021-06-02  188  			reg = <0x140000 0x4>,
78b4b165280d3d Gowtham Tammana 2021-06-02  189  			      <0x140010 0x4>;
78b4b165280d3d Gowtham Tammana 2021-06-02  190  			reg-names = "rev", "sysc";
78b4b165280d3d Gowtham Tammana 2021-06-02  191  			ti,sysc-mask = <SYSC_OMAP4_DMADISABLE>;
78b4b165280d3d Gowtham Tammana 2021-06-02  192  			ti,sysc-midle = <SYSC_IDLE_FORCE>,
78b4b165280d3d Gowtham Tammana 2021-06-02  193  					<SYSC_IDLE_NO>,
78b4b165280d3d Gowtham Tammana 2021-06-02  194  					<SYSC_IDLE_SMART>,
78b4b165280d3d Gowtham Tammana 2021-06-02  195  					<SYSC_IDLE_SMART_WKUP>;
78b4b165280d3d Gowtham Tammana 2021-06-02  196  			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
78b4b165280d3d Gowtham Tammana 2021-06-02  197  					<SYSC_IDLE_NO>,
78b4b165280d3d Gowtham Tammana 2021-06-02  198  					<SYSC_IDLE_SMART>,
78b4b165280d3d Gowtham Tammana 2021-06-02  199  					<SYSC_IDLE_SMART_WKUP>;
78b4b165280d3d Gowtham Tammana 2021-06-02  200  			/* Domains (P, C): l3init_pwrdm, l3init_clkdm */
78b4b165280d3d Gowtham Tammana 2021-06-02  201  			clocks = <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS4_CLKCTRL 0>;
78b4b165280d3d Gowtham Tammana 2021-06-02  202  			clock-names = "fck";
78b4b165280d3d Gowtham Tammana 2021-06-02  203  			#address-cells = <1>;
78b4b165280d3d Gowtham Tammana 2021-06-02  204  			#size-cells = <1>;
78b4b165280d3d Gowtham Tammana 2021-06-02  205  			ranges = <0x0 0x140000 0x20000>;
78b4b165280d3d Gowtham Tammana 2021-06-02  206  
78b4b165280d3d Gowtham Tammana 2021-06-02  207  			omap_dwc3_4: omap_dwc3_4@0 {
78b4b165280d3d Gowtham Tammana 2021-06-02  208  				compatible = "ti,dwc3";
78b4b165280d3d Gowtham Tammana 2021-06-02  209  				reg = <0 0x10000>;
78b4b165280d3d Gowtham Tammana 2021-06-02  210  				interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>;
78b4b165280d3d Gowtham Tammana 2021-06-02  211  				#address-cells = <1>;
78b4b165280d3d Gowtham Tammana 2021-06-02  212  				#size-cells = <1>;
78b4b165280d3d Gowtham Tammana 2021-06-02  213  				utmi-mode = <2>;
78b4b165280d3d Gowtham Tammana 2021-06-02  214  				ranges;
78b4b165280d3d Gowtham Tammana 2021-06-02  215  				status = "disabled";
78b4b165280d3d Gowtham Tammana 2021-06-02  216  				usb4: usb@10000 {
78b4b165280d3d Gowtham Tammana 2021-06-02  217  					compatible = "snps,dwc3";
78b4b165280d3d Gowtham Tammana 2021-06-02  218  					reg = <0x10000 0x17000>;
78b4b165280d3d Gowtham Tammana 2021-06-02  219  					interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
78b4b165280d3d Gowtham Tammana 2021-06-02  220  						     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
78b4b165280d3d Gowtham Tammana 2021-06-02  221  						     <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>;
78b4b165280d3d Gowtham Tammana 2021-06-02  222  					interrupt-names = "peripheral",
78b4b165280d3d Gowtham Tammana 2021-06-02  223  							  "host",
78b4b165280d3d Gowtham Tammana 2021-06-02  224  							  "otg";
78b4b165280d3d Gowtham Tammana 2021-06-02  225  					maximum-speed = "high-speed";
78b4b165280d3d Gowtham Tammana 2021-06-02  226  					dr_mode = "otg";
78b4b165280d3d Gowtham Tammana 2021-06-02  227  				};
78b4b165280d3d Gowtham Tammana 2021-06-02  228  			};
78b4b165280d3d Gowtham Tammana 2021-06-02  229  		};
78b4b165280d3d Gowtham Tammana 2021-06-02  230  	};
9101df735a7b86 Sukrut Bellary  2024-02-13  231  
9101df735a7b86 Sukrut Bellary  2024-02-13  232  	target-module@190000 {			/* 0x48990000, ap 23 2e.0 */
9101df735a7b86 Sukrut Bellary  2024-02-13  233  		compatible = "ti,sysc-omap4", "ti,sysc";
9101df735a7b86 Sukrut Bellary  2024-02-13  234  		reg = <0x190010 0x4>;
9101df735a7b86 Sukrut Bellary  2024-02-13  235  		reg-names = "sysc";
9101df735a7b86 Sukrut Bellary  2024-02-13  236  		ti,sysc-midle = <SYSC_IDLE_FORCE>,
9101df735a7b86 Sukrut Bellary  2024-02-13  237  				<SYSC_IDLE_NO>,
9101df735a7b86 Sukrut Bellary  2024-02-13  238  				<SYSC_IDLE_SMART>;
9101df735a7b86 Sukrut Bellary  2024-02-13  239  		ti,sysc-sidle = <SYSC_IDLE_FORCE>,
9101df735a7b86 Sukrut Bellary  2024-02-13  240  				<SYSC_IDLE_NO>,
9101df735a7b86 Sukrut Bellary  2024-02-13  241  				<SYSC_IDLE_SMART>;
9101df735a7b86 Sukrut Bellary  2024-02-13  242  		clocks = <&cam_clkctrl DRA7_CAM_VIP2_CLKCTRL 0>;
9101df735a7b86 Sukrut Bellary  2024-02-13  243  		clock-names = "fck";
9101df735a7b86 Sukrut Bellary  2024-02-13  244  		#address-cells = <1>;
9101df735a7b86 Sukrut Bellary  2024-02-13  245  		#size-cells = <1>;
9101df735a7b86 Sukrut Bellary  2024-02-13  246  		ranges = <0x0 0x190000 0x10000>;
9101df735a7b86 Sukrut Bellary  2024-02-13  247  
9101df735a7b86 Sukrut Bellary  2024-02-13  248  		vip2: vip@0 {
9101df735a7b86 Sukrut Bellary  2024-02-13  249  			compatible = "ti,dra7-vip2";
9101df735a7b86 Sukrut Bellary  2024-02-13  250  			label = "vip2";
9101df735a7b86 Sukrut Bellary  2024-02-13  251  			reg = <0x0000 0x114>,
9101df735a7b86 Sukrut Bellary  2024-02-13  252  			      <0x5500 0xd8>,
9101df735a7b86 Sukrut Bellary  2024-02-13  253  			      <0x5700 0x18>,
9101df735a7b86 Sukrut Bellary  2024-02-13  254  			      <0x5800 0x80>,
9101df735a7b86 Sukrut Bellary  2024-02-13  255  			      <0x5a00 0xd8>,
9101df735a7b86 Sukrut Bellary  2024-02-13  256  			      <0x5c00 0x18>,
9101df735a7b86 Sukrut Bellary  2024-02-13  257  			      <0x5d00 0x80>,
9101df735a7b86 Sukrut Bellary  2024-02-13  258  			      <0xd000 0x400>;
9101df735a7b86 Sukrut Bellary  2024-02-13  259  			reg-names = "vip",
9101df735a7b86 Sukrut Bellary  2024-02-13  260  				    "parser0",
9101df735a7b86 Sukrut Bellary  2024-02-13  261  				    "csc0",
9101df735a7b86 Sukrut Bellary  2024-02-13  262  				    "sc0",
9101df735a7b86 Sukrut Bellary  2024-02-13  263  				    "parser1",
9101df735a7b86 Sukrut Bellary  2024-02-13  264  				    "csc1",
9101df735a7b86 Sukrut Bellary  2024-02-13  265  				    "sc1",
9101df735a7b86 Sukrut Bellary  2024-02-13  266  				    "vpdma";
9101df735a7b86 Sukrut Bellary  2024-02-13  267  			interrupts = <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
9101df735a7b86 Sukrut Bellary  2024-02-13  268  				     <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>;
9101df735a7b86 Sukrut Bellary  2024-02-13  269  			/* CTRL_CORE_SMA_SW_1 */
9101df735a7b86 Sukrut Bellary  2024-02-13  270  			ti,vip-clk-polarity = <&scm_conf 0x534>;
9101df735a7b86 Sukrut Bellary  2024-02-13  271  
9101df735a7b86 Sukrut Bellary  2024-02-13  272  			ports {
9101df735a7b86 Sukrut Bellary  2024-02-13  273  				#address-cells = <1>;
9101df735a7b86 Sukrut Bellary  2024-02-13  274  				#size-cells = <0>;
9101df735a7b86 Sukrut Bellary  2024-02-13  275  
9101df735a7b86 Sukrut Bellary  2024-02-13  276  				vin3a: port@0 {
9101df735a7b86 Sukrut Bellary  2024-02-13  277  					reg = <0>;
9101df735a7b86 Sukrut Bellary  2024-02-13  278  					label = "vin3a";
9101df735a7b86 Sukrut Bellary  2024-02-13  279  				};
9101df735a7b86 Sukrut Bellary  2024-02-13  280  				vin4a: port@1 {
9101df735a7b86 Sukrut Bellary  2024-02-13  281  					reg = <1>;
9101df735a7b86 Sukrut Bellary  2024-02-13  282  					label = "vin4a";
9101df735a7b86 Sukrut Bellary  2024-02-13  283  				};
9101df735a7b86 Sukrut Bellary  2024-02-13  284  				vin3b: port@2 {
9101df735a7b86 Sukrut Bellary  2024-02-13  285  					reg = <2>;
9101df735a7b86 Sukrut Bellary  2024-02-13  286  					label = "vin3b";
9101df735a7b86 Sukrut Bellary  2024-02-13  287  				};
9101df735a7b86 Sukrut Bellary  2024-02-13  288  				vin4b: port@3 {
9101df735a7b86 Sukrut Bellary  2024-02-13  289  					reg = <3>;
9101df735a7b86 Sukrut Bellary  2024-02-13  290  					label = "vin4b";
9101df735a7b86 Sukrut Bellary  2024-02-13  291  				};
9101df735a7b86 Sukrut Bellary  2024-02-13  292  			};
9101df735a7b86 Sukrut Bellary  2024-02-13  293  		};
9101df735a7b86 Sukrut Bellary  2024-02-13  294  	};
c78bdf4f1e46d5 Sukrut Bellary  2024-02-22  295  
c78bdf4f1e46d5 Sukrut Bellary  2024-02-22  296  	target-module@1b0000 {			/* 0x489b0000, ap 25 34.0 */
c78bdf4f1e46d5 Sukrut Bellary  2024-02-22  297  		compatible = "ti,sysc-omap4", "ti,sysc";
c78bdf4f1e46d5 Sukrut Bellary  2024-02-22  298  		reg = <0x1b0000 0x4>,
c78bdf4f1e46d5 Sukrut Bellary  2024-02-22  299  		      <0x1b0010 0x4>;
c78bdf4f1e46d5 Sukrut Bellary  2024-02-22  300  		reg-names = "rev", "sysc";
c78bdf4f1e46d5 Sukrut Bellary  2024-02-22  301  		ti,sysc-midle = <SYSC_IDLE_FORCE>,
c78bdf4f1e46d5 Sukrut Bellary  2024-02-22  302  				<SYSC_IDLE_NO>,
c78bdf4f1e46d5 Sukrut Bellary  2024-02-22  303  				<SYSC_IDLE_SMART>;
c78bdf4f1e46d5 Sukrut Bellary  2024-02-22  304  		ti,sysc-sidle = <SYSC_IDLE_FORCE>,
c78bdf4f1e46d5 Sukrut Bellary  2024-02-22  305  				<SYSC_IDLE_NO>,
c78bdf4f1e46d5 Sukrut Bellary  2024-02-22  306  				<SYSC_IDLE_SMART>;
c78bdf4f1e46d5 Sukrut Bellary  2024-02-22  307  		clocks = <&cam_clkctrl DRA7_CAM_VIP3_CLKCTRL 0>;
c78bdf4f1e46d5 Sukrut Bellary  2024-02-22  308  		clock-names = "fck";
c78bdf4f1e46d5 Sukrut Bellary  2024-02-22  309  		#address-cells = <1>;
c78bdf4f1e46d5 Sukrut Bellary  2024-02-22  310  		#size-cells = <1>;
c78bdf4f1e46d5 Sukrut Bellary  2024-02-22  311  		ranges = <0x0 0x1b0000 0x10000>;
c78bdf4f1e46d5 Sukrut Bellary  2024-02-22  312  
c78bdf4f1e46d5 Sukrut Bellary  2024-02-22 @313  		vip3: vip@0 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
