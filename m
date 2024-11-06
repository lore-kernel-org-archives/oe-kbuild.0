Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2A21370
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Nov 2024 00:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730852277; cv=none; b=a00JJ6Tj+vSEusFUyFG/5YLHblzBbuNdTBR9kOfs9hpdd2RGz6dJkNYYwPv18tXt5H/HFNh32Lu7PlJKuax0MVoPx476YEp68q8IfAJ7dsFWSBviS+NLGP0v0ndn5Gm4+chjdqcGROmLYY4y4kU21kYMTcSfd4H7OHmGxHPJSSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730852277; c=relaxed/simple;
	bh=OK/81o8gY2GsZPa5e9UtqYLgQo0rDwNx1YYPf6ycOBo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eqtDJg1vaEA2FqW5djKc1vH4Ex+1pKiB98jEIuCnxM4hjMT7lNqYe3Expx/aF293IijFX84zU/xAFcu76a+tyuo81K7zgUBLIgFZ0hjdEe7iKxySRin825rlYYl/tzzjaIWnh8IhzHU3bVTnrNSAgUUMOQL5yVLhZRidpT6NQyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjhxSd5F; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjhxSd5F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730852273; x=1762388273;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OK/81o8gY2GsZPa5e9UtqYLgQo0rDwNx1YYPf6ycOBo=;
  b=UjhxSd5FMmRTHOfwtvO0W6hS2gQM6ETZ8shZtTAFhTRXI1BGGiOhMCRr
   O/6e5Vb6hQwcYqMXhLgY38WddtV+IrVhUMTlY8E8up74cXxeLzSLRCLs7
   EidKpEcUX4ligz+esY/kxCp2x7OO0D42l2SktyycesLsrDAp9ZbUmUB7G
   fcuqbkeDyYRi0vcJRA3bDcWnbQhP8pZieDEcZCEXJJrD3/5+bmrAaI6tT
   vY6hhns5vuZWKN608oWWbFk9K8y4Moh5TFgxA0eevICuyZXcQ8Uysv2aa
   pjsN/7Hqe/54ZLpdtfLAV7diUfHJ4NXz5p6tJjvNaJTY6shv7OipUUFX9
   w==;
X-CSE-ConnectionGUID: GVkg1OA6ShCp5iisi8CKbQ==
X-CSE-MsgGUID: 9XuzcAmKScOjiM/CHCraGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30792285"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30792285"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 16:17:53 -0800
X-CSE-ConnectionGUID: DoRRa9kLTJyO6vj+9lsQeQ==
X-CSE-MsgGUID: 1wPCQikjT82hbAHri8yYUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="107555387"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Nov 2024 16:17:53 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Tk7-000mdH-19;
	Wed, 06 Nov 2024 00:17:51 +0000
Date: Wed, 6 Nov 2024 08:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:6.10-main 17/50]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:31.9-33.4: Warning
 (unit_address_vs_reg): /memory: node has a reg or ranges property, but no
 unit name
Message-ID: <202411060822.TzdbR4CQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.10-main
head:   ada8e45c341eb57e21f33693487918e80994c721
commit: 5ac685c53e2fd9ef63e5f9ca0b074578b52c5770 [17/50] WIP: add BPi-R4
:::::: branch date: 3 days ago
:::::: commit date: 4 months ago
config: arm64-randconfig-003-20241106 (https://download.01.org/0day-ci/archive/20241106/202411060822.TzdbR4CQ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060822.TzdbR4CQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411060822.TzdbR4CQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1011.23-1032.5: Warning (unit_address_vs_reg): /soc/tphy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1044.23-1066.5: Warning (unit_address_vs_reg): /soc/xphy@11e10000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:31.9-33.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1011.23-1032.5: Warning (simple_bus_reg): /soc/tphy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1044.23-1066.5: Warning (simple_bus_reg): /soc/xphy@11e10000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1127.27-1288.5: Warning (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +31 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts

6c1d134a103f68 Rafał Miłecki 2024-01-08  11  
6c1d134a103f68 Rafał Miłecki 2024-01-08  12  / {
6c1d134a103f68 Rafał Miłecki 2024-01-08  13  	compatible = "bananapi,bpi-r4", "mediatek,mt7988a";
6c1d134a103f68 Rafał Miłecki 2024-01-08  14  	model = "Banana Pi BPI-R4";
6c1d134a103f68 Rafał Miłecki 2024-01-08  15  	chassis-type = "embedded";
5ac685c53e2fd9 Daniel Golle  2023-07-26  16  
5ac685c53e2fd9 Daniel Golle  2023-07-26  17  	aliases {
5ac685c53e2fd9 Daniel Golle  2023-07-26  18  		serial0 = &uart0;
5ac685c53e2fd9 Daniel Golle  2023-07-26  19  		led-boot = &led_green;
5ac685c53e2fd9 Daniel Golle  2023-07-26  20  		led-failsafe = &led_green;
5ac685c53e2fd9 Daniel Golle  2023-07-26  21  		led-running = &led_green;
5ac685c53e2fd9 Daniel Golle  2023-07-26  22  		led-upgrade = &led_green;
5ac685c53e2fd9 Daniel Golle  2023-07-26  23  	};
5ac685c53e2fd9 Daniel Golle  2023-07-26  24  
5ac685c53e2fd9 Daniel Golle  2023-07-26  25  	chosen {
5ac685c53e2fd9 Daniel Golle  2023-07-26  26  		stdout-path = &uart0;
5ac685c53e2fd9 Daniel Golle  2023-07-26  27  		bootargs = "console=ttyS0,115200n1 loglevel=8 pci=pcie_bus_perf ubi.block=0,fit root=/dev/fit0";
5ac685c53e2fd9 Daniel Golle  2023-07-26  28  		rootdisk-spim-nand = <&ubi_rootfs>;
5ac685c53e2fd9 Daniel Golle  2023-07-26  29  	};
5ac685c53e2fd9 Daniel Golle  2023-07-26  30  
5ac685c53e2fd9 Daniel Golle  2023-07-26 @31  	memory {
5ac685c53e2fd9 Daniel Golle  2023-07-26  32  		reg = <0x00 0x40000000 0x00 0x10000000>;
5ac685c53e2fd9 Daniel Golle  2023-07-26  33  	};
5ac685c53e2fd9 Daniel Golle  2023-07-26  34  
5ac685c53e2fd9 Daniel Golle  2023-07-26  35  	/* SFP1 cage (WAN) */
5ac685c53e2fd9 Daniel Golle  2023-07-26  36  	sfp1: sfp1 {
5ac685c53e2fd9 Daniel Golle  2023-07-26  37  		compatible = "sff,sfp";
5ac685c53e2fd9 Daniel Golle  2023-07-26  38  		i2c-bus = <&i2c_sfp1>;
5ac685c53e2fd9 Daniel Golle  2023-07-26  39  		los-gpios = <&pio 54 GPIO_ACTIVE_HIGH>;
5ac685c53e2fd9 Daniel Golle  2023-07-26  40  		mod-def0-gpios = <&pio 82 GPIO_ACTIVE_LOW>;
5ac685c53e2fd9 Daniel Golle  2023-07-26  41  		tx-disable-gpios = <&pio 70 GPIO_ACTIVE_HIGH>;
5ac685c53e2fd9 Daniel Golle  2023-07-26  42  		tx-fault-gpios = <&pio 69 GPIO_ACTIVE_HIGH>;
5ac685c53e2fd9 Daniel Golle  2023-07-26  43  		rate-select0-gpios = <&pio 21 GPIO_ACTIVE_LOW>;
5ac685c53e2fd9 Daniel Golle  2023-07-26  44  		maximum-power-milliwatt = <3000>;
5ac685c53e2fd9 Daniel Golle  2023-07-26  45  	};
5ac685c53e2fd9 Daniel Golle  2023-07-26  46  
5ac685c53e2fd9 Daniel Golle  2023-07-26  47  	/* SFP2 cage (LAN) */
5ac685c53e2fd9 Daniel Golle  2023-07-26  48  	sfp2: sfp2 {
5ac685c53e2fd9 Daniel Golle  2023-07-26  49  		compatible = "sff,sfp";
5ac685c53e2fd9 Daniel Golle  2023-07-26  50  		i2c-bus = <&i2c_sfp2>;
5ac685c53e2fd9 Daniel Golle  2023-07-26  51  		los-gpios = <&pio 2 GPIO_ACTIVE_HIGH>;
5ac685c53e2fd9 Daniel Golle  2023-07-26  52  		mod-def0-gpios = <&pio 83 GPIO_ACTIVE_LOW>;
5ac685c53e2fd9 Daniel Golle  2023-07-26  53  		tx-disable-gpios = <&pio 0 GPIO_ACTIVE_HIGH>;
5ac685c53e2fd9 Daniel Golle  2023-07-26  54  		tx-fault-gpios = <&pio 1 GPIO_ACTIVE_HIGH>;
5ac685c53e2fd9 Daniel Golle  2023-07-26  55  		rate-select0-gpios = <&pio 3 GPIO_ACTIVE_LOW>;
5ac685c53e2fd9 Daniel Golle  2023-07-26  56  		maximum-power-milliwatt = <3000>;
5ac685c53e2fd9 Daniel Golle  2023-07-26  57  	};
5ac685c53e2fd9 Daniel Golle  2023-07-26  58  
5ac685c53e2fd9 Daniel Golle  2023-07-26  59  	gpio-keys {
5ac685c53e2fd9 Daniel Golle  2023-07-26  60  		compatible = "gpio-keys";
5ac685c53e2fd9 Daniel Golle  2023-07-26  61  
5ac685c53e2fd9 Daniel Golle  2023-07-26  62  		wps {
5ac685c53e2fd9 Daniel Golle  2023-07-26  63  			label = "WPS";
5ac685c53e2fd9 Daniel Golle  2023-07-26  64  			linux,code = <KEY_RESTART>;
5ac685c53e2fd9 Daniel Golle  2023-07-26  65  			gpios = <&pio 14 GPIO_ACTIVE_LOW>;
5ac685c53e2fd9 Daniel Golle  2023-07-26  66  		};
5ac685c53e2fd9 Daniel Golle  2023-07-26  67  	};
5ac685c53e2fd9 Daniel Golle  2023-07-26  68  
5ac685c53e2fd9 Daniel Golle  2023-07-26  69  	gpio-leds {
5ac685c53e2fd9 Daniel Golle  2023-07-26  70  		compatible = "gpio-leds";
5ac685c53e2fd9 Daniel Golle  2023-07-26  71  
5ac685c53e2fd9 Daniel Golle  2023-07-26  72  		led_green: led-green {
5ac685c53e2fd9 Daniel Golle  2023-07-26  73  			function = LED_FUNCTION_STATUS;
5ac685c53e2fd9 Daniel Golle  2023-07-26  74  			color = <LED_COLOR_ID_GREEN>;
5ac685c53e2fd9 Daniel Golle  2023-07-26  75  			gpios = <&pio 79 GPIO_ACTIVE_HIGH>;
5ac685c53e2fd9 Daniel Golle  2023-07-26  76  			default-state = "on";
5ac685c53e2fd9 Daniel Golle  2023-07-26  77  		};
5ac685c53e2fd9 Daniel Golle  2023-07-26  78  
5ac685c53e2fd9 Daniel Golle  2023-07-26  79  		led_blue: led-blue {
5ac685c53e2fd9 Daniel Golle  2023-07-26  80  			function = LED_FUNCTION_WPS;
5ac685c53e2fd9 Daniel Golle  2023-07-26  81  			color = <LED_COLOR_ID_BLUE>;
5ac685c53e2fd9 Daniel Golle  2023-07-26  82  			gpios = <&pio 63 GPIO_ACTIVE_HIGH>;
5ac685c53e2fd9 Daniel Golle  2023-07-26  83  			default-state = "off";
5ac685c53e2fd9 Daniel Golle  2023-07-26  84  		};
5ac685c53e2fd9 Daniel Golle  2023-07-26  85  	};
5ac685c53e2fd9 Daniel Golle  2023-07-26  86  };
5ac685c53e2fd9 Daniel Golle  2023-07-26  87  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
