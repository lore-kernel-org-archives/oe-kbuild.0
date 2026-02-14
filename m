Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C90C220F38
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Feb 2026 17:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771091408; cv=none; b=aJKCCRxlMUlmJ+AI/ijAaTbAyzvA9pz+HXrvsrw8F3Nh7DWdmHjhVyFCYQnJgu8GTAWXZvVa8Rkvc8DejXdiDw5Trb9FTCtN/g/WN+AVwcfoODGHHCFlMzx9woqYSKzpQYUdPPC5vExbFFia5+q8woVT3m7jyvDyOU/bi02meao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771091408; c=relaxed/simple;
	bh=OunZZvjEkvprON0KDtTSEITmhXRNCrKBePeHFW3jB+8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TIzKV2zJLtQnE5dQgf15X4Dm2FBR0xAxf30hxz17UKpz2vCgoZ+/fK/xaf474J7I2PF+03v3fd3Zss3/PScuipW/OYxIkAaJu5LHhAe7A4h9K6yqKslZH/hHXug7+0J0zEbWv8PMuAt/6JUF2wyFRTUqjuBa3nJezqdKV7EgRBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cvH4ZB9z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvH4ZB9z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771091405; x=1802627405;
  h=date:from:to:cc:subject:message-id;
  bh=OunZZvjEkvprON0KDtTSEITmhXRNCrKBePeHFW3jB+8=;
  b=cvH4ZB9zPzeewRAr3a1LcxYkG1jSTsfbMP77uJk+WrxtELd+wB7p0Zu0
   /THawT7PI4crriirmFAzqeROsfsMaBPJFwYzDIEgVhnSDGmcgmxVKYY0C
   RPCGLP4xyx6SIFSyQteSGxRP8lvKobcRkFSwEgm/MzgHOd31u/jHX43we
   euyzBn2dDlIZxqztIeiOSxZfRL3UgUbkcfsSeKmSZkl+aJbzjQkccbDK5
   79JYjx3d5QYwDj6aR32yawxg0uAl1S/azNQqpxsjiW2mcmavWuxs4FxCl
   h71IBgtzTIkbUTRmZcs/ouB5m7TdzeuKnDFL8wT9wvhu8lkwCsS5HryX9
   A==;
X-CSE-ConnectionGUID: Ailblhf3T466l/cmbEAUvQ==
X-CSE-MsgGUID: lmdbNfUUQem5WLL7QHRatg==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="82572844"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="82572844"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 09:50:05 -0800
X-CSE-ConnectionGUID: oZoaqNoqQ3Cj4FZhVsLh2A==
X-CSE-MsgGUID: 2aQBBhX4RkGs7XugSN8cyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="217360536"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 14 Feb 2026 09:50:03 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrJmI-000000001tr-1wsN;
	Sat, 14 Feb 2026 17:49:58 +0000
Date: Sat, 14 Feb 2026 18:49:12 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dinguyen:socfpga_dts_for_v6.19 15/37]
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb:
 ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are
 not allowed ('max-frame-size', 'mdio', 'phy-addr', 'phy-handle', 'reg',
 'reset-names', 'resets', 'rx-fifo-depth', ...
Message-ID: <202602141838.w0AYZ6lv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Lothar Rubusch <l.rubusch@gmail.com>
CC: Dinh Nguyen <dinguyen@kernel.org>
CC: Andreas Buerkler <andreas.buerkler@enclustra.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_dts_for_v6.19
head:   46badfef57adc4ebbcd100b38c31baac50acf8cd
commit: 26a0157f4c77dba26680e60106fb870d7c77e9c4 [15/37] ARM: dts: socfpga: add Mercury AA1 variants
:::::: branch date: 3 months ago
:::::: commit date: 4 months ago
config: arm-randconfig-2052-20260206 (https://download.01.org/0day-ci/archive/20260214/202602141838.w0AYZ6lv-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141838.w0AYZ6lv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602141838.w0AYZ6lv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: cb_intosc_hs_div2_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: cb_intosc_ls_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: f2s_free_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
   	['stmmaceth', 'stmmaceth-ocp'] is too long
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('max-frame-size', 'mdio', 'phy-addr', 'phy-handle', 'reg', 'reset-names', 'resets', 'rx-fifo-depth', 'snps,axi-config', 'snps,multicast-filter-bins', 'snps,perfect-filter-entries', 'tx-fifo-depth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
   	['stmmaceth', 'stmmaceth-ocp'] is too long
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
   	['stmmaceth', 'stmmaceth-ocp'] is too long
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
--
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/i2c@ffc02200/audio-codec@1a: failed to match any schema with compatible: ['adi,ssm2603']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: sram@ffe00000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: sram@ffe00000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: sram@ffe00000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: flash@0 (jedec,spi-nor): Unevaluated properties are not allowed ('partition@raw', 'u-boot,dm-pre-reloc' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: flash@0 (jedec,spi-nor): 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: sysmgr@ffd06000 (altr,sys-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: timer0@ffc02700 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: timer1@ffc02800 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
