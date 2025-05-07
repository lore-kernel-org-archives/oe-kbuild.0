Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD21189B8C
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 11:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746617092; cv=none; b=Gp+mLSKGiXTs1OHVHF74J+K7KB10gLpafHsHhGBl0QI5lXI9zF+IW7bO/WITDEv9bkKcFCJSIUWBz5fzQl7GaYWPTnsCvVUXwtYvG9zgWEzpCRQ1o1nILfFCv42KAErJC/EjubjYXFz2HsQYnVaa2MyOTGCK8bSWnpImqHxxVbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746617092; c=relaxed/simple;
	bh=S5qKG6lHe7n0BcqvTWc6SPPxuXzzbw8xbRy+r3pqEbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jIKvB+ktrraRqwq5KFn6640bG/NNKw/j+g+dRpA6b0xPXacnsvbjuHKDJOQ9fhy5kHT0o0E61XZFzZS3r9mGnwB0aoMU5uC0f28ta3aJQOR83nNpMVBUMGLtyNVgWbss64SgXtitOC6OQwvLK93s/o2UfrUJcbPgwQmN+RRtwLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+PLvuKj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+PLvuKj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746617086; x=1778153086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S5qKG6lHe7n0BcqvTWc6SPPxuXzzbw8xbRy+r3pqEbQ=;
  b=i+PLvuKjDU1EdUHevZMrsnD2yqeYTzNwvks0VtQtQr0lsDTUwoT3Jl55
   fAWBTfi8Np1PxcqjtYPO66d8ehsKOYJkpBrVdFXNIXh8idO7A46ezhmWm
   QoXS0KjrzcogGUogkO3MPOuGKTx9U21jv4sAvDjc+iTTbCwknt9GzYMDs
   ucsCdGyivd0Z6iBq+/RLXVv0zDOxpNnDuSmn+LFwOv2ijmybn8ZtmQyeF
   aMVJLMQvZH3mUmUAhTD22x5wyX1WFlKOYwLQx77jm02rCCrpJf2ctQRmU
   P6h1vfdttFZju/EzADu8mIcWSGpatwYyFWbhW8tFwm7mOU65kezLohUf6
   A==;
X-CSE-ConnectionGUID: TipqRoxMRU2+nAaw/YyHhA==
X-CSE-MsgGUID: urtNaVJxTRqzk6LFfKaP+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48241794"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48241794"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 04:24:45 -0700
X-CSE-ConnectionGUID: cue2OnfKQCKBt9kAT04eoA==
X-CSE-MsgGUID: Nr4DXpTpSM2azpvdooKCJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="166861130"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 May 2025 04:24:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCctF-0007fV-0R;
	Wed, 07 May 2025 11:24:41 +0000
Date: Wed, 7 May 2025 19:24:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: ti: k3-j721e-common-proc-board-infotainment:
 Fix nodes for dtbs warnings
Message-ID: <202505071954.8kSf7Q0K-lkp@intel.com>
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
In-Reply-To: <20250424080328.57671-1-j-choudhary@ti.com>
References: <20250424080328.57671-1-j-choudhary@ti.com>
TO: Jayesh Choudhary <j-choudhary@ti.com>
TO: nm@ti.com
TO: vigneshr@ti.com
TO: u-kumar1@ti.com
TO: devarsht@ti.com
TO: linux-kernel@vger.kernel.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: kristo@kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: j-choudhary@ti.com

Hi Jayesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.15-rc5]
[cannot apply to next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jayesh-Choudhary/arm64-dts-ti-k3-j721e-common-proc-board-infotainment-Fix-nodes-for-dtbs-warnings/20250424-160758
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250424080328.57671-1-j-choudhary%40ti.com
patch subject: [PATCH] arm64: dts: ti: k3-j721e-common-proc-board-infotainment: Fix nodes for dtbs warnings
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: arm64-randconfig-003-20250426 (https://download.01.org/0day-ci/archive/20250507/202505071954.8kSf7Q0K-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071954.8kSf7Q0K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505071954.8kSf7Q0K-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:1913.20-1914.5: Warning (graph_child_address): /bus@100000/dss@4a00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +1913 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi

5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03    26  
2d87061e70dea4 Nishanth Menon         2019-05-22    27  &cbass_main {
2d87061e70dea4 Nishanth Menon         2019-05-22    28  	msmc_ram: sram@70000000 {
2d87061e70dea4 Nishanth Menon         2019-05-22    29  		compatible = "mmio-sram";
2d87061e70dea4 Nishanth Menon         2019-05-22    30  		reg = <0x0 0x70000000 0x0 0x800000>;
2d87061e70dea4 Nishanth Menon         2019-05-22    31  		#address-cells = <1>;
2d87061e70dea4 Nishanth Menon         2019-05-22    32  		#size-cells = <1>;
2d87061e70dea4 Nishanth Menon         2019-05-22    33  		ranges = <0x0 0x0 0x70000000 0x800000>;
2d87061e70dea4 Nishanth Menon         2019-05-22    34  
2d87061e70dea4 Nishanth Menon         2019-05-22    35  		atf-sram@0 {
2d87061e70dea4 Nishanth Menon         2019-05-22    36  			reg = <0x0 0x20000>;
2d87061e70dea4 Nishanth Menon         2019-05-22    37  		};
2d87061e70dea4 Nishanth Menon         2019-05-22    38  	};
2d87061e70dea4 Nishanth Menon         2019-05-22    39  
b766e3b0d5f698 Kishon Vijay Abraham I 2020-06-29    40  	scm_conf: scm-conf@100000 {
b766e3b0d5f698 Kishon Vijay Abraham I 2020-06-29    41  		compatible = "ti,j721e-system-controller", "syscon", "simple-mfd";
b766e3b0d5f698 Kishon Vijay Abraham I 2020-06-29    42  		reg = <0 0x00100000 0 0x1c000>; /* excludes pinctrl region */
b766e3b0d5f698 Kishon Vijay Abraham I 2020-06-29    43  		#address-cells = <1>;
b766e3b0d5f698 Kishon Vijay Abraham I 2020-06-29    44  		#size-cells = <1>;
b766e3b0d5f698 Kishon Vijay Abraham I 2020-06-29    45  		ranges = <0x0 0x0 0x00100000 0x1c000>;
b766e3b0d5f698 Kishon Vijay Abraham I 2020-06-29    46  
3f92a5be6084b7 Kishon Vijay Abraham I 2021-11-26    47  		serdes_ln_ctrl: mux-controller@4080 {
4cd6d56c3c81e3 Andrew Davis           2024-01-24    48  			compatible = "reg-mux";
4cd6d56c3c81e3 Andrew Davis           2024-01-24    49  			reg = <0x4080 0x50>;
b766e3b0d5f698 Kishon Vijay Abraham I 2020-06-29    50  			#mux-control-cells = <1>;
4cd6d56c3c81e3 Andrew Davis           2024-01-24    51  			mux-reg-masks = <0x0 0x3>, <0x4 0x3>, /* SERDES0 lane0/1 select */
4cd6d56c3c81e3 Andrew Davis           2024-01-24    52  					<0x10 0x3>, <0x14 0x3>, /* SERDES1 lane0/1 select */
4cd6d56c3c81e3 Andrew Davis           2024-01-24    53  					<0x20 0x3>, <0x24 0x3>, /* SERDES2 lane0/1 select */
4cd6d56c3c81e3 Andrew Davis           2024-01-24    54  					<0x30 0x3>, <0x34 0x3>, /* SERDES3 lane0/1 select */
4cd6d56c3c81e3 Andrew Davis           2024-01-24    55  					<0x40 0x3>, <0x44 0x3>, /* SERDES4 lane0/1 select */
4cd6d56c3c81e3 Andrew Davis           2024-01-24    56  					<0x48 0x3>, <0x4c 0x3>; /* SERDES4 lane2/3 select */
c65176fd49f45b Roger Quadros          2020-09-18    57  			idle-states = <J721E_SERDES0_LANE0_PCIE0_LANE0>, <J721E_SERDES0_LANE1_PCIE0_LANE1>,
c65176fd49f45b Roger Quadros          2020-09-18    58  				      <J721E_SERDES1_LANE0_PCIE1_LANE0>, <J721E_SERDES1_LANE1_PCIE1_LANE1>,
c65176fd49f45b Roger Quadros          2020-09-18    59  				      <J721E_SERDES2_LANE0_PCIE2_LANE0>, <J721E_SERDES2_LANE1_PCIE2_LANE1>,
c65176fd49f45b Roger Quadros          2020-09-18    60  				      <MUX_IDLE_AS_IS>, <J721E_SERDES3_LANE1_USB3_0>,
c65176fd49f45b Roger Quadros          2020-09-18    61  				      <J721E_SERDES4_LANE0_EDP_LANE0>, <J721E_SERDES4_LANE1_EDP_LANE1>,
c65176fd49f45b Roger Quadros          2020-09-18    62  				      <J721E_SERDES4_LANE2_EDP_LANE2>, <J721E_SERDES4_LANE3_EDP_LANE3>;
b766e3b0d5f698 Kishon Vijay Abraham I 2020-06-29    63  		};
4716053a0a7bed Roger Quadros          2020-06-29    64  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15    65  		cpsw0_phy_gmii_sel: phy@4044 {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15    66  			compatible = "ti,j721e-cpsw9g-phy-gmii-sel";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15    67  			ti,qsgmii-main-ports = <2>, <2>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15    68  			reg = <0x4044 0x20>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15    69  			#phy-cells = <1>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15    70  		};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15    71  
4716053a0a7bed Roger Quadros          2020-06-29    72  		usb_serdes_mux: mux-controller@4000 {
62b19a64e121e9 Andrew Davis           2024-01-24    73  			compatible = "reg-mux";
62b19a64e121e9 Andrew Davis           2024-01-24    74  			reg = <0x4000 0x20>;
4716053a0a7bed Roger Quadros          2020-06-29    75  			#mux-control-cells = <1>;
62b19a64e121e9 Andrew Davis           2024-01-24    76  			mux-reg-masks = <0x0 0x8000000>, /* USB0 to SERDES0/3 mux */
62b19a64e121e9 Andrew Davis           2024-01-24    77  					<0x10 0x8000000>; /* USB1 to SERDES1/2 mux */
4716053a0a7bed Roger Quadros          2020-06-29    78  		};
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    79  
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    80  		ehrpwm_tbclk: clock-controller@4140 {
2a7cc7bedb58d4 Nishanth Menon         2023-07-13    81  			compatible = "ti,am654-ehrpwm-tbclk";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    82  			reg = <0x4140 0x18>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    83  			#clock-cells = <1>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    84  		};
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    85  	};
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    86  
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    87  	main_ehrpwm0: pwm@3000000 {
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    88  		compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    89  		#pwm-cells = <3>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    90  		reg = <0x00 0x3000000 0x00 0x100>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    91  		power-domains = <&k3_pds 83 TI_SCI_PD_EXCLUSIVE>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    92  		clocks = <&ehrpwm_tbclk 0>, <&k3_clks 83 0>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    93  		clock-names = "tbclk", "fck";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    94  		status = "disabled";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    95  	};
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    96  
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    97  	main_ehrpwm1: pwm@3010000 {
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    98  		compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    99  		#pwm-cells = <3>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   100  		reg = <0x00 0x3010000 0x00 0x100>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   101  		power-domains = <&k3_pds 84 TI_SCI_PD_EXCLUSIVE>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   102  		clocks = <&ehrpwm_tbclk 1>, <&k3_clks 84 0>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   103  		clock-names = "tbclk", "fck";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   104  		status = "disabled";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   105  	};
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   106  
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   107  	main_ehrpwm2: pwm@3020000 {
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   108  		compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   109  		#pwm-cells = <3>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   110  		reg = <0x00 0x3020000 0x00 0x100>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   111  		power-domains = <&k3_pds 85 TI_SCI_PD_EXCLUSIVE>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   112  		clocks = <&ehrpwm_tbclk 2>, <&k3_clks 85 0>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   113  		clock-names = "tbclk", "fck";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   114  		status = "disabled";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   115  	};
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   116  
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   117  	main_ehrpwm3: pwm@3030000 {
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   118  		compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   119  		#pwm-cells = <3>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   120  		reg = <0x00 0x3030000 0x00 0x100>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   121  		power-domains = <&k3_pds 86 TI_SCI_PD_EXCLUSIVE>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   122  		clocks = <&ehrpwm_tbclk 3>, <&k3_clks 86 0>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   123  		clock-names = "tbclk", "fck";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   124  		status = "disabled";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   125  	};
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   126  
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   127  	main_ehrpwm4: pwm@3040000 {
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   128  		compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   129  		#pwm-cells = <3>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   130  		reg = <0x00 0x3040000 0x00 0x100>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   131  		power-domains = <&k3_pds 87 TI_SCI_PD_EXCLUSIVE>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   132  		clocks = <&ehrpwm_tbclk 4>, <&k3_clks 87 0>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   133  		clock-names = "tbclk", "fck";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   134  		status = "disabled";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   135  	};
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   136  
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   137  	main_ehrpwm5: pwm@3050000 {
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   138  		compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   139  		#pwm-cells = <3>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   140  		reg = <0x00 0x3050000 0x00 0x100>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   141  		power-domains = <&k3_pds 88 TI_SCI_PD_EXCLUSIVE>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   142  		clocks = <&ehrpwm_tbclk 5>, <&k3_clks 88 0>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   143  		clock-names = "tbclk", "fck";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   144  		status = "disabled";
b766e3b0d5f698 Kishon Vijay Abraham I 2020-06-29   145  	};
b766e3b0d5f698 Kishon Vijay Abraham I 2020-06-29   146  
2d87061e70dea4 Nishanth Menon         2019-05-22   147  	gic500: interrupt-controller@1800000 {
2d87061e70dea4 Nishanth Menon         2019-05-22   148  		compatible = "arm,gic-v3";
2d87061e70dea4 Nishanth Menon         2019-05-22   149  		#address-cells = <2>;
2d87061e70dea4 Nishanth Menon         2019-05-22   150  		#size-cells = <2>;
2d87061e70dea4 Nishanth Menon         2019-05-22   151  		ranges;
2d87061e70dea4 Nishanth Menon         2019-05-22   152  		#interrupt-cells = <3>;
2d87061e70dea4 Nishanth Menon         2019-05-22   153  		interrupt-controller;
2d87061e70dea4 Nishanth Menon         2019-05-22   154  		reg = <0x00 0x01800000 0x00 0x10000>,	/* GICD */
a06ed27f3bc63a Nishanth Menon         2022-02-15   155  		      <0x00 0x01900000 0x00 0x100000>,	/* GICR */
a06ed27f3bc63a Nishanth Menon         2022-02-15   156  		      <0x00 0x6f000000 0x00 0x2000>,	/* GICC */
a06ed27f3bc63a Nishanth Menon         2022-02-15   157  		      <0x00 0x6f010000 0x00 0x1000>,	/* GICH */
a06ed27f3bc63a Nishanth Menon         2022-02-15   158  		      <0x00 0x6f020000 0x00 0x2000>;	/* GICV */
2d87061e70dea4 Nishanth Menon         2019-05-22   159  
2d87061e70dea4 Nishanth Menon         2019-05-22   160  		/* vcpumntirq: virtual CPU interface maintenance interrupt */
2d87061e70dea4 Nishanth Menon         2019-05-22   161  		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
2d87061e70dea4 Nishanth Menon         2019-05-22   162  
6e6972f9b2e25c Grygorii Strashko      2020-06-26   163  		gic_its: msi-controller@1820000 {
2d87061e70dea4 Nishanth Menon         2019-05-22   164  			compatible = "arm,gic-v3-its";
2d87061e70dea4 Nishanth Menon         2019-05-22   165  			reg = <0x00 0x01820000 0x00 0x10000>;
2d87061e70dea4 Nishanth Menon         2019-05-22   166  			socionext,synquacer-pre-its = <0x1000000 0x400000>;
2d87061e70dea4 Nishanth Menon         2019-05-22   167  			msi-controller;
2d87061e70dea4 Nishanth Menon         2019-05-22   168  			#msi-cells = <1>;
2d87061e70dea4 Nishanth Menon         2019-05-22   169  		};
2d87061e70dea4 Nishanth Menon         2019-05-22   170  	};
2d87061e70dea4 Nishanth Menon         2019-05-22   171  
cab12badfc99f9 Nishanth Menon         2021-05-11   172  	main_gpio_intr: interrupt-controller@a00000 {
073086fc68d7f6 Lokesh Vutla           2019-06-14   173  		compatible = "ti,sci-intr";
cab12badfc99f9 Nishanth Menon         2021-05-11   174  		reg = <0x00 0x00a00000 0x00 0x800>;
073086fc68d7f6 Lokesh Vutla           2019-06-14   175  		ti,intr-trigger-type = <1>;
073086fc68d7f6 Lokesh Vutla           2019-06-14   176  		interrupt-controller;
073086fc68d7f6 Lokesh Vutla           2019-06-14   177  		interrupt-parent = <&gic500>;
8d523f096da535 Lokesh Vutla           2020-08-06   178  		#interrupt-cells = <1>;
073086fc68d7f6 Lokesh Vutla           2019-06-14   179  		ti,sci = <&dmsc>;
8d523f096da535 Lokesh Vutla           2020-08-06   180  		ti,sci-dev-id = <131>;
8d523f096da535 Lokesh Vutla           2020-08-06   181  		ti,interrupt-ranges = <8 392 56>;
073086fc68d7f6 Lokesh Vutla           2019-06-14   182  	};
073086fc68d7f6 Lokesh Vutla           2019-06-14   183  
9ecdb6d6b11434 Nishanth Menon         2021-05-10   184  	main_navss: bus@30000000 {
6507bfa7e0cde0 Vignesh Raghavendra    2023-10-05   185  		compatible = "simple-bus";
1463a70dfc871a Suman Anna             2019-05-30   186  		#address-cells = <2>;
1463a70dfc871a Suman Anna             2019-05-30   187  		#size-cells = <2>;
9ecdb6d6b11434 Nishanth Menon         2021-05-10   188  		ranges = <0x00 0x30000000 0x00 0x30000000 0x00 0x0c400000>;
6f73c1e599c422 Peter Ujfalusi         2020-01-23   189  		dma-coherent;
6f73c1e599c422 Peter Ujfalusi         2020-01-23   190  		dma-ranges;
6f73c1e599c422 Peter Ujfalusi         2020-01-23   191  
6f73c1e599c422 Peter Ujfalusi         2020-01-23   192  		ti,sci-dev-id = <199>;
1463a70dfc871a Suman Anna             2019-05-30   193  
cab12badfc99f9 Nishanth Menon         2021-05-11   194  		main_navss_intr: interrupt-controller@310e0000 {
1463a70dfc871a Suman Anna             2019-05-30   195  			compatible = "ti,sci-intr";
cab12badfc99f9 Nishanth Menon         2021-05-11   196  			reg = <0x0 0x310e0000 0x0 0x4000>;
1463a70dfc871a Suman Anna             2019-05-30   197  			ti,intr-trigger-type = <4>;
1463a70dfc871a Suman Anna             2019-05-30   198  			interrupt-controller;
1463a70dfc871a Suman Anna             2019-05-30   199  			interrupt-parent = <&gic500>;
8d523f096da535 Lokesh Vutla           2020-08-06   200  			#interrupt-cells = <1>;
1463a70dfc871a Suman Anna             2019-05-30   201  			ti,sci = <&dmsc>;
8d523f096da535 Lokesh Vutla           2020-08-06   202  			ti,sci-dev-id = <213>;
8d523f096da535 Lokesh Vutla           2020-08-06   203  			ti,interrupt-ranges = <0 64 64>,
8d523f096da535 Lokesh Vutla           2020-08-06   204  					      <64 448 64>,
8d523f096da535 Lokesh Vutla           2020-08-06   205  					      <128 672 64>;
1463a70dfc871a Suman Anna             2019-05-30   206  		};
073086fc68d7f6 Lokesh Vutla           2019-06-14   207  
073086fc68d7f6 Lokesh Vutla           2019-06-14   208  		main_udmass_inta: interrupt-controller@33d00000 {
073086fc68d7f6 Lokesh Vutla           2019-06-14   209  			compatible = "ti,sci-inta";
073086fc68d7f6 Lokesh Vutla           2019-06-14   210  			reg = <0x0 0x33d00000 0x0 0x100000>;
073086fc68d7f6 Lokesh Vutla           2019-06-14   211  			interrupt-controller;
073086fc68d7f6 Lokesh Vutla           2019-06-14   212  			interrupt-parent = <&main_navss_intr>;
073086fc68d7f6 Lokesh Vutla           2019-06-14   213  			msi-controller;
15ffd94a904baf Sekhar Nori            2020-11-28   214  			#interrupt-cells = <0>;
073086fc68d7f6 Lokesh Vutla           2019-06-14   215  			ti,sci = <&dmsc>;
073086fc68d7f6 Lokesh Vutla           2019-06-14   216  			ti,sci-dev-id = <209>;
8d523f096da535 Lokesh Vutla           2020-08-06   217  			ti,interrupt-ranges = <0 0 256>;
073086fc68d7f6 Lokesh Vutla           2019-06-14   218  		};
7b472ced17b05e Suman Anna             2019-07-22   219  
515c034013542b Peter Ujfalusi         2020-01-23   220  		secure_proxy_main: mailbox@32c00000 {
515c034013542b Peter Ujfalusi         2020-01-23   221  			compatible = "ti,am654-secure-proxy";
515c034013542b Peter Ujfalusi         2020-01-23   222  			#mbox-cells = <1>;
515c034013542b Peter Ujfalusi         2020-01-23   223  			reg-names = "target_data", "rt", "scfg";
515c034013542b Peter Ujfalusi         2020-01-23   224  			reg = <0x00 0x32c00000 0x00 0x100000>,
515c034013542b Peter Ujfalusi         2020-01-23   225  			      <0x00 0x32400000 0x00 0x100000>,
515c034013542b Peter Ujfalusi         2020-01-23   226  			      <0x00 0x32800000 0x00 0x100000>;
515c034013542b Peter Ujfalusi         2020-01-23   227  			interrupt-names = "rx_011";
515c034013542b Peter Ujfalusi         2020-01-23   228  			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
dd2c7aeca3ece4 Manorit Chawdhry       2024-10-24   229  			bootph-all;
515c034013542b Peter Ujfalusi         2020-01-23   230  		};
515c034013542b Peter Ujfalusi         2020-01-23   231  
d0c72c7759d463 Grygorii Strashko      2020-06-26   232  		smmu0: iommu@36600000 {
515c034013542b Peter Ujfalusi         2020-01-23   233  			compatible = "arm,smmu-v3";
515c034013542b Peter Ujfalusi         2020-01-23   234  			reg = <0x0 0x36600000 0x0 0x100000>;
515c034013542b Peter Ujfalusi         2020-01-23   235  			interrupt-parent = <&gic500>;
515c034013542b Peter Ujfalusi         2020-01-23   236  			interrupts = <GIC_SPI 772 IRQ_TYPE_EDGE_RISING>,
515c034013542b Peter Ujfalusi         2020-01-23   237  				     <GIC_SPI 768 IRQ_TYPE_EDGE_RISING>;
515c034013542b Peter Ujfalusi         2020-01-23   238  			interrupt-names = "eventq", "gerror";
515c034013542b Peter Ujfalusi         2020-01-23   239  			#iommu-cells = <1>;
515c034013542b Peter Ujfalusi         2020-01-23   240  		};
515c034013542b Peter Ujfalusi         2020-01-23   241  
7b472ced17b05e Suman Anna             2019-07-22   242  		hwspinlock: spinlock@30e00000 {
7b472ced17b05e Suman Anna             2019-07-22   243  			compatible = "ti,am654-hwspinlock";
7b472ced17b05e Suman Anna             2019-07-22   244  			reg = <0x00 0x30e00000 0x00 0x1000>;
7b472ced17b05e Suman Anna             2019-07-22   245  			#hwlock-cells = <1>;
7b472ced17b05e Suman Anna             2019-07-22   246  		};
56f185826db242 Suman Anna             2019-07-24   247  
56f185826db242 Suman Anna             2019-07-24   248  		mailbox0_cluster0: mailbox@31f80000 {
56f185826db242 Suman Anna             2019-07-24   249  			compatible = "ti,am654-mailbox";
56f185826db242 Suman Anna             2019-07-24   250  			reg = <0x00 0x31f80000 0x00 0x200>;
56f185826db242 Suman Anna             2019-07-24   251  			#mbox-cells = <1>;
56f185826db242 Suman Anna             2019-07-24   252  			ti,mbox-num-users = <4>;
56f185826db242 Suman Anna             2019-07-24   253  			ti,mbox-num-fifos = <16>;
56f185826db242 Suman Anna             2019-07-24   254  			interrupt-parent = <&main_navss_intr>;
7e48b665100ee8 Andrew Davis           2022-10-20   255  			status = "disabled";
56f185826db242 Suman Anna             2019-07-24   256  		};
56f185826db242 Suman Anna             2019-07-24   257  
56f185826db242 Suman Anna             2019-07-24   258  		mailbox0_cluster1: mailbox@31f81000 {
56f185826db242 Suman Anna             2019-07-24   259  			compatible = "ti,am654-mailbox";
56f185826db242 Suman Anna             2019-07-24   260  			reg = <0x00 0x31f81000 0x00 0x200>;
56f185826db242 Suman Anna             2019-07-24   261  			#mbox-cells = <1>;
56f185826db242 Suman Anna             2019-07-24   262  			ti,mbox-num-users = <4>;
56f185826db242 Suman Anna             2019-07-24   263  			ti,mbox-num-fifos = <16>;
56f185826db242 Suman Anna             2019-07-24   264  			interrupt-parent = <&main_navss_intr>;
7e48b665100ee8 Andrew Davis           2022-10-20   265  			status = "disabled";
56f185826db242 Suman Anna             2019-07-24   266  		};
56f185826db242 Suman Anna             2019-07-24   267  
56f185826db242 Suman Anna             2019-07-24   268  		mailbox0_cluster2: mailbox@31f82000 {
56f185826db242 Suman Anna             2019-07-24   269  			compatible = "ti,am654-mailbox";
56f185826db242 Suman Anna             2019-07-24   270  			reg = <0x00 0x31f82000 0x00 0x200>;
56f185826db242 Suman Anna             2019-07-24   271  			#mbox-cells = <1>;
56f185826db242 Suman Anna             2019-07-24   272  			ti,mbox-num-users = <4>;
56f185826db242 Suman Anna             2019-07-24   273  			ti,mbox-num-fifos = <16>;
56f185826db242 Suman Anna             2019-07-24   274  			interrupt-parent = <&main_navss_intr>;
7e48b665100ee8 Andrew Davis           2022-10-20   275  			status = "disabled";
56f185826db242 Suman Anna             2019-07-24   276  		};
56f185826db242 Suman Anna             2019-07-24   277  
56f185826db242 Suman Anna             2019-07-24   278  		mailbox0_cluster3: mailbox@31f83000 {
56f185826db242 Suman Anna             2019-07-24   279  			compatible = "ti,am654-mailbox";
56f185826db242 Suman Anna             2019-07-24   280  			reg = <0x00 0x31f83000 0x00 0x200>;
56f185826db242 Suman Anna             2019-07-24   281  			#mbox-cells = <1>;
56f185826db242 Suman Anna             2019-07-24   282  			ti,mbox-num-users = <4>;
56f185826db242 Suman Anna             2019-07-24   283  			ti,mbox-num-fifos = <16>;
56f185826db242 Suman Anna             2019-07-24   284  			interrupt-parent = <&main_navss_intr>;
7e48b665100ee8 Andrew Davis           2022-10-20   285  			status = "disabled";
56f185826db242 Suman Anna             2019-07-24   286  		};
56f185826db242 Suman Anna             2019-07-24   287  
56f185826db242 Suman Anna             2019-07-24   288  		mailbox0_cluster4: mailbox@31f84000 {
56f185826db242 Suman Anna             2019-07-24   289  			compatible = "ti,am654-mailbox";
56f185826db242 Suman Anna             2019-07-24   290  			reg = <0x00 0x31f84000 0x00 0x200>;
56f185826db242 Suman Anna             2019-07-24   291  			#mbox-cells = <1>;
56f185826db242 Suman Anna             2019-07-24   292  			ti,mbox-num-users = <4>;
56f185826db242 Suman Anna             2019-07-24   293  			ti,mbox-num-fifos = <16>;
56f185826db242 Suman Anna             2019-07-24   294  			interrupt-parent = <&main_navss_intr>;
7e48b665100ee8 Andrew Davis           2022-10-20   295  			status = "disabled";
56f185826db242 Suman Anna             2019-07-24   296  		};
56f185826db242 Suman Anna             2019-07-24   297  
56f185826db242 Suman Anna             2019-07-24   298  		mailbox0_cluster5: mailbox@31f85000 {
56f185826db242 Suman Anna             2019-07-24   299  			compatible = "ti,am654-mailbox";
56f185826db242 Suman Anna             2019-07-24   300  			reg = <0x00 0x31f85000 0x00 0x200>;
56f185826db242 Suman Anna             2019-07-24   301  			#mbox-cells = <1>;
56f185826db242 Suman Anna             2019-07-24   302  			ti,mbox-num-users = <4>;
56f185826db242 Suman Anna             2019-07-24   303  			ti,mbox-num-fifos = <16>;
56f185826db242 Suman Anna             2019-07-24   304  			interrupt-parent = <&main_navss_intr>;
7e48b665100ee8 Andrew Davis           2022-10-20   305  			status = "disabled";
56f185826db242 Suman Anna             2019-07-24   306  		};
56f185826db242 Suman Anna             2019-07-24   307  
56f185826db242 Suman Anna             2019-07-24   308  		mailbox0_cluster6: mailbox@31f86000 {
56f185826db242 Suman Anna             2019-07-24   309  			compatible = "ti,am654-mailbox";
56f185826db242 Suman Anna             2019-07-24   310  			reg = <0x00 0x31f86000 0x00 0x200>;
56f185826db242 Suman Anna             2019-07-24   311  			#mbox-cells = <1>;
56f185826db242 Suman Anna             2019-07-24   312  			ti,mbox-num-users = <4>;
56f185826db242 Suman Anna             2019-07-24   313  			ti,mbox-num-fifos = <16>;
56f185826db242 Suman Anna             2019-07-24   314  			interrupt-parent = <&main_navss_intr>;
7e48b665100ee8 Andrew Davis           2022-10-20   315  			status = "disabled";
56f185826db242 Suman Anna             2019-07-24   316  		};
56f185826db242 Suman Anna             2019-07-24   317  
56f185826db242 Suman Anna             2019-07-24   318  		mailbox0_cluster7: mailbox@31f87000 {
56f185826db242 Suman Anna             2019-07-24   319  			compatible = "ti,am654-mailbox";
56f185826db242 Suman Anna             2019-07-24   320  			reg = <0x00 0x31f87000 0x00 0x200>;
56f185826db242 Suman Anna             2019-07-24   321  			#mbox-cells = <1>;
56f185826db242 Suman Anna             2019-07-24   322  			ti,mbox-num-users = <4>;
56f185826db242 Suman Anna             2019-07-24   323  			ti,mbox-num-fifos = <16>;
56f185826db242 Suman Anna             2019-07-24   324  			interrupt-parent = <&main_navss_intr>;
7e48b665100ee8 Andrew Davis           2022-10-20   325  			status = "disabled";
56f185826db242 Suman Anna             2019-07-24   326  		};
56f185826db242 Suman Anna             2019-07-24   327  
56f185826db242 Suman Anna             2019-07-24   328  		mailbox0_cluster8: mailbox@31f88000 {
56f185826db242 Suman Anna             2019-07-24   329  			compatible = "ti,am654-mailbox";
56f185826db242 Suman Anna             2019-07-24   330  			reg = <0x00 0x31f88000 0x00 0x200>;
56f185826db242 Suman Anna             2019-07-24   331  			#mbox-cells = <1>;
56f185826db242 Suman Anna             2019-07-24   332  			ti,mbox-num-users = <4>;
56f185826db242 Suman Anna             2019-07-24   333  			ti,mbox-num-fifos = <16>;
56f185826db242 Suman Anna             2019-07-24   334  			interrupt-parent = <&main_navss_intr>;
7e48b665100ee8 Andrew Davis           2022-10-20   335  			status = "disabled";
56f185826db242 Suman Anna             2019-07-24   336  		};
56f185826db242 Suman Anna             2019-07-24   337  
56f185826db242 Suman Anna             2019-07-24   338  		mailbox0_cluster9: mailbox@31f89000 {
56f185826db242 Suman Anna             2019-07-24   339  			compatible = "ti,am654-mailbox";
56f185826db242 Suman Anna             2019-07-24   340  			reg = <0x00 0x31f89000 0x00 0x200>;
56f185826db242 Suman Anna             2019-07-24   341  			#mbox-cells = <1>;
56f185826db242 Suman Anna             2019-07-24   342  			ti,mbox-num-users = <4>;
56f185826db242 Suman Anna             2019-07-24   343  			ti,mbox-num-fifos = <16>;
56f185826db242 Suman Anna             2019-07-24   344  			interrupt-parent = <&main_navss_intr>;
7e48b665100ee8 Andrew Davis           2022-10-20   345  			status = "disabled";
56f185826db242 Suman Anna             2019-07-24   346  		};
56f185826db242 Suman Anna             2019-07-24   347  
56f185826db242 Suman Anna             2019-07-24   348  		mailbox0_cluster10: mailbox@31f8a000 {
56f185826db242 Suman Anna             2019-07-24   349  			compatible = "ti,am654-mailbox";
56f185826db242 Suman Anna             2019-07-24   350  			reg = <0x00 0x31f8a000 0x00 0x200>;
56f185826db242 Suman Anna             2019-07-24   351  			#mbox-cells = <1>;
56f185826db242 Suman Anna             2019-07-24   352  			ti,mbox-num-users = <4>;
56f185826db242 Suman Anna             2019-07-24   353  			ti,mbox-num-fifos = <16>;
56f185826db242 Suman Anna             2019-07-24   354  			interrupt-parent = <&main_navss_intr>;
7e48b665100ee8 Andrew Davis           2022-10-20   355  			status = "disabled";
56f185826db242 Suman Anna             2019-07-24   356  		};
56f185826db242 Suman Anna             2019-07-24   357  
56f185826db242 Suman Anna             2019-07-24   358  		mailbox0_cluster11: mailbox@31f8b000 {
56f185826db242 Suman Anna             2019-07-24   359  			compatible = "ti,am654-mailbox";
56f185826db242 Suman Anna             2019-07-24   360  			reg = <0x00 0x31f8b000 0x00 0x200>;
56f185826db242 Suman Anna             2019-07-24   361  			#mbox-cells = <1>;
56f185826db242 Suman Anna             2019-07-24   362  			ti,mbox-num-users = <4>;
56f185826db242 Suman Anna             2019-07-24   363  			ti,mbox-num-fifos = <16>;
56f185826db242 Suman Anna             2019-07-24   364  			interrupt-parent = <&main_navss_intr>;
7e48b665100ee8 Andrew Davis           2022-10-20   365  			status = "disabled";
56f185826db242 Suman Anna             2019-07-24   366  		};
6f73c1e599c422 Peter Ujfalusi         2020-01-23   367  
6f73c1e599c422 Peter Ujfalusi         2020-01-23   368  		main_ringacc: ringacc@3c000000 {
6f73c1e599c422 Peter Ujfalusi         2020-01-23   369  			compatible = "ti,am654-navss-ringacc";
6f73c1e599c422 Peter Ujfalusi         2020-01-23   370  			reg = <0x0 0x3c000000 0x0 0x400000>,
6f73c1e599c422 Peter Ujfalusi         2020-01-23   371  			      <0x0 0x38000000 0x0 0x400000>,
6f73c1e599c422 Peter Ujfalusi         2020-01-23   372  			      <0x0 0x31120000 0x0 0x100>,
702110c2be999c Vignesh Raghavendra    2023-08-09   373  			      <0x0 0x33000000 0x0 0x40000>,
702110c2be999c Vignesh Raghavendra    2023-08-09   374  			      <0x0 0x31080000 0x0 0x40000>;
702110c2be999c Vignesh Raghavendra    2023-08-09   375  			reg-names = "rt", "fifos", "proxy_gcfg", "proxy_target", "cfg";
6f73c1e599c422 Peter Ujfalusi         2020-01-23   376  			ti,num-rings = <1024>;
6f73c1e599c422 Peter Ujfalusi         2020-01-23   377  			ti,sci-rm-range-gp-rings = <0x1>; /* GP ring range */
6f73c1e599c422 Peter Ujfalusi         2020-01-23   378  			ti,sci = <&dmsc>;
6f73c1e599c422 Peter Ujfalusi         2020-01-23   379  			ti,sci-dev-id = <211>;
6f73c1e599c422 Peter Ujfalusi         2020-01-23   380  			msi-parent = <&main_udmass_inta>;
6f73c1e599c422 Peter Ujfalusi         2020-01-23   381  		};
6f73c1e599c422 Peter Ujfalusi         2020-01-23   382  
6f73c1e599c422 Peter Ujfalusi         2020-01-23   383  		main_udmap: dma-controller@31150000 {
6f73c1e599c422 Peter Ujfalusi         2020-01-23   384  			compatible = "ti,j721e-navss-main-udmap";
6f73c1e599c422 Peter Ujfalusi         2020-01-23   385  			reg = <0x0 0x31150000 0x0 0x100>,
6f73c1e599c422 Peter Ujfalusi         2020-01-23   386  			      <0x0 0x34000000 0x0 0x100000>,
1b62a3cfddbb56 Manorit Chawdhry       2023-12-13   387  			      <0x0 0x35000000 0x0 0x100000>,
1b62a3cfddbb56 Manorit Chawdhry       2023-12-13   388  			      <0x0 0x30b00000 0x0 0x20000>,
1b62a3cfddbb56 Manorit Chawdhry       2023-12-13   389  			      <0x0 0x30c00000 0x0 0x10000>,
1b62a3cfddbb56 Manorit Chawdhry       2023-12-13   390  			      <0x0 0x30d00000 0x0 0x8000>;
1b62a3cfddbb56 Manorit Chawdhry       2023-12-13   391  			reg-names = "gcfg", "rchanrt", "tchanrt",
1b62a3cfddbb56 Manorit Chawdhry       2023-12-13   392  				    "tchan", "rchan", "rflow";
6f73c1e599c422 Peter Ujfalusi         2020-01-23   393  			msi-parent = <&main_udmass_inta>;
6f73c1e599c422 Peter Ujfalusi         2020-01-23   394  			#dma-cells = <1>;
6f73c1e599c422 Peter Ujfalusi         2020-01-23   395  
6f73c1e599c422 Peter Ujfalusi         2020-01-23   396  			ti,sci = <&dmsc>;
6f73c1e599c422 Peter Ujfalusi         2020-01-23   397  			ti,sci-dev-id = <212>;
6f73c1e599c422 Peter Ujfalusi         2020-01-23   398  			ti,ringacc = <&main_ringacc>;
6f73c1e599c422 Peter Ujfalusi         2020-01-23   399  
6f73c1e599c422 Peter Ujfalusi         2020-01-23   400  			ti,sci-rm-range-tchan = <0x0d>, /* TX_CHAN */
6f73c1e599c422 Peter Ujfalusi         2020-01-23   401  						<0x0f>, /* TX_HCHAN */
6f73c1e599c422 Peter Ujfalusi         2020-01-23   402  						<0x10>; /* TX_UHCHAN */
6f73c1e599c422 Peter Ujfalusi         2020-01-23   403  			ti,sci-rm-range-rchan = <0x0a>, /* RX_CHAN */
6f73c1e599c422 Peter Ujfalusi         2020-01-23   404  						<0x0b>, /* RX_HCHAN */
6f73c1e599c422 Peter Ujfalusi         2020-01-23   405  						<0x0c>; /* RX_UHCHAN */
6f73c1e599c422 Peter Ujfalusi         2020-01-23   406  			ti,sci-rm-range-rflow = <0x00>; /* GP RFLOW */
6f73c1e599c422 Peter Ujfalusi         2020-01-23   407  		};
461d6d058cff60 Grygorii Strashko      2020-05-01   408  
461d6d058cff60 Grygorii Strashko      2020-05-01   409  		cpts@310d0000 {
461d6d058cff60 Grygorii Strashko      2020-05-01   410  			compatible = "ti,j721e-cpts";
461d6d058cff60 Grygorii Strashko      2020-05-01   411  			reg = <0x0 0x310d0000 0x0 0x400>;
461d6d058cff60 Grygorii Strashko      2020-05-01   412  			reg-names = "cpts";
461d6d058cff60 Grygorii Strashko      2020-05-01   413  			clocks = <&k3_clks 201 1>;
461d6d058cff60 Grygorii Strashko      2020-05-01   414  			clock-names = "cpts";
8d523f096da535 Lokesh Vutla           2020-08-06   415  			interrupts-extended = <&main_navss_intr 391>;
461d6d058cff60 Grygorii Strashko      2020-05-01   416  			interrupt-names = "cpts";
461d6d058cff60 Grygorii Strashko      2020-05-01   417  			ti,cpts-periodic-outputs = <6>;
461d6d058cff60 Grygorii Strashko      2020-05-01   418  			ti,cpts-ext-ts-inputs = <8>;
461d6d058cff60 Grygorii Strashko      2020-05-01   419  		};
1463a70dfc871a Suman Anna             2019-05-30   420  	};
1463a70dfc871a Suman Anna             2019-05-30   421  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   422  	cpsw0: ethernet@c000000 {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   423  		compatible = "ti,j721e-cpswxg-nuss";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   424  		#address-cells = <2>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   425  		#size-cells = <2>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   426  		reg = <0x0 0xc000000 0x0 0x200000>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   427  		reg-names = "cpsw_nuss";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   428  		ranges = <0x0 0x0 0x0 0x0c000000 0x0 0x200000>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   429  		clocks = <&k3_clks 19 89>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   430  		clock-names = "fck";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   431  		power-domains = <&k3_pds 19 TI_SCI_PD_EXCLUSIVE>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   432  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   433  		dmas = <&main_udmap 0xca00>,
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   434  		       <&main_udmap 0xca01>,
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   435  		       <&main_udmap 0xca02>,
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   436  		       <&main_udmap 0xca03>,
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   437  		       <&main_udmap 0xca04>,
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   438  		       <&main_udmap 0xca05>,
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   439  		       <&main_udmap 0xca06>,
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   440  		       <&main_udmap 0xca07>,
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   441  		       <&main_udmap 0x4a00>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   442  		dma-names = "tx0", "tx1", "tx2", "tx3",
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   443  			    "tx4", "tx5", "tx6", "tx7",
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   444  			    "rx";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   445  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   446  		status = "disabled";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   447  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   448  		ethernet-ports {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   449  			#address-cells = <1>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   450  			#size-cells = <0>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   451  			cpsw0_port1: port@1 {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   452  				reg = <1>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   453  				ti,mac-only;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   454  				label = "port1";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   455  				status = "disabled";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   456  			};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   457  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   458  			cpsw0_port2: port@2 {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   459  				reg = <2>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   460  				ti,mac-only;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   461  				label = "port2";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   462  				status = "disabled";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   463  			};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   464  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   465  			cpsw0_port3: port@3 {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   466  				reg = <3>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   467  				ti,mac-only;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   468  				label = "port3";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   469  				status = "disabled";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   470  			};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   471  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   472  			cpsw0_port4: port@4 {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   473  				reg = <4>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   474  				ti,mac-only;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   475  				label = "port4";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   476  				status = "disabled";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   477  			};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   478  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   479  			cpsw0_port5: port@5 {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   480  				reg = <5>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   481  				ti,mac-only;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   482  				label = "port5";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   483  				status = "disabled";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   484  			};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   485  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   486  			cpsw0_port6: port@6 {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   487  				reg = <6>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   488  				ti,mac-only;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   489  				label = "port6";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   490  				status = "disabled";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   491  			};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   492  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   493  			cpsw0_port7: port@7 {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   494  				reg = <7>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   495  				ti,mac-only;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   496  				label = "port7";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   497  				status = "disabled";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   498  			};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   499  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   500  			cpsw0_port8: port@8 {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   501  				reg = <8>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   502  				ti,mac-only;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   503  				label = "port8";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   504  				status = "disabled";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   505  			};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   506  		};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   507  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   508  		cpsw9g_mdio: mdio@f00 {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   509  			compatible = "ti,cpsw-mdio","ti,davinci_mdio";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   510  			reg = <0x0 0xf00 0x0 0x100>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   511  			#address-cells = <1>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   512  			#size-cells = <0>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   513  			clocks = <&k3_clks 19 89>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   514  			clock-names = "fck";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   515  			bus_freq = <1000000>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   516  			status = "disabled";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   517  		};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   518  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   519  		cpts@3d000 {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   520  			compatible = "ti,j721e-cpts";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   521  			reg = <0x0 0x3d000 0x0 0x400>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   522  			clocks = <&k3_clks 19 16>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   523  			clock-names = "cpts";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   524  			interrupts-extended = <&gic500 GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   525  			interrupt-names = "cpts";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   526  			ti,cpts-ext-ts-inputs = <4>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   527  			ti,cpts-periodic-outputs = <2>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   528  		};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   529  	};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   530  
8ebcaaae801746 Keerthy                2020-08-26   531  	main_crypto: crypto@4e00000 {
8ebcaaae801746 Keerthy                2020-08-26   532  		compatible = "ti,j721e-sa2ul";
8ebcaaae801746 Keerthy                2020-08-26   533  		reg = <0x0 0x4e00000 0x0 0x1200>;
8ebcaaae801746 Keerthy                2020-08-26   534  		power-domains = <&k3_pds 264 TI_SCI_PD_EXCLUSIVE>;
8ebcaaae801746 Keerthy                2020-08-26   535  		#address-cells = <2>;
8ebcaaae801746 Keerthy                2020-08-26   536  		#size-cells = <2>;
8ebcaaae801746 Keerthy                2020-08-26   537  		ranges = <0x0 0x04e00000 0x00 0x04e00000 0x0 0x30000>;
8ebcaaae801746 Keerthy                2020-08-26   538  
8ebcaaae801746 Keerthy                2020-08-26   539  		dmas = <&main_udmap 0xc000>, <&main_udmap 0x4000>,
8ebcaaae801746 Keerthy                2020-08-26   540  				<&main_udmap 0x4001>;
8ebcaaae801746 Keerthy                2020-08-26   541  		dma-names = "tx", "rx1", "rx2";
8ebcaaae801746 Keerthy                2020-08-26   542  
8ebcaaae801746 Keerthy                2020-08-26   543  		rng: rng@4e10000 {
8ebcaaae801746 Keerthy                2020-08-26   544  			compatible = "inside-secure,safexcel-eip76";
8ebcaaae801746 Keerthy                2020-08-26   545  			reg = <0x0 0x4e10000 0x0 0x7d>;
8ebcaaae801746 Keerthy                2020-08-26   546  			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
8ebcaaae801746 Keerthy                2020-08-26   547  		};
8ebcaaae801746 Keerthy                2020-08-26   548  	};
8ebcaaae801746 Keerthy                2020-08-26   549  
dcccf77067e427 Nishanth Menon         2020-09-03   550  	main_pmx0: pinctrl@11c000 {
2d87061e70dea4 Nishanth Menon         2019-05-22   551  		compatible = "pinctrl-single";
2d87061e70dea4 Nishanth Menon         2019-05-22   552  		/* Proxy 0 addressing */
2d87061e70dea4 Nishanth Menon         2019-05-22   553  		reg = <0x0 0x11c000 0x0 0x2b4>;
2d87061e70dea4 Nishanth Menon         2019-05-22   554  		#pinctrl-cells = <1>;
2d87061e70dea4 Nishanth Menon         2019-05-22   555  		pinctrl-single,register-width = <32>;
2d87061e70dea4 Nishanth Menon         2019-05-22   556  		pinctrl-single,function-mask = <0xffffffff>;
2d87061e70dea4 Nishanth Menon         2019-05-22   557  	};
2d87061e70dea4 Nishanth Menon         2019-05-22   558  
72a44d1c473486 Nishanth Menon         2023-05-31   559  	/* TIMERIO pad input CTRLMMR_TIMER*_CTRL registers */
72a44d1c473486 Nishanth Menon         2023-05-31   560  	main_timerio_input: pinctrl@104200 {
72a44d1c473486 Nishanth Menon         2023-05-31   561  		compatible = "pinctrl-single";
72a44d1c473486 Nishanth Menon         2023-05-31   562  		reg = <0x00 0x104200 0x00 0x50>;
72a44d1c473486 Nishanth Menon         2023-05-31   563  		#pinctrl-cells = <1>;
72a44d1c473486 Nishanth Menon         2023-05-31   564  		pinctrl-single,register-width = <32>;
72a44d1c473486 Nishanth Menon         2023-05-31   565  		pinctrl-single,function-mask = <0x00000007>;
72a44d1c473486 Nishanth Menon         2023-05-31   566  	};
72a44d1c473486 Nishanth Menon         2023-05-31   567  
72a44d1c473486 Nishanth Menon         2023-05-31   568  	/* TIMERIO pad output CTCTRLMMR_TIMERIO*_CTRL registers */
72a44d1c473486 Nishanth Menon         2023-05-31   569  	main_timerio_output: pinctrl@104280 {
72a44d1c473486 Nishanth Menon         2023-05-31   570  		compatible = "pinctrl-single";
72a44d1c473486 Nishanth Menon         2023-05-31   571  		reg = <0x00 0x104280 0x00 0x20>;
72a44d1c473486 Nishanth Menon         2023-05-31   572  		#pinctrl-cells = <1>;
72a44d1c473486 Nishanth Menon         2023-05-31   573  		pinctrl-single,register-width = <32>;
72a44d1c473486 Nishanth Menon         2023-05-31   574  		pinctrl-single,function-mask = <0x0000001f>;
72a44d1c473486 Nishanth Menon         2023-05-31   575  	};
72a44d1c473486 Nishanth Menon         2023-05-31   576  
491821cebcf5cf Vaishnav Achath        2024-02-15   577  	ti_csi2rx0: ticsi2rx@4500000 {
491821cebcf5cf Vaishnav Achath        2024-02-15   578  		compatible = "ti,j721e-csi2rx-shim";
491821cebcf5cf Vaishnav Achath        2024-02-15   579  		reg = <0x0 0x4500000 0x0 0x1000>;
491821cebcf5cf Vaishnav Achath        2024-02-15   580  		ranges;
491821cebcf5cf Vaishnav Achath        2024-02-15   581  		#address-cells = <2>;
491821cebcf5cf Vaishnav Achath        2024-02-15   582  		#size-cells = <2>;
491821cebcf5cf Vaishnav Achath        2024-02-15   583  		dmas = <&main_udmap 0x4940>;
491821cebcf5cf Vaishnav Achath        2024-02-15   584  		dma-names = "rx0";
491821cebcf5cf Vaishnav Achath        2024-02-15   585  		power-domains = <&k3_pds 26 TI_SCI_PD_EXCLUSIVE>;
491821cebcf5cf Vaishnav Achath        2024-02-15   586  		status = "disabled";
491821cebcf5cf Vaishnav Achath        2024-02-15   587  
491821cebcf5cf Vaishnav Achath        2024-02-15   588  		cdns_csi2rx0: csi-bridge@4504000 {
491821cebcf5cf Vaishnav Achath        2024-02-15   589  			compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
491821cebcf5cf Vaishnav Achath        2024-02-15   590  			reg = <0x0 0x4504000 0x0 0x1000>;
491821cebcf5cf Vaishnav Achath        2024-02-15   591  			clocks = <&k3_clks 26 2>, <&k3_clks 26 0>, <&k3_clks 26 2>,
491821cebcf5cf Vaishnav Achath        2024-02-15   592  				<&k3_clks 26 2>, <&k3_clks 26 3>, <&k3_clks 26 3>;
491821cebcf5cf Vaishnav Achath        2024-02-15   593  			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
491821cebcf5cf Vaishnav Achath        2024-02-15   594  				"pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
491821cebcf5cf Vaishnav Achath        2024-02-15   595  			phys = <&dphy0>;
491821cebcf5cf Vaishnav Achath        2024-02-15   596  			phy-names = "dphy";
491821cebcf5cf Vaishnav Achath        2024-02-15   597  
491821cebcf5cf Vaishnav Achath        2024-02-15   598  			ports {
491821cebcf5cf Vaishnav Achath        2024-02-15   599  				#address-cells = <1>;
491821cebcf5cf Vaishnav Achath        2024-02-15   600  				#size-cells = <0>;
491821cebcf5cf Vaishnav Achath        2024-02-15   601  
491821cebcf5cf Vaishnav Achath        2024-02-15   602  				csi0_port0: port@0 {
491821cebcf5cf Vaishnav Achath        2024-02-15   603  					reg = <0>;
491821cebcf5cf Vaishnav Achath        2024-02-15   604  					status = "disabled";
491821cebcf5cf Vaishnav Achath        2024-02-15   605  				};
491821cebcf5cf Vaishnav Achath        2024-02-15   606  
491821cebcf5cf Vaishnav Achath        2024-02-15   607  				csi0_port1: port@1 {
491821cebcf5cf Vaishnav Achath        2024-02-15   608  					reg = <1>;
491821cebcf5cf Vaishnav Achath        2024-02-15   609  					status = "disabled";
491821cebcf5cf Vaishnav Achath        2024-02-15   610  				};
491821cebcf5cf Vaishnav Achath        2024-02-15   611  
491821cebcf5cf Vaishnav Achath        2024-02-15   612  				csi0_port2: port@2 {
491821cebcf5cf Vaishnav Achath        2024-02-15   613  					reg = <2>;
491821cebcf5cf Vaishnav Achath        2024-02-15   614  					status = "disabled";
491821cebcf5cf Vaishnav Achath        2024-02-15   615  				};
491821cebcf5cf Vaishnav Achath        2024-02-15   616  
491821cebcf5cf Vaishnav Achath        2024-02-15   617  				csi0_port3: port@3 {
491821cebcf5cf Vaishnav Achath        2024-02-15   618  					reg = <3>;
491821cebcf5cf Vaishnav Achath        2024-02-15   619  					status = "disabled";
491821cebcf5cf Vaishnav Achath        2024-02-15   620  				};
491821cebcf5cf Vaishnav Achath        2024-02-15   621  
491821cebcf5cf Vaishnav Achath        2024-02-15   622  				csi0_port4: port@4 {
491821cebcf5cf Vaishnav Achath        2024-02-15   623  					reg = <4>;
491821cebcf5cf Vaishnav Achath        2024-02-15   624  					status = "disabled";
491821cebcf5cf Vaishnav Achath        2024-02-15   625  				};
491821cebcf5cf Vaishnav Achath        2024-02-15   626  			};
491821cebcf5cf Vaishnav Achath        2024-02-15   627  		};
491821cebcf5cf Vaishnav Achath        2024-02-15   628  	};
491821cebcf5cf Vaishnav Achath        2024-02-15   629  
491821cebcf5cf Vaishnav Achath        2024-02-15   630  	ti_csi2rx1: ticsi2rx@4510000 {
491821cebcf5cf Vaishnav Achath        2024-02-15   631  		compatible = "ti,j721e-csi2rx-shim";
491821cebcf5cf Vaishnav Achath        2024-02-15   632  		reg = <0x0 0x4510000 0x0 0x1000>;
491821cebcf5cf Vaishnav Achath        2024-02-15   633  		ranges;
491821cebcf5cf Vaishnav Achath        2024-02-15   634  		#address-cells = <2>;
491821cebcf5cf Vaishnav Achath        2024-02-15   635  		#size-cells = <2>;
491821cebcf5cf Vaishnav Achath        2024-02-15   636  		dmas = <&main_udmap 0x4960>;
491821cebcf5cf Vaishnav Achath        2024-02-15   637  		dma-names = "rx0";
491821cebcf5cf Vaishnav Achath        2024-02-15   638  		power-domains = <&k3_pds 27 TI_SCI_PD_EXCLUSIVE>;
491821cebcf5cf Vaishnav Achath        2024-02-15   639  		status = "disabled";
491821cebcf5cf Vaishnav Achath        2024-02-15   640  
491821cebcf5cf Vaishnav Achath        2024-02-15   641  		cdns_csi2rx1: csi-bridge@4514000 {
491821cebcf5cf Vaishnav Achath        2024-02-15   642  			compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
491821cebcf5cf Vaishnav Achath        2024-02-15   643  			reg = <0x0 0x4514000 0x0 0x1000>;
491821cebcf5cf Vaishnav Achath        2024-02-15   644  			clocks = <&k3_clks 27 2>, <&k3_clks 27 0>, <&k3_clks 27 2>,
491821cebcf5cf Vaishnav Achath        2024-02-15   645  				 <&k3_clks 27 2>, <&k3_clks 27 3>, <&k3_clks 27 3>;
491821cebcf5cf Vaishnav Achath        2024-02-15   646  			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
491821cebcf5cf Vaishnav Achath        2024-02-15   647  				      "pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
491821cebcf5cf Vaishnav Achath        2024-02-15   648  			phys = <&dphy1>;
491821cebcf5cf Vaishnav Achath        2024-02-15   649  			phy-names = "dphy";
491821cebcf5cf Vaishnav Achath        2024-02-15   650  
491821cebcf5cf Vaishnav Achath        2024-02-15   651  			ports {
491821cebcf5cf Vaishnav Achath        2024-02-15   652  				#address-cells = <1>;
491821cebcf5cf Vaishnav Achath        2024-02-15   653  				#size-cells = <0>;
491821cebcf5cf Vaishnav Achath        2024-02-15   654  
491821cebcf5cf Vaishnav Achath        2024-02-15   655  				csi1_port0: port@0 {
491821cebcf5cf Vaishnav Achath        2024-02-15   656  					reg = <0>;
491821cebcf5cf Vaishnav Achath        2024-02-15   657  					status = "disabled";
491821cebcf5cf Vaishnav Achath        2024-02-15   658  				};
491821cebcf5cf Vaishnav Achath        2024-02-15   659  
491821cebcf5cf Vaishnav Achath        2024-02-15   660  				csi1_port1: port@1 {
491821cebcf5cf Vaishnav Achath        2024-02-15   661  					reg = <1>;
491821cebcf5cf Vaishnav Achath        2024-02-15   662  					status = "disabled";
491821cebcf5cf Vaishnav Achath        2024-02-15   663  				};
491821cebcf5cf Vaishnav Achath        2024-02-15   664  
491821cebcf5cf Vaishnav Achath        2024-02-15   665  				csi1_port2: port@2 {
491821cebcf5cf Vaishnav Achath        2024-02-15   666  					reg = <2>;
491821cebcf5cf Vaishnav Achath        2024-02-15   667  					status = "disabled";
491821cebcf5cf Vaishnav Achath        2024-02-15   668  				};
491821cebcf5cf Vaishnav Achath        2024-02-15   669  
491821cebcf5cf Vaishnav Achath        2024-02-15   670  				csi1_port3: port@3 {
491821cebcf5cf Vaishnav Achath        2024-02-15   671  					reg = <3>;
491821cebcf5cf Vaishnav Achath        2024-02-15   672  					status = "disabled";
491821cebcf5cf Vaishnav Achath        2024-02-15   673  				};
491821cebcf5cf Vaishnav Achath        2024-02-15   674  
491821cebcf5cf Vaishnav Achath        2024-02-15   675  				csi1_port4: port@4 {
491821cebcf5cf Vaishnav Achath        2024-02-15   676  					reg = <4>;
491821cebcf5cf Vaishnav Achath        2024-02-15   677  					status = "disabled";
491821cebcf5cf Vaishnav Achath        2024-02-15   678  				};
491821cebcf5cf Vaishnav Achath        2024-02-15   679  			};
491821cebcf5cf Vaishnav Achath        2024-02-15   680  		};
491821cebcf5cf Vaishnav Achath        2024-02-15   681  	};
491821cebcf5cf Vaishnav Achath        2024-02-15   682  
491821cebcf5cf Vaishnav Achath        2024-02-15   683  	dphy0: phy@4580000 {
491821cebcf5cf Vaishnav Achath        2024-02-15   684  		compatible = "cdns,dphy-rx";
491821cebcf5cf Vaishnav Achath        2024-02-15   685  		reg = <0x0 0x4580000 0x0 0x1100>;
491821cebcf5cf Vaishnav Achath        2024-02-15   686  		#phy-cells = <0>;
491821cebcf5cf Vaishnav Achath        2024-02-15   687  		power-domains = <&k3_pds 147 TI_SCI_PD_EXCLUSIVE>;
491821cebcf5cf Vaishnav Achath        2024-02-15   688  		status = "disabled";
491821cebcf5cf Vaishnav Achath        2024-02-15   689  	};
491821cebcf5cf Vaishnav Achath        2024-02-15   690  
491821cebcf5cf Vaishnav Achath        2024-02-15   691  	dphy1: phy@4590000 {
491821cebcf5cf Vaishnav Achath        2024-02-15   692  		compatible = "cdns,dphy-rx";
491821cebcf5cf Vaishnav Achath        2024-02-15   693  		reg = <0x0 0x4590000 0x0 0x1100>;
491821cebcf5cf Vaishnav Achath        2024-02-15   694  		#phy-cells = <0>;
491821cebcf5cf Vaishnav Achath        2024-02-15   695  		power-domains = <&k3_pds 148 TI_SCI_PD_EXCLUSIVE>;
491821cebcf5cf Vaishnav Achath        2024-02-15   696  		status = "disabled";
491821cebcf5cf Vaishnav Achath        2024-02-15   697  	};
491821cebcf5cf Vaishnav Achath        2024-02-15   698  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   699  	serdes_wiz0: wiz@5000000 {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   700  		compatible = "ti,j721e-wiz-16g";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   701  		#address-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   702  		#size-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   703  		power-domains = <&k3_pds 292 TI_SCI_PD_EXCLUSIVE>;
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   704  		clocks = <&k3_clks 292 5>, <&k3_clks 292 11>, <&cmn_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   705  		clock-names = "fck", "core_ref_clk", "ext_ref_clk";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   706  		assigned-clocks = <&k3_clks 292 11>, <&k3_clks 292 0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   707  		assigned-clock-parents = <&k3_clks 292 15>, <&k3_clks 292 4>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   708  		num-lanes = <2>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   709  		#reset-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   710  		ranges = <0x5000000 0x0 0x5000000 0x10000>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   711  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   712  		wiz0_pll0_refclk: pll0-refclk {
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   713  			clocks = <&k3_clks 292 11>, <&cmn_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   714  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   715  			assigned-clocks = <&wiz0_pll0_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   716  			assigned-clock-parents = <&k3_clks 292 11>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   717  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   718  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   719  		wiz0_pll1_refclk: pll1-refclk {
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   720  			clocks = <&k3_clks 292 0>, <&cmn_refclk1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   721  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   722  			assigned-clocks = <&wiz0_pll1_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   723  			assigned-clock-parents = <&k3_clks 292 0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   724  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   725  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   726  		wiz0_refclk_dig: refclk-dig {
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   727  			clocks = <&k3_clks 292 11>, <&k3_clks 292 0>, <&cmn_refclk>, <&cmn_refclk1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   728  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   729  			assigned-clocks = <&wiz0_refclk_dig>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   730  			assigned-clock-parents = <&k3_clks 292 11>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   731  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   732  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   733  		wiz0_cmn_refclk_dig_div: cmn-refclk-dig-div {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   734  			clocks = <&wiz0_refclk_dig>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   735  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   736  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   737  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   738  		wiz0_cmn_refclk1_dig_div: cmn-refclk1-dig-div {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   739  			clocks = <&wiz0_pll1_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   740  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   741  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   742  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   743  		serdes0: serdes@5000000 {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   744  			compatible = "ti,sierra-phy-t0";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   745  			reg-names = "serdes";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   746  			reg = <0x5000000 0x10000>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   747  			#address-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   748  			#size-cells = <0>;
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   749  			#clock-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   750  			resets = <&serdes_wiz0 0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   751  			reset-names = "sierra_reset";
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   752  			clocks = <&wiz0_cmn_refclk_dig_div>, <&wiz0_cmn_refclk1_dig_div>,
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   753  				 <&wiz0_pll0_refclk>, <&wiz0_pll1_refclk>;
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   754  			clock-names = "cmn_refclk_dig_div", "cmn_refclk1_dig_div",
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   755  				      "pll0_refclk", "pll1_refclk";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   756  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   757  	};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   758  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   759  	serdes_wiz1: wiz@5010000 {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   760  		compatible = "ti,j721e-wiz-16g";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   761  		#address-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   762  		#size-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   763  		power-domains = <&k3_pds 293 TI_SCI_PD_EXCLUSIVE>;
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   764  		clocks = <&k3_clks 293 5>, <&k3_clks 293 13>, <&cmn_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   765  		clock-names = "fck", "core_ref_clk", "ext_ref_clk";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   766  		assigned-clocks = <&k3_clks 293 13>, <&k3_clks 293 0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   767  		assigned-clock-parents = <&k3_clks 293 17>, <&k3_clks 293 4>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   768  		num-lanes = <2>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   769  		#reset-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   770  		ranges = <0x5010000 0x0 0x5010000 0x10000>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   771  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   772  		wiz1_pll0_refclk: pll0-refclk {
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   773  			clocks = <&k3_clks 293 13>, <&cmn_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   774  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   775  			assigned-clocks = <&wiz1_pll0_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   776  			assigned-clock-parents = <&k3_clks 293 13>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   777  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   778  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   779  		wiz1_pll1_refclk: pll1-refclk {
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   780  			clocks = <&k3_clks 293 0>, <&cmn_refclk1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   781  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   782  			assigned-clocks = <&wiz1_pll1_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   783  			assigned-clock-parents = <&k3_clks 293 0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   784  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   785  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   786  		wiz1_refclk_dig: refclk-dig {
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   787  			clocks = <&k3_clks 293 13>, <&k3_clks 293 0>, <&cmn_refclk>, <&cmn_refclk1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   788  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   789  			assigned-clocks = <&wiz1_refclk_dig>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   790  			assigned-clock-parents = <&k3_clks 293 13>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   791  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   792  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   793  		wiz1_cmn_refclk_dig_div: cmn-refclk-dig-div {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   794  			clocks = <&wiz1_refclk_dig>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   795  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   796  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   797  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   798  		wiz1_cmn_refclk1_dig_div: cmn-refclk1-dig-div {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   799  			clocks = <&wiz1_pll1_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   800  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   801  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   802  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   803  		serdes1: serdes@5010000 {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   804  			compatible = "ti,sierra-phy-t0";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   805  			reg-names = "serdes";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   806  			reg = <0x5010000 0x10000>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   807  			#address-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   808  			#size-cells = <0>;
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   809  			#clock-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   810  			resets = <&serdes_wiz1 0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   811  			reset-names = "sierra_reset";
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   812  			clocks = <&wiz1_cmn_refclk_dig_div>, <&wiz1_cmn_refclk1_dig_div>,
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   813  				 <&wiz1_pll0_refclk>, <&wiz1_pll1_refclk>;
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   814  			clock-names = "cmn_refclk_dig_div", "cmn_refclk1_dig_div",
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   815  				      "pll0_refclk", "pll1_refclk";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   816  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   817  	};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   818  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   819  	serdes_wiz2: wiz@5020000 {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   820  		compatible = "ti,j721e-wiz-16g";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   821  		#address-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   822  		#size-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   823  		power-domains = <&k3_pds 294 TI_SCI_PD_EXCLUSIVE>;
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   824  		clocks = <&k3_clks 294 5>, <&k3_clks 294 11>, <&cmn_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   825  		clock-names = "fck", "core_ref_clk", "ext_ref_clk";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   826  		assigned-clocks = <&k3_clks 294 11>, <&k3_clks 294 0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   827  		assigned-clock-parents = <&k3_clks 294 15>, <&k3_clks 294 4>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   828  		num-lanes = <2>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   829  		#reset-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   830  		ranges = <0x5020000 0x0 0x5020000 0x10000>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   831  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   832  		wiz2_pll0_refclk: pll0-refclk {
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   833  			clocks = <&k3_clks 294 11>, <&cmn_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   834  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   835  			assigned-clocks = <&wiz2_pll0_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   836  			assigned-clock-parents = <&k3_clks 294 11>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   837  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   838  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   839  		wiz2_pll1_refclk: pll1-refclk {
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   840  			clocks = <&k3_clks 294 0>, <&cmn_refclk1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   841  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   842  			assigned-clocks = <&wiz2_pll1_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   843  			assigned-clock-parents = <&k3_clks 294 0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   844  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   845  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   846  		wiz2_refclk_dig: refclk-dig {
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   847  			clocks = <&k3_clks 294 11>, <&k3_clks 294 0>, <&cmn_refclk>, <&cmn_refclk1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   848  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   849  			assigned-clocks = <&wiz2_refclk_dig>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   850  			assigned-clock-parents = <&k3_clks 294 11>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   851  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   852  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   853  		wiz2_cmn_refclk_dig_div: cmn-refclk-dig-div {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   854  			clocks = <&wiz2_refclk_dig>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   855  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   856  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   857  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   858  		wiz2_cmn_refclk1_dig_div: cmn-refclk1-dig-div {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   859  			clocks = <&wiz2_pll1_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   860  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   861  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   862  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   863  		serdes2: serdes@5020000 {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   864  			compatible = "ti,sierra-phy-t0";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   865  			reg-names = "serdes";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   866  			reg = <0x5020000 0x10000>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   867  			#address-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   868  			#size-cells = <0>;
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   869  			#clock-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   870  			resets = <&serdes_wiz2 0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   871  			reset-names = "sierra_reset";
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   872  			clocks = <&wiz2_cmn_refclk_dig_div>, <&wiz2_cmn_refclk1_dig_div>,
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   873  				 <&wiz2_pll0_refclk>, <&wiz2_pll1_refclk>;
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   874  			clock-names = "cmn_refclk_dig_div", "cmn_refclk1_dig_div",
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   875  				      "pll0_refclk", "pll1_refclk";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   876  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   877  	};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   878  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   879  	serdes_wiz3: wiz@5030000 {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   880  		compatible = "ti,j721e-wiz-16g";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   881  		#address-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   882  		#size-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   883  		power-domains = <&k3_pds 295 TI_SCI_PD_EXCLUSIVE>;
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   884  		clocks = <&k3_clks 295 5>, <&k3_clks 295 9>, <&cmn_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   885  		clock-names = "fck", "core_ref_clk", "ext_ref_clk";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   886  		assigned-clocks = <&k3_clks 295 9>, <&k3_clks 295 0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   887  		assigned-clock-parents = <&k3_clks 295 13>, <&k3_clks 295 4>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   888  		num-lanes = <2>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   889  		#reset-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   890  		ranges = <0x5030000 0x0 0x5030000 0x10000>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   891  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   892  		wiz3_pll0_refclk: pll0-refclk {
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   893  			clocks = <&k3_clks 295 9>, <&cmn_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   894  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   895  			assigned-clocks = <&wiz3_pll0_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   896  			assigned-clock-parents = <&k3_clks 295 9>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   897  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   898  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   899  		wiz3_pll1_refclk: pll1-refclk {
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   900  			clocks = <&k3_clks 295 0>, <&cmn_refclk1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   901  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   902  			assigned-clocks = <&wiz3_pll1_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   903  			assigned-clock-parents = <&k3_clks 295 0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   904  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   905  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   906  		wiz3_refclk_dig: refclk-dig {
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   907  			clocks = <&k3_clks 295 9>, <&k3_clks 295 0>, <&cmn_refclk>, <&cmn_refclk1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   908  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   909  			assigned-clocks = <&wiz3_refclk_dig>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   910  			assigned-clock-parents = <&k3_clks 295 9>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   911  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   912  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   913  		wiz3_cmn_refclk_dig_div: cmn-refclk-dig-div {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   914  			clocks = <&wiz3_refclk_dig>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   915  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   916  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   917  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   918  		wiz3_cmn_refclk1_dig_div: cmn-refclk1-dig-div {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   919  			clocks = <&wiz3_pll1_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   920  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   921  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   922  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   923  		serdes3: serdes@5030000 {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   924  			compatible = "ti,sierra-phy-t0";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   925  			reg-names = "serdes";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   926  			reg = <0x5030000 0x10000>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   927  			#address-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   928  			#size-cells = <0>;
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   929  			#clock-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   930  			resets = <&serdes_wiz3 0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   931  			reset-names = "sierra_reset";
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   932  			clocks = <&wiz3_cmn_refclk_dig_div>, <&wiz3_cmn_refclk1_dig_div>,
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   933  				 <&wiz3_pll0_refclk>, <&wiz3_pll1_refclk>;
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   934  			clock-names = "cmn_refclk_dig_div", "cmn_refclk1_dig_div",
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   935  				      "pll0_refclk", "pll1_refclk";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   936  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   937  	};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   938  
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   939  	pcie0_rc: pcie@2900000 {
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   940  		compatible = "ti,j721e-pcie-host";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   941  		reg = <0x00 0x02900000 0x00 0x1000>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   942  		      <0x00 0x02907000 0x00 0x400>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   943  		      <0x00 0x0d000000 0x00 0x00800000>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   944  		      <0x00 0x10000000 0x00 0x00001000>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   945  		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   946  		interrupt-names = "link_state";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   947  		interrupts = <GIC_SPI 318 IRQ_TYPE_EDGE_RISING>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   948  		device_type = "pci";
edb96779f3bcbe Kishon Vijay Abraham I 2021-01-05   949  		ti,syscon-pcie-ctrl = <&scm_conf 0x4070>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   950  		max-link-speed = <3>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   951  		num-lanes = <2>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   952  		power-domains = <&k3_pds 239 TI_SCI_PD_EXCLUSIVE>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   953  		clocks = <&k3_clks 239 1>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   954  		clock-names = "fck";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   955  		#address-cells = <3>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   956  		#size-cells = <2>;
5f46633565b1c1 Kishon Vijay Abraham I 2021-09-15   957  		bus-range = <0x0 0xff>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   958  		vendor-id = <0x104c>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   959  		device-id = <0xb00d>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   960  		msi-map = <0x0 &gic_its 0x0 0x10000>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   961  		dma-coherent;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   962  		ranges = <0x01000000 0x0 0x10001000 0x0 0x10001000 0x0 0x0010000>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   963  			 <0x02000000 0x0 0x10011000 0x0 0x10011000 0x0 0x7fef000>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   964  		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
731c6deda85ffc Andrew Davis           2023-05-15   965  		status = "disabled";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   966  	};
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   967  
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   968  	pcie1_rc: pcie@2910000 {
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   969  		compatible = "ti,j721e-pcie-host";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   970  		reg = <0x00 0x02910000 0x00 0x1000>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   971  		      <0x00 0x02917000 0x00 0x400>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   972  		      <0x00 0x0d800000 0x00 0x00800000>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   973  		      <0x00 0x18000000 0x00 0x00001000>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   974  		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   975  		interrupt-names = "link_state";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   976  		interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   977  		device_type = "pci";
edb96779f3bcbe Kishon Vijay Abraham I 2021-01-05   978  		ti,syscon-pcie-ctrl = <&scm_conf 0x4074>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   979  		max-link-speed = <3>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   980  		num-lanes = <2>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   981  		power-domains = <&k3_pds 240 TI_SCI_PD_EXCLUSIVE>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   982  		clocks = <&k3_clks 240 1>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   983  		clock-names = "fck";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   984  		#address-cells = <3>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   985  		#size-cells = <2>;
5f46633565b1c1 Kishon Vijay Abraham I 2021-09-15   986  		bus-range = <0x0 0xff>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   987  		vendor-id = <0x104c>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   988  		device-id = <0xb00d>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   989  		msi-map = <0x0 &gic_its 0x10000 0x10000>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   990  		dma-coherent;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   991  		ranges = <0x01000000 0x0 0x18001000 0x0 0x18001000 0x0 0x0010000>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   992  			 <0x02000000 0x0 0x18011000 0x0 0x18011000 0x0 0x7fef000>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   993  		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
731c6deda85ffc Andrew Davis           2023-05-15   994  		status = "disabled";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   995  	};
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   996  
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   997  	pcie2_rc: pcie@2920000 {
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   998  		compatible = "ti,j721e-pcie-host";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   999  		reg = <0x00 0x02920000 0x00 0x1000>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1000  		      <0x00 0x02927000 0x00 0x400>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1001  		      <0x00 0x0e000000 0x00 0x00800000>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1002  		      <0x44 0x00000000 0x00 0x00001000>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1003  		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1004  		interrupt-names = "link_state";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1005  		interrupts = <GIC_SPI 342 IRQ_TYPE_EDGE_RISING>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1006  		device_type = "pci";
edb96779f3bcbe Kishon Vijay Abraham I 2021-01-05  1007  		ti,syscon-pcie-ctrl = <&scm_conf 0x4078>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1008  		max-link-speed = <3>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1009  		num-lanes = <2>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1010  		power-domains = <&k3_pds 241 TI_SCI_PD_EXCLUSIVE>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1011  		clocks = <&k3_clks 241 1>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1012  		clock-names = "fck";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1013  		#address-cells = <3>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1014  		#size-cells = <2>;
5f46633565b1c1 Kishon Vijay Abraham I 2021-09-15  1015  		bus-range = <0x0 0xff>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1016  		vendor-id = <0x104c>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1017  		device-id = <0xb00d>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1018  		msi-map = <0x0 &gic_its 0x20000 0x10000>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1019  		dma-coherent;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1020  		ranges = <0x01000000 0x0 0x00001000 0x44 0x00001000 0x0 0x0010000>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1021  			 <0x02000000 0x0 0x00011000 0x44 0x00011000 0x0 0x7fef000>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1022  		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
731c6deda85ffc Andrew Davis           2023-05-15  1023  		status = "disabled";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1024  	};
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1025  
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1026  	pcie3_rc: pcie@2930000 {
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1027  		compatible = "ti,j721e-pcie-host";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1028  		reg = <0x00 0x02930000 0x00 0x1000>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1029  		      <0x00 0x02937000 0x00 0x400>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1030  		      <0x00 0x0e800000 0x00 0x00800000>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1031  		      <0x44 0x10000000 0x00 0x00001000>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1032  		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1033  		interrupt-names = "link_state";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1034  		interrupts = <GIC_SPI 354 IRQ_TYPE_EDGE_RISING>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1035  		device_type = "pci";
edb96779f3bcbe Kishon Vijay Abraham I 2021-01-05  1036  		ti,syscon-pcie-ctrl = <&scm_conf 0x407c>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1037  		max-link-speed = <3>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1038  		num-lanes = <2>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1039  		power-domains = <&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1040  		clocks = <&k3_clks 242 1>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1041  		clock-names = "fck";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1042  		#address-cells = <3>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1043  		#size-cells = <2>;
5f46633565b1c1 Kishon Vijay Abraham I 2021-09-15  1044  		bus-range = <0x0 0xff>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1045  		vendor-id = <0x104c>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1046  		device-id = <0xb00d>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1047  		msi-map = <0x0 &gic_its 0x30000 0x10000>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1048  		dma-coherent;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1049  		ranges = <0x01000000 0x0 0x00001000 0x44 0x10001000 0x0 0x0010000>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1050  			 <0x02000000 0x0 0x00011000 0x44 0x10011000 0x0 0x7fef000>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1051  		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
731c6deda85ffc Andrew Davis           2023-05-15  1052  		status = "disabled";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1053  	};
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1054  
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1055  	serdes_wiz4: wiz@5050000 {
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1056  		compatible = "ti,am64-wiz-10g";
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1057  		#address-cells = <1>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1058  		#size-cells = <1>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1059  		power-domains = <&k3_pds 297 TI_SCI_PD_EXCLUSIVE>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1060  		clocks = <&k3_clks 297 1>, <&k3_clks 297 9>, <&cmn_refclk>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1061  		clock-names = "fck", "core_ref_clk", "ext_ref_clk";
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1062  		assigned-clocks = <&k3_clks 297 9>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1063  		assigned-clock-parents = <&k3_clks 297 10>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1064  		assigned-clock-rates = <19200000>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1065  		num-lanes = <4>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1066  		#reset-cells = <1>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1067  		#clock-cells = <1>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1068  		ranges = <0x05050000 0x00 0x05050000 0x010000>,
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1069  			<0x0a030a00 0x00 0x0a030a00 0x40>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1070  
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1071  		serdes4: serdes@5050000 {
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1072  			/*
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1073  			 * Note: we also map DPTX PHY registers as the Torrent
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1074  			 * needs to manage those.
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1075  			 */
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1076  			compatible = "ti,j721e-serdes-10g";
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1077  			reg = <0x05050000 0x010000>,
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1078  			      <0x0a030a00 0x40>; /* DPTX PHY */
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1079  			reg-names = "torrent_phy", "dptx_phy";
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1080  
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1081  			resets = <&serdes_wiz4 0>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1082  			reset-names = "torrent_reset";
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1083  			clocks = <&serdes_wiz4 TI_WIZ_PLL0_REFCLK>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1084  			clock-names = "refclk";
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1085  			assigned-clocks = <&serdes_wiz4 TI_WIZ_PLL0_REFCLK>,
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1086  					  <&serdes_wiz4 TI_WIZ_PLL1_REFCLK>,
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1087  					  <&serdes_wiz4 TI_WIZ_REFCLK_DIG>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1088  			assigned-clock-parents = <&k3_clks 297 9>,
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1089  						 <&k3_clks 297 9>,
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1090  						 <&k3_clks 297 9>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1091  			#address-cells = <1>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1092  			#size-cells = <0>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1093  		};
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1094  	};
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1095  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1096  	main_timer0: timer@2400000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1097  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1098  		reg = <0x00 0x2400000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1099  		interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1100  		clocks = <&k3_clks 49 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1101  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1102  		assigned-clocks = <&k3_clks 49 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1103  		assigned-clock-parents = <&k3_clks 49 2>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1104  		power-domains = <&k3_pds 49 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1105  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1106  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1107  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1108  	main_timer1: timer@2410000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1109  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1110  		reg = <0x00 0x2410000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1111  		interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1112  		clocks = <&k3_clks 50 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1113  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1114  		assigned-clocks = <&k3_clks 50 1>, <&k3_clks 327 0>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1115  		assigned-clock-parents = <&k3_clks 50 2>, <&k3_clks 327 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1116  		power-domains = <&k3_pds 50 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1117  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1118  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1119  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1120  	main_timer2: timer@2420000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1121  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1122  		reg = <0x00 0x2420000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1123  		interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1124  		clocks = <&k3_clks 51 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1125  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1126  		assigned-clocks = <&k3_clks 51 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1127  		assigned-clock-parents = <&k3_clks 51 2>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1128  		power-domains = <&k3_pds 51 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1129  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1130  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1131  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1132  	main_timer3: timer@2430000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1133  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1134  		reg = <0x00 0x2430000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1135  		interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1136  		clocks = <&k3_clks 52 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1137  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1138  		assigned-clocks = <&k3_clks 52 1>, <&k3_clks 328 0>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1139  		assigned-clock-parents = <&k3_clks 52 2>, <&k3_clks 328 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1140  		power-domains = <&k3_pds 52 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1141  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1142  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1143  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1144  	main_timer4: timer@2440000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1145  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1146  		reg = <0x00 0x2440000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1147  		interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1148  		clocks = <&k3_clks 53 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1149  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1150  		assigned-clocks = <&k3_clks 53 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1151  		assigned-clock-parents = <&k3_clks 53 2>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1152  		power-domains = <&k3_pds 53 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1153  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1154  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1155  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1156  	main_timer5: timer@2450000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1157  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1158  		reg = <0x00 0x2450000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1159  		interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1160  		clocks = <&k3_clks 54 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1161  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1162  		assigned-clocks = <&k3_clks 54 1>, <&k3_clks 329 0>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1163  		assigned-clock-parents = <&k3_clks 54 2>, <&k3_clks 329 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1164  		power-domains = <&k3_pds 54 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1165  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1166  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1167  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1168  	main_timer6: timer@2460000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1169  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1170  		reg = <0x00 0x2460000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1171  		interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1172  		clocks = <&k3_clks 55 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1173  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1174  		assigned-clocks = <&k3_clks 55 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1175  		assigned-clock-parents = <&k3_clks 55 2>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1176  		power-domains = <&k3_pds 55 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1177  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1178  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1179  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1180  	main_timer7: timer@2470000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1181  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1182  		reg = <0x00 0x2470000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1183  		interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1184  		clocks = <&k3_clks 57 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1185  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1186  		assigned-clocks = <&k3_clks 57 1>, <&k3_clks 330 0>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1187  		assigned-clock-parents = <&k3_clks 57 2>, <&k3_clks 330 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1188  		power-domains = <&k3_pds 57 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1189  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1190  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1191  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1192  	main_timer8: timer@2480000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1193  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1194  		reg = <0x00 0x2480000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1195  		interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1196  		clocks = <&k3_clks 58 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1197  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1198  		assigned-clocks = <&k3_clks 58 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1199  		assigned-clock-parents = <&k3_clks 58 2>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1200  		power-domains = <&k3_pds 58 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1201  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1202  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1203  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1204  	main_timer9: timer@2490000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1205  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1206  		reg = <0x00 0x2490000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1207  		interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1208  		clocks = <&k3_clks 59 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1209  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1210  		assigned-clocks = <&k3_clks 59 1>, <&k3_clks 331 0>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1211  		assigned-clock-parents = <&k3_clks 59 2>, <&k3_clks 331 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1212  		power-domains = <&k3_pds 59 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1213  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1214  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1215  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1216  	main_timer10: timer@24a0000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1217  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1218  		reg = <0x00 0x24a0000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1219  		interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1220  		clocks = <&k3_clks 60 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1221  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1222  		assigned-clocks = <&k3_clks 60 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1223  		assigned-clock-parents = <&k3_clks 60 2>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1224  		power-domains = <&k3_pds 60 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1225  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1226  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1227  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1228  	main_timer11: timer@24b0000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1229  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1230  		reg = <0x00 0x24b0000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1231  		interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1232  		clocks = <&k3_clks 62 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1233  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1234  		assigned-clocks = <&k3_clks 62 1>, <&k3_clks 332 0>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1235  		assigned-clock-parents = <&k3_clks 62 2>, <&k3_clks 332 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1236  		power-domains = <&k3_pds 62 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1237  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1238  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1239  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1240  	main_timer12: timer@24c0000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1241  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1242  		reg = <0x00 0x24c0000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1243  		interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1244  		clocks = <&k3_clks 63 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1245  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1246  		assigned-clocks = <&k3_clks 63 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1247  		assigned-clock-parents = <&k3_clks 63 2>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1248  		power-domains = <&k3_pds 63 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1249  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1250  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1251  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1252  	main_timer13: timer@24d0000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1253  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1254  		reg = <0x00 0x24d0000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1255  		interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1256  		clocks = <&k3_clks 64 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1257  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1258  		assigned-clocks = <&k3_clks 64 1>, <&k3_clks 333 0>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1259  		assigned-clock-parents = <&k3_clks 64 2>, <&k3_clks 333 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1260  		power-domains = <&k3_pds 64 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1261  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1262  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1263  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1264  	main_timer14: timer@24e0000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1265  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1266  		reg = <0x00 0x24e0000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1267  		interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1268  		clocks = <&k3_clks 65 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1269  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1270  		assigned-clocks = <&k3_clks 65 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1271  		assigned-clock-parents = <&k3_clks 65 2>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1272  		power-domains = <&k3_pds 65 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1273  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1274  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1275  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1276  	main_timer15: timer@24f0000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1277  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1278  		reg = <0x00 0x24f0000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1279  		interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1280  		clocks = <&k3_clks 66 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1281  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1282  		assigned-clocks = <&k3_clks 66 1>, <&k3_clks 334 0>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1283  		assigned-clock-parents = <&k3_clks 66 2>, <&k3_clks 334 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1284  		power-domains = <&k3_pds 66 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1285  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1286  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1287  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1288  	main_timer16: timer@2500000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1289  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1290  		reg = <0x00 0x2500000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1291  		interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1292  		clocks = <&k3_clks 67 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1293  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1294  		assigned-clocks = <&k3_clks 67 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1295  		assigned-clock-parents = <&k3_clks 67 2>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1296  		power-domains = <&k3_pds 67 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1297  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1298  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1299  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1300  	main_timer17: timer@2510000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1301  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1302  		reg = <0x00 0x2510000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1303  		interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1304  		clocks = <&k3_clks 68 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1305  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1306  		assigned-clocks = <&k3_clks 68 1>, <&k3_clks 335 0>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1307  		assigned-clock-parents = <&k3_clks 68 2>, <&k3_clks 335 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1308  		power-domains = <&k3_pds 68 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1309  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1310  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1311  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1312  	main_timer18: timer@2520000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1313  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1314  		reg = <0x00 0x2520000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1315  		interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1316  		clocks = <&k3_clks 69 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1317  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1318  		assigned-clocks = <&k3_clks 69 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1319  		assigned-clock-parents = <&k3_clks 69 2>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1320  		power-domains = <&k3_pds 69 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1321  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1322  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1323  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1324  	main_timer19: timer@2530000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1325  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1326  		reg = <0x00 0x2530000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1327  		interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1328  		clocks = <&k3_clks 70 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1329  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1330  		assigned-clocks = <&k3_clks 70 1>, <&k3_clks 336 0>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1331  		assigned-clock-parents = <&k3_clks 70 2>, <&k3_clks 336 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1332  		power-domains = <&k3_pds 70 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1333  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1334  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1335  
2d87061e70dea4 Nishanth Menon         2019-05-22  1336  	main_uart0: serial@2800000 {
2d87061e70dea4 Nishanth Menon         2019-05-22  1337  		compatible = "ti,j721e-uart", "ti,am654-uart";
2d87061e70dea4 Nishanth Menon         2019-05-22  1338  		reg = <0x00 0x02800000 0x00 0x100>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1339  		interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1340  		clock-frequency = <48000000>;
bf146a1a7cd485 Lokesh Vutla           2019-07-29  1341  		power-domains = <&k3_pds 146 TI_SCI_PD_EXCLUSIVE>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1342  		clocks = <&k3_clks 146 0>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1343  		clock-names = "fclk";
fe17e20fde14c6 Andrew Davis           2022-10-20  1344  		status = "disabled";
2d87061e70dea4 Nishanth Menon         2019-05-22  1345  	};
2d87061e70dea4 Nishanth Menon         2019-05-22  1346  
2d87061e70dea4 Nishanth Menon         2019-05-22  1347  	main_uart1: serial@2810000 {
2d87061e70dea4 Nishanth Menon         2019-05-22  1348  		compatible = "ti,j721e-uart", "ti,am654-uart";
2d87061e70dea4 Nishanth Menon         2019-05-22  1349  		reg = <0x00 0x02810000 0x00 0x100>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1350  		interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1351  		clock-frequency = <48000000>;
bf146a1a7cd485 Lokesh Vutla           2019-07-29  1352  		power-domains = <&k3_pds 278 TI_SCI_PD_EXCLUSIVE>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1353  		clocks = <&k3_clks 278 0>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1354  		clock-names = "fclk";
fe17e20fde14c6 Andrew Davis           2022-10-20  1355  		status = "disabled";
2d87061e70dea4 Nishanth Menon         2019-05-22  1356  	};
2d87061e70dea4 Nishanth Menon         2019-05-22  1357  
2d87061e70dea4 Nishanth Menon         2019-05-22  1358  	main_uart2: serial@2820000 {
2d87061e70dea4 Nishanth Menon         2019-05-22  1359  		compatible = "ti,j721e-uart", "ti,am654-uart";
2d87061e70dea4 Nishanth Menon         2019-05-22  1360  		reg = <0x00 0x02820000 0x00 0x100>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1361  		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1362  		clock-frequency = <48000000>;
bf146a1a7cd485 Lokesh Vutla           2019-07-29  1363  		power-domains = <&k3_pds 279 TI_SCI_PD_EXCLUSIVE>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1364  		clocks = <&k3_clks 279 0>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1365  		clock-names = "fclk";
fe17e20fde14c6 Andrew Davis           2022-10-20  1366  		status = "disabled";
2d87061e70dea4 Nishanth Menon         2019-05-22  1367  	};
2d87061e70dea4 Nishanth Menon         2019-05-22  1368  
2d87061e70dea4 Nishanth Menon         2019-05-22  1369  	main_uart3: serial@2830000 {
2d87061e70dea4 Nishanth Menon         2019-05-22  1370  		compatible = "ti,j721e-uart", "ti,am654-uart";
2d87061e70dea4 Nishanth Menon         2019-05-22  1371  		reg = <0x00 0x02830000 0x00 0x100>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1372  		interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1373  		clock-frequency = <48000000>;
bf146a1a7cd485 Lokesh Vutla           2019-07-29  1374  		power-domains = <&k3_pds 280 TI_SCI_PD_EXCLUSIVE>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1375  		clocks = <&k3_clks 280 0>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1376  		clock-names = "fclk";
fe17e20fde14c6 Andrew Davis           2022-10-20  1377  		status = "disabled";
2d87061e70dea4 Nishanth Menon         2019-05-22  1378  	};
2d87061e70dea4 Nishanth Menon         2019-05-22  1379  
2d87061e70dea4 Nishanth Menon         2019-05-22  1380  	main_uart4: serial@2840000 {
2d87061e70dea4 Nishanth Menon         2019-05-22  1381  		compatible = "ti,j721e-uart", "ti,am654-uart";
2d87061e70dea4 Nishanth Menon         2019-05-22  1382  		reg = <0x00 0x02840000 0x00 0x100>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1383  		interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1384  		clock-frequency = <48000000>;
bf146a1a7cd485 Lokesh Vutla           2019-07-29  1385  		power-domains = <&k3_pds 281 TI_SCI_PD_EXCLUSIVE>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1386  		clocks = <&k3_clks 281 0>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1387  		clock-names = "fclk";
fe17e20fde14c6 Andrew Davis           2022-10-20  1388  		status = "disabled";
2d87061e70dea4 Nishanth Menon         2019-05-22  1389  	};
2d87061e70dea4 Nishanth Menon         2019-05-22  1390  
2d87061e70dea4 Nishanth Menon         2019-05-22  1391  	main_uart5: serial@2850000 {
2d87061e70dea4 Nishanth Menon         2019-05-22  1392  		compatible = "ti,j721e-uart", "ti,am654-uart";
2d87061e70dea4 Nishanth Menon         2019-05-22  1393  		reg = <0x00 0x02850000 0x00 0x100>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1394  		interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1395  		clock-frequency = <48000000>;
bf146a1a7cd485 Lokesh Vutla           2019-07-29  1396  		power-domains = <&k3_pds 282 TI_SCI_PD_EXCLUSIVE>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1397  		clocks = <&k3_clks 282 0>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1398  		clock-names = "fclk";
fe17e20fde14c6 Andrew Davis           2022-10-20  1399  		status = "disabled";
2d87061e70dea4 Nishanth Menon         2019-05-22  1400  	};
2d87061e70dea4 Nishanth Menon         2019-05-22  1401  
2d87061e70dea4 Nishanth Menon         2019-05-22  1402  	main_uart6: serial@2860000 {
2d87061e70dea4 Nishanth Menon         2019-05-22  1403  		compatible = "ti,j721e-uart", "ti,am654-uart";
2d87061e70dea4 Nishanth Menon         2019-05-22  1404  		reg = <0x00 0x02860000 0x00 0x100>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1405  		interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1406  		clock-frequency = <48000000>;
bf146a1a7cd485 Lokesh Vutla           2019-07-29  1407  		power-domains = <&k3_pds 283 TI_SCI_PD_EXCLUSIVE>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1408  		clocks = <&k3_clks 283 0>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1409  		clock-names = "fclk";
fe17e20fde14c6 Andrew Davis           2022-10-20  1410  		status = "disabled";
2d87061e70dea4 Nishanth Menon         2019-05-22  1411  	};
2d87061e70dea4 Nishanth Menon         2019-05-22  1412  
2d87061e70dea4 Nishanth Menon         2019-05-22  1413  	main_uart7: serial@2870000 {
2d87061e70dea4 Nishanth Menon         2019-05-22  1414  		compatible = "ti,j721e-uart", "ti,am654-uart";
2d87061e70dea4 Nishanth Menon         2019-05-22  1415  		reg = <0x00 0x02870000 0x00 0x100>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1416  		interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1417  		clock-frequency = <48000000>;
bf146a1a7cd485 Lokesh Vutla           2019-07-29  1418  		power-domains = <&k3_pds 284 TI_SCI_PD_EXCLUSIVE>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1419  		clocks = <&k3_clks 284 0>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1420  		clock-names = "fclk";
fe17e20fde14c6 Andrew Davis           2022-10-20  1421  		status = "disabled";
2d87061e70dea4 Nishanth Menon         2019-05-22  1422  	};
2d87061e70dea4 Nishanth Menon         2019-05-22  1423  
2d87061e70dea4 Nishanth Menon         2019-05-22  1424  	main_uart8: serial@2880000 {
2d87061e70dea4 Nishanth Menon         2019-05-22  1425  		compatible = "ti,j721e-uart", "ti,am654-uart";
2d87061e70dea4 Nishanth Menon         2019-05-22  1426  		reg = <0x00 0x02880000 0x00 0x100>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1427  		interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1428  		clock-frequency = <48000000>;
bf146a1a7cd485 Lokesh Vutla           2019-07-29  1429  		power-domains = <&k3_pds 285 TI_SCI_PD_EXCLUSIVE>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1430  		clocks = <&k3_clks 285 0>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1431  		clock-names = "fclk";
fe17e20fde14c6 Andrew Davis           2022-10-20  1432  		status = "disabled";
2d87061e70dea4 Nishanth Menon         2019-05-22  1433  	};
2d87061e70dea4 Nishanth Menon         2019-05-22  1434  
2d87061e70dea4 Nishanth Menon         2019-05-22  1435  	main_uart9: serial@2890000 {
2d87061e70dea4 Nishanth Menon         2019-05-22  1436  		compatible = "ti,j721e-uart", "ti,am654-uart";
2d87061e70dea4 Nishanth Menon         2019-05-22  1437  		reg = <0x00 0x02890000 0x00 0x100>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1438  		interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1439  		clock-frequency = <48000000>;
bf146a1a7cd485 Lokesh Vutla           2019-07-29  1440  		power-domains = <&k3_pds 286 TI_SCI_PD_EXCLUSIVE>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1441  		clocks = <&k3_clks 286 0>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1442  		clock-names = "fclk";
fe17e20fde14c6 Andrew Davis           2022-10-20  1443  		status = "disabled";
2d87061e70dea4 Nishanth Menon         2019-05-22  1444  	};
248f3eae99485b Lokesh Vutla           2019-08-09  1445  
248f3eae99485b Lokesh Vutla           2019-08-09  1446  	main_gpio0: gpio@600000 {
248f3eae99485b Lokesh Vutla           2019-08-09  1447  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
248f3eae99485b Lokesh Vutla           2019-08-09  1448  		reg = <0x0 0x00600000 0x0 0x100>;
248f3eae99485b Lokesh Vutla           2019-08-09  1449  		gpio-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1450  		#gpio-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1451  		interrupt-parent = <&main_gpio_intr>;
8d523f096da535 Lokesh Vutla           2020-08-06  1452  		interrupts = <256>, <257>, <258>, <259>,
8d523f096da535 Lokesh Vutla           2020-08-06  1453  			     <260>, <261>, <262>, <263>;
248f3eae99485b Lokesh Vutla           2019-08-09  1454  		interrupt-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1455  		#interrupt-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1456  		ti,ngpio = <128>;
248f3eae99485b Lokesh Vutla           2019-08-09  1457  		ti,davinci-gpio-unbanked = <0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1458  		power-domains = <&k3_pds 105 TI_SCI_PD_EXCLUSIVE>;
248f3eae99485b Lokesh Vutla           2019-08-09  1459  		clocks = <&k3_clks 105 0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1460  		clock-names = "gpio";
8757108b59e149 Andrew Davis           2023-08-09  1461  		status = "disabled";
248f3eae99485b Lokesh Vutla           2019-08-09  1462  	};
248f3eae99485b Lokesh Vutla           2019-08-09  1463  
248f3eae99485b Lokesh Vutla           2019-08-09  1464  	main_gpio1: gpio@601000 {
248f3eae99485b Lokesh Vutla           2019-08-09  1465  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
248f3eae99485b Lokesh Vutla           2019-08-09  1466  		reg = <0x0 0x00601000 0x0 0x100>;
248f3eae99485b Lokesh Vutla           2019-08-09  1467  		gpio-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1468  		#gpio-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1469  		interrupt-parent = <&main_gpio_intr>;
8d523f096da535 Lokesh Vutla           2020-08-06  1470  		interrupts = <288>, <289>, <290>;
248f3eae99485b Lokesh Vutla           2019-08-09  1471  		interrupt-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1472  		#interrupt-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1473  		ti,ngpio = <36>;
248f3eae99485b Lokesh Vutla           2019-08-09  1474  		ti,davinci-gpio-unbanked = <0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1475  		power-domains = <&k3_pds 106 TI_SCI_PD_EXCLUSIVE>;
248f3eae99485b Lokesh Vutla           2019-08-09  1476  		clocks = <&k3_clks 106 0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1477  		clock-names = "gpio";
8757108b59e149 Andrew Davis           2023-08-09  1478  		status = "disabled";
248f3eae99485b Lokesh Vutla           2019-08-09  1479  	};
248f3eae99485b Lokesh Vutla           2019-08-09  1480  
248f3eae99485b Lokesh Vutla           2019-08-09  1481  	main_gpio2: gpio@610000 {
248f3eae99485b Lokesh Vutla           2019-08-09  1482  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
248f3eae99485b Lokesh Vutla           2019-08-09  1483  		reg = <0x0 0x00610000 0x0 0x100>;
248f3eae99485b Lokesh Vutla           2019-08-09  1484  		gpio-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1485  		#gpio-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1486  		interrupt-parent = <&main_gpio_intr>;
8d523f096da535 Lokesh Vutla           2020-08-06  1487  		interrupts = <264>, <265>, <266>, <267>,
8d523f096da535 Lokesh Vutla           2020-08-06  1488  			     <268>, <269>, <270>, <271>;
248f3eae99485b Lokesh Vutla           2019-08-09  1489  		interrupt-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1490  		#interrupt-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1491  		ti,ngpio = <128>;
248f3eae99485b Lokesh Vutla           2019-08-09  1492  		ti,davinci-gpio-unbanked = <0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1493  		power-domains = <&k3_pds 107 TI_SCI_PD_EXCLUSIVE>;
248f3eae99485b Lokesh Vutla           2019-08-09  1494  		clocks = <&k3_clks 107 0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1495  		clock-names = "gpio";
8757108b59e149 Andrew Davis           2023-08-09  1496  		status = "disabled";
248f3eae99485b Lokesh Vutla           2019-08-09  1497  	};
248f3eae99485b Lokesh Vutla           2019-08-09  1498  
248f3eae99485b Lokesh Vutla           2019-08-09  1499  	main_gpio3: gpio@611000 {
248f3eae99485b Lokesh Vutla           2019-08-09  1500  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
248f3eae99485b Lokesh Vutla           2019-08-09  1501  		reg = <0x0 0x00611000 0x0 0x100>;
248f3eae99485b Lokesh Vutla           2019-08-09  1502  		gpio-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1503  		#gpio-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1504  		interrupt-parent = <&main_gpio_intr>;
8d523f096da535 Lokesh Vutla           2020-08-06  1505  		interrupts = <292>, <293>, <294>;
248f3eae99485b Lokesh Vutla           2019-08-09  1506  		interrupt-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1507  		#interrupt-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1508  		ti,ngpio = <36>;
248f3eae99485b Lokesh Vutla           2019-08-09  1509  		ti,davinci-gpio-unbanked = <0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1510  		power-domains = <&k3_pds 108 TI_SCI_PD_EXCLUSIVE>;
248f3eae99485b Lokesh Vutla           2019-08-09  1511  		clocks = <&k3_clks 108 0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1512  		clock-names = "gpio";
8757108b59e149 Andrew Davis           2023-08-09  1513  		status = "disabled";
248f3eae99485b Lokesh Vutla           2019-08-09  1514  	};
248f3eae99485b Lokesh Vutla           2019-08-09  1515  
248f3eae99485b Lokesh Vutla           2019-08-09  1516  	main_gpio4: gpio@620000 {
248f3eae99485b Lokesh Vutla           2019-08-09  1517  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
248f3eae99485b Lokesh Vutla           2019-08-09  1518  		reg = <0x0 0x00620000 0x0 0x100>;
248f3eae99485b Lokesh Vutla           2019-08-09  1519  		gpio-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1520  		#gpio-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1521  		interrupt-parent = <&main_gpio_intr>;
8d523f096da535 Lokesh Vutla           2020-08-06  1522  		interrupts = <272>, <273>, <274>, <275>,
8d523f096da535 Lokesh Vutla           2020-08-06  1523  			     <276>, <277>, <278>, <279>;
248f3eae99485b Lokesh Vutla           2019-08-09  1524  		interrupt-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1525  		#interrupt-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1526  		ti,ngpio = <128>;
248f3eae99485b Lokesh Vutla           2019-08-09  1527  		ti,davinci-gpio-unbanked = <0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1528  		power-domains = <&k3_pds 109 TI_SCI_PD_EXCLUSIVE>;
248f3eae99485b Lokesh Vutla           2019-08-09  1529  		clocks = <&k3_clks 109 0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1530  		clock-names = "gpio";
8757108b59e149 Andrew Davis           2023-08-09  1531  		status = "disabled";
248f3eae99485b Lokesh Vutla           2019-08-09  1532  	};
248f3eae99485b Lokesh Vutla           2019-08-09  1533  
248f3eae99485b Lokesh Vutla           2019-08-09  1534  	main_gpio5: gpio@621000 {
248f3eae99485b Lokesh Vutla           2019-08-09  1535  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
248f3eae99485b Lokesh Vutla           2019-08-09  1536  		reg = <0x0 0x00621000 0x0 0x100>;
248f3eae99485b Lokesh Vutla           2019-08-09  1537  		gpio-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1538  		#gpio-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1539  		interrupt-parent = <&main_gpio_intr>;
8d523f096da535 Lokesh Vutla           2020-08-06  1540  		interrupts = <296>, <297>, <298>;
248f3eae99485b Lokesh Vutla           2019-08-09  1541  		interrupt-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1542  		#interrupt-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1543  		ti,ngpio = <36>;
248f3eae99485b Lokesh Vutla           2019-08-09  1544  		ti,davinci-gpio-unbanked = <0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1545  		power-domains = <&k3_pds 110 TI_SCI_PD_EXCLUSIVE>;
248f3eae99485b Lokesh Vutla           2019-08-09  1546  		clocks = <&k3_clks 110 0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1547  		clock-names = "gpio";
8757108b59e149 Andrew Davis           2023-08-09  1548  		status = "disabled";
248f3eae99485b Lokesh Vutla           2019-08-09  1549  	};
248f3eae99485b Lokesh Vutla           2019-08-09  1550  
248f3eae99485b Lokesh Vutla           2019-08-09  1551  	main_gpio6: gpio@630000 {
248f3eae99485b Lokesh Vutla           2019-08-09  1552  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
248f3eae99485b Lokesh Vutla           2019-08-09  1553  		reg = <0x0 0x00630000 0x0 0x100>;
248f3eae99485b Lokesh Vutla           2019-08-09  1554  		gpio-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1555  		#gpio-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1556  		interrupt-parent = <&main_gpio_intr>;
8d523f096da535 Lokesh Vutla           2020-08-06  1557  		interrupts = <280>, <281>, <282>, <283>,
8d523f096da535 Lokesh Vutla           2020-08-06  1558  			     <284>, <285>, <286>, <287>;
248f3eae99485b Lokesh Vutla           2019-08-09  1559  		interrupt-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1560  		#interrupt-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1561  		ti,ngpio = <128>;
248f3eae99485b Lokesh Vutla           2019-08-09  1562  		ti,davinci-gpio-unbanked = <0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1563  		power-domains = <&k3_pds 111 TI_SCI_PD_EXCLUSIVE>;
248f3eae99485b Lokesh Vutla           2019-08-09  1564  		clocks = <&k3_clks 111 0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1565  		clock-names = "gpio";
8757108b59e149 Andrew Davis           2023-08-09  1566  		status = "disabled";
248f3eae99485b Lokesh Vutla           2019-08-09  1567  	};
248f3eae99485b Lokesh Vutla           2019-08-09  1568  
248f3eae99485b Lokesh Vutla           2019-08-09  1569  	main_gpio7: gpio@631000 {
248f3eae99485b Lokesh Vutla           2019-08-09  1570  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
248f3eae99485b Lokesh Vutla           2019-08-09  1571  		reg = <0x0 0x00631000 0x0 0x100>;
248f3eae99485b Lokesh Vutla           2019-08-09  1572  		gpio-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1573  		#gpio-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1574  		interrupt-parent = <&main_gpio_intr>;
8d523f096da535 Lokesh Vutla           2020-08-06  1575  		interrupts = <300>, <301>, <302>;
248f3eae99485b Lokesh Vutla           2019-08-09  1576  		interrupt-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1577  		#interrupt-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1578  		ti,ngpio = <36>;
248f3eae99485b Lokesh Vutla           2019-08-09  1579  		ti,davinci-gpio-unbanked = <0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1580  		power-domains = <&k3_pds 112 TI_SCI_PD_EXCLUSIVE>;
248f3eae99485b Lokesh Vutla           2019-08-09  1581  		clocks = <&k3_clks 112 0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1582  		clock-names = "gpio";
8757108b59e149 Andrew Davis           2023-08-09  1583  		status = "disabled";
248f3eae99485b Lokesh Vutla           2019-08-09  1584  	};
e6dc10f200dae6 Faiz Abbas             2019-09-19  1585  
0cf73209ce2c60 Grygorii Strashko      2021-01-15  1586  	main_sdhci0: mmc@4f80000 {
e6dc10f200dae6 Faiz Abbas             2019-09-19  1587  		compatible = "ti,j721e-sdhci-8bit";
e6dc10f200dae6 Faiz Abbas             2019-09-19  1588  		reg = <0x0 0x4f80000 0x0 0x1000>, <0x0 0x4f88000 0x0 0x400>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1589  		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1590  		power-domains = <&k3_pds 91 TI_SCI_PD_EXCLUSIVE>;
0cf73209ce2c60 Grygorii Strashko      2021-01-15  1591  		clock-names = "clk_ahb", "clk_xin";
0cf73209ce2c60 Grygorii Strashko      2021-01-15  1592  		clocks = <&k3_clks 91 0>, <&k3_clks 91 1>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1593  		assigned-clocks = <&k3_clks 91 1>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1594  		assigned-clock-parents = <&k3_clks 91 2>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1595  		bus-width = <8>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1596  		mmc-hs200-1_8v;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1597  		mmc-ddr-1_8v;
af398252d68edb Bhavya Kapoor          2023-04-24  1598  		ti,otap-del-sel-legacy = <0x0>;
af398252d68edb Bhavya Kapoor          2023-04-24  1599  		ti,otap-del-sel-mmc-hs = <0x0>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1600  		ti,otap-del-sel-ddr52 = <0x5>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1601  		ti,otap-del-sel-hs200 = <0x6>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1602  		ti,otap-del-sel-hs400 = <0x0>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1603  		ti,itap-del-sel-legacy = <0x10>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1604  		ti,itap-del-sel-mmc-hs = <0xa>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1605  		ti,itap-del-sel-ddr52 = <0x3>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1606  		ti,trm-icp = <0x8>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1607  		dma-coherent;
6fbd1310f99fc9 Andrew Davis           2023-08-09  1608  		status = "disabled";
e6dc10f200dae6 Faiz Abbas             2019-09-19  1609  	};
e6dc10f200dae6 Faiz Abbas             2019-09-19  1610  
0cf73209ce2c60 Grygorii Strashko      2021-01-15  1611  	main_sdhci1: mmc@4fb0000 {
e6dc10f200dae6 Faiz Abbas             2019-09-19  1612  		compatible = "ti,j721e-sdhci-4bit";
e6dc10f200dae6 Faiz Abbas             2019-09-19  1613  		reg = <0x0 0x04fb0000 0x0 0x1000>, <0x0 0x4fb8000 0x0 0x400>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1614  		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1615  		power-domains = <&k3_pds 92 TI_SCI_PD_EXCLUSIVE>;
0cf73209ce2c60 Grygorii Strashko      2021-01-15  1616  		clock-names = "clk_ahb", "clk_xin";
0cf73209ce2c60 Grygorii Strashko      2021-01-15  1617  		clocks = <&k3_clks 92 5>, <&k3_clks 92 0>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1618  		assigned-clocks = <&k3_clks 92 0>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1619  		assigned-clock-parents = <&k3_clks 92 1>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1620  		ti,otap-del-sel-legacy = <0x0>;
af398252d68edb Bhavya Kapoor          2023-04-24  1621  		ti,otap-del-sel-sd-hs = <0x0>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1622  		ti,otap-del-sel-sdr12 = <0xf>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1623  		ti,otap-del-sel-sdr25 = <0xf>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1624  		ti,otap-del-sel-sdr50 = <0xc>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1625  		ti,otap-del-sel-ddr50 = <0xc>;
af398252d68edb Bhavya Kapoor          2023-04-24  1626  		ti,otap-del-sel-sdr104 = <0x5>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1627  		ti,itap-del-sel-legacy = <0x0>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1628  		ti,itap-del-sel-sd-hs = <0x0>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1629  		ti,itap-del-sel-sdr12 = <0x0>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1630  		ti,itap-del-sel-sdr25 = <0x0>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1631  		ti,itap-del-sel-ddr50 = <0x2>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1632  		ti,trm-icp = <0x8>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1633  		ti,clkbuf-sel = <0x7>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1634  		dma-coherent;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1635  		sdhci-caps-mask = <0x2 0x0>;
6fbd1310f99fc9 Andrew Davis           2023-08-09  1636  		status = "disabled";
e6dc10f200dae6 Faiz Abbas             2019-09-19  1637  	};
e6dc10f200dae6 Faiz Abbas             2019-09-19  1638  
0cf73209ce2c60 Grygorii Strashko      2021-01-15  1639  	main_sdhci2: mmc@4f98000 {
e6dc10f200dae6 Faiz Abbas             2019-09-19  1640  		compatible = "ti,j721e-sdhci-4bit";
e6dc10f200dae6 Faiz Abbas             2019-09-19  1641  		reg = <0x0 0x4f98000 0x0 0x1000>, <0x0 0x4f90000 0x0 0x400>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1642  		interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1643  		power-domains = <&k3_pds 93 TI_SCI_PD_EXCLUSIVE>;
0cf73209ce2c60 Grygorii Strashko      2021-01-15  1644  		clock-names = "clk_ahb", "clk_xin";
0cf73209ce2c60 Grygorii Strashko      2021-01-15  1645  		clocks = <&k3_clks 93 5>, <&k3_clks 93 0>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1646  		assigned-clocks = <&k3_clks 93 0>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1647  		assigned-clock-parents = <&k3_clks 93 1>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1648  		ti,otap-del-sel-legacy = <0x0>;
af398252d68edb Bhavya Kapoor          2023-04-24  1649  		ti,otap-del-sel-sd-hs = <0x0>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1650  		ti,otap-del-sel-sdr12 = <0xf>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1651  		ti,otap-del-sel-sdr25 = <0xf>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1652  		ti,otap-del-sel-sdr50 = <0xc>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1653  		ti,otap-del-sel-ddr50 = <0xc>;
af398252d68edb Bhavya Kapoor          2023-04-24  1654  		ti,otap-del-sel-sdr104 = <0x5>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1655  		ti,itap-del-sel-legacy = <0x0>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1656  		ti,itap-del-sel-sd-hs = <0x0>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1657  		ti,itap-del-sel-sdr12 = <0x0>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1658  		ti,itap-del-sel-sdr25 = <0x0>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1659  		ti,itap-del-sel-ddr50 = <0x2>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1660  		ti,trm-icp = <0x8>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1661  		ti,clkbuf-sel = <0x7>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1662  		dma-coherent;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1663  		sdhci-caps-mask = <0x2 0x0>;
6fbd1310f99fc9 Andrew Davis           2023-08-09  1664  		status = "disabled";
e6dc10f200dae6 Faiz Abbas             2019-09-19  1665  	};
451555c80bc665 Roger Quadros          2019-10-28  1666  
e5c956c4f36cdd Nishanth Menon         2020-09-03  1667  	usbss0: cdns-usb@4104000 {
451555c80bc665 Roger Quadros          2019-10-28  1668  		compatible = "ti,j721e-usb";
451555c80bc665 Roger Quadros          2019-10-28  1669  		reg = <0x00 0x4104000 0x00 0x100>;
451555c80bc665 Roger Quadros          2019-10-28  1670  		dma-coherent;
451555c80bc665 Roger Quadros          2019-10-28  1671  		power-domains = <&k3_pds 288 TI_SCI_PD_EXCLUSIVE>;
451555c80bc665 Roger Quadros          2019-10-28  1672  		clocks = <&k3_clks 288 15>, <&k3_clks 288 3>;
451555c80bc665 Roger Quadros          2019-10-28  1673  		clock-names = "ref", "lpm";
451555c80bc665 Roger Quadros          2019-10-28  1674  		assigned-clocks = <&k3_clks 288 15>;	/* USB2_REFCLK */
451555c80bc665 Roger Quadros          2019-10-28  1675  		assigned-clock-parents = <&k3_clks 288 16>; /* HFOSC0 */
451555c80bc665 Roger Quadros          2019-10-28  1676  		#address-cells = <2>;
451555c80bc665 Roger Quadros          2019-10-28  1677  		#size-cells = <2>;
451555c80bc665 Roger Quadros          2019-10-28  1678  		ranges;
451555c80bc665 Roger Quadros          2019-10-28  1679  
451555c80bc665 Roger Quadros          2019-10-28  1680  		usb0: usb@6000000 {
451555c80bc665 Roger Quadros          2019-10-28  1681  			compatible = "cdns,usb3";
451555c80bc665 Roger Quadros          2019-10-28  1682  			reg = <0x00 0x6000000 0x00 0x10000>,
451555c80bc665 Roger Quadros          2019-10-28  1683  			      <0x00 0x6010000 0x00 0x10000>,
451555c80bc665 Roger Quadros          2019-10-28  1684  			      <0x00 0x6020000 0x00 0x10000>;
451555c80bc665 Roger Quadros          2019-10-28  1685  			reg-names = "otg", "xhci", "dev";
451555c80bc665 Roger Quadros          2019-10-28  1686  			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,	/* irq.0 */
451555c80bc665 Roger Quadros          2019-10-28  1687  				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,	/* irq.6 */
451555c80bc665 Roger Quadros          2019-10-28  1688  				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;	/* otgirq.0 */
451555c80bc665 Roger Quadros          2019-10-28  1689  			interrupt-names = "host",
451555c80bc665 Roger Quadros          2019-10-28  1690  					  "peripheral",
451555c80bc665 Roger Quadros          2019-10-28  1691  					  "otg";
451555c80bc665 Roger Quadros          2019-10-28  1692  			maximum-speed = "super-speed";
451555c80bc665 Roger Quadros          2019-10-28  1693  			dr_mode = "otg";
451555c80bc665 Roger Quadros          2019-10-28  1694  		};
451555c80bc665 Roger Quadros          2019-10-28  1695  	};
451555c80bc665 Roger Quadros          2019-10-28  1696  
e5c956c4f36cdd Nishanth Menon         2020-09-03  1697  	usbss1: cdns-usb@4114000 {
451555c80bc665 Roger Quadros          2019-10-28  1698  		compatible = "ti,j721e-usb";
451555c80bc665 Roger Quadros          2019-10-28  1699  		reg = <0x00 0x4114000 0x00 0x100>;
451555c80bc665 Roger Quadros          2019-10-28  1700  		dma-coherent;
451555c80bc665 Roger Quadros          2019-10-28  1701  		power-domains = <&k3_pds 289 TI_SCI_PD_EXCLUSIVE>;
451555c80bc665 Roger Quadros          2019-10-28  1702  		clocks = <&k3_clks 289 15>, <&k3_clks 289 3>;
451555c80bc665 Roger Quadros          2019-10-28  1703  		clock-names = "ref", "lpm";
451555c80bc665 Roger Quadros          2019-10-28  1704  		assigned-clocks = <&k3_clks 289 15>;	/* USB2_REFCLK */
451555c80bc665 Roger Quadros          2019-10-28  1705  		assigned-clock-parents = <&k3_clks 289 16>; /* HFOSC0 */
451555c80bc665 Roger Quadros          2019-10-28  1706  		#address-cells = <2>;
451555c80bc665 Roger Quadros          2019-10-28  1707  		#size-cells = <2>;
451555c80bc665 Roger Quadros          2019-10-28  1708  		ranges;
451555c80bc665 Roger Quadros          2019-10-28  1709  
451555c80bc665 Roger Quadros          2019-10-28  1710  		usb1: usb@6400000 {
451555c80bc665 Roger Quadros          2019-10-28  1711  			compatible = "cdns,usb3";
451555c80bc665 Roger Quadros          2019-10-28  1712  			reg = <0x00 0x6400000 0x00 0x10000>,
451555c80bc665 Roger Quadros          2019-10-28  1713  			      <0x00 0x6410000 0x00 0x10000>,
451555c80bc665 Roger Quadros          2019-10-28  1714  			      <0x00 0x6420000 0x00 0x10000>;
451555c80bc665 Roger Quadros          2019-10-28  1715  			reg-names = "otg", "xhci", "dev";
451555c80bc665 Roger Quadros          2019-10-28  1716  			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,	/* irq.0 */
451555c80bc665 Roger Quadros          2019-10-28  1717  				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,	/* irq.6 */
451555c80bc665 Roger Quadros          2019-10-28  1718  				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;	/* otgirq.0 */
451555c80bc665 Roger Quadros          2019-10-28  1719  			interrupt-names = "host",
451555c80bc665 Roger Quadros          2019-10-28  1720  					  "peripheral",
451555c80bc665 Roger Quadros          2019-10-28  1721  					  "otg";
451555c80bc665 Roger Quadros          2019-10-28  1722  			maximum-speed = "super-speed";
451555c80bc665 Roger Quadros          2019-10-28  1723  			dr_mode = "otg";
451555c80bc665 Roger Quadros          2019-10-28  1724  		};
451555c80bc665 Roger Quadros          2019-10-28  1725  	};
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1726  
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1727  	main_i2c0: i2c@2000000 {
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1728  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1729  		reg = <0x0 0x2000000 0x0 0x100>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1730  		interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1731  		#address-cells = <1>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1732  		#size-cells = <0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1733  		clock-names = "fck";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1734  		clocks = <&k3_clks 187 0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1735  		power-domains = <&k3_pds 187 TI_SCI_PD_SHARED>;
282c4ad3b8c1da Andrew Davis           2022-10-20  1736  		status = "disabled";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1737  	};
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1738  
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1739  	main_i2c1: i2c@2010000 {
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1740  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1741  		reg = <0x0 0x2010000 0x0 0x100>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1742  		interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1743  		#address-cells = <1>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1744  		#size-cells = <0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1745  		clock-names = "fck";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1746  		clocks = <&k3_clks 188 0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1747  		power-domains = <&k3_pds 188 TI_SCI_PD_EXCLUSIVE>;
282c4ad3b8c1da Andrew Davis           2022-10-20  1748  		status = "disabled";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1749  	};
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1750  
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1751  	main_i2c2: i2c@2020000 {
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1752  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1753  		reg = <0x0 0x2020000 0x0 0x100>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1754  		interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1755  		#address-cells = <1>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1756  		#size-cells = <0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1757  		clock-names = "fck";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1758  		clocks = <&k3_clks 189 0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1759  		power-domains = <&k3_pds 189 TI_SCI_PD_EXCLUSIVE>;
282c4ad3b8c1da Andrew Davis           2022-10-20  1760  		status = "disabled";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1761  	};
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1762  
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1763  	main_i2c3: i2c@2030000 {
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1764  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1765  		reg = <0x0 0x2030000 0x0 0x100>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1766  		interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1767  		#address-cells = <1>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1768  		#size-cells = <0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1769  		clock-names = "fck";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1770  		clocks = <&k3_clks 190 0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1771  		power-domains = <&k3_pds 190 TI_SCI_PD_EXCLUSIVE>;
282c4ad3b8c1da Andrew Davis           2022-10-20  1772  		status = "disabled";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1773  	};
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1774  
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1775  	main_i2c4: i2c@2040000 {
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1776  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1777  		reg = <0x0 0x2040000 0x0 0x100>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1778  		interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1779  		#address-cells = <1>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1780  		#size-cells = <0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1781  		clock-names = "fck";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1782  		clocks = <&k3_clks 191 0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1783  		power-domains = <&k3_pds 191 TI_SCI_PD_EXCLUSIVE>;
282c4ad3b8c1da Andrew Davis           2022-10-20  1784  		status = "disabled";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1785  	};
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1786  
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1787  	main_i2c5: i2c@2050000 {
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1788  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1789  		reg = <0x0 0x2050000 0x0 0x100>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1790  		interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1791  		#address-cells = <1>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1792  		#size-cells = <0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1793  		clock-names = "fck";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1794  		clocks = <&k3_clks 192 0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1795  		power-domains = <&k3_pds 192 TI_SCI_PD_EXCLUSIVE>;
282c4ad3b8c1da Andrew Davis           2022-10-20  1796  		status = "disabled";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1797  	};
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1798  
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1799  	main_i2c6: i2c@2060000 {
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1800  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1801  		reg = <0x0 0x2060000 0x0 0x100>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1802  		interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1803  		#address-cells = <1>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1804  		#size-cells = <0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1805  		clock-names = "fck";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1806  		clocks = <&k3_clks 193 0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1807  		power-domains = <&k3_pds 193 TI_SCI_PD_EXCLUSIVE>;
282c4ad3b8c1da Andrew Davis           2022-10-20  1808  		status = "disabled";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1809  	};
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1810  
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1811  	ufs_wrapper: ufs-wrapper@4e80000 {
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1812  		compatible = "ti,j721e-ufs";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1813  		reg = <0x0 0x4e80000 0x0 0x100>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1814  		power-domains = <&k3_pds 277 TI_SCI_PD_EXCLUSIVE>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1815  		clocks = <&k3_clks 277 1>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1816  		assigned-clocks = <&k3_clks 277 1>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1817  		assigned-clock-parents = <&k3_clks 277 4>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1818  		ranges;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1819  		#address-cells = <2>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1820  		#size-cells = <2>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1821  
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1822  		ufs@4e84000 {
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1823  			compatible = "cdns,ufshc-m31-16nm", "jedec,ufs-2.0";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1824  			reg = <0x0 0x4e84000 0x0 0x10000>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1825  			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1826  			freq-table-hz = <250000000 250000000>, <19200000 19200000>, <19200000 19200000>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1827  			clocks = <&k3_clks 277 0>, <&k3_clks 277 1>, <&k3_clks 277 1>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1828  			clock-names = "core_clk", "phy_clk", "ref_clk";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1829  			dma-coherent;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1830  		};
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1831  	};
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1832  
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1833  	mhdp: dp-bridge@a000000 {
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1834  		compatible = "ti,j721e-mhdp8546";
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1835  		/*
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1836  		 * Note: we do not map DPTX PHY area, as that is handled by
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1837  		 * the PHY driver.
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1838  		 */
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1839  		reg = <0x00 0x0a000000 0x00 0x030a00>, /* DSS_EDP0_V2A_CORE_VP_REGS_APB */
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1840  		      <0x00 0x04f40000 0x00 0x20>;    /* DSS_EDP0_INTG_CFG_VP */
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1841  		reg-names = "mhdptx", "j721e-intg";
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1842  
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1843  		clocks = <&k3_clks 151 36>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1844  
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1845  		interrupt-parent = <&gic500>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1846  		interrupts = <GIC_SPI 614 IRQ_TYPE_LEVEL_HIGH>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1847  
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1848  		power-domains = <&k3_pds 151 TI_SCI_PD_EXCLUSIVE>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1849  
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1850  		dp0_ports: ports {
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1851  			#address-cells = <1>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1852  			#size-cells = <0>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1853  
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1854  			port@0 {
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1855  			    reg = <0>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1856  			};
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1857  
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1858  			port@4 {
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1859  			    reg = <4>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1860  			};
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1861  		};
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1862  	};
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1863  
cfbf17e69ae82f Nishanth Menon         2020-11-04  1864  	dss: dss@4a00000 {
76921f15acc075 Tomi Valkeinen         2020-04-22  1865  		compatible = "ti,j721e-dss";
76921f15acc075 Tomi Valkeinen         2020-04-22  1866  		reg =
76921f15acc075 Tomi Valkeinen         2020-04-22  1867  			<0x00 0x04a00000 0x00 0x10000>, /* common_m */
76921f15acc075 Tomi Valkeinen         2020-04-22  1868  			<0x00 0x04a10000 0x00 0x10000>, /* common_s0*/
76921f15acc075 Tomi Valkeinen         2020-04-22  1869  			<0x00 0x04b00000 0x00 0x10000>, /* common_s1*/
76921f15acc075 Tomi Valkeinen         2020-04-22  1870  			<0x00 0x04b10000 0x00 0x10000>, /* common_s2*/
76921f15acc075 Tomi Valkeinen         2020-04-22  1871  
76921f15acc075 Tomi Valkeinen         2020-04-22  1872  			<0x00 0x04a20000 0x00 0x10000>, /* vidl1 */
76921f15acc075 Tomi Valkeinen         2020-04-22  1873  			<0x00 0x04a30000 0x00 0x10000>, /* vidl2 */
76921f15acc075 Tomi Valkeinen         2020-04-22  1874  			<0x00 0x04a50000 0x00 0x10000>, /* vid1 */
76921f15acc075 Tomi Valkeinen         2020-04-22  1875  			<0x00 0x04a60000 0x00 0x10000>, /* vid2 */
76921f15acc075 Tomi Valkeinen         2020-04-22  1876  
76921f15acc075 Tomi Valkeinen         2020-04-22  1877  			<0x00 0x04a70000 0x00 0x10000>, /* ovr1 */
76921f15acc075 Tomi Valkeinen         2020-04-22  1878  			<0x00 0x04a90000 0x00 0x10000>, /* ovr2 */
76921f15acc075 Tomi Valkeinen         2020-04-22  1879  			<0x00 0x04ab0000 0x00 0x10000>, /* ovr3 */
76921f15acc075 Tomi Valkeinen         2020-04-22  1880  			<0x00 0x04ad0000 0x00 0x10000>, /* ovr4 */
76921f15acc075 Tomi Valkeinen         2020-04-22  1881  
76921f15acc075 Tomi Valkeinen         2020-04-22  1882  			<0x00 0x04a80000 0x00 0x10000>, /* vp1 */
76921f15acc075 Tomi Valkeinen         2020-04-22  1883  			<0x00 0x04aa0000 0x00 0x10000>, /* vp2 */
76921f15acc075 Tomi Valkeinen         2020-04-22  1884  			<0x00 0x04ac0000 0x00 0x10000>, /* vp3 */
76921f15acc075 Tomi Valkeinen         2020-04-22  1885  			<0x00 0x04ae0000 0x00 0x10000>, /* vp4 */
76921f15acc075 Tomi Valkeinen         2020-04-22  1886  			<0x00 0x04af0000 0x00 0x10000>; /* wb */
76921f15acc075 Tomi Valkeinen         2020-04-22  1887  
76921f15acc075 Tomi Valkeinen         2020-04-22  1888  		reg-names = "common_m", "common_s0",
76921f15acc075 Tomi Valkeinen         2020-04-22  1889  			"common_s1", "common_s2",
76921f15acc075 Tomi Valkeinen         2020-04-22  1890  			"vidl1", "vidl2","vid1","vid2",
76921f15acc075 Tomi Valkeinen         2020-04-22  1891  			"ovr1", "ovr2", "ovr3", "ovr4",
76921f15acc075 Tomi Valkeinen         2020-04-22  1892  			"vp1", "vp2", "vp3", "vp4",
76921f15acc075 Tomi Valkeinen         2020-04-22  1893  			"wb";
76921f15acc075 Tomi Valkeinen         2020-04-22  1894  
76921f15acc075 Tomi Valkeinen         2020-04-22  1895  		clocks = <&k3_clks 152 0>,
76921f15acc075 Tomi Valkeinen         2020-04-22  1896  			 <&k3_clks 152 1>,
76921f15acc075 Tomi Valkeinen         2020-04-22  1897  			 <&k3_clks 152 4>,
76921f15acc075 Tomi Valkeinen         2020-04-22  1898  			 <&k3_clks 152 9>,
76921f15acc075 Tomi Valkeinen         2020-04-22  1899  			 <&k3_clks 152 13>;
76921f15acc075 Tomi Valkeinen         2020-04-22  1900  		clock-names = "fck", "vp1", "vp2", "vp3", "vp4";
76921f15acc075 Tomi Valkeinen         2020-04-22  1901  
76921f15acc075 Tomi Valkeinen         2020-04-22  1902  		power-domains = <&k3_pds 152 TI_SCI_PD_EXCLUSIVE>;
76921f15acc075 Tomi Valkeinen         2020-04-22  1903  
76921f15acc075 Tomi Valkeinen         2020-04-22  1904  		interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>,
76921f15acc075 Tomi Valkeinen         2020-04-22  1905  			     <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>,
76921f15acc075 Tomi Valkeinen         2020-04-22  1906  			     <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
76921f15acc075 Tomi Valkeinen         2020-04-22  1907  			     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
76921f15acc075 Tomi Valkeinen         2020-04-22  1908  		interrupt-names = "common_m",
76921f15acc075 Tomi Valkeinen         2020-04-22  1909  				  "common_s0",
76921f15acc075 Tomi Valkeinen         2020-04-22  1910  				  "common_s1",
76921f15acc075 Tomi Valkeinen         2020-04-22  1911  				  "common_s2";
76921f15acc075 Tomi Valkeinen         2020-04-22  1912  
76921f15acc075 Tomi Valkeinen         2020-04-22 @1913  		dss_ports: ports {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
