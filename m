Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731C0158A25
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jul 2024 14:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720535556; cv=none; b=gewomIbe7ojxcpRHN4L81yz0O/orOLqPztNSLODKCN67rVHGLpBRyvP4TygBLthMzI2kJHWRducxhVdVadHEyNzGzBrzhKFH7FocykFso6icR6oy6yWDnaFULgQCW9fJIIlI4FHGe8zINa3cGLTDWTl3JHBm0XcIgpOW1gafNLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720535556; c=relaxed/simple;
	bh=06emTu/T/AwaawrqQKjy/KhhdYUa1Jpo5MAmrwP00iw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pOnq6xCyU3lkC+BuNcIVNBlAELdkfdIKBul9jyi36ZsdAUB3od60m9205eC9WSlZEGaK84He3aZs8P2NF/Ff67uQFDek6aTUau0E1cW3NSB8AhzGNGDx0J3zJmWzTk/R8mAEV5fNTpR0KriWWC4os7zkZMqIiVN2004uGzHAJXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fRspfVUD; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fRspfVUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720535554; x=1752071554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=06emTu/T/AwaawrqQKjy/KhhdYUa1Jpo5MAmrwP00iw=;
  b=fRspfVUDV9RYM69ljjQ36iiUc/MfwY/f2oHfMqXXURrHB93emCP4bSfn
   k/2yXaUf4zOOKdqXph2fjfjIskqxPM+8fT0hksG+cdH51WwD1dTPtbAAK
   Em/V0bEZ5ZXE+vhbeen3jTFQJt7PfTgaKRqQlagaE4jTQ0d2H1m1fh4uo
   xJfILN8YuOHXbY7EbiWXOWi/sGviCUiDNeuytTj48BilRvktqFsg/jaoz
   lXg62rjZ08ygLpebAHAXjEYc3GbzbP5rzyPIuf1K4KhcHiN79XSx6ToIK
   CyGTndbSFBcNUAwV3n30YK07EQq+rVjM1lEKHpz0JF2pdk9ZEjWrojWPQ
   A==;
X-CSE-ConnectionGUID: LlsevAN6SICDyAbKbkxvcQ==
X-CSE-MsgGUID: dqLTEcbRRRWsU7brDAsDwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="12453750"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="12453750"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 07:32:34 -0700
X-CSE-ConnectionGUID: 64h1C43GSeCSX5KHNAsG3A==
X-CSE-MsgGUID: Fq9CTUL4Q+iu8F8b0f98Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="48319345"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Jul 2024 07:32:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRBtN-000Wl8-3B;
	Tue, 09 Jul 2024 14:32:29 +0000
Date: Tue, 9 Jul 2024 22:32:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [brgl:gpio/for-next 13/39] arch/powerpc/boot/dts/mpc8308_p1m.dtb:
 gpio@c00: compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202407092214.C5XQz670-lkp@intel.com>
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
CC: linux-gpio@vger.kernel.org
TO: Frank Li <Frank.Li@nxp.com>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   337049890b8cbbb4fb527c58976ea19f4dc747a0
commit: 77e1ea9e9913df8c23ac102c9c2b7c49a5d224da [13/39] dt-bindings: gpio: mpc8xxx: Convert to yaml format
:::::: branch date: 3 hours ago
:::::: commit date: 5 weeks ago
config: powerpc-randconfig-051-20240708 (https://download.01.org/0day-ci/archive/20240709/202407092214.C5XQz670-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407092214.C5XQz670-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407092214.C5XQz670-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: serial@4600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/mpc8308_p1m.dtb: gpio@c00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8308-gpio', 'fsl,mpc8349-gpio'] is too long
   	'fsl,mpc8308-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,mpc8308-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: /immr@e0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc8308-gpio', 'fsl,mpc8349-gpio']
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: /immr@e0000000/timer@500: failed to match any schema with compatible: ['fsl,mpc8308-gtm', 'fsl,gtm']
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: /immr@e0000000/timer@500: failed to match any schema with compatible: ['fsl,mpc8308-gtm', 'fsl,gtm']
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: /immr@e0000000/interrupt-controller@700: failed to match any schema with compatible: ['fsl,ipic']
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: /immr@e0000000/ipic-msi@7c0: failed to match any schema with compatible: ['fsl,ipic-msi']
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc8308rdb.dtb: serial@4600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/mpc8308rdb.dtb: gpio@c00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8308-gpio', 'fsl,mpc8349-gpio'] is too long
   	'fsl,mpc8308-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,mpc8308-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/mpc8308rdb.dtb: gpio@c00: 'device_type' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/mpc8308rdb.dtb: /immr@e0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc8308-gpio', 'fsl,mpc8349-gpio']
   arch/powerpc/boot/dts/mpc8308rdb.dtb: /immr@e0000000/interrupt-controller@700: failed to match any schema with compatible: ['fsl,ipic']
   arch/powerpc/boot/dts/mpc8308rdb.dtb: /immr@e0000000/ipic-msi@7c0: failed to match any schema with compatible: ['fsl,ipic-msi']
   arch/powerpc/boot/dts/mpc8308rdb.dtb: /immr@e0000000/dma@2c000: failed to match any schema with compatible: ['fsl,mpc8308-dma']
   arch/powerpc/boot/dts/mpc8308rdb.dtb: /pcie@e0009000: failed to match any schema with compatible: ['fsl,mpc8308-pcie', 'fsl,mpc8314-pcie']
   arch/powerpc/boot/dts/mpc8308rdb.dtb: /pcie@e0009000: failed to match any schema with compatible: ['fsl,mpc8308-pcie', 'fsl,mpc8314-pcie']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: localbus@e0005000: flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8377-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8377-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8377-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8377-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: immr@e0000000: $nodename:0: 'immr@e0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/wdt@200: failed to match any schema with compatible: ['mpc83xx_wdt']
>> arch/powerpc/boot/dts/mpc8377_rdb.dtb: gpio-controller@c00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8377-gpio', 'fsl,mpc8349-gpio'] is too long
   	'fsl,mpc8377-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,mpc8377-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/gpio-controller@c00: failed to match any schema with compatible: ['fsl,mpc8377-gpio', 'fsl,mpc8349-gpio']
>> arch/powerpc/boot/dts/mpc8377_rdb.dtb: gpio-controller@d00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8377-gpio', 'fsl,mpc8349-gpio'] is too long
   	'fsl,mpc8377-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,mpc8377-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/gpio-controller@d00: failed to match any schema with compatible: ['fsl,mpc8377-gpio', 'fsl,mpc8349-gpio']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: sleep-nexus: $nodename:0: 'sleep-nexus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
--
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /: failed to match any schema with compatible: ['fsl,mpc8377wlan']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: localbus@e0005000: flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8377-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8377-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: immr@e0000000: $nodename:0: 'immr@e0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/wdt@200: failed to match any schema with compatible: ['mpc83xx_wdt']
>> arch/powerpc/boot/dts/mpc8377_wlan.dtb: gpio-controller@c00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8377-gpio', 'fsl,mpc8349-gpio'] is too long
   	'fsl,mpc8377-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,mpc8377-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/gpio-controller@c00: failed to match any schema with compatible: ['fsl,mpc8377-gpio', 'fsl,mpc8349-gpio']
>> arch/powerpc/boot/dts/mpc8377_wlan.dtb: gpio-controller@d00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8377-gpio', 'fsl,mpc8349-gpio'] is too long
   	'fsl,mpc8377-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,mpc8377-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/gpio-controller@d00: failed to match any schema with compatible: ['fsl,mpc8377-gpio', 'fsl,mpc8349-gpio']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: sleep-nexus: $nodename:0: 'sleep-nexus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: localbus@e0005000: flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8378-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8378-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8378-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8378-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: immr@e0000000: $nodename:0: 'immr@e0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /immr@e0000000/wdt@200: failed to match any schema with compatible: ['mpc83xx_wdt']
>> arch/powerpc/boot/dts/mpc8378_rdb.dtb: gpio-controller@c00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8378-gpio', 'fsl,mpc8349-gpio'] is too long
   	'fsl,mpc8378-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,mpc8378-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /immr@e0000000/gpio-controller@c00: failed to match any schema with compatible: ['fsl,mpc8378-gpio', 'fsl,mpc8349-gpio']
>> arch/powerpc/boot/dts/mpc8378_rdb.dtb: gpio-controller@d00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8378-gpio', 'fsl,mpc8349-gpio'] is too long
   	'fsl,mpc8378-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,mpc8378-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /immr@e0000000/gpio-controller@d00: failed to match any schema with compatible: ['fsl,mpc8378-gpio', 'fsl,mpc8349-gpio']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: sleep-nexus: $nodename:0: 'sleep-nexus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: localbus@e0005000: flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8379-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8379-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8379-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8379-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: immr@e0000000: $nodename:0: 'immr@e0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/wdt@200: failed to match any schema with compatible: ['mpc83xx_wdt']
>> arch/powerpc/boot/dts/mpc8379_rdb.dtb: gpio-controller@c00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8379-gpio', 'fsl,mpc8349-gpio'] is too long
   	'fsl,mpc8379-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,mpc8379-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/gpio-controller@c00: failed to match any schema with compatible: ['fsl,mpc8379-gpio', 'fsl,mpc8349-gpio']
>> arch/powerpc/boot/dts/mpc8379_rdb.dtb: gpio-controller@d00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8379-gpio', 'fsl,mpc8349-gpio'] is too long
   	'fsl,mpc8379-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,mpc8379-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/gpio-controller@d00: failed to match any schema with compatible: ['fsl,mpc8379-gpio', 'fsl,mpc8349-gpio']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: sleep-nexus: $nodename:0: 'sleep-nexus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
