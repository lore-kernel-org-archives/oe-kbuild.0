Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416531E22E9
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jan 2025 16:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736268404; cv=none; b=ohh1DL3qupRBduOimYoCIa/uJYD69pNuCud7IeHl4bGvHLwOSYrT+ELR5cmgDpWbZcYmAkQsrPAuYc3MIe2uE+J4ekzVKycOpvGtbdM6dSvJyuMcwrEiQdguI4XpDctlWSoj+DTC5IERKk+uNdWXBbgNT/sKfVnMYzKK8YZFpEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736268404; c=relaxed/simple;
	bh=CA6QYHtGzZYqXuNAXmO8GCRQGGwTqabutaCN8hdgSrI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=majQY3kAYFbpcFxUaB0qX77naVk7iGwjxuXZ1q3uri0CbX/Wn3N3j73b4nk9Nw5kbVw7pR/5WbpZOMkRPsEKKfRb4jS3CVD5fHdreUz2OnkJeFncEFnsgJ+yTCYfUmRxxiGtOfu5noU2RycHTN9Q6RXrL5Bu+J5jpRpyzSzzNxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hsUxMBIN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsUxMBIN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736268400; x=1767804400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CA6QYHtGzZYqXuNAXmO8GCRQGGwTqabutaCN8hdgSrI=;
  b=hsUxMBINuqyA06ozFkjhUNSGsh4rPZlubFWXQWmIq+8FIqWYRNDRUFtC
   M8Ag3uuAM0PpA06m0QGiAhixsum9B49NAoA6pHsAz0xyOW9kZVvYRQdel
   4oPfiRHKvxdOxoTtkoS+xJRbnbb8AjL5jNk4RjcWQJDs5jnJkTVpzMus+
   E7MnZHLvVRMIFauNxMz4kXdzRfOc+0WYeOkxZqaisD4VWMDqoyG7Ef5G1
   al5dznbuFm5tCbnF+Et7teFe/D5pTwD6WIJ7UdCM132eUVHkquR63S68L
   PgGN4plvlfX3rWhE1Cob8aYZwey3L95ZzLPe9d+bnwMS7Yg7tKbMAcCHv
   g==;
X-CSE-ConnectionGUID: vp7TB8kWRLevITwAMpKkGw==
X-CSE-MsgGUID: OxyngUKoT3mt8XmFPUNiwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47041029"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="47041029"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 08:46:39 -0800
X-CSE-ConnectionGUID: qsHlIgIbR067XRfrFIscDg==
X-CSE-MsgGUID: j6jDe5xSSNSbdJy0G+x6Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="102882623"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Jan 2025 08:46:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVCiy-000F0Q-02;
	Tue, 07 Jan 2025 16:46:36 +0000
Date: Wed, 8 Jan 2025 00:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/nxp/imx/imx7s.dtsi:192.33-204.6: Warning
 (graph_child_address): /soc/funnel@30041000/in-ports: graph node has single
 child node 'port@0', #address-cells/#size-cells are not necessary
Message-ID: <202501080040.QScjl87B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: Shawn Guo <shawnguo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fbfd64d25c7af3b8695201ebc85efe90be28c5a3
commit: 0d4ac04fa7c3f6dc263dba6f575a2ec7a2d4eca8 ARM: dts: imx7d: Fix coresight funnel ports
date:   1 year, 1 month ago
:::::: branch date: 22 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm-randconfig-003-20250105 (https://download.01.org/0day-ci/archive/20250108/202501080040.QScjl87B-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501080040.QScjl87B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501080040.QScjl87B-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/nxp/imx/imx7s.dtsi:192.33-204.6: Warning (graph_child_address): /soc/funnel@30041000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +192 arch/arm/boot/dts/nxp/imx/imx7s.dtsi

949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   13  
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   14  / {
7f107887d1995c arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2016-11-12   15  	#address-cells = <1>;
7f107887d1995c arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2016-11-12   16  	#size-cells = <1>;
a971c5545c3d45 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-01-23   17  	/*
a971c5545c3d45 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-01-23   18  	 * The decompressor and also some bootloaders rely on a
a971c5545c3d45 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-01-23   19  	 * pre-existing /chosen node to be available to insert the
a971c5545c3d45 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-01-23   20  	 * command line and merge other ATAGS info.
a971c5545c3d45 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-01-23   21  	 */
a971c5545c3d45 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-01-23   22  	chosen {};
7f107887d1995c arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2016-11-12   23  
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   24  	aliases {
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   25  		gpio0 = &gpio1;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   26  		gpio1 = &gpio2;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   27  		gpio2 = &gpio3;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   28  		gpio3 = &gpio4;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   29  		gpio4 = &gpio5;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   30  		gpio5 = &gpio6;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   31  		gpio6 = &gpio7;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   32  		i2c0 = &i2c1;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   33  		i2c1 = &i2c2;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   34  		i2c2 = &i2c3;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   35  		i2c3 = &i2c4;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   36  		mmc0 = &usdhc1;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   37  		mmc1 = &usdhc2;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   38  		mmc2 = &usdhc3;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   39  		serial0 = &uart1;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   40  		serial1 = &uart2;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   41  		serial2 = &uart3;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   42  		serial3 = &uart4;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   43  		serial4 = &uart5;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   44  		serial5 = &uart6;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   45  		serial6 = &uart7;
b754af313fb499 arch/arm/boot/dts/imx7d.dtsi Diego Dorta      2016-06-22   46  		spi0 = &ecspi1;
b754af313fb499 arch/arm/boot/dts/imx7d.dtsi Diego Dorta      2016-06-22   47  		spi1 = &ecspi2;
b754af313fb499 arch/arm/boot/dts/imx7d.dtsi Diego Dorta      2016-06-22   48  		spi2 = &ecspi3;
b754af313fb499 arch/arm/boot/dts/imx7d.dtsi Diego Dorta      2016-06-22   49  		spi3 = &ecspi4;
5c8b3b8a182cbc arch/arm/boot/dts/imx7s.dtsi Peng Fan         2020-11-01   50  		usb0 = &usbotg1;
5c8b3b8a182cbc arch/arm/boot/dts/imx7s.dtsi Peng Fan         2020-11-01   51  		usb1 = &usbh;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   52  	};
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   53  
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   54  	cpus {
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   55  		#address-cells = <1>;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   56  		#size-cells = <0>;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   57  
6f4ec8842dd2b6 arch/arm/boot/dts/imx7s.dtsi Anson Huang      2018-09-03   58  		idle-states {
6f4ec8842dd2b6 arch/arm/boot/dts/imx7s.dtsi Anson Huang      2018-09-03   59  			entry-method = "psci";
6f4ec8842dd2b6 arch/arm/boot/dts/imx7s.dtsi Anson Huang      2018-09-03   60  
6f4ec8842dd2b6 arch/arm/boot/dts/imx7s.dtsi Anson Huang      2018-09-03   61  			cpu_sleep_wait: cpu-sleep-wait {
6f4ec8842dd2b6 arch/arm/boot/dts/imx7s.dtsi Anson Huang      2018-09-03   62  				compatible = "arm,idle-state";
6f4ec8842dd2b6 arch/arm/boot/dts/imx7s.dtsi Anson Huang      2018-09-03   63  				arm,psci-suspend-param = <0x0010000>;
6f4ec8842dd2b6 arch/arm/boot/dts/imx7s.dtsi Anson Huang      2018-09-03   64  				local-timer-stop;
6f4ec8842dd2b6 arch/arm/boot/dts/imx7s.dtsi Anson Huang      2018-09-03   65  				entry-latency-us = <100>;
6f4ec8842dd2b6 arch/arm/boot/dts/imx7s.dtsi Anson Huang      2018-09-03   66  				exit-latency-us = <50>;
6f4ec8842dd2b6 arch/arm/boot/dts/imx7s.dtsi Anson Huang      2018-09-03   67  				min-residency-us = <1000>;
6f4ec8842dd2b6 arch/arm/boot/dts/imx7s.dtsi Anson Huang      2018-09-03   68  			};
6f4ec8842dd2b6 arch/arm/boot/dts/imx7s.dtsi Anson Huang      2018-09-03   69  		};
6f4ec8842dd2b6 arch/arm/boot/dts/imx7s.dtsi Anson Huang      2018-09-03   70  
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   71  		cpu0: cpu@0 {
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   72  			compatible = "arm,cortex-a7";
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   73  			device_type = "cpu";
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   74  			reg = <0>;
1c4e2a11bac4b5 arch/arm/boot/dts/imx7s.dtsi Stefan Agner     2016-08-11   75  			clock-frequency = <792000000>;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   76  			clock-latency = <61036>; /* two CLK32 periods */
698e2ac5361f6f arch/arm/boot/dts/imx7d.dtsi Bai Ping         2015-11-24   77  			clocks = <&clks IMX7D_CLK_ARM>;
6f4ec8842dd2b6 arch/arm/boot/dts/imx7s.dtsi Anson Huang      2018-09-03   78  			cpu-idle-states = <&cpu_sleep_wait>;
4ce9f72e008b50 arch/arm/boot/dts/imx7s.dtsi Denys Drozdov    2022-01-24   79  			operating-points-v2 = <&cpu0_opp_table>;
4ce9f72e008b50 arch/arm/boot/dts/imx7s.dtsi Denys Drozdov    2022-01-24   80  			#cooling-cells = <2>;
4ce9f72e008b50 arch/arm/boot/dts/imx7s.dtsi Denys Drozdov    2022-01-24   81  			nvmem-cells = <&fuse_grade>;
4ce9f72e008b50 arch/arm/boot/dts/imx7s.dtsi Denys Drozdov    2022-01-24   82  			nvmem-cell-names = "speed_grade";
4ce9f72e008b50 arch/arm/boot/dts/imx7s.dtsi Denys Drozdov    2022-01-24   83  		};
4ce9f72e008b50 arch/arm/boot/dts/imx7s.dtsi Denys Drozdov    2022-01-24   84  	};
4ce9f72e008b50 arch/arm/boot/dts/imx7s.dtsi Denys Drozdov    2022-01-24   85  
4ce9f72e008b50 arch/arm/boot/dts/imx7s.dtsi Denys Drozdov    2022-01-24   86  	cpu0_opp_table: opp-table {
4ce9f72e008b50 arch/arm/boot/dts/imx7s.dtsi Denys Drozdov    2022-01-24   87  		compatible = "operating-points-v2";
4ce9f72e008b50 arch/arm/boot/dts/imx7s.dtsi Denys Drozdov    2022-01-24   88  		opp-shared;
4ce9f72e008b50 arch/arm/boot/dts/imx7s.dtsi Denys Drozdov    2022-01-24   89  
4ce9f72e008b50 arch/arm/boot/dts/imx7s.dtsi Denys Drozdov    2022-01-24   90  		opp-792000000 {
4ce9f72e008b50 arch/arm/boot/dts/imx7s.dtsi Denys Drozdov    2022-01-24   91  			opp-hz = /bits/ 64 <792000000>;
4ce9f72e008b50 arch/arm/boot/dts/imx7s.dtsi Denys Drozdov    2022-01-24   92  			opp-microvolt = <1000000>;
4ce9f72e008b50 arch/arm/boot/dts/imx7s.dtsi Denys Drozdov    2022-01-24   93  			clock-latency-ns = <150000>;
4ce9f72e008b50 arch/arm/boot/dts/imx7s.dtsi Denys Drozdov    2022-01-24   94  			opp-supported-hw = <0xf>, <0xf>;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   95  		};
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   96  	};
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   97  
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   98  	ckil: clock-cki {
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19   99  		compatible = "fixed-clock";
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19  100  		#clock-cells = <0>;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19  101  		clock-frequency = <32768>;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19  102  		clock-output-names = "ckil";
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19  103  	};
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19  104  
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19  105  	osc: clock-osc {
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19  106  		compatible = "fixed-clock";
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19  107  		#clock-cells = <0>;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19  108  		clock-frequency = <24000000>;
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19  109  		clock-output-names = "osc";
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19  110  	};
949673450291de arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-05-19  111  
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  112  	usbphynop1: usbphynop1 {
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  113  		compatible = "usb-nop-xceiv";
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  114  		clocks = <&clks IMX7D_USB_PHY1_CLK>;
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  115  		clock-names = "main_clk";
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  116  		#phy-cells = <0>;
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  117  	};
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  118  
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  119  	usbphynop3: usbphynop3 {
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  120  		compatible = "usb-nop-xceiv";
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  121  		clocks = <&clks IMX7D_USB_HSIC_ROOT_CLK>;
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  122  		clock-names = "main_clk";
552ca27929ab28 arch/arm/boot/dts/imx7s.dtsi Alexander Stein  2022-05-10  123  		power-domains = <&pgc_hsic_phy>;
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  124  		#phy-cells = <0>;
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  125  	};
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  126  
a934a5834d59d8 arch/arm/boot/dts/imx7s.dtsi Stefan Agner     2018-02-27  127  	pmu {
a934a5834d59d8 arch/arm/boot/dts/imx7s.dtsi Stefan Agner     2018-02-27  128  		compatible = "arm,cortex-a7-pmu";
a934a5834d59d8 arch/arm/boot/dts/imx7s.dtsi Stefan Agner     2018-02-27  129  		interrupt-parent = <&gpc>;
a934a5834d59d8 arch/arm/boot/dts/imx7s.dtsi Stefan Agner     2018-02-27  130  		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
a934a5834d59d8 arch/arm/boot/dts/imx7s.dtsi Stefan Agner     2018-02-27  131  		interrupt-affinity = <&cpu0>;
a934a5834d59d8 arch/arm/boot/dts/imx7s.dtsi Stefan Agner     2018-02-27  132  	};
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  133  
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  134  	replicator {
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  135  		/*
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  136  		 * non-configurable replicators don't show up on the
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  137  		 * AMBA bus.  As such no need to add "arm,primecell"
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  138  		 */
5d7c5882b94a61 arch/arm/boot/dts/imx7s.dtsi Leo Yan          2019-05-08  139  		compatible = "arm,coresight-static-replicator";
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  140  
f2e7398987287e arch/arm/boot/dts/imx7s.dtsi Suzuki K Poulose 2018-09-12  141  		out-ports {
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  142  			#address-cells = <1>;
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  143  			#size-cells = <0>;
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  144  				/* replicator output ports */
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  145  			port@0 {
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  146  				reg = <0>;
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  147  				replicator_out_port0: endpoint {
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  148  					remote-endpoint = <&tpiu_in_port>;
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  149  				};
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  150  			};
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  151  
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  152  			port@1 {
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  153  				reg = <1>;
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  154  				replicator_out_port1: endpoint {
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  155  					remote-endpoint = <&etr_in_port>;
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  156  				};
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  157  			};
f2e7398987287e arch/arm/boot/dts/imx7s.dtsi Suzuki K Poulose 2018-09-12  158  		};
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  159  
f2e7398987287e arch/arm/boot/dts/imx7s.dtsi Suzuki K Poulose 2018-09-12  160  		in-ports {
f2e7398987287e arch/arm/boot/dts/imx7s.dtsi Suzuki K Poulose 2018-09-12  161  			port {
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  162  				replicator_in_port0: endpoint {
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  163  					remote-endpoint = <&etf_out_port>;
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  164  				};
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  165  			};
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  166  		};
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  167  	};
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  168  
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  169  	timer {
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  170  		compatible = "arm,armv7-timer";
839661a2bbc8cd arch/arm/boot/dts/imx7s.dtsi Marek Vasut      2021-01-07  171  		arm,cpu-registers-not-fw-configured;
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  172  		interrupt-parent = <&intc>;
d7f3894f0e4680 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2018-12-03  173  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
d7f3894f0e4680 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2018-12-03  174  			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
d7f3894f0e4680 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2018-12-03  175  			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
d7f3894f0e4680 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2018-12-03  176  			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  177  	};
dd55cb40a83668 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2017-11-29  178  
8e82a523151164 arch/arm/boot/dts/imx7s.dtsi Fabio Estevam    2022-06-14  179  	soc: soc {
974a3abcffaebc arch/arm/boot/dts/imx7s.dtsi Stefan Agner     2016-07-25  180  		#address-cells = <1>;
974a3abcffaebc arch/arm/boot/dts/imx7s.dtsi Stefan Agner     2016-07-25  181  		#size-cells = <1>;
974a3abcffaebc arch/arm/boot/dts/imx7s.dtsi Stefan Agner     2016-07-25  182  		compatible = "simple-bus";
0f90b43ac71b48 arch/arm/boot/dts/imx7s.dtsi Andrey Smirnov   2017-05-15  183  		interrupt-parent = <&gpc>;
974a3abcffaebc arch/arm/boot/dts/imx7s.dtsi Stefan Agner     2016-07-25  184  		ranges;
ecea9fec0f51a3 arch/arm/boot/dts/imx7d.dtsi Frank Li         2016-01-05  185  
974a3abcffaebc arch/arm/boot/dts/imx7s.dtsi Stefan Agner     2016-07-25  186  		funnel@30041000 {
5d7c5882b94a61 arch/arm/boot/dts/imx7s.dtsi Leo Yan          2019-05-08  187  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
974a3abcffaebc arch/arm/boot/dts/imx7s.dtsi Stefan Agner     2016-07-25  188  			reg = <0x30041000 0x1000>;
3adab7c796f603 arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-06-30  189  			clocks = <&clks IMX7D_MAIN_AXI_ROOT_CLK>;
3adab7c796f603 arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-06-30  190  			clock-names = "apb_pclk";
3adab7c796f603 arch/arm/boot/dts/imx7d.dtsi Frank Li         2015-06-30  191  
f2e7398987287e arch/arm/boot/dts/imx7s.dtsi Suzuki K Poulose 2018-09-12 @192  			ca_funnel_in_ports: in-ports {

:::::: The code at line 192 was first introduced by commit
:::::: f2e7398987287ecc55ee60ceeb4617447ea17263 ARM: dts: imx7: Update coresight binding for hardware ports

:::::: TO: Suzuki K Poulose <suzuki.poulose@arm.com>
:::::: CC: Shawn Guo <shawnguo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
