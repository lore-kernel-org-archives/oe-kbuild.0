Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825F322B640
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Oct 2024 19:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729797679; cv=none; b=Mv0ElWopb8mGqR+B9fy/VO4mQexxA7hAlJw1HhvG0atDP8W1hTrHIBV8kRJsplxopwvGzaPYGI6yfSta8FNYRXuP4Wk/KfYHF5s3VyNSNCf2rxlDCvt67RCU27VYGqF9ScFOTzUjgCHAGlACSBJt5cjoHCnqemn7NtUTDHl6w00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729797679; c=relaxed/simple;
	bh=oKUctg4QdwcTp1qF+7Ky2daRTwxd2LYy1mllPSZochc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Om4S3KhDWMK/RaIRsoZC2St9iAr/4Qqwbf4p+ENZ3SOdqfHeCWIByLGT4U1OPA4npD++1tB6iKEH/8Xg6CP1CJczpN4/4fTHP+1a3+xvAQa2i5591JLO7GjR+bII06NcCc+w2j/IstlZtzZ9Y/6QEuVshFivYas3/FZu0smpX28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XcXRQC0x; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XcXRQC0x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729797675; x=1761333675;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oKUctg4QdwcTp1qF+7Ky2daRTwxd2LYy1mllPSZochc=;
  b=XcXRQC0xxYcujAuLJHuI6BlT0uYQVbHSWsoam6409umOyC2pweBIzozA
   P1JzCLNL2qtO4CXJlsA+5f4Wz7cdtQ6r1VheSS42+7sHgCiAaj3Ofqwcl
   ERfzqp9PRI1NNio4yZeVLMj0fyu4+QnFAWtd+aBEx3tkrdnZa4OTdSkvN
   SZfbG2IqZpOk3cerEmur+ZaqporQxWeCj59Yk9+Fxew46cIwpMTqPAbUg
   /HtN+DoxafOtMPUS0BKNmgHKKXe/F5TZEQ33feaN6co4WC8vzkuLvb1zu
   nb0Xj78HHTOkSQPeypTQs3WfkDWiEA3k5To9j4/Bm1E1d8dOQuIJ3AJSC
   g==;
X-CSE-ConnectionGUID: 6psVYXBXTQS6sCNg16Qq2g==
X-CSE-MsgGUID: X8Jcbaw0RTC5GEDItsC2tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40070791"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="40070791"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 12:21:15 -0700
X-CSE-ConnectionGUID: 0ABUjfk3Se+lMvAG9800ug==
X-CSE-MsgGUID: wK1RqhcORFWabZm5MB+Ifw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="80993122"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Oct 2024 12:21:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t43OR-000Wuq-2J;
	Thu, 24 Oct 2024 19:21:11 +0000
Date: Fri, 25 Oct 2024 03:20:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:6.12-mt7988upstream 31/34]
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi:343.22-358.5: ERROR
 (phandle_references): /soc/spi@11008000: Reference to non-existent node or
 label "spi1_pins"
Message-ID: <202410250312.c2pWQDN7-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: arch/arm64/boot/dts/mediatek/mt7988a.dtsi:343.22-358.5: ERROR (phandle_references): /soc/spi@11008000: Reference to non-existent node or label "spi1_pins""
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.12-mt7988upstream
head:   83bb8720d9e6b85a432f94ae9d12e66718e00752
commit: 804377a27aba1d83029f43e3c94c924263d16df2 [31/34] amr64: dts: mediatek: mt7988: drop pins with second function
:::::: branch date: 7 hours ago
:::::: commit date: 12 days ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241025/202410250312.c2pWQDN7-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250312.c2pWQDN7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410250312.c2pWQDN7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: Input tree has errors, aborting (use -f to force output)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:343.22-358.5: ERROR (phandle_references): /soc/spi@11008000: Reference to non-existent node or label "spi1_pins"

vim +/spi1_pins +343 arch/arm64/boot/dts/mediatek/mt7988a.dtsi

6c1d134a103f68c Rafał Miłecki    2024-01-08    8  
6c1d134a103f68c Rafał Miłecki    2024-01-08    9  / {
6c1d134a103f68c Rafał Miłecki    2024-01-08   10  	compatible = "mediatek,mt7988a";
6c1d134a103f68c Rafał Miłecki    2024-01-08   11  	interrupt-parent = <&gic>;
6c1d134a103f68c Rafał Miłecki    2024-01-08   12  	#address-cells = <2>;
6c1d134a103f68c Rafał Miłecki    2024-01-08   13  	#size-cells = <2>;
6c1d134a103f68c Rafał Miłecki    2024-01-08   14  
6c1d134a103f68c Rafał Miłecki    2024-01-08   15  	cpus {
6c1d134a103f68c Rafał Miłecki    2024-01-08   16  		#address-cells = <1>;
6c1d134a103f68c Rafał Miłecki    2024-01-08   17  		#size-cells = <0>;
6c1d134a103f68c Rafał Miłecki    2024-01-08   18  
8ac21b111d4a46e Frank Wunderlich 2024-10-05   19  		cpu0: cpu@0 {
6c1d134a103f68c Rafał Miłecki    2024-01-08   20  			compatible = "arm,cortex-a73";
6c1d134a103f68c Rafał Miłecki    2024-01-08   21  			reg = <0x0>;
6c1d134a103f68c Rafał Miłecki    2024-01-08   22  			device_type = "cpu";
6c1d134a103f68c Rafał Miłecki    2024-01-08   23  			enable-method = "psci";
8ac21b111d4a46e Frank Wunderlich 2024-10-05   24  			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
8ac21b111d4a46e Frank Wunderlich 2024-10-05   25  				 <&topckgen CLK_TOP_XTAL>;
8ac21b111d4a46e Frank Wunderlich 2024-10-05   26  			clock-names = "cpu", "intermediate";
8ac21b111d4a46e Frank Wunderlich 2024-10-05   27  			operating-points-v2 = <&cluster0_opp>;
6c1d134a103f68c Rafał Miłecki    2024-01-08   28  		};
6c1d134a103f68c Rafał Miłecki    2024-01-08   29  
8ac21b111d4a46e Frank Wunderlich 2024-10-05   30  		cpu1: cpu@1 {
6c1d134a103f68c Rafał Miłecki    2024-01-08   31  			compatible = "arm,cortex-a73";
6c1d134a103f68c Rafał Miłecki    2024-01-08   32  			reg = <0x1>;
6c1d134a103f68c Rafał Miłecki    2024-01-08   33  			device_type = "cpu";
6c1d134a103f68c Rafał Miłecki    2024-01-08   34  			enable-method = "psci";
8ac21b111d4a46e Frank Wunderlich 2024-10-05   35  			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
8ac21b111d4a46e Frank Wunderlich 2024-10-05   36  				 <&topckgen CLK_TOP_XTAL>;
8ac21b111d4a46e Frank Wunderlich 2024-10-05   37  			clock-names = "cpu", "intermediate";
8ac21b111d4a46e Frank Wunderlich 2024-10-05   38  			operating-points-v2 = <&cluster0_opp>;
6c1d134a103f68c Rafał Miłecki    2024-01-08   39  		};
6c1d134a103f68c Rafał Miłecki    2024-01-08   40  
8ac21b111d4a46e Frank Wunderlich 2024-10-05   41  		cpu2: cpu@2 {
6c1d134a103f68c Rafał Miłecki    2024-01-08   42  			compatible = "arm,cortex-a73";
6c1d134a103f68c Rafał Miłecki    2024-01-08   43  			reg = <0x2>;
6c1d134a103f68c Rafał Miłecki    2024-01-08   44  			device_type = "cpu";
6c1d134a103f68c Rafał Miłecki    2024-01-08   45  			enable-method = "psci";
8ac21b111d4a46e Frank Wunderlich 2024-10-05   46  			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
8ac21b111d4a46e Frank Wunderlich 2024-10-05   47  				 <&topckgen CLK_TOP_XTAL>;
8ac21b111d4a46e Frank Wunderlich 2024-10-05   48  			clock-names = "cpu", "intermediate";
8ac21b111d4a46e Frank Wunderlich 2024-10-05   49  			operating-points-v2 = <&cluster0_opp>;
6c1d134a103f68c Rafał Miłecki    2024-01-08   50  		};
6c1d134a103f68c Rafał Miłecki    2024-01-08   51  
8ac21b111d4a46e Frank Wunderlich 2024-10-05   52  		cpu3: cpu@3 {
6c1d134a103f68c Rafał Miłecki    2024-01-08   53  			compatible = "arm,cortex-a73";
6c1d134a103f68c Rafał Miłecki    2024-01-08   54  			reg = <0x3>;
6c1d134a103f68c Rafał Miłecki    2024-01-08   55  			device_type = "cpu";
6c1d134a103f68c Rafał Miłecki    2024-01-08   56  			enable-method = "psci";
8ac21b111d4a46e Frank Wunderlich 2024-10-05   57  			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
8ac21b111d4a46e Frank Wunderlich 2024-10-05   58  				 <&topckgen CLK_TOP_XTAL>;
8ac21b111d4a46e Frank Wunderlich 2024-10-05   59  			clock-names = "cpu", "intermediate";
8ac21b111d4a46e Frank Wunderlich 2024-10-05   60  			operating-points-v2 = <&cluster0_opp>;
8ac21b111d4a46e Frank Wunderlich 2024-10-05   61  		};
8ac21b111d4a46e Frank Wunderlich 2024-10-05   62  
8ac21b111d4a46e Frank Wunderlich 2024-10-05   63  		cluster0_opp: opp-table-0 {
8ac21b111d4a46e Frank Wunderlich 2024-10-05   64  			compatible = "operating-points-v2";
8ac21b111d4a46e Frank Wunderlich 2024-10-05   65  			opp-shared;
8ac21b111d4a46e Frank Wunderlich 2024-10-05   66  			opp00 {
8ac21b111d4a46e Frank Wunderlich 2024-10-05   67  				opp-hz = /bits/ 64 <800000000>;
8ac21b111d4a46e Frank Wunderlich 2024-10-05   68  				opp-microvolt = <850000>;
8ac21b111d4a46e Frank Wunderlich 2024-10-05   69  			};
8ac21b111d4a46e Frank Wunderlich 2024-10-05   70  			opp01 {
8ac21b111d4a46e Frank Wunderlich 2024-10-05   71  				opp-hz = /bits/ 64 <1100000000>;
8ac21b111d4a46e Frank Wunderlich 2024-10-05   72  				opp-microvolt = <850000>;
8ac21b111d4a46e Frank Wunderlich 2024-10-05   73  			};
8ac21b111d4a46e Frank Wunderlich 2024-10-05   74  			opp02 {
8ac21b111d4a46e Frank Wunderlich 2024-10-05   75  				opp-hz = /bits/ 64 <1500000000>;
8ac21b111d4a46e Frank Wunderlich 2024-10-05   76  				opp-microvolt = <850000>;
8ac21b111d4a46e Frank Wunderlich 2024-10-05   77  			};
8ac21b111d4a46e Frank Wunderlich 2024-10-05   78  			opp03 {
8ac21b111d4a46e Frank Wunderlich 2024-10-05   79  				opp-hz = /bits/ 64 <1800000000>;
8ac21b111d4a46e Frank Wunderlich 2024-10-05   80  				opp-microvolt = <900000>;
8ac21b111d4a46e Frank Wunderlich 2024-10-05   81  			};
6c1d134a103f68c Rafał Miłecki    2024-01-08   82  		};
6c1d134a103f68c Rafał Miłecki    2024-01-08   83  	};
6c1d134a103f68c Rafał Miłecki    2024-01-08   84  
6c1d134a103f68c Rafał Miłecki    2024-01-08   85  	oscillator-40m {
6c1d134a103f68c Rafał Miłecki    2024-01-08   86  		compatible = "fixed-clock";
6c1d134a103f68c Rafał Miłecki    2024-01-08   87  		clock-frequency = <40000000>;
6c1d134a103f68c Rafał Miłecki    2024-01-08   88  		#clock-cells = <0>;
6c1d134a103f68c Rafał Miłecki    2024-01-08   89  		clock-output-names = "clkxtal";
6c1d134a103f68c Rafał Miłecki    2024-01-08   90  	};
6c1d134a103f68c Rafał Miłecki    2024-01-08   91  
6c1d134a103f68c Rafał Miłecki    2024-01-08   92  	pmu {
6c1d134a103f68c Rafał Miłecki    2024-01-08   93  		compatible = "arm,cortex-a73-pmu";
6c1d134a103f68c Rafał Miłecki    2024-01-08   94  		interrupt-parent = <&gic>;
6c1d134a103f68c Rafał Miłecki    2024-01-08   95  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
6c1d134a103f68c Rafał Miłecki    2024-01-08   96  	};
6c1d134a103f68c Rafał Miłecki    2024-01-08   97  
6c1d134a103f68c Rafał Miłecki    2024-01-08   98  	psci {
6c1d134a103f68c Rafał Miłecki    2024-01-08   99  		compatible = "arm,psci-0.2";
6c1d134a103f68c Rafał Miłecki    2024-01-08  100  		method = "smc";
6c1d134a103f68c Rafał Miłecki    2024-01-08  101  	};
6c1d134a103f68c Rafał Miłecki    2024-01-08  102  
4ede69bcf924ef2 Frank Wunderlich 2024-10-05  103  	reg_1p8v: regulator-1p8v {
4ede69bcf924ef2 Frank Wunderlich 2024-10-05  104  		compatible = "regulator-fixed";
4ede69bcf924ef2 Frank Wunderlich 2024-10-05  105  		regulator-name = "fixed-1.8V";
4ede69bcf924ef2 Frank Wunderlich 2024-10-05  106  		regulator-min-microvolt = <1800000>;
4ede69bcf924ef2 Frank Wunderlich 2024-10-05  107  		regulator-max-microvolt = <1800000>;
4ede69bcf924ef2 Frank Wunderlich 2024-10-05  108  		regulator-boot-on;
4ede69bcf924ef2 Frank Wunderlich 2024-10-05  109  		regulator-always-on;
4ede69bcf924ef2 Frank Wunderlich 2024-10-05  110  	};
4ede69bcf924ef2 Frank Wunderlich 2024-10-05  111  
4ede69bcf924ef2 Frank Wunderlich 2024-10-05  112  	reg_3p3v: regulator-3p3v {
4ede69bcf924ef2 Frank Wunderlich 2024-10-05  113  		compatible = "regulator-fixed";
4ede69bcf924ef2 Frank Wunderlich 2024-10-05  114  		regulator-name = "fixed-3.3V";
4ede69bcf924ef2 Frank Wunderlich 2024-10-05  115  		regulator-min-microvolt = <3300000>;
4ede69bcf924ef2 Frank Wunderlich 2024-10-05  116  		regulator-max-microvolt = <3300000>;
4ede69bcf924ef2 Frank Wunderlich 2024-10-05  117  		regulator-boot-on;
4ede69bcf924ef2 Frank Wunderlich 2024-10-05  118  		regulator-always-on;
4ede69bcf924ef2 Frank Wunderlich 2024-10-05  119  	};
4ede69bcf924ef2 Frank Wunderlich 2024-10-05  120  
f57d0dbf69e64b1 Frank Wunderlich 2024-10-05  121  	reserved-memory {
f57d0dbf69e64b1 Frank Wunderlich 2024-10-05  122  		#address-cells = <2>;
f57d0dbf69e64b1 Frank Wunderlich 2024-10-05  123  		#size-cells = <2>;
f57d0dbf69e64b1 Frank Wunderlich 2024-10-05  124  		ranges;
f57d0dbf69e64b1 Frank Wunderlich 2024-10-05  125  
f57d0dbf69e64b1 Frank Wunderlich 2024-10-05  126  		/* 320 KiB reserved for ARM Trusted Firmware (BL31 and BL32) */
f57d0dbf69e64b1 Frank Wunderlich 2024-10-05  127  		secmon_reserved: secmon@43000000 {
f57d0dbf69e64b1 Frank Wunderlich 2024-10-05  128  			reg = <0 0x43000000 0 0x50000>;
f57d0dbf69e64b1 Frank Wunderlich 2024-10-05  129  			no-map;
f57d0dbf69e64b1 Frank Wunderlich 2024-10-05  130  		};
f57d0dbf69e64b1 Frank Wunderlich 2024-10-05  131  	};
f57d0dbf69e64b1 Frank Wunderlich 2024-10-05  132  
6c1d134a103f68c Rafał Miłecki    2024-01-08  133  	soc {
6c1d134a103f68c Rafał Miłecki    2024-01-08  134  		compatible = "simple-bus";
6c1d134a103f68c Rafał Miłecki    2024-01-08  135  		ranges;
6c1d134a103f68c Rafał Miłecki    2024-01-08  136  		#address-cells = <2>;
6c1d134a103f68c Rafał Miłecki    2024-01-08  137  		#size-cells = <2>;
6c1d134a103f68c Rafał Miłecki    2024-01-08  138  
6c1d134a103f68c Rafał Miłecki    2024-01-08  139  		gic: interrupt-controller@c000000 {
6c1d134a103f68c Rafał Miłecki    2024-01-08  140  			compatible = "arm,gic-v3";
6c1d134a103f68c Rafał Miłecki    2024-01-08  141  			reg = <0 0x0c000000 0 0x40000>,  /* GICD */
6c1d134a103f68c Rafał Miłecki    2024-01-08  142  			      <0 0x0c080000 0 0x200000>, /* GICR */
6c1d134a103f68c Rafał Miłecki    2024-01-08  143  			      <0 0x0c400000 0 0x2000>,   /* GICC */
6c1d134a103f68c Rafał Miłecki    2024-01-08  144  			      <0 0x0c410000 0 0x1000>,   /* GICH */
6c1d134a103f68c Rafał Miłecki    2024-01-08  145  			      <0 0x0c420000 0 0x2000>;   /* GICV */
6c1d134a103f68c Rafał Miłecki    2024-01-08  146  			interrupt-parent = <&gic>;
6c1d134a103f68c Rafał Miłecki    2024-01-08  147  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
6c1d134a103f68c Rafał Miłecki    2024-01-08  148  			interrupt-controller;
6c1d134a103f68c Rafał Miłecki    2024-01-08  149  			#interrupt-cells = <3>;
6c1d134a103f68c Rafał Miłecki    2024-01-08  150  		};
6c1d134a103f68c Rafał Miłecki    2024-01-08  151  
09346afaba0a896 Rafał Miłecki    2024-02-13  152  		infracfg: clock-controller@10001000 {
b616b403cbffc68 Rafał Miłecki    2024-01-08  153  			compatible = "mediatek,mt7988-infracfg", "syscon";
b616b403cbffc68 Rafał Miłecki    2024-01-08  154  			reg = <0 0x10001000 0 0x1000>;
b616b403cbffc68 Rafał Miłecki    2024-01-08  155  			#clock-cells = <1>;
449ca7346794934 Frank Wunderlich 2024-10-05  156  			#reset-cells = <1>;
b616b403cbffc68 Rafał Miłecki    2024-01-08  157  		};
b616b403cbffc68 Rafał Miłecki    2024-01-08  158  
c321cb96d3c14ef Rafał Miłecki    2024-06-05  159  		topckgen: clock-controller@1001b000 {
b616b403cbffc68 Rafał Miłecki    2024-01-08  160  			compatible = "mediatek,mt7988-topckgen", "syscon";
b616b403cbffc68 Rafał Miłecki    2024-01-08  161  			reg = <0 0x1001b000 0 0x1000>;
b616b403cbffc68 Rafał Miłecki    2024-01-08  162  			#clock-cells = <1>;
b616b403cbffc68 Rafał Miłecki    2024-01-08  163  		};
b616b403cbffc68 Rafał Miłecki    2024-01-08  164  
b616b403cbffc68 Rafał Miłecki    2024-01-08  165  		watchdog: watchdog@1001c000 {
6c1d134a103f68c Rafał Miłecki    2024-01-08  166  			compatible = "mediatek,mt7988-wdt";
6c1d134a103f68c Rafał Miłecki    2024-01-08  167  			reg = <0 0x1001c000 0 0x1000>;
6c1d134a103f68c Rafał Miłecki    2024-01-08  168  			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
6c1d134a103f68c Rafał Miłecki    2024-01-08  169  			#reset-cells = <1>;
6c1d134a103f68c Rafał Miłecki    2024-01-08  170  		};
b616b403cbffc68 Rafał Miłecki    2024-01-08  171  
7535d1b91834c44 Frank Wunderlich 2024-10-04  172  		apmixedsys: clock-controller@1001e000 {
b616b403cbffc68 Rafał Miłecki    2024-01-08  173  			compatible = "mediatek,mt7988-apmixedsys";
b616b403cbffc68 Rafał Miłecki    2024-01-08  174  			reg = <0 0x1001e000 0 0x1000>;
b616b403cbffc68 Rafał Miłecki    2024-01-08  175  			#clock-cells = <1>;
b616b403cbffc68 Rafał Miłecki    2024-01-08  176  		};
b616b403cbffc68 Rafał Miłecki    2024-01-08  177  
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  178  		pio: pinctrl@1001f000 {
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  179  			compatible = "mediatek,mt7988-pinctrl";
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  180  			reg = <0 0x1001f000 0 0x1000>,
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  181  			      <0 0x11c10000 0 0x1000>,
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  182  			      <0 0x11d00000 0 0x1000>,
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  183  			      <0 0x11d20000 0 0x1000>,
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  184  			      <0 0x11e00000 0 0x1000>,
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  185  			      <0 0x11f00000 0 0x1000>,
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  186  			      <0 0x1000b000 0 0x1000>;
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  187  			reg-names = "gpio", "iocfg_tr",
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  188  				    "iocfg_br", "iocfg_rb",
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  189  				    "iocfg_lb", "iocfg_tl", "eint";
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  190  			gpio-controller;
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  191  			#gpio-cells = <2>;
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  192  			gpio-ranges = <&pio 0 0 84>;
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  193  			interrupt-controller;
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  194  			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  195  			interrupt-parent = <&gic>;
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  196  			#interrupt-cells = <2>;
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  197  
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  198  			pcie0_pins: pcie0-pins {
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  199  				mux {
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  200  					function = "pcie";
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  201  					groups = "pcie_2l_0_pereset", "pcie_clk_req_n0_0",
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  202  						 "pcie_wake_n0_0";
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  203  				};
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  204  			};
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  205  
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  206  			pcie1_pins: pcie1-pins {
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  207  				mux {
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  208  					function = "pcie";
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  209  					groups = "pcie_2l_1_pereset", "pcie_clk_req_n1",
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  210  						 "pcie_wake_n1_0";
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  211  				};
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  212  			};
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  213  
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  214  			pcie2_pins: pcie2-pins {
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  215  				mux {
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  216  					function = "pcie";
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  217  					groups = "pcie_1l_0_pereset", "pcie_clk_req_n2_0",
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  218  						 "pcie_wake_n2_0";
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  219  				};
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  220  			};
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  221  
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  222  			pcie3_pins: pcie3-pins {
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  223  				mux {
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  224  					function = "pcie";
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  225  					groups = "pcie_1l_1_pereset", "pcie_clk_req_n3",
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  226  						 "pcie_wake_n3_0";
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  227  				};
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  228  			};
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  229  		};
0e6d7a2feeeaeb1 Frank Wunderlich 2024-10-03  230  
a0cafafa12c462e Frank Wunderlich 2024-10-06  231  		pwm: pwm@10048000 {
09ff2216a035709 Rafał Miłecki    2024-06-04  232  			compatible = "mediatek,mt7988-pwm";
09ff2216a035709 Rafał Miłecki    2024-06-04  233  			reg = <0 0x10048000 0 0x1000>;
09ff2216a035709 Rafał Miłecki    2024-06-04  234  			clocks = <&infracfg CLK_INFRA_66M_PWM_BCK>,
09ff2216a035709 Rafał Miłecki    2024-06-04  235  				 <&infracfg CLK_INFRA_66M_PWM_HCK>,
09ff2216a035709 Rafał Miłecki    2024-06-04  236  				 <&infracfg CLK_INFRA_66M_PWM_CK1>,
09ff2216a035709 Rafał Miłecki    2024-06-04  237  				 <&infracfg CLK_INFRA_66M_PWM_CK2>,
09ff2216a035709 Rafał Miłecki    2024-06-04  238  				 <&infracfg CLK_INFRA_66M_PWM_CK3>,
09ff2216a035709 Rafał Miłecki    2024-06-04  239  				 <&infracfg CLK_INFRA_66M_PWM_CK4>,
09ff2216a035709 Rafał Miłecki    2024-06-04  240  				 <&infracfg CLK_INFRA_66M_PWM_CK5>,
09ff2216a035709 Rafał Miłecki    2024-06-04  241  				 <&infracfg CLK_INFRA_66M_PWM_CK6>,
09ff2216a035709 Rafał Miłecki    2024-06-04  242  				 <&infracfg CLK_INFRA_66M_PWM_CK7>,
09ff2216a035709 Rafał Miłecki    2024-06-04  243  				 <&infracfg CLK_INFRA_66M_PWM_CK8>;
09ff2216a035709 Rafał Miłecki    2024-06-04  244  			clock-names = "top", "main", "pwm1", "pwm2", "pwm3",
09ff2216a035709 Rafał Miłecki    2024-06-04  245  				      "pwm4", "pwm5", "pwm6", "pwm7", "pwm8";
09ff2216a035709 Rafał Miłecki    2024-06-04  246  			#pwm-cells = <2>;
09ff2216a035709 Rafał Miłecki    2024-06-04  247  			status = "disabled";
09ff2216a035709 Rafał Miłecki    2024-06-04  248  		};
09ff2216a035709 Rafał Miłecki    2024-06-04  249  
e6578fd4aac7812 Frank Wunderlich 2024-10-05  250  		mcusys: mcusys@100e0000 {
e6578fd4aac7812 Frank Wunderlich 2024-10-05  251  			compatible = "mediatek,mt7988-mcusys", "syscon";
e6578fd4aac7812 Frank Wunderlich 2024-10-05  252  			reg = <0 0x100e0000 0 0x1000>;
e6578fd4aac7812 Frank Wunderlich 2024-10-05  253  			#clock-cells = <1>;
e6578fd4aac7812 Frank Wunderlich 2024-10-05  254  		};
e6578fd4aac7812 Frank Wunderlich 2024-10-05  255  
2e5e41c205c3155 Frank Wunderlich 2024-10-06  256  		serial0: serial@11000000 {
c321cb96d3c14ef Rafał Miłecki    2024-06-05  257  			compatible = "mediatek,mt7988-uart", "mediatek,mt6577-uart";
c321cb96d3c14ef Rafał Miłecki    2024-06-05  258  			reg = <0 0x11000000 0 0x100>;
c321cb96d3c14ef Rafał Miłecki    2024-06-05  259  			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
c321cb96d3c14ef Rafał Miłecki    2024-06-05  260  			interrupt-names = "uart", "wakeup";
c321cb96d3c14ef Rafał Miłecki    2024-06-05  261  			clocks = <&topckgen CLK_TOP_UART_SEL>,
c321cb96d3c14ef Rafał Miłecki    2024-06-05  262  				 <&infracfg CLK_INFRA_52M_UART0_CK>;
c321cb96d3c14ef Rafał Miłecki    2024-06-05  263  			clock-names = "baud", "bus";
c321cb96d3c14ef Rafał Miłecki    2024-06-05  264  			status = "disabled";
c321cb96d3c14ef Rafał Miłecki    2024-06-05  265  		};
c321cb96d3c14ef Rafał Miłecki    2024-06-05  266  
2e5e41c205c3155 Frank Wunderlich 2024-10-06  267  		serial1: serial@11000100 {
c321cb96d3c14ef Rafał Miłecki    2024-06-05  268  			compatible = "mediatek,mt7988-uart", "mediatek,mt6577-uart";
c321cb96d3c14ef Rafał Miłecki    2024-06-05  269  			reg = <0 0x11000100 0 0x100>;
c321cb96d3c14ef Rafał Miłecki    2024-06-05  270  			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
c321cb96d3c14ef Rafał Miłecki    2024-06-05  271  			interrupt-names = "uart", "wakeup";
c321cb96d3c14ef Rafał Miłecki    2024-06-05  272  			clocks = <&topckgen CLK_TOP_UART_SEL>,
c321cb96d3c14ef Rafał Miłecki    2024-06-05  273  				 <&infracfg CLK_INFRA_52M_UART1_CK>;
c321cb96d3c14ef Rafał Miłecki    2024-06-05  274  			clock-names = "baud", "bus";
c321cb96d3c14ef Rafał Miłecki    2024-06-05  275  			status = "disabled";
c321cb96d3c14ef Rafał Miłecki    2024-06-05  276  		};
c321cb96d3c14ef Rafał Miłecki    2024-06-05  277  
2e5e41c205c3155 Frank Wunderlich 2024-10-06  278  		serial2: serial@11000200 {
c321cb96d3c14ef Rafał Miłecki    2024-06-05  279  			compatible = "mediatek,mt7988-uart", "mediatek,mt6577-uart";
c321cb96d3c14ef Rafał Miłecki    2024-06-05  280  			reg = <0 0x11000200 0 0x100>;
c321cb96d3c14ef Rafał Miłecki    2024-06-05  281  			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
c321cb96d3c14ef Rafał Miłecki    2024-06-05  282  			interrupt-names = "uart", "wakeup";
c321cb96d3c14ef Rafał Miłecki    2024-06-05  283  			clocks = <&topckgen CLK_TOP_UART_SEL>,
c321cb96d3c14ef Rafał Miłecki    2024-06-05  284  				 <&infracfg CLK_INFRA_52M_UART2_CK>;
c321cb96d3c14ef Rafał Miłecki    2024-06-05  285  			clock-names = "baud", "bus";
c321cb96d3c14ef Rafał Miłecki    2024-06-05  286  			status = "disabled";
c321cb96d3c14ef Rafał Miłecki    2024-06-05  287  		};
c321cb96d3c14ef Rafał Miłecki    2024-06-05  288  
4af694952138ac0 Frank Wunderlich 2024-10-05  289  		i2c0: i2c@11003000 {
660c230bf302803 Rafał Miłecki    2024-06-04  290  			compatible = "mediatek,mt7981-i2c";
660c230bf302803 Rafał Miłecki    2024-06-04  291  			reg = <0 0x11003000 0 0x1000>,
660c230bf302803 Rafał Miłecki    2024-06-04  292  			      <0 0x10217080 0 0x80>;
660c230bf302803 Rafał Miłecki    2024-06-04  293  			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
660c230bf302803 Rafał Miłecki    2024-06-04  294  			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
660c230bf302803 Rafał Miłecki    2024-06-04  295  				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
660c230bf302803 Rafał Miłecki    2024-06-04  296  			clock-names = "main", "dma";
660c230bf302803 Rafał Miłecki    2024-06-04  297  			#address-cells = <1>;
660c230bf302803 Rafał Miłecki    2024-06-04  298  			#size-cells = <0>;
660c230bf302803 Rafał Miłecki    2024-06-04  299  			status = "disabled";
660c230bf302803 Rafał Miłecki    2024-06-04  300  		};
660c230bf302803 Rafał Miłecki    2024-06-04  301  
4af694952138ac0 Frank Wunderlich 2024-10-05  302  		i2c1: i2c@11004000 {
660c230bf302803 Rafał Miłecki    2024-06-04  303  			compatible = "mediatek,mt7981-i2c";
660c230bf302803 Rafał Miłecki    2024-06-04  304  			reg = <0 0x11004000 0 0x1000>,
660c230bf302803 Rafał Miłecki    2024-06-04  305  			      <0 0x10217100 0 0x80>;
660c230bf302803 Rafał Miłecki    2024-06-04  306  			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
660c230bf302803 Rafał Miłecki    2024-06-04  307  			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
660c230bf302803 Rafał Miłecki    2024-06-04  308  				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
660c230bf302803 Rafał Miłecki    2024-06-04  309  			clock-names = "main", "dma";
660c230bf302803 Rafał Miłecki    2024-06-04  310  			#address-cells = <1>;
660c230bf302803 Rafał Miłecki    2024-06-04  311  			#size-cells = <0>;
660c230bf302803 Rafał Miłecki    2024-06-04  312  			status = "disabled";
660c230bf302803 Rafał Miłecki    2024-06-04  313  		};
660c230bf302803 Rafał Miłecki    2024-06-04  314  
4af694952138ac0 Frank Wunderlich 2024-10-05  315  		i2c2: i2c@11005000 {
660c230bf302803 Rafał Miłecki    2024-06-04  316  			compatible = "mediatek,mt7981-i2c";
660c230bf302803 Rafał Miłecki    2024-06-04  317  			reg = <0 0x11005000 0 0x1000>,
660c230bf302803 Rafał Miłecki    2024-06-04  318  			      <0 0x10217180 0 0x80>;
660c230bf302803 Rafał Miłecki    2024-06-04  319  			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
660c230bf302803 Rafał Miłecki    2024-06-04  320  			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
660c230bf302803 Rafał Miłecki    2024-06-04  321  				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
660c230bf302803 Rafał Miłecki    2024-06-04  322  			clock-names = "main", "dma";
660c230bf302803 Rafał Miłecki    2024-06-04  323  			#address-cells = <1>;
660c230bf302803 Rafał Miłecki    2024-06-04  324  			#size-cells = <0>;
660c230bf302803 Rafał Miłecki    2024-06-04  325  			status = "disabled";
660c230bf302803 Rafał Miłecki    2024-06-04  326  		};
660c230bf302803 Rafał Miłecki    2024-06-04  327  
a00bf82895f44ab Frank Wunderlich 2024-10-05  328  		spi0: spi@11007000 {
a00bf82895f44ab Frank Wunderlich 2024-10-05  329  			compatible = "mediatek,ipm-spi-quad", "mediatek,spi-ipm";
a00bf82895f44ab Frank Wunderlich 2024-10-05  330  			reg = <0 0x11007000 0 0x100>;
a00bf82895f44ab Frank Wunderlich 2024-10-05  331  			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
a00bf82895f44ab Frank Wunderlich 2024-10-05  332  			clocks = <&topckgen CLK_TOP_MPLL_D2>,
a00bf82895f44ab Frank Wunderlich 2024-10-05  333  				 <&topckgen CLK_TOP_SPI_SEL>,
a00bf82895f44ab Frank Wunderlich 2024-10-05  334  				 <&infracfg CLK_INFRA_104M_SPI0>,
a00bf82895f44ab Frank Wunderlich 2024-10-05  335  				 <&infracfg CLK_INFRA_66M_SPI0_HCK>;
a00bf82895f44ab Frank Wunderlich 2024-10-05  336  			clock-names = "parent-clk", "sel-clk", "spi-clk",
a00bf82895f44ab Frank Wunderlich 2024-10-05  337  				      "hclk";
a00bf82895f44ab Frank Wunderlich 2024-10-05  338  			#address-cells = <1>;
a00bf82895f44ab Frank Wunderlich 2024-10-05  339  			#size-cells = <0>;
a00bf82895f44ab Frank Wunderlich 2024-10-05  340  			status = "disabled";
a00bf82895f44ab Frank Wunderlich 2024-10-05  341  		};
a00bf82895f44ab Frank Wunderlich 2024-10-05  342  
a00bf82895f44ab Frank Wunderlich 2024-10-05 @343  		spi1: spi@11008000 {

:::::: The code at line 343 was first introduced by commit
:::::: a00bf82895f44ab46e64c2c47f25ac97e7be424a arm64: dts: mediatek: mt7988: add spi controllers

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
