Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAB61B86F7
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Jul 2024 06:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722063201; cv=none; b=D+uxMIMtukYgCRrY8cKq8iwsy/xVprg2A6yxhcXqAbXHSKdITrA50ILTc7eUhA/KyXGt8CkaSIeUiGcRW5uIHi/t+RgeS/aL+I4x4ga8S/C+FX/lqnUnBrds8Yh44wMctmqB2wJGMzxU2EkIz9H7MRQWcbpZitoxxZHX+xId/Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722063201; c=relaxed/simple;
	bh=NNChucCM539MnmUO7TM/u7u9CCUpM42xUWQgDjMWYFA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LQsiZRdf6zTkH4lt67vmKOx5K4X2A4i/QexkLthcyneY4CvC9AapmL5Bmxi4qpS9tXTq4v/XQDQr174BxH5ISM0uz5h3igM5gw0K9AV2Pjyn2KlwGGDI9rGn+hybHMNOiexlyUauOTZRRJvvULufhzwHLinzn+hlTH7xV2GKp1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d5xHVeKy; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d5xHVeKy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722063199; x=1753599199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NNChucCM539MnmUO7TM/u7u9CCUpM42xUWQgDjMWYFA=;
  b=d5xHVeKyUx7HcPYh1FAYwtxa2SnuMwRSXj5SqoBqK7M3UVh4n8p4Ajoq
   gQLk+PYvgwAGdWc5NZjjJEhkJ0Q7WRMe76og4KAIgFw26eO+lrDhDIhc8
   6FFT5opcsQ82Xq6/8MPgIAP21H9ML+OpbCDNzYowgZj6uf2WKzQ/JPGJn
   Jhbgwq4TRJMao/8gLHDxargvUAgzliL7wN7fX0byXsrG+urpgc35ukxze
   S4gjltjTx19YigL3kFCgjqsJUxEZ0lNt5wa5TBaiNPwfiNR87O3jm2dMY
   NV7o94ir3to0lv40TUgyQP6FgoTMKru+YSpdjoEIMyaekq/p2SPwj1fZ0
   A==;
X-CSE-ConnectionGUID: KYsYo+ISSN2AeaM11tyT4Q==
X-CSE-MsgGUID: BQNS7nPhSqO0Kyn5PN7Smg==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="30472779"
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; 
   d="scan'208";a="30472779"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 23:53:18 -0700
X-CSE-ConnectionGUID: cQtFI2/OQzGQdfaYlY918g==
X-CSE-MsgGUID: GDUv7PhTSMyT7sWt/nztfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; 
   d="scan'208";a="53146124"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jul 2024 23:53:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXbIp-000pgy-1M;
	Sat, 27 Jul 2024 06:53:15 +0000
Date: Sat, 27 Jul 2024 14:53:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jcmvbkbc-xtensa:xtensa-6.10-esp32-usb 48/49]
 arch/xtensa/boot/dts/esp32s3.dtsi:68.20-73.5: Warning (simple_bus_reg):
 /clocks/usb_clk: missing or empty reg/ranges property
Message-ID: <202407271428.hVW68FTV-lkp@intel.com>
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
TO: Max Filippov <jcmvbkbc@gmail.com>

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.10-esp32-usb
head:   7eabc7d5f773ecd9e67d9dd3f9a283348d723de0
commit: 21db4c435519f4dec37d72f82c963b14979d7fc4 [48/49] WIP: xtensa: esp32s3: add USB host controller to dts
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20240727/202407271428.hVW68FTV-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240727/202407271428.hVW68FTV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407271428.hVW68FTV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/xtensa/boot/dts/esp32s3.dtsi:150.19-156.5: Warning (unit_address_vs_reg): /soc/syscon@60008000: node has a unit name, but no reg or ranges property
   arch/xtensa/boot/dts/esp32s3.dtsi:36.24-41.5: Warning (simple_bus_reg): /clocks/uart0_clk: missing or empty reg/ranges property
   arch/xtensa/boot/dts/esp32s3.dtsi:42.24-47.5: Warning (simple_bus_reg): /clocks/uart1_clk: missing or empty reg/ranges property
   arch/xtensa/boot/dts/esp32s3.dtsi:48.24-53.5: Warning (simple_bus_reg): /clocks/uart2_clk: missing or empty reg/ranges property
   arch/xtensa/boot/dts/esp32s3.dtsi:55.22-60.5: Warning (simple_bus_reg): /clocks/spi2_clk: missing or empty reg/ranges property
   arch/xtensa/boot/dts/esp32s3.dtsi:61.22-66.5: Warning (simple_bus_reg): /clocks/spi3_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32s3.dtsi:68.20-73.5: Warning (simple_bus_reg): /clocks/usb_clk: missing or empty reg/ranges property
   arch/xtensa/boot/dts/esp32s3.dtsi:150.19-156.5: Warning (simple_bus_reg): /soc/syscon@60008000: missing or empty reg/ranges property
   arch/xtensa/boot/dts/esp32s3.dtsi:167.27-174.5: Warning (simple_bus_reg): /soc/pinctrl@60009000: simple-bus unit address format error, expected "60009004"
   arch/xtensa/boot/dts/esp32s3.dtsi:291.23-301.5: Warning (simple_bus_reg): /soc/intc@600c2000: simple-bus unit address format error, expected "600c2800"
   arch/xtensa/boot/dts/esp32s3.dtsi:31.9-74.4: Warning (avoid_unnecessary_addr_size): /clocks: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/xtensa/boot/dts/esp32s3.dtsi:93.18-105.5: Warning (avoid_unnecessary_addr_size): /soc/flash@42000000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/xtensa/boot/dts/esp32s3.dtsi:145.21-148.5: Warning (unique_unit_address_if_enabled): /soc/lpm@60008000: duplicate unit-address (also used in node /soc/syscon@60008000)

vim +68 arch/xtensa/boot/dts/esp32s3.dtsi

81e0c4f14b8fdad Max Filippov 2019-12-15   3  
81e0c4f14b8fdad Max Filippov 2019-12-15   4  / {
81e0c4f14b8fdad Max Filippov 2019-12-15   5  	compatible = "esp32s3";
81e0c4f14b8fdad Max Filippov 2019-12-15   6  	#address-cells = <1>;
81e0c4f14b8fdad Max Filippov 2019-12-15   7  	#size-cells = <1>;
81e0c4f14b8fdad Max Filippov 2019-12-15   8  	interrupt-parent = <&pic>;
81e0c4f14b8fdad Max Filippov 2019-12-15   9  
81e0c4f14b8fdad Max Filippov 2019-12-15  10  	chosen {
81e0c4f14b8fdad Max Filippov 2019-12-15  11  		bootargs = "earlycon=esp32s3uart,mmio32,0x60000000,115200n8,40000000 console=ttyS0,115200n8 debug rw root=mtd:rootfs no_hash_pointers ";
81e0c4f14b8fdad Max Filippov 2019-12-15  12  	};
81e0c4f14b8fdad Max Filippov 2019-12-15  13  
81e0c4f14b8fdad Max Filippov 2019-12-15  14  	aliases {
81e0c4f14b8fdad Max Filippov 2019-12-15  15  		serial0 = "/soc/serial@60000000";
81e0c4f14b8fdad Max Filippov 2019-12-15  16  		serial1 = "/soc/serial@60010000";
81e0c4f14b8fdad Max Filippov 2019-12-15  17  		serial2 = "/soc/serial@6002e000";
81e0c4f14b8fdad Max Filippov 2019-12-15  18  		serial3 = "/soc/acm@60038000";
81e0c4f14b8fdad Max Filippov 2019-12-15  19  	};
81e0c4f14b8fdad Max Filippov 2019-12-15  20  
81e0c4f14b8fdad Max Filippov 2019-12-15  21  	cpus {
81e0c4f14b8fdad Max Filippov 2019-12-15  22  		#address-cells = <1>;
81e0c4f14b8fdad Max Filippov 2019-12-15  23  		#size-cells = <0>;
81e0c4f14b8fdad Max Filippov 2019-12-15  24  		cpu@0 {
81e0c4f14b8fdad Max Filippov 2019-12-15  25  			compatible = "cdns,xtensa-cpu";
81e0c4f14b8fdad Max Filippov 2019-12-15  26  			reg = <0>;
81e0c4f14b8fdad Max Filippov 2019-12-15  27  			clocks = <&clk 1>;
81e0c4f14b8fdad Max Filippov 2019-12-15  28  		};
81e0c4f14b8fdad Max Filippov 2019-12-15  29  	};
81e0c4f14b8fdad Max Filippov 2019-12-15  30  
81e0c4f14b8fdad Max Filippov 2019-12-15  31  	clocks {
81e0c4f14b8fdad Max Filippov 2019-12-15  32  		compatible = "simple-bus";
81e0c4f14b8fdad Max Filippov 2019-12-15  33  		#address-cells = <1>;
81e0c4f14b8fdad Max Filippov 2019-12-15  34  		#size-cells = <0>;
81e0c4f14b8fdad Max Filippov 2019-12-15  35  
81e0c4f14b8fdad Max Filippov 2019-12-15  36  		uart0_clk: uart0_clk {
81e0c4f14b8fdad Max Filippov 2019-12-15  37  			#clock-cells = <0>;
81e0c4f14b8fdad Max Filippov 2019-12-15  38  			compatible = "gpio-gate-clock";
81e0c4f14b8fdad Max Filippov 2019-12-15  39  			clocks = <&clk 0>;
81e0c4f14b8fdad Max Filippov 2019-12-15  40  			enable-gpios = <&clk_gpio0 2 0>;
81e0c4f14b8fdad Max Filippov 2019-12-15  41  		};
81e0c4f14b8fdad Max Filippov 2019-12-15  42  		uart1_clk: uart1_clk {
81e0c4f14b8fdad Max Filippov 2019-12-15  43  			#clock-cells = <0>;
81e0c4f14b8fdad Max Filippov 2019-12-15  44  			compatible = "gpio-gate-clock";
81e0c4f14b8fdad Max Filippov 2019-12-15  45  			clocks = <&clk 0>;
81e0c4f14b8fdad Max Filippov 2019-12-15  46  			enable-gpios = <&clk_gpio0 5 0>;
81e0c4f14b8fdad Max Filippov 2019-12-15  47  		};
81e0c4f14b8fdad Max Filippov 2019-12-15  48  		uart2_clk: uart2_clk {
81e0c4f14b8fdad Max Filippov 2019-12-15  49  			#clock-cells = <0>;
81e0c4f14b8fdad Max Filippov 2019-12-15  50  			compatible = "gpio-gate-clock";
81e0c4f14b8fdad Max Filippov 2019-12-15  51  			clocks = <&clk 0>;
81e0c4f14b8fdad Max Filippov 2019-12-15  52  			enable-gpios = <&clk_gpio1 9 0>;
81e0c4f14b8fdad Max Filippov 2019-12-15  53  		};
81e0c4f14b8fdad Max Filippov 2019-12-15  54  
81e0c4f14b8fdad Max Filippov 2019-12-15  55  		spi2_clk: spi2_clk {
81e0c4f14b8fdad Max Filippov 2019-12-15  56  			#clock-cells = <0>;
81e0c4f14b8fdad Max Filippov 2019-12-15  57  			compatible = "gpio-gate-clock";
81e0c4f14b8fdad Max Filippov 2019-12-15  58  			clocks = <&clk 2>;
81e0c4f14b8fdad Max Filippov 2019-12-15  59  			enable-gpios = <&clk_gpio0 6 0>;
81e0c4f14b8fdad Max Filippov 2019-12-15  60  		};
81e0c4f14b8fdad Max Filippov 2019-12-15  61  		spi3_clk: spi3_clk {
81e0c4f14b8fdad Max Filippov 2019-12-15  62  			#clock-cells = <0>;
81e0c4f14b8fdad Max Filippov 2019-12-15  63  			compatible = "gpio-gate-clock";
81e0c4f14b8fdad Max Filippov 2019-12-15  64  			clocks = <&clk 2>;
81e0c4f14b8fdad Max Filippov 2019-12-15  65  			enable-gpios = <&clk_gpio0 16 0>;
81e0c4f14b8fdad Max Filippov 2019-12-15  66  		};
21db4c435519f4d Max Filippov 2024-07-13  67  
21db4c435519f4d Max Filippov 2024-07-13 @68  		usb_clk: usb_clk {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
