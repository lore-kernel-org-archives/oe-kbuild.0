Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A093A374FF
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Nov 2024 02:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730861166; cv=none; b=ZohDDXAcoPtfPtKEOADhP8YCqgIfzVaUzrR3/PoNW3ZrVmRNRKaxYdj65FFmsMokjzb95XK2eXyy3R7GmTPkPiV8ADPmXqCoxXAtP3dKdTR5ib76GvSOEBpeP4ejGwfKbBeUcVTm4wyX0mdi+g1SUKB4mPMnARgmfy7Ry1CoZLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730861166; c=relaxed/simple;
	bh=L1fDeVlnNUjUDQMvfNAiEH1lHQxP/Tb0mQvwHHyd7Es=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=unMeS1uhFBZRzPL1mFlPPwHnE9SjjOqTn6E6w01kSPomYr0KE/t+Y5Un5e1xJVhXIYuL46eF3Xxn9KKMABOGzz/gRzWsesoAgxlMSK6wuDNsH5vCd5L1zvmXtFd5DEwSWA/4xqAEjb3gqqvcPhtUJYStL1C6e6mXNCiGTdVpoN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IGvbJDpL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGvbJDpL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730861163; x=1762397163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L1fDeVlnNUjUDQMvfNAiEH1lHQxP/Tb0mQvwHHyd7Es=;
  b=IGvbJDpLYHN2unbAkosu/z3CQyBwns/6NatA3EJyBvE/mtq4vnJrq9Pl
   N7yu0VkYR2gQvcm+ZwlVyDdTpVMz9GNPMPu7tjRLUi4albYm0FkaBXzeb
   eh08UGGAK1zxHMCIsNKIfwy/tLZuP8Zzkb0jjmr0EqKc0LC8ysfFlMNLY
   nW4Kq34BMBAsBbKrDwBjg4Pj2es7+PKBfMKnw95xZdsFvbMWHxBdf33pp
   ALv+g6gdhWUxTiruipzacMQOKxhy/FdcSp+KZRbePieb1JK/p6Wx/QriW
   hMMVHzBEQqG0XPr+QyPiqFUY1o0HUa/BtL5u4ukrxuyZcuaS/a9Igm9pE
   w==;
X-CSE-ConnectionGUID: KOhPXrDzTJ+5KsoymtLPzA==
X-CSE-MsgGUID: 85TFwSbtRSGsLvXt3HP0mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30069943"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="30069943"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 18:46:03 -0800
X-CSE-ConnectionGUID: avymnTGRR226plsa+Oblwg==
X-CSE-MsgGUID: z7HTFeANTXqn5VAJybZwFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="89115348"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Nov 2024 18:46:02 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8W3T-000mrF-1U;
	Wed, 06 Nov 2024 02:45:59 +0000
Date: Wed, 6 Nov 2024 10:45:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:6.10-main 42/50]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-v0.dts:32.9-34.4:
 Warning (unit_address_vs_reg): /memory: node has a reg or ranges property,
 but no unit name
Message-ID: <202411061035.7B5Hv5pu-lkp@intel.com>
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
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.10-main
head:   ada8e45c341eb57e21f33693487918e80994c721
commit: dfb82080654ef1cd3d38b3c709cee4a6e152040d [42/50] arch: arm64: mt7988: fix missing i2c1_sfp_pins for r4v0
:::::: branch date: 3 days ago
:::::: commit date: 10 weeks ago
config: arm64-randconfig-003-20241106 (https://download.01.org/0day-ci/archive/20241106/202411061035.7B5Hv5pu-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411061035.7B5Hv5pu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411061035.7B5Hv5pu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1043.23-1064.5: Warning (unit_address_vs_reg): /soc/tphy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1076.23-1098.5: Warning (unit_address_vs_reg): /soc/xphy@11e10000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-v0.dts:32.9-34.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1043.23-1064.5: Warning (simple_bus_reg): /soc/tphy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1076.23-1098.5: Warning (simple_bus_reg): /soc/xphy@11e10000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1159.27-1320.5: Warning (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +32 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-v0.dts

0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   13  
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   14  / {
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   15  	model = "Bananapi BPI-R4 V00";
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   16  	compatible = "bananapi,bpi-r4",
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   17  		     "mediatek,mt7988";
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   18  
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   19  	aliases {
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   20  		serial0 = &uart0;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   21  		led-boot = &led_green;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   22  		led-failsafe = &led_green;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   23  		led-running = &led_green;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   24  		led-upgrade = &led_green;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   25  	};
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   26  
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   27  	chosen {
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   28  		stdout-path = &uart0;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   29  		bootargs = "console=ttyS0,115200n1 loglevel=8 pci=pcie_bus_perf";
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   30  	};
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   31  
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30  @32  	memory {
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   33  		reg = <0x00 0x40000000 0x00 0x10000000>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   34  	};
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   35  
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   36  	regulator-sfp1-3v3 {
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   37  		compatible = "regulator-fixed";
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   38  		regulator-name = "sfp1";
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   39  		regulator-min-microvolt = <3300000>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   40  		regulator-max-microvolt = <3300000>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   41  		gpio = <&pio 82 GPIO_ACTIVE_LOW>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   42  		regulator-always-on;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   43  	};
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   44  
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   45  	regulator-sfp2-3v3 {
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   46  		compatible = "regulator-fixed";
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   47  		regulator-name = "sfp2";
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   48  		regulator-min-microvolt = <3300000>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   49  		regulator-max-microvolt = <3300000>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   50  		gpio = <&pio 83 GPIO_ACTIVE_LOW>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   51  		regulator-always-on;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   52  	};
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   53  
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   54  	/* left SFP cage (wan) using hardware i2c bus */
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   55  	sfp0: sfp1-wan {
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   56  		compatible = "sff,sfp";
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   57  		i2c-bus = <&i2c1>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   58  		mod-def0-gpios = <&pio 12 GPIO_ACTIVE_LOW>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   59  		los-gpios = <&pio 68 GPIO_ACTIVE_HIGH>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   60  		tx-disable-gpios = <&pio 11 GPIO_ACTIVE_HIGH>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   61  		rate-select0-gpios = <&pio 54 GPIO_ACTIVE_LOW>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   62  		maximum-power-milliwatt = <3000>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   63  	};
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   64  
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   65  	/* i2c of the right SFP cage (lan) */
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   66  	i2c_sfp2: i2c-gpio-0 {
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   67  		compatible = "i2c-gpio";
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   68  		sda-gpios = <&pio 51 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   69  		scl-gpios = <&pio 53 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   70  		i2c-gpio,delay-us = <2>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   71  		#address-cells = <1>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   72  		#size-cells = <0>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   73  	};
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   74  
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   75  	sfp1: sfp2-lan {
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   76  		compatible = "sff,sfp";
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   77  		i2c-bus = <&i2c_sfp2>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   78  		mod-def0-gpios = <&pio 52 GPIO_ACTIVE_LOW>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   79  		los-gpios = <&pio 80 GPIO_ACTIVE_HIGH>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   80  		tx-disable-gpios = <&pio 21 GPIO_ACTIVE_HIGH>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   81  		rate-select0-gpios = <&pio 81 GPIO_ACTIVE_LOW>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   82  		maximum-power-milliwatt = <3000>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   83  	};
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   84  
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   85  	gpio-keys {
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   86  		compatible = "gpio-keys";
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   87  
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   88  		factory {
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   89  			label = "RST";
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   90  			linux,code = <KEY_RESTART>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   91  			gpios = <&pio 13 GPIO_ACTIVE_LOW>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   92  		};
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   93  
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   94  		wps {
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   95  			label = "WPS";
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   96  			linux,code = <KEY_WPS_BUTTON>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   97  			gpios = <&pio 14 GPIO_ACTIVE_LOW>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   98  		};
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30   99  	};
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30  100  
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30  101  	gpio-leds {
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30  102  		compatible = "gpio-leds";
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30  103  
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30  104  		led_green: led-green {
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30  105  			label = "status:green";
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30  106  			function = LED_FUNCTION_STATUS;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30  107  			color = <LED_COLOR_ID_GREEN>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30  108  			gpios = <&pio 64 GPIO_ACTIVE_HIGH>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30  109  			default-state = "on";
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30  110  		};
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30  111  
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30  112  		led_blue: led-blue {
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30  113  			label = "wps:blue";
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30  114  			function = LED_FUNCTION_WPS;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30  115  			color = <LED_COLOR_ID_BLUE>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30  116  			gpios = <&pio 65 GPIO_ACTIVE_HIGH>;
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30  117  			default-state = "off";
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30  118  		};
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30  119  	};
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30  120  };
0d9a44a71fa7f4 Frank Wunderlich 2023-09-30  121  

:::::: The code at line 32 was first introduced by commit
:::::: 0d9a44a71fa7f4a48f2c3ab79ee2e765c93729a4 arm64: dts: mt7988: add bpi-r4 v0

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
