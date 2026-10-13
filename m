Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308D23D9533
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Oct 2026 10:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887256; cv=none; b=ipq+wwdTiaTWFalIsOjzhQkXEmpXP6/WFbxfd62rM5UfjDDqf7SVHQQUtvKKwhEy+nGo6TJY85cTT+UrBS/qgsXMrD6CjmpdnSI0/HK1xdcvi+MgrT5H3u6lpigbiDVXzCT+gpD9ryY6yPr55nWZinVJqU0khDGaMkyCGg47Lgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887256; c=relaxed/simple;
	bh=djAWCdILj+jadoEh9BjIWjPnVnfAMr6zgCbMspyLWf0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ubXuiYWJQCxa/RfpWIrq180IPGf41h3ewtQ8SEoh/prgWdG4AegBdPPr7RbZiZRfBqXe4L7Dt79zJDZAWeUand+RoNa5yUaXBEenBdxLMbqaaa3vGY84YX9Yy1Bmao/0GOjg5l6t1CSuY2pmoCojOTjxa3P9rdt/7JwGvo+ipgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cb44DM5G; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cb44DM5G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791887254; x=1823423254;
  h=date:from:to:cc:subject:message-id;
  bh=djAWCdILj+jadoEh9BjIWjPnVnfAMr6zgCbMspyLWf0=;
  b=cb44DM5GHDy9+nFemkv7mZ1LhUgRt0xs4nk0lB1kL0BFja49pe3FLwRz
   7LW0eMZvvB1SxUf4l0sC/IpSCm1lnDywQPAmqyHzQkiVk8zAmQB1cYfBq
   vDkSS80w2uod7yrdkVtKVtF0Gln952rsS3ewDOjx7P7J68eVdeUZLeNN2
   AyX+31xrb3467BtwhmBmlYuN4lmkntYkVf2fK7kE/4QtW7DSDiHVHyXsB
   cs/zO7LcCaiTNDWDVh8guLSDFrucwZHn2ENeFRvoKJhccCi3+qrXZLd02
   yFTl1V4ev4QhkuMyowj2e4kky9g+yCyNDFEgTcF6YxjWUC6xl/WYGt/pG
   w==;
X-CSE-ConnectionGUID: XzK7LWpuTuK5cte7iUqrxw==
X-CSE-MsgGUID: WVQkp86qQWqgT47rV9lN3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="509132"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="509132"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 03:27:33 -0700
X-CSE-ConnectionGUID: 2+WcX4BwQGOjSwl10bjJTg==
X-CSE-MsgGUID: I9uE8FqOTai28LrzRdWMsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1455094"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 13 Oct 2026 03:27:33 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGZjG-00000000ATB-2D0W;
	Tue, 13 Oct 2026 10:27:30 +0000
Date: Tue, 13 Oct 2026 12:26:30 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mtd:nand/next 35/38] arch/powerpc/boot/dts/eiger.dtb:
 ndfc@1,0 (ibm,ndfc): 'reg' is a required property
Message-ID: <202610131226.fyDfUKNa-lkp@intel.com>
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
TO: Rosen Penev <rosenp@gmail.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
head:   30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
commit: 0d1644566a1caaf71c8bf2a6689176e61749a85f [35/38] dt-bindings: mtd: convert IBM NDFC binding to YAML
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20261013/202610131226.fyDfUKNa-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 16.1.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610131226.fyDfUKNa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610131226.fyDfUKNa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/eiger.dtb: nor_flash@0,0 (amd,s29gl512n): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/eiger.dtb: nor_flash@0,0 (amd,s29gl512n): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/eiger.dtb: nor_flash@0,0 (amd,s29gl512n): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/eiger.dtb: nor_flash@0,0 (amd,s29gl512n): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/eiger.dtb: nor_flash@0,0 (amd,s29gl512n): Unevaluated properties are not allowed ('partition@0', 'partition@1600000', 'partition@1a00000', 'partition@1e0000', 'partition@200000', 'partition@3f60000', 'partition@3fa0000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/eiger.dtb: ndfc@1,0 (ibm,ndfc): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/ibm,ndfc.yaml
   arch/powerpc/boot/dts/eiger.dtb: serial@ef600200 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/eiger.dtb: serial@ef600200 (ns16550): virtual-reg: b'\xef`\x02\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/eiger.dtb: serial@ef600300 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/eiger.dtb: serial@ef600300 (ns16550): virtual-reg: b'\xef`\x03\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/eiger.dtb: /plb/opb/i2c@ef600400: failed to match any schema with compatible: ['ibm,iic-460sx', 'ibm,iic']
--
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-440ep', 'ibm,ebc-440gp', 'ibm,ebc']
   arch/powerpc/boot/dts/warp.dtb: ebc (ibm,ebc-440ep): dcr-reg: b'\x00\x00\x00\x12\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/ebc/fpga@2,0: failed to match any schema with compatible: ['pika,fpga']
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/ebc/fpga@2,2000: failed to match any schema with compatible: ['pika,fpga-sgl']
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/ebc/fpga@2,4000: failed to match any schema with compatible: ['pika,fpga-sd']
   arch/powerpc/boot/dts/warp.dtb: nor@0,0 (amd,s29gl032a): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/warp.dtb: nor@0,0 (amd,s29gl032a): Unevaluated properties are not allowed ('partition@0', 'partition@300000', 'partition@340000', 'partition@380000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/warp.dtb: ndfc@1,0 (ibm,ndfc): nand: Unevaluated properties are not allowed ('partition@C0000000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ibm,ndfc.yaml
   arch/powerpc/boot/dts/warp.dtb: serial@ef600300 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/warp.dtb: serial@ef600300 (ns16550): virtual-reg: b'\xef`\x03\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/i2c@ef600700: failed to match any schema with compatible: ['ibm,iic-440ep', 'ibm,iic-440gp', 'ibm,iic']
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/i2c@ef600700: failed to match any schema with compatible: ['ibm,iic-440ep', 'ibm,iic-440gp', 'ibm,iic']
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/i2c@ef600700: failed to match any schema with compatible: ['ibm,iic-440ep', 'ibm,iic-440gp', 'ibm,iic']
   arch/powerpc/boot/dts/warp.dtb: at24@52 (atmel,24c04): $nodename:0: 'at24@52' does not match '^eeprom@[0-9a-f]{1,2}$'
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
