Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC934AEE2
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Feb 2026 07:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770795451; cv=none; b=BeEjEA2yXoJ6XA+H58wMWZIuYLYY/SsJy6uDbbWkIVMuvtdhN+9qFktkhQQzn9P0/hH1h4ncVaKdsTmAlI11UK0ngtsy2VEQrIrCBoeel0R31GaIVHvfZ/MCt9DtRQew6STny+PC1NN5A9+t1nA7bYbA9PFojdSHEa18cQD3c2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770795451; c=relaxed/simple;
	bh=gq3Tx3LZ3Tg4epJp0BvbwyMkKPdvn9ki3Q46FYHlP40=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BHySBdKDorNfeH16Lk8VTmDaIqeLjVu2PEBdCxv8SpPFFOtFhBP4Wh/L7dffCn6mE2ZaHuCD+waafrtQhvW34805gv2EHX2CpqPktm7DjJsycYqAzo6CJgj/QmzG4eJOFHlrwyyV/9uRz2IwGW6j1FfgWZjfLnYCXqg5OtFOWXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fyq5bLEx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fyq5bLEx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770795445; x=1802331445;
  h=date:from:to:cc:subject:message-id;
  bh=gq3Tx3LZ3Tg4epJp0BvbwyMkKPdvn9ki3Q46FYHlP40=;
  b=Fyq5bLExnXir31T3hyjmsBmQxocYniJPmcrz5s6oWkZhEOMl6cevgfWl
   dtboxoBYAIU73v5l9UXYFQU72VCBUYS2VD14W7eKpIvyKGlTOZSFSb6NR
   eRDZqmywALM+PgSLrKsmJ0W8ur+LiB07SekpIkMHGm00QQbk197exQjvN
   IoNPspTm7Ou0DPN/cz/4HAJqhO7i1kLDlWGmKLi5Ue+G0duioy5izCbNG
   v2C1SRnBnocWx2d8cHGRuM3NTOoWCQd3gk89aOjmILNLEzvnKEsapCJyU
   xD/mGVyKHS0Z5rFCAxC3qRqcISczWK61W5wewWQURbYz7w5JH7Q4tVq3C
   A==;
X-CSE-ConnectionGUID: zTbW+02XSTibbNkQWhHOVQ==
X-CSE-MsgGUID: O9glCC/XQTGUPiA+AOFOaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71143075"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71143075"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 23:37:25 -0800
X-CSE-ConnectionGUID: e3runwlLQDOXJ0vZ2DZCcA==
X-CSE-MsgGUID: sCJrrE/IRh2LWmSN+4+iSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211771322"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 10 Feb 2026 23:37:24 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq4mn-0000000012P-2lVl;
	Wed, 11 Feb 2026 07:37:21 +0000
Date: Wed, 11 Feb 2026 08:37:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/socrates.dtb: nor_flash@0,0
 (amd,s29gl256n): Unevaluated properties are not allowed ('partition@0',
 'partition@1e0000', 'partition@200000', 'partition@3f80000',
 'partition@3fc0000', 'partition@400000' were unexpected)
Message-ID: <202602110826.dBhGdXex-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: 9ea13d9e40cfb6675a299147bb89d6ca9e7aad9a dt-bindings: mtd: physmap: Ensure all properties are defined
date:   11 months ago
:::::: branch date: 8 months ago
:::::: commit date: 11 months ago
config: powerpc-randconfig-2051-20260206 (https://download.01.org/0day-ci/archive/20260211/202602110826.dBhGdXex-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.4.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110826.dBhGdXex-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602110826.dBhGdXex-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/socrates.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/socrates.dtb: /soc8544@e0000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8548-guts']
   arch/powerpc/boot/dts/socrates.dtb: /soc8544@e0000000/pic@40000: failed to match any schema with compatible: ['chrp,open-pic']
   arch/powerpc/boot/dts/socrates.dtb: /localbus: failed to match any schema with compatible: ['fsl,mpc8544-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/socrates.dtb: /localbus: failed to match any schema with compatible: ['fsl,mpc8544-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/socrates.dtb: nor_flash@0,0 (amd,s29gl256n): $nodename:0: 'nor_flash@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/socrates.dtb: nor_flash@0,0 (amd,s29gl256n): Unevaluated properties are not allowed ('partition@0', 'partition@1e0000', 'partition@200000', 'partition@3f80000', 'partition@3fc0000', 'partition@400000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/socrates.dtb: display@2,0 (fujitsu,lime): 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml
   arch/powerpc/boot/dts/socrates.dtb: display@2,0 (fujitsu,lime): 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml
   arch/powerpc/boot/dts/socrates.dtb: /localbus/fpga-pic@3,10: failed to match any schema with compatible: ['abb,socrates-fpga-pic']
   arch/powerpc/boot/dts/socrates.dtb: /localbus/spi@3,60: failed to match any schema with compatible: ['abb,socrates-spi']
   arch/powerpc/boot/dts/socrates.dtb: /localbus/nand@3,70: failed to match any schema with compatible: ['abb,socrates-nand']
   arch/powerpc/boot/dts/socrates.dtb: /localbus/can@3,100: failed to match any schema with compatible: ['philips,sja1000']
   arch/powerpc/boot/dts/socrates.dtb: /pci@e0008000: failed to match any schema with compatible: ['fsl,mpc8540-pci']
--
   arch/powerpc/boot/dts/taishan.dtb: /plb/sram: failed to match any schema with compatible: ['ibm,sram-440gp']
   arch/powerpc/boot/dts/taishan.dtb: /plb/dma: failed to match any schema with compatible: ['ibm,dma-440gp']
   arch/powerpc/boot/dts/taishan.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-440gx', 'ibm,mcmal2']
   arch/powerpc/boot/dts/taishan.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-440gx', 'ibm,mcmal2']
   arch/powerpc/boot/dts/taishan.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-440gx', 'ibm,opb']
   arch/powerpc/boot/dts/taishan.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-440gx', 'ibm,opb']
   arch/powerpc/boot/dts/taishan.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-440gx', 'ibm,ebc']
   arch/powerpc/boot/dts/taishan.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-440gx', 'ibm,ebc']
   arch/powerpc/boot/dts/taishan.dtb: nor_flash@0,0 (cfi-flash): $nodename:0: 'nor_flash@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/taishan.dtb: nor_flash@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@180000', 'partition@380000', 'partition@3f40000', 'partition@3fc0000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/taishan.dtb: serial@40000200 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/taishan.dtb: serial@40000300 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/taishan.dtb: /plb/opb/i2c@40000400: failed to match any schema with compatible: ['ibm,iic-440gp', 'ibm,iic']
   arch/powerpc/boot/dts/taishan.dtb: /plb/opb/i2c@40000400: failed to match any schema with compatible: ['ibm,iic-440gp', 'ibm,iic']
   arch/powerpc/boot/dts/taishan.dtb: /plb/opb/i2c@40000500: failed to match any schema with compatible: ['ibm,iic-440gp', 'ibm,iic']
   arch/powerpc/boot/dts/taishan.dtb: /plb/opb/i2c@40000500: failed to match any schema with compatible: ['ibm,iic-440gp', 'ibm,iic']
   arch/powerpc/boot/dts/taishan.dtb: /plb/opb/gpio@40000700: failed to match any schema with compatible: ['ibm,gpio-440gp']
--
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/tqm8540.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/tqm8540.dtb: /soc@e0000000/pic@40000: failed to match any schema with compatible: ['chrp,open-pic']
   arch/powerpc/boot/dts/tqm8540.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8540-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/tqm8540.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8540-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/tqm8540.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/tqm8540.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@180000', 'partition@1f40000', 'partition@1f80000', 'partition@1fc0000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/tqm8540.dtb: /pci@e0008000: failed to match any schema with compatible: ['fsl,mpc8540-pcix', 'fsl,mpc8540-pci']
   arch/powerpc/boot/dts/tqm8540.dtb: /pci@e0008000: failed to match any schema with compatible: ['fsl,mpc8540-pcix', 'fsl,mpc8540-pci']
--
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/turris1x.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/turris1x.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/turris1x.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/turris1x.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/turris1x.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p2020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/turris1x.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p2020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/turris1x.dtb: cpld@3,0 (cznic,turris1x-cpld): $nodename:0: 'cpld@3,0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/turris1x.dtb: /localbus@ffe05000/cpld@3,0: failed to match any schema with compatible: ['cznic,turris1x-cpld', 'fsl,p1021rdb-pc-cpld', 'simple-bus', 'syscon']
   arch/powerpc/boot/dts/turris1x.dtb: /localbus@ffe05000/cpld@3,0: failed to match any schema with compatible: ['cznic,turris1x-cpld', 'fsl,p1021rdb-pc-cpld', 'simple-bus', 'syscon']
   arch/powerpc/boot/dts/turris1x.dtb: watchdog@2 (maxim,max6370): Unevaluated properties are not allowed ('gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/maxim,max63xx.yaml
--
   arch/powerpc/boot/dts/warp.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-440ep', 'ibm,opb-440gp', 'ibm,opb']
   arch/powerpc/boot/dts/warp.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-440ep', 'ibm,opb-440gp', 'ibm,opb']
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-440ep', 'ibm,ebc-440gp', 'ibm,ebc']
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-440ep', 'ibm,ebc-440gp', 'ibm,ebc']
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-440ep', 'ibm,ebc-440gp', 'ibm,ebc']
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/ebc/fpga@2,0: failed to match any schema with compatible: ['pika,fpga']
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/ebc/fpga@2,2000: failed to match any schema with compatible: ['pika,fpga-sgl']
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/ebc/fpga@2,4000: failed to match any schema with compatible: ['pika,fpga-sd']
   arch/powerpc/boot/dts/warp.dtb: nor@0,0 (amd,s29gl032a): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/warp.dtb: nor@0,0 (amd,s29gl032a): Unevaluated properties are not allowed ('partition@0', 'partition@300000', 'partition@340000', 'partition@380000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/ebc/ndfc@1,0: failed to match any schema with compatible: ['ibm,ndfc']
   arch/powerpc/boot/dts/warp.dtb: serial@ef600300 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/i2c@ef600700: failed to match any schema with compatible: ['ibm,iic-440ep', 'ibm,iic-440gp', 'ibm,iic']
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/i2c@ef600700: failed to match any schema with compatible: ['ibm,iic-440ep', 'ibm,iic-440gp', 'ibm,iic']
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/i2c@ef600700: failed to match any schema with compatible: ['ibm,iic-440ep', 'ibm,iic-440gp', 'ibm,iic']
   arch/powerpc/boot/dts/warp.dtb: at24@52 (atmel,24c04): $nodename:0: 'at24@52' does not match '^eeprom@[0-9a-f]{1,2}$'
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/gpio@ef600b00: failed to match any schema with compatible: ['ibm,ppc4xx-gpio']
--
   arch/powerpc/boot/dts/xcalibur1501.dts:154.11-160.5: Warning (simple_bus_reg): /localbus@ef005000/usb@4,0: simple-bus unit address format error, expected "400000000"
   arch/powerpc/boot/dts/xcalibur1501.dts:601.13-624.5: Warning (simple_bus_reg): /soc8572@ef000000/gpio-leds: missing or empty reg/ranges property
   arch/powerpc/boot/dts/xcalibur1501.dtb: /: failed to match any schema with compatible: ['xes,xcalibur1501', 'xes,MPC8572']
   arch/powerpc/boot/dts/xcalibur1501.dtb: /: failed to match any schema with compatible: ['xes,xcalibur1501', 'xes,MPC8572']
   arch/powerpc/boot/dts/xcalibur1501.dtb: / (xes,xcalibur1501): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/xcalibur1501.dtb: /localbus@ef005000: failed to match any schema with compatible: ['fsl,mpc8572-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/xcalibur1501.dtb: /localbus@ef005000: failed to match any schema with compatible: ['fsl,mpc8572-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/xcalibur1501.dtb: nor-boot@0,0 (amd,s29gl01gp): $nodename:0: 'nor-boot@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/xcalibur1501.dtb: nor-boot@0,0 (amd,s29gl01gp): Unevaluated properties are not allowed ('partition@0', 'partition@6f00000', 'partition@7f00000', 'partition@7f40000', 'partition@7f80000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/xcalibur1501.dtb: nor-alternate@1,0 (amd,s29gl01gp): $nodename:0: 'nor-alternate@1,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/xcalibur1501.dtb: nor-alternate@1,0 (amd,s29gl01gp): Unevaluated properties are not allowed ('partition@0', 'partition@6f00000', 'partition@7f00000', 'partition@7f40000', 'partition@7f80000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/xcalibur1501.dtb: /localbus@ef005000/nand@2,0: failed to match any schema with compatible: ['fsl,mpc8572-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/xcalibur1501.dtb: /localbus@ef005000/nand@2,0: failed to match any schema with compatible: ['fsl,mpc8572-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/xcalibur1501.dtb: soc8572@ef000000 (fsl,mpc8572-immr): gpio-leds: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/xcalibur1501.dtb: soc8572@ef000000 (fsl,mpc8572-immr): $nodename:0: 'soc8572@ef000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/xcalibur1501.dtb: /soc8572@ef000000: failed to match any schema with compatible: ['fsl,mpc8572-immr', 'simple-bus']
   arch/powerpc/boot/dts/xcalibur1501.dtb: /soc8572@ef000000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/xcalibur1501.dtb: /soc8572@ef000000/ecm@1000: failed to match any schema with compatible: ['fsl,mpc8572-ecm', 'fsl,ecm']
--
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/xpedite5200.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/xpedite5200.dtb: /soc@ef000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8548-guts']
   arch/powerpc/boot/dts/xpedite5200.dtb: /soc@ef000000/pic@40000: failed to match any schema with compatible: ['chrp,open-pic']
   arch/powerpc/boot/dts/xpedite5200.dtb: /localbus@ef005000: failed to match any schema with compatible: ['fsl,mpc8548-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/xpedite5200.dtb: /localbus@ef005000: failed to match any schema with compatible: ['fsl,mpc8548-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/xpedite5200.dtb: nor-boot@0,0 (cfi-flash): $nodename:0: 'nor-boot@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/xpedite5200.dtb: nor-boot@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@180000', 'partition@300000', 'partition@3f80000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/xpedite5200.dtb: nor-alternate@1,0 (cfi-flash): $nodename:0: 'nor-alternate@1,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/xpedite5200.dtb: nor-alternate@1,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@3f80000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/xpedite5200.dtb: /localbus@ef005000/nand@2,0: failed to match any schema with compatible: ['xes,address-ctl-nand']
   arch/powerpc/boot/dts/xpedite5200.dtb: /pci@ef008000: failed to match any schema with compatible: ['fsl,mpc8540-pcix', 'fsl,mpc8540-pci']
   arch/powerpc/boot/dts/xpedite5200.dtb: /pci@ef008000: failed to match any schema with compatible: ['fsl,mpc8540-pcix', 'fsl,mpc8540-pci']
--
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: /soc@ef000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8548-guts']
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: /soc@ef000000/pic@40000: failed to match any schema with compatible: ['chrp,open-pic']
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: /localbus@ef005000: failed to match any schema with compatible: ['fsl,mpc8548-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: /localbus@ef005000: failed to match any schema with compatible: ['fsl,mpc8548-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: nor-boot@0,0 (cfi-flash): $nodename:0: 'nor-boot@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/xpedite5200_xmon.dtb: nor-boot@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@180000', 'partition@300000', 'partition@3f80000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: nor-alternate@1,0 (cfi-flash): $nodename:0: 'nor-alternate@1,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/xpedite5200_xmon.dtb: nor-alternate@1,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@3f80000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: /localbus@ef005000/nand@2,0: failed to match any schema with compatible: ['xes,address-ctl-nand']
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: /pci@ef008000: failed to match any schema with compatible: ['fsl,mpc8540-pcix', 'fsl,mpc8540-pci']
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: /pci@ef008000: failed to match any schema with compatible: ['fsl,mpc8540-pcix', 'fsl,mpc8540-pci']
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: /pcie@ef00a000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
--
   arch/powerpc/boot/dts/xpedite5301.dts:135.12-152.5: Warning (simple_bus_reg): /localbus@ef005000/nand@2,0: simple-bus unit address format error, expected "200000000"
   arch/powerpc/boot/dts/xpedite5301.dts:511.13-534.5: Warning (simple_bus_reg): /soc8572@ef000000/gpio-leds: missing or empty reg/ranges property
   arch/powerpc/boot/dts/xpedite5301.dtb: /: failed to match any schema with compatible: ['xes,xpedite5301', 'xes,MPC8572']
   arch/powerpc/boot/dts/xpedite5301.dtb: /: failed to match any schema with compatible: ['xes,xpedite5301', 'xes,MPC8572']
   arch/powerpc/boot/dts/xpedite5301.dtb: / (xes,xpedite5301): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/xpedite5301.dtb: /localbus@ef005000: failed to match any schema with compatible: ['fsl,mpc8572-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/xpedite5301.dtb: /localbus@ef005000: failed to match any schema with compatible: ['fsl,mpc8572-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/xpedite5301.dtb: nor-boot@0,0 (amd,s29gl01gp): $nodename:0: 'nor-boot@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/xpedite5301.dtb: nor-boot@0,0 (amd,s29gl01gp): Unevaluated properties are not allowed ('partition@0', 'partition@6f00000', 'partition@7f00000', 'partition@7f40000', 'partition@7f80000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/xpedite5301.dtb: nor-alternate@1,0 (amd,s29gl01gp): $nodename:0: 'nor-alternate@1,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/xpedite5301.dtb: nor-alternate@1,0 (amd,s29gl01gp): Unevaluated properties are not allowed ('partition@0', 'partition@6f00000', 'partition@7f00000', 'partition@7f40000', 'partition@7f80000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/xpedite5301.dtb: /localbus@ef005000/nand@2,0: failed to match any schema with compatible: ['fsl,mpc8572-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/xpedite5301.dtb: /localbus@ef005000/nand@2,0: failed to match any schema with compatible: ['fsl,mpc8572-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/xpedite5301.dtb: soc8572@ef000000 (fsl,mpc8572-immr): gpio-leds: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/xpedite5301.dtb: soc8572@ef000000 (fsl,mpc8572-immr): $nodename:0: 'soc8572@ef000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/xpedite5301.dtb: /soc8572@ef000000: failed to match any schema with compatible: ['fsl,mpc8572-immr', 'simple-bus']
   arch/powerpc/boot/dts/xpedite5301.dtb: /soc8572@ef000000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/xpedite5301.dtb: /soc8572@ef000000/ecm@1000: failed to match any schema with compatible: ['fsl,mpc8572-ecm', 'fsl,ecm']
--
   arch/powerpc/boot/dts/xpedite5330.dts:28.11-40.4: Warning (avoid_unnecessary_addr_size): /pmcslots: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/powerpc/boot/dts/xpedite5330.dts:42.11-53.4: Warning (avoid_unnecessary_addr_size): /xmcslots: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/powerpc/boot/dts/xpedite5330.dtb: /: failed to match any schema with compatible: ['xes,xpedite5330', 'xes,MPC8572']
   arch/powerpc/boot/dts/xpedite5330.dtb: /: failed to match any schema with compatible: ['xes,xpedite5330', 'xes,MPC8572']
   arch/powerpc/boot/dts/xpedite5330.dtb: / (xes,xpedite5330): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/xpedite5330.dtb: /localbus@ef005000: failed to match any schema with compatible: ['fsl,mpc8572-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/xpedite5330.dtb: /localbus@ef005000: failed to match any schema with compatible: ['fsl,mpc8572-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/xpedite5330.dtb: nor-boot@0,0 (amd,s29gl01gp): $nodename:0: 'nor-boot@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/xpedite5330.dtb: nor-boot@0,0 (amd,s29gl01gp): Unevaluated properties are not allowed ('partition@0', 'partition@6f00000', 'partition@7f00000', 'partition@7f40000', 'partition@7f80000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/xpedite5330.dtb: nor-alternate@1,0 (amd,s29gl01gp): $nodename:0: 'nor-alternate@1,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/xpedite5330.dtb: nor-alternate@1,0 (amd,s29gl01gp): Unevaluated properties are not allowed ('partition@0', 'partition@6f00000', 'partition@7f00000', 'partition@7f40000', 'partition@7f80000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/xpedite5330.dtb: /localbus@ef005000/nand@2,0: failed to match any schema with compatible: ['fsl,mpc8572-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/xpedite5330.dtb: /localbus@ef005000/nand@2,0: failed to match any schema with compatible: ['fsl,mpc8572-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/xpedite5330.dtb: soc8572@ef000000 (fsl,mpc8572-immr): gpio-leds: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/xpedite5330.dtb: soc8572@ef000000 (fsl,mpc8572-immr): $nodename:0: 'soc8572@ef000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/xpedite5330.dtb: /soc8572@ef000000: failed to match any schema with compatible: ['fsl,mpc8572-immr', 'simple-bus']
   arch/powerpc/boot/dts/xpedite5330.dtb: /soc8572@ef000000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/xpedite5330.dtb: /soc8572@ef000000/ecm@1000: failed to match any schema with compatible: ['fsl,mpc8572-ecm', 'fsl,ecm']
--
   arch/powerpc/boot/dts/xpedite5370.dts:133.12-150.5: Warning (simple_bus_reg): /localbus@ef005000/nand@2,0: simple-bus unit address format error, expected "200000000"
   arch/powerpc/boot/dts/xpedite5370.dts:509.13-532.5: Warning (simple_bus_reg): /soc8572@ef000000/gpio-leds: missing or empty reg/ranges property
   arch/powerpc/boot/dts/xpedite5370.dtb: /: failed to match any schema with compatible: ['xes,xpedite5370', 'xes,MPC8572']
   arch/powerpc/boot/dts/xpedite5370.dtb: /: failed to match any schema with compatible: ['xes,xpedite5370', 'xes,MPC8572']
   arch/powerpc/boot/dts/xpedite5370.dtb: / (xes,xpedite5370): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/xpedite5370.dtb: /localbus@ef005000: failed to match any schema with compatible: ['fsl,mpc8572-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/xpedite5370.dtb: /localbus@ef005000: failed to match any schema with compatible: ['fsl,mpc8572-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/xpedite5370.dtb: nor-boot@0,0 (amd,s29gl01gp): $nodename:0: 'nor-boot@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/xpedite5370.dtb: nor-boot@0,0 (amd,s29gl01gp): Unevaluated properties are not allowed ('partition@0', 'partition@6f00000', 'partition@7f00000', 'partition@7f40000', 'partition@7f80000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/xpedite5370.dtb: nor-alternate@1,0 (amd,s29gl01gp): $nodename:0: 'nor-alternate@1,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/xpedite5370.dtb: nor-alternate@1,0 (amd,s29gl01gp): Unevaluated properties are not allowed ('partition@0', 'partition@6f00000', 'partition@7f00000', 'partition@7f40000', 'partition@7f80000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/xpedite5370.dtb: /localbus@ef005000/nand@2,0: failed to match any schema with compatible: ['fsl,mpc8572-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/xpedite5370.dtb: /localbus@ef005000/nand@2,0: failed to match any schema with compatible: ['fsl,mpc8572-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/xpedite5370.dtb: soc8572@ef000000 (fsl,mpc8572-immr): gpio-leds: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/xpedite5370.dtb: soc8572@ef000000 (fsl,mpc8572-immr): $nodename:0: 'soc8572@ef000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/xpedite5370.dtb: /soc8572@ef000000: failed to match any schema with compatible: ['fsl,mpc8572-immr', 'simple-bus']
   arch/powerpc/boot/dts/xpedite5370.dtb: /soc8572@ef000000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/xpedite5370.dtb: /soc8572@ef000000/ecm@1000: failed to match any schema with compatible: ['fsl,mpc8572-ecm', 'fsl,ecm']
--
   arch/powerpc/boot/dts/yosemite.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-440ep', 'ibm,mcmal-440gp', 'ibm,mcmal']
   arch/powerpc/boot/dts/yosemite.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-440ep', 'ibm,mcmal-440gp', 'ibm,mcmal']
   arch/powerpc/boot/dts/yosemite.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-440ep', 'ibm,opb-440gp', 'ibm,opb']
   arch/powerpc/boot/dts/yosemite.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-440ep', 'ibm,opb-440gp', 'ibm,opb']
   arch/powerpc/boot/dts/yosemite.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-440ep', 'ibm,opb-440gp', 'ibm,opb']
   arch/powerpc/boot/dts/yosemite.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-440ep', 'ibm,ebc-440gp', 'ibm,ebc']
   arch/powerpc/boot/dts/yosemite.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-440ep', 'ibm,ebc-440gp', 'ibm,ebc']
   arch/powerpc/boot/dts/yosemite.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-440ep', 'ibm,ebc-440gp', 'ibm,ebc']
   arch/powerpc/boot/dts/yosemite.dtb: nor_flash@0,0 (amd,s29gl256n): $nodename:0: 'nor_flash@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/yosemite.dtb: nor_flash@0,0 (amd,s29gl256n): Unevaluated properties are not allowed ('partition@0', 'partition@1600000', 'partition@1a00000', 'partition@1e0000', 'partition@200000', 'partition@3f40000', 'partition@3f80000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/yosemite.dtb: serial@ef600300 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/yosemite.dtb: serial@ef600400 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/yosemite.dtb: /plb/opb/i2c@ef600700: failed to match any schema with compatible: ['ibm,iic-440ep', 'ibm,iic-440gp', 'ibm,iic']
   arch/powerpc/boot/dts/yosemite.dtb: /plb/opb/i2c@ef600700: failed to match any schema with compatible: ['ibm,iic-440ep', 'ibm,iic-440gp', 'ibm,iic']
   arch/powerpc/boot/dts/yosemite.dtb: /plb/opb/i2c@ef600700: failed to match any schema with compatible: ['ibm,iic-440ep', 'ibm,iic-440gp', 'ibm,iic']
   arch/powerpc/boot/dts/yosemite.dtb: /plb/opb/i2c@ef600800: failed to match any schema with compatible: ['ibm,iic-440ep', 'ibm,iic-440gp', 'ibm,iic']
   arch/powerpc/boot/dts/yosemite.dtb: /plb/opb/i2c@ef600800: failed to match any schema with compatible: ['ibm,iic-440ep', 'ibm,iic-440gp', 'ibm,iic']
--
   	arch/powerpc/boot/dts/fsl/c293pcie.dtb: memory-controller@fffe1e000 (fsl,ifc): cpld@2,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,c293pcie-cpld'] is too short
   		'fsl,c293pcie-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,c293pcie-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,c293pcie-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: memory-controller@fffe1e000 (fsl,ifc): cpld@2,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/c293pcie.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@100000', 'partition@3e00000', 'partition@3f00000', 'partition@900000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /memory-controller@fffe1e000/cpld@2,0: failed to match any schema with compatible: ['fsl,c293pcie-cpld']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
--
   arch/powerpc/boot/dts/fsl/ge_imp3a.dts:120.12-123.5: Warning (simple_bus_reg): /localbus@fef05000/nand@7,0: simple-bus unit address format error, expected "700000000"
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /: failed to match any schema with compatible: ['ge,imp3a']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: / (ge,imp3a): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: / (ge,imp3a): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000: failed to match any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000: failed to match any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: nor@1,0 (ge,imp3a-paged-flash): $nodename:0: 'nor@1,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: nor@1,0 (ge,imp3a-paged-flash): Unevaluated properties are not allowed ('partition@0', 'partition@7800000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/nvram@3,0: failed to match any schema with compatible: ['simtek,stk14ca8']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/fpga@4,0: failed to match any schema with compatible: ['ge,imp3a-fpga-regs']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/pic@4,20: failed to match any schema with compatible: ['ge,imp3a-fpga-pic', 'gef,fpga-pic-1.00']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/pic@4,20: failed to match any schema with compatible: ['ge,imp3a-fpga-pic', 'gef,fpga-pic-1.00']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/gpio@4,400: failed to match any schema with compatible: ['ge,imp3a-gpio']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/wdt@4,800: failed to match any schema with compatible: ['ge,imp3a-fpga-wdt', 'gef,fpga-wdt-1.00', 'gef,fpga-wdt']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/wdt@4,800: failed to match any schema with compatible: ['ge,imp3a-fpga-wdt', 'gef,fpga-wdt-1.00', 'gef,fpga-wdt']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/wdt@4,800: failed to match any schema with compatible: ['ge,imp3a-fpga-wdt', 'gef,fpga-wdt-1.00', 'gef,fpga-wdt']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/nand@6,0: failed to match any schema with compatible: ['fsl,elbc-fcm-nand']
--
   arch/powerpc/boot/dts/fsl/mpc8536si-post.dtsi:174.23-176.4: Warning (simple_bus_reg): /soc@ffe00000/gpio-controller@f000: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtsi:200.24-203.5: Warning (unique_unit_address_if_enabled): /soc@ffe00000/mdio@24520/ethernet-phy@0: duplicate unit-address (also used in node /soc@ffe00000/mdio@24520/sgmii-phy@0)
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtsi:204.24-207.5: Warning (unique_unit_address_if_enabled): /soc@ffe00000/mdio@24520/ethernet-phy@1: duplicate unit-address (also used in node /soc@ffe00000/mdio@24520/sgmii-phy@1)
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /: failed to match any schema with compatible: ['fsl,mpc8536ds']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: / (fsl,mpc8536ds): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,mpc8536-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,mpc8536-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@3000000', 'partition@3e00000', 'partition@4000000', 'partition@4400000', 'partition@7f00000', 'partition@7f80000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /localbus@ffe05000/nand@2,0: failed to match any schema with compatible: ['fsl,mpc8536-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /localbus@ffe05000/nand@2,0: failed to match any schema with compatible: ['fsl,mpc8536-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /localbus@ffe05000/board-control@3,0: failed to match any schema with compatible: ['fsl,mpc8536ds-fpga-pixis']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: soc@ffe00000 (fsl,mpc8536-immr): gpio-controller@f000: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,mpc8536-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
--
   arch/powerpc/boot/dts/fsl/mpc8536si-post.dtsi:174.23-176.4: Warning (simple_bus_reg): /soc@fffe00000/gpio-controller@f000: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtsi:200.24-203.5: Warning (unique_unit_address_if_enabled): /soc@fffe00000/mdio@24520/ethernet-phy@0: duplicate unit-address (also used in node /soc@fffe00000/mdio@24520/sgmii-phy@0)
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtsi:204.24-207.5: Warning (unique_unit_address_if_enabled): /soc@fffe00000/mdio@24520/ethernet-phy@1: duplicate unit-address (also used in node /soc@fffe00000/mdio@24520/sgmii-phy@1)
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /: failed to match any schema with compatible: ['fsl,mpc8536ds']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: / (fsl,mpc8536ds): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /localbus@fffe05000: failed to match any schema with compatible: ['fsl,mpc8536-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /localbus@fffe05000: failed to match any schema with compatible: ['fsl,mpc8536-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@3000000', 'partition@3e00000', 'partition@4000000', 'partition@4400000', 'partition@7f00000', 'partition@7f80000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /localbus@fffe05000/nand@2,0: failed to match any schema with compatible: ['fsl,mpc8536-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /localbus@fffe05000/nand@2,0: failed to match any schema with compatible: ['fsl,mpc8536-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /localbus@fffe05000/board-control@3,0: failed to match any schema with compatible: ['fsl,mpc8536ds-fpga-pixis']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: soc@fffe00000 (fsl,mpc8536-immr): gpio-controller@f000: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,mpc8536-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
--
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtsi:154.11-204.6: Warning (interrupt_provider): /pcie@e000b000/pcie@0/uli1575@0/isa@1e: '#interrupt-cells' found, but node is not an interrupt provider
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /: failed to match any schema with compatible: ['MPC8544DS', 'MPC85xxDS']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /: failed to match any schema with compatible: ['MPC8544DS', 'MPC85xxDS']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: / (MPC8544DS): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8544-lbc', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8544-lbc', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@20000', 'partition@200000', 'partition@400000', 'partition@780000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: soc8544@e0000000 (fsl,mpc8544-immr): $nodename:0: 'soc8544@e0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000: failed to match any schema with compatible: ['fsl,mpc8544-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/ecm@1000: failed to match any schema with compatible: ['fsl,mpc8544-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/ecm@1000: failed to match any schema with compatible: ['fsl,mpc8544-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
--
   arch/powerpc/boot/dts/fsl/mpc8569mds.dts:96.11-99.5: Warning (simple_bus_reg): /localbus@e0005000/pib@5,0: simple-bus unit address format error, expected "500000000"
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /: failed to match any schema with compatible: ['fsl,MPC8569EMDS']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: / (fsl,MPC8569EMDS): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: / (fsl,MPC8569EMDS): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8569-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8569-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@1c00000', 'partition@1ee0000', 'partition@1f00000', 'partition@1f80000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /localbus@e0005000/bcsr@1,0: failed to match any schema with compatible: ['fsl,mpc8569mds-bcsr']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /localbus@e0005000/bcsr@1,0/gpio-controller@11: failed to match any schema with compatible: ['fsl,mpc8569mds-bcsr-gpio']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /localbus@e0005000/nand@3,0: failed to match any schema with compatible: ['fsl,mpc8569-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /localbus@e0005000/nand@3,0: failed to match any schema with compatible: ['fsl,mpc8569-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /localbus@e0005000/pib@4,0: failed to match any schema with compatible: ['fsl,mpc8569mds-pib']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /localbus@e0005000/pib@5,0: failed to match any schema with compatible: ['fsl,mpc8569mds-pib']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000: failed to match any schema with compatible: ['fsl,mpc8569-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: i2c-sleep-nexus (simple-bus): $nodename:0: 'i2c-sleep-nexus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /: failed to match any schema with compatible: ['fsl,MPC8572DS']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: / (fsl,MPC8572DS): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: / (fsl,MPC8572DS): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,mpc8572-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,mpc8572-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@3000000', 'partition@3e00000', 'partition@4000000', 'partition@4400000', 'partition@7f00000', 'partition@7f60000', 'partition@7f80000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /localbus@ffe05000/nand@2,0: failed to match any schema with compatible: ['fsl,mpc8572-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /localbus@ffe05000/nand@2,0: failed to match any schema with compatible: ['fsl,mpc8572-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /localbus@ffe05000/nand@4,0: failed to match any schema with compatible: ['fsl,mpc8572-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /localbus@ffe05000/nand@4,0: failed to match any schema with compatible: ['fsl,mpc8572-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /localbus@ffe05000/nand@5,0: failed to match any schema with compatible: ['fsl,mpc8572-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /localbus@ffe05000/nand@5,0: failed to match any schema with compatible: ['fsl,mpc8572-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /localbus@ffe05000/nand@6,0: failed to match any schema with compatible: ['fsl,mpc8572-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /localbus@ffe05000/nand@6,0: failed to match any schema with compatible: ['fsl,mpc8572-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: soc8572@ffe00000 (fsl,mpc8572-immr): gpio-controller@f000: 'anyOf' conditional failed, one must be fixed:
--
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /: failed to match any schema with compatible: ['fsl,MPC8572DS']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: / (fsl,MPC8572DS): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: / (fsl,MPC8572DS): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /localbus@fffe05000: failed to match any schema with compatible: ['fsl,mpc8572-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /localbus@fffe05000: failed to match any schema with compatible: ['fsl,mpc8572-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@3000000', 'partition@3e00000', 'partition@4000000', 'partition@4400000', 'partition@7f00000', 'partition@7f60000', 'partition@7f80000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /localbus@fffe05000/nand@2,0: failed to match any schema with compatible: ['fsl,mpc8572-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /localbus@fffe05000/nand@2,0: failed to match any schema with compatible: ['fsl,mpc8572-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /localbus@fffe05000/nand@4,0: failed to match any schema with compatible: ['fsl,mpc8572-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /localbus@fffe05000/nand@4,0: failed to match any schema with compatible: ['fsl,mpc8572-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /localbus@fffe05000/nand@5,0: failed to match any schema with compatible: ['fsl,mpc8572-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /localbus@fffe05000/nand@5,0: failed to match any schema with compatible: ['fsl,mpc8572-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /localbus@fffe05000/nand@6,0: failed to match any schema with compatible: ['fsl,mpc8572-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /localbus@fffe05000/nand@6,0: failed to match any schema with compatible: ['fsl,mpc8572-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: soc8572@fffe00000 (fsl,mpc8572-immr): gpio-controller@f000: 'anyOf' conditional failed, one must be fixed:
--
   	arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: memory-controller@ffe1e000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,p1010rdb-cpld'] is too short
   		'fsl,p1010rdb-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,p1010rdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,p1010rdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: memory-controller@ffe1e000 (fsl,ifc): cpld@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bank-width', 'compatible', 'device-width', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@1f00000', 'partition@40000', 'partition@80000', 'partition@800000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /memory-controller@ffe1e000/cpld@3,0: failed to match any schema with compatible: ['fsl,p1010rdb-cpld']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1010-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   	arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: memory-controller@fffe1e000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,p1010rdb-cpld'] is too short
   		'fsl,p1010rdb-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,p1010rdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,p1010rdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: memory-controller@fffe1e000 (fsl,ifc): cpld@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bank-width', 'compatible', 'device-width', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@1f00000', 'partition@40000', 'partition@80000', 'partition@800000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /memory-controller@fffe1e000/cpld@3,0: failed to match any schema with compatible: ['fsl,p1010rdb-cpld']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1010-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   	arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: memory-controller@ffe1e000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,p1010rdb-cpld'] is too short
   		'fsl,p1010rdb-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,p1010rdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,p1010rdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: memory-controller@ffe1e000 (fsl,ifc): cpld@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bank-width', 'compatible', 'device-width', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@1f00000', 'partition@40000', 'partition@80000', 'partition@800000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /memory-controller@ffe1e000/cpld@3,0: failed to match any schema with compatible: ['fsl,p1010rdb-cpld']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1010-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   	arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: memory-controller@fffe1e000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,p1010rdb-cpld'] is too short
   		'fsl,p1010rdb-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,p1010rdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,p1010rdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: memory-controller@fffe1e000 (fsl,ifc): cpld@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bank-width', 'compatible', 'device-width', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@1f00000', 'partition@40000', 'partition@80000', 'partition@800000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /memory-controller@fffe1e000/cpld@3,0: failed to match any schema with compatible: ['fsl,p1010rdb-cpld']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1010-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /: failed to match any schema with compatible: ['fsl,P1020MBG-PC']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: / (fsl,P1020MBG-PC): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: / (fsl,P1020MBG-PC): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@20000', 'partition@3e00000', 'partition@3f00000', 'partition@400000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /localbus@ffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /: failed to match any schema with compatible: ['fsl,P1020MBG-PC']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: / (fsl,P1020MBG-PC): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: / (fsl,P1020MBG-PC): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /localbus@fffe05000: failed to match any schema with compatible: ['fsl,p1020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /localbus@fffe05000: failed to match any schema with compatible: ['fsl,p1020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@20000', 'partition@3e00000', 'partition@3f00000', 'partition@400000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /localbus@fffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /: failed to match any schema with compatible: ['fsl,P1020RDB-PC']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: / (fsl,P1020RDB-PC): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: / (fsl,P1020RDB-PC): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@40000', 'partition@400000', 'partition@80000', 'partition@f00000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /localbus@ffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /localbus@ffe05000/cpld@3,0: failed to match any schema with compatible: ['cpld']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /: failed to match any schema with compatible: ['fsl,P1020RDB-PC']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: / (fsl,P1020RDB-PC): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: / (fsl,P1020RDB-PC): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /localbus@fffe05000: failed to match any schema with compatible: ['fsl,p1020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /localbus@fffe05000: failed to match any schema with compatible: ['fsl,p1020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@40000', 'partition@400000', 'partition@80000', 'partition@f00000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /localbus@fffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /localbus@fffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /localbus@fffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /localbus@fffe05000/cpld@3,0: failed to match any schema with compatible: ['cpld']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dts:155.12-187.6: Warning (unique_unit_address_if_enabled): /soc@ffe00000/spi@7000/flash@0: duplicate unit-address (also used in node /soc@ffe00000/spi@7000/slic@0)
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /: failed to match any schema with compatible: ['fsl,P1020RDB-PD']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: / (fsl,P1020RDB-PD): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: / (fsl,P1020RDB-PD): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@20000', 'partition@3e00000', 'partition@3f00000', 'partition@400000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /localbus@ffe05000/cpld@2,0: failed to match any schema with compatible: ['fsl,p1020rdb-pd-cpld']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /localbus@ffe05000/L2switch@3,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
--
   arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi:38.2-25: Warning (interrupts_property): /soc@ffe00000/mdio@24000/ethernet-phy@1:#interrupt-cells: size is (8), expected multiple of 16
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /: failed to match any schema with compatible: ['fsl,P1020RDB']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: / (fsl,P1020RDB): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: / (fsl,P1020RDB): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@40000', 'partition@400000', 'partition@80000', 'partition@f00000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /localbus@ffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi:38.2-25: Warning (interrupts_property): /soc@fffe00000/mdio@24000/ethernet-phy@1:#interrupt-cells: size is (8), expected multiple of 16
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /: failed to match any schema with compatible: ['fsl,P1020RDB']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: / (fsl,P1020RDB): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: / (fsl,P1020RDB): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /localbus@fffe05000: failed to match any schema with compatible: ['fsl,p1020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /localbus@fffe05000: failed to match any schema with compatible: ['fsl,p1020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@40000', 'partition@400000', 'partition@80000', 'partition@f00000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /localbus@fffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /localbus@fffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /localbus@fffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /: failed to match any schema with compatible: ['fsl,P1020UTM-PC']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: / (fsl,P1020UTM-PC): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: / (fsl,P1020UTM-PC): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@1f00000', 'partition@40000', 'partition@400000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
--
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /: failed to match any schema with compatible: ['fsl,P1020UTM-PC']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: / (fsl,P1020UTM-PC): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: / (fsl,P1020UTM-PC): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /localbus@fffe05000: failed to match any schema with compatible: ['fsl,p1020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /localbus@fffe05000: failed to match any schema with compatible: ['fsl,p1020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@1f00000', 'partition@40000', 'partition@400000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
--
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /: failed to match any schema with compatible: ['fsl,P1021RDB-PC']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: / (fsl,P1021RDB-PC): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: / (fsl,P1021RDB-PC): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1021-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1021-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@40000', 'partition@400000', 'partition@80000', 'partition@ec0000', 'partition@f00000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1021-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1021-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /localbus@ffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1021-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /: failed to match any schema with compatible: ['fsl,P1021RDB-PC']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: / (fsl,P1021RDB-PC): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: / (fsl,P1021RDB-PC): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /localbus@fffe05000: failed to match any schema with compatible: ['fsl,p1021-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /localbus@fffe05000: failed to match any schema with compatible: ['fsl,p1021-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@40000', 'partition@400000', 'partition@80000', 'partition@ec0000', 'partition@f00000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /localbus@fffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1021-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /localbus@fffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1021-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /localbus@fffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1021-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /: failed to match any schema with compatible: ['fsl,P1022DS']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: / (fsl,P1022DS): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: / (fsl,P1022DS): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1022-elbc', 'fsl,elbc']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1022-elbc', 'fsl,elbc']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@3000000', 'partition@3e00000', 'partition@4000000', 'partition@4400000', 'partition@7f00000', 'partition@7f80000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /localbus@ffe05000/nand@2,0: failed to match any schema with compatible: ['fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1022-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1022-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1022-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/memory-controller@2000: failed to match any schema with compatible: ['fsl,p1022-memory-controller']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
--
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /: failed to match any schema with compatible: ['fsl,P1022DS']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: / (fsl,P1022DS): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: / (fsl,P1022DS): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /localbus@fffe05000: failed to match any schema with compatible: ['fsl,p1022-elbc', 'fsl,elbc']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /localbus@fffe05000: failed to match any schema with compatible: ['fsl,p1022-elbc', 'fsl,elbc']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@3000000', 'partition@3e00000', 'partition@4000000', 'partition@4400000', 'partition@7f00000', 'partition@7f80000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /localbus@fffe05000/nand@2,0: failed to match any schema with compatible: ['fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1022-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1022-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1022-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/memory-controller@2000: failed to match any schema with compatible: ['fsl,p1022-memory-controller']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
--
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /: failed to match any schema with compatible: ['fsl,P1024RDB']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: / (fsl,P1024RDB): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: / (fsl,P1024RDB): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@40000', 'partition@400000', 'partition@80000', 'partition@f00000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /: failed to match any schema with compatible: ['fsl,P1024RDB']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: / (fsl,P1024RDB): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: / (fsl,P1024RDB): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /localbus@fffe05000: failed to match any schema with compatible: ['fsl,p1020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /localbus@fffe05000: failed to match any schema with compatible: ['fsl,p1020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@40000', 'partition@400000', 'partition@80000', 'partition@f00000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /localbus@fffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /localbus@fffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi:38.2-25: Warning (interrupts_property): /soc@ffe00000/mdio@24000/ethernet-phy@1:#interrupt-cells: size is (8), expected multiple of 16
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /: failed to match any schema with compatible: ['fsl,P1025RDB']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: / (fsl,P1025RDB): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: / (fsl,P1025RDB): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1021-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1021-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@40000', 'partition@400000', 'partition@80000', 'partition@f00000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1025-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1025-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1021-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
--
   arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi:38.2-25: Warning (interrupts_property): /soc@fffe00000/mdio@24000/ethernet-phy@1:#interrupt-cells: size is (8), expected multiple of 16
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /: failed to match any schema with compatible: ['fsl,P1025RDB']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: / (fsl,P1025RDB): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: / (fsl,P1025RDB): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /localbus@fffe05000: failed to match any schema with compatible: ['fsl,p1021-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /localbus@fffe05000: failed to match any schema with compatible: ['fsl,p1021-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@40000', 'partition@400000', 'partition@80000', 'partition@f00000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /localbus@fffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1025-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /localbus@fffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1025-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1021-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
--
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /: failed to match any schema with compatible: ['fsl,TWR-P1025']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: / (fsl,TWR-P1025): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: / (fsl,TWR-P1025): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1021-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1021-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@40000', 'partition@400000', 'partition@80000', 'partition@ec0000', 'partition@f00000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /localbus@ffe05000/display@2,0: failed to match any schema with compatible: ['solomon,ssd1289fb']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1021-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: usb@22000 (fsl-usb2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: usb@22000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
--
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /: failed to match any schema with compatible: ['fsl,P2020DS']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: / (fsl,P2020DS): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: / (fsl,P2020DS): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p2020ds.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('diagnostic@3000000', 'dink@3e00000', 'dtb@7f00000', 'jffs2@4400000', 'kernel@4000000', 'ramdisk@0', 'u-boot@7f80000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /localbus@ffe05000/nand@2,0: failed to match any schema with compatible: ['fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: board-control@3,0 (fsl,p2020ds-fpga): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,p2020ds-fpga', 'fsl,fpga-ngpixis'] is too short
   	['fsl,p2020ds-fpga', 'fsl,fpga-ngpixis'] is too long
   	'fsl,p1022ds-fpga' was expected
   	'fsl,p2020ds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,p2020ds-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,p2020ds-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	'fsl,fpga-qixis' was expected
--
   arch/powerpc/boot/dts/fsl/p2020rdb-pc.dtsi:133.11-139.4: Warning (simple_bus_reg): /localbus@ffe05000/cpld@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /: failed to match any schema with compatible: ['fsl,P2020RDB-PC']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: / (fsl,P2020RDB-PC): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: / (fsl,P2020RDB-PC): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@40000', 'partition@400000', 'partition@80000', 'partition@f00000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p2020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p2020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /localbus@ffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /localbus@ffe05000/cpld@3,0: failed to match any schema with compatible: ['cpld']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p2020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
--
   arch/powerpc/boot/dts/fsl/p2020rdb-pc.dtsi:133.11-139.4: Warning (simple_bus_reg): /localbus@fffe05000/cpld@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /: failed to match any schema with compatible: ['fsl,P2020RDB-PC']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: / (fsl,P2020RDB-PC): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: / (fsl,P2020RDB-PC): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /localbus@fffe05000: failed to match any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /localbus@fffe05000: failed to match any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@40000', 'partition@400000', 'partition@80000', 'partition@f00000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /localbus@fffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p2020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /localbus@fffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p2020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /localbus@fffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /localbus@fffe05000/cpld@3,0: failed to match any schema with compatible: ['cpld']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p2020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
--
   arch/powerpc/boot/dts/fsl/p2020rdb.dts:131.16-136.5: Warning (simple_bus_reg): /localbus@ffe05000/L2switch@2,0: simple-bus unit address format error, expected "200000000"
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /: failed to match any schema with compatible: ['fsl,P2020RDB']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: / (fsl,P2020RDB): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: / (fsl,P2020RDB): False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/p2020rdb.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@40000', 'partition@400000', 'partition@80000', 'partition@f00000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p2020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p2020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /localbus@ffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p2020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   arch/powerpc/boot/dts/fsl/ppa8548.dts:39.22-42.4: Warning (interrupt_provider): /pci@fe0009000: '#interrupt-cells' found, but node is not an interrupt provider
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /: failed to match any schema with compatible: ['ppa8548']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: / (ppa8548): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /localbus@fe0005000: failed to match any schema with compatible: ['fsl,mpc8548-lbc', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /localbus@fe0005000: failed to match any schema with compatible: ['fsl,mpc8548-lbc', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: nor@0 (cfi-flash): $nodename:0: 'nor@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/ppa8548.dtb: nor@0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@7A0000', 'partition@7C0000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: soc8548@fe0000000 (fsl,mpc8548-immr): $nodename:0: 'soc8548@fe0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000: failed to match any schema with compatible: ['fsl,mpc8548-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
