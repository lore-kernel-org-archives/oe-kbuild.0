Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6771E3762
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Jun 2025 16:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749831237; cv=none; b=uM2o6rL7/HObe/TPS2gLU+rgwxJi/S8jEA7F8ZzdXYj0JIGAy0rCdmA5yra8ZiCGxxUZziJC65DYSGDD9T8SSA7wOaoudSsJvWnTJc4B4U70STi3z+C34cKXAvY5xy+lwmy/RsFkADZyI6MWZSjbF4aD0gQUFrhkhs9f5GGyFeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749831237; c=relaxed/simple;
	bh=qoM7CkGA9/zMg9etIk/+Oigtm7qgpmNQayBhcqBtL7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XZj1xTJ44cFlRXnyQF54Pi80j1bxXG6z7xFUdfccr3gl8dcMpFiBTwtnZzUErpnL43KgJNKo72L5BT9gsCPtl7IJdX5w55AmgZs+ACKWw3o7kfX9/lIEe0CnSwwvodfjKNJTVFWO7rsq1n2072UhaaAzQiPvSYhvv9D89QCfYGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m83hN4dv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m83hN4dv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749831235; x=1781367235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qoM7CkGA9/zMg9etIk/+Oigtm7qgpmNQayBhcqBtL7Y=;
  b=m83hN4dv2AZwsssjIcEbjITvxWf53NowqDdQFlJS/B6drCuuOXk42aAk
   1MqvNoj5isNOPRTqzgJWR/cJhtfAdzfQTfZ8coAjcnw8BmeX4l6rScnR5
   Q4ilUxuJbr1VAoVF1YdeyGuu9Wk7Iy/J1C68BM+Y3n7/SL8sieN9LUcWo
   PDeOTgn72SD5cthpVvj3K0MXAZPfBqPiS9Z+o3b8y9qZki2Bt5fDLRBoT
   Ide1CQ/iwaeDhmSGcj00D6/gvR+NfM3rn5rhLJ7K9PVm7y52rYfPHchB9
   TJX50rtGc8FPQMmc8DMQbuCAmO+pdN6UvqzuMiV/wuHT7ZVtMFyXQ6UX6
   g==;
X-CSE-ConnectionGUID: gfJ3BTBbTZ20RRTQb9R7eA==
X-CSE-MsgGUID: RvGjKJHLRBO7iIieB/mAoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="77444041"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="77444041"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 09:13:54 -0700
X-CSE-ConnectionGUID: jIP2tCRnTo+H1OXzRanQmg==
X-CSE-MsgGUID: +Tkyh7k7RvqmOdFh4CeVRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="148410187"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Jun 2025 09:13:53 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQ72M-000Cn8-0b;
	Fri, 13 Jun 2025 16:13:50 +0000
Date: Sat, 14 Jun 2025 00:12:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 1/1] dt-bindings: arm: Convert Altera SDRAM EDAC .txt
 to YAML
Message-ID: <202506140009.S98sgmFk-lkp@intel.com>
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
In-Reply-To: <20250612063700.874830-2-shankari.ak0208@gmail.com>
References: <20250612063700.874830-2-shankari.ak0208@gmail.com>
TO: Shankari Anand <shankari.ak0208@gmail.com>
TO: devicetree@vger.kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: matthew.gerlach@altera.com
CC: Shankari Anand <shankari.ak0208@gmail.com>

Hi Shankari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk-mem-ctrl/for-next linus/master v6.16-rc1 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shankari-Anand/dt-bindings-arm-Convert-Altera-SDRAM-EDAC-txt-to-YAML/20250612-143840
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250612063700.874830-2-shankari.ak0208%40gmail.com
patch subject: [PATCH v4 1/1] dt-bindings: arm: Convert Altera SDRAM EDAC .txt to YAML
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: arm64-randconfig-051-20250613 (https://download.01.org/0day-ci/archive/20250614/202506140009.S98sgmFk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506140009.S98sgmFk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506140009.S98sgmFk-lkp@intel.com/

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
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: sdramedac (altr,sdram-edac-s10): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/socfpga-sdram-edac.yaml#
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
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: sdramedac (altr,sdram-edac-s10): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/socfpga-sdram-edac.yaml#
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
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: sdramedac (altr,sdram-edac-s10): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/socfpga-sdram-edac.yaml#
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
>> arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: sdramedac (altr,sdram-edac-s10): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/socfpga-sdram-edac.yaml#
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
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: sdramedac (altr,sdram-edac-s10): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/socfpga-sdram-edac.yaml#
--
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: clock-controller@ffd10000 (intel,agilex-clkmgr): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/intel,agilex.yaml#
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: /soc@0/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: /soc@0/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: /soc@0/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: /soc@0/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: /soc@0/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: /soc@0/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: nand-controller@ffb90000 (altr,socfpga-denali-nand): Unevaluated properties are not allowed ('flash@0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/denali,nand.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: sdramedac (altr,sdram-edac-s10): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/socfpga-sdram-edac.yaml#
--
   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: f2s-free-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: clock-controller@ffd10000 (intel,easic-n5x-clkmgr): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/intel,easic-n5x.yaml#
   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: /soc@0/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: /soc@0/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: /soc@0/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: /soc@0/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: /soc@0/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: /soc@0/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
>> arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: sdramedac (altr,sdram-edac-s10): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/socfpga-sdram-edac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
