Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB39815C133
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Sep 2024 06:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727416865; cv=none; b=oWXR+31/isJgP0cMDd0quI2bPKdvAB0pkXUKIjh3AMCgLc10QxfFkeJtmSfSw1RujIz12VLzq8PkYu3FiitG/qPfu0VrQf2SM5cFrj5++xwrwFZ8Js4+eAhDgmiaiUysZhtteTZGuBDpHiHCJj8ITl930mi2dXKJizYyZPnPtUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727416865; c=relaxed/simple;
	bh=y4YdHs4+m4IGS7B4gmTkkeV7sJdska4bD1d7Ab/Kmys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UqgQWYU+W8bcdAi09lExLkLBaotuwFdkrPR8hOVv5jvsi5iOkwctN/RtFQbSpIrHC+4yWMBJRMQiz4dEZ8yXtX/8D043fS9jfdjYyFrLHnqlQAAyK7me28tE0NGewt/aC/VlZczRwN+reMBGJ38iVwtilAH41B95Y2QNbnZl1uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T50ZbhWr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T50ZbhWr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727416864; x=1758952864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y4YdHs4+m4IGS7B4gmTkkeV7sJdska4bD1d7Ab/Kmys=;
  b=T50ZbhWrJTbI76IQFF/7kPcXpCOax8ntp83ZIdYB+W8AdCi2hyvXJodd
   AVXKzhH5VfnwX6q2ma5mQJq/y3DYTnontHFhgkVfaSXiq40BQABPWD4Ls
   ffGTUjF9YFRVXIRfvagFuRE+Yl8g6rw2+9vhOa5KaouCJncUi3GzxLriE
   JbbHXBqkqGM2bEkBQq0ZJj2uhgCN/2ORUYgW9LkyL5z+kZmrSGl+eSc6V
   qvPODNkVxM+g5JiXMxa/pAnFW3RHqTtX6mhw3Rbu4sQA28Dm+RqhQPty2
   hy+0i7gxxOett/OV+6L/o2U+O5SRNANV5v6hPOfen+WJlTmR28Q69FsJq
   A==;
X-CSE-ConnectionGUID: HbbrSrGCRKmY+4wjwlsrXw==
X-CSE-MsgGUID: TOTgfi7oR1mtCDguKA7HeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="49077494"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="49077494"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 23:01:02 -0700
X-CSE-ConnectionGUID: +BnbPgF3SSODllQqx/ZW1Q==
X-CSE-MsgGUID: T0zNCTsgQ16PQQ4wbo6WQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="103208739"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Sep 2024 23:01:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su42E-000Lad-0v;
	Fri, 27 Sep 2024 06:00:58 +0000
Date: Fri, 27 Sep 2024 14:00:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wsa:renesas/genmai-upstreaming 9/17]
 arch/arm/boot/dts/renesas/r8a7792.dtsi:87.12-92.4: Warning
 (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit
 name
Message-ID: <202409271356.2EmUQASq-lkp@intel.com>
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
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/genmai-upstreaming
head:   083783626e28ad2ed5e51144b4b0d06ac2594a4e
commit: f559e35ddd01776ad08feaef14b1b14d5e5f8b5c [9/17] ARM: dts: renesas: add proper node names to (L)BSC devices
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm-randconfig-001-20240927 (https://download.01.org/0day-ci/archive/20240927/202409271356.2EmUQASq-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271356.2EmUQASq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409271356.2EmUQASq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/renesas/r8a7792.dtsi:87.12-92.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
--
>> arch/arm/boot/dts/renesas/r8a7792.dtsi:87.12-92.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
--
>> arch/arm/boot/dts/renesas/r7s72100.dtsi:39.11-44.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/renesas/r7s72100.dtsi:403.26-408.5: Warning (unique_unit_address_if_enabled): /soc/watchdog@fcfe0000: duplicate unit-address (also used in node /soc/cpg_clocks@fcfe0000)
--
>> arch/arm/boot/dts/renesas/r8a7778.dtsi:43.11-48.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
--
>> arch/arm/boot/dts/renesas/r7s72100.dtsi:39.11-44.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts:32.17-72.4: Warning (avoid_unnecessary_addr_size): /flash@18000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/renesas/r7s72100.dtsi:403.26-408.5: Warning (unique_unit_address_if_enabled): /soc/watchdog@fcfe0000: duplicate unit-address (also used in node /soc/cpg_clocks@fcfe0000)
--
>> arch/arm/boot/dts/renesas/r7s72100.dtsi:39.11-44.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/renesas/r7s72100-genmai.dts:33.17-60.4: Warning (avoid_unnecessary_addr_size): /flash@18000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/renesas/r7s72100.dtsi:403.26-408.5: Warning (unique_unit_address_if_enabled): /soc/watchdog@fcfe0000: duplicate unit-address (also used in node /soc/cpg_clocks@fcfe0000)
--
>> arch/arm/boot/dts/renesas/r8a7779.dtsi:707.12-712.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name

vim +87 arch/arm/boot/dts/renesas/r8a7792.dtsi

7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  12  
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  13  / {
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  14  	compatible = "renesas,r8a7792";
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  15  	#address-cells = <2>;
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  16  	#size-cells = <2>;
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  17  
78082700c8885a arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-07-23  18  	aliases {
78082700c8885a arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-07-23  19  		i2c0 = &i2c0;
78082700c8885a arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-07-23  20  		i2c1 = &i2c1;
78082700c8885a arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-07-23  21  		i2c2 = &i2c2;
78082700c8885a arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-07-23  22  		i2c3 = &i2c3;
78082700c8885a arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-07-23  23  		i2c4 = &i2c4;
78082700c8885a arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-07-23  24  		i2c5 = &i2c5;
72cd625c85e268 arch/arm/boot/dts/r8a7792.dtsi         Marek Vasut        2019-03-04  25  		i2c6 = &iic3;
c9acea6efdd7b0 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-09-03  26  		spi0 = &qspi;
b0663cd4211a26 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-09-05  27  		spi1 = &msiof0;
b0663cd4211a26 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-09-05  28  		spi2 = &msiof1;
a2d30b9c555f02 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-07-23  29  		vin0 = &vin0;
a2d30b9c555f02 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-07-23  30  		vin1 = &vin1;
a2d30b9c555f02 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-07-23  31  		vin2 = &vin2;
a2d30b9c555f02 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-07-23  32  		vin3 = &vin3;
a2d30b9c555f02 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-07-23  33  		vin4 = &vin4;
a2d30b9c555f02 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-07-23  34  		vin5 = &vin5;
78082700c8885a arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-07-23  35  	};
78082700c8885a arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-07-23  36  
c3d2c8d7c20e97 arch/arm/boot/dts/r8a7792.dtsi         Simon Horman       2017-12-18  37  	/* External CAN clock */
c3d2c8d7c20e97 arch/arm/boot/dts/r8a7792.dtsi         Simon Horman       2017-12-18  38  	can_clk: can {
c3d2c8d7c20e97 arch/arm/boot/dts/r8a7792.dtsi         Simon Horman       2017-12-18  39  		compatible = "fixed-clock";
c3d2c8d7c20e97 arch/arm/boot/dts/r8a7792.dtsi         Simon Horman       2017-12-18  40  		#clock-cells = <0>;
c3d2c8d7c20e97 arch/arm/boot/dts/r8a7792.dtsi         Simon Horman       2017-12-18  41  		/* This value must be overridden by the board. */
c3d2c8d7c20e97 arch/arm/boot/dts/r8a7792.dtsi         Simon Horman       2017-12-18  42  		clock-frequency = <0>;
c3d2c8d7c20e97 arch/arm/boot/dts/r8a7792.dtsi         Simon Horman       2017-12-18  43  	};
c3d2c8d7c20e97 arch/arm/boot/dts/r8a7792.dtsi         Simon Horman       2017-12-18  44  
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  45  	cpus {
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  46  		#address-cells = <1>;
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  47  		#size-cells = <0>;
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  48  
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  49  		cpu0: cpu@0 {
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  50  			device_type = "cpu";
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  51  			compatible = "arm,cortex-a15";
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  52  			reg = <0>;
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  53  			clock-frequency = <1000000000>;
762dbc444ca240 arch/arm/boot/dts/r8a7792.dtsi         Geert Uytterhoeven 2017-08-18  54  			clocks = <&cpg CPG_CORE R8A7792_CLK_Z>;
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  55  			power-domains = <&sysc R8A7792_PD_CA15_CPU0>;
a499e40a397c17 arch/arm/boot/dts/r8a7792.dtsi         Geert Uytterhoeven 2021-05-19  56  			enable-method = "renesas,apmu";
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  57  			next-level-cache = <&L2_CA15>;
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  58  		};
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  59  
8fd763c75c3ab8 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-21  60  		cpu1: cpu@1 {
8fd763c75c3ab8 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-21  61  			device_type = "cpu";
8fd763c75c3ab8 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-21  62  			compatible = "arm,cortex-a15";
8fd763c75c3ab8 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-21  63  			reg = <1>;
8fd763c75c3ab8 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-21  64  			clock-frequency = <1000000000>;
8684a24caa3d59 arch/arm/boot/dts/r8a7792.dtsi         Geert Uytterhoeven 2017-10-12  65  			clocks = <&cpg CPG_CORE R8A7792_CLK_Z>;
8fd763c75c3ab8 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-21  66  			power-domains = <&sysc R8A7792_PD_CA15_CPU1>;
a499e40a397c17 arch/arm/boot/dts/r8a7792.dtsi         Geert Uytterhoeven 2021-05-19  67  			enable-method = "renesas,apmu";
8fd763c75c3ab8 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-21  68  			next-level-cache = <&L2_CA15>;
8fd763c75c3ab8 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-21  69  		};
8fd763c75c3ab8 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-21  70  
a0504f0880c11d arch/arm/boot/dts/r8a7792.dtsi         Geert Uytterhoeven 2017-03-06  71  		L2_CA15: cache-controller-0 {
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  72  			compatible = "cache";
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  73  			cache-unified;
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  74  			cache-level = <2>;
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  75  			power-domains = <&sysc R8A7792_PD_CA15_SCU>;
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  76  		};
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  77  	};
7c4163aae3d8e5 arch/arm/boot/dts/r8a7792.dtsi         Sergei Shtylyov    2016-06-13  78  
c3d2c8d7c20e97 arch/arm/boot/dts/r8a7792.dtsi         Simon Horman       2017-12-18  79  	/* External root clock */
c3d2c8d7c20e97 arch/arm/boot/dts/r8a7792.dtsi         Simon Horman       2017-12-18  80  	extal_clk: extal {
c3d2c8d7c20e97 arch/arm/boot/dts/r8a7792.dtsi         Simon Horman       2017-12-18  81  		compatible = "fixed-clock";
c3d2c8d7c20e97 arch/arm/boot/dts/r8a7792.dtsi         Simon Horman       2017-12-18  82  		#clock-cells = <0>;
c3d2c8d7c20e97 arch/arm/boot/dts/r8a7792.dtsi         Simon Horman       2017-12-18  83  		/* This value must be overridden by the board. */
c3d2c8d7c20e97 arch/arm/boot/dts/r8a7792.dtsi         Simon Horman       2017-12-18  84  		clock-frequency = <0>;
c3d2c8d7c20e97 arch/arm/boot/dts/r8a7792.dtsi         Simon Horman       2017-12-18  85  	};
c3d2c8d7c20e97 arch/arm/boot/dts/r8a7792.dtsi         Simon Horman       2017-12-18  86  
f559e35ddd0177 arch/arm/boot/dts/renesas/r8a7792.dtsi Wolfram Sang       2024-09-25 @87  	lbsc: bus {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
