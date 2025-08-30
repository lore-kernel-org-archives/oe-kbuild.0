Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F2A2777FC
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Aug 2025 11:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756551966; cv=none; b=nIuywr3KfxEW0TQxEm69CsXs61WJOZrjjNLmoJF58505nzn434k5tzYRlF7fwRW7LGfWvv1ROOml+GLHRaFWntDHahv33EheDirFcVDjYb9t7yAxsAIM6mJRd3kuNqRjmQAFUEM8eyL9Fpn7xc+Gyv9mhfXJZFXQ5N3AJZ7u4Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756551966; c=relaxed/simple;
	bh=fx0pgxo/oCj0ha0brHW1SfDa7va7MstaSmnaqPzpb6A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AmCU40VwV0cAPCyO0q0Fc3rEfQgJ+rCu2OA12EQIkfmF9qLHWtxVO1YHhUZ97YT1J2mv9nMCFuk730cFmyUQSx3vHYt6WYDcJbzByQWYYYJsTuGUd0vuLEvFpt93bu4v57LUdfGTGp9tg79Vjqg69/qKYkB9fOWyZVx3Ou42j5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+TRWMya; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+TRWMya"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756551963; x=1788087963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fx0pgxo/oCj0ha0brHW1SfDa7va7MstaSmnaqPzpb6A=;
  b=I+TRWMyaJUSgGXqdYFZy34NbXvYf40dJ9fVH58bh4cp+IdilILjBWCpQ
   59UPlmPAqbHarA7Ch9mjl4AkubOQB3DYNVFxkShVIQnCO3nIahNYNeVP5
   H9jq7rbc4PZismpFRUAGFho1R2hvH3l5o63QNosr1T1v7MlNUw1p0LOy2
   poyaS4PHc4udTLUk67tfY56uUPGUpvqMe5VcTSYJUl8of+WroezHJ1PO5
   QmQaFcq1k01UgWgKODNHqRmZRLZIYacsYYLD2q0DuqO1X984wIkvplxk0
   D77KPQ82JNRnbmkJ/DIGRtwokUYf1YBt/Q4jfBcQ8ERqRRHRmcDX8Yl6c
   g==;
X-CSE-ConnectionGUID: 6MIDrsECQBejB4gjpgkVaA==
X-CSE-MsgGUID: jeL8klhATlKSPwWPYoI95A==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="69416760"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="69416760"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 04:06:03 -0700
X-CSE-ConnectionGUID: NvL/+q8gTQe5v2LWhaTvsQ==
X-CSE-MsgGUID: AqFSCDpaTOaAOfBHOAXwGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="194245172"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 30 Aug 2025 04:06:01 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usJPD-000VKZ-0w;
	Sat, 30 Aug 2025 11:05:59 +0000
Date: Sat, 30 Aug 2025 19:05:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: panel: lvds: Append
 ampire,amp19201200b5tzqw-t03 in panel-lvds
Message-ID: <202508301801.6ivmVczp-lkp@intel.com>
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
In-Reply-To: <20250826-drm-misc-next-v1-1-980d0a0592b9@foss.st.com>
References: <20250826-drm-misc-next-v1-1-980d0a0592b9@foss.st.com>
TO: "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>

Hi Raphael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7399c13f619f33dc8bdce838f3c83e88a18765ee]

url:    https://github.com/intel-lab-lkp/linux/commits/Raphael-Gallais-Pou/dt-bindings-panel-lvds-Append-ampire-amp19201200b5tzqw-t03-in-panel-lvds/20250826-200018
base:   7399c13f619f33dc8bdce838f3c83e88a18765ee
patch link:    https://lore.kernel.org/r/20250826-drm-misc-next-v1-1-980d0a0592b9%40foss.st.com
patch subject: [PATCH] dt-bindings: panel: lvds: Append ampire,amp19201200b5tzqw-t03 in panel-lvds
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-051-20250827 (https://download.01.org/0day-ci/archive/20250830/202508301801.6ivmVczp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508301801.6ivmVczp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508301801.6ivmVczp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: /ahb/ebi@10000000: failed to match any schema with compatible: ['atmel,sama5d3-ebi']
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: /ahb/ebi@10000000/nand-controller: failed to match any schema with compatible: ['atmel,sama5d3-nand-controller']
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: nand-controller (atmel,sama5d3-nand-controller): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: nand-controller (atmel,sama5d3-nand-controller): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: panel (sharp,lq150x1lg11): 'data-mapping', 'height-mm', 'panel-timing', 'port', 'width-mm' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/sharp,lq150x1lg11.yaml#
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: panel (sharp,lq150x1lg11): compatible: ['sharp,lq150x1lg11', 'panel-lvds'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/sharp,lq150x1lg11.yaml#
>> arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: panel (sharp,lq150x1lg11): compatible:0: 'sharp,lq150x1lg11' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: panel (sharp,lq150x1lg11): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: panel-timing: clock-frequency: 'anyOf' conditional failed, one must be fixed:
   	[50000000, 65000000, 80000000] is not of type 'integer'
   	size is 32, expected 64
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: stmpe811@41 (st,stmpe811): 'blocks', 'id', 'irq-trigger', 'stmpe_adc', 'stmpe_touchscreen' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: cpu@2 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: cpu@3 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: panel-lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: panel-lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dtb: stmpe811@41 (st,stmpe811): 'blocks', 'id', 'irq-trigger', 'stmpe_adc', 'stmpe_touchscreen' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dtb: cpu@2 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dtb: cpu@3 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dtb: panel-lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dtb: panel-lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dtb: stmpe811@41 (st,stmpe811): 'blocks', 'id', 'irq-trigger', 'stmpe_adc', 'stmpe_touchscreen' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dtb: cpu@2 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dtb: cpu@3 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dtb: panel-lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dtb: panel-lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.1.dtb: stmpe811@41 (st,stmpe811): 'blocks', 'id', 'irq-trigger', 'stmpe_adc', 'stmpe_touchscreen' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.1.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.1.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.1.dtb: cpu@2 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.1.dtb: cpu@3 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.1.dtb: panel-lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.1.dtb: panel-lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: cpu@2 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: cpu@3 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: panel-lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: panel-lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: cpu@2 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: cpu@3 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: panel-lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: panel-lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: cpu@2 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: cpu@3 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: panel-lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: panel-lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: cpu@2 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: cpu@3 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: panel-lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: panel-lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: cpu@2 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: cpu@3 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: lvds-panel0 (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: lvds-panel0 (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: lvds-panel0 (panel-lvds): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: lvds-panel1 (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: lvds-panel1 (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: lvds-panel1 (panel-lvds): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
