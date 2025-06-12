Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D65918B47C
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Jun 2025 16:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749745418; cv=none; b=JK9M/tZj6tbe3OR9eNiMmqGaVh6g66OnIN69GeeRFf1CnK6lD1aH8FAQfRgrPdmtlzJ24iPy/+xjn6iv0DWG5WgdW01DVJWtt2WZoYp6ToEgNzFsre+Vxg9ZfTlhgYpPoFkWae+znpj4coGIWz1xL5vVRwSV2U+4Vcfw8KDoteg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749745418; c=relaxed/simple;
	bh=Usukr8Iazc1Z26pSOKmHUxCRfxqEDyZ81e6n9p7KJOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O2TKNHD9US3ccQ4/8VVNmid743dBkJD/BZubRN0scfrW5sHQKMQ6FquYnmgQQvZ7U2nPchIPOTDLS78OPhZFjjCAlWPCtg0RJPds1LVAxOooPVRnb70Ba7/Ww/+D4KWE7lQcuviRhDmvfmNdT+3q0tfYeavws7XjMjgGKCLMEhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m73lIi05; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m73lIi05"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749745416; x=1781281416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Usukr8Iazc1Z26pSOKmHUxCRfxqEDyZ81e6n9p7KJOA=;
  b=m73lIi05fBCL42TtJTCDdV8eR0S7eaqwtQko5KRdX3JiHyllE2pS/m+N
   eIbahOeWUcU12G16rwv5NXWTMgzQyoAdGFX93A9qnObdSHhOMiw7KXN91
   7KrHE/TxtW9NTc5LUFSNCJ2ozuitpIsVDRwh7mB5T1Rl5eCbeys4Xc0IE
   I2G2VSRX48o1pDVItG5QKMeP0kKuLHt7doS3EX8rGxL5bSjT3xPmWbu7I
   ozj+heabldsnuchPLvcPUhaBTi96acfYfjEkclWdv/C9btMbzOwT4g2oT
   wQ+2IrBTt+G7/VL7P1BIZBzxXiXkXw3HzKylktiDAtM9qvQuvm9FuK73K
   g==;
X-CSE-ConnectionGUID: r1hRdJyBSLaqAK+ajiqQfQ==
X-CSE-MsgGUID: IqQ4Kl88Spav0LO3PfBpTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52035735"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="52035735"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 09:23:35 -0700
X-CSE-ConnectionGUID: ZTAEBtb4RkeXqX+KlDT0xg==
X-CSE-MsgGUID: Vl8R3t88SCuuVX1J6eOEBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="184809027"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Jun 2025 09:23:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPkiA-000Bm6-2h;
	Thu, 12 Jun 2025 16:23:30 +0000
Date: Fri, 13 Jun 2025 00:22:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: arm: Convert Altera SDRAM EDAC binding to
 YAML
Message-ID: <202506130055.a7RdLn4i-lkp@intel.com>
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
In-Reply-To: <20250608214822.192885-1-shankari.ak0208@gmail.com>
References: <20250608214822.192885-1-shankari.ak0208@gmail.com>
TO: Shankari Anand <shankari.ak0208@gmail.com>
TO: devicetree@vger.kernel.org
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Matthew Gerlach <matthew.gerlach@altera.com>
CC: Dinh Nguyen <dinguyen@kernel.org>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Shankari Anand <shankari.ak0208@gmail.com>

Hi Shankari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc1 next-20250611]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shankari-Anand/dt-bindings-arm-Convert-Altera-SDRAM-EDAC-binding-to-YAML/20250609-055015
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250608214822.192885-1-shankari.ak0208%40gmail.com
patch subject: [PATCH] dt-bindings: arm: Convert Altera SDRAM EDAC binding to YAML
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-054-20250609 (https://download.01.org/0day-ci/archive/20250613/202506130055.a7RdLn4i-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506130055.a7RdLn4i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506130055.a7RdLn4i-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/i2c@ffc02200/audio-codec@1a: failed to match any schema with compatible: ['adi,ssm2603']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: isl12022@6f (isil,isl12022): $nodename:0: 'isl12022@6f' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/intersil,isl12022.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: sram@ffe00000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: sram@ffe00000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: sram@ffe00000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: sdramedac (altr,sdram-edac-a10): interrupts: [[17, 4], [49, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-sdram-edac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: sysmgr@ffd06000 (altr,sys-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: timer0@ffc02700 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: timer1@ffc02800 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: isl12022@6f (isil,isl12022): $nodename:0: 'isl12022@6f' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/intersil,isl12022.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: sram@ffe00000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: sram@ffe00000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: sram@ffe00000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: sdramedac (altr,sdram-edac-a10): interrupts: [[17, 4], [49, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-sdram-edac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: sysmgr@ffd06000 (altr,sys-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: timer0@ffc02700 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: timer1@ffc02800 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   	{'compatible': ['altr,a10sr-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'phandle': 48} is not of type 'null'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/spi@ffda5000/resource-manager@0/gpio-controller: failed to match any schema with compatible: ['altr,a10sr-gpio']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/spi@ffda5000/resource-manager@0/reset-controller: failed to match any schema with compatible: ['altr,a10sr-reset']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: sram@ffe00000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: sram@ffe00000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: sram@ffe00000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: sdramedac (altr,sdram-edac-a10): interrupts: [[17, 4], [49, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-sdram-edac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: sysmgr@ffd06000 (altr,sys-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: timer0@ffc02700 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: timer1@ffc02800 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   	{'compatible': ['altr,a10sr-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'phandle': 48} is not of type 'null'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/spi@ffda5000/resource-manager@0/gpio-controller: failed to match any schema with compatible: ['altr,a10sr-gpio']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/spi@ffda5000/resource-manager@0/reset-controller: failed to match any schema with compatible: ['altr,a10sr-reset']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: sram@ffe00000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: sram@ffe00000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: sram@ffe00000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: sdramedac (altr,sdram-edac-a10): interrupts: [[17, 4], [49, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-sdram-edac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: flash@0 (micron,mt25qu02g): Unevaluated properties are not allowed ('partition@qspi-boot', 'partition@qspi-rootfs' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: flash@0 (micron,mt25qu02g): 'partition@qspi-boot', 'partition@qspi-rootfs' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: sysmgr@ffd06000 (altr,sys-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
--
   	{'compatible': ['altr,a10sr-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'phandle': 48} is not of type 'null'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/spi@ffda5000/resource-manager@0/gpio-controller: failed to match any schema with compatible: ['altr,a10sr-gpio']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/spi@ffda5000/resource-manager@0/reset-controller: failed to match any schema with compatible: ['altr,a10sr-reset']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: sram@ffe00000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: sram@ffe00000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: sram@ffe00000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: sdramedac (altr,sdram-edac-a10): interrupts: [[17, 4], [49, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-sdram-edac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: sysmgr@ffd06000 (altr,sys-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: timer0@ffc02700 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: timer1@ffc02800 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
