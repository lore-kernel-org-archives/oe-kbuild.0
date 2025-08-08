Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22027272E68
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Aug 2025 10:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754648662; cv=none; b=aA0oshYVlTtfMMiWnax2xkwe0SSxlaSi/juvY/7oBNlB0SZDiwewIfJpKgQlfT8c+XHYoUVFv91stQW+P6S/cTV7rFD+8rJr933yEZUFJdwrIQ1uHSEMS94p1/aiDak/E+O1nJN3Je7R+07JBn+AiWgNvjfVn4opkMn2mqvcNsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754648662; c=relaxed/simple;
	bh=Wji7MOcYJjMzWspX61GmZFFfDxi2tuBI6kNek3Gn6Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G2UKk5y18V0D7Iu+7gDEjqwS3FXrI90SjeyLXA3Ew6Qx89KkGdbvd1X1+A5KcdU9riEHV9P0LLxm51O444nTDbQAwJK7H01SNnJ6PRkNJnPsOFWXPiG6uLLEC4lpN1J8NZrGqyPdiiY4XGzDDzYagaPf5YvPR4lapq//Ew2JYEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E6BuIJe2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E6BuIJe2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754648658; x=1786184658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wji7MOcYJjMzWspX61GmZFFfDxi2tuBI6kNek3Gn6Xw=;
  b=E6BuIJe2CNG5T5aBPKKbef/uoysRqRn1HVB1HdkMc7+0AGgIX9NS04Km
   s8zVKvJdXTSwwk8mx/RiauPSUTbmoetzULtgZ0rTxmvmvQDaO+MSzSFG/
   USN06jsYqQ35KyaW3zmrgjZASZcYKctOZEwUDBzD14tiN90VVf4i85Jk7
   z1fEORSSDvDSzADnWm2uS2sTlL2EvVnxLPghwDaVTD3fyuBTuKJs7SayA
   TlJHm5LGZxNKDMfoQEBUVJ58FVRvdk0g1qo/WpOUGDJP/GmSXzRqh/1ha
   HR0TuZMzB8D4PBvANNS1/+JDKYbgmqDW/hL+O95/tYmFdO/HZKBYZdXHw
   A==;
X-CSE-ConnectionGUID: z2GZmUZBTYWxRHojdemaFQ==
X-CSE-MsgGUID: ejFvJ7j/Rvqi9T7VvmpYAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68362887"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="68362887"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 03:24:16 -0700
X-CSE-ConnectionGUID: VC/TQrWfTjaUA+qjMq56cQ==
X-CSE-MsgGUID: NvGqz5EAST+XXJikb5qCcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="202468216"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 08 Aug 2025 03:24:15 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukKGi-0003qk-0i;
	Fri, 08 Aug 2025 10:24:12 +0000
Date: Fri, 8 Aug 2025 18:23:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 383/801]
 arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: gpio-controller@fc00
 (fsl,pq3-gpio): #gpio-cells: 2 was expected
Message-ID: <202508081847.X4Q69HvN-lkp@intel.com>
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
commit: a92832e2ff52e63d0c65935767a13aaa487625e1 [383/801] dt-bindings: mux: Convert adi,adgs1408 to DT schema
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc-randconfig-051-20250807 (https://download.01.org/0day-ci/archive/20250808/202508081847.X4Q69HvN-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508081847.X4Q69HvN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508081847.X4Q69HvN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: dma@c300 (fsl,eloplus-dma): dma-channel@100:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: dma@c300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: gpio-controller@fc00 (fsl,pq3-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: gpio-controller@fc00 (fsl,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: gpio-controller@fc00 (fsl,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,p2020-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@80:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: dma@c300 (fsl,eloplus-dma): dma-channel@100:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: dma@c300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: gpio-controller@fc00 (fsl,pq3-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: gpio-controller@fc00 (fsl,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: gpio-controller@fc00 (fsl,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,p2020-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@80:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: dma@c300 (fsl,eloplus-dma): dma-channel@100:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: dma@c300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb.dtb: gpio-controller@fc00 (fsl,pq3-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb.dtb: gpio-controller@fc00 (fsl,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb.dtb: gpio-controller@fc00 (fsl,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,p2020-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@80:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: serial@11c500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: serial@11c600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: serial@11d500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: gpio@130000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: usb@210000 (fsl-usb2-mph-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: usb@210000 (fsl-usb2-mph-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
--
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: i2c@119000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: serial@11c500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: serial@11c600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: serial@11d500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: gpio@130000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: usb@210000 (fsl-usb2-mph-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v1.6', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: usb@210000 (fsl-usb2-mph-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl-usb2-mph']
--
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: i2c@119000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: serial@11c500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: serial@11c600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: serial@11d500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: gpio@130000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: usb@210000 (fsl-usb2-mph-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: usb@210000 (fsl-usb2-mph-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
--
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: i2c@119000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: serial@11c500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: serial@11c600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: serial@11d500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: gpio@130000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: usb@210000 (fsl-usb2-mph-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: usb@210000 (fsl-usb2-mph-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
--
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: serial@11c500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: serial@11c600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: serial@11d500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: gpio@130000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: gpio@131000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: serial@11c500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: serial@11c600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: serial@11d500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: gpio@130000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: gpio@131000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: serial@11c500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: serial@11c600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: serial@11d500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: gpio@130000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: gpio@131000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: serial@11c500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: serial@11c600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: serial@11d500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: gpio@130000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: gpio@131000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: serial@11c500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: serial@11c600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: serial@11d500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: gpio@130000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: gpio@131000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: serial@11c500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: serial@11c600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: serial@11d500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: gpio@130000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: gpio@131000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: serial@11c500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: serial@11c600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: serial@11d500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: gpio@130000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: gpio@131000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: serial@11c500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: serial@11c600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: serial@11d500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: gpio@130000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: gpio@131000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: serial@11c500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: serial@11c600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: serial@11d500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: gpio@130000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: gpio@131000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: serial@11c500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: serial@11c600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: serial@11d500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: gpio@130000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: gpio@131000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: serial@11c500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: serial@11c600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: serial@11d500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: gpio@130000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: gpio@131000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: serial@11c500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: serial@11c600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: serial@11d500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: gpio@130000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: gpio@131000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: serial@11c500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: serial@11c600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: serial@11d500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: gpio@130000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: gpio@131000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: serial@11c500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: serial@11c600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: serial@11d500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: gpio@130000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: gpio@131000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: serial@11c500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: serial@11c600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: serial@11d500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: gpio@130000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: gpio@131000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: serial@11c500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: serial@11c600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: serial@11d500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: gpio@130000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: gpio@130000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: gpio@131000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio', 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: gpio@131000 (fsl,qoriq-gpio): #gpio-cells: [2] is not of type 'integer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
