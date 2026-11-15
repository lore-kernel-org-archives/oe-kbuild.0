Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794718882;
	b=kdz7tnoVkgL+/9PPC3FxU7IkDhNhKBuw3sexCnTvifa55OX8uEuIx03MUtIerXlYlji9
	 ReSJMWdp923f8YXbsiHDOargwHAp0vaoUF3oCD2/Pr7m5w3g/Tsm6tGEVxagyJBRNPDYM
	 SBwrcjZLrrLjwOhcaip13hUmWIWwdoe2UG9OAy7LU49hahqykeXwjmPJjhobnEMJRDoCh
	 XE3Up7waRZr1TCFyWk6OcDmrijA1InU0nVTlq1pPo0QQ6mcKlA1SVwO1zkBzC1H8Nxaeg
	 B+ZkSung1Kys3dC+2dV7XPlatTOw2Nspy9ugsVFh/IbZQu9FkP8RQTVBESnbbZgIHPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794718882;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6oOxc/IZISbW0QmOrdTFkFuyBBrEGvN/V32p67rqCd0=;
	b=N57bLPSu8puLtXsWyZEkrmP5+C2h6kA3ONruPZvdiBYZTc0Vr7ppZbFoY/xerbPVAT21
	 QkbXe3r3IfrCi5ekl4T7AINdSofFCBZUehiSzu8kpr3mGxQAcyaN3JdnF7fo8Smm4J4Lb
	 mqsKfLmOBGJgu+sYt4+v98yrgYVqWlJsGglOxtfjqUQ6oQv1bcMa1Joh5SzrfoyBmFnbp
	 dt9jE4pO0vodZRVcW/Xr4Gg1RLKoUzgqiDmsJRGIzYFGVBaODq+bE1p92Q7fq/3qgotDT
	 ScZSwR3kY5vYW4j3gZ65SbccjrYC5WhYk+GnBcVx087lA9g7z5Ioulp9JOMWNadDyWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EhKfCm8f;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A0A606A323
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 05:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5A0A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EhKfCm8f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794718881; x=1826254881;
  h=date:from:to:cc:subject:message-id;
  bh=RWNRBRnx5padVKLGqYfga3Ctoa3RyJ5ANjKL70CFlo4=;
  b=EhKfCm8f/4EXm7D/Aeq/yTeexq6bbuapirmzGeZuFcMhAJn2z0xm7j7L
   OzegVrCGzhecImhc4sfVJvC3thjB78IMQMpnMLjDU5tXZpWVoh2tzTZx4
   o60Xdlq7odgpEVIxeb7z7ICLPque8abXa9ppuq+VeW5uO5jFpv9Wwgs50
   g8RjHlJEBcMHQpjwNHOevLYvHlpOYxGl/3j5S9OQHC9OxMmNgNbcPHePb
   hNhifmRKudOZ8aK3qGP4znKsgiEsocH7FYzer4gAJu39fowx6tM+XVQT8
   9Pmuh/HM1lzGm6QoU1yanfdlcjopCFBQoZJMn0RBTP2K/TZ/XJnCRmvS7
   Q==;
X-CSE-ConnectionGUID: Z/GQes7bRkOAmPGqlskrRw==
X-CSE-MsgGUID: c3vxBMb2SrmJbasjd2VdYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3560105"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3560105"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 21:01:20 -0800
X-CSE-ConnectionGUID: Tgs6tvIvRl6icZ3Uzyofyw==
X-CSE-MsgGUID: pvSGqpddTXmo08cRiYke5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9265819"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 14 Nov 2026 21:01:17 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSSMb-0000000020k-0cKl;
	Sun, 15 Nov 2026 05:01:13 +0000
Date: Sun, 15 Nov 2026 06:00:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broadcom-stblinux:next 8/20]
 arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: pcie@1,0:
 wifi@0,0:compatible: ['brcm,bcm4366-fmac', 'brcm,bcm4329-fmac'] does not
 contain items matching the given schema
Message-ID: <202611150558.iw7LNO4Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Rosen Penev <rosenp@gmail.com>
CC: Florian Fainelli <florian.fainelli@broadcom.com>

tree:   https://github.com/Broadcom/stblinux next
head:   baee4911ea1585a67297d422ffb89d489543d6c8
commit: 930cf618a52786d7ef09be787b2afe3d066ee8eb [8/20] ARM: dts: BCM5301X: EA9200: add Wi-Fi definitions
:::::: branch date: 25 hours ago
:::::: commit date: 6 days ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261115/202611150558.iw7LNO4Z-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611150558.iw7LNO4Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611150558.iw7LNO4Z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/broadcom/bcm5301x-nand-cs0.dtsi:10.18-19.5: Warning (avoid_unnecessary_addr_size): /nand-controller@18028000/nand@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/broadcom/bcm-ns.dtsi:24.28-47.4: Warning (unique_unit_address_if_enabled): /chipcommon-a-bus@18000000: duplicate unit-address (also used in node /axi@18000000)
   arch/arm/boot/dts/broadcom/bcm-ns.dtsi:377.22-382.4: Warning (unique_unit_address_if_enabled): /mdio@18003000: duplicate unit-address (also used in node /mdio-mux@18003000)
   arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: /axi@18000000: failed to match any schema with compatible: ['brcm,bus-axi']
>> arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: pcie@1,0: wifi@0,0:compatible: ['brcm,bcm4366-fmac', 'brcm,bcm4329-fmac'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: wifi@0,0 (brcm,bcm4366-fmac): Unevaluated properties are not allowed ('nvmem-cell-names', 'nvmem-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml
   arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: pcie@2,0: wifi@0,0:compatible: ['brcm,bcm4366-fmac', 'brcm,bcm4329-fmac'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: wifi@0,0 (brcm,bcm4366-fmac): Unevaluated properties are not allowed ('nvmem-cell-names', 'nvmem-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml
   arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: pcie@0: wifi@0,0:compatible: ['brcm,bcm4366-fmac', 'brcm,bcm4329-fmac'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: wifi@0,0 (brcm,bcm4366-fmac): Unevaluated properties are not allowed ('nvmem-cell-names', 'nvmem-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml
   arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: leds (gpio-leds): led-0:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'rfkill-none' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'gpio', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'rfkill-none' does not match '^cpu[0-9]*$'
   	'rfkill-none' does not match '^hci[0-9]+-power$'
   	'rfkill-none' does not match '^mmc[0-9]+$'
   	'rfkill-none' does not match '^phy[0-9]+(rx|tx)$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
