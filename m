Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4797E6BFCE
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Aug 2025 19:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755803356; cv=none; b=hP4U50tJjzmUaSL3P4kByd/XGVHNdfi7vDW1OHz5skuewic7rg/ctHssRyXsRt7TW1VPLJ/rbWmaQG80mfpm8AULUWStVuRe8lZHG/k9K9BWTKTEPFv2TcIVYkadtLT+d1+5yHi5peGJdP/14MUlkWa/iR8eyVqbqyij1qSjGqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755803356; c=relaxed/simple;
	bh=5NV9NXW/Y80Y9uQO4rZpdrDKjAsFabmNZz7EaN19pGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SSjtvjcDJtsRPoRq13Rnt3gmg+G/4i7hK4rdFfn7XPNqUnVoo3NoSZs5HJdRnkQS292nKasnf8iY+ioq6E53+9oRWPCWcHLZo6u2XeSx+WQTkdcZbHV65wPoeO0h+jLOhCxDvI91x+8DD72nlC5rTZoOBlBrt+egVasWyizwGEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n/xgECgL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/xgECgL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755803352; x=1787339352;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5NV9NXW/Y80Y9uQO4rZpdrDKjAsFabmNZz7EaN19pGA=;
  b=n/xgECgLihrF9g5mh7qEUabqWFMj1oPe7al3obiIOHfnZsxpdcDBsgmf
   nFfO7d89GpzYJfrsqjzU52R1Cwt5k8MbHxkoeHFNDI9GmJ6dQO4HYD4kx
   9lkmIvqH9HfWkp15Np2zpi2SrTS1I+MrjyrcwfYrMvCNWwflY26nhTLnG
   yB87dnQhP8Y/jdNxmoMB627/KJnurjrLZV892CGA5oaiL8Too4eGBhO68
   xB0h7uofUrqwCzHgab7/OruW/vd5v5yNG1k2lE0ICpDXG3IoaMXP+yp2o
   bUMqtv3qsPAGAhwRje0hlhLcWEdmIC0KwueQKkhiSOJ8ZOi3c+KOXJr+d
   Q==;
X-CSE-ConnectionGUID: yXmoURfsTh2Q1PTf10SoYQ==
X-CSE-MsgGUID: QaC5RIXyQWKZA8zIpKPk7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="60731848"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="60731848"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 12:09:12 -0700
X-CSE-ConnectionGUID: 7phXoD0SRb+KincN1B0Myw==
X-CSE-MsgGUID: Tw3ckNmRSMW1YgPNOvpvqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="199474096"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Aug 2025 12:09:09 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upAep-000KbL-02;
	Thu, 21 Aug 2025 19:09:07 +0000
Date: Fri, 22 Aug 2025 03:08:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 6/6] arm64: dts: qcom: Add Xiaomi Redmi 3S
Message-ID: <202508220204.joQy3mVv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250820-msm8937-v6-6-b090b2acb67e@mainlining.org>
References: <20250820-msm8937-v6-6-b090b2acb67e@mainlining.org>
TO: "Barnabás Czémán" <barnabas.czeman@mainlining.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Stephan Gerhold <stephan@gerhold.net>
TO: "Otto Pflüger" <otto.pflueger@abscue.de>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Lee Jones <lee@kernel.org>
TO: Joerg Roedel <joro@8bytes.org>
TO: Will Deacon <will@kernel.org>
TO: Robin Murphy <robin.murphy@arm.com>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Sean Paul <sean@poorly.run>
TO: Abhinav Kumar <quic_abhinavk@quicinc.com>
TO: Marijn Suijten <marijn.suijten@somainline.org>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: Dmitry Baryshkov <lumag@kernel.org>
TO: Adam Skladowski <a_skl39@protonmail.com>
TO: Sireesh Kodali <sireeshkodali@protonmail.com>
TO: Rob Clark <robin.clark@oss.qualcomm.com>
TO: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
TO: Srinivas Kandagatla <srini@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: linux-clk@vger.kernel.org

Hi Barnabás,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3ac864c2d9bb8608ee236e89bf561811613abfce]

url:    https://github.com/intel-lab-lkp/linux/commits/Barnab-s-Cz-m-n/dt-bindings-clock-qcom-Add-MSM8937-Global-Clock-Controller/20250820-074316
base:   3ac864c2d9bb8608ee236e89bf561811613abfce
patch link:    https://lore.kernel.org/r/20250820-msm8937-v6-6-b090b2acb67e%40mainlining.org
patch subject: [PATCH v6 6/6] arm64: dts: qcom: Add Xiaomi Redmi 3S
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250820 (https://download.01.org/0day-ci/archive/20250822/202508220204.joQy3mVv-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250822/202508220204.joQy3mVv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508220204.joQy3mVv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/msm8937.dtsi:1097.27-1163.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8937.dtsi:1185.27-1251.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8937.dtsi:140.9-157.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8937.dtsi:507.27-510.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s5-p1@1d9: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s5-p2@1d9)
   arch/arm64/boot/dts/qcom/msm8937.dtsi:527.27-530.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s7-p1@1dc: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s7-p2@1dc)
   arch/arm64/boot/dts/qcom/msm8937.dtsi:552.25-555.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/mode@210: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s0-p1@210)
   arch/arm64/boot/dts/qcom/msm8937.dtsi:562.27-565.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s0-p2@211: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s1-p1@211)
   arch/arm64/boot/dts/qcom/msm8937.dtsi:582.27-585.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s2-p2@214: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s3-p1@214)
   arch/arm64/boot/dts/qcom/msm8937.dtsi:607.27-610.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s9-p1@230: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s9-p2@230)

vim +1097 arch/arm64/boot/dts/qcom/msm8937.dtsi

6fe745255e3d2a Dang Huynh 2025-08-20    12  
6fe745255e3d2a Dang Huynh 2025-08-20    13  / {
6fe745255e3d2a Dang Huynh 2025-08-20    14  	interrupt-parent = <&intc>;
6fe745255e3d2a Dang Huynh 2025-08-20    15  
6fe745255e3d2a Dang Huynh 2025-08-20    16  	#address-cells = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20    17  	#size-cells = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20    18  
6fe745255e3d2a Dang Huynh 2025-08-20    19  	clocks {
6fe745255e3d2a Dang Huynh 2025-08-20    20  		xo_board: xo-board {
6fe745255e3d2a Dang Huynh 2025-08-20    21  			compatible = "fixed-clock";
6fe745255e3d2a Dang Huynh 2025-08-20    22  			#clock-cells = <0>;
6fe745255e3d2a Dang Huynh 2025-08-20    23  		};
6fe745255e3d2a Dang Huynh 2025-08-20    24  
6fe745255e3d2a Dang Huynh 2025-08-20    25  		sleep_clk: sleep-clk {
6fe745255e3d2a Dang Huynh 2025-08-20    26  			compatible = "fixed-clock";
6fe745255e3d2a Dang Huynh 2025-08-20    27  			#clock-cells = <0>;
6fe745255e3d2a Dang Huynh 2025-08-20    28  		};
6fe745255e3d2a Dang Huynh 2025-08-20    29  	};
6fe745255e3d2a Dang Huynh 2025-08-20    30  
6fe745255e3d2a Dang Huynh 2025-08-20    31  	cpus {
6fe745255e3d2a Dang Huynh 2025-08-20    32  		#address-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20    33  		#size-cells = <0>;
6fe745255e3d2a Dang Huynh 2025-08-20    34  
6fe745255e3d2a Dang Huynh 2025-08-20    35  		cpu0: cpu@0 {
6fe745255e3d2a Dang Huynh 2025-08-20    36  			compatible = "arm,cortex-a53";
6fe745255e3d2a Dang Huynh 2025-08-20    37  			reg = <0x0>;
6fe745255e3d2a Dang Huynh 2025-08-20    38  			device_type = "cpu";
6fe745255e3d2a Dang Huynh 2025-08-20    39  			enable-method = "psci";
6fe745255e3d2a Dang Huynh 2025-08-20    40  			operating-points-v2 = <&cpu_opp_table_c0>;
6fe745255e3d2a Dang Huynh 2025-08-20    41  			next-level-cache = <&l2_0>;
6fe745255e3d2a Dang Huynh 2025-08-20    42  			#cooling-cells = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20    43  
6fe745255e3d2a Dang Huynh 2025-08-20    44  			l2_0: l2-cache {
6fe745255e3d2a Dang Huynh 2025-08-20    45  				compatible = "cache";
6fe745255e3d2a Dang Huynh 2025-08-20    46  				cache-level = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20    47  				cache-size = <0x80000>;
6fe745255e3d2a Dang Huynh 2025-08-20    48  				cache-unified;
6fe745255e3d2a Dang Huynh 2025-08-20    49  			};
6fe745255e3d2a Dang Huynh 2025-08-20    50  		};
6fe745255e3d2a Dang Huynh 2025-08-20    51  
6fe745255e3d2a Dang Huynh 2025-08-20    52  		cpu1: cpu@1 {
6fe745255e3d2a Dang Huynh 2025-08-20    53  			compatible = "arm,cortex-a53";
6fe745255e3d2a Dang Huynh 2025-08-20    54  			reg = <0x1>;
6fe745255e3d2a Dang Huynh 2025-08-20    55  			device_type = "cpu";
6fe745255e3d2a Dang Huynh 2025-08-20    56  			enable-method = "psci";
6fe745255e3d2a Dang Huynh 2025-08-20    57  			operating-points-v2 = <&cpu_opp_table_c0>;
6fe745255e3d2a Dang Huynh 2025-08-20    58  			next-level-cache = <&l2_0>;
6fe745255e3d2a Dang Huynh 2025-08-20    59  			#cooling-cells = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20    60  		};
6fe745255e3d2a Dang Huynh 2025-08-20    61  
6fe745255e3d2a Dang Huynh 2025-08-20    62  		cpu2: cpu@2 {
6fe745255e3d2a Dang Huynh 2025-08-20    63  			compatible = "arm,cortex-a53";
6fe745255e3d2a Dang Huynh 2025-08-20    64  			reg = <0x2>;
6fe745255e3d2a Dang Huynh 2025-08-20    65  			device_type = "cpu";
6fe745255e3d2a Dang Huynh 2025-08-20    66  			enable-method = "psci";
6fe745255e3d2a Dang Huynh 2025-08-20    67  			operating-points-v2 = <&cpu_opp_table_c0>;
6fe745255e3d2a Dang Huynh 2025-08-20    68  			next-level-cache = <&l2_0>;
6fe745255e3d2a Dang Huynh 2025-08-20    69  			#cooling-cells = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20    70  		};
6fe745255e3d2a Dang Huynh 2025-08-20    71  
6fe745255e3d2a Dang Huynh 2025-08-20    72  		cpu3: cpu@3 {
6fe745255e3d2a Dang Huynh 2025-08-20    73  			compatible = "arm,cortex-a53";
6fe745255e3d2a Dang Huynh 2025-08-20    74  			reg = <0x3>;
6fe745255e3d2a Dang Huynh 2025-08-20    75  			device_type = "cpu";
6fe745255e3d2a Dang Huynh 2025-08-20    76  			enable-method = "psci";
6fe745255e3d2a Dang Huynh 2025-08-20    77  			operating-points-v2 = <&cpu_opp_table_c0>;
6fe745255e3d2a Dang Huynh 2025-08-20    78  			next-level-cache = <&l2_0>;
6fe745255e3d2a Dang Huynh 2025-08-20    79  			#cooling-cells = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20    80  		};
6fe745255e3d2a Dang Huynh 2025-08-20    81  
6fe745255e3d2a Dang Huynh 2025-08-20    82  		cpu4: cpu@100 {
6fe745255e3d2a Dang Huynh 2025-08-20    83  			compatible = "arm,cortex-a53";
6fe745255e3d2a Dang Huynh 2025-08-20    84  			reg = <0x100>;
6fe745255e3d2a Dang Huynh 2025-08-20    85  			device_type = "cpu";
6fe745255e3d2a Dang Huynh 2025-08-20    86  			next-level-cache = <&l2_1>;
6fe745255e3d2a Dang Huynh 2025-08-20    87  			enable-method = "psci";
6fe745255e3d2a Dang Huynh 2025-08-20    88  			operating-points-v2 = <&cpu_opp_table_c1>;
6fe745255e3d2a Dang Huynh 2025-08-20    89  			#cooling-cells = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20    90  
6fe745255e3d2a Dang Huynh 2025-08-20    91  			l2_1: l2-cache {
6fe745255e3d2a Dang Huynh 2025-08-20    92  				compatible = "cache";
6fe745255e3d2a Dang Huynh 2025-08-20    93  				cache-level = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20    94  				cache-size = <0x100000>;
6fe745255e3d2a Dang Huynh 2025-08-20    95  				cache-unified;
6fe745255e3d2a Dang Huynh 2025-08-20    96  			};
6fe745255e3d2a Dang Huynh 2025-08-20    97  		};
6fe745255e3d2a Dang Huynh 2025-08-20    98  
6fe745255e3d2a Dang Huynh 2025-08-20    99  		cpu5: cpu@101 {
6fe745255e3d2a Dang Huynh 2025-08-20   100  			compatible = "arm,cortex-a53";
6fe745255e3d2a Dang Huynh 2025-08-20   101  			reg = <0x101>;
6fe745255e3d2a Dang Huynh 2025-08-20   102  			device_type = "cpu";
6fe745255e3d2a Dang Huynh 2025-08-20   103  			next-level-cache = <&l2_1>;
6fe745255e3d2a Dang Huynh 2025-08-20   104  			enable-method = "psci";
6fe745255e3d2a Dang Huynh 2025-08-20   105  			operating-points-v2 = <&cpu_opp_table_c1>;
6fe745255e3d2a Dang Huynh 2025-08-20   106  			#cooling-cells = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   107  		};
6fe745255e3d2a Dang Huynh 2025-08-20   108  
6fe745255e3d2a Dang Huynh 2025-08-20   109  		cpu6: cpu@102 {
6fe745255e3d2a Dang Huynh 2025-08-20   110  			compatible = "arm,cortex-a53";
6fe745255e3d2a Dang Huynh 2025-08-20   111  			reg = <0x102>;
6fe745255e3d2a Dang Huynh 2025-08-20   112  			device_type = "cpu";
6fe745255e3d2a Dang Huynh 2025-08-20   113  			next-level-cache = <&l2_1>;
6fe745255e3d2a Dang Huynh 2025-08-20   114  			enable-method = "psci";
6fe745255e3d2a Dang Huynh 2025-08-20   115  			operating-points-v2 = <&cpu_opp_table_c1>;
6fe745255e3d2a Dang Huynh 2025-08-20   116  			#cooling-cells = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   117  		};
6fe745255e3d2a Dang Huynh 2025-08-20   118  
6fe745255e3d2a Dang Huynh 2025-08-20   119  		cpu7: cpu@103 {
6fe745255e3d2a Dang Huynh 2025-08-20   120  			compatible = "arm,cortex-a53";
6fe745255e3d2a Dang Huynh 2025-08-20   121  			reg = <0x103>;
6fe745255e3d2a Dang Huynh 2025-08-20   122  			device_type = "cpu";
6fe745255e3d2a Dang Huynh 2025-08-20   123  			next-level-cache = <&l2_1>;
6fe745255e3d2a Dang Huynh 2025-08-20   124  			enable-method = "psci";
6fe745255e3d2a Dang Huynh 2025-08-20   125  			operating-points-v2 = <&cpu_opp_table_c1>;
6fe745255e3d2a Dang Huynh 2025-08-20   126  			#cooling-cells = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   127  		};
6fe745255e3d2a Dang Huynh 2025-08-20   128  
6fe745255e3d2a Dang Huynh 2025-08-20   129  		cpu-map {
6fe745255e3d2a Dang Huynh 2025-08-20   130  			/* Little Cores */
6fe745255e3d2a Dang Huynh 2025-08-20   131  			cluster0 {
6fe745255e3d2a Dang Huynh 2025-08-20   132  				core0 {
6fe745255e3d2a Dang Huynh 2025-08-20   133  					cpu = <&cpu0>;
6fe745255e3d2a Dang Huynh 2025-08-20   134  				};
6fe745255e3d2a Dang Huynh 2025-08-20   135  
6fe745255e3d2a Dang Huynh 2025-08-20   136  				core1 {
6fe745255e3d2a Dang Huynh 2025-08-20   137  					cpu = <&cpu1>;
6fe745255e3d2a Dang Huynh 2025-08-20   138  				};
6fe745255e3d2a Dang Huynh 2025-08-20   139  
6fe745255e3d2a Dang Huynh 2025-08-20   140  				core2 {
6fe745255e3d2a Dang Huynh 2025-08-20   141  					cpu = <&cpu2>;
6fe745255e3d2a Dang Huynh 2025-08-20   142  				};
6fe745255e3d2a Dang Huynh 2025-08-20   143  
6fe745255e3d2a Dang Huynh 2025-08-20   144  				core3 {
6fe745255e3d2a Dang Huynh 2025-08-20   145  					cpu = <&cpu3>;
6fe745255e3d2a Dang Huynh 2025-08-20   146  				};
6fe745255e3d2a Dang Huynh 2025-08-20   147  			};
6fe745255e3d2a Dang Huynh 2025-08-20   148  
6fe745255e3d2a Dang Huynh 2025-08-20   149  			/* Big Cores */
6fe745255e3d2a Dang Huynh 2025-08-20   150  			cluster1 {
6fe745255e3d2a Dang Huynh 2025-08-20   151  				core0 {
6fe745255e3d2a Dang Huynh 2025-08-20   152  					cpu = <&cpu4>;
6fe745255e3d2a Dang Huynh 2025-08-20   153  				};
6fe745255e3d2a Dang Huynh 2025-08-20   154  
6fe745255e3d2a Dang Huynh 2025-08-20   155  				core1 {
6fe745255e3d2a Dang Huynh 2025-08-20   156  					cpu = <&cpu5>;
6fe745255e3d2a Dang Huynh 2025-08-20   157  				};
6fe745255e3d2a Dang Huynh 2025-08-20   158  
6fe745255e3d2a Dang Huynh 2025-08-20   159  				core2 {
6fe745255e3d2a Dang Huynh 2025-08-20   160  					cpu = <&cpu6>;
6fe745255e3d2a Dang Huynh 2025-08-20   161  				};
6fe745255e3d2a Dang Huynh 2025-08-20   162  
6fe745255e3d2a Dang Huynh 2025-08-20   163  				core3 {
6fe745255e3d2a Dang Huynh 2025-08-20   164  					cpu = <&cpu7>;
6fe745255e3d2a Dang Huynh 2025-08-20   165  				};
6fe745255e3d2a Dang Huynh 2025-08-20   166  			};
6fe745255e3d2a Dang Huynh 2025-08-20   167  		};
6fe745255e3d2a Dang Huynh 2025-08-20   168  	};
6fe745255e3d2a Dang Huynh 2025-08-20   169  
6fe745255e3d2a Dang Huynh 2025-08-20   170  	firmware {
6fe745255e3d2a Dang Huynh 2025-08-20   171  		scm: scm {
6fe745255e3d2a Dang Huynh 2025-08-20   172  			compatible = "qcom,scm-msm8916", "qcom,scm";
6fe745255e3d2a Dang Huynh 2025-08-20   173  			clocks = <&gcc GCC_CRYPTO_CLK>,
6fe745255e3d2a Dang Huynh 2025-08-20   174  				 <&gcc GCC_CRYPTO_AXI_CLK>,
6fe745255e3d2a Dang Huynh 2025-08-20   175  				 <&gcc GCC_CRYPTO_AHB_CLK>;
6fe745255e3d2a Dang Huynh 2025-08-20   176  			clock-names = "core",
6fe745255e3d2a Dang Huynh 2025-08-20   177  				      "bus",
6fe745255e3d2a Dang Huynh 2025-08-20   178  				      "iface";
6fe745255e3d2a Dang Huynh 2025-08-20   179  			#reset-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20   180  
6fe745255e3d2a Dang Huynh 2025-08-20   181  			qcom,dload-mode = <&tcsr 0x6100>;
6fe745255e3d2a Dang Huynh 2025-08-20   182  		};
6fe745255e3d2a Dang Huynh 2025-08-20   183  	};
6fe745255e3d2a Dang Huynh 2025-08-20   184  
6fe745255e3d2a Dang Huynh 2025-08-20   185  	memory@80000000 {
6fe745255e3d2a Dang Huynh 2025-08-20   186  		/* We expect the bootloader to fill in the reg */
6fe745255e3d2a Dang Huynh 2025-08-20   187  		reg = <0 0x80000000 0 0>;
6fe745255e3d2a Dang Huynh 2025-08-20   188  		device_type = "memory";
6fe745255e3d2a Dang Huynh 2025-08-20   189  	};
6fe745255e3d2a Dang Huynh 2025-08-20   190  
6fe745255e3d2a Dang Huynh 2025-08-20   191  	reserved-memory {
6fe745255e3d2a Dang Huynh 2025-08-20   192  		ranges;
6fe745255e3d2a Dang Huynh 2025-08-20   193  		#address-cells = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   194  		#size-cells = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   195  
6fe745255e3d2a Dang Huynh 2025-08-20   196  		qseecom_mem: reserved@85b00000 {
6fe745255e3d2a Dang Huynh 2025-08-20   197  			reg = <0x0 0x85b00000 0x0 0x800000>;
6fe745255e3d2a Dang Huynh 2025-08-20   198  			no-map;
6fe745255e3d2a Dang Huynh 2025-08-20   199  		};
6fe745255e3d2a Dang Huynh 2025-08-20   200  
6fe745255e3d2a Dang Huynh 2025-08-20   201  		smem@86300000 {
6fe745255e3d2a Dang Huynh 2025-08-20   202  			compatible = "qcom,smem";
6fe745255e3d2a Dang Huynh 2025-08-20   203  			reg = <0x0 0x86300000 0x0 0x100000>;
6fe745255e3d2a Dang Huynh 2025-08-20   204  			no-map;
6fe745255e3d2a Dang Huynh 2025-08-20   205  
6fe745255e3d2a Dang Huynh 2025-08-20   206  			hwlocks = <&tcsr_mutex 3>;
6fe745255e3d2a Dang Huynh 2025-08-20   207  			qcom,rpm-msg-ram = <&rpm_msg_ram>;
6fe745255e3d2a Dang Huynh 2025-08-20   208  		};
6fe745255e3d2a Dang Huynh 2025-08-20   209  
6fe745255e3d2a Dang Huynh 2025-08-20   210  		reserved@86400000 {
6fe745255e3d2a Dang Huynh 2025-08-20   211  			reg = <0x0 0x86400000 0x0 0x400000>;
6fe745255e3d2a Dang Huynh 2025-08-20   212  			no-map;
6fe745255e3d2a Dang Huynh 2025-08-20   213  		};
6fe745255e3d2a Dang Huynh 2025-08-20   214  
6fe745255e3d2a Dang Huynh 2025-08-20   215  		rmtfs@92100000 {
6fe745255e3d2a Dang Huynh 2025-08-20   216  			compatible = "qcom,rmtfs-mem";
6fe745255e3d2a Dang Huynh 2025-08-20   217  			reg = <0x0 0x92100000 0x0 0x180000>;
6fe745255e3d2a Dang Huynh 2025-08-20   218  			no-map;
6fe745255e3d2a Dang Huynh 2025-08-20   219  
6fe745255e3d2a Dang Huynh 2025-08-20   220  			qcom,client-id = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20   221  		};
6fe745255e3d2a Dang Huynh 2025-08-20   222  
6fe745255e3d2a Dang Huynh 2025-08-20   223  		adsp_mem: adsp {
6fe745255e3d2a Dang Huynh 2025-08-20   224  			size = <0x0 0x1100000>;
6fe745255e3d2a Dang Huynh 2025-08-20   225  			alignment = <0x0 0x100000>;
6fe745255e3d2a Dang Huynh 2025-08-20   226  			alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
6fe745255e3d2a Dang Huynh 2025-08-20   227  			no-map;
6fe745255e3d2a Dang Huynh 2025-08-20   228  			status = "disabled";
6fe745255e3d2a Dang Huynh 2025-08-20   229  		};
6fe745255e3d2a Dang Huynh 2025-08-20   230  
6fe745255e3d2a Dang Huynh 2025-08-20   231  		mba_mem: mba {
6fe745255e3d2a Dang Huynh 2025-08-20   232  			size = <0x0 0x100000>;
6fe745255e3d2a Dang Huynh 2025-08-20   233  			alignment = <0x0 0x100000>;
6fe745255e3d2a Dang Huynh 2025-08-20   234  			alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
6fe745255e3d2a Dang Huynh 2025-08-20   235  			no-map;
6fe745255e3d2a Dang Huynh 2025-08-20   236  			status = "disabled";
6fe745255e3d2a Dang Huynh 2025-08-20   237  		};
6fe745255e3d2a Dang Huynh 2025-08-20   238  
6fe745255e3d2a Dang Huynh 2025-08-20   239  		wcnss_mem: wcnss {
6fe745255e3d2a Dang Huynh 2025-08-20   240  			size = <0x0 0x700000>;
6fe745255e3d2a Dang Huynh 2025-08-20   241  			alignment = <0x0 0x100000>;
6fe745255e3d2a Dang Huynh 2025-08-20   242  			alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
6fe745255e3d2a Dang Huynh 2025-08-20   243  			no-map;
6fe745255e3d2a Dang Huynh 2025-08-20   244  			status = "disabled";
6fe745255e3d2a Dang Huynh 2025-08-20   245  		};
6fe745255e3d2a Dang Huynh 2025-08-20   246  
6fe745255e3d2a Dang Huynh 2025-08-20   247  		venus_mem: venus {
6fe745255e3d2a Dang Huynh 2025-08-20   248  			size = <0x0 0x400000>;
6fe745255e3d2a Dang Huynh 2025-08-20   249  			alignment = <0x0 0x100000>;
6fe745255e3d2a Dang Huynh 2025-08-20   250  			alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
6fe745255e3d2a Dang Huynh 2025-08-20   251  			no-map;
6fe745255e3d2a Dang Huynh 2025-08-20   252  			status = "disabled";
6fe745255e3d2a Dang Huynh 2025-08-20   253  		};
6fe745255e3d2a Dang Huynh 2025-08-20   254  	};
6fe745255e3d2a Dang Huynh 2025-08-20   255  
6fe745255e3d2a Dang Huynh 2025-08-20   256  	cpu_opp_table_c0: opp-table-c0 {
6fe745255e3d2a Dang Huynh 2025-08-20   257  		compatible = "operating-points-v2";
6fe745255e3d2a Dang Huynh 2025-08-20   258  		opp-shared;
6fe745255e3d2a Dang Huynh 2025-08-20   259  
6fe745255e3d2a Dang Huynh 2025-08-20   260  		opp-768000000 {
6fe745255e3d2a Dang Huynh 2025-08-20   261  			opp-hz = /bits/ 64 <768000000>;
6fe745255e3d2a Dang Huynh 2025-08-20   262  		};
6fe745255e3d2a Dang Huynh 2025-08-20   263  
6fe745255e3d2a Dang Huynh 2025-08-20   264  		opp-902400000 {
6fe745255e3d2a Dang Huynh 2025-08-20   265  			opp-hz = /bits/ 64 <902400000>;
6fe745255e3d2a Dang Huynh 2025-08-20   266  		};
6fe745255e3d2a Dang Huynh 2025-08-20   267  
6fe745255e3d2a Dang Huynh 2025-08-20   268  		opp-998400000 {
6fe745255e3d2a Dang Huynh 2025-08-20   269  			opp-hz = /bits/ 64 <998400000>;
6fe745255e3d2a Dang Huynh 2025-08-20   270  		};
6fe745255e3d2a Dang Huynh 2025-08-20   271  
6fe745255e3d2a Dang Huynh 2025-08-20   272  		opp-1094400000 {
6fe745255e3d2a Dang Huynh 2025-08-20   273  			opp-hz = /bits/ 64 <1094400000>;
6fe745255e3d2a Dang Huynh 2025-08-20   274  		};
6fe745255e3d2a Dang Huynh 2025-08-20   275  	};
6fe745255e3d2a Dang Huynh 2025-08-20   276  
6fe745255e3d2a Dang Huynh 2025-08-20   277  	cpu_opp_table_c1: opp-table-c1 {
6fe745255e3d2a Dang Huynh 2025-08-20   278  		compatible = "operating-points-v2";
6fe745255e3d2a Dang Huynh 2025-08-20   279  		opp-shared;
6fe745255e3d2a Dang Huynh 2025-08-20   280  
6fe745255e3d2a Dang Huynh 2025-08-20   281  		opp-960000000 {
6fe745255e3d2a Dang Huynh 2025-08-20   282  			opp-hz = /bits/ 64 <960000000>;
6fe745255e3d2a Dang Huynh 2025-08-20   283  		};
6fe745255e3d2a Dang Huynh 2025-08-20   284  
6fe745255e3d2a Dang Huynh 2025-08-20   285  		opp-1094400000 {
6fe745255e3d2a Dang Huynh 2025-08-20   286  			opp-hz = /bits/ 64 <1094400000>;
6fe745255e3d2a Dang Huynh 2025-08-20   287  		};
6fe745255e3d2a Dang Huynh 2025-08-20   288  
6fe745255e3d2a Dang Huynh 2025-08-20   289  		opp-1209600000 {
6fe745255e3d2a Dang Huynh 2025-08-20   290  			opp-hz = /bits/ 64 <1209600000>;
6fe745255e3d2a Dang Huynh 2025-08-20   291  		};
6fe745255e3d2a Dang Huynh 2025-08-20   292  
6fe745255e3d2a Dang Huynh 2025-08-20   293  		opp-1248000000 {
6fe745255e3d2a Dang Huynh 2025-08-20   294  			opp-hz = /bits/ 64 <1248000000>;
6fe745255e3d2a Dang Huynh 2025-08-20   295  		};
6fe745255e3d2a Dang Huynh 2025-08-20   296  
6fe745255e3d2a Dang Huynh 2025-08-20   297  		opp-1344000000 {
6fe745255e3d2a Dang Huynh 2025-08-20   298  			opp-hz = /bits/ 64 <1344000000>;
6fe745255e3d2a Dang Huynh 2025-08-20   299  		};
6fe745255e3d2a Dang Huynh 2025-08-20   300  
6fe745255e3d2a Dang Huynh 2025-08-20   301  		opp-1401600000 {
6fe745255e3d2a Dang Huynh 2025-08-20   302  			opp-hz = /bits/ 64 <1401600000>;
6fe745255e3d2a Dang Huynh 2025-08-20   303  		};
6fe745255e3d2a Dang Huynh 2025-08-20   304  	};
6fe745255e3d2a Dang Huynh 2025-08-20   305  
6fe745255e3d2a Dang Huynh 2025-08-20   306  	pmu {
6fe745255e3d2a Dang Huynh 2025-08-20   307  		compatible = "arm,cortex-a53-pmu";
6fe745255e3d2a Dang Huynh 2025-08-20   308  		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
6fe745255e3d2a Dang Huynh 2025-08-20   309  	};
6fe745255e3d2a Dang Huynh 2025-08-20   310  
6fe745255e3d2a Dang Huynh 2025-08-20   311  	psci {
6fe745255e3d2a Dang Huynh 2025-08-20   312  		compatible = "arm,psci-1.0";
6fe745255e3d2a Dang Huynh 2025-08-20   313  		method = "smc";
6fe745255e3d2a Dang Huynh 2025-08-20   314  	};
6fe745255e3d2a Dang Huynh 2025-08-20   315  
6fe745255e3d2a Dang Huynh 2025-08-20   316  	rpm: remoteproc {
6fe745255e3d2a Dang Huynh 2025-08-20   317  		compatible = "qcom,msm8937-rpm-proc", "qcom,rpm-proc";
6fe745255e3d2a Dang Huynh 2025-08-20   318  
6fe745255e3d2a Dang Huynh 2025-08-20   319  		smd-edge {
6fe745255e3d2a Dang Huynh 2025-08-20   320  			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
6fe745255e3d2a Dang Huynh 2025-08-20   321  			qcom,ipc = <&apcs1 8 0>;
6fe745255e3d2a Dang Huynh 2025-08-20   322  			qcom,smd-edge = <15>;
6fe745255e3d2a Dang Huynh 2025-08-20   323  
6fe745255e3d2a Dang Huynh 2025-08-20   324  			rpm_requests: rpm-requests {
6fe745255e3d2a Dang Huynh 2025-08-20   325  				compatible = "qcom,rpm-msm8937", "qcom,smd-rpm";
6fe745255e3d2a Dang Huynh 2025-08-20   326  				qcom,smd-channels = "rpm_requests";
6fe745255e3d2a Dang Huynh 2025-08-20   327  
6fe745255e3d2a Dang Huynh 2025-08-20   328  				rpmcc: clock-controller {
6fe745255e3d2a Dang Huynh 2025-08-20   329  					compatible = "qcom,rpmcc-msm8937", "qcom,rpmcc";
6fe745255e3d2a Dang Huynh 2025-08-20   330  					#clock-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20   331  					clocks = <&xo_board>;
6fe745255e3d2a Dang Huynh 2025-08-20   332  					clock-names = "xo";
6fe745255e3d2a Dang Huynh 2025-08-20   333  				};
6fe745255e3d2a Dang Huynh 2025-08-20   334  
6fe745255e3d2a Dang Huynh 2025-08-20   335  				rpmpd: power-controller {
6fe745255e3d2a Dang Huynh 2025-08-20   336  					compatible = "qcom,msm8937-rpmpd", "qcom,msm8917-rpmpd";
6fe745255e3d2a Dang Huynh 2025-08-20   337  					#power-domain-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20   338  					operating-points-v2 = <&rpmpd_opp_table>;
6fe745255e3d2a Dang Huynh 2025-08-20   339  
6fe745255e3d2a Dang Huynh 2025-08-20   340  					rpmpd_opp_table: opp-table {
6fe745255e3d2a Dang Huynh 2025-08-20   341  						compatible = "operating-points-v2";
6fe745255e3d2a Dang Huynh 2025-08-20   342  
6fe745255e3d2a Dang Huynh 2025-08-20   343  						rpmpd_opp_ret: opp1 {
6fe745255e3d2a Dang Huynh 2025-08-20   344  							opp-level = <RPM_SMD_LEVEL_RETENTION>;
6fe745255e3d2a Dang Huynh 2025-08-20   345  						};
6fe745255e3d2a Dang Huynh 2025-08-20   346  
6fe745255e3d2a Dang Huynh 2025-08-20   347  						rpmpd_opp_ret_plus: opp2 {
6fe745255e3d2a Dang Huynh 2025-08-20   348  							opp-level = <RPM_SMD_LEVEL_RETENTION_PLUS>;
6fe745255e3d2a Dang Huynh 2025-08-20   349  						};
6fe745255e3d2a Dang Huynh 2025-08-20   350  
6fe745255e3d2a Dang Huynh 2025-08-20   351  						rpmpd_opp_min_svs: opp3 {
6fe745255e3d2a Dang Huynh 2025-08-20   352  							opp-level = <RPM_SMD_LEVEL_MIN_SVS>;
6fe745255e3d2a Dang Huynh 2025-08-20   353  						};
6fe745255e3d2a Dang Huynh 2025-08-20   354  
6fe745255e3d2a Dang Huynh 2025-08-20   355  						rpmpd_opp_low_svs: opp4 {
6fe745255e3d2a Dang Huynh 2025-08-20   356  							opp-level = <RPM_SMD_LEVEL_LOW_SVS>;
6fe745255e3d2a Dang Huynh 2025-08-20   357  						};
6fe745255e3d2a Dang Huynh 2025-08-20   358  
6fe745255e3d2a Dang Huynh 2025-08-20   359  						rpmpd_opp_svs: opp5 {
6fe745255e3d2a Dang Huynh 2025-08-20   360  							opp-level = <RPM_SMD_LEVEL_SVS>;
6fe745255e3d2a Dang Huynh 2025-08-20   361  						};
6fe745255e3d2a Dang Huynh 2025-08-20   362  
6fe745255e3d2a Dang Huynh 2025-08-20   363  						rpmpd_opp_svs_plus: opp6 {
6fe745255e3d2a Dang Huynh 2025-08-20   364  							opp-level = <RPM_SMD_LEVEL_SVS_PLUS>;
6fe745255e3d2a Dang Huynh 2025-08-20   365  						};
6fe745255e3d2a Dang Huynh 2025-08-20   366  
6fe745255e3d2a Dang Huynh 2025-08-20   367  						rpmpd_opp_nom: opp7 {
6fe745255e3d2a Dang Huynh 2025-08-20   368  							opp-level = <RPM_SMD_LEVEL_NOM>;
6fe745255e3d2a Dang Huynh 2025-08-20   369  						};
6fe745255e3d2a Dang Huynh 2025-08-20   370  
6fe745255e3d2a Dang Huynh 2025-08-20   371  						rpmpd_opp_nom_plus: opp8 {
6fe745255e3d2a Dang Huynh 2025-08-20   372  							opp-level = <RPM_SMD_LEVEL_NOM_PLUS>;
6fe745255e3d2a Dang Huynh 2025-08-20   373  						};
6fe745255e3d2a Dang Huynh 2025-08-20   374  
6fe745255e3d2a Dang Huynh 2025-08-20   375  						rpmpd_opp_turbo: opp9 {
6fe745255e3d2a Dang Huynh 2025-08-20   376  							opp-level = <RPM_SMD_LEVEL_TURBO>;
6fe745255e3d2a Dang Huynh 2025-08-20   377  						};
6fe745255e3d2a Dang Huynh 2025-08-20   378  					};
6fe745255e3d2a Dang Huynh 2025-08-20   379  				};
6fe745255e3d2a Dang Huynh 2025-08-20   380  			};
6fe745255e3d2a Dang Huynh 2025-08-20   381  		};
6fe745255e3d2a Dang Huynh 2025-08-20   382  	};
6fe745255e3d2a Dang Huynh 2025-08-20   383  
6fe745255e3d2a Dang Huynh 2025-08-20   384  	smp2p-adsp {
6fe745255e3d2a Dang Huynh 2025-08-20   385  		compatible = "qcom,smp2p";
6fe745255e3d2a Dang Huynh 2025-08-20   386  		qcom,smem = <443>, <429>;
6fe745255e3d2a Dang Huynh 2025-08-20   387  
6fe745255e3d2a Dang Huynh 2025-08-20   388  		interrupts = <GIC_SPI 291 IRQ_TYPE_EDGE_RISING>;
6fe745255e3d2a Dang Huynh 2025-08-20   389  
6fe745255e3d2a Dang Huynh 2025-08-20   390  		mboxes = <&apcs1 10>;
6fe745255e3d2a Dang Huynh 2025-08-20   391  
6fe745255e3d2a Dang Huynh 2025-08-20   392  		qcom,local-pid = <0>;
6fe745255e3d2a Dang Huynh 2025-08-20   393  		qcom,remote-pid = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   394  
6fe745255e3d2a Dang Huynh 2025-08-20   395  		adsp_smp2p_out: master-kernel {
6fe745255e3d2a Dang Huynh 2025-08-20   396  			qcom,entry-name = "master-kernel";
6fe745255e3d2a Dang Huynh 2025-08-20   397  
6fe745255e3d2a Dang Huynh 2025-08-20   398  			#qcom,smem-state-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20   399  		};
6fe745255e3d2a Dang Huynh 2025-08-20   400  
6fe745255e3d2a Dang Huynh 2025-08-20   401  		adsp_smp2p_in: slave-kernel {
6fe745255e3d2a Dang Huynh 2025-08-20   402  			qcom,entry-name = "slave-kernel";
6fe745255e3d2a Dang Huynh 2025-08-20   403  
6fe745255e3d2a Dang Huynh 2025-08-20   404  			interrupt-controller;
6fe745255e3d2a Dang Huynh 2025-08-20   405  			#interrupt-cells = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   406  		};
6fe745255e3d2a Dang Huynh 2025-08-20   407  	};
6fe745255e3d2a Dang Huynh 2025-08-20   408  
6fe745255e3d2a Dang Huynh 2025-08-20   409  	smp2p-modem {
6fe745255e3d2a Dang Huynh 2025-08-20   410  		compatible = "qcom,smp2p";
6fe745255e3d2a Dang Huynh 2025-08-20   411  		qcom,smem = <435>, <428>;
6fe745255e3d2a Dang Huynh 2025-08-20   412  
6fe745255e3d2a Dang Huynh 2025-08-20   413  		interrupts = <GIC_SPI 27 IRQ_TYPE_EDGE_RISING>;
6fe745255e3d2a Dang Huynh 2025-08-20   414  
6fe745255e3d2a Dang Huynh 2025-08-20   415  		mboxes = <&apcs1 14>;
6fe745255e3d2a Dang Huynh 2025-08-20   416  
6fe745255e3d2a Dang Huynh 2025-08-20   417  		qcom,local-pid = <0>;
6fe745255e3d2a Dang Huynh 2025-08-20   418  		qcom,remote-pid = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20   419  
6fe745255e3d2a Dang Huynh 2025-08-20   420  		modem_smp2p_out: master-kernel {
6fe745255e3d2a Dang Huynh 2025-08-20   421  			qcom,entry-name = "master-kernel";
6fe745255e3d2a Dang Huynh 2025-08-20   422  
6fe745255e3d2a Dang Huynh 2025-08-20   423  			#qcom,smem-state-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20   424  		};
6fe745255e3d2a Dang Huynh 2025-08-20   425  
6fe745255e3d2a Dang Huynh 2025-08-20   426  		modem_smp2p_in: slave-kernel {
6fe745255e3d2a Dang Huynh 2025-08-20   427  			qcom,entry-name = "slave-kernel";
6fe745255e3d2a Dang Huynh 2025-08-20   428  
6fe745255e3d2a Dang Huynh 2025-08-20   429  			interrupt-controller;
6fe745255e3d2a Dang Huynh 2025-08-20   430  			#interrupt-cells = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   431  		};
6fe745255e3d2a Dang Huynh 2025-08-20   432  	};
6fe745255e3d2a Dang Huynh 2025-08-20   433  
6fe745255e3d2a Dang Huynh 2025-08-20   434  	smp2p-wcnss {
6fe745255e3d2a Dang Huynh 2025-08-20   435  		compatible = "qcom,smp2p";
6fe745255e3d2a Dang Huynh 2025-08-20   436  		qcom,smem = <451>, <431>;
6fe745255e3d2a Dang Huynh 2025-08-20   437  
6fe745255e3d2a Dang Huynh 2025-08-20   438  		interrupts = <GIC_SPI 143 IRQ_TYPE_EDGE_RISING>;
6fe745255e3d2a Dang Huynh 2025-08-20   439  
6fe745255e3d2a Dang Huynh 2025-08-20   440  		mboxes = <&apcs1 18>;
6fe745255e3d2a Dang Huynh 2025-08-20   441  
6fe745255e3d2a Dang Huynh 2025-08-20   442  		qcom,local-pid = <0>;
6fe745255e3d2a Dang Huynh 2025-08-20   443  		qcom,remote-pid = <4>;
6fe745255e3d2a Dang Huynh 2025-08-20   444  
6fe745255e3d2a Dang Huynh 2025-08-20   445  		wcnss_smp2p_out: master-kernel {
6fe745255e3d2a Dang Huynh 2025-08-20   446  			qcom,entry-name = "master-kernel";
6fe745255e3d2a Dang Huynh 2025-08-20   447  
6fe745255e3d2a Dang Huynh 2025-08-20   448  			#qcom,smem-state-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20   449  		};
6fe745255e3d2a Dang Huynh 2025-08-20   450  
6fe745255e3d2a Dang Huynh 2025-08-20   451  		wcnss_smp2p_in: slave-kernel {
6fe745255e3d2a Dang Huynh 2025-08-20   452  			qcom,entry-name = "slave-kernel";
6fe745255e3d2a Dang Huynh 2025-08-20   453  
6fe745255e3d2a Dang Huynh 2025-08-20   454  			interrupt-controller;
6fe745255e3d2a Dang Huynh 2025-08-20   455  			#interrupt-cells = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   456  		};
6fe745255e3d2a Dang Huynh 2025-08-20   457  	};
6fe745255e3d2a Dang Huynh 2025-08-20   458  
6fe745255e3d2a Dang Huynh 2025-08-20   459  	smsm {
6fe745255e3d2a Dang Huynh 2025-08-20   460  		compatible = "qcom,smsm";
6fe745255e3d2a Dang Huynh 2025-08-20   461  
6fe745255e3d2a Dang Huynh 2025-08-20   462  		#address-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20   463  		#size-cells = <0>;
6fe745255e3d2a Dang Huynh 2025-08-20   464  
6fe745255e3d2a Dang Huynh 2025-08-20   465  		mboxes = <0>, <&apcs1 13>, <0>, <&apcs1 19>;
6fe745255e3d2a Dang Huynh 2025-08-20   466  
6fe745255e3d2a Dang Huynh 2025-08-20   467  		apps_smsm: apps@0 {
6fe745255e3d2a Dang Huynh 2025-08-20   468  			reg = <0>;
6fe745255e3d2a Dang Huynh 2025-08-20   469  
6fe745255e3d2a Dang Huynh 2025-08-20   470  			#qcom,smem-state-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20   471  		};
6fe745255e3d2a Dang Huynh 2025-08-20   472  
6fe745255e3d2a Dang Huynh 2025-08-20   473  		hexagon_smsm: hexagon@1 {
6fe745255e3d2a Dang Huynh 2025-08-20   474  			reg = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20   475  			interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
6fe745255e3d2a Dang Huynh 2025-08-20   476  
6fe745255e3d2a Dang Huynh 2025-08-20   477  			interrupt-controller;
6fe745255e3d2a Dang Huynh 2025-08-20   478  			#interrupt-cells = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   479  		};
6fe745255e3d2a Dang Huynh 2025-08-20   480  
6fe745255e3d2a Dang Huynh 2025-08-20   481  		wcnss_smsm: wcnss@6 {
6fe745255e3d2a Dang Huynh 2025-08-20   482  			reg = <6>;
6fe745255e3d2a Dang Huynh 2025-08-20   483  			interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
6fe745255e3d2a Dang Huynh 2025-08-20   484  
6fe745255e3d2a Dang Huynh 2025-08-20   485  			interrupt-controller;
6fe745255e3d2a Dang Huynh 2025-08-20   486  			#interrupt-cells = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   487  		};
6fe745255e3d2a Dang Huynh 2025-08-20   488  	};
6fe745255e3d2a Dang Huynh 2025-08-20   489  
6fe745255e3d2a Dang Huynh 2025-08-20   490  	soc: soc@0 {
6fe745255e3d2a Dang Huynh 2025-08-20   491  		compatible = "simple-bus";
6fe745255e3d2a Dang Huynh 2025-08-20   492  		ranges = <0 0 0 0xffffffff>;
6fe745255e3d2a Dang Huynh 2025-08-20   493  		#address-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20   494  		#size-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20   495  
6fe745255e3d2a Dang Huynh 2025-08-20   496  		qfprom: qfprom@a4000 {
6fe745255e3d2a Dang Huynh 2025-08-20   497  			compatible = "qcom,msm8937-qfprom", "qcom,qfprom";
6fe745255e3d2a Dang Huynh 2025-08-20   498  			reg = <0x000a4000 0x1000>;
6fe745255e3d2a Dang Huynh 2025-08-20   499  			#address-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20   500  			#size-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20   501  
6fe745255e3d2a Dang Huynh 2025-08-20   502  			tsens_base1: base1@1d8 {
6fe745255e3d2a Dang Huynh 2025-08-20   503  				reg = <0x1d8 0x1>;
6fe745255e3d2a Dang Huynh 2025-08-20   504  				bits = <0 8>;
6fe745255e3d2a Dang Huynh 2025-08-20   505  			};
6fe745255e3d2a Dang Huynh 2025-08-20   506  
6fe745255e3d2a Dang Huynh 2025-08-20   507  			tsens_s5_p1: s5-p1@1d9 {
6fe745255e3d2a Dang Huynh 2025-08-20   508  				reg = <0x1d9 0x1>;
6fe745255e3d2a Dang Huynh 2025-08-20   509  				bits = <0 6>;
6fe745255e3d2a Dang Huynh 2025-08-20   510  			};
6fe745255e3d2a Dang Huynh 2025-08-20   511  
6fe745255e3d2a Dang Huynh 2025-08-20   512  			tsens_s5_p2: s5-p2@1d9 {
6fe745255e3d2a Dang Huynh 2025-08-20   513  				reg = <0x1d9 0x2>;
6fe745255e3d2a Dang Huynh 2025-08-20   514  				bits = <6 6>;
6fe745255e3d2a Dang Huynh 2025-08-20   515  			};
6fe745255e3d2a Dang Huynh 2025-08-20   516  
6fe745255e3d2a Dang Huynh 2025-08-20   517  			tsens_s6_p1: s6-p1@1da {
6fe745255e3d2a Dang Huynh 2025-08-20   518  				reg = <0x1da 0x2>;
6fe745255e3d2a Dang Huynh 2025-08-20   519  				bits = <4 6>;
6fe745255e3d2a Dang Huynh 2025-08-20   520  			};
6fe745255e3d2a Dang Huynh 2025-08-20   521  
6fe745255e3d2a Dang Huynh 2025-08-20   522  			tsens_s6_p2: s6-p2@1db {
6fe745255e3d2a Dang Huynh 2025-08-20   523  				reg = <0x1db 0x1>;
6fe745255e3d2a Dang Huynh 2025-08-20   524  				bits = <2 6>;
6fe745255e3d2a Dang Huynh 2025-08-20   525  			};
6fe745255e3d2a Dang Huynh 2025-08-20   526  
6fe745255e3d2a Dang Huynh 2025-08-20   527  			tsens_s7_p1: s7-p1@1dc {
6fe745255e3d2a Dang Huynh 2025-08-20   528  				reg = <0x1dc 0x1>;
6fe745255e3d2a Dang Huynh 2025-08-20   529  				bits = <0 6>;
6fe745255e3d2a Dang Huynh 2025-08-20   530  			};
6fe745255e3d2a Dang Huynh 2025-08-20   531  
6fe745255e3d2a Dang Huynh 2025-08-20   532  			tsens_s7_p2: s7-p2@1dc {
6fe745255e3d2a Dang Huynh 2025-08-20   533  				reg = <0x1dc 0x2>;
6fe745255e3d2a Dang Huynh 2025-08-20   534  				bits = <6 6>;
6fe745255e3d2a Dang Huynh 2025-08-20   535  			};
6fe745255e3d2a Dang Huynh 2025-08-20   536  
6fe745255e3d2a Dang Huynh 2025-08-20   537  			tsens_s8_p1: s8-p1@1dd {
6fe745255e3d2a Dang Huynh 2025-08-20   538  				reg = <0x1dd 0x2>;
6fe745255e3d2a Dang Huynh 2025-08-20   539  				bits = <4 6>;
6fe745255e3d2a Dang Huynh 2025-08-20   540  			};
6fe745255e3d2a Dang Huynh 2025-08-20   541  
6fe745255e3d2a Dang Huynh 2025-08-20   542  			tsens_s8_p2: s8-p2@1de {
6fe745255e3d2a Dang Huynh 2025-08-20   543  				reg = <0x1de 0x1>;
6fe745255e3d2a Dang Huynh 2025-08-20   544  				bits = <2 6>;
6fe745255e3d2a Dang Huynh 2025-08-20   545  			};
6fe745255e3d2a Dang Huynh 2025-08-20   546  
6fe745255e3d2a Dang Huynh 2025-08-20   547  			tsens_base2: base2@1df {
6fe745255e3d2a Dang Huynh 2025-08-20   548  				reg = <0x1df 0x1>;
6fe745255e3d2a Dang Huynh 2025-08-20   549  				bits = <0 8>;
6fe745255e3d2a Dang Huynh 2025-08-20   550  			};
6fe745255e3d2a Dang Huynh 2025-08-20   551  
6fe745255e3d2a Dang Huynh 2025-08-20   552  			tsens_mode: mode@210 {
6fe745255e3d2a Dang Huynh 2025-08-20   553  				reg = <0x210 0x1>;
6fe745255e3d2a Dang Huynh 2025-08-20   554  				bits = <0 3>;
6fe745255e3d2a Dang Huynh 2025-08-20   555  			};
6fe745255e3d2a Dang Huynh 2025-08-20   556  
6fe745255e3d2a Dang Huynh 2025-08-20   557  			tsens_s0_p1: s0-p1@210 {
6fe745255e3d2a Dang Huynh 2025-08-20   558  				reg = <0x210 0x2>;
6fe745255e3d2a Dang Huynh 2025-08-20   559  				bits = <3 6>;
6fe745255e3d2a Dang Huynh 2025-08-20   560  			};
6fe745255e3d2a Dang Huynh 2025-08-20   561  
6fe745255e3d2a Dang Huynh 2025-08-20   562  			tsens_s0_p2: s0-p2@211 {
6fe745255e3d2a Dang Huynh 2025-08-20   563  				reg = <0x211 0x1>;
6fe745255e3d2a Dang Huynh 2025-08-20   564  				bits = <1 6>;
6fe745255e3d2a Dang Huynh 2025-08-20   565  			};
6fe745255e3d2a Dang Huynh 2025-08-20   566  
6fe745255e3d2a Dang Huynh 2025-08-20   567  			tsens_s1_p1: s1-p1@211 {
6fe745255e3d2a Dang Huynh 2025-08-20   568  				reg = <0x211 0x2>;
6fe745255e3d2a Dang Huynh 2025-08-20   569  				bits = <7 6>;
6fe745255e3d2a Dang Huynh 2025-08-20   570  			};
6fe745255e3d2a Dang Huynh 2025-08-20   571  
6fe745255e3d2a Dang Huynh 2025-08-20   572  			tsens_s1_p2: s1-p2@212 {
6fe745255e3d2a Dang Huynh 2025-08-20   573  				reg = <0x212 0x2>;
6fe745255e3d2a Dang Huynh 2025-08-20   574  				bits = <5 6>;
6fe745255e3d2a Dang Huynh 2025-08-20   575  			};
6fe745255e3d2a Dang Huynh 2025-08-20   576  
6fe745255e3d2a Dang Huynh 2025-08-20   577  			tsens_s2_p1: s2-p1@213 {
6fe745255e3d2a Dang Huynh 2025-08-20   578  				reg = <0x213 0x2>;
6fe745255e3d2a Dang Huynh 2025-08-20   579  				bits = <3 6>;
6fe745255e3d2a Dang Huynh 2025-08-20   580  			};
6fe745255e3d2a Dang Huynh 2025-08-20   581  
6fe745255e3d2a Dang Huynh 2025-08-20   582  			tsens_s2_p2: s2-p2@214 {
6fe745255e3d2a Dang Huynh 2025-08-20   583  				reg = <0x214 0x1>;
6fe745255e3d2a Dang Huynh 2025-08-20   584  				bits = <1 6>;
6fe745255e3d2a Dang Huynh 2025-08-20   585  			};
6fe745255e3d2a Dang Huynh 2025-08-20   586  
6fe745255e3d2a Dang Huynh 2025-08-20   587  			tsens_s3_p1: s3-p1@214 {
6fe745255e3d2a Dang Huynh 2025-08-20   588  				reg = <0x214 0x2>;
6fe745255e3d2a Dang Huynh 2025-08-20   589  				bits = <7 6>;
6fe745255e3d2a Dang Huynh 2025-08-20   590  			};
6fe745255e3d2a Dang Huynh 2025-08-20   591  
6fe745255e3d2a Dang Huynh 2025-08-20   592  			tsens_s3_p2: s3-p2@215 {
6fe745255e3d2a Dang Huynh 2025-08-20   593  				reg = <0x215 0x2>;
6fe745255e3d2a Dang Huynh 2025-08-20   594  				bits = <5 6>;
6fe745255e3d2a Dang Huynh 2025-08-20   595  			};
6fe745255e3d2a Dang Huynh 2025-08-20   596  
6fe745255e3d2a Dang Huynh 2025-08-20   597  			tsens_s4_p1: s4-p1@216 {
6fe745255e3d2a Dang Huynh 2025-08-20   598  				reg = <0x216 0x2>;
6fe745255e3d2a Dang Huynh 2025-08-20   599  				bits = <3 6>;
6fe745255e3d2a Dang Huynh 2025-08-20   600  			};
6fe745255e3d2a Dang Huynh 2025-08-20   601  
6fe745255e3d2a Dang Huynh 2025-08-20   602  			tsens_s4_p2: s4-p2@217 {
6fe745255e3d2a Dang Huynh 2025-08-20   603  				reg = <0x217 0x1>;
6fe745255e3d2a Dang Huynh 2025-08-20   604  				bits = <1 6>;
6fe745255e3d2a Dang Huynh 2025-08-20   605  			};
6fe745255e3d2a Dang Huynh 2025-08-20   606  
6fe745255e3d2a Dang Huynh 2025-08-20   607  			tsens_s9_p1: s9-p1@230 {
6fe745255e3d2a Dang Huynh 2025-08-20   608  				reg = <0x230 0x1>;
6fe745255e3d2a Dang Huynh 2025-08-20   609  				bits = <0 6>;
6fe745255e3d2a Dang Huynh 2025-08-20   610  			};
6fe745255e3d2a Dang Huynh 2025-08-20   611  
6fe745255e3d2a Dang Huynh 2025-08-20   612  			tsens_s9_p2: s9-p2@230 {
6fe745255e3d2a Dang Huynh 2025-08-20   613  				reg = <0x230 0x2>;
6fe745255e3d2a Dang Huynh 2025-08-20   614  				bits = <6 6>;
6fe745255e3d2a Dang Huynh 2025-08-20   615  			};
6fe745255e3d2a Dang Huynh 2025-08-20   616  
6fe745255e3d2a Dang Huynh 2025-08-20   617  			tsens_s10_p1: s10-p1@231 {
6fe745255e3d2a Dang Huynh 2025-08-20   618  				reg = <0x231 0x2>;
6fe745255e3d2a Dang Huynh 2025-08-20   619  				bits = <4 6>;
6fe745255e3d2a Dang Huynh 2025-08-20   620  			};
6fe745255e3d2a Dang Huynh 2025-08-20   621  
6fe745255e3d2a Dang Huynh 2025-08-20   622  			tsens_s10_p2: s10-p2@232 {
6fe745255e3d2a Dang Huynh 2025-08-20   623  				reg = <0x232 0x1>;
6fe745255e3d2a Dang Huynh 2025-08-20   624  				bits = <2 6>;
6fe745255e3d2a Dang Huynh 2025-08-20   625  			};
6fe745255e3d2a Dang Huynh 2025-08-20   626  
6fe745255e3d2a Dang Huynh 2025-08-20   627  			gpu_speed_bin: gpu-speed-bin@601b {
6fe745255e3d2a Dang Huynh 2025-08-20   628  				reg = <0x601b 0x1>;
6fe745255e3d2a Dang Huynh 2025-08-20   629  				bits = <7 1>;
6fe745255e3d2a Dang Huynh 2025-08-20   630  			};
6fe745255e3d2a Dang Huynh 2025-08-20   631  		};
6fe745255e3d2a Dang Huynh 2025-08-20   632  
6fe745255e3d2a Dang Huynh 2025-08-20   633  		usb_hs_phy: phy@6c000 {
6fe745255e3d2a Dang Huynh 2025-08-20   634  			compatible = "qcom,usb-hs-28nm-femtophy";
6fe745255e3d2a Dang Huynh 2025-08-20   635  			reg = <0x0006c000 0x200>;
6fe745255e3d2a Dang Huynh 2025-08-20   636  			#phy-cells = <0>;
6fe745255e3d2a Dang Huynh 2025-08-20   637  			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
6fe745255e3d2a Dang Huynh 2025-08-20   638  				 <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
6fe745255e3d2a Dang Huynh 2025-08-20   639  				 <&gcc GCC_USB2A_PHY_SLEEP_CLK>;
6fe745255e3d2a Dang Huynh 2025-08-20   640  			clock-names = "ref",
6fe745255e3d2a Dang Huynh 2025-08-20   641  				      "ahb",
6fe745255e3d2a Dang Huynh 2025-08-20   642  				      "sleep";
6fe745255e3d2a Dang Huynh 2025-08-20   643  			resets = <&gcc GCC_QUSB2_PHY_BCR>,
6fe745255e3d2a Dang Huynh 2025-08-20   644  				 <&gcc GCC_USB2_HS_PHY_ONLY_BCR>;
6fe745255e3d2a Dang Huynh 2025-08-20   645  			reset-names = "phy",
6fe745255e3d2a Dang Huynh 2025-08-20   646  				      "por";
6fe745255e3d2a Dang Huynh 2025-08-20   647  			status = "disabled";
6fe745255e3d2a Dang Huynh 2025-08-20   648  		};
6fe745255e3d2a Dang Huynh 2025-08-20   649  
6fe745255e3d2a Dang Huynh 2025-08-20   650  		rng@e3000 {
6fe745255e3d2a Dang Huynh 2025-08-20   651  			compatible = "qcom,prng";
6fe745255e3d2a Dang Huynh 2025-08-20   652  			reg = <0x000e3000 0x1000>;
6fe745255e3d2a Dang Huynh 2025-08-20   653  			clocks = <&gcc GCC_PRNG_AHB_CLK>;
6fe745255e3d2a Dang Huynh 2025-08-20   654  			clock-names = "core";
6fe745255e3d2a Dang Huynh 2025-08-20   655  		};
6fe745255e3d2a Dang Huynh 2025-08-20   656  
6fe745255e3d2a Dang Huynh 2025-08-20   657  		tsens: thermal-sensor@4a9000 {
6fe745255e3d2a Dang Huynh 2025-08-20   658  			compatible = "qcom,msm8937-tsens", "qcom,tsens-v1";
6fe745255e3d2a Dang Huynh 2025-08-20   659  			reg = <0x004a9000 0x1000>,
6fe745255e3d2a Dang Huynh 2025-08-20   660  			      <0x004a8000 0x1000>;
6fe745255e3d2a Dang Huynh 2025-08-20   661  			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
6fe745255e3d2a Dang Huynh 2025-08-20   662  			interrupt-names = "uplow";
6fe745255e3d2a Dang Huynh 2025-08-20   663  			nvmem-cells = <&tsens_mode>,
6fe745255e3d2a Dang Huynh 2025-08-20   664  				      <&tsens_base1>, <&tsens_base2>,
6fe745255e3d2a Dang Huynh 2025-08-20   665  				      <&tsens_s0_p1>, <&tsens_s0_p2>,
6fe745255e3d2a Dang Huynh 2025-08-20   666  				      <&tsens_s1_p1>, <&tsens_s1_p2>,
6fe745255e3d2a Dang Huynh 2025-08-20   667  				      <&tsens_s2_p1>, <&tsens_s2_p2>,
6fe745255e3d2a Dang Huynh 2025-08-20   668  				      <&tsens_s3_p1>, <&tsens_s3_p2>,
6fe745255e3d2a Dang Huynh 2025-08-20   669  				      <&tsens_s4_p1>, <&tsens_s4_p2>,
6fe745255e3d2a Dang Huynh 2025-08-20   670  				      <&tsens_s5_p1>, <&tsens_s5_p2>,
6fe745255e3d2a Dang Huynh 2025-08-20   671  				      <&tsens_s6_p1>, <&tsens_s6_p2>,
6fe745255e3d2a Dang Huynh 2025-08-20   672  				      <&tsens_s7_p1>, <&tsens_s7_p2>,
6fe745255e3d2a Dang Huynh 2025-08-20   673  				      <&tsens_s8_p1>, <&tsens_s8_p2>,
6fe745255e3d2a Dang Huynh 2025-08-20   674  				      <&tsens_s9_p1>, <&tsens_s9_p2>,
6fe745255e3d2a Dang Huynh 2025-08-20   675  				      <&tsens_s10_p1>, <&tsens_s10_p2>;
6fe745255e3d2a Dang Huynh 2025-08-20   676  			nvmem-cell-names = "mode",
6fe745255e3d2a Dang Huynh 2025-08-20   677  					   "base1", "base2",
6fe745255e3d2a Dang Huynh 2025-08-20   678  					   "s0_p1", "s0_p2",
6fe745255e3d2a Dang Huynh 2025-08-20   679  					   "s1_p1", "s1_p2",
6fe745255e3d2a Dang Huynh 2025-08-20   680  					   "s2_p1", "s2_p2",
6fe745255e3d2a Dang Huynh 2025-08-20   681  					   "s3_p1", "s3_p2",
6fe745255e3d2a Dang Huynh 2025-08-20   682  					   "s4_p1", "s4_p2",
6fe745255e3d2a Dang Huynh 2025-08-20   683  					   "s5_p1", "s5_p2",
6fe745255e3d2a Dang Huynh 2025-08-20   684  					   "s6_p1", "s6_p2",
6fe745255e3d2a Dang Huynh 2025-08-20   685  					   "s7_p1", "s7_p2",
6fe745255e3d2a Dang Huynh 2025-08-20   686  					   "s8_p1", "s8_p2",
6fe745255e3d2a Dang Huynh 2025-08-20   687  					   "s9_p1", "s9_p2",
6fe745255e3d2a Dang Huynh 2025-08-20   688  					   "s10_p1", "s10_p2";
6fe745255e3d2a Dang Huynh 2025-08-20   689  			#qcom,sensors = <11>;
6fe745255e3d2a Dang Huynh 2025-08-20   690  			#thermal-sensor-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20   691  		};
6fe745255e3d2a Dang Huynh 2025-08-20   692  
6fe745255e3d2a Dang Huynh 2025-08-20   693  		rpm_msg_ram: sram@60000 {
6fe745255e3d2a Dang Huynh 2025-08-20   694  			compatible = "qcom,rpm-msg-ram";
6fe745255e3d2a Dang Huynh 2025-08-20   695  			reg = <0x00060000 0x8000>;
6fe745255e3d2a Dang Huynh 2025-08-20   696  		};
6fe745255e3d2a Dang Huynh 2025-08-20   697  
6fe745255e3d2a Dang Huynh 2025-08-20   698  		restart@4ab000 {
6fe745255e3d2a Dang Huynh 2025-08-20   699  			compatible = "qcom,pshold";
6fe745255e3d2a Dang Huynh 2025-08-20   700  			reg = <0x004ab000 0x4>;
6fe745255e3d2a Dang Huynh 2025-08-20   701  		};
6fe745255e3d2a Dang Huynh 2025-08-20   702  
6fe745255e3d2a Dang Huynh 2025-08-20   703  		tlmm: pinctrl@1000000 {
6fe745255e3d2a Dang Huynh 2025-08-20   704  			compatible = "qcom,msm8917-pinctrl";
6fe745255e3d2a Dang Huynh 2025-08-20   705  			reg = <0x01000000 0x300000>;
6fe745255e3d2a Dang Huynh 2025-08-20   706  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
6fe745255e3d2a Dang Huynh 2025-08-20   707  			gpio-controller;
6fe745255e3d2a Dang Huynh 2025-08-20   708  			gpio-ranges = <&tlmm 0 0 134>;
6fe745255e3d2a Dang Huynh 2025-08-20   709  			#gpio-cells = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   710  			interrupt-controller;
6fe745255e3d2a Dang Huynh 2025-08-20   711  			#interrupt-cells = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   712  
6fe745255e3d2a Dang Huynh 2025-08-20   713  			blsp1_i2c2_default: blsp1-i2c2-default-state {
6fe745255e3d2a Dang Huynh 2025-08-20   714  				pins = "gpio6", "gpio7";
6fe745255e3d2a Dang Huynh 2025-08-20   715  				function = "blsp_i2c2";
6fe745255e3d2a Dang Huynh 2025-08-20   716  				drive-strength = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   717  				bias-disable;
6fe745255e3d2a Dang Huynh 2025-08-20   718  			};
6fe745255e3d2a Dang Huynh 2025-08-20   719  
6fe745255e3d2a Dang Huynh 2025-08-20   720  			blsp1_i2c2_sleep: blsp1-i2c2-sleep-state {
6fe745255e3d2a Dang Huynh 2025-08-20   721  				pins = "gpio6", "gpio7";
6fe745255e3d2a Dang Huynh 2025-08-20   722  				function = "gpio";
6fe745255e3d2a Dang Huynh 2025-08-20   723  				drive-strength = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   724  				bias-disable;
6fe745255e3d2a Dang Huynh 2025-08-20   725  			};
6fe745255e3d2a Dang Huynh 2025-08-20   726  
6fe745255e3d2a Dang Huynh 2025-08-20   727  			blsp1_i2c3_default: blsp1-i2c3-default-state {
6fe745255e3d2a Dang Huynh 2025-08-20   728  				pins = "gpio10", "gpio11";
6fe745255e3d2a Dang Huynh 2025-08-20   729  				function = "blsp_i2c3";
6fe745255e3d2a Dang Huynh 2025-08-20   730  				drive-strength = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   731  				bias-disable;
6fe745255e3d2a Dang Huynh 2025-08-20   732  			};
6fe745255e3d2a Dang Huynh 2025-08-20   733  
6fe745255e3d2a Dang Huynh 2025-08-20   734  			blsp1_i2c3_sleep: blsp1-i2c3-sleep-state {
6fe745255e3d2a Dang Huynh 2025-08-20   735  				pins = "gpio10", "gpio11";
6fe745255e3d2a Dang Huynh 2025-08-20   736  				function = "gpio";
6fe745255e3d2a Dang Huynh 2025-08-20   737  				drive-strength = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   738  				bias-disable;
6fe745255e3d2a Dang Huynh 2025-08-20   739  			};
6fe745255e3d2a Dang Huynh 2025-08-20   740  
6fe745255e3d2a Dang Huynh 2025-08-20   741  			blsp1_i2c4_default: blsp1-i2c4-default-state {
6fe745255e3d2a Dang Huynh 2025-08-20   742  				pins = "gpio14", "gpio15";
6fe745255e3d2a Dang Huynh 2025-08-20   743  				function = "blsp_i2c4";
6fe745255e3d2a Dang Huynh 2025-08-20   744  				drive-strength = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   745  				bias-disable;
6fe745255e3d2a Dang Huynh 2025-08-20   746  			};
6fe745255e3d2a Dang Huynh 2025-08-20   747  
6fe745255e3d2a Dang Huynh 2025-08-20   748  			blsp1_i2c4_sleep: blsp1-i2c4-sleep-state {
6fe745255e3d2a Dang Huynh 2025-08-20   749  				pins = "gpio14", "gpio15";
6fe745255e3d2a Dang Huynh 2025-08-20   750  				function = "gpio";
6fe745255e3d2a Dang Huynh 2025-08-20   751  				drive-strength = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   752  				bias-disable;
6fe745255e3d2a Dang Huynh 2025-08-20   753  			};
6fe745255e3d2a Dang Huynh 2025-08-20   754  
6fe745255e3d2a Dang Huynh 2025-08-20   755  			blsp2_i2c1_default: blsp2-i2c1-default-state {
6fe745255e3d2a Dang Huynh 2025-08-20   756  				pins = "gpio18", "gpio19";
6fe745255e3d2a Dang Huynh 2025-08-20   757  				function = "blsp_i2c5";
6fe745255e3d2a Dang Huynh 2025-08-20   758  				drive-strength = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   759  				bias-disable;
6fe745255e3d2a Dang Huynh 2025-08-20   760  			};
6fe745255e3d2a Dang Huynh 2025-08-20   761  
6fe745255e3d2a Dang Huynh 2025-08-20   762  			blsp2_i2c1_sleep: blsp2-i2c1-sleep-state {
6fe745255e3d2a Dang Huynh 2025-08-20   763  				pins = "gpio18", "gpio19";
6fe745255e3d2a Dang Huynh 2025-08-20   764  				function = "gpio";
6fe745255e3d2a Dang Huynh 2025-08-20   765  				drive-strength = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   766  				bias-disable;
6fe745255e3d2a Dang Huynh 2025-08-20   767  			};
6fe745255e3d2a Dang Huynh 2025-08-20   768  
6fe745255e3d2a Dang Huynh 2025-08-20   769  			blsp1_spi3_default: blsp1-spi3-default-state {
6fe745255e3d2a Dang Huynh 2025-08-20   770  				cs-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   771  					pins = "gpio10";
6fe745255e3d2a Dang Huynh 2025-08-20   772  					function = "blsp_spi3";
6fe745255e3d2a Dang Huynh 2025-08-20   773  					drive-strength = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   774  					bias-disable;
6fe745255e3d2a Dang Huynh 2025-08-20   775  				};
6fe745255e3d2a Dang Huynh 2025-08-20   776  
6fe745255e3d2a Dang Huynh 2025-08-20   777  				spi-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   778  					pins = "gpio8", "gpio9", "gpio11";
6fe745255e3d2a Dang Huynh 2025-08-20   779  					function = "blsp_spi3";
6fe745255e3d2a Dang Huynh 2025-08-20   780  					drive-strength = <12>;
6fe745255e3d2a Dang Huynh 2025-08-20   781  					bias-disable;
6fe745255e3d2a Dang Huynh 2025-08-20   782  				};
6fe745255e3d2a Dang Huynh 2025-08-20   783  			};
6fe745255e3d2a Dang Huynh 2025-08-20   784  
6fe745255e3d2a Dang Huynh 2025-08-20   785  			blsp1_spi3_sleep: blsp1-spi3-sleep-state {
6fe745255e3d2a Dang Huynh 2025-08-20   786  				cs-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   787  					pins = "gpio10";
6fe745255e3d2a Dang Huynh 2025-08-20   788  					function = "gpio";
6fe745255e3d2a Dang Huynh 2025-08-20   789  					drive-strength = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   790  					bias-disable;
6fe745255e3d2a Dang Huynh 2025-08-20   791  				};
6fe745255e3d2a Dang Huynh 2025-08-20   792  
6fe745255e3d2a Dang Huynh 2025-08-20   793  				spi-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   794  					pins = "gpio8", "gpio9", "gpio11";
6fe745255e3d2a Dang Huynh 2025-08-20   795  					function = "gpio";
6fe745255e3d2a Dang Huynh 2025-08-20   796  					drive-strength = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   797  					bias-pull-down;
6fe745255e3d2a Dang Huynh 2025-08-20   798  				};
6fe745255e3d2a Dang Huynh 2025-08-20   799  			};
6fe745255e3d2a Dang Huynh 2025-08-20   800  
6fe745255e3d2a Dang Huynh 2025-08-20   801  			blsp2_spi2_default: blsp2-spi2-default-state {
6fe745255e3d2a Dang Huynh 2025-08-20   802  				cs0-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   803  					pins = "gpio47";
6fe745255e3d2a Dang Huynh 2025-08-20   804  					function = "blsp_spi6";
6fe745255e3d2a Dang Huynh 2025-08-20   805  					drive-strength = <16>;
6fe745255e3d2a Dang Huynh 2025-08-20   806  					bias-disable;
6fe745255e3d2a Dang Huynh 2025-08-20   807  				};
6fe745255e3d2a Dang Huynh 2025-08-20   808  
6fe745255e3d2a Dang Huynh 2025-08-20   809  				cs1-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   810  					pins = "gpio22";
6fe745255e3d2a Dang Huynh 2025-08-20   811  					function = "blsp_spi6";
6fe745255e3d2a Dang Huynh 2025-08-20   812  					drive-strength = <16>;
6fe745255e3d2a Dang Huynh 2025-08-20   813  					bias-disable;
6fe745255e3d2a Dang Huynh 2025-08-20   814  				};
6fe745255e3d2a Dang Huynh 2025-08-20   815  
6fe745255e3d2a Dang Huynh 2025-08-20   816  				spi-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   817  					pins = "gpio20", "gpio21", "gpio23";
6fe745255e3d2a Dang Huynh 2025-08-20   818  					function = "blsp_spi6";
6fe745255e3d2a Dang Huynh 2025-08-20   819  					drive-strength = <16>;
6fe745255e3d2a Dang Huynh 2025-08-20   820  					bias-disable;
6fe745255e3d2a Dang Huynh 2025-08-20   821  				};
6fe745255e3d2a Dang Huynh 2025-08-20   822  			};
6fe745255e3d2a Dang Huynh 2025-08-20   823  
6fe745255e3d2a Dang Huynh 2025-08-20   824  			blsp2_spi2_sleep: blsp2-spi2-sleep-state {
6fe745255e3d2a Dang Huynh 2025-08-20   825  				cs0-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   826  					pins = "gpio47";
6fe745255e3d2a Dang Huynh 2025-08-20   827  					function = "gpio";
6fe745255e3d2a Dang Huynh 2025-08-20   828  					drive-strength = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   829  					bias-disable;
6fe745255e3d2a Dang Huynh 2025-08-20   830  				};
6fe745255e3d2a Dang Huynh 2025-08-20   831  
6fe745255e3d2a Dang Huynh 2025-08-20   832  				cs1-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   833  					pins = "gpio22";
6fe745255e3d2a Dang Huynh 2025-08-20   834  					function = "gpio";
6fe745255e3d2a Dang Huynh 2025-08-20   835  					drive-strength = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   836  					bias-disable;
6fe745255e3d2a Dang Huynh 2025-08-20   837  				};
6fe745255e3d2a Dang Huynh 2025-08-20   838  
6fe745255e3d2a Dang Huynh 2025-08-20   839  				spi-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   840  					pins = "gpio20", "gpio21", "gpio23";
6fe745255e3d2a Dang Huynh 2025-08-20   841  					function = "gpio";
6fe745255e3d2a Dang Huynh 2025-08-20   842  					drive-strength = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   843  					bias-pull-down;
6fe745255e3d2a Dang Huynh 2025-08-20   844  				};
6fe745255e3d2a Dang Huynh 2025-08-20   845  			};
6fe745255e3d2a Dang Huynh 2025-08-20   846  
6fe745255e3d2a Dang Huynh 2025-08-20   847  			blsp1_uart1_default: blsp1-uart1-default-state {
6fe745255e3d2a Dang Huynh 2025-08-20   848  				pins = "gpio0", "gpio1", "gpio2", "gpio3";
6fe745255e3d2a Dang Huynh 2025-08-20   849  				function = "blsp_uart1";
6fe745255e3d2a Dang Huynh 2025-08-20   850  				drive-strength = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   851  				bias-disable;
6fe745255e3d2a Dang Huynh 2025-08-20   852  			};
6fe745255e3d2a Dang Huynh 2025-08-20   853  
6fe745255e3d2a Dang Huynh 2025-08-20   854  			blsp1_uart1_sleep: blsp1-uart1-sleep-state {
6fe745255e3d2a Dang Huynh 2025-08-20   855  				pins = "gpio0", "gpio1", "gpio2", "gpio3";
6fe745255e3d2a Dang Huynh 2025-08-20   856  				function = "gpio";
6fe745255e3d2a Dang Huynh 2025-08-20   857  				drive-strength = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   858  				bias-disable;
6fe745255e3d2a Dang Huynh 2025-08-20   859  			};
6fe745255e3d2a Dang Huynh 2025-08-20   860  
6fe745255e3d2a Dang Huynh 2025-08-20   861  			blsp1_uart2_default: blsp1-uart2-default-state {
6fe745255e3d2a Dang Huynh 2025-08-20   862  				pins = "gpio4", "gpio5";
6fe745255e3d2a Dang Huynh 2025-08-20   863  				function = "blsp_uart2";
6fe745255e3d2a Dang Huynh 2025-08-20   864  				drive-strength = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   865  				bias-disable;
6fe745255e3d2a Dang Huynh 2025-08-20   866  			};
6fe745255e3d2a Dang Huynh 2025-08-20   867  
6fe745255e3d2a Dang Huynh 2025-08-20   868  			blsp1_uart2_sleep: blsp1-uart2-sleep-state {
6fe745255e3d2a Dang Huynh 2025-08-20   869  				pins = "gpio4", "gpio5";
6fe745255e3d2a Dang Huynh 2025-08-20   870  				function = "gpio";
6fe745255e3d2a Dang Huynh 2025-08-20   871  				drive-strength = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   872  				bias-pull-down;
6fe745255e3d2a Dang Huynh 2025-08-20   873  			};
6fe745255e3d2a Dang Huynh 2025-08-20   874  
6fe745255e3d2a Dang Huynh 2025-08-20   875  			sdc1_default: sdc1-default-state {
6fe745255e3d2a Dang Huynh 2025-08-20   876  				clk-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   877  					pins = "sdc1_clk";
6fe745255e3d2a Dang Huynh 2025-08-20   878  					drive-strength = <16>;
6fe745255e3d2a Dang Huynh 2025-08-20   879  					bias-disable;
6fe745255e3d2a Dang Huynh 2025-08-20   880  				};
6fe745255e3d2a Dang Huynh 2025-08-20   881  
6fe745255e3d2a Dang Huynh 2025-08-20   882  				cmd-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   883  					pins = "sdc1_cmd";
6fe745255e3d2a Dang Huynh 2025-08-20   884  					drive-strength = <10>;
6fe745255e3d2a Dang Huynh 2025-08-20   885  					bias-pull-up;
6fe745255e3d2a Dang Huynh 2025-08-20   886  				};
6fe745255e3d2a Dang Huynh 2025-08-20   887  
6fe745255e3d2a Dang Huynh 2025-08-20   888  				data-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   889  					pins = "sdc1_data";
6fe745255e3d2a Dang Huynh 2025-08-20   890  					drive-strength = <10>;
6fe745255e3d2a Dang Huynh 2025-08-20   891  					bias-pull-up;
6fe745255e3d2a Dang Huynh 2025-08-20   892  				};
6fe745255e3d2a Dang Huynh 2025-08-20   893  
6fe745255e3d2a Dang Huynh 2025-08-20   894  				rclk-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   895  					pins = "sdc1_rclk";
6fe745255e3d2a Dang Huynh 2025-08-20   896  					bias-pull-down;
6fe745255e3d2a Dang Huynh 2025-08-20   897  				};
6fe745255e3d2a Dang Huynh 2025-08-20   898  			};
6fe745255e3d2a Dang Huynh 2025-08-20   899  
6fe745255e3d2a Dang Huynh 2025-08-20   900  			sdc1_sleep: sdc1-sleep-state {
6fe745255e3d2a Dang Huynh 2025-08-20   901  				clk-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   902  					pins = "sdc1_clk";
6fe745255e3d2a Dang Huynh 2025-08-20   903  					drive-strength = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   904  					bias-disable;
6fe745255e3d2a Dang Huynh 2025-08-20   905  				};
6fe745255e3d2a Dang Huynh 2025-08-20   906  
6fe745255e3d2a Dang Huynh 2025-08-20   907  				cmd-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   908  					pins = "sdc1_cmd";
6fe745255e3d2a Dang Huynh 2025-08-20   909  					drive-strength = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   910  					bias-pull-up;
6fe745255e3d2a Dang Huynh 2025-08-20   911  				};
6fe745255e3d2a Dang Huynh 2025-08-20   912  
6fe745255e3d2a Dang Huynh 2025-08-20   913  				data-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   914  					pins = "sdc1_data";
6fe745255e3d2a Dang Huynh 2025-08-20   915  					drive-strength = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   916  					bias-pull-up;
6fe745255e3d2a Dang Huynh 2025-08-20   917  				};
6fe745255e3d2a Dang Huynh 2025-08-20   918  
6fe745255e3d2a Dang Huynh 2025-08-20   919  				rclk-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   920  					pins = "sdc1_rclk";
6fe745255e3d2a Dang Huynh 2025-08-20   921  					bias-pull-down;
6fe745255e3d2a Dang Huynh 2025-08-20   922  				};
6fe745255e3d2a Dang Huynh 2025-08-20   923  			};
6fe745255e3d2a Dang Huynh 2025-08-20   924  
6fe745255e3d2a Dang Huynh 2025-08-20   925  			sdc2_default: sdc2-default-state {
6fe745255e3d2a Dang Huynh 2025-08-20   926  				clk-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   927  					pins = "sdc2_clk";
6fe745255e3d2a Dang Huynh 2025-08-20   928  					drive-strength = <16>;
6fe745255e3d2a Dang Huynh 2025-08-20   929  					bias-disable;
6fe745255e3d2a Dang Huynh 2025-08-20   930  				};
6fe745255e3d2a Dang Huynh 2025-08-20   931  
6fe745255e3d2a Dang Huynh 2025-08-20   932  				sdc2_cmd_default: cmd-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   933  					pins = "sdc2_cmd";
6fe745255e3d2a Dang Huynh 2025-08-20   934  					drive-strength = <16>;
6fe745255e3d2a Dang Huynh 2025-08-20   935  					bias-pull-up;
6fe745255e3d2a Dang Huynh 2025-08-20   936  				};
6fe745255e3d2a Dang Huynh 2025-08-20   937  
6fe745255e3d2a Dang Huynh 2025-08-20   938  				sdc2_data_default: data-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   939  					pins = "sdc2_data";
6fe745255e3d2a Dang Huynh 2025-08-20   940  					drive-strength = <16>;
6fe745255e3d2a Dang Huynh 2025-08-20   941  					bias-pull-up;
6fe745255e3d2a Dang Huynh 2025-08-20   942  				};
6fe745255e3d2a Dang Huynh 2025-08-20   943  			};
6fe745255e3d2a Dang Huynh 2025-08-20   944  
6fe745255e3d2a Dang Huynh 2025-08-20   945  			sdc2_sleep: sdc2-sleep-state {
6fe745255e3d2a Dang Huynh 2025-08-20   946  				clk-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   947  					pins = "sdc2_clk";
6fe745255e3d2a Dang Huynh 2025-08-20   948  					drive-strength = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   949  					bias-disable;
6fe745255e3d2a Dang Huynh 2025-08-20   950  				};
6fe745255e3d2a Dang Huynh 2025-08-20   951  
6fe745255e3d2a Dang Huynh 2025-08-20   952  				cmd-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   953  					pins = "sdc2_cmd";
6fe745255e3d2a Dang Huynh 2025-08-20   954  					drive-strength = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   955  					bias-pull-up;
6fe745255e3d2a Dang Huynh 2025-08-20   956  				};
6fe745255e3d2a Dang Huynh 2025-08-20   957  
6fe745255e3d2a Dang Huynh 2025-08-20   958  				data-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   959  					pins = "sdc2_data";
6fe745255e3d2a Dang Huynh 2025-08-20   960  					drive-strength = <2>;
6fe745255e3d2a Dang Huynh 2025-08-20   961  					bias-pull-up;
6fe745255e3d2a Dang Huynh 2025-08-20   962  				};
6fe745255e3d2a Dang Huynh 2025-08-20   963  			};
6fe745255e3d2a Dang Huynh 2025-08-20   964  
6fe745255e3d2a Dang Huynh 2025-08-20   965  			wcnss_pin_a: wcnss-active-state {
6fe745255e3d2a Dang Huynh 2025-08-20   966  				wcss-wlan-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   967  					pins = "gpio79", "gpio80";
6fe745255e3d2a Dang Huynh 2025-08-20   968  					function = "wcss_wlan";
6fe745255e3d2a Dang Huynh 2025-08-20   969  					drive-strength = <6>;
6fe745255e3d2a Dang Huynh 2025-08-20   970  					bias-pull-up;
6fe745255e3d2a Dang Huynh 2025-08-20   971  
6fe745255e3d2a Dang Huynh 2025-08-20   972  				};
6fe745255e3d2a Dang Huynh 2025-08-20   973  
6fe745255e3d2a Dang Huynh 2025-08-20   974  				wcss-wlan0-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   975  					pins = "gpio78";
6fe745255e3d2a Dang Huynh 2025-08-20   976  					function = "wcss_wlan0";
6fe745255e3d2a Dang Huynh 2025-08-20   977  					drive-strength = <6>;
6fe745255e3d2a Dang Huynh 2025-08-20   978  					bias-pull-up;
6fe745255e3d2a Dang Huynh 2025-08-20   979  
6fe745255e3d2a Dang Huynh 2025-08-20   980  				};
6fe745255e3d2a Dang Huynh 2025-08-20   981  
6fe745255e3d2a Dang Huynh 2025-08-20   982  				wcss-wlan1-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   983  					pins = "gpio77";
6fe745255e3d2a Dang Huynh 2025-08-20   984  					function = "wcss_wlan1";
6fe745255e3d2a Dang Huynh 2025-08-20   985  					drive-strength = <6>;
6fe745255e3d2a Dang Huynh 2025-08-20   986  					bias-pull-up;
6fe745255e3d2a Dang Huynh 2025-08-20   987  
6fe745255e3d2a Dang Huynh 2025-08-20   988  				};
6fe745255e3d2a Dang Huynh 2025-08-20   989  
6fe745255e3d2a Dang Huynh 2025-08-20   990  				wcss-wlan2-pins {
6fe745255e3d2a Dang Huynh 2025-08-20   991  					pins = "gpio76";
6fe745255e3d2a Dang Huynh 2025-08-20   992  					function = "wcss_wlan2";
6fe745255e3d2a Dang Huynh 2025-08-20   993  					drive-strength = <6>;
6fe745255e3d2a Dang Huynh 2025-08-20   994  					bias-pull-up;
6fe745255e3d2a Dang Huynh 2025-08-20   995  
6fe745255e3d2a Dang Huynh 2025-08-20   996  				};
6fe745255e3d2a Dang Huynh 2025-08-20   997  
6fe745255e3d2a Dang Huynh 2025-08-20   998  			};
6fe745255e3d2a Dang Huynh 2025-08-20   999  		};
6fe745255e3d2a Dang Huynh 2025-08-20  1000  
6fe745255e3d2a Dang Huynh 2025-08-20  1001  		gcc: clock-controller@1800000 {
6fe745255e3d2a Dang Huynh 2025-08-20  1002  			compatible = "qcom,gcc-msm8937";
6fe745255e3d2a Dang Huynh 2025-08-20  1003  			reg = <0x01800000 0x80000>;
6fe745255e3d2a Dang Huynh 2025-08-20  1004  			#clock-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20  1005  			#reset-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20  1006  			#power-domain-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20  1007  			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
6fe745255e3d2a Dang Huynh 2025-08-20  1008  				 <&sleep_clk>,
6fe745255e3d2a Dang Huynh 2025-08-20  1009  				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
6fe745255e3d2a Dang Huynh 2025-08-20  1010  				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
6fe745255e3d2a Dang Huynh 2025-08-20  1011  				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
6fe745255e3d2a Dang Huynh 2025-08-20  1012  				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>;
6fe745255e3d2a Dang Huynh 2025-08-20  1013  			clock-names = "xo",
6fe745255e3d2a Dang Huynh 2025-08-20  1014  				      "sleep",
6fe745255e3d2a Dang Huynh 2025-08-20  1015  				      "dsi0pll",
6fe745255e3d2a Dang Huynh 2025-08-20  1016  				      "dsi0pllbyte",
6fe745255e3d2a Dang Huynh 2025-08-20  1017  				      "dsi1pll",
6fe745255e3d2a Dang Huynh 2025-08-20  1018  				      "dsi1pllbyte";
6fe745255e3d2a Dang Huynh 2025-08-20  1019  		};
6fe745255e3d2a Dang Huynh 2025-08-20  1020  
6fe745255e3d2a Dang Huynh 2025-08-20  1021  		tcsr_mutex: hwlock@1905000 {
6fe745255e3d2a Dang Huynh 2025-08-20  1022  			compatible = "qcom,tcsr-mutex";
6fe745255e3d2a Dang Huynh 2025-08-20  1023  			reg = <0x01905000 0x20000>;
6fe745255e3d2a Dang Huynh 2025-08-20  1024  			#hwlock-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20  1025  		};
6fe745255e3d2a Dang Huynh 2025-08-20  1026  
6fe745255e3d2a Dang Huynh 2025-08-20  1027  		tcsr: syscon@1937000 {
6fe745255e3d2a Dang Huynh 2025-08-20  1028  			compatible = "qcom,tcsr-msm8937", "syscon";
6fe745255e3d2a Dang Huynh 2025-08-20  1029  			reg = <0x01937000 0x30000>;
6fe745255e3d2a Dang Huynh 2025-08-20  1030  		};
6fe745255e3d2a Dang Huynh 2025-08-20  1031  
6fe745255e3d2a Dang Huynh 2025-08-20  1032  		mdss: display-subsystem@1a00000 {
6fe745255e3d2a Dang Huynh 2025-08-20  1033  			compatible = "qcom,mdss";
6fe745255e3d2a Dang Huynh 2025-08-20  1034  			reg = <0x01a00000 0x1000>,
6fe745255e3d2a Dang Huynh 2025-08-20  1035  			      <0x01ab0000 0x1040>;
6fe745255e3d2a Dang Huynh 2025-08-20  1036  			reg-names = "mdss_phys",
6fe745255e3d2a Dang Huynh 2025-08-20  1037  				    "vbif_phys";
6fe745255e3d2a Dang Huynh 2025-08-20  1038  			ranges;
6fe745255e3d2a Dang Huynh 2025-08-20  1039  
6fe745255e3d2a Dang Huynh 2025-08-20  1040  			power-domains = <&gcc MDSS_GDSC>;
6fe745255e3d2a Dang Huynh 2025-08-20  1041  
6fe745255e3d2a Dang Huynh 2025-08-20  1042  			clocks = <&gcc GCC_MDSS_AHB_CLK>,
6fe745255e3d2a Dang Huynh 2025-08-20  1043  				 <&gcc GCC_MDSS_AXI_CLK>,
6fe745255e3d2a Dang Huynh 2025-08-20  1044  				 <&gcc GCC_MDSS_VSYNC_CLK>;
6fe745255e3d2a Dang Huynh 2025-08-20  1045  			clock-names = "iface",
6fe745255e3d2a Dang Huynh 2025-08-20  1046  				      "bus",
6fe745255e3d2a Dang Huynh 2025-08-20  1047  				      "vsync";
6fe745255e3d2a Dang Huynh 2025-08-20  1048  			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
6fe745255e3d2a Dang Huynh 2025-08-20  1049  
6fe745255e3d2a Dang Huynh 2025-08-20  1050  			interrupt-controller;
6fe745255e3d2a Dang Huynh 2025-08-20  1051  			#interrupt-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20  1052  
6fe745255e3d2a Dang Huynh 2025-08-20  1053  			#address-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20  1054  			#size-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20  1055  
6fe745255e3d2a Dang Huynh 2025-08-20  1056  			status = "disabled";
6fe745255e3d2a Dang Huynh 2025-08-20  1057  
6fe745255e3d2a Dang Huynh 2025-08-20  1058  			mdp: display-controller@1a01000 {
6fe745255e3d2a Dang Huynh 2025-08-20  1059  				compatible = "qcom,msm8937-mdp5", "qcom,mdp5";
6fe745255e3d2a Dang Huynh 2025-08-20  1060  				reg = <0x01a01000 0x89000>;
6fe745255e3d2a Dang Huynh 2025-08-20  1061  				reg-names = "mdp_phys";
6fe745255e3d2a Dang Huynh 2025-08-20  1062  
6fe745255e3d2a Dang Huynh 2025-08-20  1063  				interrupt-parent = <&mdss>;
6fe745255e3d2a Dang Huynh 2025-08-20  1064  				interrupts = <0>;
6fe745255e3d2a Dang Huynh 2025-08-20  1065  
6fe745255e3d2a Dang Huynh 2025-08-20  1066  				clocks = <&gcc GCC_MDSS_AHB_CLK>,
6fe745255e3d2a Dang Huynh 2025-08-20  1067  					 <&gcc GCC_MDSS_AXI_CLK>,
6fe745255e3d2a Dang Huynh 2025-08-20  1068  					 <&gcc GCC_MDSS_MDP_CLK>,
6fe745255e3d2a Dang Huynh 2025-08-20  1069  					 <&gcc GCC_MDSS_VSYNC_CLK>;
6fe745255e3d2a Dang Huynh 2025-08-20  1070  				clock-names = "iface",
6fe745255e3d2a Dang Huynh 2025-08-20  1071  					      "bus",
6fe745255e3d2a Dang Huynh 2025-08-20  1072  					      "core",
6fe745255e3d2a Dang Huynh 2025-08-20  1073  					      "vsync";
6fe745255e3d2a Dang Huynh 2025-08-20  1074  
6fe745255e3d2a Dang Huynh 2025-08-20  1075  				iommus = <&apps_iommu 0x15>;
6fe745255e3d2a Dang Huynh 2025-08-20  1076  
6fe745255e3d2a Dang Huynh 2025-08-20  1077  				ports {
6fe745255e3d2a Dang Huynh 2025-08-20  1078  					#address-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20  1079  					#size-cells = <0>;
6fe745255e3d2a Dang Huynh 2025-08-20  1080  
6fe745255e3d2a Dang Huynh 2025-08-20  1081  					port@0 {
6fe745255e3d2a Dang Huynh 2025-08-20  1082  						reg = <0>;
6fe745255e3d2a Dang Huynh 2025-08-20  1083  						mdp5_intf1_out: endpoint {
6fe745255e3d2a Dang Huynh 2025-08-20  1084  							remote-endpoint = <&mdss_dsi0_in>;
6fe745255e3d2a Dang Huynh 2025-08-20  1085  						};
6fe745255e3d2a Dang Huynh 2025-08-20  1086  					};
6fe745255e3d2a Dang Huynh 2025-08-20  1087  
6fe745255e3d2a Dang Huynh 2025-08-20  1088  					port@1 {
6fe745255e3d2a Dang Huynh 2025-08-20  1089  						reg = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20  1090  						mdp5_intf2_out: endpoint {
6fe745255e3d2a Dang Huynh 2025-08-20  1091  							remote-endpoint = <&mdss_dsi1_in>;
6fe745255e3d2a Dang Huynh 2025-08-20  1092  						};
6fe745255e3d2a Dang Huynh 2025-08-20  1093  					};
6fe745255e3d2a Dang Huynh 2025-08-20  1094  				};
6fe745255e3d2a Dang Huynh 2025-08-20  1095  			};
6fe745255e3d2a Dang Huynh 2025-08-20  1096  
6fe745255e3d2a Dang Huynh 2025-08-20 @1097  			mdss_dsi0: dsi@1a94000 {
6fe745255e3d2a Dang Huynh 2025-08-20  1098  				compatible = "qcom,mdss-dsi-ctrl";
6fe745255e3d2a Dang Huynh 2025-08-20  1099  				reg = <0x01a94000 0x300>;
6fe745255e3d2a Dang Huynh 2025-08-20  1100  				reg-names = "dsi_ctrl";
6fe745255e3d2a Dang Huynh 2025-08-20  1101  
6fe745255e3d2a Dang Huynh 2025-08-20  1102  				interrupt-parent = <&mdss>;
6fe745255e3d2a Dang Huynh 2025-08-20  1103  				interrupts = <4>;
6fe745255e3d2a Dang Huynh 2025-08-20  1104  
6fe745255e3d2a Dang Huynh 2025-08-20  1105  				assigned-clocks = <&gcc BYTE0_CLK_SRC>,
6fe745255e3d2a Dang Huynh 2025-08-20  1106  						  <&gcc PCLK0_CLK_SRC>;
6fe745255e3d2a Dang Huynh 2025-08-20  1107  				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
6fe745255e3d2a Dang Huynh 2025-08-20  1108  							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
6fe745255e3d2a Dang Huynh 2025-08-20  1109  
6fe745255e3d2a Dang Huynh 2025-08-20  1110  				clocks = <&gcc GCC_MDSS_MDP_CLK>,
6fe745255e3d2a Dang Huynh 2025-08-20  1111  					 <&gcc GCC_MDSS_AHB_CLK>,
6fe745255e3d2a Dang Huynh 2025-08-20  1112  					 <&gcc GCC_MDSS_AXI_CLK>,
6fe745255e3d2a Dang Huynh 2025-08-20  1113  					 <&gcc GCC_MDSS_BYTE0_CLK>,
6fe745255e3d2a Dang Huynh 2025-08-20  1114  					 <&gcc GCC_MDSS_PCLK0_CLK>,
6fe745255e3d2a Dang Huynh 2025-08-20  1115  					 <&gcc GCC_MDSS_ESC0_CLK>;
6fe745255e3d2a Dang Huynh 2025-08-20  1116  				clock-names = "mdp_core",
6fe745255e3d2a Dang Huynh 2025-08-20  1117  					      "iface",
6fe745255e3d2a Dang Huynh 2025-08-20  1118  					      "bus",
6fe745255e3d2a Dang Huynh 2025-08-20  1119  					      "byte",
6fe745255e3d2a Dang Huynh 2025-08-20  1120  					      "pixel",
6fe745255e3d2a Dang Huynh 2025-08-20  1121  					      "core";
6fe745255e3d2a Dang Huynh 2025-08-20  1122  				phys = <&mdss_dsi0_phy>;
6fe745255e3d2a Dang Huynh 2025-08-20  1123  
6fe745255e3d2a Dang Huynh 2025-08-20  1124  				operating-points-v2 = <&mdss_dsi0_opp_table>;
6fe745255e3d2a Dang Huynh 2025-08-20  1125  				power-domains = <&rpmpd MSM8937_VDDCX>;
6fe745255e3d2a Dang Huynh 2025-08-20  1126  
6fe745255e3d2a Dang Huynh 2025-08-20  1127  				#address-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20  1128  				#size-cells = <0>;
6fe745255e3d2a Dang Huynh 2025-08-20  1129  
6fe745255e3d2a Dang Huynh 2025-08-20  1130  				status = "disabled";
6fe745255e3d2a Dang Huynh 2025-08-20  1131  
6fe745255e3d2a Dang Huynh 2025-08-20  1132  				ports {
6fe745255e3d2a Dang Huynh 2025-08-20  1133  					#address-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20  1134  					#size-cells = <0>;
6fe745255e3d2a Dang Huynh 2025-08-20  1135  
6fe745255e3d2a Dang Huynh 2025-08-20  1136  					port@0 {
6fe745255e3d2a Dang Huynh 2025-08-20  1137  						reg = <0>;
6fe745255e3d2a Dang Huynh 2025-08-20  1138  						mdss_dsi0_in: endpoint {
6fe745255e3d2a Dang Huynh 2025-08-20  1139  							remote-endpoint = <&mdp5_intf1_out>;
6fe745255e3d2a Dang Huynh 2025-08-20  1140  						};
6fe745255e3d2a Dang Huynh 2025-08-20  1141  					};
6fe745255e3d2a Dang Huynh 2025-08-20  1142  
6fe745255e3d2a Dang Huynh 2025-08-20  1143  					port@1 {
6fe745255e3d2a Dang Huynh 2025-08-20  1144  						reg = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20  1145  						mdss_dsi0_out: endpoint {
6fe745255e3d2a Dang Huynh 2025-08-20  1146  						};
6fe745255e3d2a Dang Huynh 2025-08-20  1147  					};
6fe745255e3d2a Dang Huynh 2025-08-20  1148  				};
6fe745255e3d2a Dang Huynh 2025-08-20  1149  
6fe745255e3d2a Dang Huynh 2025-08-20  1150  				mdss_dsi0_opp_table: opp-table {
6fe745255e3d2a Dang Huynh 2025-08-20  1151  					compatible = "operating-points-v2";
6fe745255e3d2a Dang Huynh 2025-08-20  1152  
6fe745255e3d2a Dang Huynh 2025-08-20  1153  					opp-125000000 {
6fe745255e3d2a Dang Huynh 2025-08-20  1154  						opp-hz = /bits/ 64 <125000000>;
6fe745255e3d2a Dang Huynh 2025-08-20  1155  						required-opps = <&rpmpd_opp_svs>;
6fe745255e3d2a Dang Huynh 2025-08-20  1156  					};
6fe745255e3d2a Dang Huynh 2025-08-20  1157  
6fe745255e3d2a Dang Huynh 2025-08-20  1158  					opp-187500000 {
6fe745255e3d2a Dang Huynh 2025-08-20  1159  						opp-hz = /bits/ 64 <187500000>;
6fe745255e3d2a Dang Huynh 2025-08-20  1160  						required-opps = <&rpmpd_opp_nom>;
6fe745255e3d2a Dang Huynh 2025-08-20  1161  					};
6fe745255e3d2a Dang Huynh 2025-08-20  1162  				};
6fe745255e3d2a Dang Huynh 2025-08-20  1163  			};
6fe745255e3d2a Dang Huynh 2025-08-20  1164  
6fe745255e3d2a Dang Huynh 2025-08-20  1165  			mdss_dsi0_phy: phy@1a94400 {
6fe745255e3d2a Dang Huynh 2025-08-20  1166  				compatible = "qcom,dsi-phy-28nm-8937";
6fe745255e3d2a Dang Huynh 2025-08-20  1167  				reg = <0x01a94a00 0xd4>,
6fe745255e3d2a Dang Huynh 2025-08-20  1168  				      <0x01a94400 0x280>,
6fe745255e3d2a Dang Huynh 2025-08-20  1169  				      <0x01a94b80 0x30>;
6fe745255e3d2a Dang Huynh 2025-08-20  1170  				reg-names = "dsi_pll",
6fe745255e3d2a Dang Huynh 2025-08-20  1171  					    "dsi_phy",
6fe745255e3d2a Dang Huynh 2025-08-20  1172  					    "dsi_phy_regulator";
6fe745255e3d2a Dang Huynh 2025-08-20  1173  
6fe745255e3d2a Dang Huynh 2025-08-20  1174  				#clock-cells = <1>;
6fe745255e3d2a Dang Huynh 2025-08-20  1175  				#phy-cells = <0>;
6fe745255e3d2a Dang Huynh 2025-08-20  1176  
6fe745255e3d2a Dang Huynh 2025-08-20  1177  				clocks = <&gcc GCC_MDSS_AHB_CLK>,
6fe745255e3d2a Dang Huynh 2025-08-20  1178  					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
6fe745255e3d2a Dang Huynh 2025-08-20  1179  				clock-names = "iface",
6fe745255e3d2a Dang Huynh 2025-08-20  1180  					      "ref";
6fe745255e3d2a Dang Huynh 2025-08-20  1181  
6fe745255e3d2a Dang Huynh 2025-08-20  1182  				status = "disabled";
6fe745255e3d2a Dang Huynh 2025-08-20  1183  			};
6fe745255e3d2a Dang Huynh 2025-08-20  1184  
6fe745255e3d2a Dang Huynh 2025-08-20 @1185  			mdss_dsi1: dsi@1a96000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
