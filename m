Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00FE2942A
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Sep 2024 22:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727130109; cv=none; b=Aff6c/a4RKh/28bdpfw0md+yGFUCh1URwDs/WmI5QoHOx3szNLMEVRSWOvBrr8VCbwZ761wOaXKIIbIgWRfDyjlcLOi61FEWWqG9E0lFobTTup8L0d1lx48bmnNswv7ZznmGcsTNUGSZ/TfAHkI2+xriZRVFvWKvdJIqyIg6uW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727130109; c=relaxed/simple;
	bh=lEn84olI3bo1Vsm5g20xHMwiYExGLAR8vpN11v03iI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IF6Pr1XXla2OZ5VSPK5Snc7H/P7Wxwd95Uks6biK2Ok1/xlZmLWM6/BfezJGTCHPD309D7jUc+ZE/wTwhNFJ4csKGxekmMAvrGQnpdPdDmVOd2jDBYsRvfPSJShneSLMStqvUvVMmJlKwjPUcHc3Q53YRdJjQtbAtPOIsRRwWsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXV69myA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXV69myA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727130107; x=1758666107;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lEn84olI3bo1Vsm5g20xHMwiYExGLAR8vpN11v03iI8=;
  b=lXV69myAffplIjThU+mFMu3Leq9swELEroz9vdQF/mFsIXrK6T6lLfoc
   ulmkrlal5xVrL2HIXROrae+NvhZSMTSEpVxJ8DfENjdxu/uHElmQwHsn8
   3YneqBoNsJKvkpeuCYbrK8kZvhCRyjyQik/43l92Nq6pk1ZTHbyBWSevc
   M4SH2SHKERIb3ZNw5I/KKb3fI9M5viQBciky4yLBfRE6ZB0V4ZPCv5y/n
   BHuV14kJQeq2FQGzne76SdVgGrIc4wG3GDR+Nxc3vfbA0RbUR/wnDiLKc
   gYy27kGeEE/6/42GO+IRsLRlNnCnqPetdvV6GxIjYo8TZinmgD4XsmE2O
   g==;
X-CSE-ConnectionGUID: C14kboV7QGKNre+tM9llbQ==
X-CSE-MsgGUID: sPy0/HrOSRqiwoPqj99yAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="28993978"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="28993978"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 15:21:46 -0700
X-CSE-ConnectionGUID: fVVZJnmYROOBKie0m4Vj6g==
X-CSE-MsgGUID: hQ6kuxICQv+v7rDeCpSZEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="75584189"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Sep 2024 15:21:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssrR9-000Hdp-0j;
	Mon, 23 Sep 2024 22:21:43 +0000
Date: Tue, 24 Sep 2024 06:21:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:6.11-rc 27/59]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:34.9-36.4: Warning
 (unit_address_vs_reg): /memory: node has a reg or ranges property, but no
 unit name
Message-ID: <202409240632.AGvyErnY-lkp@intel.com>
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

tree:   https://github.com/frank-w/BPI-R2-4.14 6.11-rc
head:   7ee01d7990ff12909d54321c2048d6e24e781855
commit: 40eb7fbb305626c704ae7893d5297903fc5297c6 [27/59] WIP: add BPi-R4
:::::: branch date: 2 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-003-20240924 (https://download.01.org/0day-ci/archive/20240924/202409240632.AGvyErnY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240632.AGvyErnY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409240632.AGvyErnY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1019.23-1040.5: Warning (unit_address_vs_reg): /soc/tphy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1052.23-1074.5: Warning (unit_address_vs_reg): /soc/xphy@11e10000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:34.9-36.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1019.23-1040.5: Warning (simple_bus_reg): /soc/tphy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1052.23-1074.5: Warning (simple_bus_reg): /soc/xphy@11e10000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1135.27-1300.5: Warning (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +34 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts

6c1d134a103f68 Rafał Miłecki 2024-01-08  11  
6c1d134a103f68 Rafał Miłecki 2024-01-08  12  / {
6c1d134a103f68 Rafał Miłecki 2024-01-08  13  	compatible = "bananapi,bpi-r4", "mediatek,mt7988a";
6c1d134a103f68 Rafał Miłecki 2024-01-08  14  	model = "Banana Pi BPI-R4";
6c1d134a103f68 Rafał Miłecki 2024-01-08  15  	chassis-type = "embedded";
40eb7fbb305626 Daniel Golle  2023-07-26  16  
40eb7fbb305626 Daniel Golle  2023-07-26  17  	aliases {
40eb7fbb305626 Daniel Golle  2023-07-26  18  		ethernet0 = &gmac0;
40eb7fbb305626 Daniel Golle  2023-07-26  19  		ethernet1 = &gmac1;
40eb7fbb305626 Daniel Golle  2023-07-26  20  		ethernet2 = &gmac2;
40eb7fbb305626 Daniel Golle  2023-07-26  21  		serial0 = &uart0;
40eb7fbb305626 Daniel Golle  2023-07-26  22  		led-boot = &led_green;
40eb7fbb305626 Daniel Golle  2023-07-26  23  		led-failsafe = &led_green;
40eb7fbb305626 Daniel Golle  2023-07-26  24  		led-running = &led_green;
40eb7fbb305626 Daniel Golle  2023-07-26  25  		led-upgrade = &led_green;
40eb7fbb305626 Daniel Golle  2023-07-26  26  	};
40eb7fbb305626 Daniel Golle  2023-07-26  27  
40eb7fbb305626 Daniel Golle  2023-07-26  28  	chosen {
40eb7fbb305626 Daniel Golle  2023-07-26  29  		stdout-path = &uart0;
40eb7fbb305626 Daniel Golle  2023-07-26  30  		bootargs = "console=ttyS0,115200n1 loglevel=8 pci=pcie_bus_perf ubi.block=0,fit root=/dev/fit0";
40eb7fbb305626 Daniel Golle  2023-07-26  31  		rootdisk-spim-nand = <&ubi_rootfs>;
40eb7fbb305626 Daniel Golle  2023-07-26  32  	};
40eb7fbb305626 Daniel Golle  2023-07-26  33  
40eb7fbb305626 Daniel Golle  2023-07-26 @34  	memory {
40eb7fbb305626 Daniel Golle  2023-07-26  35  		reg = <0x00 0x40000000 0x00 0x10000000>;
40eb7fbb305626 Daniel Golle  2023-07-26  36  	};
40eb7fbb305626 Daniel Golle  2023-07-26  37  
40eb7fbb305626 Daniel Golle  2023-07-26  38  	/* SFP1 cage (WAN) */
40eb7fbb305626 Daniel Golle  2023-07-26  39  	sfp1: sfp1 {
40eb7fbb305626 Daniel Golle  2023-07-26  40  		compatible = "sff,sfp";
40eb7fbb305626 Daniel Golle  2023-07-26  41  		i2c-bus = <&i2c_sfp1>;
40eb7fbb305626 Daniel Golle  2023-07-26  42  		los-gpios = <&pio 54 GPIO_ACTIVE_HIGH>;
40eb7fbb305626 Daniel Golle  2023-07-26  43  		mod-def0-gpios = <&pio 82 GPIO_ACTIVE_LOW>;
40eb7fbb305626 Daniel Golle  2023-07-26  44  		tx-disable-gpios = <&pio 70 GPIO_ACTIVE_HIGH>;
40eb7fbb305626 Daniel Golle  2023-07-26  45  		tx-fault-gpios = <&pio 69 GPIO_ACTIVE_HIGH>;
40eb7fbb305626 Daniel Golle  2023-07-26  46  		rate-select0-gpios = <&pio 21 GPIO_ACTIVE_LOW>;
40eb7fbb305626 Daniel Golle  2023-07-26  47  		maximum-power-milliwatt = <3000>;
40eb7fbb305626 Daniel Golle  2023-07-26  48  	};
40eb7fbb305626 Daniel Golle  2023-07-26  49  
40eb7fbb305626 Daniel Golle  2023-07-26  50  	/* SFP2 cage (LAN) */
40eb7fbb305626 Daniel Golle  2023-07-26  51  	sfp2: sfp2 {
40eb7fbb305626 Daniel Golle  2023-07-26  52  		compatible = "sff,sfp";
40eb7fbb305626 Daniel Golle  2023-07-26  53  		i2c-bus = <&i2c_sfp2>;
40eb7fbb305626 Daniel Golle  2023-07-26  54  		los-gpios = <&pio 2 GPIO_ACTIVE_HIGH>;
40eb7fbb305626 Daniel Golle  2023-07-26  55  		mod-def0-gpios = <&pio 83 GPIO_ACTIVE_LOW>;
40eb7fbb305626 Daniel Golle  2023-07-26  56  		tx-disable-gpios = <&pio 0 GPIO_ACTIVE_HIGH>;
40eb7fbb305626 Daniel Golle  2023-07-26  57  		tx-fault-gpios = <&pio 1 GPIO_ACTIVE_HIGH>;
40eb7fbb305626 Daniel Golle  2023-07-26  58  		rate-select0-gpios = <&pio 3 GPIO_ACTIVE_LOW>;
40eb7fbb305626 Daniel Golle  2023-07-26  59  		maximum-power-milliwatt = <3000>;
40eb7fbb305626 Daniel Golle  2023-07-26  60  	};
40eb7fbb305626 Daniel Golle  2023-07-26  61  
40eb7fbb305626 Daniel Golle  2023-07-26  62  	gpio-keys {
40eb7fbb305626 Daniel Golle  2023-07-26  63  		compatible = "gpio-keys";
40eb7fbb305626 Daniel Golle  2023-07-26  64  
40eb7fbb305626 Daniel Golle  2023-07-26  65  		wps {
40eb7fbb305626 Daniel Golle  2023-07-26  66  			label = "WPS";
40eb7fbb305626 Daniel Golle  2023-07-26  67  			linux,code = <KEY_RESTART>;
40eb7fbb305626 Daniel Golle  2023-07-26  68  			gpios = <&pio 14 GPIO_ACTIVE_LOW>;
40eb7fbb305626 Daniel Golle  2023-07-26  69  		};
40eb7fbb305626 Daniel Golle  2023-07-26  70  	};
40eb7fbb305626 Daniel Golle  2023-07-26  71  
40eb7fbb305626 Daniel Golle  2023-07-26  72  	gpio-leds {
40eb7fbb305626 Daniel Golle  2023-07-26  73  		compatible = "gpio-leds";
40eb7fbb305626 Daniel Golle  2023-07-26  74  
40eb7fbb305626 Daniel Golle  2023-07-26  75  		led_green: led-green {
40eb7fbb305626 Daniel Golle  2023-07-26  76  			function = LED_FUNCTION_STATUS;
40eb7fbb305626 Daniel Golle  2023-07-26  77  			color = <LED_COLOR_ID_GREEN>;
40eb7fbb305626 Daniel Golle  2023-07-26  78  			gpios = <&pio 79 GPIO_ACTIVE_HIGH>;
40eb7fbb305626 Daniel Golle  2023-07-26  79  			default-state = "on";
40eb7fbb305626 Daniel Golle  2023-07-26  80  		};
40eb7fbb305626 Daniel Golle  2023-07-26  81  
40eb7fbb305626 Daniel Golle  2023-07-26  82  		led_blue: led-blue {
40eb7fbb305626 Daniel Golle  2023-07-26  83  			function = LED_FUNCTION_WPS;
40eb7fbb305626 Daniel Golle  2023-07-26  84  			color = <LED_COLOR_ID_BLUE>;
40eb7fbb305626 Daniel Golle  2023-07-26  85  			gpios = <&pio 63 GPIO_ACTIVE_HIGH>;
40eb7fbb305626 Daniel Golle  2023-07-26  86  			default-state = "off";
40eb7fbb305626 Daniel Golle  2023-07-26  87  		};
40eb7fbb305626 Daniel Golle  2023-07-26  88  	};
40eb7fbb305626 Daniel Golle  2023-07-26  89  };
40eb7fbb305626 Daniel Golle  2023-07-26  90  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
