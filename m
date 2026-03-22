Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E249054774
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Mar 2026 03:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774151686; cv=none; b=KqZFGtHVUnfIqBT2A7Z9qWPUTV3DakvbBQ11MrBMX4bXaAbO1CI3ztlZU7+qIgw8QHBsSvTU5hdKDdw24teiwU/m7Zqtp7g9D6ARDvGq5Tba0DruCeFS77ubyhYBjP34y1lelMqQFQxvad5mCl62YSuLJWwfrq3oqmdPpCYsHXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774151686; c=relaxed/simple;
	bh=JuKJCrs9vWS3XFtHXMVMfrbgYJR4uj5Rum5FqkILmUo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G/4Rva1nqwAPIOtRQ5+hypOE7j+d1sWiKgtf8kHN9DP62r2RuGoUcNM4SIFQBU5SPSrdpQVzTkIDW9Ge4LOcua6BSwyKsKyMALfoto+1ew8p6EncMpE/FR42nrnFNnp5iX40L6g2KnfLaZ0p/nXFbjNEkgWgEk+5IUakk5zRLBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hni0esR8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hni0esR8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774151685; x=1805687685;
  h=date:from:to:cc:subject:message-id;
  bh=JuKJCrs9vWS3XFtHXMVMfrbgYJR4uj5Rum5FqkILmUo=;
  b=Hni0esR80/EyNZjVj/unXKOc4iEOD9kEpPccQltoZhoxYkhVLLK/iLlo
   3TqLeaneL068oiyqg3+cRJ7gSV4+MfybiuQKrAAUyAQbRbhiskQZ8qpP8
   zdkpYwFbEtONOZVwdLZG7VJxgCQ4CCMzXHxLJzXw3BRDv5Ouuz/wQFSMH
   GYhgvlCjbHpnl9B36a6XrZ5xnPcvciBq9kCj8uoQNWs5egFYgNJY1NffC
   lNDLDOXc1jtOh0X+KMqAUoI6NhHGwLen6kEYCLynTS0mnEFKaK2t0UtRP
   oyc15+a3HrPrdZX+rqJ/5B6hxiQjpd86/Gmsw1+Wk18n+7XVTyvPMuF+G
   g==;
X-CSE-ConnectionGUID: VuLtEFG/Ty+Gtah8LaYQ4g==
X-CSE-MsgGUID: LNIu1WnHTV6x7h+6uvvqxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="92571612"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="92571612"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 20:54:44 -0700
X-CSE-ConnectionGUID: KvV9xvJYTQWT40GnAHrdDQ==
X-CSE-MsgGUID: 6ylkch8fTG+vPtNx3OTCtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="223899920"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 21 Mar 2026 20:54:42 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w49th-000000006HF-0oPx;
	Sun, 22 Mar 2026 03:54:41 +0000
Date: Sun, 22 Mar 2026 04:54:07 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broadcom-stblinux:next 18/20]
 arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: leds (gpio-leds):
 led-0:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202603220433.1VGVAFUE-lkp@intel.com>
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
CC: Florian Fainelli <florian.fainelli@broadcom.com>

tree:   https://github.com/Broadcom/stblinux next
head:   d554d58339a136fb104ea2bf1fa18e08e2a5e880
commit: 1d0d588599345f761ba0da597c552675c6d2e14d [18/20] ARM: dts: BCM5301X: EA9200: add LEDs
:::::: branch date: 30 hours ago
:::::: commit date: 31 hours ago
config: arm-randconfig-2051-20260321 (https://download.01.org/0day-ci/archive/20260322/202603220433.1VGVAFUE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603220433.1VGVAFUE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603220433.1VGVAFUE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/broadcom/bcm5301x-nand-cs0.dtsi:10.18-19.5: Warning (avoid_unnecessary_addr_size): /nand-controller@18028000/nand@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/broadcom/bcm-ns.dtsi:24.28-47.4: Warning (unique_unit_address_if_enabled): /chipcommon-a-bus@18000000: duplicate unit-address (also used in node /axi@18000000)
   arch/arm/boot/dts/broadcom/bcm-ns.dtsi:377.22-382.4: Warning (unique_unit_address_if_enabled): /mdio@18003000: duplicate unit-address (also used in node /mdio-mux@18003000)
   arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: /axi@18000000: failed to match any schema with compatible: ['brcm,bus-axi']
   arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: leds (gpio-leds): led-0:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'rfkill-none' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'rfkill-none' does not match '^cpu[0-9]*$'
   	'rfkill-none' does not match '^hci[0-9]+-power$'
   	'rfkill-none' does not match '^mmc[0-9]+$'
   	'rfkill-none' does not match '^phy[0-9]+tx$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
