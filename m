Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742C820EB
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Jun 2025 06:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750747304; cv=none; b=Bw3OfvSAb/KHWw0g79DMdC8vR+vvSb3uDzvYycyMS/MqjuyMvyC9mK/vt/2G2kc55lBGYH0mbsbUrm2YiteyH+xdTIB3h2PH8GYF/vVFlQlcGe5NW2pHTCMQUYUgU/xiDxOUQeAA+2COtkBKfDvhwaEJ1gPgA3kltc2cpC1o5VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750747304; c=relaxed/simple;
	bh=Q9kavkqSts5rewaCX3wuRewhG4ZBrtbCT/D/R5+z28o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dQFjfbEdfS1jSPVIZs898gFNqaSojJpLmig9Dcxo1MXpkZ89Eplr/KX5R2CEKE7qek+REQgrDWIsZTW/xolpJ8bEQzt37OpFLlPri7WOaxbz7vhVoMCWAb/EjRq12B6z1iLpDymtE+/52N0UihBJKIuENZPDZT2UZxJUTeA4zdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JGu9kCDT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JGu9kCDT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750747303; x=1782283303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q9kavkqSts5rewaCX3wuRewhG4ZBrtbCT/D/R5+z28o=;
  b=JGu9kCDT3alvn3eNwp3frVpUuM6RggDFloNaJD7NGiS9t/o18UH4varN
   FWdSq6Zu6zB9dWedYBfZuE5quyjwZwJHqlhwhkS0DPE0BGOwdyV2tNW3e
   4mFjo8LQhGaDPnjD32W4sl1VWzM26ZIcmZBd9uMBvrtqndNEbaRezfEQc
   EdGhJTXjpx6HYtFpWzKbmVWGd/HtJ5oW2ZwcgVcu8obNK8NiRTIcYjB+y
   TTxgEeDdsL12LSNBXJj+3j5sm8gG4wGhhVN3GJ7jf3rV+prQhrSfsVhDE
   W352dLpWE9j/KbHydQKKszMGn0itKz8O6GEF/HKUfgz+ceEHBfDVF4AyF
   w==;
X-CSE-ConnectionGUID: SgQ8FvryQTOePOa8ClV7bg==
X-CSE-MsgGUID: Y+eb1EVjQAyEMlaVaJTykQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53107542"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="53107542"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 23:41:43 -0700
X-CSE-ConnectionGUID: K2pxxfVTRmGrMiO2SfdaRA==
X-CSE-MsgGUID: kxaVyukKRFixIfp4EVcqIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="157599305"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Jun 2025 23:41:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTxLe-000Roq-1n;
	Tue, 24 Jun 2025 06:41:38 +0000
Date: Tue, 24 Jun 2025 14:40:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5] dt-bindings: memory-controllers: Convert Altera SDRAM
 EDAC .txt to YAML
Message-ID: <202506241448.HgNBmVAE-lkp@intel.com>
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
In-Reply-To: <20250620091429.388981-1-shankari.ak0208@gmail.com>
References: <20250620091429.388981-1-shankari.ak0208@gmail.com>
TO: Shankari Anand <shankari.ak0208@gmail.com>
TO: devicetree@vger.kernel.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: matthew.gerlach@altera.com
CC: Shankari Anand <shankari.ak0208@gmail.com>

Hi Shankari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk-mem-ctrl/for-next linus/master v6.16-rc3 next-20250623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shankari-Anand/dt-bindings-memory-controllers-Convert-Altera-SDRAM-EDAC-txt-to-YAML/20250620-171643
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250620091429.388981-1-shankari.ak0208%40gmail.com
patch subject: [PATCH v5] dt-bindings: memory-controllers: Convert Altera SDRAM EDAC .txt to YAML
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20250621 (https://download.01.org/0day-ci/archive/20250624/202506241448.HgNBmVAE-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506241448.HgNBmVAE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506241448.HgNBmVAE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: /soc@0/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: /soc@0/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: /soc@0/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: /soc@0/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: /soc@0/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: /soc@0/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: rstmgr@ffd11000 (altr,stratix10-rst-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,stratix10-rst-mgr'] is too short
   	'altr,rst-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/reset/altr,rst-mgr.yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: sdramedac (altr,sdram-edac-s10): interrupts: [[16, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/altr,sdram-edac.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: sdramedac (altr,sdram-edac-s10): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/altr,sdram-edac.yaml#
--
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: /soc@0/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: /soc@0/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: /soc@0/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: /soc@0/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: /soc@0/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: /soc@0/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: rstmgr@ffd11000 (altr,stratix10-rst-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,stratix10-rst-mgr'] is too short
   	'altr,rst-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/reset/altr,rst-mgr.yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: sdramedac (altr,sdram-edac-s10): interrupts: [[16, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/altr,sdram-edac.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: sdramedac (altr,sdram-edac-s10): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/altr,sdram-edac.yaml#
--
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: rstmgr@ffd11000 (altr,stratix10-rst-mgr): altr,modrst-offset: False schema does not allow 32
   	from schema $id: http://devicetree.org/schemas/reset/altr,rst-mgr.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: rstmgr@ffd11000 (altr,stratix10-rst-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,stratix10-rst-mgr'] is too short
   	'altr,rst-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/reset/altr,rst-mgr.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: sysmgr@ffd12000 (altr,sys-mgr-s10): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: sysmgr@ffd12000 (altr,sys-mgr-s10): cpu1-start-addr: False schema does not allow 4291846704
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: sdramedac (altr,sdram-edac-s10): interrupts: [[16, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/altr,sdram-edac.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: sdramedac (altr,sdram-edac-s10): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/altr,sdram-edac.yaml#
--
   arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: f2s-free-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: clock-controller@ffd10000 (intel,agilex-clkmgr): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/intel,agilex.yaml#
   arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: /soc@0/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: /soc@0/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: /soc@0/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: /soc@0/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: /soc@0/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: /soc@0/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
>> arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: sdramedac (altr,sdram-edac-s10): interrupts: [[16, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/altr,sdram-edac.yaml#
   arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: sdramedac (altr,sdram-edac-s10): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/altr,sdram-edac.yaml#
--
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: f2s-free-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: clock-controller@ffd10000 (intel,agilex-clkmgr): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/intel,agilex.yaml#
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: /soc@0/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: /soc@0/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: /soc@0/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: /soc@0/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: /soc@0/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: /soc@0/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: sdramedac (altr,sdram-edac-s10): interrupts: [[16, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/altr,sdram-edac.yaml#
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: sdramedac (altr,sdram-edac-s10): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/altr,sdram-edac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
