Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89CE1D5165
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Feb 2025 22:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739916841; cv=none; b=tGSKeNgUVMcNS3byfJ3A5QUzzFL+0mxM/MJ0+RM5TlGsvb4VqQqoW9Zd9xfQVOYCjVpbuDBtFN3vNsB88622I92IYlFVyt9qC3gzz6tF5winUy0ufD8dwN/jyzNTwIq/MfYnBputI8K4qFENwTG05SyG/TlZd2tykZTDYpmTibs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739916841; c=relaxed/simple;
	bh=vikhtiUnl7SxkhdgoAAcmpPpdx2UfQzHfCDvqcsEI1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mGU6c/tCYN3juJ5PQtugXwhOyu4SG4Jv8UdAToYuyI0eJ59TKP0dg2UHABmdyejDgCa0Q9f1OlUT3bqhRinvXt8p8aR3UJSt58eNYLoqgI76gY8OOhLhVoYrU/WEP3eIiZfceSB2MoCyylo1V+O8dTjT9LXLT3Z0sp3NgzBMyPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lsYqt1fD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsYqt1fD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739916839; x=1771452839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vikhtiUnl7SxkhdgoAAcmpPpdx2UfQzHfCDvqcsEI1E=;
  b=lsYqt1fDDVNEh+D7OioLtN+JXSUabJjabzxBRzOkxsFVMeK6BgGrhhqX
   UzO48YYMzD3OoPbj9CBrFTp5ecgkLXFrb1bS7DwZD6jw3rB3oX2NVRxnP
   SNCRPFpxpKoLRPuIUbCRcCzO9mUMKrhS/hBrJ/ymabYioFFtVFQ9nSFrg
   G1ac4l3Lr23uL7r58fuVThWjtkhRaK2kXSqtTXugKj5VGcEACOKlfosBU
   5BPd9IcKwEryqUFcGgeu2PCR6WcWOuQnvPZlUVFpaR8LBmKrL6w898xCN
   GTUw9g5D7sWJYD1zZbfgKXtE4ePRB35/I/E/Zu+frnD6y33itygUJiRj8
   Q==;
X-CSE-ConnectionGUID: x/ZxhaP3S7CTaPxTOR3m7A==
X-CSE-MsgGUID: r2EF02dvQzW/MGFYeHE+zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51278628"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="51278628"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 14:13:58 -0800
X-CSE-ConnectionGUID: xhdbaaSCRzSRE+pErC0gpg==
X-CSE-MsgGUID: 0lWTJD36SKW4SZ8zOhE9gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="145378848"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 18 Feb 2025 14:13:57 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkVqi-0000v1-1m;
	Tue, 18 Feb 2025 22:13:52 +0000
Date: Wed, 19 Feb 2025 06:13:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:pr/60 1/1]
 arch/arm64/boot/dts/freescale/imx8mm.dtsi:162.6-702.4: Warning
 (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit
 name
Message-ID: <202502190648.fLvMNtN7-lkp@intel.com>
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

tree:   https://github.com/intel/linux-intel-lts.git pr/60
head:   9e3b33a0fe250f006a2d39da8cc8f99a0101e89b
commit: 547e12325d0e5ebe8f40e410f8de10a114f70db5 [1/1] arm64: dts: imx: Add i.mx8mm evk basic dts support
:::::: branch date: 34 hours ago
:::::: commit date: 6 years ago
config: arm64-randconfig-001-20250218 (https://download.01.org/0day-ci/archive/20250219/202502190648.fLvMNtN7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502190648.fLvMNtN7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502190648.fLvMNtN7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:162.6-702.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:168.23-336.5: Warning (unit_address_vs_reg): /soc/bus@30000000: node has a unit name, but no reg property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:338.23-387.5: Warning (unit_address_vs_reg): /soc/bus@30400000: node has a unit name, but no reg property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:389.23-606.5: Warning (unit_address_vs_reg): /soc/bus@30800000: node has a unit name, but no reg property
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:608.23-672.5: Warning (unit_address_vs_reg): /soc/bus@32c00000: node has a unit name, but no reg property
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:629.27-635.6: Warning (simple_bus_reg): /soc/bus@32c00000/usbphynop1: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:658.27-664.6: Warning (simple_bus_reg): /soc/bus@32c00000/usbphynop2: missing or empty reg/ranges property

vim +162 arch/arm64/boot/dts/freescale/imx8mm.dtsi

a05ea40eb384e2 Jacky Bai 2019-03-22   13  
a05ea40eb384e2 Jacky Bai 2019-03-22   14  / {
a05ea40eb384e2 Jacky Bai 2019-03-22   15  	compatible = "fsl,imx8mm";
a05ea40eb384e2 Jacky Bai 2019-03-22   16  	interrupt-parent = <&gic>;
a05ea40eb384e2 Jacky Bai 2019-03-22   17  	#address-cells = <2>;
a05ea40eb384e2 Jacky Bai 2019-03-22   18  	#size-cells = <2>;
a05ea40eb384e2 Jacky Bai 2019-03-22   19  
a05ea40eb384e2 Jacky Bai 2019-03-22   20  	aliases {
a05ea40eb384e2 Jacky Bai 2019-03-22   21  		ethernet0 = &fec1;
a05ea40eb384e2 Jacky Bai 2019-03-22   22  		i2c0 = &i2c1;
a05ea40eb384e2 Jacky Bai 2019-03-22   23  		i2c1 = &i2c2;
a05ea40eb384e2 Jacky Bai 2019-03-22   24  		i2c2 = &i2c3;
a05ea40eb384e2 Jacky Bai 2019-03-22   25  		i2c3 = &i2c4;
a05ea40eb384e2 Jacky Bai 2019-03-22   26  		serial0 = &uart1;
a05ea40eb384e2 Jacky Bai 2019-03-22   27  		serial1 = &uart2;
a05ea40eb384e2 Jacky Bai 2019-03-22   28  		serial2 = &uart3;
a05ea40eb384e2 Jacky Bai 2019-03-22   29  		serial3 = &uart4;
a05ea40eb384e2 Jacky Bai 2019-03-22   30  		spi0 = &ecspi1;
a05ea40eb384e2 Jacky Bai 2019-03-22   31  		spi1 = &ecspi2;
a05ea40eb384e2 Jacky Bai 2019-03-22   32  		spi2 = &ecspi3;
a05ea40eb384e2 Jacky Bai 2019-03-22   33  		mmc0 = &usdhc1;
a05ea40eb384e2 Jacky Bai 2019-03-22   34  		mmc1 = &usdhc2;
a05ea40eb384e2 Jacky Bai 2019-03-22   35  		mmc2 = &usdhc3;
a05ea40eb384e2 Jacky Bai 2019-03-22   36  		gpio0 = &gpio1;
a05ea40eb384e2 Jacky Bai 2019-03-22   37  		gpio1 = &gpio2;
a05ea40eb384e2 Jacky Bai 2019-03-22   38  		gpio2 = &gpio3;
a05ea40eb384e2 Jacky Bai 2019-03-22   39  		gpio3 = &gpio4;
a05ea40eb384e2 Jacky Bai 2019-03-22   40  		gpio4 = &gpio5;
a05ea40eb384e2 Jacky Bai 2019-03-22   41  	};
a05ea40eb384e2 Jacky Bai 2019-03-22   42  
a05ea40eb384e2 Jacky Bai 2019-03-22   43  	cpus {
a05ea40eb384e2 Jacky Bai 2019-03-22   44  		#address-cells = <1>;
a05ea40eb384e2 Jacky Bai 2019-03-22   45  		#size-cells = <0>;
a05ea40eb384e2 Jacky Bai 2019-03-22   46  
a05ea40eb384e2 Jacky Bai 2019-03-22   47  		A53_0: cpu@0 {
a05ea40eb384e2 Jacky Bai 2019-03-22   48  			device_type = "cpu";
a05ea40eb384e2 Jacky Bai 2019-03-22   49  			compatible = "arm,cortex-a53";
a05ea40eb384e2 Jacky Bai 2019-03-22   50  			reg = <0x0>;
a05ea40eb384e2 Jacky Bai 2019-03-22   51  			enable-method = "psci";
a05ea40eb384e2 Jacky Bai 2019-03-22   52  			next-level-cache = <&A53_L2>;
a05ea40eb384e2 Jacky Bai 2019-03-22   53  		};
a05ea40eb384e2 Jacky Bai 2019-03-22   54  
a05ea40eb384e2 Jacky Bai 2019-03-22   55  		A53_1: cpu@1 {
a05ea40eb384e2 Jacky Bai 2019-03-22   56  			device_type = "cpu";
a05ea40eb384e2 Jacky Bai 2019-03-22   57  			compatible = "arm,cortex-a53";
a05ea40eb384e2 Jacky Bai 2019-03-22   58  			reg = <0x1>;
a05ea40eb384e2 Jacky Bai 2019-03-22   59  			enable-method = "psci";
a05ea40eb384e2 Jacky Bai 2019-03-22   60  			next-level-cache = <&A53_L2>;
a05ea40eb384e2 Jacky Bai 2019-03-22   61  		};
a05ea40eb384e2 Jacky Bai 2019-03-22   62  
a05ea40eb384e2 Jacky Bai 2019-03-22   63  		A53_2: cpu@2 {
a05ea40eb384e2 Jacky Bai 2019-03-22   64  			device_type = "cpu";
a05ea40eb384e2 Jacky Bai 2019-03-22   65  			compatible = "arm,cortex-a53";
a05ea40eb384e2 Jacky Bai 2019-03-22   66  			reg = <0x2>;
a05ea40eb384e2 Jacky Bai 2019-03-22   67  			enable-method = "psci";
a05ea40eb384e2 Jacky Bai 2019-03-22   68  			next-level-cache = <&A53_L2>;
a05ea40eb384e2 Jacky Bai 2019-03-22   69  		};
a05ea40eb384e2 Jacky Bai 2019-03-22   70  
a05ea40eb384e2 Jacky Bai 2019-03-22   71  		A53_3: cpu@3 {
a05ea40eb384e2 Jacky Bai 2019-03-22   72  			device_type = "cpu";
a05ea40eb384e2 Jacky Bai 2019-03-22   73  			compatible = "arm,cortex-a53";
a05ea40eb384e2 Jacky Bai 2019-03-22   74  			reg = <0x3>;
a05ea40eb384e2 Jacky Bai 2019-03-22   75  			enable-method = "psci";
a05ea40eb384e2 Jacky Bai 2019-03-22   76  			next-level-cache = <&A53_L2>;
a05ea40eb384e2 Jacky Bai 2019-03-22   77  		};
a05ea40eb384e2 Jacky Bai 2019-03-22   78  
a05ea40eb384e2 Jacky Bai 2019-03-22   79  		A53_L2: l2-cache0 {
a05ea40eb384e2 Jacky Bai 2019-03-22   80  			compatible = "cache";
a05ea40eb384e2 Jacky Bai 2019-03-22   81  		};
a05ea40eb384e2 Jacky Bai 2019-03-22   82  	};
a05ea40eb384e2 Jacky Bai 2019-03-22   83  
a05ea40eb384e2 Jacky Bai 2019-03-22   84  	memory@40000000 {
a05ea40eb384e2 Jacky Bai 2019-03-22   85  		device_type = "memory";
a05ea40eb384e2 Jacky Bai 2019-03-22   86  		reg = <0x0 0x40000000 0 0x80000000>;
a05ea40eb384e2 Jacky Bai 2019-03-22   87  	};
a05ea40eb384e2 Jacky Bai 2019-03-22   88  
a05ea40eb384e2 Jacky Bai 2019-03-22   89  	osc_32k: clock-osc-32k {
a05ea40eb384e2 Jacky Bai 2019-03-22   90  		compatible = "fixed-clock";
a05ea40eb384e2 Jacky Bai 2019-03-22   91  		#clock-cells = <0>;
a05ea40eb384e2 Jacky Bai 2019-03-22   92  		clock-frequency = <32768>;
a05ea40eb384e2 Jacky Bai 2019-03-22   93  		clock-output-names = "osc_32k";
a05ea40eb384e2 Jacky Bai 2019-03-22   94  	};
a05ea40eb384e2 Jacky Bai 2019-03-22   95  
a05ea40eb384e2 Jacky Bai 2019-03-22   96  	osc_24m: clock-osc-24m {
a05ea40eb384e2 Jacky Bai 2019-03-22   97  		compatible = "fixed-clock";
a05ea40eb384e2 Jacky Bai 2019-03-22   98  		#clock-cells = <0>;
a05ea40eb384e2 Jacky Bai 2019-03-22   99  		clock-frequency = <24000000>;
a05ea40eb384e2 Jacky Bai 2019-03-22  100  		clock-output-names = "osc_24m";
a05ea40eb384e2 Jacky Bai 2019-03-22  101  	};
a05ea40eb384e2 Jacky Bai 2019-03-22  102  
a05ea40eb384e2 Jacky Bai 2019-03-22  103  	clk_ext1: clock-ext1 {
a05ea40eb384e2 Jacky Bai 2019-03-22  104  		compatible = "fixed-clock";
a05ea40eb384e2 Jacky Bai 2019-03-22  105  		#clock-cells = <0>;
a05ea40eb384e2 Jacky Bai 2019-03-22  106  		clock-frequency = <133000000>;
a05ea40eb384e2 Jacky Bai 2019-03-22  107  		clock-output-names = "clk_ext1";
a05ea40eb384e2 Jacky Bai 2019-03-22  108  	};
a05ea40eb384e2 Jacky Bai 2019-03-22  109  
a05ea40eb384e2 Jacky Bai 2019-03-22  110  	clk_ext2: clock-ext2 {
a05ea40eb384e2 Jacky Bai 2019-03-22  111  		compatible = "fixed-clock";
a05ea40eb384e2 Jacky Bai 2019-03-22  112  		#clock-cells = <0>;
a05ea40eb384e2 Jacky Bai 2019-03-22  113  		clock-frequency = <133000000>;
a05ea40eb384e2 Jacky Bai 2019-03-22  114  		clock-output-names = "clk_ext2";
a05ea40eb384e2 Jacky Bai 2019-03-22  115  	};
a05ea40eb384e2 Jacky Bai 2019-03-22  116  
a05ea40eb384e2 Jacky Bai 2019-03-22  117  	clk_ext3: clock-ext3 {
a05ea40eb384e2 Jacky Bai 2019-03-22  118  		compatible = "fixed-clock";
a05ea40eb384e2 Jacky Bai 2019-03-22  119  		#clock-cells = <0>;
a05ea40eb384e2 Jacky Bai 2019-03-22  120  		clock-frequency = <133000000>;
a05ea40eb384e2 Jacky Bai 2019-03-22  121  		clock-output-names = "clk_ext3";
a05ea40eb384e2 Jacky Bai 2019-03-22  122  	};
a05ea40eb384e2 Jacky Bai 2019-03-22  123  
a05ea40eb384e2 Jacky Bai 2019-03-22  124  	clk_ext4: clock-ext4 {
a05ea40eb384e2 Jacky Bai 2019-03-22  125  		compatible = "fixed-clock";
a05ea40eb384e2 Jacky Bai 2019-03-22  126  		#clock-cells = <0>;
a05ea40eb384e2 Jacky Bai 2019-03-22  127  		clock-frequency= <133000000>;
a05ea40eb384e2 Jacky Bai 2019-03-22  128  		clock-output-names = "clk_ext4";
a05ea40eb384e2 Jacky Bai 2019-03-22  129  	};
a05ea40eb384e2 Jacky Bai 2019-03-22  130  
a05ea40eb384e2 Jacky Bai 2019-03-22  131  	gic: interrupt-controller@38800000 {
a05ea40eb384e2 Jacky Bai 2019-03-22  132  		compatible = "arm,gic-v3";
a05ea40eb384e2 Jacky Bai 2019-03-22  133  		reg = <0x0 0x38800000 0 0x10000>, /* GIC Dist */
a05ea40eb384e2 Jacky Bai 2019-03-22  134  		      <0x0 0x38880000 0 0xC0000>; /* GICR (RD_base + SGI_base) */
a05ea40eb384e2 Jacky Bai 2019-03-22  135  		#interrupt-cells = <3>;
a05ea40eb384e2 Jacky Bai 2019-03-22  136  		interrupt-controller;
a05ea40eb384e2 Jacky Bai 2019-03-22  137  		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
a05ea40eb384e2 Jacky Bai 2019-03-22  138  	};
a05ea40eb384e2 Jacky Bai 2019-03-22  139  
a05ea40eb384e2 Jacky Bai 2019-03-22  140  	psci {
a05ea40eb384e2 Jacky Bai 2019-03-22  141  		compatible = "arm,psci-1.0";
a05ea40eb384e2 Jacky Bai 2019-03-22  142  		method = "smc";
a05ea40eb384e2 Jacky Bai 2019-03-22  143  	};
a05ea40eb384e2 Jacky Bai 2019-03-22  144  
a05ea40eb384e2 Jacky Bai 2019-03-22  145  	pmu {
a05ea40eb384e2 Jacky Bai 2019-03-22  146  		compatible = "arm,armv8-pmuv3";
a05ea40eb384e2 Jacky Bai 2019-03-22  147  		interrupts = <GIC_PPI 7
a05ea40eb384e2 Jacky Bai 2019-03-22  148  			     (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
a05ea40eb384e2 Jacky Bai 2019-03-22  149  		interrupt-affinity = <&A53_0>, <&A53_1>, <&A53_2>, <&A53_3>;
a05ea40eb384e2 Jacky Bai 2019-03-22  150  	};
a05ea40eb384e2 Jacky Bai 2019-03-22  151  
a05ea40eb384e2 Jacky Bai 2019-03-22  152  	timer {
a05ea40eb384e2 Jacky Bai 2019-03-22  153  		compatible = "arm,armv8-timer";
a05ea40eb384e2 Jacky Bai 2019-03-22  154  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Physical Secure */
a05ea40eb384e2 Jacky Bai 2019-03-22  155  			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Physical Non-Secure */
a05ea40eb384e2 Jacky Bai 2019-03-22  156  			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Virtual */
a05ea40eb384e2 Jacky Bai 2019-03-22  157  			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>; /* Hypervisor */
a05ea40eb384e2 Jacky Bai 2019-03-22  158  		clock-frequency = <8000000>;
a05ea40eb384e2 Jacky Bai 2019-03-22  159  		arm,no-tick-in-suspend;
a05ea40eb384e2 Jacky Bai 2019-03-22  160  	};
a05ea40eb384e2 Jacky Bai 2019-03-22  161  
a05ea40eb384e2 Jacky Bai 2019-03-22 @162  	soc {
a05ea40eb384e2 Jacky Bai 2019-03-22  163  		compatible = "simple-bus";
a05ea40eb384e2 Jacky Bai 2019-03-22  164  		#address-cells = <1>;
a05ea40eb384e2 Jacky Bai 2019-03-22  165  		#size-cells = <1>;
a05ea40eb384e2 Jacky Bai 2019-03-22  166  		ranges = <0x0 0x0 0x0 0x3e000000>;
a05ea40eb384e2 Jacky Bai 2019-03-22  167  
a05ea40eb384e2 Jacky Bai 2019-03-22 @168  		aips1: bus@30000000 {

:::::: The code at line 162 was first introduced by commit
:::::: a05ea40eb384e28205ed7200384f55cf210d8b63 arm64: dts: imx: Add i.mx8mm dtsi support

:::::: TO: Jacky Bai <ping.bai@nxp.com>
:::::: CC: Shawn Guo <shawnguo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
