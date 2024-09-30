Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1001922F5
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Sep 2024 14:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727708363; cv=none; b=fOcOPUhjzSZjHjAoRHjREAzq6KYq4l68I2NnHXjjRPxgCsx+MoRQbwMZYpyV0b3nCG2vQMti7cTy4LRZTXNES6qIq0vLPz76fjFqWgxmbEK0/fDmL781nicCwmOjYrJZVJv8EZ3JKLS+YuZwaV11gq30NpbL4jrFFejYoIKdmXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727708363; c=relaxed/simple;
	bh=CYLM04A8TuqcXIspgxu5DFHcBg7RDJe0g+eulMftvWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kaaMP93JNp4VhJfsWHRqflGczxTbmFjrXaL/LQlaDRMr8IXHF78T1sjWUEbsDVwiK7100yOGWHCj8BsJl5i5Cv8349fRiMhPnhngaVHeCApAteKcmwyhSQJvSkhNrpotr3ILU6CyyZapyU2POTyiyPhX8wXvyBfHlcPQ0g1ucpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BdGMJWas; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BdGMJWas"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727708361; x=1759244361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CYLM04A8TuqcXIspgxu5DFHcBg7RDJe0g+eulMftvWg=;
  b=BdGMJWasR4u6m7ijq28AneSRmnKi6KLLniL91CEwZ82Z4pey6ZdEDuEv
   B7cKZ9rdpnANP1hczVUtuF2aubYxGQlqeRoiNCk/Z30OWHIOmsIiiH2rc
   lV0cZ6kAlyY2G+XcaocywtDRvknF7NjVWX/7pE6OVEluqZGNMIdhHNTfq
   9nH5L94aop+2Gw5mHWqEQvF4ajOsHQUExAAbAgLlq+225csBsBSfwaIg/
   Cq1WWFPAX142oyIX2ybReyqOJQXrcWOk/dkpIbEfGsN3t1AFQFZo3qadL
   kOxizfWwECIgo1b6if4rbi4LTl+pGWKU/QMuOGeH0RkQZPCvTOD1GvqQF
   A==;
X-CSE-ConnectionGUID: 9M2rg5alTzmjvnhnF0e92A==
X-CSE-MsgGUID: f52Tv/oPRlKVpF/wyfXTxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26932480"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="26932480"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 07:59:19 -0700
X-CSE-ConnectionGUID: FcsAwXGPS1mKoOgUfVxMPg==
X-CSE-MsgGUID: TD96znOkQSKnRL+kFysAJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="73386342"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Sep 2024 07:59:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svHrm-000PYn-2A;
	Mon, 30 Sep 2024 14:59:14 +0000
Date: Mon, 30 Sep 2024 22:58:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 6/6] arm64: dts: allwinner: h616: Add audio codec node
Message-ID: <202409302141.P2PkfbCo-lkp@intel.com>
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
In-Reply-To: <20240929100750.860329-7-ryan@testtoast.com>
References: <20240929100750.860329-7-ryan@testtoast.com>
TO: Ryan Walklin <ryan@testtoast.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Jaroslav Kysela <perex@perex.cz>
TO: Takashi Iwai <tiwai@suse.com>
TO: "Chen-Yu Tsai" <wens@csie.org>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Samuel Holland <samuel@sholland.org>
CC: linux-sound@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-sunxi@lists.linux.dev
CC: devicetree@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: Ryan Walklin <ryan@testtoast.com>

Hi Ryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sunxi/sunxi/for-next]
[also build test WARNING on broonie-sound/for-next arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next shawnguo/for-next soc/for-next linus/master v6.12-rc1 next-20240930]
[cannot apply to arm/for-next arm/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Walklin/ASoC-sun4i-codec-Add-support-for-different-DAC-FIFOC-addresses-to-quirks/20240929-181020
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20240929100750.860329-7-ryan%40testtoast.com
patch subject: [PATCH 6/6] arm64: dts: allwinner: h616: Add audio codec node
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-002-20240930 (https://download.01.org/0day-ci/archive/20240930/202409302141.P2PkfbCo-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409302141.P2PkfbCo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409302141.P2PkfbCo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-953.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:648.25-661.5: Warning (simple_bus_reg): /soc/codec@05096000: simple-bus unit address format error, expected "5096000"

vim +/5096000 +648 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi

0d17c8651188816 Andre Przywara 2022-07-08   13  
0d17c8651188816 Andre Przywara 2022-07-08   14  / {
0d17c8651188816 Andre Przywara 2022-07-08   15  	interrupt-parent = <&gic>;
0d17c8651188816 Andre Przywara 2022-07-08   16  	#address-cells = <2>;
0d17c8651188816 Andre Przywara 2022-07-08   17  	#size-cells = <2>;
0d17c8651188816 Andre Przywara 2022-07-08   18  
0d17c8651188816 Andre Przywara 2022-07-08   19  	cpus {
0d17c8651188816 Andre Przywara 2022-07-08   20  		#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08   21  		#size-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08   22  
0d17c8651188816 Andre Przywara 2022-07-08   23  		cpu0: cpu@0 {
0d17c8651188816 Andre Przywara 2022-07-08   24  			compatible = "arm,cortex-a53";
0d17c8651188816 Andre Przywara 2022-07-08   25  			device_type = "cpu";
0d17c8651188816 Andre Przywara 2022-07-08   26  			reg = <0>;
0d17c8651188816 Andre Przywara 2022-07-08   27  			enable-method = "psci";
0d17c8651188816 Andre Przywara 2022-07-08   28  			clocks = <&ccu CLK_CPUX>;
3e057e05b3b281b Martin Botka   2024-04-18   29  			#cooling-cells = <2>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   30  			i-cache-size = <0x8000>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   31  			i-cache-line-size = <64>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   32  			i-cache-sets = <256>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   33  			d-cache-size = <0x8000>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   34  			d-cache-line-size = <64>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   35  			d-cache-sets = <128>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   36  			next-level-cache = <&l2_cache>;
0d17c8651188816 Andre Przywara 2022-07-08   37  		};
0d17c8651188816 Andre Przywara 2022-07-08   38  
0d17c8651188816 Andre Przywara 2022-07-08   39  		cpu1: cpu@1 {
0d17c8651188816 Andre Przywara 2022-07-08   40  			compatible = "arm,cortex-a53";
0d17c8651188816 Andre Przywara 2022-07-08   41  			device_type = "cpu";
0d17c8651188816 Andre Przywara 2022-07-08   42  			reg = <1>;
0d17c8651188816 Andre Przywara 2022-07-08   43  			enable-method = "psci";
0d17c8651188816 Andre Przywara 2022-07-08   44  			clocks = <&ccu CLK_CPUX>;
3e057e05b3b281b Martin Botka   2024-04-18   45  			#cooling-cells = <2>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   46  			i-cache-size = <0x8000>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   47  			i-cache-line-size = <64>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   48  			i-cache-sets = <256>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   49  			d-cache-size = <0x8000>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   50  			d-cache-line-size = <64>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   51  			d-cache-sets = <128>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   52  			next-level-cache = <&l2_cache>;
0d17c8651188816 Andre Przywara 2022-07-08   53  		};
0d17c8651188816 Andre Przywara 2022-07-08   54  
0d17c8651188816 Andre Przywara 2022-07-08   55  		cpu2: cpu@2 {
0d17c8651188816 Andre Przywara 2022-07-08   56  			compatible = "arm,cortex-a53";
0d17c8651188816 Andre Przywara 2022-07-08   57  			device_type = "cpu";
0d17c8651188816 Andre Przywara 2022-07-08   58  			reg = <2>;
0d17c8651188816 Andre Przywara 2022-07-08   59  			enable-method = "psci";
0d17c8651188816 Andre Przywara 2022-07-08   60  			clocks = <&ccu CLK_CPUX>;
3e057e05b3b281b Martin Botka   2024-04-18   61  			#cooling-cells = <2>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   62  			i-cache-size = <0x8000>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   63  			i-cache-line-size = <64>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   64  			i-cache-sets = <256>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   65  			d-cache-size = <0x8000>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   66  			d-cache-line-size = <64>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   67  			d-cache-sets = <128>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   68  			next-level-cache = <&l2_cache>;
0d17c8651188816 Andre Przywara 2022-07-08   69  		};
0d17c8651188816 Andre Przywara 2022-07-08   70  
0d17c8651188816 Andre Przywara 2022-07-08   71  		cpu3: cpu@3 {
0d17c8651188816 Andre Przywara 2022-07-08   72  			compatible = "arm,cortex-a53";
0d17c8651188816 Andre Przywara 2022-07-08   73  			device_type = "cpu";
0d17c8651188816 Andre Przywara 2022-07-08   74  			reg = <3>;
0d17c8651188816 Andre Przywara 2022-07-08   75  			enable-method = "psci";
0d17c8651188816 Andre Przywara 2022-07-08   76  			clocks = <&ccu CLK_CPUX>;
3e057e05b3b281b Martin Botka   2024-04-18   77  			#cooling-cells = <2>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   78  			i-cache-size = <0x8000>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   79  			i-cache-line-size = <64>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   80  			i-cache-sets = <256>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   81  			d-cache-size = <0x8000>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   82  			d-cache-line-size = <64>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   83  			d-cache-sets = <128>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   84  			next-level-cache = <&l2_cache>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   85  		};
d4ec229eaeb8453 Dragan Simic   2024-05-28   86  
d4ec229eaeb8453 Dragan Simic   2024-05-28   87  		l2_cache: l2-cache {
d4ec229eaeb8453 Dragan Simic   2024-05-28   88  			compatible = "cache";
d4ec229eaeb8453 Dragan Simic   2024-05-28   89  			cache-level = <2>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   90  			cache-unified;
d4ec229eaeb8453 Dragan Simic   2024-05-28   91  			cache-size = <0x40000>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   92  			cache-line-size = <64>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   93  			cache-sets = <256>;
0d17c8651188816 Andre Przywara 2022-07-08   94  		};
0d17c8651188816 Andre Przywara 2022-07-08   95  	};
0d17c8651188816 Andre Przywara 2022-07-08   96  
0d17c8651188816 Andre Przywara 2022-07-08   97  	reserved-memory {
0d17c8651188816 Andre Przywara 2022-07-08   98  		#address-cells = <2>;
0d17c8651188816 Andre Przywara 2022-07-08   99  		#size-cells = <2>;
0d17c8651188816 Andre Przywara 2022-07-08  100  		ranges;
0d17c8651188816 Andre Przywara 2022-07-08  101  
0d17c8651188816 Andre Przywara 2022-07-08  102  		/*
0d17c8651188816 Andre Przywara 2022-07-08  103  		 * 256 KiB reserved for Trusted Firmware-A (BL31).
0d17c8651188816 Andre Przywara 2022-07-08  104  		 * This is added by BL31 itself, but some bootloaders fail
0d17c8651188816 Andre Przywara 2022-07-08  105  		 * to propagate this into the DTB handed to kernels.
0d17c8651188816 Andre Przywara 2022-07-08  106  		 */
0d17c8651188816 Andre Przywara 2022-07-08  107  		secmon@40000000 {
0d17c8651188816 Andre Przywara 2022-07-08  108  			reg = <0x0 0x40000000 0x0 0x40000>;
0d17c8651188816 Andre Przywara 2022-07-08  109  			no-map;
0d17c8651188816 Andre Przywara 2022-07-08  110  		};
0d17c8651188816 Andre Przywara 2022-07-08  111  	};
0d17c8651188816 Andre Przywara 2022-07-08  112  
0d17c8651188816 Andre Przywara 2022-07-08  113  	osc24M: osc24M-clk {
0d17c8651188816 Andre Przywara 2022-07-08  114  		#clock-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08  115  		compatible = "fixed-clock";
0d17c8651188816 Andre Przywara 2022-07-08  116  		clock-frequency = <24000000>;
0d17c8651188816 Andre Przywara 2022-07-08  117  		clock-output-names = "osc24M";
0d17c8651188816 Andre Przywara 2022-07-08  118  	};
0d17c8651188816 Andre Przywara 2022-07-08  119  
0d17c8651188816 Andre Przywara 2022-07-08  120  	pmu {
0d17c8651188816 Andre Przywara 2022-07-08  121  		compatible = "arm,cortex-a53-pmu";
0d17c8651188816 Andre Przywara 2022-07-08  122  		interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
0d17c8651188816 Andre Przywara 2022-07-08  123  			     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
0d17c8651188816 Andre Przywara 2022-07-08  124  			     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
0d17c8651188816 Andre Przywara 2022-07-08  125  			     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  126  		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
0d17c8651188816 Andre Przywara 2022-07-08  127  	};
0d17c8651188816 Andre Przywara 2022-07-08  128  
0d17c8651188816 Andre Przywara 2022-07-08  129  	psci {
0d17c8651188816 Andre Przywara 2022-07-08  130  		compatible = "arm,psci-0.2";
0d17c8651188816 Andre Przywara 2022-07-08  131  		method = "smc";
0d17c8651188816 Andre Przywara 2022-07-08  132  	};
0d17c8651188816 Andre Przywara 2022-07-08  133  
0d17c8651188816 Andre Przywara 2022-07-08  134  	timer {
0d17c8651188816 Andre Przywara 2022-07-08  135  		compatible = "arm,armv8-timer";
0d17c8651188816 Andre Przywara 2022-07-08  136  		arm,no-tick-in-suspend;
0d17c8651188816 Andre Przywara 2022-07-08  137  		interrupts = <GIC_PPI 13
0d17c8651188816 Andre Przywara 2022-07-08  138  			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
0d17c8651188816 Andre Przywara 2022-07-08  139  			     <GIC_PPI 14
0d17c8651188816 Andre Przywara 2022-07-08  140  			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
0d17c8651188816 Andre Przywara 2022-07-08  141  			     <GIC_PPI 11
0d17c8651188816 Andre Przywara 2022-07-08  142  			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
0d17c8651188816 Andre Przywara 2022-07-08  143  			     <GIC_PPI 10
0d17c8651188816 Andre Przywara 2022-07-08  144  			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
0d17c8651188816 Andre Przywara 2022-07-08  145  	};
0d17c8651188816 Andre Przywara 2022-07-08  146  
0d17c8651188816 Andre Przywara 2022-07-08  147  	soc {
0d17c8651188816 Andre Przywara 2022-07-08  148  		compatible = "simple-bus";
0d17c8651188816 Andre Przywara 2022-07-08  149  		#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  150  		#size-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  151  		ranges = <0x0 0x0 0x0 0x40000000>;
0d17c8651188816 Andre Przywara 2022-07-08  152  
6ed9a85f1c44d70 Andre Przywara 2024-06-25  153  		crypto: crypto@1904000 {
6ed9a85f1c44d70 Andre Przywara 2024-06-25  154  			compatible = "allwinner,sun50i-h616-crypto";
6ed9a85f1c44d70 Andre Przywara 2024-06-25  155  			reg = <0x01904000 0x800>;
6ed9a85f1c44d70 Andre Przywara 2024-06-25  156  			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
6ed9a85f1c44d70 Andre Przywara 2024-06-25  157  			clocks = <&ccu CLK_BUS_CE>, <&ccu CLK_CE>,
6ed9a85f1c44d70 Andre Przywara 2024-06-25  158  				 <&ccu CLK_MBUS_CE>, <&rtc CLK_IOSC>;
6ed9a85f1c44d70 Andre Przywara 2024-06-25  159  			clock-names = "bus", "mod", "ram", "trng";
6ed9a85f1c44d70 Andre Przywara 2024-06-25  160  			resets = <&ccu RST_BUS_CE>;
6ed9a85f1c44d70 Andre Przywara 2024-06-25  161  		};
6ed9a85f1c44d70 Andre Przywara 2024-06-25  162  
0d17c8651188816 Andre Przywara 2022-07-08  163  		syscon: syscon@3000000 {
0d17c8651188816 Andre Przywara 2022-07-08  164  			compatible = "allwinner,sun50i-h616-system-control";
0d17c8651188816 Andre Przywara 2022-07-08  165  			reg = <0x03000000 0x1000>;
0d17c8651188816 Andre Przywara 2022-07-08  166  			#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  167  			#size-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  168  			ranges;
0d17c8651188816 Andre Przywara 2022-07-08  169  
0d17c8651188816 Andre Przywara 2022-07-08  170  			sram_c: sram@28000 {
0d17c8651188816 Andre Przywara 2022-07-08  171  				compatible = "mmio-sram";
0d17c8651188816 Andre Przywara 2022-07-08  172  				reg = <0x00028000 0x30000>;
0d17c8651188816 Andre Przywara 2022-07-08  173  				#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  174  				#size-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  175  				ranges = <0 0x00028000 0x30000>;
0d17c8651188816 Andre Przywara 2022-07-08  176  			};
0d17c8651188816 Andre Przywara 2022-07-08  177  		};
0d17c8651188816 Andre Przywara 2022-07-08  178  
0d17c8651188816 Andre Przywara 2022-07-08  179  		ccu: clock@3001000 {
0d17c8651188816 Andre Przywara 2022-07-08  180  			compatible = "allwinner,sun50i-h616-ccu";
0d17c8651188816 Andre Przywara 2022-07-08  181  			reg = <0x03001000 0x1000>;
0d17c8651188816 Andre Przywara 2022-07-08  182  			clocks = <&osc24M>, <&rtc CLK_OSC32K>, <&rtc CLK_IOSC>;
0d17c8651188816 Andre Przywara 2022-07-08  183  			clock-names = "hosc", "losc", "iosc";
0d17c8651188816 Andre Przywara 2022-07-08  184  			#clock-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  185  			#reset-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  186  		};
0d17c8651188816 Andre Przywara 2022-07-08  187  
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  188  		dma: dma-controller@3002000 {
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  189  			compatible = "allwinner,sun50i-h616-dma",
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  190  				     "allwinner,sun50i-a100-dma";
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  191  			reg = <0x03002000 0x1000>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  192  			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  193  			clocks = <&ccu CLK_BUS_DMA>, <&ccu CLK_MBUS_DMA>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  194  			clock-names = "bus", "mbus";
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  195  			dma-channels = <16>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  196  			dma-requests = <49>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  197  			resets = <&ccu RST_BUS_DMA>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  198  			#dma-cells = <1>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  199  		};
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  200  
951992797378a21 Martin Botka   2023-09-12  201  		sid: efuse@3006000 {
951992797378a21 Martin Botka   2023-09-12  202  			compatible = "allwinner,sun50i-h616-sid", "allwinner,sun50i-a64-sid";
951992797378a21 Martin Botka   2023-09-12  203  			reg = <0x03006000 0x1000>;
951992797378a21 Martin Botka   2023-09-12  204  			#address-cells = <1>;
951992797378a21 Martin Botka   2023-09-12  205  			#size-cells = <1>;
f4318af40544b8e Martin Botka   2024-02-19  206  
f4318af40544b8e Martin Botka   2024-02-19  207  			ths_calibration: thermal-sensor-calibration@14 {
f4318af40544b8e Martin Botka   2024-02-19  208  				reg = <0x14 0x8>;
f4318af40544b8e Martin Botka   2024-02-19  209  			};
3e057e05b3b281b Martin Botka   2024-04-18  210  
3e057e05b3b281b Martin Botka   2024-04-18  211  			cpu_speed_grade: cpu-speed-grade@0 {
3e057e05b3b281b Martin Botka   2024-04-18  212  				reg = <0x0 2>;
3e057e05b3b281b Martin Botka   2024-04-18  213  			};
951992797378a21 Martin Botka   2023-09-12  214  		};
951992797378a21 Martin Botka   2023-09-12  215  
0d17c8651188816 Andre Przywara 2022-07-08  216  		watchdog: watchdog@30090a0 {
0d17c8651188816 Andre Przywara 2022-07-08  217  			compatible = "allwinner,sun50i-h616-wdt",
0d17c8651188816 Andre Przywara 2022-07-08  218  				     "allwinner,sun6i-a31-wdt";
0d17c8651188816 Andre Przywara 2022-07-08  219  			reg = <0x030090a0 0x20>;
0d17c8651188816 Andre Przywara 2022-07-08  220  			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  221  			clocks = <&osc24M>;
0d17c8651188816 Andre Przywara 2022-07-08  222  		};
0d17c8651188816 Andre Przywara 2022-07-08  223  
0d17c8651188816 Andre Przywara 2022-07-08  224  		pio: pinctrl@300b000 {
0d17c8651188816 Andre Przywara 2022-07-08  225  			compatible = "allwinner,sun50i-h616-pinctrl";
0d17c8651188816 Andre Przywara 2022-07-08  226  			reg = <0x0300b000 0x400>;
0d17c8651188816 Andre Przywara 2022-07-08  227  			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
0d17c8651188816 Andre Przywara 2022-07-08  228  				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
0d17c8651188816 Andre Przywara 2022-07-08  229  				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
0d17c8651188816 Andre Przywara 2022-07-08  230  				     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
0d17c8651188816 Andre Przywara 2022-07-08  231  				     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
0d17c8651188816 Andre Przywara 2022-07-08  232  				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
0d17c8651188816 Andre Przywara 2022-07-08  233  				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
0d17c8651188816 Andre Przywara 2022-07-08  234  				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  235  			clocks = <&ccu CLK_APB1>, <&osc24M>, <&rtc CLK_OSC32K>;
0d17c8651188816 Andre Przywara 2022-07-08  236  			clock-names = "apb", "hosc", "losc";
0d17c8651188816 Andre Przywara 2022-07-08  237  			gpio-controller;
0d17c8651188816 Andre Przywara 2022-07-08  238  			#gpio-cells = <3>;
0d17c8651188816 Andre Przywara 2022-07-08  239  			interrupt-controller;
0d17c8651188816 Andre Przywara 2022-07-08  240  			#interrupt-cells = <3>;
0d17c8651188816 Andre Przywara 2022-07-08  241  
0d17c8651188816 Andre Przywara 2022-07-08  242  			ext_rgmii_pins: rgmii-pins {
0d17c8651188816 Andre Przywara 2022-07-08  243  				pins = "PI0", "PI1", "PI2", "PI3", "PI4",
0d17c8651188816 Andre Przywara 2022-07-08  244  				       "PI5", "PI7", "PI8", "PI9", "PI10",
0d17c8651188816 Andre Przywara 2022-07-08  245  				       "PI11", "PI12", "PI13", "PI14", "PI15",
0d17c8651188816 Andre Przywara 2022-07-08  246  				       "PI16";
0d17c8651188816 Andre Przywara 2022-07-08  247  				function = "emac0";
0d17c8651188816 Andre Przywara 2022-07-08  248  				drive-strength = <40>;
0d17c8651188816 Andre Przywara 2022-07-08  249  			};
0d17c8651188816 Andre Przywara 2022-07-08  250  
0d17c8651188816 Andre Przywara 2022-07-08  251  			i2c0_pins: i2c0-pins {
5bdeb3d2e240e59 Andre Przywara 2024-03-29  252  				pins = "PI5", "PI6";
0d17c8651188816 Andre Przywara 2022-07-08  253  				function = "i2c0";
0d17c8651188816 Andre Przywara 2022-07-08  254  			};
0d17c8651188816 Andre Przywara 2022-07-08  255  
0d17c8651188816 Andre Przywara 2022-07-08  256  			i2c3_ph_pins: i2c3-ph-pins {
0d17c8651188816 Andre Przywara 2022-07-08  257  				pins = "PH4", "PH5";
0d17c8651188816 Andre Przywara 2022-07-08  258  				function = "i2c3";
0d17c8651188816 Andre Przywara 2022-07-08  259  			};
0d17c8651188816 Andre Przywara 2022-07-08  260  
0d17c8651188816 Andre Przywara 2022-07-08  261  			ir_rx_pin: ir-rx-pin {
0d17c8651188816 Andre Przywara 2022-07-08  262  				pins = "PH10";
0d17c8651188816 Andre Przywara 2022-07-08  263  				function = "ir_rx";
0d17c8651188816 Andre Przywara 2022-07-08  264  			};
0d17c8651188816 Andre Przywara 2022-07-08  265  
0d17c8651188816 Andre Przywara 2022-07-08  266  			mmc0_pins: mmc0-pins {
0d17c8651188816 Andre Przywara 2022-07-08  267  				pins = "PF0", "PF1", "PF2", "PF3",
0d17c8651188816 Andre Przywara 2022-07-08  268  				       "PF4", "PF5";
0d17c8651188816 Andre Przywara 2022-07-08  269  				function = "mmc0";
0d17c8651188816 Andre Przywara 2022-07-08  270  				drive-strength = <30>;
0d17c8651188816 Andre Przywara 2022-07-08  271  				bias-pull-up;
0d17c8651188816 Andre Przywara 2022-07-08  272  			};
0d17c8651188816 Andre Przywara 2022-07-08  273  
0d17c8651188816 Andre Przywara 2022-07-08  274  			/omit-if-no-ref/
0d17c8651188816 Andre Przywara 2022-07-08  275  			mmc1_pins: mmc1-pins {
0d17c8651188816 Andre Przywara 2022-07-08  276  				pins = "PG0", "PG1", "PG2", "PG3",
0d17c8651188816 Andre Przywara 2022-07-08  277  				       "PG4", "PG5";
0d17c8651188816 Andre Przywara 2022-07-08  278  				function = "mmc1";
0d17c8651188816 Andre Przywara 2022-07-08  279  				drive-strength = <30>;
0d17c8651188816 Andre Przywara 2022-07-08  280  				bias-pull-up;
0d17c8651188816 Andre Przywara 2022-07-08  281  			};
0d17c8651188816 Andre Przywara 2022-07-08  282  
0d17c8651188816 Andre Przywara 2022-07-08  283  			mmc2_pins: mmc2-pins {
0d17c8651188816 Andre Przywara 2022-07-08  284  				pins = "PC0", "PC1", "PC5", "PC6",
0d17c8651188816 Andre Przywara 2022-07-08  285  				       "PC8", "PC9", "PC10", "PC11",
0d17c8651188816 Andre Przywara 2022-07-08  286  				       "PC13", "PC14", "PC15", "PC16";
0d17c8651188816 Andre Przywara 2022-07-08  287  				function = "mmc2";
0d17c8651188816 Andre Przywara 2022-07-08  288  				drive-strength = <30>;
0d17c8651188816 Andre Przywara 2022-07-08  289  				bias-pull-up;
0d17c8651188816 Andre Przywara 2022-07-08  290  			};
0d17c8651188816 Andre Przywara 2022-07-08  291  
0d17c8651188816 Andre Przywara 2022-07-08  292  			/omit-if-no-ref/
0d17c8651188816 Andre Przywara 2022-07-08  293  			spi0_pins: spi0-pins {
0d17c8651188816 Andre Przywara 2022-07-08  294  				pins = "PC0", "PC2", "PC4";
0d17c8651188816 Andre Przywara 2022-07-08  295  				function = "spi0";
0d17c8651188816 Andre Przywara 2022-07-08  296  			};
0d17c8651188816 Andre Przywara 2022-07-08  297  
0d17c8651188816 Andre Przywara 2022-07-08  298  			/omit-if-no-ref/
0d17c8651188816 Andre Przywara 2022-07-08  299  			spi0_cs0_pin: spi0-cs0-pin {
0d17c8651188816 Andre Przywara 2022-07-08  300  				pins = "PC3";
0d17c8651188816 Andre Przywara 2022-07-08  301  				function = "spi0";
0d17c8651188816 Andre Przywara 2022-07-08  302  			};
0d17c8651188816 Andre Przywara 2022-07-08  303  
0d17c8651188816 Andre Przywara 2022-07-08  304  			/omit-if-no-ref/
0d17c8651188816 Andre Przywara 2022-07-08  305  			spi1_pins: spi1-pins {
0d17c8651188816 Andre Przywara 2022-07-08  306  				pins = "PH6", "PH7", "PH8";
0d17c8651188816 Andre Przywara 2022-07-08  307  				function = "spi1";
0d17c8651188816 Andre Przywara 2022-07-08  308  			};
0d17c8651188816 Andre Przywara 2022-07-08  309  
0d17c8651188816 Andre Przywara 2022-07-08  310  			/omit-if-no-ref/
0d17c8651188816 Andre Przywara 2022-07-08  311  			spi1_cs0_pin: spi1-cs0-pin {
0d17c8651188816 Andre Przywara 2022-07-08  312  				pins = "PH5";
0d17c8651188816 Andre Przywara 2022-07-08  313  				function = "spi1";
0d17c8651188816 Andre Przywara 2022-07-08  314  			};
0d17c8651188816 Andre Przywara 2022-07-08  315  
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  316  			spdif_tx_pin: spdif-tx-pin {
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  317  				pins = "PH4";
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  318  				function = "spdif";
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  319  			};
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  320  
0d17c8651188816 Andre Przywara 2022-07-08  321  			uart0_ph_pins: uart0-ph-pins {
0d17c8651188816 Andre Przywara 2022-07-08  322  				pins = "PH0", "PH1";
0d17c8651188816 Andre Przywara 2022-07-08  323  				function = "uart0";
0d17c8651188816 Andre Przywara 2022-07-08  324  			};
0d17c8651188816 Andre Przywara 2022-07-08  325  
0d17c8651188816 Andre Przywara 2022-07-08  326  			/omit-if-no-ref/
0d17c8651188816 Andre Przywara 2022-07-08  327  			uart1_pins: uart1-pins {
0d17c8651188816 Andre Przywara 2022-07-08  328  				pins = "PG6", "PG7";
0d17c8651188816 Andre Przywara 2022-07-08  329  				function = "uart1";
0d17c8651188816 Andre Przywara 2022-07-08  330  			};
0d17c8651188816 Andre Przywara 2022-07-08  331  
0d17c8651188816 Andre Przywara 2022-07-08  332  			/omit-if-no-ref/
0d17c8651188816 Andre Przywara 2022-07-08  333  			uart1_rts_cts_pins: uart1-rts-cts-pins {
0d17c8651188816 Andre Przywara 2022-07-08  334  				pins = "PG8", "PG9";
0d17c8651188816 Andre Przywara 2022-07-08  335  				function = "uart1";
0d17c8651188816 Andre Przywara 2022-07-08  336  			};
9583c8d91491f51 Andre Przywara 2024-02-09  337  
9583c8d91491f51 Andre Przywara 2024-02-09  338  			/omit-if-no-ref/
9583c8d91491f51 Andre Przywara 2024-02-09  339  			x32clk_fanout_pin: x32clk-fanout-pin {
9583c8d91491f51 Andre Przywara 2024-02-09  340  				pins = "PG10";
9583c8d91491f51 Andre Przywara 2024-02-09  341  				function = "clock";
9583c8d91491f51 Andre Przywara 2024-02-09  342  			};
0d17c8651188816 Andre Przywara 2022-07-08  343  		};
0d17c8651188816 Andre Przywara 2022-07-08  344  
0d17c8651188816 Andre Przywara 2022-07-08  345  		gic: interrupt-controller@3021000 {
0d17c8651188816 Andre Przywara 2022-07-08  346  			compatible = "arm,gic-400";
0d17c8651188816 Andre Przywara 2022-07-08  347  			reg = <0x03021000 0x1000>,
0d17c8651188816 Andre Przywara 2022-07-08  348  			      <0x03022000 0x2000>,
0d17c8651188816 Andre Przywara 2022-07-08  349  			      <0x03024000 0x2000>,
0d17c8651188816 Andre Przywara 2022-07-08  350  			      <0x03026000 0x2000>;
0d17c8651188816 Andre Przywara 2022-07-08  351  			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
0d17c8651188816 Andre Przywara 2022-07-08  352  			interrupt-controller;
0d17c8651188816 Andre Przywara 2022-07-08  353  			#interrupt-cells = <3>;
0d17c8651188816 Andre Przywara 2022-07-08  354  		};
0d17c8651188816 Andre Przywara 2022-07-08  355  
0c85e2e377c368e Andre Przywara 2024-06-16  356  		iommu: iommu@30f0000 {
0c85e2e377c368e Andre Przywara 2024-06-16  357  			compatible = "allwinner,sun50i-h616-iommu";
0c85e2e377c368e Andre Przywara 2024-06-16  358  			reg = <0x030f0000 0x10000>;
0c85e2e377c368e Andre Przywara 2024-06-16  359  			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
0c85e2e377c368e Andre Przywara 2024-06-16  360  			clocks = <&ccu CLK_BUS_IOMMU>;
0c85e2e377c368e Andre Przywara 2024-06-16  361  			resets = <&ccu RST_BUS_IOMMU>;
0c85e2e377c368e Andre Przywara 2024-06-16  362  			#iommu-cells = <1>;
0c85e2e377c368e Andre Przywara 2024-06-16  363  		};
0c85e2e377c368e Andre Przywara 2024-06-16  364  
0d17c8651188816 Andre Przywara 2022-07-08  365  		mmc0: mmc@4020000 {
0d17c8651188816 Andre Przywara 2022-07-08  366  			compatible = "allwinner,sun50i-h616-mmc",
0d17c8651188816 Andre Przywara 2022-07-08  367  				     "allwinner,sun50i-a100-mmc";
0d17c8651188816 Andre Przywara 2022-07-08  368  			reg = <0x04020000 0x1000>;
0d17c8651188816 Andre Przywara 2022-07-08  369  			clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
0d17c8651188816 Andre Przywara 2022-07-08  370  			clock-names = "ahb", "mmc";
0d17c8651188816 Andre Przywara 2022-07-08  371  			resets = <&ccu RST_BUS_MMC0>;
0d17c8651188816 Andre Przywara 2022-07-08  372  			reset-names = "ahb";
0d17c8651188816 Andre Przywara 2022-07-08  373  			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  374  			pinctrl-names = "default";
0d17c8651188816 Andre Przywara 2022-07-08  375  			pinctrl-0 = <&mmc0_pins>;
0d17c8651188816 Andre Przywara 2022-07-08  376  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  377  			max-frequency = <150000000>;
0d17c8651188816 Andre Przywara 2022-07-08  378  			cap-sd-highspeed;
0d17c8651188816 Andre Przywara 2022-07-08  379  			cap-mmc-highspeed;
0d17c8651188816 Andre Przywara 2022-07-08  380  			mmc-ddr-3_3v;
0d17c8651188816 Andre Przywara 2022-07-08  381  			cap-sdio-irq;
0d17c8651188816 Andre Przywara 2022-07-08  382  			#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  383  			#size-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08  384  		};
0d17c8651188816 Andre Przywara 2022-07-08  385  
0d17c8651188816 Andre Przywara 2022-07-08  386  		mmc1: mmc@4021000 {
0d17c8651188816 Andre Przywara 2022-07-08  387  			compatible = "allwinner,sun50i-h616-mmc",
0d17c8651188816 Andre Przywara 2022-07-08  388  				     "allwinner,sun50i-a100-mmc";
0d17c8651188816 Andre Przywara 2022-07-08  389  			reg = <0x04021000 0x1000>;
0d17c8651188816 Andre Przywara 2022-07-08  390  			clocks = <&ccu CLK_BUS_MMC1>, <&ccu CLK_MMC1>;
0d17c8651188816 Andre Przywara 2022-07-08  391  			clock-names = "ahb", "mmc";
0d17c8651188816 Andre Przywara 2022-07-08  392  			resets = <&ccu RST_BUS_MMC1>;
0d17c8651188816 Andre Przywara 2022-07-08  393  			reset-names = "ahb";
0d17c8651188816 Andre Przywara 2022-07-08  394  			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  395  			pinctrl-names = "default";
0d17c8651188816 Andre Przywara 2022-07-08  396  			pinctrl-0 = <&mmc1_pins>;
0d17c8651188816 Andre Przywara 2022-07-08  397  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  398  			max-frequency = <150000000>;
0d17c8651188816 Andre Przywara 2022-07-08  399  			cap-sd-highspeed;
0d17c8651188816 Andre Przywara 2022-07-08  400  			cap-mmc-highspeed;
0d17c8651188816 Andre Przywara 2022-07-08  401  			mmc-ddr-3_3v;
0d17c8651188816 Andre Przywara 2022-07-08  402  			cap-sdio-irq;
0d17c8651188816 Andre Przywara 2022-07-08  403  			#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  404  			#size-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08  405  		};
0d17c8651188816 Andre Przywara 2022-07-08  406  
0d17c8651188816 Andre Przywara 2022-07-08  407  		mmc2: mmc@4022000 {
0d17c8651188816 Andre Przywara 2022-07-08  408  			compatible = "allwinner,sun50i-h616-emmc",
0d17c8651188816 Andre Przywara 2022-07-08  409  				     "allwinner,sun50i-a100-emmc";
0d17c8651188816 Andre Przywara 2022-07-08  410  			reg = <0x04022000 0x1000>;
0d17c8651188816 Andre Przywara 2022-07-08  411  			clocks = <&ccu CLK_BUS_MMC2>, <&ccu CLK_MMC2>;
0d17c8651188816 Andre Przywara 2022-07-08  412  			clock-names = "ahb", "mmc";
0d17c8651188816 Andre Przywara 2022-07-08  413  			resets = <&ccu RST_BUS_MMC2>;
0d17c8651188816 Andre Przywara 2022-07-08  414  			reset-names = "ahb";
0d17c8651188816 Andre Przywara 2022-07-08  415  			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  416  			pinctrl-names = "default";
0d17c8651188816 Andre Przywara 2022-07-08  417  			pinctrl-0 = <&mmc2_pins>;
0d17c8651188816 Andre Przywara 2022-07-08  418  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  419  			max-frequency = <150000000>;
0d17c8651188816 Andre Przywara 2022-07-08  420  			cap-sd-highspeed;
0d17c8651188816 Andre Przywara 2022-07-08  421  			cap-mmc-highspeed;
0d17c8651188816 Andre Przywara 2022-07-08  422  			mmc-ddr-3_3v;
0d17c8651188816 Andre Przywara 2022-07-08  423  			cap-sdio-irq;
0d17c8651188816 Andre Przywara 2022-07-08  424  			#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  425  			#size-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08  426  		};
0d17c8651188816 Andre Przywara 2022-07-08  427  
0d17c8651188816 Andre Przywara 2022-07-08  428  		uart0: serial@5000000 {
0d17c8651188816 Andre Przywara 2022-07-08  429  			compatible = "snps,dw-apb-uart";
0d17c8651188816 Andre Przywara 2022-07-08  430  			reg = <0x05000000 0x400>;
0d17c8651188816 Andre Przywara 2022-07-08  431  			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  432  			reg-shift = <2>;
0d17c8651188816 Andre Przywara 2022-07-08  433  			reg-io-width = <4>;
0d17c8651188816 Andre Przywara 2022-07-08  434  			clocks = <&ccu CLK_BUS_UART0>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  435  			dmas = <&dma 14>, <&dma 14>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  436  			dma-names = "tx", "rx";
0d17c8651188816 Andre Przywara 2022-07-08  437  			resets = <&ccu RST_BUS_UART0>;
0d17c8651188816 Andre Przywara 2022-07-08  438  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  439  		};
0d17c8651188816 Andre Przywara 2022-07-08  440  
0d17c8651188816 Andre Przywara 2022-07-08  441  		uart1: serial@5000400 {
0d17c8651188816 Andre Przywara 2022-07-08  442  			compatible = "snps,dw-apb-uart";
0d17c8651188816 Andre Przywara 2022-07-08  443  			reg = <0x05000400 0x400>;
0d17c8651188816 Andre Przywara 2022-07-08  444  			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  445  			reg-shift = <2>;
0d17c8651188816 Andre Przywara 2022-07-08  446  			reg-io-width = <4>;
0d17c8651188816 Andre Przywara 2022-07-08  447  			clocks = <&ccu CLK_BUS_UART1>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  448  			dmas = <&dma 15>, <&dma 15>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  449  			dma-names = "tx", "rx";
0d17c8651188816 Andre Przywara 2022-07-08  450  			resets = <&ccu RST_BUS_UART1>;
0d17c8651188816 Andre Przywara 2022-07-08  451  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  452  		};
0d17c8651188816 Andre Przywara 2022-07-08  453  
0d17c8651188816 Andre Przywara 2022-07-08  454  		uart2: serial@5000800 {
0d17c8651188816 Andre Przywara 2022-07-08  455  			compatible = "snps,dw-apb-uart";
0d17c8651188816 Andre Przywara 2022-07-08  456  			reg = <0x05000800 0x400>;
0d17c8651188816 Andre Przywara 2022-07-08  457  			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  458  			reg-shift = <2>;
0d17c8651188816 Andre Przywara 2022-07-08  459  			reg-io-width = <4>;
0d17c8651188816 Andre Przywara 2022-07-08  460  			clocks = <&ccu CLK_BUS_UART2>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  461  			dmas = <&dma 16>, <&dma 16>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  462  			dma-names = "tx", "rx";
0d17c8651188816 Andre Przywara 2022-07-08  463  			resets = <&ccu RST_BUS_UART2>;
0d17c8651188816 Andre Przywara 2022-07-08  464  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  465  		};
0d17c8651188816 Andre Przywara 2022-07-08  466  
0d17c8651188816 Andre Przywara 2022-07-08  467  		uart3: serial@5000c00 {
0d17c8651188816 Andre Przywara 2022-07-08  468  			compatible = "snps,dw-apb-uart";
0d17c8651188816 Andre Przywara 2022-07-08  469  			reg = <0x05000c00 0x400>;
0d17c8651188816 Andre Przywara 2022-07-08  470  			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  471  			reg-shift = <2>;
0d17c8651188816 Andre Przywara 2022-07-08  472  			reg-io-width = <4>;
0d17c8651188816 Andre Przywara 2022-07-08  473  			clocks = <&ccu CLK_BUS_UART3>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  474  			dmas = <&dma 17>, <&dma 17>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  475  			dma-names = "tx", "rx";
0d17c8651188816 Andre Przywara 2022-07-08  476  			resets = <&ccu RST_BUS_UART3>;
0d17c8651188816 Andre Przywara 2022-07-08  477  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  478  		};
0d17c8651188816 Andre Przywara 2022-07-08  479  
0d17c8651188816 Andre Przywara 2022-07-08  480  		uart4: serial@5001000 {
0d17c8651188816 Andre Przywara 2022-07-08  481  			compatible = "snps,dw-apb-uart";
0d17c8651188816 Andre Przywara 2022-07-08  482  			reg = <0x05001000 0x400>;
0d17c8651188816 Andre Przywara 2022-07-08  483  			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  484  			reg-shift = <2>;
0d17c8651188816 Andre Przywara 2022-07-08  485  			reg-io-width = <4>;
0d17c8651188816 Andre Przywara 2022-07-08  486  			clocks = <&ccu CLK_BUS_UART4>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  487  			dmas = <&dma 18>, <&dma 18>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  488  			dma-names = "tx", "rx";
0d17c8651188816 Andre Przywara 2022-07-08  489  			resets = <&ccu RST_BUS_UART4>;
0d17c8651188816 Andre Przywara 2022-07-08  490  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  491  		};
0d17c8651188816 Andre Przywara 2022-07-08  492  
0d17c8651188816 Andre Przywara 2022-07-08  493  		uart5: serial@5001400 {
0d17c8651188816 Andre Przywara 2022-07-08  494  			compatible = "snps,dw-apb-uart";
0d17c8651188816 Andre Przywara 2022-07-08  495  			reg = <0x05001400 0x400>;
0d17c8651188816 Andre Przywara 2022-07-08  496  			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  497  			reg-shift = <2>;
0d17c8651188816 Andre Przywara 2022-07-08  498  			reg-io-width = <4>;
0d17c8651188816 Andre Przywara 2022-07-08  499  			clocks = <&ccu CLK_BUS_UART5>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  500  			dmas = <&dma 19>, <&dma 19>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  501  			dma-names = "tx", "rx";
0d17c8651188816 Andre Przywara 2022-07-08  502  			resets = <&ccu RST_BUS_UART5>;
0d17c8651188816 Andre Przywara 2022-07-08  503  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  504  		};
0d17c8651188816 Andre Przywara 2022-07-08  505  
0d17c8651188816 Andre Przywara 2022-07-08  506  		i2c0: i2c@5002000 {
0d17c8651188816 Andre Przywara 2022-07-08  507  			compatible = "allwinner,sun50i-h616-i2c",
0d17c8651188816 Andre Przywara 2022-07-08  508  				     "allwinner,sun8i-v536-i2c",
0d17c8651188816 Andre Przywara 2022-07-08  509  				     "allwinner,sun6i-a31-i2c";
0d17c8651188816 Andre Przywara 2022-07-08  510  			reg = <0x05002000 0x400>;
0d17c8651188816 Andre Przywara 2022-07-08  511  			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  512  			clocks = <&ccu CLK_BUS_I2C0>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  513  			dmas = <&dma 43>, <&dma 43>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  514  			dma-names = "rx", "tx";
0d17c8651188816 Andre Przywara 2022-07-08  515  			resets = <&ccu RST_BUS_I2C0>;
0d17c8651188816 Andre Przywara 2022-07-08  516  			pinctrl-names = "default";
0d17c8651188816 Andre Przywara 2022-07-08  517  			pinctrl-0 = <&i2c0_pins>;
0d17c8651188816 Andre Przywara 2022-07-08  518  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  519  			#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  520  			#size-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08  521  		};
0d17c8651188816 Andre Przywara 2022-07-08  522  
0d17c8651188816 Andre Przywara 2022-07-08  523  		i2c1: i2c@5002400 {
0d17c8651188816 Andre Przywara 2022-07-08  524  			compatible = "allwinner,sun50i-h616-i2c",
0d17c8651188816 Andre Przywara 2022-07-08  525  				     "allwinner,sun8i-v536-i2c",
0d17c8651188816 Andre Przywara 2022-07-08  526  				     "allwinner,sun6i-a31-i2c";
0d17c8651188816 Andre Przywara 2022-07-08  527  			reg = <0x05002400 0x400>;
0d17c8651188816 Andre Przywara 2022-07-08  528  			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  529  			clocks = <&ccu CLK_BUS_I2C1>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  530  			dmas = <&dma 44>, <&dma 44>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  531  			dma-names = "rx", "tx";
0d17c8651188816 Andre Przywara 2022-07-08  532  			resets = <&ccu RST_BUS_I2C1>;
0d17c8651188816 Andre Przywara 2022-07-08  533  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  534  			#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  535  			#size-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08  536  		};
0d17c8651188816 Andre Przywara 2022-07-08  537  
0d17c8651188816 Andre Przywara 2022-07-08  538  		i2c2: i2c@5002800 {
0d17c8651188816 Andre Przywara 2022-07-08  539  			compatible = "allwinner,sun50i-h616-i2c",
0d17c8651188816 Andre Przywara 2022-07-08  540  				     "allwinner,sun8i-v536-i2c",
0d17c8651188816 Andre Przywara 2022-07-08  541  				     "allwinner,sun6i-a31-i2c";
0d17c8651188816 Andre Przywara 2022-07-08  542  			reg = <0x05002800 0x400>;
0d17c8651188816 Andre Przywara 2022-07-08  543  			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  544  			clocks = <&ccu CLK_BUS_I2C2>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  545  			dmas = <&dma 45>, <&dma 45>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  546  			dma-names = "rx", "tx";
0d17c8651188816 Andre Przywara 2022-07-08  547  			resets = <&ccu RST_BUS_I2C2>;
0d17c8651188816 Andre Przywara 2022-07-08  548  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  549  			#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  550  			#size-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08  551  		};
0d17c8651188816 Andre Przywara 2022-07-08  552  
0d17c8651188816 Andre Przywara 2022-07-08  553  		i2c3: i2c@5002c00 {
0d17c8651188816 Andre Przywara 2022-07-08  554  			compatible = "allwinner,sun50i-h616-i2c",
0d17c8651188816 Andre Przywara 2022-07-08  555  				     "allwinner,sun8i-v536-i2c",
0d17c8651188816 Andre Przywara 2022-07-08  556  				     "allwinner,sun6i-a31-i2c";
0d17c8651188816 Andre Przywara 2022-07-08  557  			reg = <0x05002c00 0x400>;
0d17c8651188816 Andre Przywara 2022-07-08  558  			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  559  			clocks = <&ccu CLK_BUS_I2C3>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  560  			dmas = <&dma 46>, <&dma 46>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  561  			dma-names = "rx", "tx";
0d17c8651188816 Andre Przywara 2022-07-08  562  			resets = <&ccu RST_BUS_I2C3>;
0d17c8651188816 Andre Przywara 2022-07-08  563  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  564  			#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  565  			#size-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08  566  		};
0d17c8651188816 Andre Przywara 2022-07-08  567  
0d17c8651188816 Andre Przywara 2022-07-08  568  		i2c4: i2c@5003000 {
0d17c8651188816 Andre Przywara 2022-07-08  569  			compatible = "allwinner,sun50i-h616-i2c",
0d17c8651188816 Andre Przywara 2022-07-08  570  				     "allwinner,sun8i-v536-i2c",
0d17c8651188816 Andre Przywara 2022-07-08  571  				     "allwinner,sun6i-a31-i2c";
0d17c8651188816 Andre Przywara 2022-07-08  572  			reg = <0x05003000 0x400>;
0d17c8651188816 Andre Przywara 2022-07-08  573  			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  574  			clocks = <&ccu CLK_BUS_I2C4>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  575  			dmas = <&dma 47>, <&dma 47>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  576  			dma-names = "rx", "tx";
0d17c8651188816 Andre Przywara 2022-07-08  577  			resets = <&ccu RST_BUS_I2C4>;
0d17c8651188816 Andre Przywara 2022-07-08  578  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  579  			#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  580  			#size-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08  581  		};
0d17c8651188816 Andre Przywara 2022-07-08  582  
0d17c8651188816 Andre Przywara 2022-07-08  583  		spi0: spi@5010000 {
0d17c8651188816 Andre Przywara 2022-07-08  584  			compatible = "allwinner,sun50i-h616-spi",
0d17c8651188816 Andre Przywara 2022-07-08  585  				     "allwinner,sun8i-h3-spi";
0d17c8651188816 Andre Przywara 2022-07-08  586  			reg = <0x05010000 0x1000>;
0d17c8651188816 Andre Przywara 2022-07-08  587  			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  588  			clocks = <&ccu CLK_BUS_SPI0>, <&ccu CLK_SPI0>;
0d17c8651188816 Andre Przywara 2022-07-08  589  			clock-names = "ahb", "mod";
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  590  			dmas = <&dma 22>, <&dma 22>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  591  			dma-names = "rx", "tx";
0d17c8651188816 Andre Przywara 2022-07-08  592  			resets = <&ccu RST_BUS_SPI0>;
0d17c8651188816 Andre Przywara 2022-07-08  593  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  594  			#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  595  			#size-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08  596  		};
0d17c8651188816 Andre Przywara 2022-07-08  597  
0d17c8651188816 Andre Przywara 2022-07-08  598  		spi1: spi@5011000 {
0d17c8651188816 Andre Przywara 2022-07-08  599  			compatible = "allwinner,sun50i-h616-spi",
0d17c8651188816 Andre Przywara 2022-07-08  600  				     "allwinner,sun8i-h3-spi";
0d17c8651188816 Andre Przywara 2022-07-08  601  			reg = <0x05011000 0x1000>;
0d17c8651188816 Andre Przywara 2022-07-08  602  			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  603  			clocks = <&ccu CLK_BUS_SPI1>, <&ccu CLK_SPI1>;
0d17c8651188816 Andre Przywara 2022-07-08  604  			clock-names = "ahb", "mod";
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  605  			dmas = <&dma 23>, <&dma 23>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  606  			dma-names = "rx", "tx";
0d17c8651188816 Andre Przywara 2022-07-08  607  			resets = <&ccu RST_BUS_SPI1>;
0d17c8651188816 Andre Przywara 2022-07-08  608  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  609  			#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  610  			#size-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08  611  		};
0d17c8651188816 Andre Przywara 2022-07-08  612  
0d17c8651188816 Andre Przywara 2022-07-08  613  		emac0: ethernet@5020000 {
0d17c8651188816 Andre Przywara 2022-07-08  614  			compatible = "allwinner,sun50i-h616-emac0",
0d17c8651188816 Andre Przywara 2022-07-08  615  				     "allwinner,sun50i-a64-emac";
0d17c8651188816 Andre Przywara 2022-07-08  616  			reg = <0x05020000 0x10000>;
0d17c8651188816 Andre Przywara 2022-07-08  617  			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  618  			interrupt-names = "macirq";
0d17c8651188816 Andre Przywara 2022-07-08  619  			clocks = <&ccu CLK_BUS_EMAC0>;
0d17c8651188816 Andre Przywara 2022-07-08  620  			clock-names = "stmmaceth";
0d17c8651188816 Andre Przywara 2022-07-08  621  			resets = <&ccu RST_BUS_EMAC0>;
0d17c8651188816 Andre Przywara 2022-07-08  622  			reset-names = "stmmaceth";
0d17c8651188816 Andre Przywara 2022-07-08  623  			syscon = <&syscon>;
0d17c8651188816 Andre Przywara 2022-07-08  624  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  625  
0d17c8651188816 Andre Przywara 2022-07-08  626  			mdio0: mdio {
0d17c8651188816 Andre Przywara 2022-07-08  627  				compatible = "snps,dwmac-mdio";
0d17c8651188816 Andre Przywara 2022-07-08  628  				#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  629  				#size-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08  630  			};
0d17c8651188816 Andre Przywara 2022-07-08  631  		};
0d17c8651188816 Andre Przywara 2022-07-08  632  
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  633  		spdif: spdif@5093000 {
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  634  			compatible = "allwinner,sun50i-h616-spdif";
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  635  			reg = <0x05093000 0x400>;
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  636  			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  637  			clocks = <&ccu CLK_BUS_SPDIF>, <&ccu CLK_SPDIF>;
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  638  			clock-names = "apb", "spdif";
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  639  			resets = <&ccu RST_BUS_SPDIF>;
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  640  			dmas = <&dma 2>;
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  641  			dma-names = "tx";
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  642  			pinctrl-names = "default";
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  643  			pinctrl-0 = <&spdif_tx_pin>;
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  644  			#sound-dai-cells = <0>;
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  645  			status = "disabled";
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  646  		};
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  647  
b2dce8a4998084c Ryan Walklin   2024-09-29 @648  		codec: codec@05096000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
