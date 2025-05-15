Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6971C28E
	for <oe-kbuild@lists.linux.dev>; Thu, 15 May 2025 12:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747313925; cv=none; b=ZyfeHPmBV7xmIkj7kivVQ+ikTPUpTiFYcN9dNgrH//TKXxiPXTwECCeckIjAUFQfueWxOV3Xdxhx1cHTKReCU8OZ2TBrlMCpKAiLKGF/jsVngXhgKrCrlxIuexKs3xIF2KxRbvlzgSK79LLY4sZ1plFqBF0VlfynrD7YG22hvPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747313925; c=relaxed/simple;
	bh=H4jKiBDyDCsSH5Ayedq2BinkoxSgZ/PN1JndC87GbsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A3ytu4ngZcwgvC1i/QQ6CPABWQFR8eIkErmB4J6o4vK1Kz7/57ewBEaOjN0Xcpl6M7s1TkS1b0pJy7NZfD8hmwty7VI2KP64NQK8KRowe0+dyYM+bgotor85XDcdi/4cgzH6fLGxlSvpkp5/Q0ckUyG6bGo1KIFfYq1yTy2uCpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W06mcSrF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W06mcSrF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747313922; x=1778849922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H4jKiBDyDCsSH5Ayedq2BinkoxSgZ/PN1JndC87GbsQ=;
  b=W06mcSrF7asFGZj6d22695Bv4M84v3VuPAxByWx7HaHliM+HQMLZ1y4v
   ranuY2kDxIgrBmlj0NYaydutXlSTxZrXnKpuOj4W7Fxf9Znsfh1QOMWtp
   atYDT0CvBIPpNUxO4FyJTKl60YjM7OuixLGKuNJdsRn8SSiLSO6tFcVNZ
   CJQqN2fYlmOWfiSh03YV+T3NUfkwhIfQjCzoo7jEGvOAqLGResbHJa/K9
   syfKLBQ1gg3dEqQbDS5+QqFuho3VgyNd0svotQR673var//XbJ2nse5yD
   Kc6L6879EZzczruPJYTmatGCPD/xH2CU1S0hVVz/uATSM157Ai3UDgLWN
   A==;
X-CSE-ConnectionGUID: tYStbzMbQQmPpXGdZaDcqA==
X-CSE-MsgGUID: 6CQ8SnlCQXG78h9rUkxbig==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60584940"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60584940"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 05:58:41 -0700
X-CSE-ConnectionGUID: ypNLGSjOSoKFH4krjisIaQ==
X-CSE-MsgGUID: o+ysFhtkQcaF28D2ubZxLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="169427530"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 May 2025 05:58:38 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFYAX-000IOl-1i;
	Thu, 15 May 2025 12:58:37 +0000
Date: Thu, 15 May 2025 20:58:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r9a09g047: Add CRU, CSI2 nodes
Message-ID: <202505152025.UPAkwf7A-lkp@intel.com>
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
In-Reply-To: <20250514162422.910114-2-tommaso.merciai.xr@bp.renesas.com>
References: <20250514162422.910114-2-tommaso.merciai.xr@bp.renesas.com>
TO: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
TO: tomm.merciai@gmail.com
CC: linux-renesas-soc@vger.kernel.org
CC: biju.das.jz@bp.renesas.com
CC: prabhakar.mahadev-lad.rj@bp.renesas.com
CC: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Magnus Damm <magnus.damm@gmail.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Tommaso,

kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-renesas-devel/next]
[also build test WARNING on next-20250515]
[cannot apply to linus/master v6.15-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tommaso-Merciai/arm64-dts-renesas-r9a09g047-Add-CRU-CSI2-nodes/20250515-003134
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
patch link:    https://lore.kernel.org/r/20250514162422.910114-2-tommaso.merciai.xr%40bp.renesas.com
patch subject: [PATCH 1/4] arm64: dts: renesas: r9a09g047: Add CRU, CSI2 nodes
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-002-20250515 (https://download.01.org/0day-ci/archive/20250515/202505152025.UPAkwf7A-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505152025.UPAkwf7A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505152025.UPAkwf7A-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g047.dtsi:697.12-706.7: Warning (graph_child_address): /soc/video@16000000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r9a09g047.dtsi:729.12-738.7: Warning (graph_child_address): /soc/csi2@16000400/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +697 arch/arm64/boot/dts/renesas/r9a09g047.dtsi

9977754eeebed7 Biju Das        2024-12-03   10  
9977754eeebed7 Biju Das        2024-12-03   11  / {
9977754eeebed7 Biju Das        2024-12-03   12  	compatible = "renesas,r9a09g047";
9977754eeebed7 Biju Das        2024-12-03   13  	#address-cells = <2>;
9977754eeebed7 Biju Das        2024-12-03   14  	#size-cells = <2>;
9977754eeebed7 Biju Das        2024-12-03   15  
9977754eeebed7 Biju Das        2024-12-03   16  	audio_extal_clk: audio-clk {
9977754eeebed7 Biju Das        2024-12-03   17  		compatible = "fixed-clock";
9977754eeebed7 Biju Das        2024-12-03   18  		#clock-cells = <0>;
9977754eeebed7 Biju Das        2024-12-03   19  		/* This value must be overridden by the board */
9977754eeebed7 Biju Das        2024-12-03   20  		clock-frequency = <0>;
9977754eeebed7 Biju Das        2024-12-03   21  	};
9977754eeebed7 Biju Das        2024-12-03   22  
8e96597f3c2500 Biju Das        2024-12-03   23  	/*
8e96597f3c2500 Biju Das        2024-12-03   24  	 * The default cluster table is based on the assumption that the PLLCA55 clock
8e96597f3c2500 Biju Das        2024-12-03   25  	 * frequency is set to 1.7GHz. The PLLCA55 clock frequency can be set to
8e96597f3c2500 Biju Das        2024-12-03   26  	 * 1.7/1.6/1.5/1.1 GHz based on the BOOTPLLCA_0/1 pins (and additionally can be
8e96597f3c2500 Biju Das        2024-12-03   27  	 * clocked to 1.8GHz as well). The table below should be overridden in the board
8e96597f3c2500 Biju Das        2024-12-03   28  	 * DTS based on the PLLCA55 clock frequency.
8e96597f3c2500 Biju Das        2024-12-03   29  	 */
8e96597f3c2500 Biju Das        2024-12-03   30  	cluster0_opp: opp-table-0 {
8e96597f3c2500 Biju Das        2024-12-03   31  		compatible = "operating-points-v2";
8e96597f3c2500 Biju Das        2024-12-03   32  
8e96597f3c2500 Biju Das        2024-12-03   33  		opp-1700000000 {
8e96597f3c2500 Biju Das        2024-12-03   34  			opp-hz = /bits/ 64 <1700000000>;
8e96597f3c2500 Biju Das        2024-12-03   35  			opp-microvolt = <900000>;
8e96597f3c2500 Biju Das        2024-12-03   36  			clock-latency-ns = <300000>;
8e96597f3c2500 Biju Das        2024-12-03   37  		};
8e96597f3c2500 Biju Das        2024-12-03   38  		opp-850000000 {
8e96597f3c2500 Biju Das        2024-12-03   39  			opp-hz = /bits/ 64 <850000000>;
8e96597f3c2500 Biju Das        2024-12-03   40  			opp-microvolt = <800000>;
8e96597f3c2500 Biju Das        2024-12-03   41  			clock-latency-ns = <300000>;
8e96597f3c2500 Biju Das        2024-12-03   42  		};
8e96597f3c2500 Biju Das        2024-12-03   43  		opp-425000000 {
8e96597f3c2500 Biju Das        2024-12-03   44  			opp-hz = /bits/ 64 <425000000>;
8e96597f3c2500 Biju Das        2024-12-03   45  			opp-microvolt = <800000>;
8e96597f3c2500 Biju Das        2024-12-03   46  			clock-latency-ns = <300000>;
8e96597f3c2500 Biju Das        2024-12-03   47  		};
8e96597f3c2500 Biju Das        2024-12-03   48  		opp-212500000 {
8e96597f3c2500 Biju Das        2024-12-03   49  			opp-hz = /bits/ 64 <212500000>;
8e96597f3c2500 Biju Das        2024-12-03   50  			opp-microvolt = <800000>;
8e96597f3c2500 Biju Das        2024-12-03   51  			clock-latency-ns = <300000>;
8e96597f3c2500 Biju Das        2024-12-03   52  			opp-suspend;
8e96597f3c2500 Biju Das        2024-12-03   53  		};
8e96597f3c2500 Biju Das        2024-12-03   54  	};
8e96597f3c2500 Biju Das        2024-12-03   55  
9977754eeebed7 Biju Das        2024-12-03   56  	cpus {
9977754eeebed7 Biju Das        2024-12-03   57  		#address-cells = <1>;
9977754eeebed7 Biju Das        2024-12-03   58  		#size-cells = <0>;
9977754eeebed7 Biju Das        2024-12-03   59  
9977754eeebed7 Biju Das        2024-12-03   60  		cpu0: cpu@0 {
9977754eeebed7 Biju Das        2024-12-03   61  			compatible = "arm,cortex-a55";
9977754eeebed7 Biju Das        2024-12-03   62  			reg = <0>;
9977754eeebed7 Biju Das        2024-12-03   63  			device_type = "cpu";
9977754eeebed7 Biju Das        2024-12-03   64  			next-level-cache = <&L3_CA55>;
9977754eeebed7 Biju Das        2024-12-03   65  			enable-method = "psci";
8e96597f3c2500 Biju Das        2024-12-03   66  			clocks = <&cpg CPG_CORE R9A09G047_CA55_0_CORECLK0>;
8e96597f3c2500 Biju Das        2024-12-03   67  			operating-points-v2 = <&cluster0_opp>;
9977754eeebed7 Biju Das        2024-12-03   68  		};
9977754eeebed7 Biju Das        2024-12-03   69  
9977754eeebed7 Biju Das        2024-12-03   70  		cpu1: cpu@100 {
9977754eeebed7 Biju Das        2024-12-03   71  			compatible = "arm,cortex-a55";
9977754eeebed7 Biju Das        2024-12-03   72  			reg = <0x100>;
9977754eeebed7 Biju Das        2024-12-03   73  			device_type = "cpu";
9977754eeebed7 Biju Das        2024-12-03   74  			next-level-cache = <&L3_CA55>;
9977754eeebed7 Biju Das        2024-12-03   75  			enable-method = "psci";
8e96597f3c2500 Biju Das        2024-12-03   76  			clocks = <&cpg CPG_CORE R9A09G047_CA55_0_CORECLK1>;
8e96597f3c2500 Biju Das        2024-12-03   77  			operating-points-v2 = <&cluster0_opp>;
9977754eeebed7 Biju Das        2024-12-03   78  		};
9977754eeebed7 Biju Das        2024-12-03   79  
9977754eeebed7 Biju Das        2024-12-03   80  		cpu2: cpu@200 {
9977754eeebed7 Biju Das        2024-12-03   81  			compatible = "arm,cortex-a55";
9977754eeebed7 Biju Das        2024-12-03   82  			reg = <0x200>;
9977754eeebed7 Biju Das        2024-12-03   83  			device_type = "cpu";
9977754eeebed7 Biju Das        2024-12-03   84  			next-level-cache = <&L3_CA55>;
9977754eeebed7 Biju Das        2024-12-03   85  			enable-method = "psci";
8e96597f3c2500 Biju Das        2024-12-03   86  			clocks = <&cpg CPG_CORE R9A09G047_CA55_0_CORECLK2>;
8e96597f3c2500 Biju Das        2024-12-03   87  			operating-points-v2 = <&cluster0_opp>;
9977754eeebed7 Biju Das        2024-12-03   88  		};
9977754eeebed7 Biju Das        2024-12-03   89  
9977754eeebed7 Biju Das        2024-12-03   90  		cpu3: cpu@300 {
9977754eeebed7 Biju Das        2024-12-03   91  			compatible = "arm,cortex-a55";
9977754eeebed7 Biju Das        2024-12-03   92  			reg = <0x300>;
9977754eeebed7 Biju Das        2024-12-03   93  			device_type = "cpu";
9977754eeebed7 Biju Das        2024-12-03   94  			next-level-cache = <&L3_CA55>;
9977754eeebed7 Biju Das        2024-12-03   95  			enable-method = "psci";
8e96597f3c2500 Biju Das        2024-12-03   96  			clocks = <&cpg CPG_CORE R9A09G047_CA55_0_CORECLK3>;
8e96597f3c2500 Biju Das        2024-12-03   97  			operating-points-v2 = <&cluster0_opp>;
9977754eeebed7 Biju Das        2024-12-03   98  		};
9977754eeebed7 Biju Das        2024-12-03   99  
9977754eeebed7 Biju Das        2024-12-03  100  		L3_CA55: cache-controller-0 {
9977754eeebed7 Biju Das        2024-12-03  101  			compatible = "cache";
9977754eeebed7 Biju Das        2024-12-03  102  			cache-unified;
9977754eeebed7 Biju Das        2024-12-03  103  			cache-size = <0x100000>;
9977754eeebed7 Biju Das        2024-12-03  104  			cache-level = <3>;
9977754eeebed7 Biju Das        2024-12-03  105  		};
9977754eeebed7 Biju Das        2024-12-03  106  	};
9977754eeebed7 Biju Das        2024-12-03  107  
af06adb5106ad1 Tommaso Merciai 2025-04-02  108  	gpu_opp_table: opp-table-1 {
af06adb5106ad1 Tommaso Merciai 2025-04-02  109  		compatible = "operating-points-v2";
af06adb5106ad1 Tommaso Merciai 2025-04-02  110  
af06adb5106ad1 Tommaso Merciai 2025-04-02  111  		opp-630000000 {
af06adb5106ad1 Tommaso Merciai 2025-04-02  112  			opp-hz = /bits/ 64 <630000000>;
af06adb5106ad1 Tommaso Merciai 2025-04-02  113  			opp-microvolt = <800000>;
af06adb5106ad1 Tommaso Merciai 2025-04-02  114  		};
af06adb5106ad1 Tommaso Merciai 2025-04-02  115  
af06adb5106ad1 Tommaso Merciai 2025-04-02  116  		opp-315000000 {
af06adb5106ad1 Tommaso Merciai 2025-04-02  117  			opp-hz = /bits/ 64 <315000000>;
af06adb5106ad1 Tommaso Merciai 2025-04-02  118  			opp-microvolt = <800000>;
af06adb5106ad1 Tommaso Merciai 2025-04-02  119  		};
af06adb5106ad1 Tommaso Merciai 2025-04-02  120  
af06adb5106ad1 Tommaso Merciai 2025-04-02  121  		opp-157500000 {
af06adb5106ad1 Tommaso Merciai 2025-04-02  122  			opp-hz = /bits/ 64 <157500000>;
af06adb5106ad1 Tommaso Merciai 2025-04-02  123  			opp-microvolt = <800000>;
af06adb5106ad1 Tommaso Merciai 2025-04-02  124  		};
af06adb5106ad1 Tommaso Merciai 2025-04-02  125  
af06adb5106ad1 Tommaso Merciai 2025-04-02  126  		opp-78750000 {
af06adb5106ad1 Tommaso Merciai 2025-04-02  127  			opp-hz = /bits/ 64 <78750000>;
af06adb5106ad1 Tommaso Merciai 2025-04-02  128  			opp-microvolt = <800000>;
af06adb5106ad1 Tommaso Merciai 2025-04-02  129  		};
af06adb5106ad1 Tommaso Merciai 2025-04-02  130  
af06adb5106ad1 Tommaso Merciai 2025-04-02  131  		opp-19687500 {
af06adb5106ad1 Tommaso Merciai 2025-04-02  132  			opp-hz = /bits/ 64 <19687500>;
af06adb5106ad1 Tommaso Merciai 2025-04-02  133  			opp-microvolt = <800000>;
af06adb5106ad1 Tommaso Merciai 2025-04-02  134  		};
af06adb5106ad1 Tommaso Merciai 2025-04-02  135  	};
af06adb5106ad1 Tommaso Merciai 2025-04-02  136  
9977754eeebed7 Biju Das        2024-12-03  137  	psci {
9977754eeebed7 Biju Das        2024-12-03  138  		compatible = "arm,psci-1.0", "arm,psci-0.2";
9977754eeebed7 Biju Das        2024-12-03  139  		method = "smc";
9977754eeebed7 Biju Das        2024-12-03  140  	};
9977754eeebed7 Biju Das        2024-12-03  141  
9977754eeebed7 Biju Das        2024-12-03  142  	qextal_clk: qextal-clk {
9977754eeebed7 Biju Das        2024-12-03  143  		compatible = "fixed-clock";
9977754eeebed7 Biju Das        2024-12-03  144  		#clock-cells = <0>;
9977754eeebed7 Biju Das        2024-12-03  145  		/* This value must be overridden by the board */
9977754eeebed7 Biju Das        2024-12-03  146  		clock-frequency = <0>;
9977754eeebed7 Biju Das        2024-12-03  147  	};
9977754eeebed7 Biju Das        2024-12-03  148  
9977754eeebed7 Biju Das        2024-12-03  149  	rtxin_clk: rtxin-clk {
9977754eeebed7 Biju Das        2024-12-03  150  		compatible = "fixed-clock";
9977754eeebed7 Biju Das        2024-12-03  151  		#clock-cells = <0>;
9977754eeebed7 Biju Das        2024-12-03  152  		/* This value must be overridden by the board */
9977754eeebed7 Biju Das        2024-12-03  153  		clock-frequency = <0>;
9977754eeebed7 Biju Das        2024-12-03  154  	};
9977754eeebed7 Biju Das        2024-12-03  155  
9977754eeebed7 Biju Das        2024-12-03  156  	soc: soc {
9977754eeebed7 Biju Das        2024-12-03  157  		compatible = "simple-bus";
9977754eeebed7 Biju Das        2024-12-03  158  		interrupt-parent = <&gic>;
9977754eeebed7 Biju Das        2024-12-03  159  		#address-cells = <2>;
9977754eeebed7 Biju Das        2024-12-03  160  		#size-cells = <2>;
9977754eeebed7 Biju Das        2024-12-03  161  		ranges;
9977754eeebed7 Biju Das        2024-12-03  162  
b7509775670d69 Biju Das        2025-02-07  163  		icu: interrupt-controller@10400000 {
b7509775670d69 Biju Das        2025-02-07  164  			compatible = "renesas,r9a09g047-icu";
b7509775670d69 Biju Das        2025-02-07  165  			reg = <0 0x10400000 0 0x10000>;
b7509775670d69 Biju Das        2025-02-07  166  			#interrupt-cells = <2>;
b7509775670d69 Biju Das        2025-02-07  167  			#address-cells = <0>;
b7509775670d69 Biju Das        2025-02-07  168  			interrupt-controller;
b7509775670d69 Biju Das        2025-02-07  169  			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  170  				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  171  				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  172  				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  173  				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  174  				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  175  				     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  176  				     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  177  				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  178  				     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  179  				     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  180  				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  181  				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  182  				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  183  				     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  184  				     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  185  				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  186  				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  187  				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  188  				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  189  				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  190  				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  191  				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  192  				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  193  				     <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  194  				     <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  195  				     <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  196  				     <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  197  				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  198  				     <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  199  				     <GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  200  				     <GIC_SPI 433 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  201  				     <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  202  				     <GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  203  				     <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  204  				     <GIC_SPI 437 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  205  				     <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  206  				     <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  207  				     <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  208  				     <GIC_SPI 441 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  209  				     <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  210  				     <GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  211  				     <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  212  				     <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  213  				     <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  214  				     <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  215  				     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  216  				     <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  217  				     <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  218  				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>,
b7509775670d69 Biju Das        2025-02-07  219  				     <GIC_SPI 263 IRQ_TYPE_EDGE_RISING>,
b7509775670d69 Biju Das        2025-02-07  220  				     <GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
b7509775670d69 Biju Das        2025-02-07  221  				     <GIC_SPI 265 IRQ_TYPE_EDGE_RISING>,
b7509775670d69 Biju Das        2025-02-07  222  				     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  223  				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  224  				     <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  225  				     <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>,
b7509775670d69 Biju Das        2025-02-07  226  				     <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>;
b7509775670d69 Biju Das        2025-02-07  227  			interrupt-names = "nmi",
b7509775670d69 Biju Das        2025-02-07  228  					  "port_irq0", "port_irq1", "port_irq2",
b7509775670d69 Biju Das        2025-02-07  229  					  "port_irq3", "port_irq4", "port_irq5",
b7509775670d69 Biju Das        2025-02-07  230  					  "port_irq6", "port_irq7", "port_irq8",
b7509775670d69 Biju Das        2025-02-07  231  					  "port_irq9", "port_irq10", "port_irq11",
b7509775670d69 Biju Das        2025-02-07  232  					  "port_irq12", "port_irq13", "port_irq14",
b7509775670d69 Biju Das        2025-02-07  233  					  "port_irq15",
b7509775670d69 Biju Das        2025-02-07  234  					  "tint0", "tint1", "tint2", "tint3",
b7509775670d69 Biju Das        2025-02-07  235  					  "tint4", "tint5", "tint6", "tint7",
b7509775670d69 Biju Das        2025-02-07  236  					  "tint8", "tint9", "tint10", "tint11",
b7509775670d69 Biju Das        2025-02-07  237  					  "tint12", "tint13", "tint14", "tint15",
b7509775670d69 Biju Das        2025-02-07  238  					  "tint16", "tint17", "tint18", "tint19",
b7509775670d69 Biju Das        2025-02-07  239  					  "tint20", "tint21", "tint22", "tint23",
b7509775670d69 Biju Das        2025-02-07  240  					  "tint24", "tint25", "tint26", "tint27",
b7509775670d69 Biju Das        2025-02-07  241  					  "tint28", "tint29", "tint30", "tint31",
b7509775670d69 Biju Das        2025-02-07  242  					  "int-ca55-0", "int-ca55-1",
b7509775670d69 Biju Das        2025-02-07  243  					  "int-ca55-2", "int-ca55-3",
b7509775670d69 Biju Das        2025-02-07  244  					  "icu-error-ca55",
b7509775670d69 Biju Das        2025-02-07  245  					  "gpt-u0-gtciada", "gpt-u0-gtciadb",
b7509775670d69 Biju Das        2025-02-07  246  					  "gpt-u1-gtciada", "gpt-u1-gtciadb";
b7509775670d69 Biju Das        2025-02-07  247  			clocks = <&cpg CPG_MOD 0x5>;
b7509775670d69 Biju Das        2025-02-07  248  			power-domains = <&cpg>;
b7509775670d69 Biju Das        2025-02-07  249  			resets = <&cpg 0x36>;
b7509775670d69 Biju Das        2025-02-07  250  		};
b7509775670d69 Biju Das        2025-02-07  251  
987040d4601e98 Biju Das        2024-12-16  252  		pinctrl: pinctrl@10410000 {
987040d4601e98 Biju Das        2024-12-16  253  			compatible = "renesas,r9a09g047-pinctrl";
987040d4601e98 Biju Das        2024-12-16  254  			reg = <0 0x10410000 0 0x10000>;
987040d4601e98 Biju Das        2024-12-16  255  			clocks = <&cpg CPG_CORE R9A09G047_IOTOP_0_SHCLK>;
987040d4601e98 Biju Das        2024-12-16  256  			gpio-controller;
987040d4601e98 Biju Das        2024-12-16  257  			#gpio-cells = <2>;
987040d4601e98 Biju Das        2024-12-16  258  			gpio-ranges = <&pinctrl 0 0 232>;
987040d4601e98 Biju Das        2024-12-16  259  			#interrupt-cells = <2>;
987040d4601e98 Biju Das        2024-12-16  260  			interrupt-controller;
b7509775670d69 Biju Das        2025-02-07  261  			interrupt-parent = <&icu>;
987040d4601e98 Biju Das        2024-12-16  262  			power-domains = <&cpg>;
987040d4601e98 Biju Das        2024-12-16  263  			resets = <&cpg 0xa5>, <&cpg 0xa6>;
987040d4601e98 Biju Das        2024-12-16  264  		};
987040d4601e98 Biju Das        2024-12-16  265  
9977754eeebed7 Biju Das        2024-12-03  266  		cpg: clock-controller@10420000 {
9977754eeebed7 Biju Das        2024-12-03  267  			compatible = "renesas,r9a09g047-cpg";
9977754eeebed7 Biju Das        2024-12-03  268  			reg = <0 0x10420000 0 0x10000>;
9977754eeebed7 Biju Das        2024-12-03  269  			clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>;
9977754eeebed7 Biju Das        2024-12-03  270  			clock-names = "audio_extal", "rtxin", "qextal";
9977754eeebed7 Biju Das        2024-12-03  271  			#clock-cells = <2>;
9977754eeebed7 Biju Das        2024-12-03  272  			#reset-cells = <1>;
9977754eeebed7 Biju Das        2024-12-03  273  			#power-domain-cells = <0>;
9977754eeebed7 Biju Das        2024-12-03  274  		};
9977754eeebed7 Biju Das        2024-12-03  275  
13e9b03263dcdc John Madieu     2025-01-23  276  		sys: system-controller@10430000 {
13e9b03263dcdc John Madieu     2025-01-23  277  			compatible = "renesas,r9a09g047-sys";
13e9b03263dcdc John Madieu     2025-01-23  278  			reg = <0 0x10430000 0 0x10000>;
13e9b03263dcdc John Madieu     2025-01-23  279  			clocks = <&cpg CPG_CORE R9A09G047_SYS_0_PCLK>;
13e9b03263dcdc John Madieu     2025-01-23  280  			resets = <&cpg 0x30>;
13e9b03263dcdc John Madieu     2025-01-23  281  		};
13e9b03263dcdc John Madieu     2025-01-23  282  
9977754eeebed7 Biju Das        2024-12-03  283  		scif0: serial@11c01400 {
9977754eeebed7 Biju Das        2024-12-03  284  			compatible = "renesas,scif-r9a09g047", "renesas,scif-r9a09g057";
9977754eeebed7 Biju Das        2024-12-03  285  			reg = <0 0x11c01400 0 0x400>;
9977754eeebed7 Biju Das        2024-12-03  286  			interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>,
9977754eeebed7 Biju Das        2024-12-03  287  				     <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>,
9977754eeebed7 Biju Das        2024-12-03  288  				     <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>,
9977754eeebed7 Biju Das        2024-12-03  289  				     <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>,
9977754eeebed7 Biju Das        2024-12-03  290  				     <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>,
9977754eeebed7 Biju Das        2024-12-03  291  				     <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>,
9977754eeebed7 Biju Das        2024-12-03  292  				     <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
9977754eeebed7 Biju Das        2024-12-03  293  				     <GIC_SPI 536 IRQ_TYPE_EDGE_RISING>,
9977754eeebed7 Biju Das        2024-12-03  294  				     <GIC_SPI 537 IRQ_TYPE_EDGE_RISING>;
9977754eeebed7 Biju Das        2024-12-03  295  			interrupt-names = "eri", "rxi", "txi", "bri", "dri",
9977754eeebed7 Biju Das        2024-12-03  296  					  "tei", "tei-dri", "rxi-edge", "txi-edge";
9977754eeebed7 Biju Das        2024-12-03  297  			clocks = <&cpg CPG_MOD 0x8f>;
9977754eeebed7 Biju Das        2024-12-03  298  			clock-names = "fck";
9977754eeebed7 Biju Das        2024-12-03  299  			power-domains = <&cpg>;
9977754eeebed7 Biju Das        2024-12-03  300  			resets = <&cpg 0x95>;
9977754eeebed7 Biju Das        2024-12-03  301  			status = "disabled";
9977754eeebed7 Biju Das        2024-12-03  302  		};
9977754eeebed7 Biju Das        2024-12-03  303  
9c1d49dd0975cd Biju Das        2025-03-20  304  		canfd: can@12440000 {
9c1d49dd0975cd Biju Das        2025-03-20  305  			compatible = "renesas,r9a09g047-canfd";
9c1d49dd0975cd Biju Das        2025-03-20  306  			reg = <0 0x12440000 0 0x40000>;
9c1d49dd0975cd Biju Das        2025-03-20  307  			interrupts = <GIC_SPI 709 IRQ_TYPE_LEVEL_HIGH>,
9c1d49dd0975cd Biju Das        2025-03-20  308  				     <GIC_SPI 710 IRQ_TYPE_LEVEL_HIGH>,
9c1d49dd0975cd Biju Das        2025-03-20  309  				     <GIC_SPI 697 IRQ_TYPE_LEVEL_HIGH>,
9c1d49dd0975cd Biju Das        2025-03-20  310  				     <GIC_SPI 703 IRQ_TYPE_LEVEL_HIGH>,
9c1d49dd0975cd Biju Das        2025-03-20  311  				     <GIC_SPI 711 IRQ_TYPE_LEVEL_HIGH>,
9c1d49dd0975cd Biju Das        2025-03-20  312  				     <GIC_SPI 698 IRQ_TYPE_LEVEL_HIGH>,
9c1d49dd0975cd Biju Das        2025-03-20  313  				     <GIC_SPI 704 IRQ_TYPE_LEVEL_HIGH>,
9c1d49dd0975cd Biju Das        2025-03-20  314  				     <GIC_SPI 712 IRQ_TYPE_LEVEL_HIGH>,
9c1d49dd0975cd Biju Das        2025-03-20  315  				     <GIC_SPI 699 IRQ_TYPE_LEVEL_HIGH>,
9c1d49dd0975cd Biju Das        2025-03-20  316  				     <GIC_SPI 705 IRQ_TYPE_LEVEL_HIGH>,
9c1d49dd0975cd Biju Das        2025-03-20  317  				     <GIC_SPI 713 IRQ_TYPE_LEVEL_HIGH>,
9c1d49dd0975cd Biju Das        2025-03-20  318  				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>,
9c1d49dd0975cd Biju Das        2025-03-20  319  				     <GIC_SPI 706 IRQ_TYPE_LEVEL_HIGH>,
9c1d49dd0975cd Biju Das        2025-03-20  320  				     <GIC_SPI 714 IRQ_TYPE_LEVEL_HIGH>,
9c1d49dd0975cd Biju Das        2025-03-20  321  				     <GIC_SPI 701 IRQ_TYPE_LEVEL_HIGH>,
9c1d49dd0975cd Biju Das        2025-03-20  322  				     <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>,
9c1d49dd0975cd Biju Das        2025-03-20  323  				     <GIC_SPI 715 IRQ_TYPE_LEVEL_HIGH>,
9c1d49dd0975cd Biju Das        2025-03-20  324  				     <GIC_SPI 702 IRQ_TYPE_LEVEL_HIGH>,
9c1d49dd0975cd Biju Das        2025-03-20  325  				     <GIC_SPI 708 IRQ_TYPE_LEVEL_HIGH>,
9c1d49dd0975cd Biju Das        2025-03-20  326  				     <GIC_SPI 716 IRQ_TYPE_LEVEL_HIGH>;
9c1d49dd0975cd Biju Das        2025-03-20  327  			interrupt-names = "g_err", "g_recc",
9c1d49dd0975cd Biju Das        2025-03-20  328  					  "ch0_err", "ch0_rec", "ch0_trx",
9c1d49dd0975cd Biju Das        2025-03-20  329  					  "ch1_err", "ch1_rec", "ch1_trx",
9c1d49dd0975cd Biju Das        2025-03-20  330  					  "ch2_err", "ch2_rec", "ch2_trx",
9c1d49dd0975cd Biju Das        2025-03-20  331  					  "ch3_err", "ch3_rec", "ch3_trx",
9c1d49dd0975cd Biju Das        2025-03-20  332  					  "ch4_err", "ch4_rec", "ch4_trx",
9c1d49dd0975cd Biju Das        2025-03-20  333  					  "ch5_err", "ch5_rec", "ch5_trx";
9c1d49dd0975cd Biju Das        2025-03-20  334  			clocks = <&cpg CPG_MOD 0x9c>, <&cpg CPG_MOD 0x9d>,
9c1d49dd0975cd Biju Das        2025-03-20  335  				 <&cpg CPG_MOD 0x9e>;
9c1d49dd0975cd Biju Das        2025-03-20  336  			clock-names = "fck", "ram_clk", "can_clk";
9c1d49dd0975cd Biju Das        2025-03-20  337  			assigned-clocks = <&cpg CPG_MOD 0x9e>;
9c1d49dd0975cd Biju Das        2025-03-20  338  			assigned-clock-rates = <80000000>;
9c1d49dd0975cd Biju Das        2025-03-20  339  			resets = <&cpg 0xa1>, <&cpg 0xa2>;
9c1d49dd0975cd Biju Das        2025-03-20  340  			reset-names = "rstp_n", "rstc_n";
9c1d49dd0975cd Biju Das        2025-03-20  341  			power-domains = <&cpg>;
9c1d49dd0975cd Biju Das        2025-03-20  342  			status = "disabled";
9c1d49dd0975cd Biju Das        2025-03-20  343  
9c1d49dd0975cd Biju Das        2025-03-20  344  			channel0 {
9c1d49dd0975cd Biju Das        2025-03-20  345  				status = "disabled";
9c1d49dd0975cd Biju Das        2025-03-20  346  			};
9c1d49dd0975cd Biju Das        2025-03-20  347  			channel1 {
9c1d49dd0975cd Biju Das        2025-03-20  348  				status = "disabled";
9c1d49dd0975cd Biju Das        2025-03-20  349  			};
9c1d49dd0975cd Biju Das        2025-03-20  350  			channel2 {
9c1d49dd0975cd Biju Das        2025-03-20  351  				status = "disabled";
9c1d49dd0975cd Biju Das        2025-03-20  352  			};
9c1d49dd0975cd Biju Das        2025-03-20  353  			channel3 {
9c1d49dd0975cd Biju Das        2025-03-20  354  				status = "disabled";
9c1d49dd0975cd Biju Das        2025-03-20  355  			};
9c1d49dd0975cd Biju Das        2025-03-20  356  			channel4 {
9c1d49dd0975cd Biju Das        2025-03-20  357  				status = "disabled";
9c1d49dd0975cd Biju Das        2025-03-20  358  			};
9c1d49dd0975cd Biju Das        2025-03-20  359  			channel5 {
9c1d49dd0975cd Biju Das        2025-03-20  360  				status = "disabled";
9c1d49dd0975cd Biju Das        2025-03-20  361  			};
9c1d49dd0975cd Biju Das        2025-03-20  362  		};
9c1d49dd0975cd Biju Das        2025-03-20  363  
146a9b058ec780 Biju Das        2025-01-15  364  		wdt1: watchdog@14400000 {
146a9b058ec780 Biju Das        2025-01-15  365  			compatible = "renesas,r9a09g047-wdt", "renesas,r9a09g057-wdt";
146a9b058ec780 Biju Das        2025-01-15  366  			reg = <0 0x14400000 0 0x400>;
146a9b058ec780 Biju Das        2025-01-15  367  			clocks = <&cpg CPG_MOD 0x4d>, <&cpg CPG_MOD 0x4e>;
146a9b058ec780 Biju Das        2025-01-15  368  			clock-names = "pclk", "oscclk";
146a9b058ec780 Biju Das        2025-01-15  369  			resets = <&cpg 0x76>;
146a9b058ec780 Biju Das        2025-01-15  370  			power-domains = <&cpg>;
146a9b058ec780 Biju Das        2025-01-15  371  			status = "disabled";
146a9b058ec780 Biju Das        2025-01-15  372  		};
146a9b058ec780 Biju Das        2025-01-15  373  
146a9b058ec780 Biju Das        2025-01-15  374  		wdt2: watchdog@13000000 {
146a9b058ec780 Biju Das        2025-01-15  375  			compatible = "renesas,r9a09g047-wdt", "renesas,r9a09g057-wdt";
146a9b058ec780 Biju Das        2025-01-15  376  			reg = <0 0x13000000 0 0x400>;
146a9b058ec780 Biju Das        2025-01-15  377  			clocks = <&cpg CPG_MOD 0x4f>, <&cpg CPG_MOD 0x50>;
146a9b058ec780 Biju Das        2025-01-15  378  			clock-names = "pclk", "oscclk";
146a9b058ec780 Biju Das        2025-01-15  379  			resets = <&cpg 0x77>;
146a9b058ec780 Biju Das        2025-01-15  380  			power-domains = <&cpg>;
146a9b058ec780 Biju Das        2025-01-15  381  			status = "disabled";
146a9b058ec780 Biju Das        2025-01-15  382  		};
146a9b058ec780 Biju Das        2025-01-15  383  
146a9b058ec780 Biju Das        2025-01-15  384  		wdt3: watchdog@13000400 {
146a9b058ec780 Biju Das        2025-01-15  385  			compatible = "renesas,r9a09g047-wdt", "renesas,r9a09g057-wdt";
146a9b058ec780 Biju Das        2025-01-15  386  			reg = <0 0x13000400 0 0x400>;
146a9b058ec780 Biju Das        2025-01-15  387  			clocks = <&cpg CPG_MOD 0x51>, <&cpg CPG_MOD 0x52>;
146a9b058ec780 Biju Das        2025-01-15  388  			clock-names = "pclk", "oscclk";
146a9b058ec780 Biju Das        2025-01-15  389  			resets = <&cpg 0x78>;
146a9b058ec780 Biju Das        2025-01-15  390  			power-domains = <&cpg>;
146a9b058ec780 Biju Das        2025-01-15  391  			status = "disabled";
146a9b058ec780 Biju Das        2025-01-15  392  		};
146a9b058ec780 Biju Das        2025-01-15  393  
acb247afab5bc2 Biju Das        2024-12-16  394  		i2c0: i2c@14400400 {
acb247afab5bc2 Biju Das        2024-12-16  395  			compatible = "renesas,riic-r9a09g047", "renesas,riic-r9a09g057";
acb247afab5bc2 Biju Das        2024-12-16  396  			reg = <0 0x14400400 0 0x400>;
acb247afab5bc2 Biju Das        2024-12-16  397  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  398  				     <GIC_SPI 507 IRQ_TYPE_EDGE_RISING>,
acb247afab5bc2 Biju Das        2024-12-16  399  				     <GIC_SPI 506 IRQ_TYPE_EDGE_RISING>,
acb247afab5bc2 Biju Das        2024-12-16  400  				     <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  401  				     <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  402  				     <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  403  				     <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  404  				     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
acb247afab5bc2 Biju Das        2024-12-16  405  			interrupt-names = "tei", "ri", "ti", "spi", "sti",
acb247afab5bc2 Biju Das        2024-12-16  406  					  "naki", "ali", "tmoi";
acb247afab5bc2 Biju Das        2024-12-16  407  			clocks = <&cpg CPG_MOD 0x94>;
acb247afab5bc2 Biju Das        2024-12-16  408  			resets = <&cpg 0x98>;
acb247afab5bc2 Biju Das        2024-12-16  409  			power-domains = <&cpg>;
acb247afab5bc2 Biju Das        2024-12-16  410  			#address-cells = <1>;
acb247afab5bc2 Biju Das        2024-12-16  411  			#size-cells = <0>;
acb247afab5bc2 Biju Das        2024-12-16  412  			status = "disabled";
acb247afab5bc2 Biju Das        2024-12-16  413  		};
acb247afab5bc2 Biju Das        2024-12-16  414  
acb247afab5bc2 Biju Das        2024-12-16  415  		i2c1: i2c@14400800 {
acb247afab5bc2 Biju Das        2024-12-16  416  			compatible = "renesas,riic-r9a09g047", "renesas,riic-r9a09g057";
acb247afab5bc2 Biju Das        2024-12-16  417  			reg = <0 0x14400800 0 0x400>;
acb247afab5bc2 Biju Das        2024-12-16  418  			interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  419  				     <GIC_SPI 509 IRQ_TYPE_EDGE_RISING>,
acb247afab5bc2 Biju Das        2024-12-16  420  				     <GIC_SPI 508 IRQ_TYPE_EDGE_RISING>,
acb247afab5bc2 Biju Das        2024-12-16  421  				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  422  				     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  423  				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  424  				     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  425  				     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
acb247afab5bc2 Biju Das        2024-12-16  426  			interrupt-names = "tei", "ri", "ti", "spi", "sti",
acb247afab5bc2 Biju Das        2024-12-16  427  					  "naki", "ali", "tmoi";
acb247afab5bc2 Biju Das        2024-12-16  428  			clocks = <&cpg CPG_MOD 0x95>;
acb247afab5bc2 Biju Das        2024-12-16  429  			resets = <&cpg 0x99>;
acb247afab5bc2 Biju Das        2024-12-16  430  			power-domains = <&cpg>;
acb247afab5bc2 Biju Das        2024-12-16  431  			#address-cells = <1>;
acb247afab5bc2 Biju Das        2024-12-16  432  			#size-cells = <0>;
acb247afab5bc2 Biju Das        2024-12-16  433  			status = "disabled";
acb247afab5bc2 Biju Das        2024-12-16  434  		};
acb247afab5bc2 Biju Das        2024-12-16  435  
acb247afab5bc2 Biju Das        2024-12-16  436  		i2c2: i2c@14400c00 {
acb247afab5bc2 Biju Das        2024-12-16  437  			compatible = "renesas,riic-r9a09g047", "renesas,riic-r9a09g057";
acb247afab5bc2 Biju Das        2024-12-16  438  			reg = <0 0x14400c00 0 0x400>;
acb247afab5bc2 Biju Das        2024-12-16  439  			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  440  				     <GIC_SPI 511 IRQ_TYPE_EDGE_RISING>,
acb247afab5bc2 Biju Das        2024-12-16  441  				     <GIC_SPI 510 IRQ_TYPE_EDGE_RISING>,
acb247afab5bc2 Biju Das        2024-12-16  442  				     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  443  				     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  444  				     <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  445  				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  446  				     <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
acb247afab5bc2 Biju Das        2024-12-16  447  			interrupt-names = "tei", "ri", "ti", "spi", "sti",
acb247afab5bc2 Biju Das        2024-12-16  448  					  "naki", "ali", "tmoi";
acb247afab5bc2 Biju Das        2024-12-16  449  			clocks = <&cpg CPG_MOD 0x96>;
acb247afab5bc2 Biju Das        2024-12-16  450  			resets = <&cpg 0x9a>;
acb247afab5bc2 Biju Das        2024-12-16  451  			power-domains = <&cpg>;
acb247afab5bc2 Biju Das        2024-12-16  452  			#address-cells = <1>;
acb247afab5bc2 Biju Das        2024-12-16  453  			#size-cells = <0>;
acb247afab5bc2 Biju Das        2024-12-16  454  			status = "disabled";
acb247afab5bc2 Biju Das        2024-12-16  455  		};
acb247afab5bc2 Biju Das        2024-12-16  456  
acb247afab5bc2 Biju Das        2024-12-16  457  		i2c3: i2c@14401000 {
acb247afab5bc2 Biju Das        2024-12-16  458  			compatible = "renesas,riic-r9a09g047", "renesas,riic-r9a09g057";
acb247afab5bc2 Biju Das        2024-12-16  459  			reg = <0 0x14401000 0 0x400>;
acb247afab5bc2 Biju Das        2024-12-16  460  			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  461  				     <GIC_SPI 513 IRQ_TYPE_EDGE_RISING>,
acb247afab5bc2 Biju Das        2024-12-16  462  				     <GIC_SPI 512 IRQ_TYPE_EDGE_RISING>,
acb247afab5bc2 Biju Das        2024-12-16  463  				     <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  464  				     <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  465  				     <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  466  				     <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  467  				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
acb247afab5bc2 Biju Das        2024-12-16  468  			interrupt-names = "tei", "ri", "ti", "spi", "sti",
acb247afab5bc2 Biju Das        2024-12-16  469  					  "naki", "ali", "tmoi";
acb247afab5bc2 Biju Das        2024-12-16  470  			clocks = <&cpg CPG_MOD 0x97>;
acb247afab5bc2 Biju Das        2024-12-16  471  			resets = <&cpg 0x9b>;
acb247afab5bc2 Biju Das        2024-12-16  472  			power-domains = <&cpg>;
acb247afab5bc2 Biju Das        2024-12-16  473  			#address-cells = <1>;
acb247afab5bc2 Biju Das        2024-12-16  474  			#size-cells = <0>;
acb247afab5bc2 Biju Das        2024-12-16  475  			status = "disabled";
acb247afab5bc2 Biju Das        2024-12-16  476  		};
acb247afab5bc2 Biju Das        2024-12-16  477  
acb247afab5bc2 Biju Das        2024-12-16  478  		i2c4: i2c@14401400 {
acb247afab5bc2 Biju Das        2024-12-16  479  			compatible = "renesas,riic-r9a09g047", "renesas,riic-r9a09g057";
acb247afab5bc2 Biju Das        2024-12-16  480  			reg = <0 0x14401400 0 0x400>;
acb247afab5bc2 Biju Das        2024-12-16  481  			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  482  				     <GIC_SPI 515 IRQ_TYPE_EDGE_RISING>,
acb247afab5bc2 Biju Das        2024-12-16  483  				     <GIC_SPI 514 IRQ_TYPE_EDGE_RISING>,
acb247afab5bc2 Biju Das        2024-12-16  484  				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  485  				     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  486  				     <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  487  				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  488  				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
acb247afab5bc2 Biju Das        2024-12-16  489  			interrupt-names = "tei", "ri", "ti", "spi", "sti",
acb247afab5bc2 Biju Das        2024-12-16  490  					  "naki", "ali", "tmoi";
acb247afab5bc2 Biju Das        2024-12-16  491  			clocks = <&cpg CPG_MOD 0x98>;
acb247afab5bc2 Biju Das        2024-12-16  492  			resets = <&cpg 0x9c>;
acb247afab5bc2 Biju Das        2024-12-16  493  			power-domains = <&cpg>;
acb247afab5bc2 Biju Das        2024-12-16  494  			#address-cells = <1>;
acb247afab5bc2 Biju Das        2024-12-16  495  			#size-cells = <0>;
acb247afab5bc2 Biju Das        2024-12-16  496  			status = "disabled";
acb247afab5bc2 Biju Das        2024-12-16  497  		};
acb247afab5bc2 Biju Das        2024-12-16  498  
acb247afab5bc2 Biju Das        2024-12-16  499  		i2c5: i2c@14401800 {
acb247afab5bc2 Biju Das        2024-12-16  500  			compatible = "renesas,riic-r9a09g047", "renesas,riic-r9a09g057";
acb247afab5bc2 Biju Das        2024-12-16  501  			reg = <0 0x14401800 0 0x400>;
acb247afab5bc2 Biju Das        2024-12-16  502  			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  503  				     <GIC_SPI 517 IRQ_TYPE_EDGE_RISING>,
acb247afab5bc2 Biju Das        2024-12-16  504  				     <GIC_SPI 516 IRQ_TYPE_EDGE_RISING>,
acb247afab5bc2 Biju Das        2024-12-16  505  				     <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  506  				     <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  507  				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  508  				     <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  509  				     <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
acb247afab5bc2 Biju Das        2024-12-16  510  			interrupt-names = "tei", "ri", "ti", "spi", "sti",
acb247afab5bc2 Biju Das        2024-12-16  511  					  "naki", "ali", "tmoi";
acb247afab5bc2 Biju Das        2024-12-16  512  			clocks = <&cpg CPG_MOD 0x99>;
acb247afab5bc2 Biju Das        2024-12-16  513  			resets = <&cpg 0x9d>;
acb247afab5bc2 Biju Das        2024-12-16  514  			power-domains = <&cpg>;
acb247afab5bc2 Biju Das        2024-12-16  515  			#address-cells = <1>;
acb247afab5bc2 Biju Das        2024-12-16  516  			#size-cells = <0>;
acb247afab5bc2 Biju Das        2024-12-16  517  			status = "disabled";
acb247afab5bc2 Biju Das        2024-12-16  518  		};
acb247afab5bc2 Biju Das        2024-12-16  519  
acb247afab5bc2 Biju Das        2024-12-16  520  		i2c6: i2c@14401c00 {
acb247afab5bc2 Biju Das        2024-12-16  521  			compatible = "renesas,riic-r9a09g047", "renesas,riic-r9a09g057";
acb247afab5bc2 Biju Das        2024-12-16  522  			reg = <0 0x14401c00 0 0x400>;
acb247afab5bc2 Biju Das        2024-12-16  523  			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  524  				     <GIC_SPI 519 IRQ_TYPE_EDGE_RISING>,
acb247afab5bc2 Biju Das        2024-12-16  525  				     <GIC_SPI 518 IRQ_TYPE_EDGE_RISING>,
acb247afab5bc2 Biju Das        2024-12-16  526  				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  527  				     <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  528  				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  529  				     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  530  				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
acb247afab5bc2 Biju Das        2024-12-16  531  			interrupt-names = "tei", "ri", "ti", "spi", "sti",
acb247afab5bc2 Biju Das        2024-12-16  532  					  "naki", "ali", "tmoi";
acb247afab5bc2 Biju Das        2024-12-16  533  			clocks = <&cpg CPG_MOD 0x9a>;
acb247afab5bc2 Biju Das        2024-12-16  534  			resets = <&cpg 0x9e>;
acb247afab5bc2 Biju Das        2024-12-16  535  			power-domains = <&cpg>;
acb247afab5bc2 Biju Das        2024-12-16  536  			#address-cells = <1>;
acb247afab5bc2 Biju Das        2024-12-16  537  			#size-cells = <0>;
acb247afab5bc2 Biju Das        2024-12-16  538  			status = "disabled";
acb247afab5bc2 Biju Das        2024-12-16  539  		};
acb247afab5bc2 Biju Das        2024-12-16  540  
acb247afab5bc2 Biju Das        2024-12-16  541  		i2c7: i2c@14402000 {
acb247afab5bc2 Biju Das        2024-12-16  542  			compatible = "renesas,riic-r9a09g047", "renesas,riic-r9a09g057";
acb247afab5bc2 Biju Das        2024-12-16  543  			reg = <0 0x14402000 0 0x400>;
acb247afab5bc2 Biju Das        2024-12-16  544  			interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  545  				     <GIC_SPI 521 IRQ_TYPE_EDGE_RISING>,
acb247afab5bc2 Biju Das        2024-12-16  546  				     <GIC_SPI 520 IRQ_TYPE_EDGE_RISING>,
acb247afab5bc2 Biju Das        2024-12-16  547  				     <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  548  				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  549  				     <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  550  				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  551  				     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
acb247afab5bc2 Biju Das        2024-12-16  552  			interrupt-names = "tei", "ri", "ti", "spi", "sti",
acb247afab5bc2 Biju Das        2024-12-16  553  					  "naki", "ali", "tmoi";
acb247afab5bc2 Biju Das        2024-12-16  554  			clocks = <&cpg CPG_MOD 0x9b>;
acb247afab5bc2 Biju Das        2024-12-16  555  			resets = <&cpg 0x9f>;
acb247afab5bc2 Biju Das        2024-12-16  556  			power-domains = <&cpg>;
acb247afab5bc2 Biju Das        2024-12-16  557  			#address-cells = <1>;
acb247afab5bc2 Biju Das        2024-12-16  558  			#size-cells = <0>;
acb247afab5bc2 Biju Das        2024-12-16  559  			status = "disabled";
acb247afab5bc2 Biju Das        2024-12-16  560  		};
acb247afab5bc2 Biju Das        2024-12-16  561  
acb247afab5bc2 Biju Das        2024-12-16  562  		i2c8: i2c@11c01000 {
acb247afab5bc2 Biju Das        2024-12-16  563  			compatible = "renesas,riic-r9a09g047", "renesas,riic-r9a09g057";
acb247afab5bc2 Biju Das        2024-12-16  564  			reg = <0 0x11c01000 0 0x400>;
acb247afab5bc2 Biju Das        2024-12-16  565  			interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  566  				     <GIC_SPI 523 IRQ_TYPE_EDGE_RISING>,
acb247afab5bc2 Biju Das        2024-12-16  567  				     <GIC_SPI 522 IRQ_TYPE_EDGE_RISING>,
acb247afab5bc2 Biju Das        2024-12-16  568  				     <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  569  				     <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  570  				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  571  				     <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>,
acb247afab5bc2 Biju Das        2024-12-16  572  				     <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
acb247afab5bc2 Biju Das        2024-12-16  573  			interrupt-names = "tei", "ri", "ti", "spi", "sti",
acb247afab5bc2 Biju Das        2024-12-16  574  					  "naki", "ali", "tmoi";
acb247afab5bc2 Biju Das        2024-12-16  575  			clocks = <&cpg CPG_MOD 0x93>;
acb247afab5bc2 Biju Das        2024-12-16  576  			resets = <&cpg 0xa0>;
acb247afab5bc2 Biju Das        2024-12-16  577  			power-domains = <&cpg>;
acb247afab5bc2 Biju Das        2024-12-16  578  			#address-cells = <1>;
acb247afab5bc2 Biju Das        2024-12-16  579  			#size-cells = <0>;
acb247afab5bc2 Biju Das        2024-12-16  580  			status = "disabled";
acb247afab5bc2 Biju Das        2024-12-16  581  		};
acb247afab5bc2 Biju Das        2024-12-16  582  
af06adb5106ad1 Tommaso Merciai 2025-04-02  583  		gpu: gpu@14850000 {
af06adb5106ad1 Tommaso Merciai 2025-04-02  584  			compatible = "renesas,r9a09g047-mali",
af06adb5106ad1 Tommaso Merciai 2025-04-02  585  				     "arm,mali-bifrost";
af06adb5106ad1 Tommaso Merciai 2025-04-02  586  			reg = <0x0 0x14850000 0x0 0x10000>;
af06adb5106ad1 Tommaso Merciai 2025-04-02  587  			interrupts = <GIC_SPI 884 IRQ_TYPE_LEVEL_HIGH>,
af06adb5106ad1 Tommaso Merciai 2025-04-02  588  				     <GIC_SPI 885 IRQ_TYPE_LEVEL_HIGH>,
af06adb5106ad1 Tommaso Merciai 2025-04-02  589  				     <GIC_SPI 883 IRQ_TYPE_LEVEL_HIGH>,
af06adb5106ad1 Tommaso Merciai 2025-04-02  590  				     <GIC_SPI 886 IRQ_TYPE_LEVEL_HIGH>;
af06adb5106ad1 Tommaso Merciai 2025-04-02  591  			interrupt-names = "job", "mmu", "gpu", "event";
af06adb5106ad1 Tommaso Merciai 2025-04-02  592  			clocks = <&cpg CPG_MOD 0xf0>,
af06adb5106ad1 Tommaso Merciai 2025-04-02  593  				 <&cpg CPG_MOD 0xf1>,
af06adb5106ad1 Tommaso Merciai 2025-04-02  594  				 <&cpg CPG_MOD 0xf2>;
af06adb5106ad1 Tommaso Merciai 2025-04-02  595  			clock-names = "gpu", "bus", "bus_ace";
af06adb5106ad1 Tommaso Merciai 2025-04-02  596  			power-domains = <&cpg>;
af06adb5106ad1 Tommaso Merciai 2025-04-02  597  			resets = <&cpg 0xdd>, <&cpg 0xde>, <&cpg 0xdf>;
af06adb5106ad1 Tommaso Merciai 2025-04-02  598  			reset-names = "rst", "axi_rst", "ace_rst";
af06adb5106ad1 Tommaso Merciai 2025-04-02  599  			operating-points-v2 = <&gpu_opp_table>;
af06adb5106ad1 Tommaso Merciai 2025-04-02  600  			status = "disabled";
af06adb5106ad1 Tommaso Merciai 2025-04-02  601  		};
af06adb5106ad1 Tommaso Merciai 2025-04-02  602  
9977754eeebed7 Biju Das        2024-12-03  603  		gic: interrupt-controller@14900000 {
9977754eeebed7 Biju Das        2024-12-03  604  			compatible = "arm,gic-v3";
9977754eeebed7 Biju Das        2024-12-03  605  			reg = <0x0 0x14900000 0 0x20000>,
9977754eeebed7 Biju Das        2024-12-03  606  			      <0x0 0x14940000 0 0x80000>;
9977754eeebed7 Biju Das        2024-12-03  607  			#interrupt-cells = <3>;
9977754eeebed7 Biju Das        2024-12-03  608  			#address-cells = <0>;
9977754eeebed7 Biju Das        2024-12-03  609  			interrupt-controller;
9977754eeebed7 Biju Das        2024-12-03  610  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
9977754eeebed7 Biju Das        2024-12-03  611  		};
c4e4e22870acae Biju Das        2025-02-06  612  
c4e4e22870acae Biju Das        2025-02-06  613  		sdhi0: mmc@15c00000  {
c4e4e22870acae Biju Das        2025-02-06  614  			compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
c4e4e22870acae Biju Das        2025-02-06  615  			reg = <0x0 0x15c00000 0 0x10000>;
c4e4e22870acae Biju Das        2025-02-06  616  			interrupts = <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
c4e4e22870acae Biju Das        2025-02-06  617  				     <GIC_SPI 736 IRQ_TYPE_LEVEL_HIGH>;
c4e4e22870acae Biju Das        2025-02-06  618  			clocks = <&cpg CPG_MOD 0xa3>, <&cpg CPG_MOD 0xa5>,
c4e4e22870acae Biju Das        2025-02-06  619  				 <&cpg CPG_MOD 0xa4>, <&cpg CPG_MOD 0xa6>;
c4e4e22870acae Biju Das        2025-02-06  620  			clock-names = "core", "clkh", "cd", "aclk";
c4e4e22870acae Biju Das        2025-02-06  621  			resets = <&cpg 0xa7>;
c4e4e22870acae Biju Das        2025-02-06  622  			power-domains = <&cpg>;
c4e4e22870acae Biju Das        2025-02-06  623  			status = "disabled";
c4e4e22870acae Biju Das        2025-02-06  624  
c4e4e22870acae Biju Das        2025-02-06  625  			sdhi0_vqmmc: vqmmc-regulator {
c4e4e22870acae Biju Das        2025-02-06  626  				regulator-name = "SDHI0-VQMMC";
c4e4e22870acae Biju Das        2025-02-06  627  				regulator-min-microvolt = <1800000>;
c4e4e22870acae Biju Das        2025-02-06  628  				regulator-max-microvolt = <3300000>;
c4e4e22870acae Biju Das        2025-02-06  629  				status = "disabled";
c4e4e22870acae Biju Das        2025-02-06  630  			};
c4e4e22870acae Biju Das        2025-02-06  631  		};
c4e4e22870acae Biju Das        2025-02-06  632  
c4e4e22870acae Biju Das        2025-02-06  633  		sdhi1: mmc@15c10000 {
c4e4e22870acae Biju Das        2025-02-06  634  			compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
c4e4e22870acae Biju Das        2025-02-06  635  			reg = <0x0 0x15c10000 0 0x10000>;
c4e4e22870acae Biju Das        2025-02-06  636  			interrupts = <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
c4e4e22870acae Biju Das        2025-02-06  637  				     <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
c4e4e22870acae Biju Das        2025-02-06  638  			clocks = <&cpg CPG_MOD 0xa7>, <&cpg CPG_MOD 0xa9>,
c4e4e22870acae Biju Das        2025-02-06  639  				 <&cpg CPG_MOD 0xa8>, <&cpg CPG_MOD 0xaa>;
c4e4e22870acae Biju Das        2025-02-06  640  			clock-names = "core", "clkh", "cd", "aclk";
c4e4e22870acae Biju Das        2025-02-06  641  			resets = <&cpg 0xa8>;
c4e4e22870acae Biju Das        2025-02-06  642  			power-domains = <&cpg>;
c4e4e22870acae Biju Das        2025-02-06  643  			status = "disabled";
c4e4e22870acae Biju Das        2025-02-06  644  
c4e4e22870acae Biju Das        2025-02-06  645  			sdhi1_vqmmc: vqmmc-regulator {
c4e4e22870acae Biju Das        2025-02-06  646  				regulator-name = "SDHI1-VQMMC";
c4e4e22870acae Biju Das        2025-02-06  647  				regulator-min-microvolt = <1800000>;
c4e4e22870acae Biju Das        2025-02-06  648  				regulator-max-microvolt = <3300000>;
c4e4e22870acae Biju Das        2025-02-06  649  				status = "disabled";
c4e4e22870acae Biju Das        2025-02-06  650  			};
c4e4e22870acae Biju Das        2025-02-06  651  		};
c4e4e22870acae Biju Das        2025-02-06  652  
c4e4e22870acae Biju Das        2025-02-06  653  		sdhi2: mmc@15c20000 {
c4e4e22870acae Biju Das        2025-02-06  654  			compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
c4e4e22870acae Biju Das        2025-02-06  655  			reg = <0x0 0x15c20000 0 0x10000>;
c4e4e22870acae Biju Das        2025-02-06  656  			interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>,
c4e4e22870acae Biju Das        2025-02-06  657  				     <GIC_SPI 740 IRQ_TYPE_LEVEL_HIGH>;
c4e4e22870acae Biju Das        2025-02-06  658  			clocks = <&cpg CPG_MOD 0xab>, <&cpg CPG_MOD 0xad>,
c4e4e22870acae Biju Das        2025-02-06  659  				 <&cpg CPG_MOD 0xac>, <&cpg CPG_MOD 0xae>;
c4e4e22870acae Biju Das        2025-02-06  660  			clock-names = "core", "clkh", "cd", "aclk";
c4e4e22870acae Biju Das        2025-02-06  661  			resets = <&cpg 0xa9>;
c4e4e22870acae Biju Das        2025-02-06  662  			power-domains = <&cpg>;
c4e4e22870acae Biju Das        2025-02-06  663  			status = "disabled";
c4e4e22870acae Biju Das        2025-02-06  664  
c4e4e22870acae Biju Das        2025-02-06  665  			sdhi2_vqmmc: vqmmc-regulator {
c4e4e22870acae Biju Das        2025-02-06  666  				regulator-name = "SDHI2-VQMMC";
c4e4e22870acae Biju Das        2025-02-06  667  				regulator-min-microvolt = <1800000>;
c4e4e22870acae Biju Das        2025-02-06  668  				regulator-max-microvolt = <3300000>;
c4e4e22870acae Biju Das        2025-02-06  669  				status = "disabled";
c4e4e22870acae Biju Das        2025-02-06  670  			};
c4e4e22870acae Biju Das        2025-02-06  671  		};
1d292f6a74f288 Tommaso Merciai 2025-05-14  672  
1d292f6a74f288 Tommaso Merciai 2025-05-14  673  		cru: video@16000000 {
1d292f6a74f288 Tommaso Merciai 2025-05-14  674  			compatible = "renesas,r9a09g047-cru";
1d292f6a74f288 Tommaso Merciai 2025-05-14  675  			reg = <0 0x16000000 0 0x400>;
1d292f6a74f288 Tommaso Merciai 2025-05-14  676  			clocks = <&cpg CPG_MOD 0xd3>,
1d292f6a74f288 Tommaso Merciai 2025-05-14  677  				 <&cpg CPG_MOD 0xd4>,
1d292f6a74f288 Tommaso Merciai 2025-05-14  678  				 <&cpg CPG_MOD 0xd2>;
1d292f6a74f288 Tommaso Merciai 2025-05-14  679  			clock-names = "video", "apb", "axi";
1d292f6a74f288 Tommaso Merciai 2025-05-14  680  			interrupts = <GIC_SPI 838 IRQ_TYPE_LEVEL_HIGH>,
1d292f6a74f288 Tommaso Merciai 2025-05-14  681  				     <GIC_SPI 839 IRQ_TYPE_LEVEL_HIGH>,
1d292f6a74f288 Tommaso Merciai 2025-05-14  682  				     <GIC_SPI 840 IRQ_TYPE_EDGE_RISING>,
1d292f6a74f288 Tommaso Merciai 2025-05-14  683  				     <GIC_SPI 841 IRQ_TYPE_EDGE_RISING>,
1d292f6a74f288 Tommaso Merciai 2025-05-14  684  				     <GIC_SPI 842 IRQ_TYPE_LEVEL_HIGH>;
1d292f6a74f288 Tommaso Merciai 2025-05-14  685  			interrupt-names = "image_conv", "axi_mst_err",
1d292f6a74f288 Tommaso Merciai 2025-05-14  686  					  "vd_addr_wend", "sd_addr_wend",
1d292f6a74f288 Tommaso Merciai 2025-05-14  687  					  "vsd_addr_wend";
1d292f6a74f288 Tommaso Merciai 2025-05-14  688  			resets = <&cpg 0xc5>, <&cpg 0xc6>;
1d292f6a74f288 Tommaso Merciai 2025-05-14  689  			reset-names = "presetn", "aresetn";
1d292f6a74f288 Tommaso Merciai 2025-05-14  690  			power-domains = <&cpg>;
1d292f6a74f288 Tommaso Merciai 2025-05-14  691  			status = "disabled";
1d292f6a74f288 Tommaso Merciai 2025-05-14  692  
1d292f6a74f288 Tommaso Merciai 2025-05-14  693  			ports {
1d292f6a74f288 Tommaso Merciai 2025-05-14  694  				#address-cells = <1>;
1d292f6a74f288 Tommaso Merciai 2025-05-14  695  				#size-cells = <0>;
1d292f6a74f288 Tommaso Merciai 2025-05-14  696  
1d292f6a74f288 Tommaso Merciai 2025-05-14 @697  				port@1 {
1d292f6a74f288 Tommaso Merciai 2025-05-14  698  					#address-cells = <1>;
1d292f6a74f288 Tommaso Merciai 2025-05-14  699  					#size-cells = <0>;
1d292f6a74f288 Tommaso Merciai 2025-05-14  700  
1d292f6a74f288 Tommaso Merciai 2025-05-14  701  					reg = <1>;
1d292f6a74f288 Tommaso Merciai 2025-05-14  702  					crucsi2: endpoint@0 {
1d292f6a74f288 Tommaso Merciai 2025-05-14  703  						reg = <0>;
1d292f6a74f288 Tommaso Merciai 2025-05-14  704  						remote-endpoint = <&csi2cru>;
1d292f6a74f288 Tommaso Merciai 2025-05-14  705  					};
1d292f6a74f288 Tommaso Merciai 2025-05-14  706  				};
1d292f6a74f288 Tommaso Merciai 2025-05-14  707  			};
1d292f6a74f288 Tommaso Merciai 2025-05-14  708  		};
1d292f6a74f288 Tommaso Merciai 2025-05-14  709  
1d292f6a74f288 Tommaso Merciai 2025-05-14  710  		csi2: csi2@16000400 {
1d292f6a74f288 Tommaso Merciai 2025-05-14  711  			compatible = "renesas,r9a09g047-csi2", "renesas,r9a09g057-csi2";
1d292f6a74f288 Tommaso Merciai 2025-05-14  712  			reg = <0 0x16000400 0 0xc00>;
1d292f6a74f288 Tommaso Merciai 2025-05-14  713  			interrupts = <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH>;
1d292f6a74f288 Tommaso Merciai 2025-05-14  714  			clocks = <&cpg CPG_MOD 0xd3>, <&cpg CPG_MOD 0xd4>;
1d292f6a74f288 Tommaso Merciai 2025-05-14  715  			clock-names = "video", "apb";
1d292f6a74f288 Tommaso Merciai 2025-05-14  716  			resets = <&cpg 0xc5>, <&cpg 0xc7>;
1d292f6a74f288 Tommaso Merciai 2025-05-14  717  			reset-names = "presetn", "cmn-rstb";
1d292f6a74f288 Tommaso Merciai 2025-05-14  718  			power-domains = <&cpg>;
1d292f6a74f288 Tommaso Merciai 2025-05-14  719  			status = "disabled";
1d292f6a74f288 Tommaso Merciai 2025-05-14  720  
1d292f6a74f288 Tommaso Merciai 2025-05-14  721  			ports {
1d292f6a74f288 Tommaso Merciai 2025-05-14  722  				#address-cells = <1>;
1d292f6a74f288 Tommaso Merciai 2025-05-14  723  				#size-cells = <0>;
1d292f6a74f288 Tommaso Merciai 2025-05-14  724  
1d292f6a74f288 Tommaso Merciai 2025-05-14  725  				port@0 {
1d292f6a74f288 Tommaso Merciai 2025-05-14  726  					reg = <0>;
1d292f6a74f288 Tommaso Merciai 2025-05-14  727  				};
1d292f6a74f288 Tommaso Merciai 2025-05-14  728  
1d292f6a74f288 Tommaso Merciai 2025-05-14 @729  				port@1 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
