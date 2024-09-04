Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6396C446CF
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Sep 2024 02:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725418489; cv=none; b=eUqxJnwr6/gOpD3f2bH95kEt7MuxNLD8rceFLxVFdW/p+FdtHRSgjelTBS095+VpyY3uemdwdOEd+M83z7agScN1vaTX8ORS+6YjCGb1ChCbn/89W4NSTbM5ipy/PO3L+/eMBw25vmay8Q+D+Bu7ZRi5RAh7UiOoxiZmQYfJUSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725418489; c=relaxed/simple;
	bh=3LoFFewCWtevJ7IgXfgP05GQhq4VI5RNa9OErH5cuj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TIEa3aTePNCHknbND2X9leco8nrkkFOrwaFm0cE+iQPQHVkmc7DrIw20XlPy/OClIINK6aveCQ9oN6KgyXPBakyjUMdyW8vRGNKo3i9M2XuP5ODSke+y5QieyVI8qLHDluKd7XKsfyJPgxIh6s8AWNTxzPzlzG+fIK7s4bUw1Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gvdxD0F1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gvdxD0F1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725418487; x=1756954487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3LoFFewCWtevJ7IgXfgP05GQhq4VI5RNa9OErH5cuj0=;
  b=gvdxD0F1my0yz9hfFtUQZO/l71jC6CjAGQLtAw09VVQCs6FajHi1ViXk
   UwIxQv61McetMvc8kPDr3Xl652Mw42leIAnVslfGB6QEPBoFi7hPLboj9
   gcw4bonxbgLkhs1aWpGzqzJRaayK/FDOuUGuSnggK6/4UdKnLC6MZRGzz
   1atigoivLeH4GsuozC9FCCyRHVPXGaGwFp3jpf16Acm0W2UvJV/N8+3KF
   fXJ6c/dvj48sVlPGuvzTlrFr14OiS+Ibcmf9afBOBSgQzJro3zZF2z+ZJ
   XmRM5RtzZKZATrKyEPckhAdyaHRdmXdJ7onrTIFVAGdCkZNBXAoJK36oy
   A==;
X-CSE-ConnectionGUID: vfnb06EuSIe+7uFfA5rY2w==
X-CSE-MsgGUID: YW+rFz1nQI6umrtJF+iXrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="26966300"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="26966300"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 19:54:46 -0700
X-CSE-ConnectionGUID: kYQhqVEcTnWgEdZAFu9oVA==
X-CSE-MsgGUID: Cy5zAUkZSmO271Otpa8MpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="65357267"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Sep 2024 19:54:45 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slgAN-0007Tg-24;
	Wed, 04 Sep 2024 02:54:43 +0000
Date: Wed, 4 Sep 2024 10:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:6.10-main 42/48]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-v0.dts:32.9-34.4:
 Warning (unit_address_vs_reg): /memory: node has a reg or ranges property,
 but no unit name
Message-ID: <202409041038.hNpO09kO-lkp@intel.com>
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
head:   aa65044c8c373f14a6677cf3e0b201d8ea45b86e
commit: dfb82080654ef1cd3d38b3c709cee4a6e152040d [42/48] arch: arm64: mt7988: fix missing i2c1_sfp_pins for r4v0
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-002-20240904 (https://download.01.org/0day-ci/archive/20240904/202409041038.hNpO09kO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409041038.hNpO09kO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409041038.hNpO09kO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1043.23-1064.5: Warning (unit_address_vs_reg): /soc/tphy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1076.23-1098.5: Warning (unit_address_vs_reg): /soc/xphy@11e10000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-v0.dts:32.9-34.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1043.23-1064.5: Warning (simple_bus_reg): /soc/tphy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1076.23-1098.5: Warning (simple_bus_reg): /soc/xphy@11e10000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1159.27-1320.5: Warning (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +32 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-v0.dts

0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   13  
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   14  / {
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   15  	model = "Bananapi BPI-R4 V00";
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   16  	compatible = "bananapi,bpi-r4",
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   17  		     "mediatek,mt7988";
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   18  
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   19  	aliases {
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   20  		serial0 = &uart0;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   21  		led-boot = &led_green;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   22  		led-failsafe = &led_green;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   23  		led-running = &led_green;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   24  		led-upgrade = &led_green;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   25  	};
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   26  
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   27  	chosen {
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   28  		stdout-path = &uart0;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   29  		bootargs = "console=ttyS0,115200n1 loglevel=8 pci=pcie_bus_perf";
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   30  	};
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   31  
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30  @32  	memory {
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   33  		reg = <0x00 0x40000000 0x00 0x10000000>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   34  	};
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   35  
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   36  	regulator-sfp1-3v3 {
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   37  		compatible = "regulator-fixed";
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   38  		regulator-name = "sfp1";
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   39  		regulator-min-microvolt = <3300000>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   40  		regulator-max-microvolt = <3300000>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   41  		gpio = <&pio 82 GPIO_ACTIVE_LOW>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   42  		regulator-always-on;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   43  	};
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   44  
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   45  	regulator-sfp2-3v3 {
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   46  		compatible = "regulator-fixed";
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   47  		regulator-name = "sfp2";
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   48  		regulator-min-microvolt = <3300000>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   49  		regulator-max-microvolt = <3300000>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   50  		gpio = <&pio 83 GPIO_ACTIVE_LOW>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   51  		regulator-always-on;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   52  	};
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   53  
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   54  	/* left SFP cage (wan) using hardware i2c bus */
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   55  	sfp0: sfp1-wan {
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   56  		compatible = "sff,sfp";
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   57  		i2c-bus = <&i2c1>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   58  		mod-def0-gpios = <&pio 12 GPIO_ACTIVE_LOW>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   59  		los-gpios = <&pio 68 GPIO_ACTIVE_HIGH>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   60  		tx-disable-gpios = <&pio 11 GPIO_ACTIVE_HIGH>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   61  		rate-select0-gpios = <&pio 54 GPIO_ACTIVE_LOW>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   62  		maximum-power-milliwatt = <3000>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   63  	};
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   64  
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   65  	/* i2c of the right SFP cage (lan) */
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   66  	i2c_sfp2: i2c-gpio-0 {
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   67  		compatible = "i2c-gpio";
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   68  		sda-gpios = <&pio 51 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   69  		scl-gpios = <&pio 53 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   70  		i2c-gpio,delay-us = <2>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   71  		#address-cells = <1>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   72  		#size-cells = <0>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   73  	};
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   74  
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   75  	sfp1: sfp2-lan {
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   76  		compatible = "sff,sfp";
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   77  		i2c-bus = <&i2c_sfp2>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   78  		mod-def0-gpios = <&pio 52 GPIO_ACTIVE_LOW>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   79  		los-gpios = <&pio 80 GPIO_ACTIVE_HIGH>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   80  		tx-disable-gpios = <&pio 21 GPIO_ACTIVE_HIGH>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   81  		rate-select0-gpios = <&pio 81 GPIO_ACTIVE_LOW>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   82  		maximum-power-milliwatt = <3000>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   83  	};
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   84  
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   85  	gpio-keys {
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   86  		compatible = "gpio-keys";
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   87  
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   88  		factory {
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   89  			label = "RST";
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   90  			linux,code = <KEY_RESTART>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   91  			gpios = <&pio 13 GPIO_ACTIVE_LOW>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   92  		};
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   93  
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   94  		wps {
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   95  			label = "WPS";
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   96  			linux,code = <KEY_WPS_BUTTON>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   97  			gpios = <&pio 14 GPIO_ACTIVE_LOW>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   98  		};
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30   99  	};
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30  100  
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30  101  	gpio-leds {
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30  102  		compatible = "gpio-leds";
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30  103  
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30  104  		led_green: led-green {
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30  105  			label = "status:green";
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30  106  			function = LED_FUNCTION_STATUS;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30  107  			color = <LED_COLOR_ID_GREEN>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30  108  			gpios = <&pio 64 GPIO_ACTIVE_HIGH>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30  109  			default-state = "on";
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30  110  		};
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30  111  
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30  112  		led_blue: led-blue {
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30  113  			label = "wps:blue";
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30  114  			function = LED_FUNCTION_WPS;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30  115  			color = <LED_COLOR_ID_BLUE>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30  116  			gpios = <&pio 65 GPIO_ACTIVE_HIGH>;
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30  117  			default-state = "off";
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30  118  		};
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30  119  	};
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30  120  };
0d9a44a71fa7f4a Frank Wunderlich 2023-09-30  121  

:::::: The code at line 32 was first introduced by commit
:::::: 0d9a44a71fa7f4a48f2c3ab79ee2e765c93729a4 arm64: dts: mt7988: add bpi-r4 v0

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
