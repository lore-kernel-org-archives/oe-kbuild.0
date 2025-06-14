Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F997462
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Jun 2025 08:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749889230; cv=none; b=GYBxa3PP0/cAYTePl42ly1Ro22PtcAlfBLu0ewiffJEGYWbPEZasrZcq6E24oT9GAscwr578qgWDuiZUooBvit64g8Y5Yjjz+2jp1uVohbbUWI1s+IhYYSO+sR2gKzdMhzVcPlBj27aKib81sRdK1gt8NcUZgLmJFjwjDPZvhOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749889230; c=relaxed/simple;
	bh=9Ppf1Jc0l1mKHyGAncdIZ2HVCIyS8UOd6c7mvD3MrU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I/2dawIos2iWEFm5/Hnx+qJ/gJYPd9oQdIIe8XDwj+YTrORbUHBZkFINJuCaNvDmdUQKtoz0SeG8ssbgMr5a1TxgXNoKfeYP7dkAHsl4XL8eU3YK/1qGW2nfd8GuRjauHm2WYovEiiYo8E52Ro/zNF33uMSL0ggmuBtNknrg5Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MvRUwGnQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MvRUwGnQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749889228; x=1781425228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Ppf1Jc0l1mKHyGAncdIZ2HVCIyS8UOd6c7mvD3MrU8=;
  b=MvRUwGnQ/y5TBgr2Vxe5eNHHVjMzcR8f4e2XoQ3HQBMx0G93OGadISYE
   vjW/3NJfGkhGUm8RH1nIfFWfKxJzPp+7FEyXpccoaM/PHSbprGzuh0bVF
   FQ35NNiVlw6hhmHBvQMnz/TCiauZ0nDy3yqEd1ohOumO+QsILBZXH7vUA
   yL4t2Ckpx3E3XLMHtxOGbl+cm1SGMjEWi5Arni0BbI41/9MoYiQLg2l5N
   tBRbu+6d8QT3xn/2zXUnV32S7at2iGMdrvOye6qUeSyIu7XSabDYVdyvA
   5iOyBzObtRJ1x7ZmDWr2aiTryKqem4knUBgGMWs2xZvvZvhouVjeJYP71
   Q==;
X-CSE-ConnectionGUID: kzJFPxAuTJ2nCuPGrEs0DQ==
X-CSE-MsgGUID: OzIZbvy+QAqmLfH4L5gHdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="52021051"
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="52021051"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 01:20:27 -0700
X-CSE-ConnectionGUID: 8WYWCicJQhaGHsGb39Vg2A==
X-CSE-MsgGUID: QZ+4ePX2Szai3P/ZiMrcYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="147910075"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Jun 2025 01:20:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQM7Z-000DNu-0M;
	Sat, 14 Jun 2025 08:20:13 +0000
Date: Sat, 14 Jun 2025 16:19:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 1/1] dt-bindings: arm: Convert Altera SDRAM EDAC .txt
 to YAML
Message-ID: <202506141601.EMTwLjbj-lkp@intel.com>
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
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-052-20250613 (https://download.01.org/0day-ci/archive/20250614/202506141601.EMTwLjbj-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506141601.EMTwLjbj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506141601.EMTwLjbj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: flash@0 (micron,n25q256a): Unevaluated properties are not allowed ('partition@qspi-boot', 'partition@qspi-rootfs' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: flash@0 (micron,n25q256a): 'partition@qspi-boot', 'partition@qspi-rootfs' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: sdramedac (altr,sdram-edac): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/socfpga-sdram-edac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: sysmgr@ffd08000 (altr,sys-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: timer0@ffc08000 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: timer1@ffc09000 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
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
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: sdramedac (altr,sdram-edac-a10): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/socfpga-sdram-edac.yaml#
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
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: sdramedac (altr,sdram-edac-a10): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/socfpga-sdram-edac.yaml#
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
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: sdramedac (altr,sdram-edac-a10): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/socfpga-sdram-edac.yaml#
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
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: sdramedac (altr,sdram-edac-a10): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/socfpga-sdram-edac.yaml#
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
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: sdramedac (altr,sdram-edac-a10): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/socfpga-sdram-edac.yaml#
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
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: i2c@ffc07000 (snps,designware-i2c): Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/snps,designware-i2c.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: sdramedac (altr,sdram-edac): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/socfpga-sdram-edac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: spi@fff00000 (snps,dw-apb-ssi): Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: spi@fff01000 (snps,dw-apb-ssi): Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: sysmgr@ffd08000 (altr,sys-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
--
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: sdramedac (altr,sdram-edac): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/socfpga-sdram-edac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: sysmgr@ffd08000 (altr,sys-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: timer0@ffc08000 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: timer1@ffc09000 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: flash@0 (micron,mt25qu02g): Unevaluated properties are not allowed ('partition@qspi-boot', 'partition@qspi-rootfs' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: flash@0 (micron,mt25qu02g): 'partition@qspi-boot', 'partition@qspi-rootfs' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: sdramedac (altr,sdram-edac): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/socfpga-sdram-edac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: sysmgr@ffd08000 (altr,sys-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: timer0@ffc08000 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: timer1@ffc09000 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: adxl345@53 (adi,adxl345): 'interrupt-names' is a dependency of 'interrupts'
   	from schema $id: http://devicetree.org/schemas/iio/accel/adi,adxl345.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: sdramedac (altr,sdram-edac): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/socfpga-sdram-edac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: sysmgr@ffd08000 (altr,sys-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: timer0@ffc08000 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: timer1@ffc09000 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/ethernet@ff700000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /soc/ethernet@ff702000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: sdramedac (altr,sdram-edac): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/socfpga-sdram-edac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: sysmgr@ffd08000 (altr,sys-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: timer0@ffc08000 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: timer1@ffc09000 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: accelerometer@53 (adi,adxl345): 'interrupt-names' is a dependency of 'interrupts'
   	from schema $id: http://devicetree.org/schemas/iio/accel/adi,adxl345.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: sdramedac (altr,sdram-edac): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/socfpga-sdram-edac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: sysmgr@ffd08000 (altr,sys-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: timer0@ffc08000 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: timer1@ffc09000 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: /soc/ethernet@ff700000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: /soc/ethernet@ff702000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: sdramedac (altr,sdram-edac): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/socfpga-sdram-edac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: sysmgr@ffd08000 (altr,sys-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: timer0@ffc08000 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: timer1@ffc09000 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: /soc/ethernet@ff700000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: /soc/ethernet@ff702000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: sdramedac (altr,sdram-edac): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/socfpga-sdram-edac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: sysmgr@ffd08000 (altr,sys-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: timer0@ffc08000 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: timer1@ffc09000 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: flash@0 (micron,n25q128): compatible: 'oneOf' conditional failed, one must be fixed:
   	['micron,n25q128', 'jedec,spi-nor'] is too long
   	'micron,n25q128' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'micron,n25q128' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: flash@0 (micron,n25q128): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: /soc/spi@ff705000/flash@0: failed to match any schema with compatible: ['micron,n25q128', 'jedec,spi-nor']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: sdramedac (altr,sdram-edac): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/socfpga-sdram-edac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: sysmgr@ffd08000 (altr,sys-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: timer0@ffc08000 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: timer1@ffc09000 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: /soc/ethernet@ff700000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: /soc/ethernet@ff702000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: sdramedac (altr,sdram-edac): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/socfpga-sdram-edac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: sysmgr@ffd08000 (altr,sys-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: timer0@ffc08000 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
