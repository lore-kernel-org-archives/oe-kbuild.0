Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126D73EA76
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Dec 2024 17:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735060465; cv=none; b=u9XLfnd4Ha08Qo6cec73/wQyZTjP1KRtPtEBq/zjr77NrTOMhtWt7BcTXC7BuS9dT5stuvGZOKS5gFYFwswjSwHVmzwUeNqMrnOnEpKCEEelMCOfRPGozdi+u1X5oAkABK2BASs0E0bqBEUteYW+K7WSwPbeUqwb0uEnVVcmMgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735060465; c=relaxed/simple;
	bh=UegvLxCcgP5q4cqWCh7F8yjJgx6UaFYaJdB0Jp/unxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GuTAl6U7Gk87JBZIP9+km7n0zepayuufQuFAJmWNsDJXu4Z28ENJwYTyKX80398Kwyqjtl1h2svDLkFxSZqzbLgafSQ7XPOVf50i0jbkHn9sMGrTWz/CNhT0K3VKZ+hXfk9MQ+WwGq1P3kDsHS9PbR4vex5M4UZQ0a5FsP+SVAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bt6yXwaL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bt6yXwaL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735060463; x=1766596463;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UegvLxCcgP5q4cqWCh7F8yjJgx6UaFYaJdB0Jp/unxI=;
  b=bt6yXwaLi3UhxDrZdlfESAaVCbqr5WP3yuMsqqxX++HTE5GNngkOeeGP
   QW6aHl8vI+mkDEVKWB7TUld6iTawJc6Eay+OVWTD2/tLZ4vaTdkxZo/i5
   rSsLvV/jfdKIsjRVBOF+HxGj0SqxewvGVHnfzpep+IdXWZBpl8UEsfbEr
   fXeVsm2pcXv/ShYqOA9msHYicVvt32RpCA7yRxRQHfB+fl0D4AUoi4NAM
   MxMVk41/kxEFHy4QdvGhjunb67kDnO2ckqrGAADEa19my+Dg5tm4d0irt
   S4U274FCx78dw2TTDXaXPz/COGDV2ztGhVw80yhQb1x+36sDRkbOUWnqN
   w==;
X-CSE-ConnectionGUID: u5wXpmLTRzWDIj0CYKZCxg==
X-CSE-MsgGUID: ptBE3NZeTcOxmiFD4yQ++Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35668715"
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="35668715"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 09:14:21 -0800
X-CSE-ConnectionGUID: Faa/yJohRAqJu07kpXo/nQ==
X-CSE-MsgGUID: kuzNv1g/S36qLLT4lm3qew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="99383271"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Dec 2024 09:14:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQ8U6-0001Jn-0e;
	Tue, 24 Dec 2024 17:14:18 +0000
Date: Wed, 25 Dec 2024 01:13:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/ixp4xx-netgear-wgr826v 5/9]
 arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrt300nv2.dts:95.14-147.6:
 Warning (avoid_unnecessary_addr_size): /soc/bus@c4000000/flash@0,0:
 unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or
 child "reg" property
Message-ID: <202412250111.aJJsfIWy-lkp@intel.com>
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
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/ixp4xx-netgear-wgr826v
head:   417131a0c509bba7b4db3f1301a0205ebb4ab0d6
commit: a7b37d39368dd3f19e6f288bd0d8954474d4ed55 [5/9] ARM: dts: Add Linksys WRT300N v2 Device Tree
:::::: branch date: 4 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-051-20241221 (https://download.01.org/0day-ci/archive/20241225/202412250111.aJJsfIWy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241225/202412250111.aJJsfIWy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412250111.aJJsfIWy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrt300nv2.dts:95.14-147.6: Warning (avoid_unnecessary_addr_size): /soc/bus@c4000000/flash@0,0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrt300nv2.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	'linksys,wrt300v2' is not one of ['adieng,coyote', 'arcom,vulcan', 'dlink,dsm-g600-a', 'freecom,fsg-3', 'gateway,7001', 'gateworks,gw2348', 'goramo,multilink-router', 'intel,ixdp425', 'intel,ixdpg425', 'iom,nas-100d', 'linksys,nslu2', 'linksys,wrt300nv2', 'linksys,wrv54g', 'netgear,wg302v1', 'netgear,wg302v2', 'netgear,wgr826v', 'usr,8200', 'welltech,epbx100', 'gemtek,gtwx5715']
   	'linksys,wrt300v2' is not one of ['gateworks,gw2358', 'intel,kixrp435']
   	'intel,ixp43x' was expected
   	from schema $id: http://devicetree.org/schemas/arm/intel-ixp4xx.yaml#
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrt300nv2.dtb: /: failed to match any schema with compatible: ['linksys,wrt300v2', 'intel,ixp42x']
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrt300nv2.dtb: ethernet@c8009000: 'fixed-link', 'nvmem-cell-names', 'nvmem-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/intel,ixp4xx-ethernet.yaml#
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrt300nv2.dtb: ethernet@c800a000: 'nvmem-cell-names', 'nvmem-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/intel,ixp4xx-ethernet.yaml#
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrt300nv2.dtb: ethernet@c800c000: 'intel,npe' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/intel,ixp4xx-ethernet.yaml#
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrt300nv2.dtb: /soc/usb@c800b000: failed to match any schema with compatible: ['intel,ixp4xx-udc']

vim +95 arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrt300nv2.dts

a7b37d39368dd3 Linus Walleij 2024-12-18  11  
a7b37d39368dd3 Linus Walleij 2024-12-18  12  / {
a7b37d39368dd3 Linus Walleij 2024-12-18  13  	model = "Linksys WRT300N v2";
a7b37d39368dd3 Linus Walleij 2024-12-18  14  	compatible = "linksys,wrt300v2", "intel,ixp42x";
a7b37d39368dd3 Linus Walleij 2024-12-18  15  	#address-cells = <1>;
a7b37d39368dd3 Linus Walleij 2024-12-18  16  	#size-cells = <1>;
a7b37d39368dd3 Linus Walleij 2024-12-18  17  
a7b37d39368dd3 Linus Walleij 2024-12-18  18  	memory@0 {
a7b37d39368dd3 Linus Walleij 2024-12-18  19  		/* 16 MB SDRAM */
a7b37d39368dd3 Linus Walleij 2024-12-18  20  		device_type = "memory";
a7b37d39368dd3 Linus Walleij 2024-12-18  21  		reg = <0x00000000 0x01000000>;
a7b37d39368dd3 Linus Walleij 2024-12-18  22  	};
a7b37d39368dd3 Linus Walleij 2024-12-18  23  
a7b37d39368dd3 Linus Walleij 2024-12-18  24  	chosen {
a7b37d39368dd3 Linus Walleij 2024-12-18  25  		bootargs = "console=ttyS0,115200n8";
a7b37d39368dd3 Linus Walleij 2024-12-18  26  		stdout-path = "uart1:115200n8";
a7b37d39368dd3 Linus Walleij 2024-12-18  27  	};
a7b37d39368dd3 Linus Walleij 2024-12-18  28  
a7b37d39368dd3 Linus Walleij 2024-12-18  29  	aliases {
a7b37d39368dd3 Linus Walleij 2024-12-18  30  		/* These are switched around */
a7b37d39368dd3 Linus Walleij 2024-12-18  31  		serial0 = &uart1;
a7b37d39368dd3 Linus Walleij 2024-12-18  32  		serial1 = &uart0;
a7b37d39368dd3 Linus Walleij 2024-12-18  33  	};
a7b37d39368dd3 Linus Walleij 2024-12-18  34  
a7b37d39368dd3 Linus Walleij 2024-12-18  35  	leds {
a7b37d39368dd3 Linus Walleij 2024-12-18  36  		compatible = "gpio-leds";
a7b37d39368dd3 Linus Walleij 2024-12-18  37  		led_power_amber: led-0 {
a7b37d39368dd3 Linus Walleij 2024-12-18  38  			color = <LED_COLOR_ID_AMBER>;
a7b37d39368dd3 Linus Walleij 2024-12-18  39  			function = LED_FUNCTION_POWER;
a7b37d39368dd3 Linus Walleij 2024-12-18  40  			gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
a7b37d39368dd3 Linus Walleij 2024-12-18  41  			default-state = "off";
a7b37d39368dd3 Linus Walleij 2024-12-18  42  		};
a7b37d39368dd3 Linus Walleij 2024-12-18  43  		led_power_green: led-1 {
a7b37d39368dd3 Linus Walleij 2024-12-18  44  			color = <LED_COLOR_ID_GREEN>;
a7b37d39368dd3 Linus Walleij 2024-12-18  45  			function = LED_FUNCTION_POWER;
a7b37d39368dd3 Linus Walleij 2024-12-18  46  			gpios = <&gpio0 1 GPIO_ACTIVE_LOW>;
a7b37d39368dd3 Linus Walleij 2024-12-18  47  			default-state = "on";
a7b37d39368dd3 Linus Walleij 2024-12-18  48  		};
a7b37d39368dd3 Linus Walleij 2024-12-18  49  		led_wlan_green: led-2 {
a7b37d39368dd3 Linus Walleij 2024-12-18  50  			color = <LED_COLOR_ID_GREEN>;
a7b37d39368dd3 Linus Walleij 2024-12-18  51  			function = LED_FUNCTION_WLAN;
a7b37d39368dd3 Linus Walleij 2024-12-18  52  			gpios = <&gpio0 2 GPIO_ACTIVE_LOW>;
a7b37d39368dd3 Linus Walleij 2024-12-18  53  			default-state = "off";
a7b37d39368dd3 Linus Walleij 2024-12-18  54  			linux,default-trigger = "phy0tx";
a7b37d39368dd3 Linus Walleij 2024-12-18  55  		};
a7b37d39368dd3 Linus Walleij 2024-12-18  56  		/* 3, 4 not used for LED */
a7b37d39368dd3 Linus Walleij 2024-12-18  57  		led_security_green: led-6 {
a7b37d39368dd3 Linus Walleij 2024-12-18  58  			color = <LED_COLOR_ID_GREEN>;
a7b37d39368dd3 Linus Walleij 2024-12-18  59  			function = LED_FUNCTION_WPS;
a7b37d39368dd3 Linus Walleij 2024-12-18  60  			gpios = <&gpio0 6 GPIO_ACTIVE_LOW>;
a7b37d39368dd3 Linus Walleij 2024-12-18  61  			default-state = "off";
a7b37d39368dd3 Linus Walleij 2024-12-18  62  		};
a7b37d39368dd3 Linus Walleij 2024-12-18  63  		led_security_amber: led-7 {
a7b37d39368dd3 Linus Walleij 2024-12-18  64  			color = <LED_COLOR_ID_AMBER>;
a7b37d39368dd3 Linus Walleij 2024-12-18  65  			function = LED_FUNCTION_WPS;
a7b37d39368dd3 Linus Walleij 2024-12-18  66  			gpios = <&gpio0 7 GPIO_ACTIVE_LOW>;
a7b37d39368dd3 Linus Walleij 2024-12-18  67  			default-state = "off";
a7b37d39368dd3 Linus Walleij 2024-12-18  68  		};
a7b37d39368dd3 Linus Walleij 2024-12-18  69  		/* 8, 9, 10, 11, 12, 13, 14, 15 not used for LED */
a7b37d39368dd3 Linus Walleij 2024-12-18  70  	};
a7b37d39368dd3 Linus Walleij 2024-12-18  71  
a7b37d39368dd3 Linus Walleij 2024-12-18  72  	gpio_keys {
a7b37d39368dd3 Linus Walleij 2024-12-18  73  		compatible = "gpio-keys";
a7b37d39368dd3 Linus Walleij 2024-12-18  74  
a7b37d39368dd3 Linus Walleij 2024-12-18  75  		button-reset {
a7b37d39368dd3 Linus Walleij 2024-12-18  76  			wakeup-source;
a7b37d39368dd3 Linus Walleij 2024-12-18  77  			linux,code = <KEY_RESTART>;
a7b37d39368dd3 Linus Walleij 2024-12-18  78  			label = "reset";
a7b37d39368dd3 Linus Walleij 2024-12-18  79  			gpios = <&gpio0 3 GPIO_ACTIVE_LOW>;
a7b37d39368dd3 Linus Walleij 2024-12-18  80  		};
a7b37d39368dd3 Linus Walleij 2024-12-18  81  		/*
a7b37d39368dd3 Linus Walleij 2024-12-18  82  		 * Turn on wireless security, I guess from way back when it
a7b37d39368dd3 Linus Walleij 2024-12-18  83  		 * wasn't compulsory.
a7b37d39368dd3 Linus Walleij 2024-12-18  84  		 */
a7b37d39368dd3 Linus Walleij 2024-12-18  85  		button-lock {
a7b37d39368dd3 Linus Walleij 2024-12-18  86  			wakeup-source;
a7b37d39368dd3 Linus Walleij 2024-12-18  87  			linux,code = <KEY_WLAN>;
a7b37d39368dd3 Linus Walleij 2024-12-18  88  			label = "lock";
a7b37d39368dd3 Linus Walleij 2024-12-18  89  			gpios = <&gpio0 4 GPIO_ACTIVE_LOW>;
a7b37d39368dd3 Linus Walleij 2024-12-18  90  		};
a7b37d39368dd3 Linus Walleij 2024-12-18  91  	};
a7b37d39368dd3 Linus Walleij 2024-12-18  92  
a7b37d39368dd3 Linus Walleij 2024-12-18  93  	soc {
a7b37d39368dd3 Linus Walleij 2024-12-18  94  		bus@c4000000 {
a7b37d39368dd3 Linus Walleij 2024-12-18 @95  			flash@0,0 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
