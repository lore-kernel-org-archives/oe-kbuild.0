Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73242512E6
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 14:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761749956; cv=none; b=tFY4daQHUtMAdBnrJ9qlYZ2kB3IZF25gyOZK866w0pegUbW23i5fb9jLgnsswi/q/s8QkH/D0h2ig0S0lHQa0jilImK8ITTlkIBI7lL5zpcAmUdA0NxLr13A+7dcIzn3O6GCVFOeBtUOm40K09/KtY784JzJgiPMbciVR0SVTQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761749956; c=relaxed/simple;
	bh=LW3utlKMUT+37q3UfdcpR0dfk88T7hz83ywrr2Tqm00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mNW+MPsTj/XejI+5tOkqPWWBbcbJtWZ03EeV8C4GxC83egixHAFVN/a529Le1/ylEZOrBXGxFrgHkZ+07m2Zr7aqgCC21/J6ZSi4FKPksL77PiwsQWT709rfr3HU5mw+OxvUY+0+pjgEn7J9JkT5KgEs1ELasmbPhtBRU71fm50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWm6nX4a; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWm6nX4a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761749955; x=1793285955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LW3utlKMUT+37q3UfdcpR0dfk88T7hz83ywrr2Tqm00=;
  b=QWm6nX4acP2dnglZvSH+xRyX0IFX/DJ/JHhv6ZvnXWrcCuzgFTBe7qpy
   dHBFT5gNGuCekkyweOQd7ftH1P1/KkKbCkyXUbnPBdt/R6FwnMBRIwKvv
   cxv5zj6BIWcdpNWV0WgI6UbcBjLaxPX74x+h6q3HKbffCVnKsnmqOWwTS
   VxVrp4wTnqrwbNUN5O6WufSL8PWEZot35p+iVZCTt95mDJ2hd2lfBqW+r
   s5oWWN4KV/wxweol/SSrX3500T8OMriAlhE4xnD62FAjUeoafSgoAPU29
   b5t31hUhn2eGW5d+jKM6SPC2AKlZSwikPmUnIHXknTk2IbPj+0CQnRFF7
   A==;
X-CSE-ConnectionGUID: xhTOEspoQIKRXLl7YdyIiQ==
X-CSE-MsgGUID: 6Gg/SHQLRtq9nWzW8WJgFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="64023792"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="64023792"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 07:59:14 -0700
X-CSE-ConnectionGUID: g28IB3Z4TbegBSyJqtO+fg==
X-CSE-MsgGUID: PDS/2ZejTR61SO7B0m4qAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="190001508"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 29 Oct 2025 07:59:14 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vE7dn-000000000w4-1S4l;
	Wed, 29 Oct 2025 14:59:11 +0000
Date: Wed, 29 Oct 2025 15:59:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dinguyen:socfpga_dts_for_v6.19 15/26]
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb:
 ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are
 not allowed ('max-frame-size', 'mdio', 'phy-addr', 'phy-handle', 'reg',
 'reset-names', 'resets', 'rx-fifo-depth', ...
Message-ID: <202510291532.OUs1COOR-lkp@intel.com>
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
head:   3637309e6015b24b5d99f93c549b33e2114eb8c3
commit: 26a0157f4c77dba26680e60106fb870d7c77e9c4 [15/26] ARM: dts: socfpga: add Mercury AA1 variants
:::::: branch date: 2 days ago
:::::: commit date: 9 days ago
config: arm-randconfig-2052-20251027 (https://download.01.org/0day-ci/archive/20251029/202510291532.OUs1COOR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510291532.OUs1COOR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510291532.OUs1COOR-lkp@intel.com/

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
