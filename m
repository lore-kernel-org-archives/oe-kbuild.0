Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082AC817
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Aug 2024 16:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723825328; cv=none; b=irYIb1SxAKmx5ndCdxh9vcuFl6caQalRePBv2NXpNbxOxY9H9CM7tyspYvsInpBdqDCZk+owP/W3e7HXSnWhfdzka/Ze44PN4ezcyYYGOU5FLd/PYe+iggdh7R8c1dZ/wpINBan/Cj43HyJWoNkCCn+n3XHaSeA3oh92dQAsq38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723825328; c=relaxed/simple;
	bh=L4WdK9R1ly1gusZFGa0iicVB59aTF6oVkJm+hSY5+5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EwCp8Ly1lgjbpmmi1TSo8e/BzUfPeuMQIUbIQQLAsedWPvE5OM5HihLmF57WjdquEUdbK4lcc4EASQNFuY1NZPXt/+oEtc2Z4RReQdCdn+OT3rxzzhQpM5YJ5YX3C+fXlRgzqM/fihSJA31UvyCa0TaNGGqsrwZMdZIwlSJgbyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OVoiFD07; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OVoiFD07"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723825326; x=1755361326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L4WdK9R1ly1gusZFGa0iicVB59aTF6oVkJm+hSY5+5o=;
  b=OVoiFD07fmBJMebvyHqWSJ2cVkPNULQFxChTqFjIfQq45sBDXLCpD1+m
   4+sdqT0/T3VUx/eLmlWi+XokkGu2QCr2dDpxqN1RHTe1ZTv8KUQawh6n4
   BaU1Ni8QJHqkHg9jm8GLx8x2gnzoLf0x8fHeoX5cltcWvMTwXKcwvKunS
   krqYLBpqkxIjoDvw8HQ5KaNSMBd00AVhQCKtO7eGTVgC2kEdmyTdLitKC
   MvHAT9yL23JzAYRR/eyUoXilEt4e0RtO3OdmCFresiK8Uokhh7pYeZWFi
   GaV/eMB7UaGqbwCIRF1weazZ4gJWEoFWstf53EJtFebxDfQTRs3nFQ781
   g==;
X-CSE-ConnectionGUID: bGtcRkCST4K4BRlUkERZcw==
X-CSE-MsgGUID: ddUruVmWRnmWwwSbyHqtvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="39638671"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="39638671"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 09:22:05 -0700
X-CSE-ConnectionGUID: 3fMaXIJXSr+xQbKPQtc9CQ==
X-CSE-MsgGUID: +BPopdloR9acr3I5slKrbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="59559848"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Aug 2024 09:22:04 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seziD-0006dL-2E;
	Fri, 16 Aug 2024 16:22:01 +0000
Date: Sat, 17 Aug 2024 00:21:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: imx8mm-emtop-baseboard: Add Peripherals
 Support
Message-ID: <202408162234.FMOVfanp-lkp@intel.com>
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
In-Reply-To: <20240814144957.93183-1-tarang.raval@siliconsignals.io>
References: <20240814144957.93183-1-tarang.raval@siliconsignals.io>
TO: Tarang Raval <tarang.raval@siliconsignals.io>
TO: shawnguo@kernel.org
TO: krzk+dt@kernel.org
TO: festevam@gmail.com
CC: tarang.raval@siliconsignals.io
CC: Rob Herring <robh@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Tarang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on next-20240816]
[cannot apply to linus/master v6.11-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tarang-Raval/arm64-dts-imx8mm-emtop-baseboard-Add-Peripherals-Support/20240815-001653
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20240814144957.93183-1-tarang.raval%40siliconsignals.io
patch subject: [PATCH] arm64: dts: imx8mm-emtop-baseboard: Add Peripherals Support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-002-20240815 (https://download.01.org/0day-ci/archive/20240816/202408162234.FMOVfanp-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408162234.FMOVfanp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408162234.FMOVfanp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts:69.30-78.5: Warning (unit_address_vs_reg): /regulators/regulator@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts:61.34-67.5: Warning (simple_bus_reg): /regulators/regulator-audio-vdd: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts:69.30-78.5: Warning (simple_bus_reg): /regulators/regulator@1: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts:56.13-79.4: Warning (avoid_unnecessary_addr_size): /regulators: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +69 arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts

cbd3ef64eb9d1b Himanshu Bhavani 2023-05-13    9  
cbd3ef64eb9d1b Himanshu Bhavani 2023-05-13   10  / {
cbd3ef64eb9d1b Himanshu Bhavani 2023-05-13   11  	model = "Emtop Embedded Solutions i.MX8M Mini Baseboard V1";
cbd3ef64eb9d1b Himanshu Bhavani 2023-05-13   12  	compatible = "ees,imx8mm-emtop-baseboard", "ees,imx8mm-emtop-som",
cbd3ef64eb9d1b Himanshu Bhavani 2023-05-13   13  		"fsl,imx8mm";
0145472f5d9909 Tarang Raval     2024-08-14   14  
0145472f5d9909 Tarang Raval     2024-08-14   15  	extcon_usb: extcon_usb1otg {
0145472f5d9909 Tarang Raval     2024-08-14   16  	        compatible = "linux,extcon-usb-gpio";
0145472f5d9909 Tarang Raval     2024-08-14   17  	        pinctrl-names = "default";
0145472f5d9909 Tarang Raval     2024-08-14   18  	        pinctrl-0 = <&pinctrl_extcon_usb>;
0145472f5d9909 Tarang Raval     2024-08-14   19  	        id-gpio = <&gpio1 10 GPIO_ACTIVE_HIGH>;
0145472f5d9909 Tarang Raval     2024-08-14   20  	        enable-gpio = <&gpio1 12 GPIO_ACTIVE_LOW>;
0145472f5d9909 Tarang Raval     2024-08-14   21  	};
0145472f5d9909 Tarang Raval     2024-08-14   22  
0145472f5d9909 Tarang Raval     2024-08-14   23  	modem_reset: modem-reset {
0145472f5d9909 Tarang Raval     2024-08-14   24  	        compatible = "gpio-reset";
0145472f5d9909 Tarang Raval     2024-08-14   25  	        reset-gpios = <&gpio2 6 GPIO_ACTIVE_LOW>;
0145472f5d9909 Tarang Raval     2024-08-14   26  	        reset-delay-us = <2000>;
0145472f5d9909 Tarang Raval     2024-08-14   27  	        reset-post-delay-ms = <40>;
0145472f5d9909 Tarang Raval     2024-08-14   28  	        #reset-cells = <0>;
0145472f5d9909 Tarang Raval     2024-08-14   29  	};
0145472f5d9909 Tarang Raval     2024-08-14   30  
0145472f5d9909 Tarang Raval     2024-08-14   31  	leds {
0145472f5d9909 Tarang Raval     2024-08-14   32  		compatible = "gpio-leds";
0145472f5d9909 Tarang Raval     2024-08-14   33  		pinctrl-names = "default";
0145472f5d9909 Tarang Raval     2024-08-14   34  		pinctrl-0 = <&pinctrl_gpio_led>;
0145472f5d9909 Tarang Raval     2024-08-14   35  
0145472f5d9909 Tarang Raval     2024-08-14   36  		beep {
0145472f5d9909 Tarang Raval     2024-08-14   37  		        label = "beep";
0145472f5d9909 Tarang Raval     2024-08-14   38  		        gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
0145472f5d9909 Tarang Raval     2024-08-14   39  		        default-state = "off";
0145472f5d9909 Tarang Raval     2024-08-14   40  		};
0145472f5d9909 Tarang Raval     2024-08-14   41  
0145472f5d9909 Tarang Raval     2024-08-14   42  		canbus_reset {
0145472f5d9909 Tarang Raval     2024-08-14   43  			label = "canbus_reset";
0145472f5d9909 Tarang Raval     2024-08-14   44  			gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
0145472f5d9909 Tarang Raval     2024-08-14   45  			default-state = "on";
0145472f5d9909 Tarang Raval     2024-08-14   46  		};
0145472f5d9909 Tarang Raval     2024-08-14   47  	};
0145472f5d9909 Tarang Raval     2024-08-14   48  
0145472f5d9909 Tarang Raval     2024-08-14   49  	osc_can: clock-osc-can {
0145472f5d9909 Tarang Raval     2024-08-14   50  		compatible = "fixed-clock";
0145472f5d9909 Tarang Raval     2024-08-14   51  		#clock-cells = <0>;
0145472f5d9909 Tarang Raval     2024-08-14   52  		clock-frequency = <16000000>;
0145472f5d9909 Tarang Raval     2024-08-14   53  		clock-output-names = "osc-can";
0145472f5d9909 Tarang Raval     2024-08-14   54  	};
0145472f5d9909 Tarang Raval     2024-08-14   55  
0145472f5d9909 Tarang Raval     2024-08-14  @56  	regulators {
0145472f5d9909 Tarang Raval     2024-08-14   57  		compatible = "simple-bus";
0145472f5d9909 Tarang Raval     2024-08-14   58  		#address-cells = <1>;
0145472f5d9909 Tarang Raval     2024-08-14   59  		#size-cells = <0>;
0145472f5d9909 Tarang Raval     2024-08-14   60  
0145472f5d9909 Tarang Raval     2024-08-14  @61  		reg_audio: regulator-audio-vdd {
0145472f5d9909 Tarang Raval     2024-08-14   62  		        compatible = "regulator-fixed";
0145472f5d9909 Tarang Raval     2024-08-14   63  		        regulator-name = "wm8904_supply";
0145472f5d9909 Tarang Raval     2024-08-14   64  		        regulator-min-microvolt = <1800000>;
0145472f5d9909 Tarang Raval     2024-08-14   65  		        regulator-max-microvolt = <1800000>;
0145472f5d9909 Tarang Raval     2024-08-14   66  		        regulator-always-on;
0145472f5d9909 Tarang Raval     2024-08-14   67  		};
0145472f5d9909 Tarang Raval     2024-08-14   68  
0145472f5d9909 Tarang Raval     2024-08-14  @69  		reg_wifi_vmmc: regulator@1 {
0145472f5d9909 Tarang Raval     2024-08-14   70  			compatible = "regulator-fixed";
0145472f5d9909 Tarang Raval     2024-08-14   71  			regulator-name = "vmmc";
0145472f5d9909 Tarang Raval     2024-08-14   72  			regulator-min-microvolt = <3300000>;
0145472f5d9909 Tarang Raval     2024-08-14   73  			regulator-max-microvolt = <3300000>;
0145472f5d9909 Tarang Raval     2024-08-14   74  			gpio = <&gpio2 10 GPIO_ACTIVE_HIGH>;
0145472f5d9909 Tarang Raval     2024-08-14   75  			off-on-delay = <20000>;
0145472f5d9909 Tarang Raval     2024-08-14   76  			startup-delay-us = <100>;
0145472f5d9909 Tarang Raval     2024-08-14   77  		        enable-active-high;
0145472f5d9909 Tarang Raval     2024-08-14   78  		};
0145472f5d9909 Tarang Raval     2024-08-14   79  	};
0145472f5d9909 Tarang Raval     2024-08-14   80  
0145472f5d9909 Tarang Raval     2024-08-14   81  	sound-wm8904 {
0145472f5d9909 Tarang Raval     2024-08-14   82  	        compatible = "simple-audio-card";
0145472f5d9909 Tarang Raval     2024-08-14   83  	        simple-audio-card,bitclock-master = <&dailink_master>;
0145472f5d9909 Tarang Raval     2024-08-14   84  	        simple-audio-card,format = "i2s";
0145472f5d9909 Tarang Raval     2024-08-14   85  	        simple-audio-card,frame-master = <&dailink_master>;
0145472f5d9909 Tarang Raval     2024-08-14   86  	        simple-audio-card,name = "wm8904-audio";
0145472f5d9909 Tarang Raval     2024-08-14   87  	        simple-audio-card,mclk-fs = <256>;
0145472f5d9909 Tarang Raval     2024-08-14   88  	        simple-audio-card,routing =
0145472f5d9909 Tarang Raval     2024-08-14   89  			"Headphone Jack", "HPOUTL",
0145472f5d9909 Tarang Raval     2024-08-14   90  			"Headphone Jack", "HPOUTR",
0145472f5d9909 Tarang Raval     2024-08-14   91  			"IN2L", "Line In Jack",
0145472f5d9909 Tarang Raval     2024-08-14   92  			"IN2R", "Line In Jack",
0145472f5d9909 Tarang Raval     2024-08-14   93  			"Headphone Jack", "MICBIAS",
0145472f5d9909 Tarang Raval     2024-08-14   94  			"IN1L", "Headphone Jack";
0145472f5d9909 Tarang Raval     2024-08-14   95  
0145472f5d9909 Tarang Raval     2024-08-14   96  	        simple-audio-card,widgets =
0145472f5d9909 Tarang Raval     2024-08-14   97  	                "Microphone","Headphone Jack",
0145472f5d9909 Tarang Raval     2024-08-14   98  	                "Headphone", "Headphone Jack",
0145472f5d9909 Tarang Raval     2024-08-14   99  	                "Line", "Line In Jack";
0145472f5d9909 Tarang Raval     2024-08-14  100  
0145472f5d9909 Tarang Raval     2024-08-14  101  	        dailink_master: simple-audio-card,codec {
0145472f5d9909 Tarang Raval     2024-08-14  102  	                sound-dai = <&wm8904>;
0145472f5d9909 Tarang Raval     2024-08-14  103  	        };
0145472f5d9909 Tarang Raval     2024-08-14  104  
0145472f5d9909 Tarang Raval     2024-08-14  105  	        simple-audio-card,cpu {
0145472f5d9909 Tarang Raval     2024-08-14  106  	                sound-dai = <&sai3>;
0145472f5d9909 Tarang Raval     2024-08-14  107  	        };
0145472f5d9909 Tarang Raval     2024-08-14  108  	};
0145472f5d9909 Tarang Raval     2024-08-14  109  
0145472f5d9909 Tarang Raval     2024-08-14  110  	sound-spdif {
0145472f5d9909 Tarang Raval     2024-08-14  111  	        compatible = "fsl,imx-audio-spdif";
0145472f5d9909 Tarang Raval     2024-08-14  112  	        model = "imx-spdif";
0145472f5d9909 Tarang Raval     2024-08-14  113  	        spdif-controller = <&spdif1>;
0145472f5d9909 Tarang Raval     2024-08-14  114  	        spdif-out;
0145472f5d9909 Tarang Raval     2024-08-14  115  	        spdif-in;
0145472f5d9909 Tarang Raval     2024-08-14  116  	};
0145472f5d9909 Tarang Raval     2024-08-14  117  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
