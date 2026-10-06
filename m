Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857192F260F
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Oct 2026 07:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791270099; cv=none; b=iyKKrXdKBl8gx3SGcjFquRh/H2Xiwnb+xgNTIm0CiwmuOJohQn6xAu9BgyuLytZkDd/X028zVlv6VtwvsPGfJulUcCFwbkg5PRdXKdbm17OiVY4g2hyIPfTRgGRe3TGvfo2Jv04LeVffkCXxj30jPQx0MgCdO74rAhPSzjHjNmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791270099; c=relaxed/simple;
	bh=mzIEeR5dKU90UkaA/2g+9j1gDH3hCJ20Fs/mW6GarA4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KYLe33LGy1BV3GCBHhBD2Z3rSYESDuxQLnDEbDc05sQ/2t8+aNsKR2Bzwanr1fQ/8kM3g89hmiQdfzhh8nk0WUHAG/1ZsXYIWg0EYP0uUU8KGGRaWArgRVD3aHcMkLGJxhUdULSUz9aaA8NQyhQzCw2CoDbrxiJsb8DTfkoOww4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+NH49wV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+NH49wV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791270097; x=1822806097;
  h=date:from:to:cc:subject:message-id;
  bh=mzIEeR5dKU90UkaA/2g+9j1gDH3hCJ20Fs/mW6GarA4=;
  b=i+NH49wVRGIN5TSiPlCHlwDaG/iOKW1CxrUWq7x10Wz1jbdgE9DY7lQN
   uPKoqcxorhpo1fXROS9vrQDG9aACPxuU+LD64bQBIivNxWF3Aa7wlZFLt
   xZ1RvrB2aWZToeepe0SGmKT3dIwXBSeW1z0ktZ0aoLoPdcYUIBRFJ3pam
   W78Idd3tPZeOKThPoSnTqYYeChZgg6feBhF6Z2MbLn90446bCXaxdBHMU
   v8zOWQVM6XEF9r/hXHBERL8kkddi2IwYxSZzUf2CC7ju5OarfArVw8H1I
   UoquwYluufzl8bT/ToICX9+fp1DO3IQN34yuNstWRrDu5ce1LqeT3fotk
   w==;
X-CSE-ConnectionGUID: 1NWXxmvJRAaTcaSVnNn5qg==
X-CSE-MsgGUID: rM28rof1STaQnm3ViAo8gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="103321346"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="103321346"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 00:01:37 -0700
X-CSE-ConnectionGUID: IPVvFl0ZS/KdxbP+pCeBYg==
X-CSE-MsgGUID: 9fwBeti+TrOyXJsGmO6yfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="276579911"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 06 Oct 2026 00:01:36 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDzB8-000000000st-0IIB;
	Tue, 06 Oct 2026 07:01:34 +0000
Date: Tue, 06 Oct 2026 09:01:21 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-spi:for-7.4 15/22]
 arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: spi@21000400
 (ti,keystone-spi): Unevaluated properties are not allowed
 ('ti,davinci-spi-num-cs' was unexpected)
Message-ID: <202610060824.ctw3AqH4-lkp@intel.com>
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
CC: linux-spi@vger.kernel.org
TO: Bhargav Joshi <j.bhargav.u@gmail.com>
CC: Mark Brown <broonie@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4
head:   4825287f6d2346e9273f35a928d1ef40e68bc58b
commit: 38ee6caa8d10d386b9df03d6a6352276c9f469b1 [15/22] spi: dt-bindings: ti,davinci-spi: Convert to DT schema
:::::: branch date: 34 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-2400-20261004 (https://download.01.org/0day-ci/archive/20261006/202610060824.ctw3AqH4-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 195c81658995a4b7531c30a12c5aef6cf2bbd671)
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610060824.ctw3AqH4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610060824.ctw3AqH4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/clocks/chipstmxptclk@2310164: failed to match any schema with compatible: ['ti,keystone,pll-divider-clock']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: chipstmxptclk@2310164 (ti,keystone,pll-divider-clock): bit-shift: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: chipstmxptclk@2310164 (ti,keystone,pll-divider-clock): bit-mask: b'\x00\x00\x00\x08' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/clocks/armpllclk@2620370: failed to match any schema with compatible: ['ti,keystone,pll-clock']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/clocks/mainpllclk@2310110: failed to match any schema with compatible: ['ti,keystone,main-pll-clock']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/clocks/papllclk@2620358: failed to match any schema with compatible: ['ti,keystone,pll-clock']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/clocks/ddr3apllclk@2620360: failed to match any schema with compatible: ['ti,keystone,pll-clock']
>> arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: spi@21000400 (ti,keystone-spi): Unevaluated properties are not allowed ('ti,davinci-spi-num-cs' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/ti,davinci-spi.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: spi@21000400 (ti,keystone-spi): ti,davinci-spi-num-cs: b'\x00\x00\x00\x05' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: spi@21000600 (ti,keystone-spi): Unevaluated properties are not allowed ('ti,davinci-spi-num-cs' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/ti,davinci-spi.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: spi@21000600 (ti,keystone-spi): ti,davinci-spi-num-cs: b'\x00\x00\x00\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: spi@21000800 (ti,keystone-spi): ti,davinci-spi-num-cs: b'\x00\x00\x00\x05' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: usb_phy@2620738 (ti,keystone-usbphy): '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
