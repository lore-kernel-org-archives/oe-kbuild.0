Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CEB2877F2
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Nov 2025 03:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762140594; cv=none; b=g8hdOESZcQxw3zKl0tE7xe6KKO2uJpnrUZkko5gANR4USWq9C4t/JDMi33zMxZuUSi9F8lZrRngJ0MfG6NL7Mh9dOemkf5KtaOCMiKT7AYjhx0qIKUAcy2XOdnwG7epfHml5wsav4ndT+XpGY5tUyirQsjnzYlzZ/hnFCqAQiwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762140594; c=relaxed/simple;
	bh=hmfNSFJBdFac2N1dnj+EXsIU+EiJJMjfx4Yvalh+jmA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CfNkYE+rCFkHtd1z/oUPcZm+MR7WvaZ1l3CL4xxG8F7A0jivzE9fgozn6Vty/vP48TdhoWMkT2KflVaSsZ60frZZ3VYafqrFGRx4bf3V5IXxqE0wiLyYfQFAr7mL2OMnYShXs5mGf0cX9gwiG6dIzlGYXerjUeN0hRu1lMgw+Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G4JJ7WYC; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4JJ7WYC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762140592; x=1793676592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hmfNSFJBdFac2N1dnj+EXsIU+EiJJMjfx4Yvalh+jmA=;
  b=G4JJ7WYCjGXUOKd8dNAg9mJW11hmhmEMTEKGDUkf8O2bwxILvVN8GUQS
   tYQQIoDUEgXToTmUSxx6miZinbdtv1XlqUa5/J4h240Qou9FFM5j/hIsd
   hU6xYexcjy997elg3voxyz9Wxw6O/iA6qHjL1IbqG7Jk7Zu1HOytPvfZc
   7DMntJLS7bAWMD+Db4yigEPQJrLcA58KoH7ycUDpV2L8mXx3/wuBRcX3w
   OprzChSnlaBImxTpH/dxZQLDo8gDQZWVdpNCS7hrVquvcYiMSN62jDyFD
   asQ1TE8HiXfRkSnK5RRJo59SSPW9ngv5cTJDb/7LMasuxVHlbTsZ4gH15
   Q==;
X-CSE-ConnectionGUID: g8zpcWHCRneJlFAZxck9Sw==
X-CSE-MsgGUID: rsGkyc5nQniR4sHy93U5gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="75564108"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="75564108"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 19:29:52 -0800
X-CSE-ConnectionGUID: kyy4w1MxRGeaUR1+LwLXhA==
X-CSE-MsgGUID: L6rKfLHHQB2GV4VF6HyEbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="190847036"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 02 Nov 2025 19:29:51 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vFlGO-000000001bQ-2cHY;
	Mon, 03 Nov 2025 03:29:48 +0000
Date: Mon, 3 Nov 2025 04:29:07 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dinguyen:socfpga_dts_for_v6.19 15/26]
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb:
 ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are
 not allowed ('max-frame-size', 'mdio', 'phy-addr', 'phy-handle', 'reg',
 'reset-names', 'resets', 'rx-fifo-depth', ...
Message-ID: <202511030443.E74biGzT-lkp@intel.com>
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
TO: Lothar Rubusch <l.rubusch@gmail.com>
CC: Dinh Nguyen <dinguyen@kernel.org>
CC: Andreas Buerkler <andreas.buerkler@enclustra.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_dts_for_v6.19
head:   95853aaab9862ee008c29b500b61cd01df1d4e25
commit: 26a0157f4c77dba26680e60106fb870d7c77e9c4 [15/26] ARM: dts: socfpga: add Mercury AA1 variants
:::::: branch date: 3 days ago
:::::: commit date: 13 days ago
config: arm-randconfig-2052-20251027 (https://download.01.org/0day-ci/archive/20251103/202511030443.E74biGzT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.9.dev13+gc72762e0c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511030443.E74biGzT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511030443.E74biGzT-lkp@intel.com/

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
