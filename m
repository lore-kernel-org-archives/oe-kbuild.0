Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0919E41C69
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Sep 2024 02:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726626896; cv=none; b=Bay49HOhD1ouzT3I4y49cxWs1KwWKckfmCdHLt6dBzAo4lUFOP1dRRYGjgxNd9ldRuAiogwfrR/2GL0hpB6GSh1miPWtst6O4IYiexXwi2F1lJKlD0rMcODrvZwMgqbKo8vSERr2LD67ASkCOv57/ZArlLBKfJQP+8z52xUuPSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726626896; c=relaxed/simple;
	bh=69JClD1jg/7A9tZOnqtXCAz3hCPUiqBai/yNs3sMp9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E8iq+zRMgYN9Szx4Nz/iEfyBn9EMhAuxazECxi5COSHJADsIfJwAYp2sOhzSLCDOhfH1bKhgkRopZIzYsU8klugyYe7Pdifv2TLSVQFSgEqHZFPHNi61n4anAmGOcOLxn5zIbJe/7hIHN4l3gEd2pdzd++RjKCR3QGCLwZmggxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=INPN6qNx; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="INPN6qNx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726626894; x=1758162894;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=69JClD1jg/7A9tZOnqtXCAz3hCPUiqBai/yNs3sMp9E=;
  b=INPN6qNxnP6pHy+4nlfeoeXIMOMgUHLhSagvxFv/7NMXAE7fgESzZrmd
   GwZyuHPeFV1pNdvRbC+WV51HyVNBdzcws05ylXFbhZ0cIWWpWd5M5dPjZ
   bAOG24kb6V+DyljDw4s44nxUhKSMIDv7iH4A0sGZoYmGzxCSw6Vj1MH2C
   kQhopqdpjDXG+MHmS/Cax9NZE8kPu7XIBzLA2EnIm9mjgx3NbkiE3ikBa
   NhUGnLwQJtJHihMfdYzG0ExrMkeFo2C5i/BBoIFg+aLxo0XrK1U2tLF35
   ZaKcuuPLb1LnX7K8p/KdNCDTIV9QnFDpHpOn7jxZ83ysIfnju/wJQOdq5
   g==;
X-CSE-ConnectionGUID: f34+Eu0ERmqndcaurvgRqw==
X-CSE-MsgGUID: CnnvbilRTX21cXTQCuaLbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36100495"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="36100495"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 19:34:53 -0700
X-CSE-ConnectionGUID: qgNF+G1+TJuA8KyqfXxuwg==
X-CSE-MsgGUID: Q8EUmz1zR0GD4UgF1S2n0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="69869469"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Sep 2024 19:34:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqkWn-000Bo8-2j;
	Wed, 18 Sep 2024 02:34:49 +0000
Date: Wed, 18 Sep 2024 10:34:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:6.11-rc 59/60]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:18.3-22: ERROR
 (duplicate_property_names): /aliases:ethernet0: Duplicate property name
Message-ID: <202409181253.JkgGRAsF-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:18.3-22: ERROR (duplicate_property_names): /aliases:ethernet0: Duplicate property name"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.11-rc
head:   de8b6ff8886ed2a781de1c57a0ffe141d377bf84
commit: 315c3eb167e7adfd4eae524e3e286e6120a5cfd6 [59/60] arm64: dts: Add ethernet Aliases to BananaPi R4
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-004-20240917 (https://download.01.org/0day-ci/archive/20240918/202409181253.JkgGRAsF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240918/202409181253.JkgGRAsF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409181253.JkgGRAsF-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:18.3-22: ERROR (duplicate_property_names): /aliases:ethernet0: Duplicate property name
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:19.3-22: ERROR (duplicate_property_names): /aliases:ethernet1: Duplicate property name
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:20.3-22: ERROR (duplicate_property_names): /aliases:ethernet2: Duplicate property name
>> ERROR: Input tree has errors, aborting (use -f to force output)

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:18.3-22: ERROR (duplicate_property_names): /aliases:ethernet0: Duplicate property name
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:19.3-22: ERROR (duplicate_property_names): /aliases:ethernet1: Duplicate property name
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:20.3-22: ERROR (duplicate_property_names): /aliases:ethernet2: Duplicate property name
   ERROR: Input tree has errors, aborting (use -f to force output)

vim +18 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts

6c1d134a103f68 Rafał Miłecki 2024-01-08  11  
6c1d134a103f68 Rafał Miłecki 2024-01-08  12  / {
6c1d134a103f68 Rafał Miłecki 2024-01-08  13  	compatible = "bananapi,bpi-r4", "mediatek,mt7988a";
6c1d134a103f68 Rafał Miłecki 2024-01-08  14  	model = "Banana Pi BPI-R4";
6c1d134a103f68 Rafał Miłecki 2024-01-08  15  	chassis-type = "embedded";
40eb7fbb305626 Daniel Golle  2023-07-26  16  
40eb7fbb305626 Daniel Golle  2023-07-26  17  	aliases {
40eb7fbb305626 Daniel Golle  2023-07-26 @18  		ethernet0 = &gmac0;
40eb7fbb305626 Daniel Golle  2023-07-26 @19  		ethernet1 = &gmac1;
40eb7fbb305626 Daniel Golle  2023-07-26 @20  		ethernet2 = &gmac2;
40eb7fbb305626 Daniel Golle  2023-07-26  21  		serial0 = &uart0;
40eb7fbb305626 Daniel Golle  2023-07-26  22  		led-boot = &led_green;
40eb7fbb305626 Daniel Golle  2023-07-26  23  		led-failsafe = &led_green;
40eb7fbb305626 Daniel Golle  2023-07-26  24  		led-running = &led_green;
40eb7fbb305626 Daniel Golle  2023-07-26  25  		led-upgrade = &led_green;
315c3eb167e7ad Sachi King    2024-09-02  26  		ethernet0 = &gmac0;
315c3eb167e7ad Sachi King    2024-09-02  27  		ethernet1 = &gmac1;
315c3eb167e7ad Sachi King    2024-09-02  28  		ethernet2 = &gmac2;
40eb7fbb305626 Daniel Golle  2023-07-26  29  	};
40eb7fbb305626 Daniel Golle  2023-07-26  30  
40eb7fbb305626 Daniel Golle  2023-07-26  31  	chosen {
40eb7fbb305626 Daniel Golle  2023-07-26  32  		stdout-path = &uart0;
40eb7fbb305626 Daniel Golle  2023-07-26  33  		bootargs = "console=ttyS0,115200n1 loglevel=8 pci=pcie_bus_perf ubi.block=0,fit root=/dev/fit0";
40eb7fbb305626 Daniel Golle  2023-07-26  34  		rootdisk-spim-nand = <&ubi_rootfs>;
40eb7fbb305626 Daniel Golle  2023-07-26  35  	};
40eb7fbb305626 Daniel Golle  2023-07-26  36  
40eb7fbb305626 Daniel Golle  2023-07-26  37  	memory {
40eb7fbb305626 Daniel Golle  2023-07-26  38  		reg = <0x00 0x40000000 0x00 0x10000000>;
40eb7fbb305626 Daniel Golle  2023-07-26  39  	};
40eb7fbb305626 Daniel Golle  2023-07-26  40  
40eb7fbb305626 Daniel Golle  2023-07-26  41  	/* SFP1 cage (WAN) */
40eb7fbb305626 Daniel Golle  2023-07-26  42  	sfp1: sfp1 {
40eb7fbb305626 Daniel Golle  2023-07-26  43  		compatible = "sff,sfp";
40eb7fbb305626 Daniel Golle  2023-07-26  44  		i2c-bus = <&i2c_sfp1>;
40eb7fbb305626 Daniel Golle  2023-07-26  45  		los-gpios = <&pio 54 GPIO_ACTIVE_HIGH>;
40eb7fbb305626 Daniel Golle  2023-07-26  46  		mod-def0-gpios = <&pio 82 GPIO_ACTIVE_LOW>;
40eb7fbb305626 Daniel Golle  2023-07-26  47  		tx-disable-gpios = <&pio 70 GPIO_ACTIVE_HIGH>;
40eb7fbb305626 Daniel Golle  2023-07-26  48  		tx-fault-gpios = <&pio 69 GPIO_ACTIVE_HIGH>;
40eb7fbb305626 Daniel Golle  2023-07-26  49  		rate-select0-gpios = <&pio 21 GPIO_ACTIVE_LOW>;
40eb7fbb305626 Daniel Golle  2023-07-26  50  		maximum-power-milliwatt = <3000>;
40eb7fbb305626 Daniel Golle  2023-07-26  51  	};
40eb7fbb305626 Daniel Golle  2023-07-26  52  
40eb7fbb305626 Daniel Golle  2023-07-26  53  	/* SFP2 cage (LAN) */
40eb7fbb305626 Daniel Golle  2023-07-26  54  	sfp2: sfp2 {
40eb7fbb305626 Daniel Golle  2023-07-26  55  		compatible = "sff,sfp";
40eb7fbb305626 Daniel Golle  2023-07-26  56  		i2c-bus = <&i2c_sfp2>;
40eb7fbb305626 Daniel Golle  2023-07-26  57  		los-gpios = <&pio 2 GPIO_ACTIVE_HIGH>;
40eb7fbb305626 Daniel Golle  2023-07-26  58  		mod-def0-gpios = <&pio 83 GPIO_ACTIVE_LOW>;
40eb7fbb305626 Daniel Golle  2023-07-26  59  		tx-disable-gpios = <&pio 0 GPIO_ACTIVE_HIGH>;
40eb7fbb305626 Daniel Golle  2023-07-26  60  		tx-fault-gpios = <&pio 1 GPIO_ACTIVE_HIGH>;
40eb7fbb305626 Daniel Golle  2023-07-26  61  		rate-select0-gpios = <&pio 3 GPIO_ACTIVE_LOW>;
40eb7fbb305626 Daniel Golle  2023-07-26  62  		maximum-power-milliwatt = <3000>;
40eb7fbb305626 Daniel Golle  2023-07-26  63  	};
40eb7fbb305626 Daniel Golle  2023-07-26  64  
40eb7fbb305626 Daniel Golle  2023-07-26  65  	gpio-keys {
40eb7fbb305626 Daniel Golle  2023-07-26  66  		compatible = "gpio-keys";
40eb7fbb305626 Daniel Golle  2023-07-26  67  
40eb7fbb305626 Daniel Golle  2023-07-26  68  		wps {
40eb7fbb305626 Daniel Golle  2023-07-26  69  			label = "WPS";
40eb7fbb305626 Daniel Golle  2023-07-26  70  			linux,code = <KEY_RESTART>;
40eb7fbb305626 Daniel Golle  2023-07-26  71  			gpios = <&pio 14 GPIO_ACTIVE_LOW>;
40eb7fbb305626 Daniel Golle  2023-07-26  72  		};
40eb7fbb305626 Daniel Golle  2023-07-26  73  	};
40eb7fbb305626 Daniel Golle  2023-07-26  74  
40eb7fbb305626 Daniel Golle  2023-07-26  75  	gpio-leds {
40eb7fbb305626 Daniel Golle  2023-07-26  76  		compatible = "gpio-leds";
40eb7fbb305626 Daniel Golle  2023-07-26  77  
40eb7fbb305626 Daniel Golle  2023-07-26  78  		led_green: led-green {
40eb7fbb305626 Daniel Golle  2023-07-26  79  			function = LED_FUNCTION_STATUS;
40eb7fbb305626 Daniel Golle  2023-07-26  80  			color = <LED_COLOR_ID_GREEN>;
40eb7fbb305626 Daniel Golle  2023-07-26  81  			gpios = <&pio 79 GPIO_ACTIVE_HIGH>;
40eb7fbb305626 Daniel Golle  2023-07-26  82  			default-state = "on";
40eb7fbb305626 Daniel Golle  2023-07-26  83  		};
40eb7fbb305626 Daniel Golle  2023-07-26  84  
40eb7fbb305626 Daniel Golle  2023-07-26  85  		led_blue: led-blue {
40eb7fbb305626 Daniel Golle  2023-07-26  86  			function = LED_FUNCTION_WPS;
40eb7fbb305626 Daniel Golle  2023-07-26  87  			color = <LED_COLOR_ID_BLUE>;
40eb7fbb305626 Daniel Golle  2023-07-26  88  			gpios = <&pio 63 GPIO_ACTIVE_HIGH>;
40eb7fbb305626 Daniel Golle  2023-07-26  89  			default-state = "off";
40eb7fbb305626 Daniel Golle  2023-07-26  90  		};
40eb7fbb305626 Daniel Golle  2023-07-26  91  	};
40eb7fbb305626 Daniel Golle  2023-07-26  92  };
40eb7fbb305626 Daniel Golle  2023-07-26  93  

:::::: The code at line 18 was first introduced by commit
:::::: 40eb7fbb305626c704ae7893d5297903fc5297c6 WIP: add BPi-R4

:::::: TO: Daniel Golle <daniel@makrotopia.org>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
