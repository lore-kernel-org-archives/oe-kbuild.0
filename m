Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887618BEE
	for <oe-kbuild@lists.linux.dev>; Thu,  8 May 2025 16:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746721894; cv=none; b=lzDXLt4bfDO63b1pFYbRbImD7BwQoNWPMo8O6j52Si48GAF47cyXmDuB/W6Nkws0ezfhs1MpRBSQo2n+JJ6xVQraUTy+42GH0DscMEuv7Aahu69ux4RiPD4TxyfTCrDxey+qFurlRS4dwbLT4amaHSJw74Xl3+4UteXvRUBr/a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746721894; c=relaxed/simple;
	bh=s+SOdBBUtKcutIwndU0P/9Q3CgxGg/SfUYaBSEc7Y3g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z2ZxE2I95dYeRrc0d0s5SxRbDgcmx08NyvNQm8xNs4pQy3U8kY3wc7XdfRJD1SzVYS3ZHaxOambgY5kzST61f9lnMsbgolf34TMSbxRP5hsoYfqZ5TK0fDNaCgcMwwmP2JpNXO8spcWVgrhHGneFRcZ75POYOXtN9iNkssvW6SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ByjXq8AC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ByjXq8AC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746721891; x=1778257891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s+SOdBBUtKcutIwndU0P/9Q3CgxGg/SfUYaBSEc7Y3g=;
  b=ByjXq8ACc1ZbiLOghFsPSJQsYvUOMRRDijMGq+50I9NXWKYDZn2itpmG
   1mIweF/ubQNhhRwdSiMz8WTFjOspMEyoh+UoCxobsG7zHe/0dAltDnE3Y
   qmP266K7C9rCiuTldDjhX7pnbNW1CnIuS1ug0MNyEFebJMcz88AdmtHNT
   lNnLZcV1XaRr87aSGcHqFefuh3LI8LKIPH067F/Cnd5KRtUbZrL95RZWg
   gtygrZ1eFGs5e180y3gloY+w8WacMAyDZCaSQQ07bpPSUGMYtQbG9c4x5
   uLETZqwwufIGtB3oaZ+7Z+QLL6P0AxH+uOpc8pUGiAjMjmiLLE7gtRHpP
   A==;
X-CSE-ConnectionGUID: t8nYhzK+Siu+O8HwibArrw==
X-CSE-MsgGUID: RW5/JF7LRLuK8aDqLFjPZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="58730398"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="58730398"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 09:31:24 -0700
X-CSE-ConnectionGUID: 18hlpq0vQXikDkZ6XIqBxQ==
X-CSE-MsgGUID: hIcl5QJrRcmPHULxxc5ZaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="173532298"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 May 2025 09:31:20 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD49V-000BAZ-2I;
	Thu, 08 May 2025 16:31:17 +0000
Date: Fri, 9 May 2025 00:31:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH V9 21/24] arm64: dts: allwinner: h616: Add TCON nodes to
 H616 DTSI
Message-ID: <202505090037.kjlIx2Fw-lkp@intel.com>
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
In-Reply-To: <20250507201943.330111-22-macroalpha82@gmail.com>
References: <20250507201943.330111-22-macroalpha82@gmail.com>
TO: Chris Morgan <macroalpha82@gmail.com>
TO: linux-sunxi@lists.linux.dev
CC: devicetree@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: ryan@testtoast.com
CC: macromorgan@hotmail.com
CC: p.zabel@pengutronix.de
CC: tzimmermann@suse.de
CC: maarten.lankhorst@linux.intel.com
CC: simona@ffwll.ch
CC: airlied@gmail.com
CC: mripard@kernel.org
CC: samuel@sholland.org
CC: jernej.skrabec@gmail.com
CC: wens@csie.org
CC: conor+dt@kernel.org
CC: krzk+dt@kernel.org
CC: robh@kernel.org

Hi Chris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on pza/reset/next robh/for-next linus/master v6.15-rc5]
[cannot apply to sunxi/sunxi/for-next pza/imx-drm/next next-20250508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Morgan/dt-bindings-clock-sun50i-h616-ccu-Add-LVDS-reset/20250508-042430
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20250507201943.330111-22-macroalpha82%40gmail.com
patch subject: [PATCH V9 21/24] arm64: dts: allwinner: h616: Add TCON nodes to H616 DTSI
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250509/202505090037.kjlIx2Fw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090037.kjlIx2Fw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505090037.kjlIx2Fw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:157.6-1150.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:998.26-1006.7: Warning (avoid_unnecessary_addr_size): /soc/lcd-controller@6511000/ports/port@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:933.32-942.7: Warning (graph_child_address): /soc/tcon-top@6510000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:960.30-969.7: Warning (graph_child_address): /soc/tcon-top@6510000/ports/port@4: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:998.26-1006.7: Warning (graph_child_address): /soc/lcd-controller@6511000/ports/port@0: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary

vim +998 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi

0d17c8651188816 Andre Przywara 2022-07-08   16  
0d17c8651188816 Andre Przywara 2022-07-08   17  / {
0d17c8651188816 Andre Przywara 2022-07-08   18  	interrupt-parent = <&gic>;
0d17c8651188816 Andre Przywara 2022-07-08   19  	#address-cells = <2>;
0d17c8651188816 Andre Przywara 2022-07-08   20  	#size-cells = <2>;
0d17c8651188816 Andre Przywara 2022-07-08   21  
0d17c8651188816 Andre Przywara 2022-07-08   22  	cpus {
0d17c8651188816 Andre Przywara 2022-07-08   23  		#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08   24  		#size-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08   25  
0d17c8651188816 Andre Przywara 2022-07-08   26  		cpu0: cpu@0 {
0d17c8651188816 Andre Przywara 2022-07-08   27  			compatible = "arm,cortex-a53";
0d17c8651188816 Andre Przywara 2022-07-08   28  			device_type = "cpu";
0d17c8651188816 Andre Przywara 2022-07-08   29  			reg = <0>;
0d17c8651188816 Andre Przywara 2022-07-08   30  			enable-method = "psci";
0d17c8651188816 Andre Przywara 2022-07-08   31  			clocks = <&ccu CLK_CPUX>;
3e057e05b3b281b Martin Botka   2024-04-18   32  			#cooling-cells = <2>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   33  			i-cache-size = <0x8000>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   34  			i-cache-line-size = <64>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   35  			i-cache-sets = <256>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   36  			d-cache-size = <0x8000>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   37  			d-cache-line-size = <64>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   38  			d-cache-sets = <128>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   39  			next-level-cache = <&l2_cache>;
0d17c8651188816 Andre Przywara 2022-07-08   40  		};
0d17c8651188816 Andre Przywara 2022-07-08   41  
0d17c8651188816 Andre Przywara 2022-07-08   42  		cpu1: cpu@1 {
0d17c8651188816 Andre Przywara 2022-07-08   43  			compatible = "arm,cortex-a53";
0d17c8651188816 Andre Przywara 2022-07-08   44  			device_type = "cpu";
0d17c8651188816 Andre Przywara 2022-07-08   45  			reg = <1>;
0d17c8651188816 Andre Przywara 2022-07-08   46  			enable-method = "psci";
0d17c8651188816 Andre Przywara 2022-07-08   47  			clocks = <&ccu CLK_CPUX>;
3e057e05b3b281b Martin Botka   2024-04-18   48  			#cooling-cells = <2>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   49  			i-cache-size = <0x8000>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   50  			i-cache-line-size = <64>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   51  			i-cache-sets = <256>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   52  			d-cache-size = <0x8000>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   53  			d-cache-line-size = <64>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   54  			d-cache-sets = <128>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   55  			next-level-cache = <&l2_cache>;
0d17c8651188816 Andre Przywara 2022-07-08   56  		};
0d17c8651188816 Andre Przywara 2022-07-08   57  
0d17c8651188816 Andre Przywara 2022-07-08   58  		cpu2: cpu@2 {
0d17c8651188816 Andre Przywara 2022-07-08   59  			compatible = "arm,cortex-a53";
0d17c8651188816 Andre Przywara 2022-07-08   60  			device_type = "cpu";
0d17c8651188816 Andre Przywara 2022-07-08   61  			reg = <2>;
0d17c8651188816 Andre Przywara 2022-07-08   62  			enable-method = "psci";
0d17c8651188816 Andre Przywara 2022-07-08   63  			clocks = <&ccu CLK_CPUX>;
3e057e05b3b281b Martin Botka   2024-04-18   64  			#cooling-cells = <2>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   65  			i-cache-size = <0x8000>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   66  			i-cache-line-size = <64>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   67  			i-cache-sets = <256>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   68  			d-cache-size = <0x8000>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   69  			d-cache-line-size = <64>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   70  			d-cache-sets = <128>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   71  			next-level-cache = <&l2_cache>;
0d17c8651188816 Andre Przywara 2022-07-08   72  		};
0d17c8651188816 Andre Przywara 2022-07-08   73  
0d17c8651188816 Andre Przywara 2022-07-08   74  		cpu3: cpu@3 {
0d17c8651188816 Andre Przywara 2022-07-08   75  			compatible = "arm,cortex-a53";
0d17c8651188816 Andre Przywara 2022-07-08   76  			device_type = "cpu";
0d17c8651188816 Andre Przywara 2022-07-08   77  			reg = <3>;
0d17c8651188816 Andre Przywara 2022-07-08   78  			enable-method = "psci";
0d17c8651188816 Andre Przywara 2022-07-08   79  			clocks = <&ccu CLK_CPUX>;
3e057e05b3b281b Martin Botka   2024-04-18   80  			#cooling-cells = <2>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   81  			i-cache-size = <0x8000>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   82  			i-cache-line-size = <64>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   83  			i-cache-sets = <256>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   84  			d-cache-size = <0x8000>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   85  			d-cache-line-size = <64>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   86  			d-cache-sets = <128>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   87  			next-level-cache = <&l2_cache>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   88  		};
d4ec229eaeb8453 Dragan Simic   2024-05-28   89  
d4ec229eaeb8453 Dragan Simic   2024-05-28   90  		l2_cache: l2-cache {
d4ec229eaeb8453 Dragan Simic   2024-05-28   91  			compatible = "cache";
d4ec229eaeb8453 Dragan Simic   2024-05-28   92  			cache-level = <2>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   93  			cache-unified;
d4ec229eaeb8453 Dragan Simic   2024-05-28   94  			cache-size = <0x40000>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   95  			cache-line-size = <64>;
d4ec229eaeb8453 Dragan Simic   2024-05-28   96  			cache-sets = <256>;
0d17c8651188816 Andre Przywara 2022-07-08   97  		};
0d17c8651188816 Andre Przywara 2022-07-08   98  	};
0d17c8651188816 Andre Przywara 2022-07-08   99  
60a0991a3f8618f Chris Morgan   2025-05-07  100  	de: display-engine {
60a0991a3f8618f Chris Morgan   2025-05-07  101  		compatible = "allwinner,sun50i-h616-display-engine",
60a0991a3f8618f Chris Morgan   2025-05-07  102  			     "allwinner,sun50i-h6-display-engine";
60a0991a3f8618f Chris Morgan   2025-05-07  103  		allwinner,pipelines = <&mixer0>;
60a0991a3f8618f Chris Morgan   2025-05-07  104  		status = "disabled";
60a0991a3f8618f Chris Morgan   2025-05-07  105  	};
60a0991a3f8618f Chris Morgan   2025-05-07  106  
0d17c8651188816 Andre Przywara 2022-07-08  107  	reserved-memory {
0d17c8651188816 Andre Przywara 2022-07-08  108  		#address-cells = <2>;
0d17c8651188816 Andre Przywara 2022-07-08  109  		#size-cells = <2>;
0d17c8651188816 Andre Przywara 2022-07-08  110  		ranges;
0d17c8651188816 Andre Przywara 2022-07-08  111  
0d17c8651188816 Andre Przywara 2022-07-08  112  		/*
0d17c8651188816 Andre Przywara 2022-07-08  113  		 * 256 KiB reserved for Trusted Firmware-A (BL31).
0d17c8651188816 Andre Przywara 2022-07-08  114  		 * This is added by BL31 itself, but some bootloaders fail
0d17c8651188816 Andre Przywara 2022-07-08  115  		 * to propagate this into the DTB handed to kernels.
0d17c8651188816 Andre Przywara 2022-07-08  116  		 */
0d17c8651188816 Andre Przywara 2022-07-08  117  		secmon@40000000 {
0d17c8651188816 Andre Przywara 2022-07-08  118  			reg = <0x0 0x40000000 0x0 0x40000>;
0d17c8651188816 Andre Przywara 2022-07-08  119  			no-map;
0d17c8651188816 Andre Przywara 2022-07-08  120  		};
0d17c8651188816 Andre Przywara 2022-07-08  121  	};
0d17c8651188816 Andre Przywara 2022-07-08  122  
0d17c8651188816 Andre Przywara 2022-07-08  123  	osc24M: osc24M-clk {
0d17c8651188816 Andre Przywara 2022-07-08  124  		#clock-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08  125  		compatible = "fixed-clock";
0d17c8651188816 Andre Przywara 2022-07-08  126  		clock-frequency = <24000000>;
0d17c8651188816 Andre Przywara 2022-07-08  127  		clock-output-names = "osc24M";
0d17c8651188816 Andre Przywara 2022-07-08  128  	};
0d17c8651188816 Andre Przywara 2022-07-08  129  
0d17c8651188816 Andre Przywara 2022-07-08  130  	pmu {
0d17c8651188816 Andre Przywara 2022-07-08  131  		compatible = "arm,cortex-a53-pmu";
0d17c8651188816 Andre Przywara 2022-07-08  132  		interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
0d17c8651188816 Andre Przywara 2022-07-08  133  			     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
0d17c8651188816 Andre Przywara 2022-07-08  134  			     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
0d17c8651188816 Andre Przywara 2022-07-08  135  			     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  136  		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
0d17c8651188816 Andre Przywara 2022-07-08  137  	};
0d17c8651188816 Andre Przywara 2022-07-08  138  
0d17c8651188816 Andre Przywara 2022-07-08  139  	psci {
0d17c8651188816 Andre Przywara 2022-07-08  140  		compatible = "arm,psci-0.2";
0d17c8651188816 Andre Przywara 2022-07-08  141  		method = "smc";
0d17c8651188816 Andre Przywara 2022-07-08  142  	};
0d17c8651188816 Andre Przywara 2022-07-08  143  
0d17c8651188816 Andre Przywara 2022-07-08  144  	timer {
0d17c8651188816 Andre Przywara 2022-07-08  145  		compatible = "arm,armv8-timer";
0d17c8651188816 Andre Przywara 2022-07-08  146  		arm,no-tick-in-suspend;
0d17c8651188816 Andre Przywara 2022-07-08  147  		interrupts = <GIC_PPI 13
0d17c8651188816 Andre Przywara 2022-07-08  148  			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
0d17c8651188816 Andre Przywara 2022-07-08  149  			     <GIC_PPI 14
0d17c8651188816 Andre Przywara 2022-07-08  150  			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
0d17c8651188816 Andre Przywara 2022-07-08  151  			     <GIC_PPI 11
0d17c8651188816 Andre Przywara 2022-07-08  152  			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
0d17c8651188816 Andre Przywara 2022-07-08  153  			     <GIC_PPI 10
0d17c8651188816 Andre Przywara 2022-07-08  154  			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
0d17c8651188816 Andre Przywara 2022-07-08  155  	};
0d17c8651188816 Andre Przywara 2022-07-08  156  
0d17c8651188816 Andre Przywara 2022-07-08  157  	soc {
0d17c8651188816 Andre Przywara 2022-07-08  158  		compatible = "simple-bus";
0d17c8651188816 Andre Przywara 2022-07-08  159  		#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  160  		#size-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  161  		ranges = <0x0 0x0 0x0 0x40000000>;
0d17c8651188816 Andre Przywara 2022-07-08  162  
60a0991a3f8618f Chris Morgan   2025-05-07  163  		bus: bus@1000000 {
60a0991a3f8618f Chris Morgan   2025-05-07  164  			compatible = "allwinner,sun50i-h616-de33",
60a0991a3f8618f Chris Morgan   2025-05-07  165  				     "allwinner,sun50i-a64-de2";
60a0991a3f8618f Chris Morgan   2025-05-07  166  			reg = <0x1000000 0x400000>;
60a0991a3f8618f Chris Morgan   2025-05-07  167  			allwinner,sram = <&de33_sram 1>;
60a0991a3f8618f Chris Morgan   2025-05-07  168  			#address-cells = <1>;
60a0991a3f8618f Chris Morgan   2025-05-07  169  			#size-cells = <1>;
60a0991a3f8618f Chris Morgan   2025-05-07  170  			ranges = <0 0x1000000 0x400000>;
60a0991a3f8618f Chris Morgan   2025-05-07  171  
60a0991a3f8618f Chris Morgan   2025-05-07  172  			display_clocks: clock@8000 {
60a0991a3f8618f Chris Morgan   2025-05-07  173  				compatible = "allwinner,sun50i-h616-de33-clk";
60a0991a3f8618f Chris Morgan   2025-05-07  174  				reg = <0x8000 0x100>;
60a0991a3f8618f Chris Morgan   2025-05-07  175  				clocks = <&ccu CLK_BUS_DE>, <&ccu CLK_DE>;
60a0991a3f8618f Chris Morgan   2025-05-07  176  				clock-names = "bus", "mod";
60a0991a3f8618f Chris Morgan   2025-05-07  177  				resets = <&ccu RST_BUS_DE>;
60a0991a3f8618f Chris Morgan   2025-05-07  178  				#clock-cells = <1>;
60a0991a3f8618f Chris Morgan   2025-05-07  179  				#reset-cells = <1>;
60a0991a3f8618f Chris Morgan   2025-05-07  180  			};
60a0991a3f8618f Chris Morgan   2025-05-07  181  
60a0991a3f8618f Chris Morgan   2025-05-07  182  			mixer0: mixer@100000 {
60a0991a3f8618f Chris Morgan   2025-05-07  183  				compatible = "allwinner,sun50i-h616-de33-mixer-0";
60a0991a3f8618f Chris Morgan   2025-05-07  184  				reg = <0x100000 0x100000>,
60a0991a3f8618f Chris Morgan   2025-05-07  185  				      <0x8100 0x40>,
60a0991a3f8618f Chris Morgan   2025-05-07  186  				      <0x280000 0x20000>;
60a0991a3f8618f Chris Morgan   2025-05-07  187  				reg-names = "layers", "top", "display";
60a0991a3f8618f Chris Morgan   2025-05-07  188  				clocks = <&display_clocks CLK_BUS_MIXER0>,
60a0991a3f8618f Chris Morgan   2025-05-07  189  					 <&display_clocks CLK_MIXER0>;
60a0991a3f8618f Chris Morgan   2025-05-07  190  				clock-names = "bus", "mod";
60a0991a3f8618f Chris Morgan   2025-05-07  191  				resets = <&display_clocks RST_MIXER0>;
60a0991a3f8618f Chris Morgan   2025-05-07  192  				iommus = <&iommu 0>;
60a0991a3f8618f Chris Morgan   2025-05-07  193  
60a0991a3f8618f Chris Morgan   2025-05-07  194  				ports {
60a0991a3f8618f Chris Morgan   2025-05-07  195  					#address-cells = <1>;
60a0991a3f8618f Chris Morgan   2025-05-07  196  					#size-cells = <0>;
60a0991a3f8618f Chris Morgan   2025-05-07  197  
60a0991a3f8618f Chris Morgan   2025-05-07  198  					mixer0_out: port@1 {
60a0991a3f8618f Chris Morgan   2025-05-07  199  						reg = <1>;
60a0991a3f8618f Chris Morgan   2025-05-07  200  
60a0991a3f8618f Chris Morgan   2025-05-07  201  						mixer0_out_tcon_top_mixer0: endpoint {
60a0991a3f8618f Chris Morgan   2025-05-07  202  							remote-endpoint = <&tcon_top_mixer0_in_mixer0>;
60a0991a3f8618f Chris Morgan   2025-05-07  203  						};
60a0991a3f8618f Chris Morgan   2025-05-07  204  					};
60a0991a3f8618f Chris Morgan   2025-05-07  205  				};
60a0991a3f8618f Chris Morgan   2025-05-07  206  			};
60a0991a3f8618f Chris Morgan   2025-05-07  207  		};
60a0991a3f8618f Chris Morgan   2025-05-07  208  
6ed9a85f1c44d70 Andre Przywara 2024-06-25  209  		crypto: crypto@1904000 {
6ed9a85f1c44d70 Andre Przywara 2024-06-25  210  			compatible = "allwinner,sun50i-h616-crypto";
6ed9a85f1c44d70 Andre Przywara 2024-06-25  211  			reg = <0x01904000 0x800>;
6ed9a85f1c44d70 Andre Przywara 2024-06-25  212  			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
6ed9a85f1c44d70 Andre Przywara 2024-06-25  213  			clocks = <&ccu CLK_BUS_CE>, <&ccu CLK_CE>,
6ed9a85f1c44d70 Andre Przywara 2024-06-25  214  				 <&ccu CLK_MBUS_CE>, <&rtc CLK_IOSC>;
6ed9a85f1c44d70 Andre Przywara 2024-06-25  215  			clock-names = "bus", "mod", "ram", "trng";
6ed9a85f1c44d70 Andre Przywara 2024-06-25  216  			resets = <&ccu RST_BUS_CE>;
6ed9a85f1c44d70 Andre Przywara 2024-06-25  217  		};
6ed9a85f1c44d70 Andre Przywara 2024-06-25  218  
0d17c8651188816 Andre Przywara 2022-07-08  219  		syscon: syscon@3000000 {
0d17c8651188816 Andre Przywara 2022-07-08  220  			compatible = "allwinner,sun50i-h616-system-control";
0d17c8651188816 Andre Przywara 2022-07-08  221  			reg = <0x03000000 0x1000>;
0d17c8651188816 Andre Przywara 2022-07-08  222  			#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  223  			#size-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  224  			ranges;
0d17c8651188816 Andre Przywara 2022-07-08  225  
0d17c8651188816 Andre Przywara 2022-07-08  226  			sram_c: sram@28000 {
0d17c8651188816 Andre Przywara 2022-07-08  227  				compatible = "mmio-sram";
0d17c8651188816 Andre Przywara 2022-07-08  228  				reg = <0x00028000 0x30000>;
0d17c8651188816 Andre Przywara 2022-07-08  229  				#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  230  				#size-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  231  				ranges = <0 0x00028000 0x30000>;
60a0991a3f8618f Chris Morgan   2025-05-07  232  
60a0991a3f8618f Chris Morgan   2025-05-07  233  				de33_sram: sram-section@0 {
60a0991a3f8618f Chris Morgan   2025-05-07  234  					compatible = "allwinner,sun50i-h616-sram-c",
60a0991a3f8618f Chris Morgan   2025-05-07  235  						     "allwinner,sun50i-a64-sram-c";
60a0991a3f8618f Chris Morgan   2025-05-07  236  					reg = <0x0000 0x1e000>;
60a0991a3f8618f Chris Morgan   2025-05-07  237  				};
0d17c8651188816 Andre Przywara 2022-07-08  238  			};
0d17c8651188816 Andre Przywara 2022-07-08  239  		};
0d17c8651188816 Andre Przywara 2022-07-08  240  
0d17c8651188816 Andre Przywara 2022-07-08  241  		ccu: clock@3001000 {
0d17c8651188816 Andre Przywara 2022-07-08  242  			compatible = "allwinner,sun50i-h616-ccu";
0d17c8651188816 Andre Przywara 2022-07-08  243  			reg = <0x03001000 0x1000>;
0d17c8651188816 Andre Przywara 2022-07-08  244  			clocks = <&osc24M>, <&rtc CLK_OSC32K>, <&rtc CLK_IOSC>;
0d17c8651188816 Andre Przywara 2022-07-08  245  			clock-names = "hosc", "losc", "iosc";
0d17c8651188816 Andre Przywara 2022-07-08  246  			#clock-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  247  			#reset-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  248  		};
0d17c8651188816 Andre Przywara 2022-07-08  249  
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  250  		dma: dma-controller@3002000 {
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  251  			compatible = "allwinner,sun50i-h616-dma",
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  252  				     "allwinner,sun50i-a100-dma";
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  253  			reg = <0x03002000 0x1000>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  254  			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  255  			clocks = <&ccu CLK_BUS_DMA>, <&ccu CLK_MBUS_DMA>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  256  			clock-names = "bus", "mbus";
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  257  			dma-channels = <16>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  258  			dma-requests = <49>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  259  			resets = <&ccu RST_BUS_DMA>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  260  			#dma-cells = <1>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  261  		};
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  262  
951992797378a21 Martin Botka   2023-09-12  263  		sid: efuse@3006000 {
951992797378a21 Martin Botka   2023-09-12  264  			compatible = "allwinner,sun50i-h616-sid", "allwinner,sun50i-a64-sid";
951992797378a21 Martin Botka   2023-09-12  265  			reg = <0x03006000 0x1000>;
951992797378a21 Martin Botka   2023-09-12  266  			#address-cells = <1>;
951992797378a21 Martin Botka   2023-09-12  267  			#size-cells = <1>;
f4318af40544b8e Martin Botka   2024-02-19  268  
f4318af40544b8e Martin Botka   2024-02-19  269  			ths_calibration: thermal-sensor-calibration@14 {
f4318af40544b8e Martin Botka   2024-02-19  270  				reg = <0x14 0x8>;
f4318af40544b8e Martin Botka   2024-02-19  271  			};
3e057e05b3b281b Martin Botka   2024-04-18  272  
3e057e05b3b281b Martin Botka   2024-04-18  273  			cpu_speed_grade: cpu-speed-grade@0 {
3e057e05b3b281b Martin Botka   2024-04-18  274  				reg = <0x0 2>;
3e057e05b3b281b Martin Botka   2024-04-18  275  			};
951992797378a21 Martin Botka   2023-09-12  276  		};
951992797378a21 Martin Botka   2023-09-12  277  
0d17c8651188816 Andre Przywara 2022-07-08  278  		watchdog: watchdog@30090a0 {
0d17c8651188816 Andre Przywara 2022-07-08  279  			compatible = "allwinner,sun50i-h616-wdt",
0d17c8651188816 Andre Przywara 2022-07-08  280  				     "allwinner,sun6i-a31-wdt";
0d17c8651188816 Andre Przywara 2022-07-08  281  			reg = <0x030090a0 0x20>;
0d17c8651188816 Andre Przywara 2022-07-08  282  			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  283  			clocks = <&osc24M>;
0d17c8651188816 Andre Przywara 2022-07-08  284  		};
0d17c8651188816 Andre Przywara 2022-07-08  285  
0d17c8651188816 Andre Przywara 2022-07-08  286  		pio: pinctrl@300b000 {
0d17c8651188816 Andre Przywara 2022-07-08  287  			compatible = "allwinner,sun50i-h616-pinctrl";
0d17c8651188816 Andre Przywara 2022-07-08  288  			reg = <0x0300b000 0x400>;
0d17c8651188816 Andre Przywara 2022-07-08  289  			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
0d17c8651188816 Andre Przywara 2022-07-08  290  				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
0d17c8651188816 Andre Przywara 2022-07-08  291  				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
0d17c8651188816 Andre Przywara 2022-07-08  292  				     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
0d17c8651188816 Andre Przywara 2022-07-08  293  				     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
0d17c8651188816 Andre Przywara 2022-07-08  294  				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
0d17c8651188816 Andre Przywara 2022-07-08  295  				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
0d17c8651188816 Andre Przywara 2022-07-08  296  				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  297  			clocks = <&ccu CLK_APB1>, <&osc24M>, <&rtc CLK_OSC32K>;
0d17c8651188816 Andre Przywara 2022-07-08  298  			clock-names = "apb", "hosc", "losc";
0d17c8651188816 Andre Przywara 2022-07-08  299  			gpio-controller;
0d17c8651188816 Andre Przywara 2022-07-08  300  			#gpio-cells = <3>;
0d17c8651188816 Andre Przywara 2022-07-08  301  			interrupt-controller;
0d17c8651188816 Andre Przywara 2022-07-08  302  			#interrupt-cells = <3>;
0d17c8651188816 Andre Przywara 2022-07-08  303  
0d17c8651188816 Andre Przywara 2022-07-08  304  			ext_rgmii_pins: rgmii-pins {
0d17c8651188816 Andre Przywara 2022-07-08  305  				pins = "PI0", "PI1", "PI2", "PI3", "PI4",
0d17c8651188816 Andre Przywara 2022-07-08  306  				       "PI5", "PI7", "PI8", "PI9", "PI10",
0d17c8651188816 Andre Przywara 2022-07-08  307  				       "PI11", "PI12", "PI13", "PI14", "PI15",
0d17c8651188816 Andre Przywara 2022-07-08  308  				       "PI16";
0d17c8651188816 Andre Przywara 2022-07-08  309  				function = "emac0";
0d17c8651188816 Andre Przywara 2022-07-08  310  				drive-strength = <40>;
0d17c8651188816 Andre Przywara 2022-07-08  311  			};
0d17c8651188816 Andre Przywara 2022-07-08  312  
0d17c8651188816 Andre Przywara 2022-07-08  313  			i2c0_pins: i2c0-pins {
5bdeb3d2e240e59 Andre Przywara 2024-03-29  314  				pins = "PI5", "PI6";
0d17c8651188816 Andre Przywara 2022-07-08  315  				function = "i2c0";
0d17c8651188816 Andre Przywara 2022-07-08  316  			};
0d17c8651188816 Andre Przywara 2022-07-08  317  
0d17c8651188816 Andre Przywara 2022-07-08  318  			i2c3_ph_pins: i2c3-ph-pins {
0d17c8651188816 Andre Przywara 2022-07-08  319  				pins = "PH4", "PH5";
0d17c8651188816 Andre Przywara 2022-07-08  320  				function = "i2c3";
0d17c8651188816 Andre Przywara 2022-07-08  321  			};
0d17c8651188816 Andre Przywara 2022-07-08  322  
0d17c8651188816 Andre Przywara 2022-07-08  323  			ir_rx_pin: ir-rx-pin {
0d17c8651188816 Andre Przywara 2022-07-08  324  				pins = "PH10";
0d17c8651188816 Andre Przywara 2022-07-08  325  				function = "ir_rx";
0d17c8651188816 Andre Przywara 2022-07-08  326  			};
0d17c8651188816 Andre Przywara 2022-07-08  327  
0d17c8651188816 Andre Przywara 2022-07-08  328  			mmc0_pins: mmc0-pins {
0d17c8651188816 Andre Przywara 2022-07-08  329  				pins = "PF0", "PF1", "PF2", "PF3",
0d17c8651188816 Andre Przywara 2022-07-08  330  				       "PF4", "PF5";
0d17c8651188816 Andre Przywara 2022-07-08  331  				function = "mmc0";
0d17c8651188816 Andre Przywara 2022-07-08  332  				drive-strength = <30>;
0d17c8651188816 Andre Przywara 2022-07-08  333  				bias-pull-up;
0d17c8651188816 Andre Przywara 2022-07-08  334  			};
0d17c8651188816 Andre Przywara 2022-07-08  335  
0d17c8651188816 Andre Przywara 2022-07-08  336  			/omit-if-no-ref/
0d17c8651188816 Andre Przywara 2022-07-08  337  			mmc1_pins: mmc1-pins {
0d17c8651188816 Andre Przywara 2022-07-08  338  				pins = "PG0", "PG1", "PG2", "PG3",
0d17c8651188816 Andre Przywara 2022-07-08  339  				       "PG4", "PG5";
0d17c8651188816 Andre Przywara 2022-07-08  340  				function = "mmc1";
0d17c8651188816 Andre Przywara 2022-07-08  341  				drive-strength = <30>;
0d17c8651188816 Andre Przywara 2022-07-08  342  				bias-pull-up;
0d17c8651188816 Andre Przywara 2022-07-08  343  			};
0d17c8651188816 Andre Przywara 2022-07-08  344  
0d17c8651188816 Andre Przywara 2022-07-08  345  			mmc2_pins: mmc2-pins {
0d17c8651188816 Andre Przywara 2022-07-08  346  				pins = "PC0", "PC1", "PC5", "PC6",
0d17c8651188816 Andre Przywara 2022-07-08  347  				       "PC8", "PC9", "PC10", "PC11",
0d17c8651188816 Andre Przywara 2022-07-08  348  				       "PC13", "PC14", "PC15", "PC16";
0d17c8651188816 Andre Przywara 2022-07-08  349  				function = "mmc2";
0d17c8651188816 Andre Przywara 2022-07-08  350  				drive-strength = <30>;
0d17c8651188816 Andre Przywara 2022-07-08  351  				bias-pull-up;
0d17c8651188816 Andre Przywara 2022-07-08  352  			};
0d17c8651188816 Andre Przywara 2022-07-08  353  
0d17c8651188816 Andre Przywara 2022-07-08  354  			/omit-if-no-ref/
0d17c8651188816 Andre Przywara 2022-07-08  355  			spi0_pins: spi0-pins {
0d17c8651188816 Andre Przywara 2022-07-08  356  				pins = "PC0", "PC2", "PC4";
0d17c8651188816 Andre Przywara 2022-07-08  357  				function = "spi0";
0d17c8651188816 Andre Przywara 2022-07-08  358  			};
0d17c8651188816 Andre Przywara 2022-07-08  359  
0d17c8651188816 Andre Przywara 2022-07-08  360  			/omit-if-no-ref/
0d17c8651188816 Andre Przywara 2022-07-08  361  			spi0_cs0_pin: spi0-cs0-pin {
0d17c8651188816 Andre Przywara 2022-07-08  362  				pins = "PC3";
0d17c8651188816 Andre Przywara 2022-07-08  363  				function = "spi0";
0d17c8651188816 Andre Przywara 2022-07-08  364  			};
0d17c8651188816 Andre Przywara 2022-07-08  365  
0d17c8651188816 Andre Przywara 2022-07-08  366  			/omit-if-no-ref/
0d17c8651188816 Andre Przywara 2022-07-08  367  			spi1_pins: spi1-pins {
0d17c8651188816 Andre Przywara 2022-07-08  368  				pins = "PH6", "PH7", "PH8";
0d17c8651188816 Andre Przywara 2022-07-08  369  				function = "spi1";
0d17c8651188816 Andre Przywara 2022-07-08  370  			};
0d17c8651188816 Andre Przywara 2022-07-08  371  
0d17c8651188816 Andre Przywara 2022-07-08  372  			/omit-if-no-ref/
0d17c8651188816 Andre Przywara 2022-07-08  373  			spi1_cs0_pin: spi1-cs0-pin {
0d17c8651188816 Andre Przywara 2022-07-08  374  				pins = "PH5";
0d17c8651188816 Andre Przywara 2022-07-08  375  				function = "spi1";
0d17c8651188816 Andre Przywara 2022-07-08  376  			};
0d17c8651188816 Andre Przywara 2022-07-08  377  
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  378  			spdif_tx_pin: spdif-tx-pin {
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  379  				pins = "PH4";
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  380  				function = "spdif";
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  381  			};
fe5128a11f9b5c4 Chen-Yu Tsai   2024-01-28  382  
0d17c8651188816 Andre Przywara 2022-07-08  383  			uart0_ph_pins: uart0-ph-pins {
0d17c8651188816 Andre Przywara 2022-07-08  384  				pins = "PH0", "PH1";
0d17c8651188816 Andre Przywara 2022-07-08  385  				function = "uart0";
0d17c8651188816 Andre Przywara 2022-07-08  386  			};
0d17c8651188816 Andre Przywara 2022-07-08  387  
0d17c8651188816 Andre Przywara 2022-07-08  388  			/omit-if-no-ref/
0d17c8651188816 Andre Przywara 2022-07-08  389  			uart1_pins: uart1-pins {
0d17c8651188816 Andre Przywara 2022-07-08  390  				pins = "PG6", "PG7";
0d17c8651188816 Andre Przywara 2022-07-08  391  				function = "uart1";
0d17c8651188816 Andre Przywara 2022-07-08  392  			};
0d17c8651188816 Andre Przywara 2022-07-08  393  
0d17c8651188816 Andre Przywara 2022-07-08  394  			/omit-if-no-ref/
0d17c8651188816 Andre Przywara 2022-07-08  395  			uart1_rts_cts_pins: uart1-rts-cts-pins {
0d17c8651188816 Andre Przywara 2022-07-08  396  				pins = "PG8", "PG9";
0d17c8651188816 Andre Przywara 2022-07-08  397  				function = "uart1";
0d17c8651188816 Andre Przywara 2022-07-08  398  			};
9583c8d91491f51 Andre Przywara 2024-02-09  399  
9583c8d91491f51 Andre Przywara 2024-02-09  400  			/omit-if-no-ref/
9583c8d91491f51 Andre Przywara 2024-02-09  401  			x32clk_fanout_pin: x32clk-fanout-pin {
9583c8d91491f51 Andre Przywara 2024-02-09  402  				pins = "PG10";
9583c8d91491f51 Andre Przywara 2024-02-09  403  				function = "clock";
9583c8d91491f51 Andre Przywara 2024-02-09  404  			};
0d17c8651188816 Andre Przywara 2022-07-08  405  		};
0d17c8651188816 Andre Przywara 2022-07-08  406  
0d17c8651188816 Andre Przywara 2022-07-08  407  		gic: interrupt-controller@3021000 {
0d17c8651188816 Andre Przywara 2022-07-08  408  			compatible = "arm,gic-400";
0d17c8651188816 Andre Przywara 2022-07-08  409  			reg = <0x03021000 0x1000>,
0d17c8651188816 Andre Przywara 2022-07-08  410  			      <0x03022000 0x2000>,
0d17c8651188816 Andre Przywara 2022-07-08  411  			      <0x03024000 0x2000>,
0d17c8651188816 Andre Przywara 2022-07-08  412  			      <0x03026000 0x2000>;
0d17c8651188816 Andre Przywara 2022-07-08  413  			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
0d17c8651188816 Andre Przywara 2022-07-08  414  			interrupt-controller;
0d17c8651188816 Andre Przywara 2022-07-08  415  			#interrupt-cells = <3>;
0d17c8651188816 Andre Przywara 2022-07-08  416  		};
0d17c8651188816 Andre Przywara 2022-07-08  417  
0c85e2e377c368e Andre Przywara 2024-06-16  418  		iommu: iommu@30f0000 {
0c85e2e377c368e Andre Przywara 2024-06-16  419  			compatible = "allwinner,sun50i-h616-iommu";
0c85e2e377c368e Andre Przywara 2024-06-16  420  			reg = <0x030f0000 0x10000>;
0c85e2e377c368e Andre Przywara 2024-06-16  421  			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
0c85e2e377c368e Andre Przywara 2024-06-16  422  			clocks = <&ccu CLK_BUS_IOMMU>;
0c85e2e377c368e Andre Przywara 2024-06-16  423  			resets = <&ccu RST_BUS_IOMMU>;
0c85e2e377c368e Andre Przywara 2024-06-16  424  			#iommu-cells = <1>;
0c85e2e377c368e Andre Przywara 2024-06-16  425  		};
0c85e2e377c368e Andre Przywara 2024-06-16  426  
0d17c8651188816 Andre Przywara 2022-07-08  427  		mmc0: mmc@4020000 {
0d17c8651188816 Andre Przywara 2022-07-08  428  			compatible = "allwinner,sun50i-h616-mmc",
0d17c8651188816 Andre Przywara 2022-07-08  429  				     "allwinner,sun50i-a100-mmc";
0d17c8651188816 Andre Przywara 2022-07-08  430  			reg = <0x04020000 0x1000>;
0d17c8651188816 Andre Przywara 2022-07-08  431  			clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
0d17c8651188816 Andre Przywara 2022-07-08  432  			clock-names = "ahb", "mmc";
0d17c8651188816 Andre Przywara 2022-07-08  433  			resets = <&ccu RST_BUS_MMC0>;
0d17c8651188816 Andre Przywara 2022-07-08  434  			reset-names = "ahb";
0d17c8651188816 Andre Przywara 2022-07-08  435  			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  436  			pinctrl-names = "default";
0d17c8651188816 Andre Przywara 2022-07-08  437  			pinctrl-0 = <&mmc0_pins>;
0d17c8651188816 Andre Przywara 2022-07-08  438  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  439  			max-frequency = <150000000>;
0d17c8651188816 Andre Przywara 2022-07-08  440  			cap-sd-highspeed;
0d17c8651188816 Andre Przywara 2022-07-08  441  			cap-mmc-highspeed;
0d17c8651188816 Andre Przywara 2022-07-08  442  			mmc-ddr-3_3v;
0d17c8651188816 Andre Przywara 2022-07-08  443  			cap-sdio-irq;
0d17c8651188816 Andre Przywara 2022-07-08  444  			#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  445  			#size-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08  446  		};
0d17c8651188816 Andre Przywara 2022-07-08  447  
0d17c8651188816 Andre Przywara 2022-07-08  448  		mmc1: mmc@4021000 {
0d17c8651188816 Andre Przywara 2022-07-08  449  			compatible = "allwinner,sun50i-h616-mmc",
0d17c8651188816 Andre Przywara 2022-07-08  450  				     "allwinner,sun50i-a100-mmc";
0d17c8651188816 Andre Przywara 2022-07-08  451  			reg = <0x04021000 0x1000>;
0d17c8651188816 Andre Przywara 2022-07-08  452  			clocks = <&ccu CLK_BUS_MMC1>, <&ccu CLK_MMC1>;
0d17c8651188816 Andre Przywara 2022-07-08  453  			clock-names = "ahb", "mmc";
0d17c8651188816 Andre Przywara 2022-07-08  454  			resets = <&ccu RST_BUS_MMC1>;
0d17c8651188816 Andre Przywara 2022-07-08  455  			reset-names = "ahb";
0d17c8651188816 Andre Przywara 2022-07-08  456  			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  457  			pinctrl-names = "default";
0d17c8651188816 Andre Przywara 2022-07-08  458  			pinctrl-0 = <&mmc1_pins>;
0d17c8651188816 Andre Przywara 2022-07-08  459  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  460  			max-frequency = <150000000>;
0d17c8651188816 Andre Przywara 2022-07-08  461  			cap-sd-highspeed;
0d17c8651188816 Andre Przywara 2022-07-08  462  			cap-mmc-highspeed;
0d17c8651188816 Andre Przywara 2022-07-08  463  			mmc-ddr-3_3v;
0d17c8651188816 Andre Przywara 2022-07-08  464  			cap-sdio-irq;
0d17c8651188816 Andre Przywara 2022-07-08  465  			#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  466  			#size-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08  467  		};
0d17c8651188816 Andre Przywara 2022-07-08  468  
0d17c8651188816 Andre Przywara 2022-07-08  469  		mmc2: mmc@4022000 {
0d17c8651188816 Andre Przywara 2022-07-08  470  			compatible = "allwinner,sun50i-h616-emmc",
0d17c8651188816 Andre Przywara 2022-07-08  471  				     "allwinner,sun50i-a100-emmc";
0d17c8651188816 Andre Przywara 2022-07-08  472  			reg = <0x04022000 0x1000>;
0d17c8651188816 Andre Przywara 2022-07-08  473  			clocks = <&ccu CLK_BUS_MMC2>, <&ccu CLK_MMC2>;
0d17c8651188816 Andre Przywara 2022-07-08  474  			clock-names = "ahb", "mmc";
0d17c8651188816 Andre Przywara 2022-07-08  475  			resets = <&ccu RST_BUS_MMC2>;
0d17c8651188816 Andre Przywara 2022-07-08  476  			reset-names = "ahb";
0d17c8651188816 Andre Przywara 2022-07-08  477  			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  478  			pinctrl-names = "default";
0d17c8651188816 Andre Przywara 2022-07-08  479  			pinctrl-0 = <&mmc2_pins>;
0d17c8651188816 Andre Przywara 2022-07-08  480  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  481  			max-frequency = <150000000>;
0d17c8651188816 Andre Przywara 2022-07-08  482  			cap-sd-highspeed;
0d17c8651188816 Andre Przywara 2022-07-08  483  			cap-mmc-highspeed;
0d17c8651188816 Andre Przywara 2022-07-08  484  			mmc-ddr-3_3v;
0d17c8651188816 Andre Przywara 2022-07-08  485  			cap-sdio-irq;
0d17c8651188816 Andre Przywara 2022-07-08  486  			#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  487  			#size-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08  488  		};
0d17c8651188816 Andre Przywara 2022-07-08  489  
0d17c8651188816 Andre Przywara 2022-07-08  490  		uart0: serial@5000000 {
0d17c8651188816 Andre Przywara 2022-07-08  491  			compatible = "snps,dw-apb-uart";
0d17c8651188816 Andre Przywara 2022-07-08  492  			reg = <0x05000000 0x400>;
0d17c8651188816 Andre Przywara 2022-07-08  493  			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  494  			reg-shift = <2>;
0d17c8651188816 Andre Przywara 2022-07-08  495  			reg-io-width = <4>;
0d17c8651188816 Andre Przywara 2022-07-08  496  			clocks = <&ccu CLK_BUS_UART0>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  497  			dmas = <&dma 14>, <&dma 14>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  498  			dma-names = "tx", "rx";
0d17c8651188816 Andre Przywara 2022-07-08  499  			resets = <&ccu RST_BUS_UART0>;
0d17c8651188816 Andre Przywara 2022-07-08  500  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  501  		};
0d17c8651188816 Andre Przywara 2022-07-08  502  
0d17c8651188816 Andre Przywara 2022-07-08  503  		uart1: serial@5000400 {
0d17c8651188816 Andre Przywara 2022-07-08  504  			compatible = "snps,dw-apb-uart";
0d17c8651188816 Andre Przywara 2022-07-08  505  			reg = <0x05000400 0x400>;
0d17c8651188816 Andre Przywara 2022-07-08  506  			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  507  			reg-shift = <2>;
0d17c8651188816 Andre Przywara 2022-07-08  508  			reg-io-width = <4>;
0d17c8651188816 Andre Przywara 2022-07-08  509  			clocks = <&ccu CLK_BUS_UART1>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  510  			dmas = <&dma 15>, <&dma 15>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  511  			dma-names = "tx", "rx";
0d17c8651188816 Andre Przywara 2022-07-08  512  			resets = <&ccu RST_BUS_UART1>;
0d17c8651188816 Andre Przywara 2022-07-08  513  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  514  		};
0d17c8651188816 Andre Przywara 2022-07-08  515  
0d17c8651188816 Andre Przywara 2022-07-08  516  		uart2: serial@5000800 {
0d17c8651188816 Andre Przywara 2022-07-08  517  			compatible = "snps,dw-apb-uart";
0d17c8651188816 Andre Przywara 2022-07-08  518  			reg = <0x05000800 0x400>;
0d17c8651188816 Andre Przywara 2022-07-08  519  			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  520  			reg-shift = <2>;
0d17c8651188816 Andre Przywara 2022-07-08  521  			reg-io-width = <4>;
0d17c8651188816 Andre Przywara 2022-07-08  522  			clocks = <&ccu CLK_BUS_UART2>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  523  			dmas = <&dma 16>, <&dma 16>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  524  			dma-names = "tx", "rx";
0d17c8651188816 Andre Przywara 2022-07-08  525  			resets = <&ccu RST_BUS_UART2>;
0d17c8651188816 Andre Przywara 2022-07-08  526  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  527  		};
0d17c8651188816 Andre Przywara 2022-07-08  528  
0d17c8651188816 Andre Przywara 2022-07-08  529  		uart3: serial@5000c00 {
0d17c8651188816 Andre Przywara 2022-07-08  530  			compatible = "snps,dw-apb-uart";
0d17c8651188816 Andre Przywara 2022-07-08  531  			reg = <0x05000c00 0x400>;
0d17c8651188816 Andre Przywara 2022-07-08  532  			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  533  			reg-shift = <2>;
0d17c8651188816 Andre Przywara 2022-07-08  534  			reg-io-width = <4>;
0d17c8651188816 Andre Przywara 2022-07-08  535  			clocks = <&ccu CLK_BUS_UART3>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  536  			dmas = <&dma 17>, <&dma 17>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  537  			dma-names = "tx", "rx";
0d17c8651188816 Andre Przywara 2022-07-08  538  			resets = <&ccu RST_BUS_UART3>;
0d17c8651188816 Andre Przywara 2022-07-08  539  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  540  		};
0d17c8651188816 Andre Przywara 2022-07-08  541  
0d17c8651188816 Andre Przywara 2022-07-08  542  		uart4: serial@5001000 {
0d17c8651188816 Andre Przywara 2022-07-08  543  			compatible = "snps,dw-apb-uart";
0d17c8651188816 Andre Przywara 2022-07-08  544  			reg = <0x05001000 0x400>;
0d17c8651188816 Andre Przywara 2022-07-08  545  			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  546  			reg-shift = <2>;
0d17c8651188816 Andre Przywara 2022-07-08  547  			reg-io-width = <4>;
0d17c8651188816 Andre Przywara 2022-07-08  548  			clocks = <&ccu CLK_BUS_UART4>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  549  			dmas = <&dma 18>, <&dma 18>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  550  			dma-names = "tx", "rx";
0d17c8651188816 Andre Przywara 2022-07-08  551  			resets = <&ccu RST_BUS_UART4>;
0d17c8651188816 Andre Przywara 2022-07-08  552  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  553  		};
0d17c8651188816 Andre Przywara 2022-07-08  554  
0d17c8651188816 Andre Przywara 2022-07-08  555  		uart5: serial@5001400 {
0d17c8651188816 Andre Przywara 2022-07-08  556  			compatible = "snps,dw-apb-uart";
0d17c8651188816 Andre Przywara 2022-07-08  557  			reg = <0x05001400 0x400>;
0d17c8651188816 Andre Przywara 2022-07-08  558  			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  559  			reg-shift = <2>;
0d17c8651188816 Andre Przywara 2022-07-08  560  			reg-io-width = <4>;
0d17c8651188816 Andre Przywara 2022-07-08  561  			clocks = <&ccu CLK_BUS_UART5>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  562  			dmas = <&dma 19>, <&dma 19>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  563  			dma-names = "tx", "rx";
0d17c8651188816 Andre Przywara 2022-07-08  564  			resets = <&ccu RST_BUS_UART5>;
0d17c8651188816 Andre Przywara 2022-07-08  565  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  566  		};
0d17c8651188816 Andre Przywara 2022-07-08  567  
0d17c8651188816 Andre Przywara 2022-07-08  568  		i2c0: i2c@5002000 {
0d17c8651188816 Andre Przywara 2022-07-08  569  			compatible = "allwinner,sun50i-h616-i2c",
0d17c8651188816 Andre Przywara 2022-07-08  570  				     "allwinner,sun8i-v536-i2c",
0d17c8651188816 Andre Przywara 2022-07-08  571  				     "allwinner,sun6i-a31-i2c";
0d17c8651188816 Andre Przywara 2022-07-08  572  			reg = <0x05002000 0x400>;
0d17c8651188816 Andre Przywara 2022-07-08  573  			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  574  			clocks = <&ccu CLK_BUS_I2C0>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  575  			dmas = <&dma 43>, <&dma 43>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  576  			dma-names = "rx", "tx";
0d17c8651188816 Andre Przywara 2022-07-08  577  			resets = <&ccu RST_BUS_I2C0>;
0d17c8651188816 Andre Przywara 2022-07-08  578  			pinctrl-names = "default";
0d17c8651188816 Andre Przywara 2022-07-08  579  			pinctrl-0 = <&i2c0_pins>;
0d17c8651188816 Andre Przywara 2022-07-08  580  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  581  			#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  582  			#size-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08  583  		};
0d17c8651188816 Andre Przywara 2022-07-08  584  
0d17c8651188816 Andre Przywara 2022-07-08  585  		i2c1: i2c@5002400 {
0d17c8651188816 Andre Przywara 2022-07-08  586  			compatible = "allwinner,sun50i-h616-i2c",
0d17c8651188816 Andre Przywara 2022-07-08  587  				     "allwinner,sun8i-v536-i2c",
0d17c8651188816 Andre Przywara 2022-07-08  588  				     "allwinner,sun6i-a31-i2c";
0d17c8651188816 Andre Przywara 2022-07-08  589  			reg = <0x05002400 0x400>;
0d17c8651188816 Andre Przywara 2022-07-08  590  			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  591  			clocks = <&ccu CLK_BUS_I2C1>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  592  			dmas = <&dma 44>, <&dma 44>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  593  			dma-names = "rx", "tx";
0d17c8651188816 Andre Przywara 2022-07-08  594  			resets = <&ccu RST_BUS_I2C1>;
0d17c8651188816 Andre Przywara 2022-07-08  595  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  596  			#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  597  			#size-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08  598  		};
0d17c8651188816 Andre Przywara 2022-07-08  599  
0d17c8651188816 Andre Przywara 2022-07-08  600  		i2c2: i2c@5002800 {
0d17c8651188816 Andre Przywara 2022-07-08  601  			compatible = "allwinner,sun50i-h616-i2c",
0d17c8651188816 Andre Przywara 2022-07-08  602  				     "allwinner,sun8i-v536-i2c",
0d17c8651188816 Andre Przywara 2022-07-08  603  				     "allwinner,sun6i-a31-i2c";
0d17c8651188816 Andre Przywara 2022-07-08  604  			reg = <0x05002800 0x400>;
0d17c8651188816 Andre Przywara 2022-07-08  605  			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  606  			clocks = <&ccu CLK_BUS_I2C2>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  607  			dmas = <&dma 45>, <&dma 45>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  608  			dma-names = "rx", "tx";
0d17c8651188816 Andre Przywara 2022-07-08  609  			resets = <&ccu RST_BUS_I2C2>;
0d17c8651188816 Andre Przywara 2022-07-08  610  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  611  			#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  612  			#size-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08  613  		};
0d17c8651188816 Andre Przywara 2022-07-08  614  
0d17c8651188816 Andre Przywara 2022-07-08  615  		i2c3: i2c@5002c00 {
0d17c8651188816 Andre Przywara 2022-07-08  616  			compatible = "allwinner,sun50i-h616-i2c",
0d17c8651188816 Andre Przywara 2022-07-08  617  				     "allwinner,sun8i-v536-i2c",
0d17c8651188816 Andre Przywara 2022-07-08  618  				     "allwinner,sun6i-a31-i2c";
0d17c8651188816 Andre Przywara 2022-07-08  619  			reg = <0x05002c00 0x400>;
0d17c8651188816 Andre Przywara 2022-07-08  620  			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  621  			clocks = <&ccu CLK_BUS_I2C3>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  622  			dmas = <&dma 46>, <&dma 46>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  623  			dma-names = "rx", "tx";
0d17c8651188816 Andre Przywara 2022-07-08  624  			resets = <&ccu RST_BUS_I2C3>;
0d17c8651188816 Andre Przywara 2022-07-08  625  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  626  			#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  627  			#size-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08  628  		};
0d17c8651188816 Andre Przywara 2022-07-08  629  
0d17c8651188816 Andre Przywara 2022-07-08  630  		i2c4: i2c@5003000 {
0d17c8651188816 Andre Przywara 2022-07-08  631  			compatible = "allwinner,sun50i-h616-i2c",
0d17c8651188816 Andre Przywara 2022-07-08  632  				     "allwinner,sun8i-v536-i2c",
0d17c8651188816 Andre Przywara 2022-07-08  633  				     "allwinner,sun6i-a31-i2c";
0d17c8651188816 Andre Przywara 2022-07-08  634  			reg = <0x05003000 0x400>;
0d17c8651188816 Andre Przywara 2022-07-08  635  			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  636  			clocks = <&ccu CLK_BUS_I2C4>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  637  			dmas = <&dma 47>, <&dma 47>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  638  			dma-names = "rx", "tx";
0d17c8651188816 Andre Przywara 2022-07-08  639  			resets = <&ccu RST_BUS_I2C4>;
0d17c8651188816 Andre Przywara 2022-07-08  640  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  641  			#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  642  			#size-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08  643  		};
0d17c8651188816 Andre Przywara 2022-07-08  644  
0d17c8651188816 Andre Przywara 2022-07-08  645  		spi0: spi@5010000 {
0d17c8651188816 Andre Przywara 2022-07-08  646  			compatible = "allwinner,sun50i-h616-spi",
0d17c8651188816 Andre Przywara 2022-07-08  647  				     "allwinner,sun8i-h3-spi";
0d17c8651188816 Andre Przywara 2022-07-08  648  			reg = <0x05010000 0x1000>;
0d17c8651188816 Andre Przywara 2022-07-08  649  			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  650  			clocks = <&ccu CLK_BUS_SPI0>, <&ccu CLK_SPI0>;
0d17c8651188816 Andre Przywara 2022-07-08  651  			clock-names = "ahb", "mod";
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  652  			dmas = <&dma 22>, <&dma 22>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  653  			dma-names = "rx", "tx";
0d17c8651188816 Andre Przywara 2022-07-08  654  			resets = <&ccu RST_BUS_SPI0>;
0d17c8651188816 Andre Przywara 2022-07-08  655  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  656  			#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  657  			#size-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08  658  		};
0d17c8651188816 Andre Przywara 2022-07-08  659  
0d17c8651188816 Andre Przywara 2022-07-08  660  		spi1: spi@5011000 {
0d17c8651188816 Andre Przywara 2022-07-08  661  			compatible = "allwinner,sun50i-h616-spi",
0d17c8651188816 Andre Przywara 2022-07-08  662  				     "allwinner,sun8i-h3-spi";
0d17c8651188816 Andre Przywara 2022-07-08  663  			reg = <0x05011000 0x1000>;
0d17c8651188816 Andre Przywara 2022-07-08  664  			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  665  			clocks = <&ccu CLK_BUS_SPI1>, <&ccu CLK_SPI1>;
0d17c8651188816 Andre Przywara 2022-07-08  666  			clock-names = "ahb", "mod";
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  667  			dmas = <&dma 23>, <&dma 23>;
238f65fc31f79fe Chen-Yu Tsai   2024-01-28  668  			dma-names = "rx", "tx";
0d17c8651188816 Andre Przywara 2022-07-08  669  			resets = <&ccu RST_BUS_SPI1>;
0d17c8651188816 Andre Przywara 2022-07-08  670  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  671  			#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  672  			#size-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08  673  		};
0d17c8651188816 Andre Przywara 2022-07-08  674  
0d17c8651188816 Andre Przywara 2022-07-08  675  		emac0: ethernet@5020000 {
0d17c8651188816 Andre Przywara 2022-07-08  676  			compatible = "allwinner,sun50i-h616-emac0",
0d17c8651188816 Andre Przywara 2022-07-08  677  				     "allwinner,sun50i-a64-emac";
0d17c8651188816 Andre Przywara 2022-07-08  678  			reg = <0x05020000 0x10000>;
0d17c8651188816 Andre Przywara 2022-07-08  679  			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
0d17c8651188816 Andre Przywara 2022-07-08  680  			interrupt-names = "macirq";
0d17c8651188816 Andre Przywara 2022-07-08  681  			clocks = <&ccu CLK_BUS_EMAC0>;
0d17c8651188816 Andre Przywara 2022-07-08  682  			clock-names = "stmmaceth";
0d17c8651188816 Andre Przywara 2022-07-08  683  			resets = <&ccu RST_BUS_EMAC0>;
0d17c8651188816 Andre Przywara 2022-07-08  684  			reset-names = "stmmaceth";
0d17c8651188816 Andre Przywara 2022-07-08  685  			syscon = <&syscon>;
0d17c8651188816 Andre Przywara 2022-07-08  686  			status = "disabled";
0d17c8651188816 Andre Przywara 2022-07-08  687  
0d17c8651188816 Andre Przywara 2022-07-08  688  			mdio0: mdio {
0d17c8651188816 Andre Przywara 2022-07-08  689  				compatible = "snps,dwmac-mdio";
0d17c8651188816 Andre Przywara 2022-07-08  690  				#address-cells = <1>;
0d17c8651188816 Andre Przywara 2022-07-08  691  				#size-cells = <0>;
0d17c8651188816 Andre Przywara 2022-07-08  692  			};
0d17c8651188816 Andre Przywara 2022-07-08  693  		};
0d17c8651188816 Andre Przywara 2022-07-08  694  
59678cc9cc54e55 Chris Morgan   2024-06-05  695  		gpadc: adc@5070000 {
59678cc9cc54e55 Chris Morgan   2024-06-05  696  			compatible = "allwinner,sun50i-h616-gpadc",
59678cc9cc54e55 Chris Morgan   2024-06-05  697  				     "allwinner,sun20i-d1-gpadc";
59678cc9cc54e55 Chris Morgan   2024-06-05  698  			reg = <0x05070000 0x400>;
59678cc9cc54e55 Chris Morgan   2024-06-05  699  			clocks = <&ccu CLK_BUS_GPADC>;
59678cc9cc54e55 Chris Morgan   2024-06-05  700  			resets = <&ccu RST_BUS_GPADC>;
59678cc9cc54e55 Chris Morgan   2024-06-05  701  			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
59678cc9cc54e55 Chris Morgan   2024-06-05  702  			status = "disabled";
59678cc9cc54e55 Chris Morgan   2024-06-05  703  			#io-channel-cells = <1>;
59678cc9cc54e55 Chris Morgan   2024-06-05  704  		};
59678cc9cc54e55 Chris Morgan   2024-06-05  705  
f4318af40544b8e Martin Botka   2024-02-19  706  		ths: thermal-sensor@5070400 {
f4318af40544b8e Martin Botka   2024-02-19  707  			compatible = "allwinner,sun50i-h616-ths";
f4318af40544b8e Martin Botka   2024-02-19  708  			reg = <0x05070400 0x400>;
f4318af40544b8e Martin Botka   2024-02-19  709  			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
f4318af40544b8e Martin Botka   2024-02-19  710  			clocks = <&ccu CLK_BUS_THS>;
f4318af40544b8e Martin Botka   2024-02-19  711  			clock-names = "bus";
f4318af40544b8e Martin Botka   2024-02-19  712  			resets = <&ccu RST_BUS_THS>;
f4318af40544b8e Martin Botka   2024-02-19  713  			nvmem-cells = <&ths_calibration>;
f4318af40544b8e Martin Botka   2024-02-19  714  			nvmem-cell-names = "calibration";
f4318af40544b8e Martin Botka   2024-02-19  715  			allwinner,sram = <&syscon>;
f4318af40544b8e Martin Botka   2024-02-19  716  			#thermal-sensor-cells = <1>;
f4318af40544b8e Martin Botka   2024-02-19  717  		};
f4318af40544b8e Martin Botka   2024-02-19  718  
048ed5efbc4eec8 James McGregor 2024-04-26  719  		lradc: lradc@5070800 {
048ed5efbc4eec8 James McGregor 2024-04-26  720  			compatible = "allwinner,sun50i-h616-lradc",
048ed5efbc4eec8 James McGregor 2024-04-26  721  				     "allwinner,sun50i-r329-lradc";
048ed5efbc4eec8 James McGregor 2024-04-26  722  			reg = <0x05070800 0x400>;
048ed5efbc4eec8 James McGregor 2024-04-26  723  			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
048ed5efbc4eec8 James McGregor 2024-04-26  724  			clocks = <&ccu CLK_BUS_KEYADC>;
048ed5efbc4eec8 James McGregor 2024-04-26  725  			resets = <&ccu RST_BUS_KEYADC>;
048ed5efbc4eec8 James McGregor 2024-04-26  726  			status = "disabled";
048ed5efbc4eec8 James McGregor 2024-04-26  727  		};
048ed5efbc4eec8 James McGregor 2024-04-26  728  
3eef85034c96f61 Ryan Walklin   2024-10-23  729  		spdif: spdif@5093000 {
3eef85034c96f61 Ryan Walklin   2024-10-23  730  			compatible = "allwinner,sun50i-h616-spdif";
3eef85034c96f61 Ryan Walklin   2024-10-23  731  			reg = <0x05093000 0x400>;
3eef85034c96f61 Ryan Walklin   2024-10-23  732  			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
3eef85034c96f61 Ryan Walklin   2024-10-23  733  			clocks = <&ccu CLK_BUS_SPDIF>, <&ccu CLK_SPDIF>;
3eef85034c96f61 Ryan Walklin   2024-10-23  734  			clock-names = "apb", "spdif";
3eef85034c96f61 Ryan Walklin   2024-10-23  735  			resets = <&ccu RST_BUS_SPDIF>;
3eef85034c96f61 Ryan Walklin   2024-10-23  736  			dmas = <&dma 2>;
3eef85034c96f61 Ryan Walklin   2024-10-23  737  			dma-names = "tx";
3eef85034c96f61 Ryan Walklin   2024-10-23  738  			pinctrl-names = "default";
3eef85034c96f61 Ryan Walklin   2024-10-23  739  			pinctrl-0 = <&spdif_tx_pin>;
3eef85034c96f61 Ryan Walklin   2024-10-23  740  			#sound-dai-cells = <0>;
3eef85034c96f61 Ryan Walklin   2024-10-23  741  			status = "disabled";
3eef85034c96f61 Ryan Walklin   2024-10-23  742  		};
3eef85034c96f61 Ryan Walklin   2024-10-23  743  
3eef85034c96f61 Ryan Walklin   2024-10-23  744  		codec: codec@5096000 {
3eef85034c96f61 Ryan Walklin   2024-10-23  745  			#sound-dai-cells = <0>;
3eef85034c96f61 Ryan Walklin   2024-10-23  746  			compatible = "allwinner,sun50i-h616-codec";
3eef85034c96f61 Ryan Walklin   2024-10-23  747  			reg = <0x05096000 0x31c>;
3eef85034c96f61 Ryan Walklin   2024-10-23  748  			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
3eef85034c96f61 Ryan Walklin   2024-10-23  749  			clocks = <&ccu CLK_BUS_AUDIO_CODEC>,
3eef85034c96f61 Ryan Walklin   2024-10-23  750  				 <&ccu CLK_AUDIO_CODEC_1X>;
3eef85034c96f61 Ryan Walklin   2024-10-23  751  			clock-names = "apb", "codec";
3eef85034c96f61 Ryan Walklin   2024-10-23  752  			resets = <&ccu RST_BUS_AUDIO_CODEC>;
3eef85034c96f61 Ryan Walklin   2024-10-23  753  			dmas = <&dma 6>;
3eef85034c96f61 Ryan Walklin   2024-10-23  754  			dma-names = "tx";
3eef85034c96f61 Ryan Walklin   2024-10-23  755  			status = "disabled";
3eef85034c96f61 Ryan Walklin   2024-10-23  756  		};
3eef85034c96f61 Ryan Walklin   2024-10-23  757  
f40cf244c3feb4e Andre Przywara 2022-10-31  758  		usbotg: usb@5100000 {
f40cf244c3feb4e Andre Przywara 2022-10-31  759  			compatible = "allwinner,sun50i-h616-musb",
f40cf244c3feb4e Andre Przywara 2022-10-31  760  				     "allwinner,sun8i-h3-musb";
f40cf244c3feb4e Andre Przywara 2022-10-31  761  			reg = <0x05100000 0x0400>;
f40cf244c3feb4e Andre Przywara 2022-10-31  762  			clocks = <&ccu CLK_BUS_OTG>;
f40cf244c3feb4e Andre Przywara 2022-10-31  763  			resets = <&ccu RST_BUS_OTG>;
f40cf244c3feb4e Andre Przywara 2022-10-31  764  			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
f40cf244c3feb4e Andre Przywara 2022-10-31  765  			interrupt-names = "mc";
f40cf244c3feb4e Andre Przywara 2022-10-31  766  			phys = <&usbphy 0>;
f40cf244c3feb4e Andre Przywara 2022-10-31  767  			phy-names = "usb";
f40cf244c3feb4e Andre Przywara 2022-10-31  768  			extcon = <&usbphy 0>;
f40cf244c3feb4e Andre Przywara 2022-10-31  769  			status = "disabled";
f40cf244c3feb4e Andre Przywara 2022-10-31  770  		};
f40cf244c3feb4e Andre Przywara 2022-10-31  771  
f40cf244c3feb4e Andre Przywara 2022-10-31  772  		usbphy: phy@5100400 {
f40cf244c3feb4e Andre Przywara 2022-10-31  773  			compatible = "allwinner,sun50i-h616-usb-phy";
f40cf244c3feb4e Andre Przywara 2022-10-31  774  			reg = <0x05100400 0x24>,
f40cf244c3feb4e Andre Przywara 2022-10-31  775  			      <0x05101800 0x14>,
f40cf244c3feb4e Andre Przywara 2022-10-31  776  			      <0x05200800 0x14>,
f40cf244c3feb4e Andre Przywara 2022-10-31  777  			      <0x05310800 0x14>,
f40cf244c3feb4e Andre Przywara 2022-10-31  778  			      <0x05311800 0x14>;
f40cf244c3feb4e Andre Przywara 2022-10-31  779  			reg-names = "phy_ctrl",
f40cf244c3feb4e Andre Przywara 2022-10-31  780  				    "pmu0",
f40cf244c3feb4e Andre Przywara 2022-10-31  781  				    "pmu1",
f40cf244c3feb4e Andre Przywara 2022-10-31  782  				    "pmu2",
f40cf244c3feb4e Andre Przywara 2022-10-31  783  				    "pmu3";
f40cf244c3feb4e Andre Przywara 2022-10-31  784  			clocks = <&ccu CLK_USB_PHY0>,
f40cf244c3feb4e Andre Przywara 2022-10-31  785  				 <&ccu CLK_USB_PHY1>,
f40cf244c3feb4e Andre Przywara 2022-10-31  786  				 <&ccu CLK_USB_PHY2>,
f40cf244c3feb4e Andre Przywara 2022-10-31  787  				 <&ccu CLK_USB_PHY3>,
f40cf244c3feb4e Andre Przywara 2022-10-31  788  				 <&ccu CLK_BUS_EHCI2>;
f40cf244c3feb4e Andre Przywara 2022-10-31  789  			clock-names = "usb0_phy",
f40cf244c3feb4e Andre Przywara 2022-10-31  790  				      "usb1_phy",
f40cf244c3feb4e Andre Przywara 2022-10-31  791  				      "usb2_phy",
f40cf244c3feb4e Andre Przywara 2022-10-31  792  				      "usb3_phy",
f40cf244c3feb4e Andre Przywara 2022-10-31  793  				      "pmu2_clk";
f40cf244c3feb4e Andre Przywara 2022-10-31  794  			resets = <&ccu RST_USB_PHY0>,
f40cf244c3feb4e Andre Przywara 2022-10-31  795  				 <&ccu RST_USB_PHY1>,
f40cf244c3feb4e Andre Przywara 2022-10-31  796  				 <&ccu RST_USB_PHY2>,
f40cf244c3feb4e Andre Przywara 2022-10-31  797  				 <&ccu RST_USB_PHY3>;
f40cf244c3feb4e Andre Przywara 2022-10-31  798  			reset-names = "usb0_reset",
f40cf244c3feb4e Andre Przywara 2022-10-31  799  				      "usb1_reset",
f40cf244c3feb4e Andre Przywara 2022-10-31  800  				      "usb2_reset",
f40cf244c3feb4e Andre Przywara 2022-10-31  801  				      "usb3_reset";
f40cf244c3feb4e Andre Przywara 2022-10-31  802  			status = "disabled";
f40cf244c3feb4e Andre Przywara 2022-10-31  803  			#phy-cells = <1>;
f40cf244c3feb4e Andre Przywara 2022-10-31  804  		};
f40cf244c3feb4e Andre Przywara 2022-10-31  805  
f40cf244c3feb4e Andre Przywara 2022-10-31  806  		ehci0: usb@5101000 {
f40cf244c3feb4e Andre Przywara 2022-10-31  807  			compatible = "allwinner,sun50i-h616-ehci",
f40cf244c3feb4e Andre Przywara 2022-10-31  808  				     "generic-ehci";
f40cf244c3feb4e Andre Przywara 2022-10-31  809  			reg = <0x05101000 0x100>;
f40cf244c3feb4e Andre Przywara 2022-10-31  810  			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
f40cf244c3feb4e Andre Przywara 2022-10-31  811  			clocks = <&ccu CLK_BUS_OHCI0>,
f40cf244c3feb4e Andre Przywara 2022-10-31  812  				 <&ccu CLK_BUS_EHCI0>,
f40cf244c3feb4e Andre Przywara 2022-10-31  813  				 <&ccu CLK_USB_OHCI0>;
f40cf244c3feb4e Andre Przywara 2022-10-31  814  			resets = <&ccu RST_BUS_OHCI0>,
f40cf244c3feb4e Andre Przywara 2022-10-31  815  				 <&ccu RST_BUS_EHCI0>;
f40cf244c3feb4e Andre Przywara 2022-10-31  816  			phys = <&usbphy 0>;
f40cf244c3feb4e Andre Przywara 2022-10-31  817  			phy-names = "usb";
f40cf244c3feb4e Andre Przywara 2022-10-31  818  			status = "disabled";
f40cf244c3feb4e Andre Przywara 2022-10-31  819  		};
f40cf244c3feb4e Andre Przywara 2022-10-31  820  
f40cf244c3feb4e Andre Przywara 2022-10-31  821  		ohci0: usb@5101400 {
f40cf244c3feb4e Andre Przywara 2022-10-31  822  			compatible = "allwinner,sun50i-h616-ohci",
f40cf244c3feb4e Andre Przywara 2022-10-31  823  				     "generic-ohci";
f40cf244c3feb4e Andre Przywara 2022-10-31  824  			reg = <0x05101400 0x100>;
f40cf244c3feb4e Andre Przywara 2022-10-31  825  			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
f40cf244c3feb4e Andre Przywara 2022-10-31  826  			clocks = <&ccu CLK_BUS_OHCI0>,
f40cf244c3feb4e Andre Przywara 2022-10-31  827  				 <&ccu CLK_USB_OHCI0>;
f40cf244c3feb4e Andre Przywara 2022-10-31  828  			resets = <&ccu RST_BUS_OHCI0>;
f40cf244c3feb4e Andre Przywara 2022-10-31  829  			phys = <&usbphy 0>;
f40cf244c3feb4e Andre Przywara 2022-10-31  830  			phy-names = "usb";
f40cf244c3feb4e Andre Przywara 2022-10-31  831  			status = "disabled";
f40cf244c3feb4e Andre Przywara 2022-10-31  832  		};
f40cf244c3feb4e Andre Przywara 2022-10-31  833  
f40cf244c3feb4e Andre Przywara 2022-10-31  834  		ehci1: usb@5200000 {
f40cf244c3feb4e Andre Przywara 2022-10-31  835  			compatible = "allwinner,sun50i-h616-ehci",
f40cf244c3feb4e Andre Przywara 2022-10-31  836  				     "generic-ehci";
f40cf244c3feb4e Andre Przywara 2022-10-31  837  			reg = <0x05200000 0x100>;
f40cf244c3feb4e Andre Przywara 2022-10-31  838  			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
f40cf244c3feb4e Andre Przywara 2022-10-31  839  			clocks = <&ccu CLK_BUS_OHCI1>,
f40cf244c3feb4e Andre Przywara 2022-10-31  840  				 <&ccu CLK_BUS_EHCI1>,
f40cf244c3feb4e Andre Przywara 2022-10-31  841  				 <&ccu CLK_USB_OHCI1>;
f40cf244c3feb4e Andre Przywara 2022-10-31  842  			resets = <&ccu RST_BUS_OHCI1>,
f40cf244c3feb4e Andre Przywara 2022-10-31  843  				 <&ccu RST_BUS_EHCI1>;
f40cf244c3feb4e Andre Przywara 2022-10-31  844  			phys = <&usbphy 1>;
f40cf244c3feb4e Andre Przywara 2022-10-31  845  			phy-names = "usb";
f40cf244c3feb4e Andre Przywara 2022-10-31  846  			status = "disabled";
f40cf244c3feb4e Andre Przywara 2022-10-31  847  		};
f40cf244c3feb4e Andre Przywara 2022-10-31  848  
f40cf244c3feb4e Andre Przywara 2022-10-31  849  		ohci1: usb@5200400 {
f40cf244c3feb4e Andre Przywara 2022-10-31  850  			compatible = "allwinner,sun50i-h616-ohci",
f40cf244c3feb4e Andre Przywara 2022-10-31  851  				     "generic-ohci";
f40cf244c3feb4e Andre Przywara 2022-10-31  852  			reg = <0x05200400 0x100>;
f40cf244c3feb4e Andre Przywara 2022-10-31  853  			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
f40cf244c3feb4e Andre Przywara 2022-10-31  854  			clocks = <&ccu CLK_BUS_OHCI1>,
f40cf244c3feb4e Andre Przywara 2022-10-31  855  				 <&ccu CLK_USB_OHCI1>;
f40cf244c3feb4e Andre Przywara 2022-10-31  856  			resets = <&ccu RST_BUS_OHCI1>;
f40cf244c3feb4e Andre Przywara 2022-10-31  857  			phys = <&usbphy 1>;
f40cf244c3feb4e Andre Przywara 2022-10-31  858  			phy-names = "usb";
f40cf244c3feb4e Andre Przywara 2022-10-31  859  			status = "disabled";
f40cf244c3feb4e Andre Przywara 2022-10-31  860  		};
f40cf244c3feb4e Andre Przywara 2022-10-31  861  
f40cf244c3feb4e Andre Przywara 2022-10-31  862  		ehci2: usb@5310000 {
f40cf244c3feb4e Andre Przywara 2022-10-31  863  			compatible = "allwinner,sun50i-h616-ehci",
f40cf244c3feb4e Andre Przywara 2022-10-31  864  				     "generic-ehci";
f40cf244c3feb4e Andre Przywara 2022-10-31  865  			reg = <0x05310000 0x100>;
f40cf244c3feb4e Andre Przywara 2022-10-31  866  			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
f40cf244c3feb4e Andre Przywara 2022-10-31  867  			clocks = <&ccu CLK_BUS_OHCI2>,
f40cf244c3feb4e Andre Przywara 2022-10-31  868  				 <&ccu CLK_BUS_EHCI2>,
f40cf244c3feb4e Andre Przywara 2022-10-31  869  				 <&ccu CLK_USB_OHCI2>;
f40cf244c3feb4e Andre Przywara 2022-10-31  870  			resets = <&ccu RST_BUS_OHCI2>,
f40cf244c3feb4e Andre Przywara 2022-10-31  871  				 <&ccu RST_BUS_EHCI2>;
f40cf244c3feb4e Andre Przywara 2022-10-31  872  			phys = <&usbphy 2>;
f40cf244c3feb4e Andre Przywara 2022-10-31  873  			phy-names = "usb";
f40cf244c3feb4e Andre Przywara 2022-10-31  874  			status = "disabled";
f40cf244c3feb4e Andre Przywara 2022-10-31  875  		};
f40cf244c3feb4e Andre Przywara 2022-10-31  876  
f40cf244c3feb4e Andre Przywara 2022-10-31  877  		ohci2: usb@5310400 {
f40cf244c3feb4e Andre Przywara 2022-10-31  878  			compatible = "allwinner,sun50i-h616-ohci",
f40cf244c3feb4e Andre Przywara 2022-10-31  879  				     "generic-ohci";
f40cf244c3feb4e Andre Przywara 2022-10-31  880  			reg = <0x05310400 0x100>;
f40cf244c3feb4e Andre Przywara 2022-10-31  881  			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
f40cf244c3feb4e Andre Przywara 2022-10-31  882  			clocks = <&ccu CLK_BUS_OHCI2>,
f40cf244c3feb4e Andre Przywara 2022-10-31  883  				 <&ccu CLK_USB_OHCI2>;
f40cf244c3feb4e Andre Przywara 2022-10-31  884  			resets = <&ccu RST_BUS_OHCI2>;
f40cf244c3feb4e Andre Przywara 2022-10-31  885  			phys = <&usbphy 2>;
f40cf244c3feb4e Andre Przywara 2022-10-31  886  			phy-names = "usb";
f40cf244c3feb4e Andre Przywara 2022-10-31  887  			status = "disabled";
f40cf244c3feb4e Andre Przywara 2022-10-31  888  		};
f40cf244c3feb4e Andre Przywara 2022-10-31  889  
f40cf244c3feb4e Andre Przywara 2022-10-31  890  		ehci3: usb@5311000 {
f40cf244c3feb4e Andre Przywara 2022-10-31  891  			compatible = "allwinner,sun50i-h616-ehci",
f40cf244c3feb4e Andre Przywara 2022-10-31  892  				     "generic-ehci";
f40cf244c3feb4e Andre Przywara 2022-10-31  893  			reg = <0x05311000 0x100>;
f40cf244c3feb4e Andre Przywara 2022-10-31  894  			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
f40cf244c3feb4e Andre Przywara 2022-10-31  895  			clocks = <&ccu CLK_BUS_OHCI3>,
f40cf244c3feb4e Andre Przywara 2022-10-31  896  				 <&ccu CLK_BUS_EHCI3>,
f40cf244c3feb4e Andre Przywara 2022-10-31  897  				 <&ccu CLK_USB_OHCI3>;
f40cf244c3feb4e Andre Przywara 2022-10-31  898  			resets = <&ccu RST_BUS_OHCI3>,
f40cf244c3feb4e Andre Przywara 2022-10-31  899  				 <&ccu RST_BUS_EHCI3>;
f40cf244c3feb4e Andre Przywara 2022-10-31  900  			phys = <&usbphy 3>;
f40cf244c3feb4e Andre Przywara 2022-10-31  901  			phy-names = "usb";
f40cf244c3feb4e Andre Przywara 2022-10-31  902  			status = "disabled";
f40cf244c3feb4e Andre Przywara 2022-10-31  903  		};
f40cf244c3feb4e Andre Przywara 2022-10-31  904  
f40cf244c3feb4e Andre Przywara 2022-10-31  905  		ohci3: usb@5311400 {
f40cf244c3feb4e Andre Przywara 2022-10-31  906  			compatible = "allwinner,sun50i-h616-ohci",
f40cf244c3feb4e Andre Przywara 2022-10-31  907  				     "generic-ohci";
f40cf244c3feb4e Andre Przywara 2022-10-31  908  			reg = <0x05311400 0x100>;
f40cf244c3feb4e Andre Przywara 2022-10-31  909  			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
f40cf244c3feb4e Andre Przywara 2022-10-31  910  			clocks = <&ccu CLK_BUS_OHCI3>,
f40cf244c3feb4e Andre Przywara 2022-10-31  911  				 <&ccu CLK_USB_OHCI3>;
f40cf244c3feb4e Andre Przywara 2022-10-31  912  			resets = <&ccu RST_BUS_OHCI3>;
f40cf244c3feb4e Andre Przywara 2022-10-31  913  			phys = <&usbphy 3>;
f40cf244c3feb4e Andre Przywara 2022-10-31  914  			phy-names = "usb";
f40cf244c3feb4e Andre Przywara 2022-10-31  915  			status = "disabled";
f40cf244c3feb4e Andre Przywara 2022-10-31  916  		};
f40cf244c3feb4e Andre Przywara 2022-10-31  917  
cddf223e627003e Chris Morgan   2025-05-07  918  		tcon_top: tcon-top@6510000 {
cddf223e627003e Chris Morgan   2025-05-07  919  			compatible = "allwinner,sun50i-h616-tcon-top",
cddf223e627003e Chris Morgan   2025-05-07  920  				     "allwinner,sun50i-h6-tcon-top";
cddf223e627003e Chris Morgan   2025-05-07  921  			reg = <0x06510000 0x1000>;
cddf223e627003e Chris Morgan   2025-05-07  922  			clocks = <&ccu CLK_BUS_TCON_TOP>,
cddf223e627003e Chris Morgan   2025-05-07  923  				 <&ccu CLK_TCON_TV0>;
cddf223e627003e Chris Morgan   2025-05-07  924  			clock-names = "bus", "tcon-tv0";
cddf223e627003e Chris Morgan   2025-05-07  925  			clock-output-names = "tcon-top-tv0";
cddf223e627003e Chris Morgan   2025-05-07  926  			#clock-cells = <1>;
cddf223e627003e Chris Morgan   2025-05-07  927  			resets = <&ccu RST_BUS_TCON_TOP>;
cddf223e627003e Chris Morgan   2025-05-07  928  
cddf223e627003e Chris Morgan   2025-05-07  929  			ports {
cddf223e627003e Chris Morgan   2025-05-07  930  				#address-cells = <1>;
cddf223e627003e Chris Morgan   2025-05-07  931  				#size-cells = <0>;
cddf223e627003e Chris Morgan   2025-05-07  932  
cddf223e627003e Chris Morgan   2025-05-07 @933  				tcon_top_mixer0_in: port@0 {
cddf223e627003e Chris Morgan   2025-05-07  934  					#address-cells = <1>;
cddf223e627003e Chris Morgan   2025-05-07  935  					#size-cells = <0>;
cddf223e627003e Chris Morgan   2025-05-07  936  					reg = <0>;
cddf223e627003e Chris Morgan   2025-05-07  937  
cddf223e627003e Chris Morgan   2025-05-07  938  					tcon_top_mixer0_in_mixer0: endpoint@0 {
cddf223e627003e Chris Morgan   2025-05-07  939  						reg = <0>;
cddf223e627003e Chris Morgan   2025-05-07  940  						remote-endpoint = <&mixer0_out_tcon_top_mixer0>;
cddf223e627003e Chris Morgan   2025-05-07  941  					};
cddf223e627003e Chris Morgan   2025-05-07  942  				};
cddf223e627003e Chris Morgan   2025-05-07  943  
cddf223e627003e Chris Morgan   2025-05-07  944  				tcon_top_mixer0_out: port@1 {
cddf223e627003e Chris Morgan   2025-05-07  945  					#address-cells = <1>;
cddf223e627003e Chris Morgan   2025-05-07  946  					#size-cells = <0>;
cddf223e627003e Chris Morgan   2025-05-07  947  					reg = <1>;
cddf223e627003e Chris Morgan   2025-05-07  948  
cddf223e627003e Chris Morgan   2025-05-07  949  					tcon_top_mixer0_out_tcon_lcd0: endpoint@0 {
cddf223e627003e Chris Morgan   2025-05-07  950  						reg = <0>;
cddf223e627003e Chris Morgan   2025-05-07  951  						remote-endpoint = <&tcon_lcd0_in_tcon_top_mixer0>;
cddf223e627003e Chris Morgan   2025-05-07  952  					};
cddf223e627003e Chris Morgan   2025-05-07  953  
cddf223e627003e Chris Morgan   2025-05-07  954  					tcon_top_mixer0_out_tcon_tv0: endpoint@2 {
cddf223e627003e Chris Morgan   2025-05-07  955  						reg = <2>;
cddf223e627003e Chris Morgan   2025-05-07  956  						remote-endpoint = <&tcon_tv0_in_tcon_top_mixer0>;
cddf223e627003e Chris Morgan   2025-05-07  957  					};
cddf223e627003e Chris Morgan   2025-05-07  958  				};
cddf223e627003e Chris Morgan   2025-05-07  959  
cddf223e627003e Chris Morgan   2025-05-07  960  				tcon_top_hdmi_in: port@4 {
cddf223e627003e Chris Morgan   2025-05-07  961  					#address-cells = <1>;
cddf223e627003e Chris Morgan   2025-05-07  962  					#size-cells = <0>;
cddf223e627003e Chris Morgan   2025-05-07  963  					reg = <4>;
cddf223e627003e Chris Morgan   2025-05-07  964  
cddf223e627003e Chris Morgan   2025-05-07  965  					tcon_top_hdmi_in_tcon_tv0: endpoint@0 {
cddf223e627003e Chris Morgan   2025-05-07  966  						reg = <0>;
cddf223e627003e Chris Morgan   2025-05-07  967  						remote-endpoint = <&tcon_tv0_out_tcon_top>;
cddf223e627003e Chris Morgan   2025-05-07  968  					};
cddf223e627003e Chris Morgan   2025-05-07  969  				};
cddf223e627003e Chris Morgan   2025-05-07  970  
cddf223e627003e Chris Morgan   2025-05-07  971  				tcon_top_hdmi_out: port@5 {
cddf223e627003e Chris Morgan   2025-05-07  972  					reg = <5>;
cddf223e627003e Chris Morgan   2025-05-07  973  
cddf223e627003e Chris Morgan   2025-05-07  974  					tcon_top_hdmi_out_hdmi: endpoint {
cddf223e627003e Chris Morgan   2025-05-07  975  						/* placeholder for HDMI  - remote-endpoint = <&hdmi_in_tcon_top>;*/
cddf223e627003e Chris Morgan   2025-05-07  976  					};
cddf223e627003e Chris Morgan   2025-05-07  977  				};
cddf223e627003e Chris Morgan   2025-05-07  978  			};
cddf223e627003e Chris Morgan   2025-05-07  979  		};
cddf223e627003e Chris Morgan   2025-05-07  980  
cddf223e627003e Chris Morgan   2025-05-07  981  		tcon_lcd0: lcd-controller@6511000 {
cddf223e627003e Chris Morgan   2025-05-07  982  			compatible = "allwinner,sun50i-h616-tcon-lcd",
cddf223e627003e Chris Morgan   2025-05-07  983  				     "allwinner,sun8i-r40-tcon-lcd";
cddf223e627003e Chris Morgan   2025-05-07  984  			reg = <0x06511000 0x1000>;
cddf223e627003e Chris Morgan   2025-05-07  985  			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
cddf223e627003e Chris Morgan   2025-05-07  986  			clocks = <&ccu CLK_BUS_TCON_LCD0>, <&ccu CLK_TCON_LCD0>;
cddf223e627003e Chris Morgan   2025-05-07  987  			clock-names = "ahb", "tcon-ch0";
cddf223e627003e Chris Morgan   2025-05-07  988  			clock-output-names = "tcon-data-clock";
cddf223e627003e Chris Morgan   2025-05-07  989  			#clock-cells = <0>;
cddf223e627003e Chris Morgan   2025-05-07  990  			resets = <&ccu RST_BUS_TCON_LCD0>, <&ccu RST_BUS_LVDS>;
cddf223e627003e Chris Morgan   2025-05-07  991  			reset-names = "lcd", "lvds";
cddf223e627003e Chris Morgan   2025-05-07  992  			status = "disabled";
cddf223e627003e Chris Morgan   2025-05-07  993  
cddf223e627003e Chris Morgan   2025-05-07  994  			ports {
cddf223e627003e Chris Morgan   2025-05-07  995  				#address-cells = <1>;
cddf223e627003e Chris Morgan   2025-05-07  996  				#size-cells = <0>;
cddf223e627003e Chris Morgan   2025-05-07  997  
cddf223e627003e Chris Morgan   2025-05-07 @998  				tcon_lcd0_in: port@0 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
