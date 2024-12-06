Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB83F1B532F
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Dec 2024 08:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733475168; cv=none; b=PjER9nso9364glRZj8492x6+rqs/jOe2z+HofjwSYZ4hoVH+EosPi13KHasVOu8z/S6geIc4pBgLhd1LbchN8/Zo6iLkkrMjShlJGYZFXZUB/vKTebsTv9/mKi97AEAs1ySCgn5hGTqEIG1oKVMij9BTEE3Pe1oD1hogXc9s3aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733475168; c=relaxed/simple;
	bh=BeTTZymiQlpi5cxonfeIbyEsNjmRIYSVPD5hecb8tp0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cLo0BKXKZAMOP9qt03BLjgivBZZRgOx7V6AUXvvT44W3Hg0riGQZna/JAQFlHmAIw1AkYPr0XHq304tGILwI66/FKCkPQERsqvtQzOzxxCpp19xxgm6gNm6hsjsM97/eV2U/XVAjj6DEh63TbUuGBuN4NZdzAGySZGqEBRCLhMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QMX0Gw91; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QMX0Gw91"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733475165; x=1765011165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BeTTZymiQlpi5cxonfeIbyEsNjmRIYSVPD5hecb8tp0=;
  b=QMX0Gw9139KsZ2cZLAKCjqpaKgpA7y6dBJpz6Vxc38pEoP/WsDFsPk2u
   BmoyqxDuYckNR6pdGV3T3HIQFwpnMVzzj8Z86YnE+dDAqf6aWiE7wyZOX
   8fxwBR8s7NuBqgwZihOiPM2c0S8/bpmceRop91e5ULI0PxD1GdbYkuTuW
   lbZ8dU0WbeXMSXUI2T7w2lq3NYj+5C8HbpHes2Go7/AkDnJea3TDY8pGL
   1EqqOILLPPfsrm8ojLs7QXXsyV84SnXv4ujrkyewkL5iSznq4ZD1XzuJX
   aJVFwrGPryg9HIlWe/Ll3FCa3WYoGgs0ucEh+E+R8HmJ4t2riPLPGclqS
   g==;
X-CSE-ConnectionGUID: u4Q16QlZTGytfHAuHGdoNA==
X-CSE-MsgGUID: OyIpGEDQTT6F8oEwERfByg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="37754467"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="37754467"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 00:52:44 -0800
X-CSE-ConnectionGUID: 5b3GLjw+RQmI83k2+q/iIA==
X-CSE-MsgGUID: DsSrowuOSbaj8LqTv9GGiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="94029353"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Dec 2024 00:52:42 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJU4m-0000rn-24;
	Fri, 06 Dec 2024 08:52:40 +0000
Date: Fri, 6 Dec 2024 16:51:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 1/6] dt-bindings: net: dwmac: Convert socfpga dwmac to
 DT schema
Message-ID: <202412061603.iCB294Og-lkp@intel.com>
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
In-Reply-To: <20241205-v6-12-topic-socfpga-agilex5-v3-1-2a8cdf73f50a@pengutronix.de>
References: <20241205-v6-12-topic-socfpga-agilex5-v3-1-2a8cdf73f50a@pengutronix.de>
TO: Steffen Trumtrar <s.trumtrar@pengutronix.de>
TO: Dinh Nguyen <dinguyen@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Richard Cochran <richardcochran@gmail.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: netdev@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: kernel@pengutronix.de
CC: Steffen Trumtrar <s.trumtrar@pengutronix.de>

Hi Steffen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 40384c840ea1944d7c5a392e8975ed088ecf0b37]

url:    https://github.com/intel-lab-lkp/linux/commits/Steffen-Trumtrar/dt-bindings-net-dwmac-Convert-socfpga-dwmac-to-DT-schema/20241205-171143
base:   40384c840ea1944d7c5a392e8975ed088ecf0b37
patch link:    https://lore.kernel.org/r/20241205-v6-12-topic-socfpga-agilex5-v3-1-2a8cdf73f50a%40pengutronix.de
patch subject: [PATCH v3 1/6] dt-bindings: net: dwmac: Convert socfpga dwmac to DT schema
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm-randconfig-051-20241205 (https://download.01.org/0day-ci/archive/20241206/202412061603.iCB294Og-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412061603.iCB294Og-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412061603.iCB294Og-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: ethernet@ff700000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	'altr,socfpga-stmmac' is not one of ['altr,socfpga-stmmac-a10-s10']
   	'snps,dwmac-3.72a' was expected
   	'snps,dwmac-3.74a' was expected
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: ethernet@ff702000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	'altr,socfpga-stmmac' is not one of ['altr,socfpga-stmmac-a10-s10']
   	'snps,dwmac-3.72a' was expected
   	'snps,dwmac-3.74a' was expected
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: ethernet@ff702000: phy-mode:0: 'rgmii' is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: sram@ffff0000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: sram@ffff0000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: sram@ffff0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/clkmgr@ffd04000/clocks/usb_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/clkmgr@ffd04000/clocks/s2f_usr1_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: ethernet@ff800000: phy-mode:0: 'rgmii' is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/i2c@ffc02200/audio-codec@1a: failed to match any schema with compatible: ['adi,ssm2603']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: isl12022@6f: $nodename:0: 'isl12022@6f' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/intersil,isl12022.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: sram@ffe00000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: sram@ffe00000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: sram@ffe00000: 'ranges' is a required property
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/clkmgr@ffd04000/clocks/usb_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/clkmgr@ffd04000/clocks/s2f_usr1_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: ethernet@ff800000: phy-mode:0: 'rgmii' is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: isl12022@6f: $nodename:0: 'isl12022@6f' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/intersil,isl12022.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: sram@ffe00000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: sram@ffe00000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: sram@ffe00000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/clkmgr@ffd04000/clocks/usb_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/clkmgr@ffd04000/clocks/s2f_usr1_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: ethernet@ff800000: phy-mode:0: 'rgmii' is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/i2c@ffc02300/ltc@5c: failed to match any schema with compatible: ['ltc2977']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: spi@ffda5000: Unevaluated properties are not allowed ('rx-dma-channel', 'tx-dma-channel' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: resource-manager@0: gpio-controller: 'oneOf' conditional failed, one must be fixed:
   	{'compatible': ['altr,a10sr-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'phandle': 48} is not of type 'boolean'
   	True was expected
   	{'compatible': ['altr,a10sr-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'phandle': 48} is not of type 'null'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/clkmgr@ffd04000/clocks/usb_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/clkmgr@ffd04000/clocks/s2f_usr1_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: ethernet@ff800000: phy-mode:0: 'rgmii' is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/i2c@ffc02300/ltc@5c: failed to match any schema with compatible: ['ltc2977']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: spi@ffda5000: Unevaluated properties are not allowed ('rx-dma-channel', 'tx-dma-channel' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: resource-manager@0: gpio-controller: 'oneOf' conditional failed, one must be fixed:
   	{'compatible': ['altr,a10sr-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'phandle': 48} is not of type 'boolean'
   	True was expected
   	{'compatible': ['altr,a10sr-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'phandle': 48} is not of type 'null'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/usb_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/s2f_usr1_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: ethernet@ff800000: phy-mode:0: 'rgmii' is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/i2c@ffc02300/ltc@5c: failed to match any schema with compatible: ['ltc2977']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: spi@ffda5000: Unevaluated properties are not allowed ('rx-dma-channel', 'tx-dma-channel' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: resource-manager@0: gpio-controller: 'oneOf' conditional failed, one must be fixed:
   	{'compatible': ['altr,a10sr-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'phandle': 48} is not of type 'boolean'
   	True was expected
   	{'compatible': ['altr,a10sr-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'phandle': 48} is not of type 'null'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: ethernet@ff700000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	'altr,socfpga-stmmac' is not one of ['altr,socfpga-stmmac-a10-s10']
   	'snps,dwmac-3.72a' was expected
   	'snps,dwmac-3.74a' was expected
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: ethernet@ff702000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	'altr,socfpga-stmmac' is not one of ['altr,socfpga-stmmac-a10-s10']
   	'snps,dwmac-3.72a' was expected
   	'snps,dwmac-3.74a' was expected
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: i2c@ffc04000: Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/snps,designware-i2c.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: i2c@ffc05000: Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/snps,designware-i2c.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: i2c@ffc07000: Unevaluated properties are not allowed ('label' was unexpected)
--
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: ethernet@ff700000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	'altr,socfpga-stmmac' is not one of ['altr,socfpga-stmmac-a10-s10']
   	'snps,dwmac-3.72a' was expected
   	'snps,dwmac-3.74a' was expected
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: ethernet@ff700000: phy-mode:0: 'rgmii' is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: ethernet@ff702000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	'altr,socfpga-stmmac' is not one of ['altr,socfpga-stmmac-a10-s10']
   	'snps,dwmac-3.72a' was expected
   	'snps,dwmac-3.74a' was expected
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: stmpe811@41: '#address-cells', '#size-cells', 'blocks', 'id', 'irq-gpio', 'stmpe_touchscreen' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: stmpe811@41: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
--
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: ethernet@ff700000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	'altr,socfpga-stmmac' is not one of ['altr,socfpga-stmmac-a10-s10']
   	'snps,dwmac-3.72a' was expected
   	'snps,dwmac-3.74a' was expected
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: ethernet@ff702000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	'altr,socfpga-stmmac' is not one of ['altr,socfpga-stmmac-a10-s10']
   	'snps,dwmac-3.72a' was expected
   	'snps,dwmac-3.74a' was expected
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: ethernet@ff702000: phy-mode:0: 'rgmii' is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: sram@ffff0000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: sram@ffff0000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: sram@ffff0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: ethernet@ff700000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	'altr,socfpga-stmmac' is not one of ['altr,socfpga-stmmac-a10-s10']
   	'snps,dwmac-3.72a' was expected
   	'snps,dwmac-3.74a' was expected
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: ethernet@ff702000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	'altr,socfpga-stmmac' is not one of ['altr,socfpga-stmmac-a10-s10']
   	'snps,dwmac-3.72a' was expected
   	'snps,dwmac-3.74a' was expected
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: ethernet@ff702000: phy-mode:0: 'rgmii' is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: sram@ffff0000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: sram@ffff0000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: sram@ffff0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: ethernet@ff700000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	'altr,socfpga-stmmac' is not one of ['altr,socfpga-stmmac-a10-s10']
   	'snps,dwmac-3.72a' was expected
   	'snps,dwmac-3.74a' was expected
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: ethernet@ff702000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	'altr,socfpga-stmmac' is not one of ['altr,socfpga-stmmac-a10-s10']
   	'snps,dwmac-3.72a' was expected
   	'snps,dwmac-3.74a' was expected
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: ethernet@ff702000: phy-mode:0: 'rgmii' is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: sram@ffff0000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: sram@ffff0000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: sram@ffff0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: ethernet@ff700000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	'altr,socfpga-stmmac' is not one of ['altr,socfpga-stmmac-a10-s10']
   	'snps,dwmac-3.72a' was expected
   	'snps,dwmac-3.74a' was expected
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: ethernet@ff702000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	'altr,socfpga-stmmac' is not one of ['altr,socfpga-stmmac-a10-s10']
   	'snps,dwmac-3.72a' was expected
   	'snps,dwmac-3.74a' was expected
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: ethernet@ff702000: phy-mode:0: 'rgmii' is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: sram@ffff0000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: sram@ffff0000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: sram@ffff0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: ethernet@ff700000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	'altr,socfpga-stmmac' is not one of ['altr,socfpga-stmmac-a10-s10']
   	'snps,dwmac-3.72a' was expected
   	'snps,dwmac-3.74a' was expected
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: ethernet@ff702000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	'altr,socfpga-stmmac' is not one of ['altr,socfpga-stmmac-a10-s10']
   	'snps,dwmac-3.72a' was expected
   	'snps,dwmac-3.74a' was expected
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: ethernet@ff702000: phy-mode:0: 'rgmii' is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: sram@ffff0000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: sram@ffff0000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: sram@ffff0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: ethernet@ff700000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	'altr,socfpga-stmmac' is not one of ['altr,socfpga-stmmac-a10-s10']
   	'snps,dwmac-3.72a' was expected
   	'snps,dwmac-3.74a' was expected
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: ethernet@ff702000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	'altr,socfpga-stmmac' is not one of ['altr,socfpga-stmmac-a10-s10']
   	'snps,dwmac-3.72a' was expected
   	'snps,dwmac-3.74a' was expected
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: ethernet@ff702000: phy-mode:0: 'rgmii' is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: sram@ffff0000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: sram@ffff0000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: sram@ffff0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: ethernet@ff700000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	'altr,socfpga-stmmac' is not one of ['altr,socfpga-stmmac-a10-s10']
   	'snps,dwmac-3.72a' was expected
   	'snps,dwmac-3.74a' was expected
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: ethernet@ff700000: phy-mode:0: 'gmii' is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: ethernet@ff702000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
   	'altr,socfpga-stmmac' is not one of ['altr,socfpga-stmmac-a10-s10']
   	'snps,dwmac-3.72a' was expected
   	'snps,dwmac-3.74a' was expected
   	from schema $id: http://devicetree.org/schemas/net/socfpga-dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: sram@ffff0000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
