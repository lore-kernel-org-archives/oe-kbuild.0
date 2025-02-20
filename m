Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481B01FBE92
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Feb 2025 13:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740057603; cv=none; b=McnZkfUiYIcEGlBYDT0RWgeLVQABrXz4PSUBjGnjymGVuIJOaWo//+vRlMpVlp4oI96l+vwJZ8Hom/wa08jqU1hPuqgw0+3zb9YRbqBQqHHcQFdR8x5nw5ZsPizDMiFAW2aWKqoh6BirmrDL2X0OqU5WdGUhl8iuudmP1q83v1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740057603; c=relaxed/simple;
	bh=Xk2o9ks9UbE54gdNYinnz7TtR55HC0XAO4GSD/bF+kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IWcJZxCqMrmqqU0NM3eXD9IEWRIWEmkWysfB9GbzwYMNoKn1/psG+LfWRiNAakvx0I3NCKLuYHqQVmQ6p8iECNj/4USg7Gx6SE1hXWK+l8HGk5dn9StOLaVBUaJKAOA12Dqh7SPqlmXZOGi4Y1XnSCZAiH2k5hDFagh/fjiwcag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JiFU7bmv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JiFU7bmv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740057600; x=1771593600;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Xk2o9ks9UbE54gdNYinnz7TtR55HC0XAO4GSD/bF+kQ=;
  b=JiFU7bmvoMNR+vjypAgOoZ9rFXgTAlND4VY7/ZZ7JGRfKJE7CcIGRswK
   Z9rJEbYG5gwnP2tUk9kLiBrd1jZ8lkhGkdwohCLK9b6f7ewFHW7Oqj0D/
   JQ1qJ1nYckt9qve1iuUQVVQHc5cYYa8TD3Bo/8lH4gHftCljuTJyoHbdE
   6fYEJTqIRSNTKOuz5Oa9e0L7Fsn2trl4ueBYwDcqFWKpjCYUbJLwN6FKQ
   yFfwbP9eCo1lqURAIVU7g7EbT6nTtgkZgO4imx/rmIM74W0n5Sm1/3Lc7
   kFVv8jdS6XxO/4pyExzjQgYZCUBqco/gl6sisXvhjcBF9ANG3M4SXUMwR
   g==;
X-CSE-ConnectionGUID: sYqfTwccT7eHpJMbTzOFtw==
X-CSE-MsgGUID: ZAIc3Sj0S9CGbcSA5g9y8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51822485"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51822485"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 05:19:58 -0800
X-CSE-ConnectionGUID: 85ZBpTs9TxO+laRUWjOJtw==
X-CSE-MsgGUID: ZKG+sud/SH2o4HF/XNvgiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="115016618"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 20 Feb 2025 05:19:56 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tl6T4-0004K7-04;
	Thu, 20 Feb 2025 13:19:54 +0000
Date: Thu, 20 Feb 2025 21:19:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v2 2/3] dts: mt7988a: Add built-in ethernet phy
 firmware node
Message-ID: <202502202000.O4U1kqYE-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250219083910.2255981-3-SkyLake.Huang@mediatek.com>
References: <20250219083910.2255981-3-SkyLake.Huang@mediatek.com>
TO: Sky Huang <SkyLake.Huang@mediatek.com>
TO: Andrew Lunn <andrew@lunn.ch>
TO: Heiner Kallweit <hkallweit1@gmail.com>
TO: Russell King <linux@armlinux.org.uk>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Daniel Golle <daniel@makrotopia.org>
TO: Qingfang Deng <dqfext@gmail.com>
TO: SkyLake Huang <SkyLake.Huang@mediatek.com>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Simon Horman <horms@kernel.org>
TO: linux-kernel@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-mediatek@lists.infradead.org
CC: Steven Liu <Steven.Liu@mediatek.com>
CC: Sky Huang <skylake.huang@mediatek.com>

Hi Sky,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sky-Huang/dts-mt7988a-Add-built-in-ethernet-phy-firmware-node/20250219-173955
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250219083910.2255981-3-SkyLake.Huang%40mediatek.com
patch subject: [PATCH net-next v2 2/3] dts: mt7988a: Add built-in ethernet phy firmware node
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm64-randconfig-001-20250220 (https://download.01.org/0day-ci/archive/20250220/202502202000.O4U1kqYE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502202000.O4U1kqYE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502202000.O4U1kqYE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:534.24-555.5: Warning (unit_address_vs_reg): /soc/t-phy@11c50000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:325.31-329.5: Warning (simple_bus_reg): /soc/phy-firmware@f000000: simple-bus unit address format error, expected "f100000"
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:534.24-555.5: Warning (simple_bus_reg): /soc/t-phy@11c50000: missing or empty reg/ranges property

vim +/f100000 +325 arch/arm64/boot/dts/mediatek/mt7988a.dtsi

6c1d134a103f68 Rafał Miłecki    2024-01-08    8  
6c1d134a103f68 Rafał Miłecki    2024-01-08    9  / {
6c1d134a103f68 Rafał Miłecki    2024-01-08   10  	compatible = "mediatek,mt7988a";
6c1d134a103f68 Rafał Miłecki    2024-01-08   11  	interrupt-parent = <&gic>;
6c1d134a103f68 Rafał Miłecki    2024-01-08   12  	#address-cells = <2>;
6c1d134a103f68 Rafał Miłecki    2024-01-08   13  	#size-cells = <2>;
6c1d134a103f68 Rafał Miłecki    2024-01-08   14  
6c1d134a103f68 Rafał Miłecki    2024-01-08   15  	cpus {
6c1d134a103f68 Rafał Miłecki    2024-01-08   16  		#address-cells = <1>;
6c1d134a103f68 Rafał Miłecki    2024-01-08   17  		#size-cells = <0>;
6c1d134a103f68 Rafał Miłecki    2024-01-08   18  
607cc6e9b5f10f Frank Wunderlich 2024-12-20   19  		cpu0: cpu@0 {
6c1d134a103f68 Rafał Miłecki    2024-01-08   20  			compatible = "arm,cortex-a73";
6c1d134a103f68 Rafał Miłecki    2024-01-08   21  			reg = <0x0>;
6c1d134a103f68 Rafał Miłecki    2024-01-08   22  			device_type = "cpu";
6c1d134a103f68 Rafał Miłecki    2024-01-08   23  			enable-method = "psci";
343855d29b5c76 Frank Wunderlich 2024-12-17   24  			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
343855d29b5c76 Frank Wunderlich 2024-12-17   25  				 <&topckgen CLK_TOP_XTAL>;
343855d29b5c76 Frank Wunderlich 2024-12-17   26  			clock-names = "cpu", "intermediate";
343855d29b5c76 Frank Wunderlich 2024-12-17   27  			operating-points-v2 = <&cluster0_opp>;
6c1d134a103f68 Rafał Miłecki    2024-01-08   28  		};
6c1d134a103f68 Rafał Miłecki    2024-01-08   29  
607cc6e9b5f10f Frank Wunderlich 2024-12-20   30  		cpu1: cpu@1 {
6c1d134a103f68 Rafał Miłecki    2024-01-08   31  			compatible = "arm,cortex-a73";
6c1d134a103f68 Rafał Miłecki    2024-01-08   32  			reg = <0x1>;
6c1d134a103f68 Rafał Miłecki    2024-01-08   33  			device_type = "cpu";
6c1d134a103f68 Rafał Miłecki    2024-01-08   34  			enable-method = "psci";
343855d29b5c76 Frank Wunderlich 2024-12-17   35  			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
343855d29b5c76 Frank Wunderlich 2024-12-17   36  				 <&topckgen CLK_TOP_XTAL>;
343855d29b5c76 Frank Wunderlich 2024-12-17   37  			clock-names = "cpu", "intermediate";
343855d29b5c76 Frank Wunderlich 2024-12-17   38  			operating-points-v2 = <&cluster0_opp>;
6c1d134a103f68 Rafał Miłecki    2024-01-08   39  		};
6c1d134a103f68 Rafał Miłecki    2024-01-08   40  
607cc6e9b5f10f Frank Wunderlich 2024-12-20   41  		cpu2: cpu@2 {
6c1d134a103f68 Rafał Miłecki    2024-01-08   42  			compatible = "arm,cortex-a73";
6c1d134a103f68 Rafał Miłecki    2024-01-08   43  			reg = <0x2>;
6c1d134a103f68 Rafał Miłecki    2024-01-08   44  			device_type = "cpu";
6c1d134a103f68 Rafał Miłecki    2024-01-08   45  			enable-method = "psci";
343855d29b5c76 Frank Wunderlich 2024-12-17   46  			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
343855d29b5c76 Frank Wunderlich 2024-12-17   47  				 <&topckgen CLK_TOP_XTAL>;
343855d29b5c76 Frank Wunderlich 2024-12-17   48  			clock-names = "cpu", "intermediate";
343855d29b5c76 Frank Wunderlich 2024-12-17   49  			operating-points-v2 = <&cluster0_opp>;
6c1d134a103f68 Rafał Miłecki    2024-01-08   50  		};
6c1d134a103f68 Rafał Miłecki    2024-01-08   51  
607cc6e9b5f10f Frank Wunderlich 2024-12-20   52  		cpu3: cpu@3 {
6c1d134a103f68 Rafał Miłecki    2024-01-08   53  			compatible = "arm,cortex-a73";
6c1d134a103f68 Rafał Miłecki    2024-01-08   54  			reg = <0x3>;
6c1d134a103f68 Rafał Miłecki    2024-01-08   55  			device_type = "cpu";
6c1d134a103f68 Rafał Miłecki    2024-01-08   56  			enable-method = "psci";
343855d29b5c76 Frank Wunderlich 2024-12-17   57  			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
343855d29b5c76 Frank Wunderlich 2024-12-17   58  				 <&topckgen CLK_TOP_XTAL>;
343855d29b5c76 Frank Wunderlich 2024-12-17   59  			clock-names = "cpu", "intermediate";
343855d29b5c76 Frank Wunderlich 2024-12-17   60  			operating-points-v2 = <&cluster0_opp>;
343855d29b5c76 Frank Wunderlich 2024-12-17   61  		};
343855d29b5c76 Frank Wunderlich 2024-12-17   62  
343855d29b5c76 Frank Wunderlich 2024-12-17   63  		cluster0_opp: opp-table-0 {
343855d29b5c76 Frank Wunderlich 2024-12-17   64  			compatible = "operating-points-v2";
343855d29b5c76 Frank Wunderlich 2024-12-17   65  			opp-shared;
343855d29b5c76 Frank Wunderlich 2024-12-17   66  
343855d29b5c76 Frank Wunderlich 2024-12-17   67  			opp-800000000 {
343855d29b5c76 Frank Wunderlich 2024-12-17   68  				opp-hz = /bits/ 64 <800000000>;
343855d29b5c76 Frank Wunderlich 2024-12-17   69  				opp-microvolt = <850000>;
343855d29b5c76 Frank Wunderlich 2024-12-17   70  			};
343855d29b5c76 Frank Wunderlich 2024-12-17   71  			opp-1100000000 {
343855d29b5c76 Frank Wunderlich 2024-12-17   72  				opp-hz = /bits/ 64 <1100000000>;
343855d29b5c76 Frank Wunderlich 2024-12-17   73  				opp-microvolt = <850000>;
343855d29b5c76 Frank Wunderlich 2024-12-17   74  			};
343855d29b5c76 Frank Wunderlich 2024-12-17   75  			opp-1500000000 {
343855d29b5c76 Frank Wunderlich 2024-12-17   76  				opp-hz = /bits/ 64 <1500000000>;
343855d29b5c76 Frank Wunderlich 2024-12-17   77  				opp-microvolt = <850000>;
343855d29b5c76 Frank Wunderlich 2024-12-17   78  			};
343855d29b5c76 Frank Wunderlich 2024-12-17   79  			opp-1800000000 {
343855d29b5c76 Frank Wunderlich 2024-12-17   80  				opp-hz = /bits/ 64 <1800000000>;
343855d29b5c76 Frank Wunderlich 2024-12-17   81  				opp-microvolt = <900000>;
343855d29b5c76 Frank Wunderlich 2024-12-17   82  			};
6c1d134a103f68 Rafał Miłecki    2024-01-08   83  		};
6c1d134a103f68 Rafał Miłecki    2024-01-08   84  	};
6c1d134a103f68 Rafał Miłecki    2024-01-08   85  
6c1d134a103f68 Rafał Miłecki    2024-01-08   86  	oscillator-40m {
6c1d134a103f68 Rafał Miłecki    2024-01-08   87  		compatible = "fixed-clock";
6c1d134a103f68 Rafał Miłecki    2024-01-08   88  		clock-frequency = <40000000>;
6c1d134a103f68 Rafał Miłecki    2024-01-08   89  		#clock-cells = <0>;
6c1d134a103f68 Rafał Miłecki    2024-01-08   90  		clock-output-names = "clkxtal";
6c1d134a103f68 Rafał Miłecki    2024-01-08   91  	};
6c1d134a103f68 Rafał Miłecki    2024-01-08   92  
6c1d134a103f68 Rafał Miłecki    2024-01-08   93  	pmu {
6c1d134a103f68 Rafał Miłecki    2024-01-08   94  		compatible = "arm,cortex-a73-pmu";
6c1d134a103f68 Rafał Miłecki    2024-01-08   95  		interrupt-parent = <&gic>;
6c1d134a103f68 Rafał Miłecki    2024-01-08   96  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
6c1d134a103f68 Rafał Miłecki    2024-01-08   97  	};
6c1d134a103f68 Rafał Miłecki    2024-01-08   98  
6c1d134a103f68 Rafał Miłecki    2024-01-08   99  	psci {
6c1d134a103f68 Rafał Miłecki    2024-01-08  100  		compatible = "arm,psci-0.2";
6c1d134a103f68 Rafał Miłecki    2024-01-08  101  		method = "smc";
6c1d134a103f68 Rafał Miłecki    2024-01-08  102  	};
6c1d134a103f68 Rafał Miłecki    2024-01-08  103  
69b2d44b91504d Frank Wunderlich 2024-12-17  104  	reserved-memory {
69b2d44b91504d Frank Wunderlich 2024-12-17  105  		#address-cells = <2>;
69b2d44b91504d Frank Wunderlich 2024-12-17  106  		#size-cells = <2>;
69b2d44b91504d Frank Wunderlich 2024-12-17  107  		ranges;
69b2d44b91504d Frank Wunderlich 2024-12-17  108  
69b2d44b91504d Frank Wunderlich 2024-12-17  109  		/* 320 KiB reserved for ARM Trusted Firmware (BL31 and BL32) */
69b2d44b91504d Frank Wunderlich 2024-12-17  110  		secmon@43000000 {
69b2d44b91504d Frank Wunderlich 2024-12-17  111  			reg = <0 0x43000000 0 0x50000>;
69b2d44b91504d Frank Wunderlich 2024-12-17  112  			no-map;
69b2d44b91504d Frank Wunderlich 2024-12-17  113  		};
69b2d44b91504d Frank Wunderlich 2024-12-17  114  	};
69b2d44b91504d Frank Wunderlich 2024-12-17  115  
6c1d134a103f68 Rafał Miłecki    2024-01-08  116  	soc {
6c1d134a103f68 Rafał Miłecki    2024-01-08  117  		compatible = "simple-bus";
6c1d134a103f68 Rafał Miłecki    2024-01-08  118  		ranges;
6c1d134a103f68 Rafał Miłecki    2024-01-08  119  		#address-cells = <2>;
6c1d134a103f68 Rafał Miłecki    2024-01-08  120  		#size-cells = <2>;
6c1d134a103f68 Rafał Miłecki    2024-01-08  121  
6c1d134a103f68 Rafał Miłecki    2024-01-08  122  		gic: interrupt-controller@c000000 {
6c1d134a103f68 Rafał Miłecki    2024-01-08  123  			compatible = "arm,gic-v3";
6c1d134a103f68 Rafał Miłecki    2024-01-08  124  			reg = <0 0x0c000000 0 0x40000>,  /* GICD */
6c1d134a103f68 Rafał Miłecki    2024-01-08  125  			      <0 0x0c080000 0 0x200000>, /* GICR */
6c1d134a103f68 Rafał Miłecki    2024-01-08  126  			      <0 0x0c400000 0 0x2000>,   /* GICC */
6c1d134a103f68 Rafał Miłecki    2024-01-08  127  			      <0 0x0c410000 0 0x1000>,   /* GICH */
6c1d134a103f68 Rafał Miłecki    2024-01-08  128  			      <0 0x0c420000 0 0x2000>;   /* GICV */
6c1d134a103f68 Rafał Miłecki    2024-01-08  129  			interrupt-parent = <&gic>;
6c1d134a103f68 Rafał Miłecki    2024-01-08  130  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
6c1d134a103f68 Rafał Miłecki    2024-01-08  131  			interrupt-controller;
6c1d134a103f68 Rafał Miłecki    2024-01-08  132  			#interrupt-cells = <3>;
6c1d134a103f68 Rafał Miłecki    2024-01-08  133  		};
6c1d134a103f68 Rafał Miłecki    2024-01-08  134  
09346afaba0a89 Rafał Miłecki    2024-02-13  135  		infracfg: clock-controller@10001000 {
b616b403cbffc6 Rafał Miłecki    2024-01-08  136  			compatible = "mediatek,mt7988-infracfg", "syscon";
b616b403cbffc6 Rafał Miłecki    2024-01-08  137  			reg = <0 0x10001000 0 0x1000>;
b616b403cbffc6 Rafał Miłecki    2024-01-08  138  			#clock-cells = <1>;
6a47514804e0e9 Frank Wunderlich 2024-12-17  139  			#reset-cells = <1>;
b616b403cbffc6 Rafał Miłecki    2024-01-08  140  		};
b616b403cbffc6 Rafał Miłecki    2024-01-08  141  
21e28a0722e4b0 Rafał Miłecki    2024-06-05  142  		topckgen: clock-controller@1001b000 {
b616b403cbffc6 Rafał Miłecki    2024-01-08  143  			compatible = "mediatek,mt7988-topckgen", "syscon";
b616b403cbffc6 Rafał Miłecki    2024-01-08  144  			reg = <0 0x1001b000 0 0x1000>;
b616b403cbffc6 Rafał Miłecki    2024-01-08  145  			#clock-cells = <1>;
b616b403cbffc6 Rafał Miłecki    2024-01-08  146  		};
b616b403cbffc6 Rafał Miłecki    2024-01-08  147  
b616b403cbffc6 Rafał Miłecki    2024-01-08  148  		watchdog: watchdog@1001c000 {
6c1d134a103f68 Rafał Miłecki    2024-01-08  149  			compatible = "mediatek,mt7988-wdt";
6c1d134a103f68 Rafał Miłecki    2024-01-08  150  			reg = <0 0x1001c000 0 0x1000>;
6c1d134a103f68 Rafał Miłecki    2024-01-08  151  			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
6c1d134a103f68 Rafał Miłecki    2024-01-08  152  			#reset-cells = <1>;
6c1d134a103f68 Rafał Miłecki    2024-01-08  153  		};
b616b403cbffc6 Rafał Miłecki    2024-01-08  154  
206994e3b636ae Frank Wunderlich 2024-12-17  155  		apmixedsys: clock-controller@1001e000 {
b616b403cbffc6 Rafał Miłecki    2024-01-08  156  			compatible = "mediatek,mt7988-apmixedsys";
b616b403cbffc6 Rafał Miłecki    2024-01-08  157  			reg = <0 0x1001e000 0 0x1000>;
b616b403cbffc6 Rafał Miłecki    2024-01-08  158  			#clock-cells = <1>;
b616b403cbffc6 Rafał Miłecki    2024-01-08  159  		};
b616b403cbffc6 Rafał Miłecki    2024-01-08  160  
7d887c0c9f8931 Frank Wunderlich 2024-12-17  161  		pio: pinctrl@1001f000 {
7d887c0c9f8931 Frank Wunderlich 2024-12-17  162  			compatible = "mediatek,mt7988-pinctrl";
7d887c0c9f8931 Frank Wunderlich 2024-12-17  163  			reg = <0 0x1001f000 0 0x1000>,
7d887c0c9f8931 Frank Wunderlich 2024-12-17  164  			      <0 0x11c10000 0 0x1000>,
7d887c0c9f8931 Frank Wunderlich 2024-12-17  165  			      <0 0x11d00000 0 0x1000>,
7d887c0c9f8931 Frank Wunderlich 2024-12-17  166  			      <0 0x11d20000 0 0x1000>,
7d887c0c9f8931 Frank Wunderlich 2024-12-17  167  			      <0 0x11e00000 0 0x1000>,
7d887c0c9f8931 Frank Wunderlich 2024-12-17  168  			      <0 0x11f00000 0 0x1000>,
7d887c0c9f8931 Frank Wunderlich 2024-12-17  169  			      <0 0x1000b000 0 0x1000>;
7d887c0c9f8931 Frank Wunderlich 2024-12-17  170  			reg-names = "gpio", "iocfg_tr",
7d887c0c9f8931 Frank Wunderlich 2024-12-17  171  				    "iocfg_br", "iocfg_rb",
7d887c0c9f8931 Frank Wunderlich 2024-12-17  172  				    "iocfg_lb", "iocfg_tl", "eint";
7d887c0c9f8931 Frank Wunderlich 2024-12-17  173  			gpio-controller;
7d887c0c9f8931 Frank Wunderlich 2024-12-17  174  			#gpio-cells = <2>;
7d887c0c9f8931 Frank Wunderlich 2024-12-17  175  			gpio-ranges = <&pio 0 0 84>;
7d887c0c9f8931 Frank Wunderlich 2024-12-17  176  			interrupt-controller;
7d887c0c9f8931 Frank Wunderlich 2024-12-17  177  			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
7d887c0c9f8931 Frank Wunderlich 2024-12-17  178  			interrupt-parent = <&gic>;
7d887c0c9f8931 Frank Wunderlich 2024-12-17  179  			#interrupt-cells = <2>;
7d887c0c9f8931 Frank Wunderlich 2024-12-17  180  
7d887c0c9f8931 Frank Wunderlich 2024-12-17  181  			pcie0_pins: pcie0-pins {
7d887c0c9f8931 Frank Wunderlich 2024-12-17  182  				mux {
7d887c0c9f8931 Frank Wunderlich 2024-12-17  183  					function = "pcie";
7d887c0c9f8931 Frank Wunderlich 2024-12-17  184  					groups = "pcie_2l_0_pereset", "pcie_clk_req_n0_0",
7d887c0c9f8931 Frank Wunderlich 2024-12-17  185  						 "pcie_wake_n0_0";
7d887c0c9f8931 Frank Wunderlich 2024-12-17  186  				};
7d887c0c9f8931 Frank Wunderlich 2024-12-17  187  			};
7d887c0c9f8931 Frank Wunderlich 2024-12-17  188  
7d887c0c9f8931 Frank Wunderlich 2024-12-17  189  			pcie1_pins: pcie1-pins {
7d887c0c9f8931 Frank Wunderlich 2024-12-17  190  				mux {
7d887c0c9f8931 Frank Wunderlich 2024-12-17  191  					function = "pcie";
7d887c0c9f8931 Frank Wunderlich 2024-12-17  192  					groups = "pcie_2l_1_pereset", "pcie_clk_req_n1",
7d887c0c9f8931 Frank Wunderlich 2024-12-17  193  						 "pcie_wake_n1_0";
7d887c0c9f8931 Frank Wunderlich 2024-12-17  194  				};
7d887c0c9f8931 Frank Wunderlich 2024-12-17  195  			};
7d887c0c9f8931 Frank Wunderlich 2024-12-17  196  
7d887c0c9f8931 Frank Wunderlich 2024-12-17  197  			pcie2_pins: pcie2-pins {
7d887c0c9f8931 Frank Wunderlich 2024-12-17  198  				mux {
7d887c0c9f8931 Frank Wunderlich 2024-12-17  199  					function = "pcie";
7d887c0c9f8931 Frank Wunderlich 2024-12-17  200  					groups = "pcie_1l_0_pereset", "pcie_clk_req_n2_0",
7d887c0c9f8931 Frank Wunderlich 2024-12-17  201  						 "pcie_wake_n2_0";
7d887c0c9f8931 Frank Wunderlich 2024-12-17  202  				};
7d887c0c9f8931 Frank Wunderlich 2024-12-17  203  			};
7d887c0c9f8931 Frank Wunderlich 2024-12-17  204  
7d887c0c9f8931 Frank Wunderlich 2024-12-17  205  			pcie3_pins: pcie3-pins {
7d887c0c9f8931 Frank Wunderlich 2024-12-17  206  				mux {
7d887c0c9f8931 Frank Wunderlich 2024-12-17  207  					function = "pcie";
7d887c0c9f8931 Frank Wunderlich 2024-12-17  208  					groups = "pcie_1l_1_pereset", "pcie_clk_req_n3",
7d887c0c9f8931 Frank Wunderlich 2024-12-17  209  						 "pcie_wake_n3_0";
7d887c0c9f8931 Frank Wunderlich 2024-12-17  210  				};
7d887c0c9f8931 Frank Wunderlich 2024-12-17  211  			};
7d887c0c9f8931 Frank Wunderlich 2024-12-17  212  		};
7d887c0c9f8931 Frank Wunderlich 2024-12-17  213  
6c7ab311939c11 Frank Wunderlich 2024-12-17  214  		pwm: pwm@10048000 {
09ff2216a03570 Rafał Miłecki    2024-06-04  215  			compatible = "mediatek,mt7988-pwm";
09ff2216a03570 Rafał Miłecki    2024-06-04  216  			reg = <0 0x10048000 0 0x1000>;
09ff2216a03570 Rafał Miłecki    2024-06-04  217  			clocks = <&infracfg CLK_INFRA_66M_PWM_BCK>,
09ff2216a03570 Rafał Miłecki    2024-06-04  218  				 <&infracfg CLK_INFRA_66M_PWM_HCK>,
09ff2216a03570 Rafał Miłecki    2024-06-04  219  				 <&infracfg CLK_INFRA_66M_PWM_CK1>,
09ff2216a03570 Rafał Miłecki    2024-06-04  220  				 <&infracfg CLK_INFRA_66M_PWM_CK2>,
09ff2216a03570 Rafał Miłecki    2024-06-04  221  				 <&infracfg CLK_INFRA_66M_PWM_CK3>,
09ff2216a03570 Rafał Miłecki    2024-06-04  222  				 <&infracfg CLK_INFRA_66M_PWM_CK4>,
09ff2216a03570 Rafał Miłecki    2024-06-04  223  				 <&infracfg CLK_INFRA_66M_PWM_CK5>,
09ff2216a03570 Rafał Miłecki    2024-06-04  224  				 <&infracfg CLK_INFRA_66M_PWM_CK6>,
09ff2216a03570 Rafał Miłecki    2024-06-04  225  				 <&infracfg CLK_INFRA_66M_PWM_CK7>,
09ff2216a03570 Rafał Miłecki    2024-06-04  226  				 <&infracfg CLK_INFRA_66M_PWM_CK8>;
09ff2216a03570 Rafał Miłecki    2024-06-04  227  			clock-names = "top", "main", "pwm1", "pwm2", "pwm3",
09ff2216a03570 Rafał Miłecki    2024-06-04  228  				      "pwm4", "pwm5", "pwm6", "pwm7", "pwm8";
09ff2216a03570 Rafał Miłecki    2024-06-04  229  			#pwm-cells = <2>;
09ff2216a03570 Rafał Miłecki    2024-06-04  230  			status = "disabled";
09ff2216a03570 Rafał Miłecki    2024-06-04  231  		};
09ff2216a03570 Rafał Miłecki    2024-06-04  232  
b87cf19876c85e Frank Wunderlich 2024-12-17  233  		mcusys: mcusys@100e0000 {
b87cf19876c85e Frank Wunderlich 2024-12-17  234  			compatible = "mediatek,mt7988-mcusys", "syscon";
b87cf19876c85e Frank Wunderlich 2024-12-17  235  			reg = <0 0x100e0000 0 0x1000>;
b87cf19876c85e Frank Wunderlich 2024-12-17  236  			#clock-cells = <1>;
b87cf19876c85e Frank Wunderlich 2024-12-17  237  		};
b87cf19876c85e Frank Wunderlich 2024-12-17  238  
54df2f1e0ad1ae Frank Wunderlich 2024-12-17  239  		serial0: serial@11000000 {
21e28a0722e4b0 Rafał Miłecki    2024-06-05  240  			compatible = "mediatek,mt7988-uart", "mediatek,mt6577-uart";
21e28a0722e4b0 Rafał Miłecki    2024-06-05  241  			reg = <0 0x11000000 0 0x100>;
21e28a0722e4b0 Rafał Miłecki    2024-06-05  242  			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
21e28a0722e4b0 Rafał Miłecki    2024-06-05  243  			interrupt-names = "uart", "wakeup";
21e28a0722e4b0 Rafał Miłecki    2024-06-05  244  			clocks = <&topckgen CLK_TOP_UART_SEL>,
21e28a0722e4b0 Rafał Miłecki    2024-06-05  245  				 <&infracfg CLK_INFRA_52M_UART0_CK>;
21e28a0722e4b0 Rafał Miłecki    2024-06-05  246  			clock-names = "baud", "bus";
21e28a0722e4b0 Rafał Miłecki    2024-06-05  247  			status = "disabled";
21e28a0722e4b0 Rafał Miłecki    2024-06-05  248  		};
21e28a0722e4b0 Rafał Miłecki    2024-06-05  249  
21e28a0722e4b0 Rafał Miłecki    2024-06-05  250  		serial@11000100 {
21e28a0722e4b0 Rafał Miłecki    2024-06-05  251  			compatible = "mediatek,mt7988-uart", "mediatek,mt6577-uart";
21e28a0722e4b0 Rafał Miłecki    2024-06-05  252  			reg = <0 0x11000100 0 0x100>;
21e28a0722e4b0 Rafał Miłecki    2024-06-05  253  			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
21e28a0722e4b0 Rafał Miłecki    2024-06-05  254  			interrupt-names = "uart", "wakeup";
21e28a0722e4b0 Rafał Miłecki    2024-06-05  255  			clocks = <&topckgen CLK_TOP_UART_SEL>,
21e28a0722e4b0 Rafał Miłecki    2024-06-05  256  				 <&infracfg CLK_INFRA_52M_UART1_CK>;
21e28a0722e4b0 Rafał Miłecki    2024-06-05  257  			clock-names = "baud", "bus";
21e28a0722e4b0 Rafał Miłecki    2024-06-05  258  			status = "disabled";
21e28a0722e4b0 Rafał Miłecki    2024-06-05  259  		};
21e28a0722e4b0 Rafał Miłecki    2024-06-05  260  
21e28a0722e4b0 Rafał Miłecki    2024-06-05  261  		serial@11000200 {
21e28a0722e4b0 Rafał Miłecki    2024-06-05  262  			compatible = "mediatek,mt7988-uart", "mediatek,mt6577-uart";
21e28a0722e4b0 Rafał Miłecki    2024-06-05  263  			reg = <0 0x11000200 0 0x100>;
21e28a0722e4b0 Rafał Miłecki    2024-06-05  264  			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
21e28a0722e4b0 Rafał Miłecki    2024-06-05  265  			interrupt-names = "uart", "wakeup";
21e28a0722e4b0 Rafał Miłecki    2024-06-05  266  			clocks = <&topckgen CLK_TOP_UART_SEL>,
21e28a0722e4b0 Rafał Miłecki    2024-06-05  267  				 <&infracfg CLK_INFRA_52M_UART2_CK>;
21e28a0722e4b0 Rafał Miłecki    2024-06-05  268  			clock-names = "baud", "bus";
21e28a0722e4b0 Rafał Miłecki    2024-06-05  269  			status = "disabled";
21e28a0722e4b0 Rafał Miłecki    2024-06-05  270  		};
21e28a0722e4b0 Rafał Miłecki    2024-06-05  271  
faf97571ae83a8 Frank Wunderlich 2024-12-17  272  		i2c0: i2c@11003000 {
660c230bf30280 Rafał Miłecki    2024-06-04  273  			compatible = "mediatek,mt7981-i2c";
660c230bf30280 Rafał Miłecki    2024-06-04  274  			reg = <0 0x11003000 0 0x1000>,
660c230bf30280 Rafał Miłecki    2024-06-04  275  			      <0 0x10217080 0 0x80>;
660c230bf30280 Rafał Miłecki    2024-06-04  276  			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
e14b49db0087aa Frank Wunderlich 2024-12-17  277  			clock-div = <1>;
660c230bf30280 Rafał Miłecki    2024-06-04  278  			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
660c230bf30280 Rafał Miłecki    2024-06-04  279  				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
660c230bf30280 Rafał Miłecki    2024-06-04  280  			clock-names = "main", "dma";
660c230bf30280 Rafał Miłecki    2024-06-04  281  			#address-cells = <1>;
660c230bf30280 Rafał Miłecki    2024-06-04  282  			#size-cells = <0>;
660c230bf30280 Rafał Miłecki    2024-06-04  283  			status = "disabled";
660c230bf30280 Rafał Miłecki    2024-06-04  284  		};
660c230bf30280 Rafał Miłecki    2024-06-04  285  
faf97571ae83a8 Frank Wunderlich 2024-12-17  286  		i2c1: i2c@11004000 {
660c230bf30280 Rafał Miłecki    2024-06-04  287  			compatible = "mediatek,mt7981-i2c";
660c230bf30280 Rafał Miłecki    2024-06-04  288  			reg = <0 0x11004000 0 0x1000>,
660c230bf30280 Rafał Miłecki    2024-06-04  289  			      <0 0x10217100 0 0x80>;
660c230bf30280 Rafał Miłecki    2024-06-04  290  			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
e14b49db0087aa Frank Wunderlich 2024-12-17  291  			clock-div = <1>;
660c230bf30280 Rafał Miłecki    2024-06-04  292  			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
660c230bf30280 Rafał Miłecki    2024-06-04  293  				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
660c230bf30280 Rafał Miłecki    2024-06-04  294  			clock-names = "main", "dma";
660c230bf30280 Rafał Miłecki    2024-06-04  295  			#address-cells = <1>;
660c230bf30280 Rafał Miłecki    2024-06-04  296  			#size-cells = <0>;
660c230bf30280 Rafał Miłecki    2024-06-04  297  			status = "disabled";
660c230bf30280 Rafał Miłecki    2024-06-04  298  		};
660c230bf30280 Rafał Miłecki    2024-06-04  299  
faf97571ae83a8 Frank Wunderlich 2024-12-17  300  		i2c2: i2c@11005000 {
660c230bf30280 Rafał Miłecki    2024-06-04  301  			compatible = "mediatek,mt7981-i2c";
660c230bf30280 Rafał Miłecki    2024-06-04  302  			reg = <0 0x11005000 0 0x1000>,
660c230bf30280 Rafał Miłecki    2024-06-04  303  			      <0 0x10217180 0 0x80>;
660c230bf30280 Rafał Miłecki    2024-06-04  304  			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
e14b49db0087aa Frank Wunderlich 2024-12-17  305  			clock-div = <1>;
660c230bf30280 Rafał Miłecki    2024-06-04  306  			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
660c230bf30280 Rafał Miłecki    2024-06-04  307  				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
660c230bf30280 Rafał Miłecki    2024-06-04  308  			clock-names = "main", "dma";
660c230bf30280 Rafał Miłecki    2024-06-04  309  			#address-cells = <1>;
660c230bf30280 Rafał Miłecki    2024-06-04  310  			#size-cells = <0>;
660c230bf30280 Rafał Miłecki    2024-06-04  311  			status = "disabled";
660c230bf30280 Rafał Miłecki    2024-06-04  312  		};
660c230bf30280 Rafał Miłecki    2024-06-04  313  
6a47514804e0e9 Frank Wunderlich 2024-12-17  314  		lvts: lvts@1100a000 {
6a47514804e0e9 Frank Wunderlich 2024-12-17  315  			compatible = "mediatek,mt7988-lvts-ap";
6a47514804e0e9 Frank Wunderlich 2024-12-17  316  			#thermal-sensor-cells = <1>;
6a47514804e0e9 Frank Wunderlich 2024-12-17  317  			reg = <0 0x1100a000 0 0x1000>;
6a47514804e0e9 Frank Wunderlich 2024-12-17  318  			clocks = <&infracfg CLK_INFRA_26M_THERM_SYSTEM>;
6a47514804e0e9 Frank Wunderlich 2024-12-17  319  			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
6a47514804e0e9 Frank Wunderlich 2024-12-17  320  			resets = <&infracfg MT7988_INFRA_RST1_THERM_CTRL_SWRST>;
6a47514804e0e9 Frank Wunderlich 2024-12-17  321  			nvmem-cells = <&lvts_calibration>;
6a47514804e0e9 Frank Wunderlich 2024-12-17  322  			nvmem-cell-names = "lvts-calib-data-1";
6a47514804e0e9 Frank Wunderlich 2024-12-17  323  		};
6a47514804e0e9 Frank Wunderlich 2024-12-17  324  
be9b06b9e424b3 Sky Huang        2025-02-19 @325  		phyfw: phy-firmware@f000000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
