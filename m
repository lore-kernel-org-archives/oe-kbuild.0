Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B948328369C
	for <oe-kbuild@lists.linux.dev>; Thu, 22 May 2025 08:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903888; cv=none; b=tf6397DYllWV6v77FN1LRqss9nOjgkUPPt+aEESU7+A8H1BSKg3c3dJWay2fuwnFPVLWrS9Q3KcGZBFMA7cKwaOX50Pz4EdOvt2MpPb51gs3mOsYzrivLrJeo/o42UNxFh6+rfstlqAlRHNZU7W+akIGDb+uOtQKc0CjLz1y8xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903888; c=relaxed/simple;
	bh=uU6qBg8iJ2Ddb/AC8ncbXAkGNvlIiyQSxrgTq2VLD0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sGoau23NVuPqOvrbZkoHTOvlL8kJaYXjpeOqu6psqxFf7PiF2H2ySrYYZgV2kjPfr5qc97bN7xhXqtp5mEh3uD3U7PYmzsaaeSL9ABGFsQTdxw8W/IJAtJ0kW4uVdAYfzlELUzW8IWxWIBsWdHJYO6LHRjcx4jedHPM0gfXhcCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZUTAIqk5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZUTAIqk5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747903887; x=1779439887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uU6qBg8iJ2Ddb/AC8ncbXAkGNvlIiyQSxrgTq2VLD0Y=;
  b=ZUTAIqk5fCmZRYeBfmB8LZFwNsWiInOMQTm0sfxzqn5SooTioeIYuSDF
   pJLPhpdZ1n1GDi+1OXsmuFjjqujS9ED8KGHwc2YbX+aPKkfBnwklqKR1W
   37c4rVcK093v9hlrus+pYyuKGb/wNUeMzmX40wSLrIzbb4jEyIycBspTG
   vReZ2GUVSoO7y2rftbhph2tKEFZTBofRRcOtcW7zpHEQMAUgKaxkBH5jy
   R9i95LgUwnZjMDl0yxKcGleW+itxe9gP5P5Bc5mmiV7K9ix74qyZz84Iq
   UkpQI5PeowGQxnnNlq7OLXwZWcVcPrVC17g1X6DzC7JVLEAUq8C22yO7F
   Q==;
X-CSE-ConnectionGUID: A7U8huDGTTK2zwzog0ii0Q==
X-CSE-MsgGUID: Q9wUdzQNTtyN+M0AF4DPgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61259228"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="61259228"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 01:51:24 -0700
X-CSE-ConnectionGUID: ME+e10CZSFaLt/ABfCUfZg==
X-CSE-MsgGUID: GFHaHUOqTPOnYSKQNMjn8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="145638572"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 May 2025 01:51:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI1e4-000P7Y-1h;
	Thu, 22 May 2025 08:51:20 +0000
Date: Thu, 22 May 2025 16:50:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] ARM: dts: mxs: support i.MX28 Amarula rmm board
Message-ID: <202505221603.gbmkQMri-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250521092826.1035448-4-dario.binacchi@amarulasolutions.com>
References: <20250521092826.1035448-4-dario.binacchi@amarulasolutions.com>
TO: Dario Binacchi <dario.binacchi@amarulasolutions.com>
TO: linux-kernel@vger.kernel.org
CC: linux-amarula@amarulasolutions.com
CC: michael@amarulasolutions.com
CC: Dario Binacchi <dario.binacchi@amarulasolutions.com>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Fabio Estevam <festevam@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: Rob Herring <robh@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>
CC: Shawn Guo <shawnguo@kernel.org>
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org

Hi Dario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4a95bc121ccdaee04c4d72f84dbfa6b880a514b6]

url:    https://github.com/intel-lab-lkp/linux/commits/Dario-Binacchi/ARM-dts-imx28-add-pwm7-muxing-options/20250521-173049
base:   4a95bc121ccdaee04c4d72f84dbfa6b880a514b6
patch link:    https://lore.kernel.org/r/20250521092826.1035448-4-dario.binacchi%40amarulasolutions.com
patch subject: [PATCH 3/3] ARM: dts: mxs: support i.MX28 Amarula rmm board
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arm-randconfig-002-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221603.gbmkQMri-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221603.gbmkQMri-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505221603.gbmkQMri-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:202.20-211.4: Warning (unit_address_vs_reg): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/hog-0: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:213.32-222.4: Warning (unit_address_vs_reg): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/edt-ft5x06-0: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:224.41-230.4: Warning (unit_address_vs_reg): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/edt-ft5x06-wake-0: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:232.39-238.4: Warning (unit_address_vs_reg): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/fec-3v3-enable-0: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:240.20-250.4: Warning (unit_address_vs_reg): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/leds-0: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:252.43-258.4: Warning (unit_address_vs_reg): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0-vbus-enable-0: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:260.43-266.4: Warning (unit_address_vs_reg): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1-vbus-enable-0: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:202.20-211.4: Warning (simple_bus_reg): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/hog-0: simple-bus unit address format error, expected "0"
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:213.32-222.4: Warning (simple_bus_reg): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/edt-ft5x06-0: simple-bus unit address format error, expected "0"
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:224.41-230.4: Warning (simple_bus_reg): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/edt-ft5x06-wake-0: simple-bus unit address format error, expected "0"
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:232.39-238.4: Warning (simple_bus_reg): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/fec-3v3-enable-0: simple-bus unit address format error, expected "0"
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:240.20-250.4: Warning (simple_bus_reg): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/leds-0: simple-bus unit address format error, expected "0"
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:252.43-258.4: Warning (simple_bus_reg): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0-vbus-enable-0: simple-bus unit address format error, expected "0"
>> arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts:260.43-266.4: Warning (simple_bus_reg): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1-vbus-enable-0: simple-bus unit address format error, expected "0"
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:176.19-184.7: Warning (unique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart-4pins@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart-4pins@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-nand@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-nand@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-nand@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-status-cfg@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-status-cfg@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-status-cfg@0)

vim +202 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts

2706cb096398e6 Dario Binacchi 2025-05-21  197  
2706cb096398e6 Dario Binacchi 2025-05-21  198  &pinctrl {
2706cb096398e6 Dario Binacchi 2025-05-21  199  	pinctrl-names = "default";
2706cb096398e6 Dario Binacchi 2025-05-21  200  	pinctrl-0 = <&hog_pins_a>;
2706cb096398e6 Dario Binacchi 2025-05-21  201  
2706cb096398e6 Dario Binacchi 2025-05-21 @202  	hog_pins_a: hog-0 {
2706cb096398e6 Dario Binacchi 2025-05-21  203  		reg = <0>;
2706cb096398e6 Dario Binacchi 2025-05-21  204  		fsl,pinmux-ids = <
2706cb096398e6 Dario Binacchi 2025-05-21  205  			MX28_PAD_LCD_RESET__GPIO_3_30 /* LCD reset */
2706cb096398e6 Dario Binacchi 2025-05-21  206  			MX28_PAD_SSP2_SS1__GPIO_2_20  /* External power */
2706cb096398e6 Dario Binacchi 2025-05-21  207  		>;
2706cb096398e6 Dario Binacchi 2025-05-21  208  		fsl,drive-strength = <MXS_DRIVE_4mA>;
2706cb096398e6 Dario Binacchi 2025-05-21  209  		fsl,voltage = <MXS_VOLTAGE_HIGH>;
2706cb096398e6 Dario Binacchi 2025-05-21  210  		fsl,pull-up = <MXS_PULL_DISABLE>;
2706cb096398e6 Dario Binacchi 2025-05-21  211  	};
2706cb096398e6 Dario Binacchi 2025-05-21  212  
2706cb096398e6 Dario Binacchi 2025-05-21 @213  	edt_ft5x06_pins: edt-ft5x06-0 {
2706cb096398e6 Dario Binacchi 2025-05-21  214  		reg = <0>;
2706cb096398e6 Dario Binacchi 2025-05-21  215  		fsl,pinmux-ids = <
2706cb096398e6 Dario Binacchi 2025-05-21  216  			MX28_PAD_GPMI_RDY1__GPIO_0_21 /* Reset */
2706cb096398e6 Dario Binacchi 2025-05-21  217  			MX28_PAD_GPMI_CE3N__GPIO_0_19 /* Interrupt */
2706cb096398e6 Dario Binacchi 2025-05-21  218  		>;
2706cb096398e6 Dario Binacchi 2025-05-21  219  		fsl,drive-strength = <MXS_DRIVE_4mA>;
2706cb096398e6 Dario Binacchi 2025-05-21  220  		fsl,voltage = <MXS_VOLTAGE_HIGH>;
2706cb096398e6 Dario Binacchi 2025-05-21  221  		fsl,pull-up = <MXS_PULL_ENABLE>;
2706cb096398e6 Dario Binacchi 2025-05-21  222  	};
2706cb096398e6 Dario Binacchi 2025-05-21  223  
2706cb096398e6 Dario Binacchi 2025-05-21 @224  	edt_ft5x06_wake_pin: edt-ft5x06-wake-0 {
2706cb096398e6 Dario Binacchi 2025-05-21  225  		reg = <0>;
2706cb096398e6 Dario Binacchi 2025-05-21  226  		fsl,pinmux-ids = <MX28_PAD_GPMI_CE2N__GPIO_0_18>;
2706cb096398e6 Dario Binacchi 2025-05-21  227  		fsl,drive-strength = <MXS_DRIVE_16mA>;
2706cb096398e6 Dario Binacchi 2025-05-21  228  		fsl,voltage = <MXS_VOLTAGE_HIGH>;
2706cb096398e6 Dario Binacchi 2025-05-21  229  		fsl,pull-up = <MXS_PULL_DISABLE>;
2706cb096398e6 Dario Binacchi 2025-05-21  230  	};
2706cb096398e6 Dario Binacchi 2025-05-21  231  
2706cb096398e6 Dario Binacchi 2025-05-21 @232  	fec_3v3_enable_pin: fec-3v3-enable-0 {
2706cb096398e6 Dario Binacchi 2025-05-21  233  		reg = <0>;
2706cb096398e6 Dario Binacchi 2025-05-21  234  		fsl,pinmux-ids = <MX28_PAD_SPDIF__GPIO_3_27>;
2706cb096398e6 Dario Binacchi 2025-05-21  235  		fsl,drive-strength = <MXS_DRIVE_4mA>;
2706cb096398e6 Dario Binacchi 2025-05-21  236  		fsl,voltage = <MXS_VOLTAGE_HIGH>;
2706cb096398e6 Dario Binacchi 2025-05-21  237  		fsl,pull-up = <MXS_PULL_DISABLE>;
2706cb096398e6 Dario Binacchi 2025-05-21  238  	};
2706cb096398e6 Dario Binacchi 2025-05-21  239  
2706cb096398e6 Dario Binacchi 2025-05-21 @240  	leds_pins: leds-0 {
2706cb096398e6 Dario Binacchi 2025-05-21  241  		reg = <0>;
2706cb096398e6 Dario Binacchi 2025-05-21  242  		fsl,pinmux-ids = <
2706cb096398e6 Dario Binacchi 2025-05-21  243  			MX28_PAD_SSP0_DATA7__GPIO_2_7
2706cb096398e6 Dario Binacchi 2025-05-21  244  			MX28_PAD_PWM0__GPIO_3_16
2706cb096398e6 Dario Binacchi 2025-05-21  245  			MX28_PAD_PWM1__GPIO_3_17
2706cb096398e6 Dario Binacchi 2025-05-21  246  		>;
2706cb096398e6 Dario Binacchi 2025-05-21  247  		fsl,drive-strength = <MXS_DRIVE_4mA>;
2706cb096398e6 Dario Binacchi 2025-05-21  248  		fsl,voltage = <MXS_VOLTAGE_HIGH>;
2706cb096398e6 Dario Binacchi 2025-05-21  249  		fsl,pull-up = <MXS_PULL_DISABLE>;
2706cb096398e6 Dario Binacchi 2025-05-21  250  	};
2706cb096398e6 Dario Binacchi 2025-05-21  251  
2706cb096398e6 Dario Binacchi 2025-05-21 @252  	usb0_vbus_enable_pin: usb0-vbus-enable-0 {
2706cb096398e6 Dario Binacchi 2025-05-21  253  		reg = <0>;
2706cb096398e6 Dario Binacchi 2025-05-21  254  		fsl,pinmux-ids = <MX28_PAD_SSP0_DATA5__GPIO_2_5>;
2706cb096398e6 Dario Binacchi 2025-05-21  255  		fsl,drive-strength = <MXS_DRIVE_4mA>;
2706cb096398e6 Dario Binacchi 2025-05-21  256  		fsl,voltage = <MXS_VOLTAGE_HIGH>;
2706cb096398e6 Dario Binacchi 2025-05-21  257  		fsl,pull-up = <MXS_PULL_DISABLE>;
2706cb096398e6 Dario Binacchi 2025-05-21  258  	};
2706cb096398e6 Dario Binacchi 2025-05-21  259  
2706cb096398e6 Dario Binacchi 2025-05-21 @260  	usb1_vbus_enable_pin: usb1-vbus-enable-0 {
2706cb096398e6 Dario Binacchi 2025-05-21  261  		reg = <0>;
2706cb096398e6 Dario Binacchi 2025-05-21  262  		fsl,pinmux-ids = <MX28_PAD_SSP0_DATA6__GPIO_2_6>;
2706cb096398e6 Dario Binacchi 2025-05-21  263  		fsl,drive-strength = <MXS_DRIVE_4mA>;
2706cb096398e6 Dario Binacchi 2025-05-21  264  		fsl,voltage = <MXS_VOLTAGE_HIGH>;
2706cb096398e6 Dario Binacchi 2025-05-21  265  		fsl,pull-up = <MXS_PULL_DISABLE>;
2706cb096398e6 Dario Binacchi 2025-05-21  266  	};
2706cb096398e6 Dario Binacchi 2025-05-21  267  };
2706cb096398e6 Dario Binacchi 2025-05-21  268  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
