Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1B822A1CA
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Feb 2025 09:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738747338; cv=none; b=Vb/vExHfpLKaZqp8Yor9EiUTNJfJ7+lONeHrHzuFDDJdBvTWmMMz2HV+oRsTWcGPymsD4cA7MOJXZuQaWaVxA4K7JALUUVH8DjrY5Ndi+uFy03w0DLsty8+gF0zB+oBr4LCQR2ivfmZ29Bgu4WlG4UfzTd0/RVxmg0fFFjlqiuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738747338; c=relaxed/simple;
	bh=UzQjXSKFxbPcrgYiROFDlngg7sogbHbxqZ7i8Ux4+qU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M3YSZCReaSGt8L3XIjZN/ZuSBun8A7e5LpuHVcZ1KR0/LLAga84lR+TCiPms/mmTN4MgxlUP/2hLbFdTrVI0xQtLoAczcPGM2ccl4DTuh+aMubEPBZ+nxvg8ZVZjxjrFjURNNLwzowy7QMmbTvKvnqxzDaAov1aPNqVm7auxjvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mKrweD6n; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mKrweD6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738747335; x=1770283335;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UzQjXSKFxbPcrgYiROFDlngg7sogbHbxqZ7i8Ux4+qU=;
  b=mKrweD6nBebJNZxybpfMNdgrW4XIQE4u/a+hZoyzB20Sln9ipxG5qGHv
   LuzVl0m4iw5ZNTJzKk/39kKljDBURuvpfU5wbf5HHKyh21CWBQkdddVvg
   U15vg4gPq4/19hr5/xk8GHzkrL/vgdc1nvy5pc3GMXAC8ERxxsP6ZNclU
   +OtMFmdztDqs77aYkub8RH0iDkWBObAimqBKZfhAAPkvPmZV5WWSOw7u0
   IFzF3gkHeyhZuYzT8ngdNrZfVsNXZr01pjkcgBZfsdZIXqny9lEaEApaP
   VSOlqoM9yJ8CWgjAbk0UQyLjPmcwif7iuJ4jXFMEzFkQaRHwnCiWLiJwO
   w==;
X-CSE-ConnectionGUID: YQOn2Z9UQ6miorXRY3NXlQ==
X-CSE-MsgGUID: JPKKErDuRXeV1Q1vPU5rZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43056408"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="43056408"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:22:15 -0800
X-CSE-ConnectionGUID: Jc6J/y+KTgqEyyk65PrCCg==
X-CSE-MsgGUID: 4UCKo6jeQ/GHRc3Hn4ckww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="115897622"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Feb 2025 01:22:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfbbn-000tgj-1a;
	Wed, 05 Feb 2025 09:22:11 +0000
Date: Wed, 5 Feb 2025 17:22:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] ARM: dts: socfpga: Add basic support for Terrasic's
 de10-nano
Message-ID: <202502051649.4a6Eks0v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250130074553.92023-2-u.kleine-koenig@baylibre.com>
References: <20250130074553.92023-2-u.kleine-koenig@baylibre.com>
TO: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
TO: Dinh Nguyen <dinguyen@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: Andrew Lunn <andrew@lunn.ch>

Hi Uwe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a13f6e0f405ed0d3bcfd37c692c7d7fa3c052154]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/ARM-dts-socfpga-Add-basic-support-for-Terrasic-s-de10-nano/20250130-154750
base:   a13f6e0f405ed0d3bcfd37c692c7d7fa3c052154
patch link:    https://lore.kernel.org/r/20250130074553.92023-2-u.kleine-koenig%40baylibre.com
patch subject: [PATCH v2] ARM: dts: socfpga: Add basic support for Terrasic's de10-nano
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-052-20250131 (https://download.01.org/0day-ci/archive/20250205/202502051649.4a6Eks0v-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502051649.4a6Eks0v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502051649.4a6Eks0v-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:90.20-96.5: Warning (simple_bus_reg): /soc/base_fpga_region: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:563.40-567.5: Warning (simple_bus_reg): /soc/stmmac-axi-config: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:714.18-732.5: Warning (simple_bus_reg): /soc/eccmgr: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:823.13-827.5: Warning (simple_bus_reg): /soc/sdramedac: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:934.19-938.5: Warning (simple_bus_reg): /soc/usbphy: missing or empty reg/ranges property
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['terasic,de10-nano', 'altr,socfpga-cyclone5', 'altr,socfpga'] is too short
   	['terasic,de10-nano', 'altr,socfpga-cyclone5', 'altr,socfpga'] is too long
   	'terasic,de10-nano' is not one of ['altr,socfpga-arria5-socdk']
   	'terasic,de10-nano' is not one of ['altr,socfpga-arria10-socdk']
   	'terasic,de10-nano' is not one of ['enclustra,mercury-pe1', 'google,chameleon-v3']
   	'terasic,de10-nano' is not one of ['altr,socfpga-cyclone5-socdk', 'denx,mcvevk', 'ebv,socrates', 'macnica,sodia', 'novtech,chameleon96', 'samtec,vining', 'terasic,de0-atlas', 'terasic,socfpga-cyclone5-sockit']
   	'terasic,de10-nano' is not one of ['altr,socfpga-stratix10-socdk', 'altr,socfpga-stratix10-swvp']
   	'altr,socfpga-vt' was expected
   	'altr,socfpga-arria5' was expected
   	'altr,socfpga-arria10' was expected
   	'enclustra,mercury-aa1' was expected
   	'altr,socfpga-stratix10' was expected
   	'altr,socfpga' was expected
   	from schema $id: http://devicetree.org/schemas/arm/altera.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /: failed to match any schema with compatible: ['terasic,de10-nano', 'altr,socfpga-cyclone5', 'altr,socfpga']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: soc: stmmac-axi-config: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: soc: sdramedac: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: soc: usbphy: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: soc: base_fpga_region: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: amba: $nodename:0: 'amba' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: pdma@ffe01000: $nodename:0: 'pdma@ffe01000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/arm,pl330.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: base_fpga_region: $nodename:0: 'base_fpga_region' does not match '^fpga-region(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/fpga-region.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: osc2: 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: f2s_periph_ref_clk: 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: f2s_sdram_ref_clk: 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mpuclk@48: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mainclk@4c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/dbg_base_clk@50: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_qspi_clk@54: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_nand_sdmmc_clk@58: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/cfg_h2f_usr0_clk@5c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac0_clk@88: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac1_clk@8c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_qsi_clk@90: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_nand_mmc_clk@94: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_base_clk@98: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/h2f_usr1_clk@9c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dqs_clk@c8: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_2x_dqs_clk@cc: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dq_clk@d0: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/h2f_usr2_clk@d4: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/mpu_l2_ram_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/l3_main_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/l3_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/l3_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/dbg_at_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/dbg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/dbg_trace_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/dbg_timer_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/cfg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/emac_0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/emac_1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/usb_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/can0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/can1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/gpio_db_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk_divided: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/ethernet@ff700000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/ethernet@ff702000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: sram@ffff0000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: sram@ffff0000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: sram@ffff0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: spi@ff705000: resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: sysmgr@ffd08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: timer3@ffd01000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
