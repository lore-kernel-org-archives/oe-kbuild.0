Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C831E32B9
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Aug 2025 05:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754805383; cv=none; b=ZlNI4m+TZXzdAZzGkv4BSlBN4T59zpQyWHxIRMeS+8/cgpTNfSmTaHUzhZ/djCNjKWUzGVmrniIpSLmnD2C71hA9QmzkOozM314V6bCtgjRkHmge2XnzKbSwahM5aokyuSF7ZzgL0DDJKOXRW27yV4y6DuQEYRjPfBE2vmFcU5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754805383; c=relaxed/simple;
	bh=WETNfmPD7Iu9i5h938RADXNG/Qihov4RpPLZ5mXeaV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eznfXqpWYKPQvbSdy+0ZEGWh8uxTgtcIHW7ie1Gmkf2T0gl2cFZLap9m9qOzrN03+e9w5QmZg17ihyY1aRPjyTs7gsf9QLP5dZx0F2Kr/4czl8B7bXk3wiRN9m9fKDTrGous397G25zoQ8wLVlM1mj8zFr1x6oXbfwgy+u63ejU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SgZ3Fr10; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SgZ3Fr10"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754805376; x=1786341376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WETNfmPD7Iu9i5h938RADXNG/Qihov4RpPLZ5mXeaV8=;
  b=SgZ3Fr10SpsyzNyg3DLPUpWj/lCcWsUEgD+dzpVJBZEgK5U2hvAdWzXC
   G+lkU1umo31Ike1GfNK4o01QPd9RKeIlM85oG/RdyUL7F3M3B5MeEu0B/
   VhinoZOqHR4ZM73OW9M0I4CHeLAd8hOWxqk1j2JmD00eEW9t6QpiaOXZX
   khFIBWJidMDKOM7idFcnhztOrezC7gBM8t/5KYqJ1Ud5YIT0HYBEt9VqY
   PTJ3/U/CoM1B5mihaqUjrPXa9GDd206168aSM9y6JCH7yLkqrufFAwB6m
   0myk4xamrGHtVzH96rerKt6CixLfSeB9xz+dRpHboWOiIEos/DcXT22pw
   A==;
X-CSE-ConnectionGUID: NtopbcSySPKJuEwOycyhhQ==
X-CSE-MsgGUID: djA16jK1TeGWWrc2yFQJAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="59704738"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="59704738"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 22:56:14 -0700
X-CSE-ConnectionGUID: CN2BXLioQTyi0EmWEBxqAA==
X-CSE-MsgGUID: XHzOt0wzSG+v92zTdVOPrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="202826750"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 09 Aug 2025 22:56:12 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukz2P-0005B9-2b;
	Sun, 10 Aug 2025 05:56:09 +0000
Date: Sun, 10 Aug 2025 13:55:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:asahi-wip 59/208]
 arch/arm64/boot/dts/apple/t6020-j474s.dtb: / (apple,j474s): compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202508101325.QQCo42ZB-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux asahi-wip
head:   0fcda52c969c6fe276e3f63f02438233ca592077
commit: 7e7b8ae212b035366de78f49b5e4387e1a0e81e1 [59/208] arm64: dts: apple: Add initial t602x device trees
:::::: branch date: 6 days ago
:::::: commit date: 13 days ago
config: arm64-randconfig-052-20250804 (https://download.01.org/0day-ci/archive/20250810/202508101325.QQCo42ZB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250810/202508101325.QQCo42ZB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508101325.QQCo42ZB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6021.dtsi:41.22-43.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:293.14-309.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:311.14-320.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:220.29-225.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:193.21-218.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@389c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:61.45-64.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmic@f/nvmem-layout/boot-error-count@6002: duplicate unit-address (also used in node /soc/spmi@29e114000/pmic@f/nvmem-layout/panic-count@6002)
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:13.10-24.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: / (apple,j474s): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,j474s' is not one of ['apple,j71', 'apple,j72', 'apple,j73', 'apple,j85', 'apple,j85m', 'apple,j86', 'apple,j86m', 'apple,j87', 'apple,j87m', 'apple,n51', 'apple,n53']
   	'apple,j474s' is not one of ['apple,j42d', 'apple,j96', 'apple,j97', 'apple,n56', 'apple,n61', 'apple,n102']
   	'apple,j474s' is not one of ['apple,j81', 'apple,j82']
   	'apple,j474s' is not one of ['apple,j71s', 'apple,j72s', 'apple,n66', 'apple,n69u', 'apple,n71']
   	'apple,j474s' is not one of ['apple,j71t', 'apple,j72t', 'apple,n66m', 'apple,n69', 'apple,n71m']
   	'apple,j474s' is not one of ['apple,j127', 'apple,j128', 'apple,j98a', 'apple,j99a']
   	'apple,j474s' is not one of ['apple,d10', 'apple,d11', 'apple,d101', 'apple,d111', 'apple,j71b', 'apple,j72b', 'apple,j171', 'apple,j172', 'apple,n112']
   	'apple,j474s' is not one of ['apple,j105a', 'apple,j120', 'apple,j121', 'apple,j207', 'apple,j208']
   	'apple,j474s' is not one of ['apple,j132', 'apple,j137', 'apple,j140a', 'apple,j140k', 'apple,j152f', 'apple,j160', 'apple,j174', 'apple,j185', 'apple,j185f', 'apple,j213', 'apple,j214k', 'apple,j215', 'apple,j223', 'apple,j230k', 'apple,j680', 'apple,j780']
   	'apple,j474s' is not one of ['apple,d20', 'apple,d21', 'apple,d22', 'apple,d201', 'apple,d211', 'apple,d221']
--
   	'apple,t6001' was expected
   	'apple,t6002' was expected
   	from schema $id: http://devicetree.org/schemas/arm/apple.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /: failed to match any schema with compatible: ['apple,j474s', 'apple,t6020', 'apple,arm-platform']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /: failed to match any schema with compatible: ['apple,j474s', 'apple,t6020', 'apple,arm-platform']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: clock-controller@28e03c000 (apple,t6020-nco): compatible:0: 'apple,t6020-nco' is not one of ['apple,t6000-nco', 'apple,t8103-nco', 'apple,t8112-nco']
   	from schema $id: http://devicetree.org/schemas/clock/apple,nco.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/clock-controller@28e03c000: failed to match any schema with compatible: ['apple,t6020-nco', 'apple,nco']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: interrupt-controller@28e100000 (apple,t6020-aic): compatible:0: 'apple,t6020-aic' is not one of ['apple,t8112-aic', 'apple,t6000-aic']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/apple,aic2.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/interrupt-controller@28e100000: failed to match any schema with compatible: ['apple,t6020-aic', 'apple,aic2']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: spmi@29e114000 (apple,t6020-spmi): compatible:0: 'apple,t6020-spmi' is not one of ['apple,t8103-spmi', 'apple,t6000-spmi', 'apple,t8112-spmi']
   	from schema $id: http://devicetree.org/schemas/spmi/apple,spmi.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: spmi@29e114000 (apple,t6020-spmi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/apple,spmi.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/spmi@29e114000: failed to match any schema with compatible: ['apple,t6020-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: watchdog@29e2c4000 (apple,t6020-wdt): compatible:0: 'apple,t6020-wdt' is not one of ['apple,s5l8960x-wdt', 'apple,t7000-wdt', 'apple,s8000-wdt', 'apple,t8010-wdt', 'apple,t8015-wdt', 'apple,t8103-wdt', 'apple,t8112-wdt', 'apple,t6000-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: watchdog@29e2c4000 (apple,t6020-wdt): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/watchdog@29e2c4000: failed to match any schema with compatible: ['apple,t6020-wdt', 'apple,wdt']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: mbox@2a2408000 (apple,t6020-asc-mailbox): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: pinctrl@2a2820000 (apple,t6020-pinctrl): compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@389304000 (apple,t6020-dart): 'apple,dma-range' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@389304000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@389304000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@389304000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@38930c000 (apple,t6020-dart): 'apple,dma-range' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@38930c000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@38930c000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@38930c000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: mbox@389c08000 (apple,t6020-asc-mailbox): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mbox@389c08000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@39b008000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@39b008000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: pwm@39b030000 (apple,t6020-fpwm): compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b040000 (apple,t6020-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/i2c@39b040000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b044000 (apple,t6020-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/i2c@39b044000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: codec@38 (ti,sn012776): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b048000 (apple,t6020-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: codec@4b (cirrus,cs42l84): 'sound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/i2c@39b050000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/i2c@39b054000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: spi@39b104000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: spi@39b104000 (apple,t6020-spi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: spi@39b108000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/spi@39b108000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: spi@39b110000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/spi@39b110000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: dma-controller@39b400000 (apple,t6020-admac): compatible:0: 'apple,t6020-admac' is not one of ['apple,t6000-admac', 'apple,t8103-admac', 'apple,t8112-admac']
   	from schema $id: http://devicetree.org/schemas/dma/apple,admac.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/dma-controller@39b400000: failed to match any schema with compatible: ['apple,t6020-admac', 'apple,admac']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: mca@39b600000 (apple,t6020-mca): compatible:0: 'apple,t6020-mca' is not one of ['apple,t6000-mca', 'apple,t8103-mca', 'apple,t8112-mca']
   	from schema $id: http://devicetree.org/schemas/sound/apple,mca.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: mca@39b600000 (apple,t6020-mca): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/apple,mca.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mca@39b600000: failed to match any schema with compatible: ['apple,t6020-mca', 'apple,mca']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@404e80000 (apple,t6021-pmgr): power-controller@0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@404e80000 (apple,t6021-pmgr): power-controller@100:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@404e80000 (apple,t6021-pmgr): power-controller@108:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@404e80000 (apple,t6021-pmgr): compatible:0: 'apple,t6021-pmgr' is not one of ['apple,s5l8960x-pmgr', 'apple,t7000-pmgr', 'apple,s8000-pmgr', 'apple,t8010-pmgr', 'apple,t8015-pmgr', 'apple,t8103-pmgr', 'apple,t8112-pmgr', 'apple,t6000-pmgr']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@404e80000: failed to match any schema with compatible: ['apple,t6021-pmgr', 'apple,pmgr', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@404e80000/power-controller@0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@100 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@404e80000/power-controller@100: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@108 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@404e80000/power-controller@108: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/gpu@406400000: failed to match any schema with compatible: ['apple,agx-t6020', 'apple,agx-g14x']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/gpu@406400000: failed to match any schema with compatible: ['apple,agx-t6020', 'apple,agx-g14x']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: mbox@406408000 (apple,t6020-asc-mailbox): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mbox@406408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: pcie@580000000 (apple,t6020-pcie): reg: [[5, 2147483648, 0, 16777216], [5, 2432696320, 0, 16384], [5, 2483060736, 0, 16384], [5, 2499837952, 0, 16384], [5, 2516615168, 0, 16384], [5, 2533392384, 0, 16384], [5, 2650849280, 0, 16384], [5, 2650865664, 0, 16384], [5, 2650882048, 0, 16384], [5, 2650898432, 0, 16384], [5, 2483142656, 0, 4096], [5, 2499919872, 0, 4096], [5, 2516697088, 0, 4096], [5, 2533474304, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: pcie@580000000 (apple,t6020-pcie): reg-names: ['config', 'rc', 'port0', 'port1', 'port2', 'port3', 'phy0', 'phy1', 'phy2', 'phy3', 'ltssm0', 'ltssm1', 'ltssm2', 'ltssm3'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: pcie@580000000 (apple,t6020-pcie): Unevaluated properties are not allowed ('dma-coherent', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@594000000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@594000000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@594000000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@595000000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@595000000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
--
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@596000000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@596000000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@596000000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@597000000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@597000000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@597000000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: cpufreq@210e20000 (apple,t6020-cluster-cpufreq): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6020-cluster-cpufreq', 'apple,t8112-cluster-cpufreq', 'apple,cluster-cpufreq'] is too long
   	'apple,t6020-cluster-cpufreq' is not one of ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   	'apple,t6020-cluster-cpufreq' is not one of ['apple,s8000-cluster-cpufreq', 'apple,t8010-cluster-cpufreq', 'apple,t8015-cluster-cpufreq', 'apple,t6000-cluster-cpufreq']
   	'apple,t7000-cluster-cpufreq' was expected
   	'apple,s5l8960x-cluster-cpufreq' was expected
   	'apple,cluster-cpufreq' was expected
   	'apple,t8103-cluster-cpufreq' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/cpufreq@210e20000: failed to match any schema with compatible: ['apple,t6020-cluster-cpufreq', 'apple,t8112-cluster-cpufreq', 'apple,cluster-cpufreq']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: cpufreq@211e20000 (apple,t6020-cluster-cpufreq): compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@178:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@180:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@188:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@190:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@198:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@1a0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@1a8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@1b0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@1b8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@1d0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@1e8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@1f0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@1f8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@200:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@208:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@210:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@218:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@220:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
--
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@280:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@288:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@290:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@298:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@2a0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@2a8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@2b0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@2b8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@2c0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@2c8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@2d0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@2d8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@2e0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@2e8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@2f0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@2f8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@300:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@308:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@310:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@318:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@28e080000 (apple,t6020-pmgr): power-controller@320:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
--
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@188: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@190 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@190: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@198 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@198: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@1a0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@1a0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@1a8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@1a8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@1b0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@1b0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@1b8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@1b8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@1d0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@1d0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@1e8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@1e8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@1f0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@1f0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@1f8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@1f8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@200 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@200: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@208 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@208: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@210 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
--
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@280: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@288 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@288: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@290 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@290: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@298 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@298: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@2a0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@2a0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@2a8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@2a8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@2b0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@2b0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@2b8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@2b8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@2c0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@2c0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@2c8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@2c8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@2d0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@2d0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@2d8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@2d8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@2e0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@2e0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@2e8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@2e8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@2f0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@2f0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@2f8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@2f8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@300 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@300: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@308 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@28e080000/power-controller@308: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@310 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
--
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@178:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@180:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@188:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@190:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@198:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@1a0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@1a8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@1b0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@1b8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@1c0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@1c8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@1d0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@1d8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@1e0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@1e8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@1f0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@1f8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@200:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@208:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@210:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
--
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@268:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@270:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@278:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@280:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@288:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@2d8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@2e0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@2e8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@2f0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@2f8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@300:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@308:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@310:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@318:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@320:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
--
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@380:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@388:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@390:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@398:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@3a0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@3a8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@3b0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@3b8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@3c0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@3c8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@3d0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@3d8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@3e0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@3e8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@3f0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@3f8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@408:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@410:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@418:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@420:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@428:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
--
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@8000:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@8008:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@8010:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@8018:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@8020:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): power-controller@c000:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@290280000 (apple,t6020-pmgr): compatible:0: 'apple,t6020-pmgr' is not one of ['apple,s5l8960x-pmgr', 'apple,t7000-pmgr', 'apple,s8000-pmgr', 'apple,t8010-pmgr', 'apple,t8015-pmgr', 'apple,t8103-pmgr', 'apple,t8112-pmgr', 'apple,t6000-pmgr']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000: failed to match any schema with compatible: ['apple,t6020-pmgr', 'apple,pmgr', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@100 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@100: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@108 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@108: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
--
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@188: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@190 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@190: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@198 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@198: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@1a0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@1a0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@1a8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@1a8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@1b0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@1b0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@1b8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@1b8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@1c0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@1c0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@1c8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@1c8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@1d0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@1d0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@1d8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@1d8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@1e0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@1e0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@1e8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@1e8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@1f0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@1f0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@1f8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@1f8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@200 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@200: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@208 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@208: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@210 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
--
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@270: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@278 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@278: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@280 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@280: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@288 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@288: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@2d8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@2d8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@2e0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@2e0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@2e8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@2e8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@2f0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@2f0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@2f8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@2f8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@300 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@300: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@308 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@308: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@310 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
--
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@380: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@388 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@388: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@390 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@390: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@398 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@398: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@3a0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@3a0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@3a8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@3a8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@3b0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@3b0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@3b8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@3b8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@3c0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@3c0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@3c8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@3c8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@3d0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@3d0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@3d8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@3d8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@3e0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@3e0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@3e8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@3e8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@3f0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@3f0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@3f8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@3f8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@408 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@408: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@410 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@410: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@418 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@418: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@420 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@420: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@428 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@428: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@c00 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@c00: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@4000 (apple,t6020-pmgr-pwrstate): 'apple,force-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@4000 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@4000: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@4008 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@4008: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
--
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@8010: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@8018 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@8018: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@8020 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@8020: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@c000 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@290280000/power-controller@c000: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@29e280000 (apple,t6000-pmgr): power-controller@58:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@29e280000 (apple,t6000-pmgr): power-controller@60:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@29e280000 (apple,t6000-pmgr): power-controller@68:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@29e280000 (apple,t6000-pmgr): power-controller@70:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@29e280000 (apple,t6000-pmgr): power-controller@78:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@29e280000 (apple,t6000-pmgr): power-controller@80:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@29e280000 (apple,t6000-pmgr): power-controller@88:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@29e280000 (apple,t6000-pmgr): power-controller@90:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@29e280000 (apple,t6000-pmgr): power-controller@98:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@29e280000 (apple,t6000-pmgr): power-controller@a0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@29e280000 (apple,t6000-pmgr): power-controller@a8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@29e280000 (apple,t6000-pmgr): power-controller@b0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@29e280000 (apple,t6000-pmgr): power-controller@b8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@29e280000 (apple,t6000-pmgr): power-controller@c0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@29e280000 (apple,t6000-pmgr): power-controller@c8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@29e280000 (apple,t6000-pmgr): power-controller@d0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@29e280000 (apple,t6000-pmgr): power-controller@d8:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-management@29e280000 (apple,t6000-pmgr): power-controller@e0:compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@58 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@29e280000/power-controller@58: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@60 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@29e280000/power-controller@60: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@68 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@29e280000/power-controller@68: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
--
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@29e280000/power-controller@88: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@90 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@29e280000/power-controller@90: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@98 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@29e280000/power-controller@98: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@a0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@29e280000/power-controller@a0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@a8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@29e280000/power-controller@a8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@b0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@29e280000/power-controller@b0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@b8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@29e280000/power-controller@b8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@c0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@29e280000/power-controller@c0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@c8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@29e280000/power-controller@c8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@d0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@29e280000/power-controller@d0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@d8 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@29e280000/power-controller@d8: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: power-controller@e0 (apple,t6020-pmgr-pwrstate): compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,s5l8960x-pmgr-pwrstate', 'apple,t7000-pmgr-pwrstate', 'apple,s8000-pmgr-pwrstate', 'apple,t8010-pmgr-pwrstate', 'apple,t8015-pmgr-pwrstate', 'apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/power-management@29e280000/power-controller@e0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: efuse@29e2cc000 (apple,t6020-efuses): compatible:0: 'apple,t6020-efuses' is not one of ['apple,t8103-efuses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: efuse@29e2cc000 (apple,t6020-efuses): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/efuse@29e2cc000: failed to match any schema with compatible: ['apple,t6020-efuses', 'apple,efuses']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: pinctrl@2a6820000 (apple,t6020-pinctrl): compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/pinctrl@2a6820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: pinctrl@39b028000 (apple,t6020-pinctrl): compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@702f00000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@702f00000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@702f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@702f80000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@702f80000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@702f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: usb@702280000 (apple,t6020-dwc3): iommus: [[163, 0], [164, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: usb@702280000 (apple,t6020-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@b02f00000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@b02f00000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@b02f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@b02f80000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@b02f80000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@b02f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: usb@b02280000 (apple,t6020-dwc3): iommus: [[169, 0], [170, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: usb@b02280000 (apple,t6020-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@f02f00000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@f02f00000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@f02f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@f02f80000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@f02f80000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@f02f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: usb@f02280000 (apple,t6020-dwc3): iommus: [[175, 0], [176, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: usb@f02280000 (apple,t6020-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@1302f00000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@1302f00000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@1302f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@1302f80000 (apple,t6020-dart): compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@1302f80000 (apple,t6020-dart): compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@1302f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: usb@1302280000 (apple,t6020-dwc3): iommus: [[181, 0], [182, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: usb@1302280000 (apple,t6020-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: mbox@347408000 (apple,t6020-asc-mailbox): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mbox@347408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: sart@34bc50000 (apple,t6020-sart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6020-sart', 'apple,t6000-sart'] is too long
   	'apple,t8112-sart' was expected
   	'apple,t6020-sart' is not one of ['apple,t6000-sart', 'apple,t8103-sart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,sart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/sart@34bc50000: failed to match any schema with compatible: ['apple,t6020-sart', 'apple,t6000-sart']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: nvme@34bcc0000 (apple,t6020-nvme-ans2): compatible:0: 'apple,t6020-nvme-ans2' is not one of ['apple,t8103-nvme-ans2', 'apple,t8112-nvme-ans2', 'apple,t6000-nvme-ans2']
   	from schema $id: http://devicetree.org/schemas/nvme/apple,nvme-ans.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/nvme@34bcc0000: failed to match any schema with compatible: ['apple,t6020-nvme-ans2', 'apple,nvme-ans2']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: aliases: 'disp0_piodma' does not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
