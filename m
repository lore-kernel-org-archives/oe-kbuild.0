Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963A438DD8
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Aug 2024 20:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722975172; cv=none; b=kH8re4oF9uT/lEEhbLuHWFj259gFfs0pl++M0BGnnnH99vD8+AN+w1CUtSAZqbydbZqgxf2zajGDpytEzcjKS9TJ4GaKnuMZAv8a7s7X0a9WyBUwL0tPnVplziCa7DoCY0LO4oI7vjMaI1rtDmZs3El78GRYLVt+9ROrw+yLMew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722975172; c=relaxed/simple;
	bh=+bPWDyIn+PMiumgPpMaCDG+7Ys4IAo8k1to45wfL9kI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JNdO3F4x3jvvwq344Dyi8RHqqSBjMfUPV6gf9SVnl+NYtbDNPh2xgU0UFC1Wl7bl03xgzldunzBQ81BzoAfbo8d0F7INhK2+5pg5FDQDBzlUktT934ZKkSITEZQ+m0ga86vqahekqeiY9s1wtjluRkrHT+OxbIKKc74EAEBzHMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z3O7KlYO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z3O7KlYO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722975169; x=1754511169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+bPWDyIn+PMiumgPpMaCDG+7Ys4IAo8k1to45wfL9kI=;
  b=Z3O7KlYOe9tyF/mDHqXa5/dYb0npFTR8rNmkcCe/MsSaxfxWoxZmMtGr
   27qi7x74+VCSIOVh66WHaqSwvDzcCHCd8EfLXhBKVg42Q1I5/stYlp7k5
   okGephq+ocrz/UTDwfmVWKecnYWMASODlDincwnpfw3V6Ql2U+3pqxEne
   1VXVty/r6hCAxvaiHyKo0IrFb74nBu32+wwQoBVBp1MAqIIkqRa7af8rN
   za7MHAf5Q1RAxfuXfy/DvWmNutmu3r3L+jutDIjcEfSTzUdrq1BJx8oGk
   +KtxCpUIh7L+ZWRgvxRkhuzp/4TMwKPtJ1CCeBiNtRiLOB9ODRb42etBQ
   A==;
X-CSE-ConnectionGUID: ndV0CYPyQ4eQIibakXm1Hw==
X-CSE-MsgGUID: h794An5RTjeP8nJBb0pooQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="20592113"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="20592113"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 13:12:48 -0700
X-CSE-ConnectionGUID: 7NEKQe85RSeNSPlboGappQ==
X-CSE-MsgGUID: eeQSVQZHRfiPnUT5dVbtxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="87288355"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 06 Aug 2024 13:12:47 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbQY0-0004o0-2R;
	Tue, 06 Aug 2024 20:12:44 +0000
Date: Wed, 7 Aug 2024 04:12:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:OLK-6.6 12743/13217]
 arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: blk-ctrl@32fc0000:
 power-domains: [[111], [111], [111], [111], [111], [111], [111], [112],
 [111], [111]] is too long
Message-ID: <202408070425.lT7XPBXk-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: ZhangPeng <zhangpeng362@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d59a335bf0dd2aac9debe211a0a07fbeaf605fed
commit: 38c39049226c07a59fecf35c7abafc1cc8bede6e [12743/13217] arm64: dts: imx8mp: add HDMI power-domains
:::::: branch date: 31 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20240805 (https://download.01.org/0day-ci/archive/20240807/202408070425.lT7XPBXk-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408070425.lT7XPBXk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408070425.lT7XPBXk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:371.10-422.5: Warning (simple_bus_reg): /soc@0/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1685.11-1696.7: Warning (graph_child_address): /soc@0/bus@32c00000/dsi@32e60000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: soc@0: funnel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: /soc@0/bus@30800000/spba-bus@30800000/spi@30830000/tpm@0: failed to match any schema with compatible: ['infineon,slb9670']
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: /soc@0/bus@30800000/mmc@30b40000/wifi@1: failed to match any schema with compatible: ['marvell,sd8997']
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: blk-ctrl@32fc0000: power-domains: [[111], [111], [111], [111], [111], [111], [111], [112], [111], [111]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: blk-ctrl@32fc0000: power-domain-names: ['bus', 'irqsteer', 'lcdif', 'pai', 'pvi', 'trng', 'hdmi-tx', 'hdmi-tx-phy', 'hdcp', 'hrv'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: blk-ctrl@32fc0000: clocks: [[2, 99], [2, 278], [2, 168], [2, 167], [2, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: blk-ctrl@32fc0000: clock-names: ['apb', 'axi', 'ref_266m', 'ref_24m', 'fdcc'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:371.10-422.5: Warning (simple_bus_reg): /soc@0/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1685.11-1696.7: Warning (graph_child_address): /soc@0/bus@32c00000/dsi@32e60000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: soc@0: funnel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: blk-ctrl@32fc0000: power-domains: [[114], [114], [114], [114], [114], [114], [114], [115], [114], [114]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: blk-ctrl@32fc0000: power-domain-names: ['bus', 'irqsteer', 'lcdif', 'pai', 'pvi', 'trng', 'hdmi-tx', 'hdmi-tx-phy', 'hdcp', 'hrv'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: blk-ctrl@32fc0000: clocks: [[2, 99], [2, 278], [2, 168], [2, 167], [2, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: blk-ctrl@32fc0000: clock-names: ['apb', 'axi', 'ref_266m', 'ref_24m', 'fdcc'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:371.10-422.5: Warning (simple_bus_reg): /soc@0/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1685.11-1696.7: Warning (graph_child_address): /soc@0/bus@32c00000/dsi@32e60000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: soc@0: funnel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: ethernet@30bf0000: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'nvmem-cell-names', 'nvmem-cells', 'phy-connection-type', 'phy-handle', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: ethernet@30bf0000: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: blk-ctrl@32fc0000: power-domains: [[92], [92], [92], [92], [92], [92], [92], [93], [92], [92]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: blk-ctrl@32fc0000: power-domain-names: ['bus', 'irqsteer', 'lcdif', 'pai', 'pvi', 'trng', 'hdmi-tx', 'hdmi-tx-phy', 'hdcp', 'hrv'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: blk-ctrl@32fc0000: clocks: [[2, 99], [2, 278], [2, 168], [2, 167], [2, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: blk-ctrl@32fc0000: clock-names: ['apb', 'axi', 'ref_266m', 'ref_24m', 'fdcc'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: eeprom@52: #size-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: eeprom@52: mac-address@0:reg: [[0], [12]] is too long
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: eeprom@52: mac-address@c:reg: [[12], [12]] is too long
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: eeprom@52: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'mac-address@0', 'mac-address@c' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: blk-ctrl@32fc0000: power-domains: [[94], [94], [94], [94], [94], [94], [94], [95], [94], [94]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: blk-ctrl@32fc0000: power-domain-names: ['bus', 'irqsteer', 'lcdif', 'pai', 'pvi', 'trng', 'hdmi-tx', 'hdmi-tx-phy', 'hdcp', 'hrv'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: blk-ctrl@32fc0000: clocks: [[2, 99], [2, 278], [2, 168], [2, 167], [2, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: blk-ctrl@32fc0000: clock-names: ['apb', 'axi', 'ref_266m', 'ref_24m', 'fdcc'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: hub@1: 'peer-hub' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: hub@2: 'peer-hub' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:371.10-422.5: Warning (simple_bus_reg): /soc@0/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:258.9-270.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: soc@0: funnel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: blk-ctrl@32fc0000: power-domains: [[126], [126], [126], [126], [126], [126], [126], [127], [126], [126]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: blk-ctrl@32fc0000: power-domain-names: ['bus', 'irqsteer', 'lcdif', 'pai', 'pvi', 'trng', 'hdmi-tx', 'hdmi-tx-phy', 'hdcp', 'hrv'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: blk-ctrl@32fc0000: clocks: [[2, 99], [2, 278], [2, 168], [2, 167], [2, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: blk-ctrl@32fc0000: clock-names: ['apb', 'axi', 'ref_266m', 'ref_24m', 'fdcc'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:371.10-422.5: Warning (simple_bus_reg): /soc@0/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:258.9-270.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: soc@0: funnel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: typec@3d: 'ports' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/extcon/extcon-ptn5150.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: blk-ctrl@32fc0000: power-domains: [[131], [131], [131], [131], [131], [131], [131], [132], [131], [131]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: blk-ctrl@32fc0000: power-domain-names: ['bus', 'irqsteer', 'lcdif', 'pai', 'pvi', 'trng', 'hdmi-tx', 'hdmi-tx-phy', 'hdcp', 'hrv'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: blk-ctrl@32fc0000: clocks: [[2, 99], [2, 278], [2, 168], [2, 167], [2, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: blk-ctrl@32fc0000: clock-names: ['apb', 'axi', 'ref_266m', 'ref_24m', 'fdcc'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: ethernet@30bf0000: tx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: ethernet@30bf0000: tx-queues-config:queue1:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: ethernet@30bf0000: tx-queues-config:queue2:snps,priority: [4] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: ethernet@30bf0000: tx-queues-config:queue3:snps,priority: [8] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: ethernet@30bf0000: tx-queues-config:queue4:snps,priority: [240] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: blk-ctrl@32fc0000: power-domains: [[111], [111], [111], [111], [111], [111], [111], [112], [111], [111]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: blk-ctrl@32fc0000: power-domain-names: ['bus', 'irqsteer', 'lcdif', 'pai', 'pvi', 'trng', 'hdmi-tx', 'hdmi-tx-phy', 'hdcp', 'hrv'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: blk-ctrl@32fc0000: clocks: [[2, 99], [2, 278], [2, 168], [2, 167], [2, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: blk-ctrl@32fc0000: clock-names: ['apb', 'axi', 'ref_266m', 'ref_24m', 'fdcc'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:371.10-422.5: Warning (simple_bus_reg): /soc@0/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1685.11-1696.7: Warning (graph_child_address): /soc@0/bus@32c00000/dsi@32e60000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: soc@0: funnel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: blk-ctrl@32fc0000: power-domains: [[81], [81], [81], [81], [81], [81], [81], [82], [81], [81]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: blk-ctrl@32fc0000: power-domain-names: ['bus', 'irqsteer', 'lcdif', 'pai', 'pvi', 'trng', 'hdmi-tx', 'hdmi-tx-phy', 'hdcp', 'hrv'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: blk-ctrl@32fc0000: clocks: [[2, 99], [2, 278], [2, 168], [2, 167], [2, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: blk-ctrl@32fc0000: clock-names: ['apb', 'axi', 'ref_266m', 'ref_24m', 'fdcc'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:371.10-422.5: Warning (simple_bus_reg): /soc@0/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1685.11-1696.7: Warning (graph_child_address): /soc@0/bus@32c00000/dsi@32e60000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: soc@0: funnel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: blk-ctrl@32fc0000: power-domains: [[111], [111], [111], [111], [111], [111], [111], [112], [111], [111]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: blk-ctrl@32fc0000: power-domain-names: ['bus', 'irqsteer', 'lcdif', 'pai', 'pvi', 'trng', 'hdmi-tx', 'hdmi-tx-phy', 'hdcp', 'hrv'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: blk-ctrl@32fc0000: clocks: [[2, 99], [2, 278], [2, 168], [2, 167], [2, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: blk-ctrl@32fc0000: clock-names: ['apb', 'axi', 'ref_266m', 'ref_24m', 'fdcc'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: /extcon-usb0: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:371.10-422.5: Warning (simple_bus_reg): /soc@0/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1685.11-1696.7: Warning (graph_child_address): /soc@0/bus@32c00000/dsi@32e60000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: soc@0: funnel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: blk-ctrl@32fc0000: power-domains: [[91], [91], [91], [91], [91], [91], [91], [92], [91], [91]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: blk-ctrl@32fc0000: power-domain-names: ['bus', 'irqsteer', 'lcdif', 'pai', 'pvi', 'trng', 'hdmi-tx', 'hdmi-tx-phy', 'hdcp', 'hrv'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: blk-ctrl@32fc0000: clocks: [[2, 99], [2, 278], [2, 168], [2, 167], [2, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: blk-ctrl@32fc0000: clock-names: ['apb', 'axi', 'ref_266m', 'ref_24m', 'fdcc'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:371.10-422.5: Warning (simple_bus_reg): /soc@0/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1685.11-1696.7: Warning (graph_child_address): /soc@0/bus@32c00000/dsi@32e60000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: soc@0: funnel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: accelerometer@19: 'interrupt-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: blk-ctrl@32fc0000: power-domains: [[95], [95], [95], [95], [95], [95], [95], [96], [95], [95]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: blk-ctrl@32fc0000: power-domain-names: ['bus', 'irqsteer', 'lcdif', 'pai', 'pvi', 'trng', 'hdmi-tx', 'hdmi-tx-phy', 'hdcp', 'hrv'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: blk-ctrl@32fc0000: clocks: [[2, 99], [2, 278], [2, 168], [2, 167], [2, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: blk-ctrl@32fc0000: clock-names: ['apb', 'axi', 'ref_266m', 'ref_24m', 'fdcc'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: usb@32f10100: usb@38100000: Unevaluated properties are not allowed ('connector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mp-dwc3.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: usb@38100000: Unevaluated properties are not allowed ('connector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:371.10-422.5: Warning (simple_bus_reg): /soc@0/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1685.11-1696.7: Warning (graph_child_address): /soc@0/bus@32c00000/dsi@32e60000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: soc@0: funnel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: accelerometer@19: 'interrupt-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: blk-ctrl@32fc0000: power-domains: [[101], [101], [101], [101], [101], [101], [101], [102], [101], [101]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: blk-ctrl@32fc0000: power-domain-names: ['bus', 'irqsteer', 'lcdif', 'pai', 'pvi', 'trng', 'hdmi-tx', 'hdmi-tx-phy', 'hdcp', 'hrv'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: blk-ctrl@32fc0000: clocks: [[2, 99], [2, 278], [2, 168], [2, 167], [2, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: blk-ctrl@32fc0000: clock-names: ['apb', 'axi', 'ref_266m', 'ref_24m', 'fdcc'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: usb@32f10100: usb@38100000: Unevaluated properties are not allowed ('connector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mp-dwc3.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: usb@38100000: Unevaluated properties are not allowed ('connector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:371.10-422.5: Warning (simple_bus_reg): /soc@0/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1685.11-1696.7: Warning (graph_child_address): /soc@0/bus@32c00000/dsi@32e60000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: soc@0: funnel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: accelerometer@19: 'interrupt-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: blk-ctrl@32fc0000: power-domains: [[104], [104], [104], [104], [104], [104], [104], [105], [104], [104]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: blk-ctrl@32fc0000: power-domain-names: ['bus', 'irqsteer', 'lcdif', 'pai', 'pvi', 'trng', 'hdmi-tx', 'hdmi-tx-phy', 'hdcp', 'hrv'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: blk-ctrl@32fc0000: clocks: [[2, 99], [2, 278], [2, 168], [2, 167], [2, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: blk-ctrl@32fc0000: clock-names: ['apb', 'axi', 'ref_266m', 'ref_24m', 'fdcc'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: usb@32f10100: usb@38100000: Unevaluated properties are not allowed ('connector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mp-dwc3.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: usb@38100000: Unevaluated properties are not allowed ('connector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:371.10-422.5: Warning (simple_bus_reg): /soc@0/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1685.11-1696.7: Warning (graph_child_address): /soc@0/bus@32c00000/dsi@32e60000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: soc@0: funnel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: /soc@0/bus@30800000/spba-bus@30800000/spi@30820000/tpm@0: failed to match any schema with compatible: ['tcg,tpm_tis-spi']
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: accelerometer@19: 'interrupt-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: blk-ctrl@32fc0000: power-domains: [[110], [110], [110], [110], [110], [110], [110], [111], [110], [110]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: blk-ctrl@32fc0000: power-domain-names: ['bus', 'irqsteer', 'lcdif', 'pai', 'pvi', 'trng', 'hdmi-tx', 'hdmi-tx-phy', 'hdcp', 'hrv'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: blk-ctrl@32fc0000: clocks: [[2, 99], [2, 278], [2, 168], [2, 167], [2, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: blk-ctrl@32fc0000: clock-names: ['apb', 'axi', 'ref_266m', 'ref_24m', 'fdcc'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: usb@32f10100: usb@38100000: Unevaluated properties are not allowed ('connector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mp-dwc3.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: usb@38100000: Unevaluated properties are not allowed ('connector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:371.10-422.5: Warning (simple_bus_reg): /soc@0/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1685.11-1696.7: Warning (graph_child_address): /soc@0/bus@32c00000/dsi@32e60000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw7905-2x.dtb: soc@0: funnel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw7905-2x.dtb: blk-ctrl@32fc0000: power-domains: [[98], [98], [98], [98], [98], [98], [98], [99], [98], [98]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw7905-2x.dtb: blk-ctrl@32fc0000: power-domain-names: ['bus', 'irqsteer', 'lcdif', 'pai', 'pvi', 'trng', 'hdmi-tx', 'hdmi-tx-phy', 'hdcp', 'hrv'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw7905-2x.dtb: blk-ctrl@32fc0000: clocks: [[2, 99], [2, 278], [2, 168], [2, 167], [2, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw7905-2x.dtb: blk-ctrl@32fc0000: clock-names: ['apb', 'axi', 'ref_266m', 'ref_24m', 'fdcc'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: ethernet@30bf0000: tx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: ethernet@30bf0000: tx-queues-config:queue1:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: ethernet@30bf0000: tx-queues-config:queue2:snps,priority: [4] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: ethernet@30bf0000: tx-queues-config:queue3:snps,priority: [8] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: ethernet@30bf0000: tx-queues-config:queue4:snps,priority: [240] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: blk-ctrl@32fc0000: power-domains: [[130], [130], [130], [130], [130], [130], [130], [131], [130], [130]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: blk-ctrl@32fc0000: power-domain-names: ['bus', 'irqsteer', 'lcdif', 'pai', 'pvi', 'trng', 'hdmi-tx', 'hdmi-tx-phy', 'hdcp', 'hrv'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: blk-ctrl@32fc0000: clocks: [[2, 99], [2, 278], [2, 168], [2, 167], [2, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: blk-ctrl@32fc0000: clock-names: ['apb', 'axi', 'ref_266m', 'ref_24m', 'fdcc'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: usb@32f10100: usb@38100000: Unevaluated properties are not allowed ('connector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mp-dwc3.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: usb@38100000: Unevaluated properties are not allowed ('connector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: ethernet@30bf0000: tx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: ethernet@30bf0000: tx-queues-config:queue1:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: ethernet@30bf0000: tx-queues-config:queue2:snps,priority: [4] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: ethernet@30bf0000: tx-queues-config:queue3:snps,priority: [8] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: ethernet@30bf0000: tx-queues-config:queue4:snps,priority: [240] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: blk-ctrl@32fc0000: power-domains: [[130], [130], [130], [130], [130], [130], [130], [131], [130], [130]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: blk-ctrl@32fc0000: power-domain-names: ['bus', 'irqsteer', 'lcdif', 'pai', 'pvi', 'trng', 'hdmi-tx', 'hdmi-tx-phy', 'hdcp', 'hrv'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: blk-ctrl@32fc0000: clocks: [[2, 99], [2, 278], [2, 168], [2, 167], [2, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: blk-ctrl@32fc0000: clock-names: ['apb', 'axi', 'ref_266m', 'ref_24m', 'fdcc'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: usb@32f10100: usb@38100000: Unevaluated properties are not allowed ('connector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mp-dwc3.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: usb@38100000: Unevaluated properties are not allowed ('connector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: ethernet@30bf0000: tx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: ethernet@30bf0000: tx-queues-config:queue1:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: ethernet@30bf0000: tx-queues-config:queue2:snps,priority: [4] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: ethernet@30bf0000: tx-queues-config:queue3:snps,priority: [8] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: ethernet@30bf0000: tx-queues-config:queue4:snps,priority: [240] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: blk-ctrl@32fc0000: power-domains: [[128], [128], [128], [128], [128], [128], [128], [129], [128], [128]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: blk-ctrl@32fc0000: power-domain-names: ['bus', 'irqsteer', 'lcdif', 'pai', 'pvi', 'trng', 'hdmi-tx', 'hdmi-tx-phy', 'hdcp', 'hrv'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: blk-ctrl@32fc0000: clocks: [[2, 99], [2, 278], [2, 168], [2, 167], [2, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: blk-ctrl@32fc0000: clock-names: ['apb', 'axi', 'ref_266m', 'ref_24m', 'fdcc'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: usb@32f10100: usb@38100000: Unevaluated properties are not allowed ('connector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mp-dwc3.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: usb@38100000: Unevaluated properties are not allowed ('connector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: ethernet@30bf0000: tx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: ethernet@30bf0000: tx-queues-config:queue1:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: ethernet@30bf0000: tx-queues-config:queue2:snps,priority: [4] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: ethernet@30bf0000: tx-queues-config:queue3:snps,priority: [8] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: ethernet@30bf0000: tx-queues-config:queue4:snps,priority: [240] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: blk-ctrl@32fc0000: power-domains: [[135], [135], [135], [135], [135], [135], [135], [136], [135], [135]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: blk-ctrl@32fc0000: power-domain-names: ['bus', 'irqsteer', 'lcdif', 'pai', 'pvi', 'trng', 'hdmi-tx', 'hdmi-tx-phy', 'hdcp', 'hrv'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: blk-ctrl@32fc0000: clocks: [[2, 99], [2, 278], [2, 168], [2, 167], [2, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: blk-ctrl@32fc0000: clock-names: ['apb', 'axi', 'ref_266m', 'ref_24m', 'fdcc'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: usb@32f10100: usb@38100000: Unevaluated properties are not allowed ('connector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mp-dwc3.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: usb@38100000: Unevaluated properties are not allowed ('connector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: ethernet@30bf0000: tx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: ethernet@30bf0000: tx-queues-config:queue1:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: ethernet@30bf0000: tx-queues-config:queue2:snps,priority: [4] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: ethernet@30bf0000: tx-queues-config:queue3:snps,priority: [8] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: ethernet@30bf0000: tx-queues-config:queue4:snps,priority: [240] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: blk-ctrl@32fc0000: power-domains: [[135], [135], [135], [135], [135], [135], [135], [136], [135], [135]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: blk-ctrl@32fc0000: power-domain-names: ['bus', 'irqsteer', 'lcdif', 'pai', 'pvi', 'trng', 'hdmi-tx', 'hdmi-tx-phy', 'hdcp', 'hrv'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: blk-ctrl@32fc0000: clocks: [[2, 99], [2, 278], [2, 168], [2, 167], [2, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: blk-ctrl@32fc0000: clock-names: ['apb', 'axi', 'ref_266m', 'ref_24m', 'fdcc'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: usb@32f10100: usb@38100000: Unevaluated properties are not allowed ('connector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mp-dwc3.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: usb@38100000: Unevaluated properties are not allowed ('connector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: ethernet@30bf0000: tx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: ethernet@30bf0000: tx-queues-config:queue1:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: ethernet@30bf0000: tx-queues-config:queue2:snps,priority: [4] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: ethernet@30bf0000: tx-queues-config:queue3:snps,priority: [8] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: ethernet@30bf0000: tx-queues-config:queue4:snps,priority: [240] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: blk-ctrl@32fc0000: power-domains: [[133], [133], [133], [133], [133], [133], [133], [134], [133], [133]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: blk-ctrl@32fc0000: power-domain-names: ['bus', 'irqsteer', 'lcdif', 'pai', 'pvi', 'trng', 'hdmi-tx', 'hdmi-tx-phy', 'hdcp', 'hrv'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: blk-ctrl@32fc0000: clocks: [[2, 99], [2, 278], [2, 168], [2, 167], [2, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: blk-ctrl@32fc0000: clock-names: ['apb', 'axi', 'ref_266m', 'ref_24m', 'fdcc'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: usb@32f10100: usb@38100000: Unevaluated properties are not allowed ('connector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mp-dwc3.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: usb@38100000: Unevaluated properties are not allowed ('connector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
