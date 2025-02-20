Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613D61D5CC7
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Feb 2025 17:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740071848; cv=none; b=VIFVSwhWx/FZyWjAQqPa0fj49w8EQp74gB2BLqKZkj00xebBnDRcD4obpR1GSpXiuTZVeKgVtvKH7OpTXL8SPLWSyJhNI/WqwQf7XowkfvdZf1XmED/C6+0j1fbVuHYtDscTqSmsCgYX1WKw2+3g66HGuYZbiIGuyRwfd0Tn0Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740071848; c=relaxed/simple;
	bh=rjNMPk6YsRkOdBtuv9QKMBIf8kOtR3frhzA+D2Qp5gs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JeL+ZXOltC6o8PpE2R5nc/zn+Z7zY77rGpT5sLlnnLalXp4h00vNujjVNNcWSWU0I+q5OMU3y7TQl5015RaTnQQ4pB5paIu9zV92p2oLXDv25dqvmMUzFFT9ILKA3ccKZo9s3d7QC7YBVUUDfixuM9pETOys0osaBqDN30csoJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T2Q2/mh6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T2Q2/mh6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740071846; x=1771607846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rjNMPk6YsRkOdBtuv9QKMBIf8kOtR3frhzA+D2Qp5gs=;
  b=T2Q2/mh6CMEOZAiUVoVFWEVjc++FZScRQ1lJXO3IuMGNTOVQF6EvWPYR
   9ZRc0mAI5mjjHZS5Np4JX/paCA9VPV72fTpcdlqZi3KqoylV+U54zKDJa
   HlR0rHza+zxxfTZ2wOT3lMpZ0QDq9Ea8lPZd/9IHo+uETW8Sc5XGEnGpv
   KmPgCKOEIK8IebGAoeedEdK1dI3sULQsHrxg8OT2D8OdONCntIhvU4Zo9
   0NENgyJcKwMPNTWEPsSLqG7zrCNBX4WYQa1A7JPuV2x/QcpwCdRN6My+f
   ZP2Xp5D4kptr0fBgSbLU6f4Izw2B+WRaTf+SXdfI3D7L3pANIIq8k3Lu9
   A==;
X-CSE-ConnectionGUID: LFIDqRKGSpSCwtZIZEbCRA==
X-CSE-MsgGUID: 5/vM5s1vRdqd2voh1iq4Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="66227612"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="66227612"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 09:17:25 -0800
X-CSE-ConnectionGUID: h6jPMipiTziFUsdjYP9TjA==
X-CSE-MsgGUID: 54Z0KfJATZqLbPMjggu7JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115607909"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 20 Feb 2025 09:17:24 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlAAr-0004Zn-2r;
	Thu, 20 Feb 2025 17:17:21 +0000
Date: Fri, 21 Feb 2025 01:16:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:pr/57 1/1]
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi:69.35-72.5: Warning
 (unique_unit_address): /reserved-memory/secmon@5000000: duplicate
 unit-address (also used in node /reserved-memory/bl32@5000000)
Message-ID: <202502210133.QfepNXXo-lkp@intel.com>
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

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: b7be144932a8376fbb886115ce908a1a1818940b [1/1] arm64: dts: Add SEI Robotics SEI510 Board
:::::: branch date: 4 days ago
:::::: commit date: 6 years ago
config: arm64-randconfig-003-20250217 (https://download.01.org/0day-ci/archive/20250221/202502210133.QfepNXXo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502210133.QfepNXXo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502210133.QfepNXXo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/meson-g12a.dtsi:69.35-72.5: Warning (unique_unit_address): /reserved-memory/secmon@5000000: duplicate unit-address (also used in node /reserved-memory/bl32@5000000)

vim +69 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi

9c8c52f7cb4f3b Jianxin Pan   2018-09-21    9  
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   10  / {
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   11  	compatible = "amlogic,g12a";
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   12  
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   13  	interrupt-parent = <&gic>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   14  	#address-cells = <2>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   15  	#size-cells = <2>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   16  
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   17  	cpus {
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   18  		#address-cells = <0x2>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   19  		#size-cells = <0x0>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   20  
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   21  		cpu0: cpu@0 {
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   22  			device_type = "cpu";
31af04cd60d316 Rob Herring   2019-01-14   23  			compatible = "arm,cortex-a53";
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   24  			reg = <0x0 0x0>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   25  			enable-method = "psci";
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   26  			next-level-cache = <&l2>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   27  		};
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   28  
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   29  		cpu1: cpu@1 {
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   30  			device_type = "cpu";
31af04cd60d316 Rob Herring   2019-01-14   31  			compatible = "arm,cortex-a53";
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   32  			reg = <0x0 0x1>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   33  			enable-method = "psci";
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   34  			next-level-cache = <&l2>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   35  		};
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   36  
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   37  		cpu2: cpu@2 {
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   38  			device_type = "cpu";
31af04cd60d316 Rob Herring   2019-01-14   39  			compatible = "arm,cortex-a53";
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   40  			reg = <0x0 0x2>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   41  			enable-method = "psci";
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   42  			next-level-cache = <&l2>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   43  		};
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   44  
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   45  		cpu3: cpu@3 {
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   46  			device_type = "cpu";
31af04cd60d316 Rob Herring   2019-01-14   47  			compatible = "arm,cortex-a53";
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   48  			reg = <0x0 0x3>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   49  			enable-method = "psci";
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   50  			next-level-cache = <&l2>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   51  		};
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   52  
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   53  		l2: l2-cache0 {
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   54  			compatible = "cache";
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   55  		};
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   56  	};
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   57  
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   58  	psci {
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   59  		compatible = "arm,psci-1.0";
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   60  		method = "smc";
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   61  	};
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   62  
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   63  	reserved-memory {
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   64  		#address-cells = <2>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   65  		#size-cells = <2>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   66  		ranges;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   67  
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   68  		/* 3 MiB reserved for ARM Trusted Firmware (BL31) */
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  @69  		secmon_reserved: secmon@5000000 {
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   70  			reg = <0x0 0x05000000 0x0 0x300000>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   71  			no-map;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   72  		};
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   73  	};
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   74  
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   75  	soc {
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   76  		compatible = "simple-bus";
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   77  		#address-cells = <2>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   78  		#size-cells = <2>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   79  		ranges;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   80  
503f5fed1c52f0 Jerome Brunet 2019-02-01   81  		apb: bus@ff600000 {
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   82  			compatible = "simple-bus";
503f5fed1c52f0 Jerome Brunet 2019-02-01   83  			reg = <0x0 0xff600000 0x0 0x200000>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   84  			#address-cells = <2>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   85  			#size-cells = <2>;
503f5fed1c52f0 Jerome Brunet 2019-02-01   86  			ranges = <0x0 0x0 0x0 0xff600000 0x0 0x200000>;
503f5fed1c52f0 Jerome Brunet 2019-02-01   87  
503f5fed1c52f0 Jerome Brunet 2019-02-01   88  			periphs: bus@34400 {
503f5fed1c52f0 Jerome Brunet 2019-02-01   89  				compatible = "simple-bus";
503f5fed1c52f0 Jerome Brunet 2019-02-01   90  				reg = <0x0 0x34400 0x0 0x400>;
503f5fed1c52f0 Jerome Brunet 2019-02-01   91  				#address-cells = <2>;
503f5fed1c52f0 Jerome Brunet 2019-02-01   92  				#size-cells = <2>;
503f5fed1c52f0 Jerome Brunet 2019-02-01   93  				ranges = <0x0 0x0 0x0 0x34400 0x0 0x400>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   94  			};
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   95  
503f5fed1c52f0 Jerome Brunet 2019-02-01   96  			hiu: bus@3c000 {
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   97  				compatible = "simple-bus";
503f5fed1c52f0 Jerome Brunet 2019-02-01   98  				reg = <0x0 0x3c000 0x0 0x1400>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21   99  				#address-cells = <2>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  100  				#size-cells = <2>;
503f5fed1c52f0 Jerome Brunet 2019-02-01  101  				ranges = <0x0 0x0 0x0 0x3c000 0x0 0x1400>;
785fb4342730fb Jerome Brunet 2019-02-08  102  
785fb4342730fb Jerome Brunet 2019-02-08  103  				hhi: system-controller@0 {
785fb4342730fb Jerome Brunet 2019-02-08  104  					compatible = "amlogic,meson-gx-hhi-sysctrl",
785fb4342730fb Jerome Brunet 2019-02-08  105  						     "simple-mfd", "syscon";
785fb4342730fb Jerome Brunet 2019-02-08  106  					reg = <0 0 0 0x400>;
785fb4342730fb Jerome Brunet 2019-02-08  107  
785fb4342730fb Jerome Brunet 2019-02-08  108  					clkc: clock-controller {
785fb4342730fb Jerome Brunet 2019-02-08  109  						compatible = "amlogic,g12a-clkc";
785fb4342730fb Jerome Brunet 2019-02-08  110  						#clock-cells = <1>;
785fb4342730fb Jerome Brunet 2019-02-08  111  						clocks = <&xtal>;
785fb4342730fb Jerome Brunet 2019-02-08  112  						clock-names = "xtal";
785fb4342730fb Jerome Brunet 2019-02-08  113  					};
785fb4342730fb Jerome Brunet 2019-02-08  114  				};
503f5fed1c52f0 Jerome Brunet 2019-02-01  115  			};
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  116  		};
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  117  
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  118  		aobus: bus@ff800000 {
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  119  			compatible = "simple-bus";
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  120  			reg = <0x0 0xff800000 0x0 0x100000>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  121  			#address-cells = <2>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  122  			#size-cells = <2>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  123  			ranges = <0x0 0x0 0x0 0xff800000 0x0 0x100000>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  124  
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  125  			uart_AO: serial@3000 {
503f5fed1c52f0 Jerome Brunet 2019-02-01  126  				compatible = "amlogic,meson-gx-uart",
503f5fed1c52f0 Jerome Brunet 2019-02-01  127  					     "amlogic,meson-ao-uart";
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  128  				reg = <0x0 0x3000 0x0 0x18>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  129  				interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  130  				clocks = <&xtal>, <&xtal>, <&xtal>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  131  				clock-names = "xtal", "pclk", "baud";
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  132  				status = "disabled";
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  133  			};
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  134  
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  135  			uart_AO_B: serial@4000 {
503f5fed1c52f0 Jerome Brunet 2019-02-01  136  				compatible = "amlogic,meson-gx-uart",
503f5fed1c52f0 Jerome Brunet 2019-02-01  137  					     "amlogic,meson-ao-uart";
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  138  				reg = <0x0 0x4000 0x0 0x18>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  139  				interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  140  				clocks = <&xtal>, <&xtal>, <&xtal>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  141  				clock-names = "xtal", "pclk", "baud";
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  142  				status = "disabled";
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  143  			};
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  144  		};
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  145  
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  146  		gic: interrupt-controller@ffc01000 {
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  147  			compatible = "arm,gic-400";
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  148  			reg = <0x0 0xffc01000 0 0x1000>,
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  149  			      <0x0 0xffc02000 0 0x2000>,
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  150  			      <0x0 0xffc04000 0 0x2000>,
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  151  			      <0x0 0xffc06000 0 0x2000>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  152  			interrupt-controller;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  153  			interrupts = <GIC_PPI 9
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  154  				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  155  			#interrupt-cells = <3>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  156  			#address-cells = <0>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  157  		};
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  158  
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  159  		cbus: bus@ffd00000 {
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  160  			compatible = "simple-bus";
503f5fed1c52f0 Jerome Brunet 2019-02-01  161  			reg = <0x0 0xffd00000 0x0 0x100000>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  162  			#address-cells = <2>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  163  			#size-cells = <2>;
503f5fed1c52f0 Jerome Brunet 2019-02-01  164  			ranges = <0x0 0x0 0x0 0xffd00000 0x0 0x100000>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  165  
60d4fdb8f372f7 Jerome Brunet 2019-01-18  166  			clk_msr: clock-measure@18000 {
60d4fdb8f372f7 Jerome Brunet 2019-01-18  167  				compatible = "amlogic,meson-g12a-clk-measure";
60d4fdb8f372f7 Jerome Brunet 2019-01-18  168  				reg = <0x0 0x18000 0x0 0x10>;
60d4fdb8f372f7 Jerome Brunet 2019-01-18  169  			};
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  170  		};
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  171  	};
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  172  
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  173  	timer {
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  174  		compatible = "arm,armv8-timer";
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  175  		interrupts = <GIC_PPI 13
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  176  			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>,
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  177  			     <GIC_PPI 14
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  178  			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>,
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  179  			     <GIC_PPI 11
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  180  			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>,
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  181  			     <GIC_PPI 10
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  182  			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  183  	};
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  184  
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  185  	xtal: xtal-clk {
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  186  		compatible = "fixed-clock";
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  187  		clock-frequency = <24000000>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  188  		clock-output-names = "xtal";
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  189  		#clock-cells = <0>;
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  190  	};
9c8c52f7cb4f3b Jianxin Pan   2018-09-21  191  

:::::: The code at line 69 was first introduced by commit
:::::: 9c8c52f7cb4f3b604bb9836947dadfbb255f465f arm64: dts: meson-g12a: add initial g12a s905d2 SoC DT support

:::::: TO: Jianxin Pan <jianxin.pan@amlogic.com>
:::::: CC: Kevin Hilman <khilman@baylibre.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
