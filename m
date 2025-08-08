Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0030B281341
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Aug 2025 14:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754664970; cv=none; b=GSktgv4Rz3duR7HoVW6WYEGJL7heSFPAtkbWm5NBFHNhWo1czmTxCmgugIHSz3yAxKGU7ygi+gbj6PGgDKBXYmJj37gQVXSc7yKVsfXDRpdi1WOl2d/EemdHtsXa3533CIRaKw/M8cO0t65HyfoapsV+7hu0DUR00MrE4OL/+cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754664970; c=relaxed/simple;
	bh=K30twN/liI1RMR5O9FonBiWMWxhX1ntnmSkKyNYNPk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SSgGJkF77dJZ9pz+ym70iOJdmotorQ7Vc5jT4YMgmqlVpXRdaFPLcEMUIlAaxJbLxokgOUS+9mp6wH/aDit+wEjHBJBmDYv9h4cfB0bTaRvEnTZ1+TwQfkToPexiZjvU954rNUUzdtHe5jTG3H9y6QnDX+p04pm58tEyUcBY9ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDMo1nBB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDMo1nBB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754664968; x=1786200968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K30twN/liI1RMR5O9FonBiWMWxhX1ntnmSkKyNYNPk4=;
  b=oDMo1nBBFuF5xBx+nYjQGBreH1jeZB1IxnOeMdJb7lODgYCM/jLwZfXN
   qZIe0iYVU69SGqOMX3TV/jqtAuZbiYg1l55PaGBADknocdgq2C67SRqf5
   JAdSnNbLoquAm+I7NdazIZYFGOjYNapAAPVapRshk0CIPHrUlsphkPtVE
   NSBVZvb34ng7gje6rQg59FjsCaVhNWDkofZfzAqJPrLGVr0FBrCaAEjOS
   WWsVYrZ43m37GEZobcTPjrkWUSo20Rv3ElGJafY18CUWXxMiiDOKBNyVP
   SMep9EqM/khhHstaw0Z8eaAwQ7ZZbQkx1LsTZJbjMhOzjG5FFBDoyi9nC
   Q==;
X-CSE-ConnectionGUID: C9GzjrGZQ76kAT9Zxop2DA==
X-CSE-MsgGUID: pptdQhrcR7WHDSEFVLF7ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68379118"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="68379118"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 07:56:07 -0700
X-CSE-ConnectionGUID: 33x6stsQSW2lmZIGaRRCXQ==
X-CSE-MsgGUID: vh81aDLkQiGcJge/5acdjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="164583190"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 08 Aug 2025 07:56:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukOVn-000428-0Q;
	Fri, 08 Aug 2025 14:56:03 +0000
Date: Fri, 8 Aug 2025 22:55:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 369/801] arch/powerpc/boot/dts/bluestone.dtb:
 ndfc@1,0 (ibm,ndfc): nand:partition@0:reg: [[0, 12582912]] is too short
Message-ID: <202508082211.V2NbEZxm-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 87ee18add62a867d1135489c0b34d989f0ac1f93 [369/801] dt-bindings: mtd: Convert ibm,ndfc to DT schema
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250808/202508082211.V2NbEZxm-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508082211.V2NbEZxm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508082211.V2NbEZxm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/bluestone.dtb: /l2c: failed to match any schema with compatible: ['ibm,l2-cache-apm82181', 'ibm,l2-cache']
   arch/powerpc/boot/dts/bluestone.dtb: /plb: failed to match any schema with compatible: ['ibm,plb4']
   arch/powerpc/boot/dts/bluestone.dtb: /plb/sdram: failed to match any schema with compatible: ['ibm,sdram-apm821xx']
   arch/powerpc/boot/dts/bluestone.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal2']
   arch/powerpc/boot/dts/bluestone.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb']
   arch/powerpc/boot/dts/bluestone.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc']
   arch/powerpc/boot/dts/bluestone.dtb: nor_flash@0,0 (amd,s29gl512n): $nodename:0: 'nor_flash@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/bluestone.dtb: nor_flash@0,0 (amd,s29gl512n): Unevaluated properties are not allowed ('partition@0', 'partition@180000', 'partition@1a0000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/powerpc/boot/dts/bluestone.dtb: ndfc@1,0 (ibm,ndfc): nand:partition@0:reg: [[0, 12582912]] is too short
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
>> arch/powerpc/boot/dts/bluestone.dtb: ndfc@1,0 (ibm,ndfc): nand:partition@c00000:reg: [[12582912, 11534336]] is too short
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
   arch/powerpc/boot/dts/bluestone.dtb: ndfc@1,0 (ibm,ndfc): nand:partition@1700000:reg: [[24117248, 14680064]] is too short
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
   arch/powerpc/boot/dts/bluestone.dtb: ndfc@1,0 (ibm,ndfc): nand:partition@2500000:reg: [[38797312, 136314880]] is too short
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
>> arch/powerpc/boot/dts/bluestone.dtb: ndfc@1,0 (ibm,ndfc): nand:partition@a700000:reg: [[175112192, 11534336]] is too short
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
>> arch/powerpc/boot/dts/bluestone.dtb: ndfc@1,0 (ibm,ndfc): nand:partition@b200000:reg: [[186646528, 13631488]] is too short
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
>> arch/powerpc/boot/dts/bluestone.dtb: ndfc@1,0 (ibm,ndfc): nand:partition@bf00000:reg: [[200278016, 12582912]] is too short
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
>> arch/powerpc/boot/dts/bluestone.dtb: ndfc@1,0 (ibm,ndfc): nand:partition@cb00000:reg: [[212860928, 55574528]] is too short
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
>> arch/powerpc/boot/dts/bluestone.dtb: ndfc@1,0 (ibm,ndfc): reg: [[3, 0, 8192]] is too short
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
   arch/powerpc/boot/dts/bluestone.dtb: serial@ef600300 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/bluestone.dtb: serial@ef600400 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/bluestone.dtb: /plb/opb/i2c@ef600700: failed to match any schema with compatible: ['ibm,iic']
   arch/powerpc/boot/dts/bluestone.dtb: /plb/opb/i2c@ef600700/sttm@4C: failed to match any schema with compatible: ['adm,adm1032']
   arch/powerpc/boot/dts/bluestone.dtb: /plb/opb/i2c@ef600800: failed to match any schema with compatible: ['ibm,iic']
   arch/powerpc/boot/dts/bluestone.dtb: /plb/opb/emac-rgmii@ef601500: failed to match any schema with compatible: ['ibm,rgmii']
   arch/powerpc/boot/dts/bluestone.dtb: /plb/opb/emac-tah@ef601350: failed to match any schema with compatible: ['ibm,tah']
--
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-460ex', 'ibm,ebc']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-460ex', 'ibm,ebc']
   arch/powerpc/boot/dts/canyonlands.dtb: nor_flash@0,0 (amd,s29gl512n): $nodename:0: 'nor_flash@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: nor_flash@0,0 (amd,s29gl512n): Unevaluated properties are not allowed ('partition@0', 'partition@1600000', 'partition@1a00000', 'partition@1e0000', 'partition@200000', 'partition@3f60000', 'partition@3fa0000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: cpld@2,0 (amcc,ppc460ex-bcsr): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: cpld@2,0 (amcc,ppc460ex-bcsr): 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/canyonlands.dtb: ndfc@3,0 (ibm,ndfc): nand:partition@0:reg: [[0, 1048576]] is too short
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: ndfc@3,0 (ibm,ndfc): nand:partition@100000:reg: [[0, 66060288]] is too short
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
>> arch/powerpc/boot/dts/canyonlands.dtb: ndfc@3,0 (ibm,ndfc): reg: [[3, 0, 8192]] is too short
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: serial@ef600300 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: serial@ef600400 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/i2c@ef600700: failed to match any schema with compatible: ['ibm,iic-460ex', 'ibm,iic']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/i2c@ef600700: failed to match any schema with compatible: ['ibm,iic-460ex', 'ibm,iic']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/i2c@ef600800: failed to match any schema with compatible: ['ibm,iic-460ex', 'ibm,iic']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/opb/i2c@ef600800: failed to match any schema with compatible: ['ibm,iic-460ex', 'ibm,iic']
   arch/powerpc/boot/dts/canyonlands.dtb: gpio@ef600b00 (ibm,ppc4xx-gpio): '#gpio-cells' is a required property
--
   arch/powerpc/boot/dts/eiger.dtb: nor_flash@0,0 (amd,s29gl512n): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/eiger.dtb: nor_flash@0,0 (amd,s29gl512n): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/eiger.dtb: nor_flash@0,0 (amd,s29gl512n): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/eiger.dtb: nor_flash@0,0 (amd,s29gl512n): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/eiger.dtb: nor_flash@0,0 (amd,s29gl512n): Unevaluated properties are not allowed ('partition@0', 'partition@1600000', 'partition@1a00000', 'partition@1e0000', 'partition@200000', 'partition@3f60000', 'partition@3fa0000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/powerpc/boot/dts/eiger.dtb: ndfc@1,0 (ibm,ndfc): nand:partition@0:reg: [[0, 2097152]] is too short
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
   arch/powerpc/boot/dts/eiger.dtb: ndfc@1,0 (ibm,ndfc): nand:partition@200000:reg: [[2097152, 1048576]] is too short
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
   arch/powerpc/boot/dts/eiger.dtb: ndfc@1,0 (ibm,ndfc): nand:partition@300000:reg: [[3145728, 3145728]] is too short
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
   arch/powerpc/boot/dts/eiger.dtb: ndfc@1,0 (ibm,ndfc): nand:partition@600000:reg: [[6291456, 26214400]] is too short
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
>> arch/powerpc/boot/dts/eiger.dtb: ndfc@1,0 (ibm,ndfc): nand:partition@1f00000:reg: [[32505856, 131072]] is too short
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
>> arch/powerpc/boot/dts/eiger.dtb: ndfc@1,0 (ibm,ndfc): nand:partition@1f20000:reg: [[32636928, 101580800]] is too short
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
>> arch/powerpc/boot/dts/eiger.dtb: ndfc@1,0 (ibm,ndfc): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
   arch/powerpc/boot/dts/eiger.dtb: serial@ef600200 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/eiger.dtb: serial@ef600300 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/eiger.dtb: /plb/opb/i2c@ef600400: failed to match any schema with compatible: ['ibm,iic-460sx', 'ibm,iic']
   arch/powerpc/boot/dts/eiger.dtb: /plb/opb/i2c@ef600400: failed to match any schema with compatible: ['ibm,iic-460sx', 'ibm,iic']
   arch/powerpc/boot/dts/eiger.dtb: /plb/opb/i2c@ef600500: failed to match any schema with compatible: ['ibm,iic-460sx', 'ibm,iic']
   arch/powerpc/boot/dts/eiger.dtb: /plb/opb/i2c@ef600500: failed to match any schema with compatible: ['ibm,iic-460sx', 'ibm,iic']
   arch/powerpc/boot/dts/eiger.dtb: /plb/opb/emac-rgmii@ef600900: failed to match any schema with compatible: ['ibm,rgmii-460sx', 'ibm,rgmii']
--
   arch/powerpc/boot/dts/glacier.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-460gt', 'ibm,mcmal2']
   arch/powerpc/boot/dts/glacier.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-460gt', 'ibm,mcmal2']
   arch/powerpc/boot/dts/glacier.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-460gt', 'ibm,opb']
   arch/powerpc/boot/dts/glacier.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-460gt', 'ibm,opb']
   arch/powerpc/boot/dts/glacier.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-460gt', 'ibm,ebc']
   arch/powerpc/boot/dts/glacier.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-460gt', 'ibm,ebc']
   arch/powerpc/boot/dts/glacier.dtb: nor_flash@0,0 (amd,s29gl512n): $nodename:0: 'nor_flash@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/glacier.dtb: nor_flash@0,0 (amd,s29gl512n): Unevaluated properties are not allowed ('partition@0', 'partition@1600000', 'partition@1a00000', 'partition@1e0000', 'partition@200000', 'partition@3f60000', 'partition@3fa0000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/powerpc/boot/dts/glacier.dtb: ndfc@3,0 (ibm,ndfc): nand:partition@0:reg: [[0, 1048576]] is too short
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
   arch/powerpc/boot/dts/glacier.dtb: ndfc@3,0 (ibm,ndfc): nand:partition@100000:reg: [[0, 66060288]] is too short
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
>> arch/powerpc/boot/dts/glacier.dtb: ndfc@3,0 (ibm,ndfc): reg: [[3, 0, 8192]] is too short
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
   arch/powerpc/boot/dts/glacier.dtb: serial@ef600300 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/glacier.dtb: serial@ef600400 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/glacier.dtb: serial@ef600500 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/glacier.dtb: serial@ef600600 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/glacier.dtb: /plb/opb/i2c@ef600700: failed to match any schema with compatible: ['ibm,iic-460gt', 'ibm,iic']
--
   arch/powerpc/boot/dts/sequoia.dtb: ehci@e0000300 (ibm,usb-ehci-440epx): $nodename:0: 'ehci@e0000300' does not match '^usb(@.*)?'
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/powerpc/boot/dts/sequoia.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-440epx', 'ibm,opb']
   arch/powerpc/boot/dts/sequoia.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-440epx', 'ibm,opb']
   arch/powerpc/boot/dts/sequoia.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-440epx', 'ibm,ebc']
   arch/powerpc/boot/dts/sequoia.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-440epx', 'ibm,ebc']
   arch/powerpc/boot/dts/sequoia.dtb: nor_flash@0,0 (amd,s29gl256n): $nodename:0: 'nor_flash@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/sequoia.dtb: nor_flash@0,0 (amd,s29gl256n): Unevaluated properties are not allowed ('partition@0', 'partition@180000', 'partition@380000', 'partition@3e20000', 'partition@3f60000', 'partition@3fa0000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/powerpc/boot/dts/sequoia.dtb: ndfc@3,0 (ibm,ndfc): nand:partition@0:reg: [[0, 540672]] is too short
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
   arch/powerpc/boot/dts/sequoia.dtb: ndfc@3,0 (ibm,ndfc): nand:partition@84000:reg: [[540672, 33013760]] is too short
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
>> arch/powerpc/boot/dts/sequoia.dtb: ndfc@3,0 (ibm,ndfc): reg: [[3, 0, 8192]] is too short
   	from schema $id: http://devicetree.org/schemas/ibm,ndfc.yaml#
   arch/powerpc/boot/dts/sequoia.dtb: serial@ef600300 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/sequoia.dtb: serial@ef600400 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/sequoia.dtb: serial@ef600500 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/sequoia.dtb: serial@ef600600 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/sequoia.dtb: /plb/opb/i2c@ef600700: failed to match any schema with compatible: ['ibm,iic-440epx', 'ibm,iic']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
