Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5952D8248C
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Dec 2024 08:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735200094; cv=none; b=H4gcBmBE1/e17Kq/kR4+EaY6rpl5CSVHc8L+n/zVAaZiIgK9ENEq1NWlevc6mTlLLh27LFU718JWGoZ/b/dGY7S7G2PSOGcNTR9uLO9tU6yVbItmb693ANr5qqyTGyM1AxK4dHut1JOb8RRHHLWaJCH8333y+lQhPuwwj5SszgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735200094; c=relaxed/simple;
	bh=o420GfX8tsMYAmLU7rRPuUZeyJQMjWIDy+dgN36eZIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LgfcVAkAOBhAz/2KVUvs8gFfRDny2tCnJtG3dM3kvJdG+Sww78PNjCoQX6hdTJg6Jd9GvjoS0mUzvXiMITNEYtZgbJoAPnvhO+ypIoOE9Um4WZEGzT3UsP4Di+EtMjKiOYoLYoZLCRj48wGcf/dbwryimizUAknpLuf679S0eiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mlYo1CIQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mlYo1CIQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735200093; x=1766736093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o420GfX8tsMYAmLU7rRPuUZeyJQMjWIDy+dgN36eZIQ=;
  b=mlYo1CIQWlQOhUfBQBpNdqc27C6KcJ0uSU25aky1mpP4PnplbVdLnBgw
   28m3CgHycnks6YGAk1FFe5lq4668rFHNJSbIBwY5nBQeR+qwAqWkR/jmx
   ORKsgxtuBviJD1PVH1ULl8ROZDD0tz23FsRI4pKpmTe31VGUqQmLzdcJY
   Q0aAVvFnH1T08tjENjir6+3zC+tA3XgZhsrN1JluT+NrUAURFwRqo5O//
   QJapTN7icuXoXfT+GisqHMamyr6qjzqAhpnb74pH3Gcwg6fEUpuYN2kwD
   vC9jyJuUWWE0f/u6Crh+eejbGZ2kgOV2psYLFPs3LKNmklD6FPpBftTXu
   Q==;
X-CSE-ConnectionGUID: gxpvKkWrRIufTQaCg4Qn+g==
X-CSE-MsgGUID: ZSsQQpluSD+cZ/z0DTX8fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35494553"
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="35494553"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 00:01:32 -0800
X-CSE-ConnectionGUID: UDDnCM69TROkp86grMn5FQ==
X-CSE-MsgGUID: M5cKPtytSHuob/rtoY49iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="100375945"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Dec 2024 00:00:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQinR-0002PS-2z;
	Thu, 26 Dec 2024 08:00:41 +0000
Date: Thu, 26 Dec 2024 15:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/ixp4xx-netgear-wgr826v 5/9]
 arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrt300nv2.dts:95.14-147.6:
 Warning (avoid_unnecessary_addr_size): /soc/bus@c4000000/flash@0,0:
 unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or
 child "reg" property
Message-ID: <202412261553.5OvMrnZs-lkp@intel.com>
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
:::::: branch date: 5 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-051-20241221 (https://download.01.org/0day-ci/archive/20241226/202412261553.5OvMrnZs-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412261553.5OvMrnZs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412261553.5OvMrnZs-lkp@intel.com/

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
