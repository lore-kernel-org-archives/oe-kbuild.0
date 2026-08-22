Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA292E2663
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Aug 2026 04:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787372756; cv=none; b=EUDWY5crnRY4Ue7G7C20rE1chKvr0/zmeDQquYqoyjB/vN7pFvloIqI4XGUATdBiu/93CQwFbVgrbXt0voQ8fcOqatCg6gt5h+1uERWtuxqACaHtVzrq9IxNG9PEywnuaKI6V4XE0hOLOiiUZVjANqlQSUfsOK22lLDbeVMxtnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787372756; c=relaxed/simple;
	bh=DEBphJvpbbG85vWPyFZcg1t3YEcKw2wZfaW4Hd+KPM4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TR/9eDIFG8iApmWurrHbz2z/o831ryMlFah9fMOJkEANlTnsIlEe8oNaFLPEYm4zCOAJ0rzCKw3JZRytTY4EA1N35UJmQWZGcZ/xTvJSoieUHe5WS5CKCzwJWZmDblv0osb55eIBb5KplAgysR739wbMZtaPGDu2Aq+mp39x83o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mIcFH7J8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mIcFH7J8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787372754; x=1818908754;
  h=date:from:to:cc:subject:message-id;
  bh=DEBphJvpbbG85vWPyFZcg1t3YEcKw2wZfaW4Hd+KPM4=;
  b=mIcFH7J87UKuGj/zOJuF7Fuzy7OVK67pXjXT9qLXStEbjp/oaL2QJLdh
   Dv+HTTVMjkmb/EaMo+g0vX59rNGbd0mBRyeOrTOQM453mFNWkG3qhdVN5
   ZbV8gb1uYV9owxXUSVNRGVrTD01iI4VhmvdHp8Fd84GYMEEGdiTug0QLn
   bm2jPqPch9cQuAfEDvrfYKgC7oreuDXs/0ivA65JCEwAwPae4KlW86Yj2
   VV+lpbNBUMb3Z2xcQYQEQSFsoP2lLQtn2XJnP8wHh9aNGk9cl33xQjsad
   IcHDu+qNn9yxNYDQtAoLDA8YTIUV4XI1hoq1WBTddz0H25zEolv3zdIZI
   Q==;
X-CSE-ConnectionGUID: bkbJlNJzTTifrZGgrmxI3Q==
X-CSE-MsgGUID: CYo9UmyoSyiD/QLW92j0gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="88121295"
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="88121295"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 21:25:54 -0700
X-CSE-ConnectionGUID: IEKF3K+eRBSC/HeEsNhOXw==
X-CSE-MsgGUID: zd+g2ceQQ+yApjSBrra56Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="270340687"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 21 Aug 2026 21:25:53 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxdIk-000000007ph-1Vzp;
	Sat, 22 Aug 2026 04:25:50 +0000
Date: Sat, 22 Aug 2026 06:25:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb:
 wireless-wlan: wifi-poweren-gpio: {'rockchip,pins': [[1, 22, 0, 26]],
 'phandle': 243} is not of type 'array'
Message-ID: <202608220652.wPIYBq3t-lkp@intel.com>
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
TO: Jiaxing Hu <huhuvmb88@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jiaxing-Hu/dt-bindings-arm-rockchip-Add-ArmSoM-CM5-and-CM5-IO/20260813-124253
head:   343c6aa89e4e534b652b6e40cbf608b16029fda2
commit: 343c6aa89e4e534b652b6e40cbf608b16029fda2 arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
date:   9 days ago
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2054-20260820 (https://download.01.org/0day-ci/archive/20260822/202608220652.wPIYBq3t-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608220652.wPIYBq3t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608220652.wPIYBq3t-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: wireless-wlan: wifi-poweren-gpio: {'rockchip,pins': [[1, 22, 0, 26]], 'phandle': 243} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: es8388@10 (everest,es8388): compatible: 'oneOf' conditional failed, one must be fixed:
   	['everest,es8388', 'everest,es8323'] is too long
   	'everest,es8388' is not one of ['everest,es8328']
   	'everest,es8328' was expected
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: fusb302@22 (fcs,fusb302): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: fusb302@22 (fcs,fusb302): connector:altmodes: '#address-cells', '#size-cells', 'altmode@0' do not match any of the regexes: '^(displayport)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: connector (usb-c-connector): altmodes: '#address-cells', '#size-cells', 'altmode@0' do not match any of the regexes: '^(displayport)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): 'snps,reset-gpio' is a dependency of 'snps,reset-delays-us'
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('mdio', 'phy-handle', 'phy-mode', 'power-domains', 'reg', 'reset-names', 'resets', 'rx-queues-config', 'snps,axi-config', 'snps,mixed-burst', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,reset-delays-us', 'snps,reset-gpios', 'snps,tso', 'stmmac-axi-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): 'snps,reset-gpio' is a dependency of 'snps,reset-delays-us'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: phy@2b010000 (rockchip,rk3576-usbdp-phy): 'svid' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/phy-rockchip-usbdp.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
