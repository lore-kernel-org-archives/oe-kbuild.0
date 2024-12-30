Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960471991A1
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Dec 2024 21:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735595933; cv=none; b=Z/25LZynDZBsuCriuowk5btWz6Xa5z777r4+Lvhae78GMc5xILcaWxl2u8rloPTiE3X35uEo+OYpuJ2PwNbmJ1jZg7/dtQ/KmL2KttgY/dCJsmtk31ULbn3A6SMAVmy5XpXeowVJqBtIa6eYbemQsKwtjVQtozcFf39hqz//0oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735595933; c=relaxed/simple;
	bh=bUpjGyDGELE4EmpTbPUtkhFGqiREBcKoXbf1hmiTOl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nVzkLZsD0DGXyiYKVhAQ6DxvpkodPtV72SgkB4H63vTopuOFHfIl12/WwEPc/g9vXL5eauf7tYaZUdBjz9mga2z4VGRxxY+D4W//AZD20nX+C98rxDy8/mD5B+HweGnt6FRIWdaOyCK/zfjQvrH3hFIUhPRd8HuxR00+JToW5nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nxq32UXr; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nxq32UXr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735595931; x=1767131931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bUpjGyDGELE4EmpTbPUtkhFGqiREBcKoXbf1hmiTOl4=;
  b=Nxq32UXrSfhX9lTMAgvMOz0Z6+0LrKg4ylZ5Qjcqmr/cwYzT/WqgZi5C
   APWySBoCOXMWRX1HBzp+7GsZ3At8qCOxtLYDOxSOTrBeyTQElQfxslzHv
   /XPSORcd7uT2kcFnkTt7rI2judLMZL+rvdieR2nCn7m+7LnEQHBYQlgu2
   xRYc7Y5Ej3MWiymFHFygEW6U2P65cNoHrNIgfshfdl9cvfXizh0XwOBnj
   E/8NpMy9eZPYqbPt5F3bY2uQfiicMPXlr5lRES3i2jmwl9sMXBssxlwHg
   u21/DNvMG49m26EVT/5bitbBmNd1xHdC8SzfRUNcHjytdsDXlDF7NOqPZ
   A==;
X-CSE-ConnectionGUID: 55Zs43asRk+4jcSjetXVLg==
X-CSE-MsgGUID: XajDEjRQQRCntrREOuW4FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="39655241"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="39655241"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 13:58:51 -0800
X-CSE-ConnectionGUID: BSzHI9zMQMifPZa9c2x/+Q==
X-CSE-MsgGUID: 9IWQ5MSqS1CGVknn1UJiDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="105749560"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Dec 2024 13:58:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSNmg-0006Qa-2j;
	Mon, 30 Dec 2024 21:58:46 +0000
Date: Tue, 31 Dec 2024 05:57:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:105.6-590.4: Warning
 (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit
 name
Message-ID: <202412310526.T3Xpr8ph-lkp@intel.com>
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
TO: Andre Przywara <andre.przywara@arm.com>
CC: Jernej Skrabec <jernej.skrabec@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ccb98ccef0e543c2bd4ef1a72270461957f3d8d0
commit: 5a378f9f2b15a2aa3b7485e46c3d300103ea384b arm64: dts: allwinner: h616: Add OrangePi Zero 2 board support
date:   2 years, 6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 2 years, 6 months ago
config: arm64-randconfig-003-20241220 (https://download.01.org/0day-ci/archive/20241231/202412310526.T3Xpr8ph-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412310526.T3Xpr8ph-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412310526.T3Xpr8ph-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:105.6-590.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name

vim +105 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi

0d17c865118881 Andre Przywara 2022-07-08   12  
0d17c865118881 Andre Przywara 2022-07-08   13  / {
0d17c865118881 Andre Przywara 2022-07-08   14  	interrupt-parent = <&gic>;
0d17c865118881 Andre Przywara 2022-07-08   15  	#address-cells = <2>;
0d17c865118881 Andre Przywara 2022-07-08   16  	#size-cells = <2>;
0d17c865118881 Andre Przywara 2022-07-08   17  
0d17c865118881 Andre Przywara 2022-07-08   18  	cpus {
0d17c865118881 Andre Przywara 2022-07-08   19  		#address-cells = <1>;
0d17c865118881 Andre Przywara 2022-07-08   20  		#size-cells = <0>;
0d17c865118881 Andre Przywara 2022-07-08   21  
0d17c865118881 Andre Przywara 2022-07-08   22  		cpu0: cpu@0 {
0d17c865118881 Andre Przywara 2022-07-08   23  			compatible = "arm,cortex-a53";
0d17c865118881 Andre Przywara 2022-07-08   24  			device_type = "cpu";
0d17c865118881 Andre Przywara 2022-07-08   25  			reg = <0>;
0d17c865118881 Andre Przywara 2022-07-08   26  			enable-method = "psci";
0d17c865118881 Andre Przywara 2022-07-08   27  			clocks = <&ccu CLK_CPUX>;
0d17c865118881 Andre Przywara 2022-07-08   28  		};
0d17c865118881 Andre Przywara 2022-07-08   29  
0d17c865118881 Andre Przywara 2022-07-08   30  		cpu1: cpu@1 {
0d17c865118881 Andre Przywara 2022-07-08   31  			compatible = "arm,cortex-a53";
0d17c865118881 Andre Przywara 2022-07-08   32  			device_type = "cpu";
0d17c865118881 Andre Przywara 2022-07-08   33  			reg = <1>;
0d17c865118881 Andre Przywara 2022-07-08   34  			enable-method = "psci";
0d17c865118881 Andre Przywara 2022-07-08   35  			clocks = <&ccu CLK_CPUX>;
0d17c865118881 Andre Przywara 2022-07-08   36  		};
0d17c865118881 Andre Przywara 2022-07-08   37  
0d17c865118881 Andre Przywara 2022-07-08   38  		cpu2: cpu@2 {
0d17c865118881 Andre Przywara 2022-07-08   39  			compatible = "arm,cortex-a53";
0d17c865118881 Andre Przywara 2022-07-08   40  			device_type = "cpu";
0d17c865118881 Andre Przywara 2022-07-08   41  			reg = <2>;
0d17c865118881 Andre Przywara 2022-07-08   42  			enable-method = "psci";
0d17c865118881 Andre Przywara 2022-07-08   43  			clocks = <&ccu CLK_CPUX>;
0d17c865118881 Andre Przywara 2022-07-08   44  		};
0d17c865118881 Andre Przywara 2022-07-08   45  
0d17c865118881 Andre Przywara 2022-07-08   46  		cpu3: cpu@3 {
0d17c865118881 Andre Przywara 2022-07-08   47  			compatible = "arm,cortex-a53";
0d17c865118881 Andre Przywara 2022-07-08   48  			device_type = "cpu";
0d17c865118881 Andre Przywara 2022-07-08   49  			reg = <3>;
0d17c865118881 Andre Przywara 2022-07-08   50  			enable-method = "psci";
0d17c865118881 Andre Przywara 2022-07-08   51  			clocks = <&ccu CLK_CPUX>;
0d17c865118881 Andre Przywara 2022-07-08   52  		};
0d17c865118881 Andre Przywara 2022-07-08   53  	};
0d17c865118881 Andre Przywara 2022-07-08   54  
0d17c865118881 Andre Przywara 2022-07-08   55  	reserved-memory {
0d17c865118881 Andre Przywara 2022-07-08   56  		#address-cells = <2>;
0d17c865118881 Andre Przywara 2022-07-08   57  		#size-cells = <2>;
0d17c865118881 Andre Przywara 2022-07-08   58  		ranges;
0d17c865118881 Andre Przywara 2022-07-08   59  
0d17c865118881 Andre Przywara 2022-07-08   60  		/*
0d17c865118881 Andre Przywara 2022-07-08   61  		 * 256 KiB reserved for Trusted Firmware-A (BL31).
0d17c865118881 Andre Przywara 2022-07-08   62  		 * This is added by BL31 itself, but some bootloaders fail
0d17c865118881 Andre Przywara 2022-07-08   63  		 * to propagate this into the DTB handed to kernels.
0d17c865118881 Andre Przywara 2022-07-08   64  		 */
0d17c865118881 Andre Przywara 2022-07-08   65  		secmon@40000000 {
0d17c865118881 Andre Przywara 2022-07-08   66  			reg = <0x0 0x40000000 0x0 0x40000>;
0d17c865118881 Andre Przywara 2022-07-08   67  			no-map;
0d17c865118881 Andre Przywara 2022-07-08   68  		};
0d17c865118881 Andre Przywara 2022-07-08   69  	};
0d17c865118881 Andre Przywara 2022-07-08   70  
0d17c865118881 Andre Przywara 2022-07-08   71  	osc24M: osc24M-clk {
0d17c865118881 Andre Przywara 2022-07-08   72  		#clock-cells = <0>;
0d17c865118881 Andre Przywara 2022-07-08   73  		compatible = "fixed-clock";
0d17c865118881 Andre Przywara 2022-07-08   74  		clock-frequency = <24000000>;
0d17c865118881 Andre Przywara 2022-07-08   75  		clock-output-names = "osc24M";
0d17c865118881 Andre Przywara 2022-07-08   76  	};
0d17c865118881 Andre Przywara 2022-07-08   77  
0d17c865118881 Andre Przywara 2022-07-08   78  	pmu {
0d17c865118881 Andre Przywara 2022-07-08   79  		compatible = "arm,cortex-a53-pmu";
0d17c865118881 Andre Przywara 2022-07-08   80  		interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
0d17c865118881 Andre Przywara 2022-07-08   81  			     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
0d17c865118881 Andre Przywara 2022-07-08   82  			     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
0d17c865118881 Andre Przywara 2022-07-08   83  			     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
0d17c865118881 Andre Przywara 2022-07-08   84  		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
0d17c865118881 Andre Przywara 2022-07-08   85  	};
0d17c865118881 Andre Przywara 2022-07-08   86  
0d17c865118881 Andre Przywara 2022-07-08   87  	psci {
0d17c865118881 Andre Przywara 2022-07-08   88  		compatible = "arm,psci-0.2";
0d17c865118881 Andre Przywara 2022-07-08   89  		method = "smc";
0d17c865118881 Andre Przywara 2022-07-08   90  	};
0d17c865118881 Andre Przywara 2022-07-08   91  
0d17c865118881 Andre Przywara 2022-07-08   92  	timer {
0d17c865118881 Andre Przywara 2022-07-08   93  		compatible = "arm,armv8-timer";
0d17c865118881 Andre Przywara 2022-07-08   94  		arm,no-tick-in-suspend;
0d17c865118881 Andre Przywara 2022-07-08   95  		interrupts = <GIC_PPI 13
0d17c865118881 Andre Przywara 2022-07-08   96  			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
0d17c865118881 Andre Przywara 2022-07-08   97  			     <GIC_PPI 14
0d17c865118881 Andre Przywara 2022-07-08   98  			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
0d17c865118881 Andre Przywara 2022-07-08   99  			     <GIC_PPI 11
0d17c865118881 Andre Przywara 2022-07-08  100  			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
0d17c865118881 Andre Przywara 2022-07-08  101  			     <GIC_PPI 10
0d17c865118881 Andre Przywara 2022-07-08  102  			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
0d17c865118881 Andre Przywara 2022-07-08  103  	};
0d17c865118881 Andre Przywara 2022-07-08  104  
0d17c865118881 Andre Przywara 2022-07-08 @105  	soc {

:::::: The code at line 105 was first introduced by commit
:::::: 0d17c865118881609ea7e381c7cadbb7979cc596 arm64: dts: allwinner: Add Allwinner H616 .dtsi file

:::::: TO: Andre Przywara <andre.przywara@arm.com>
:::::: CC: Jernej Skrabec <jernej.skrabec@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
