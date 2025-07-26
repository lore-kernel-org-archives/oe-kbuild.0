Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3E923BF8F
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Jul 2025 11:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753528245; cv=none; b=fsgDyz63+iAa9hoSjHZazJovffaEVAfx81y/OUIaCTvQoeNoJ1MEgr2C/rdeD8+ACRt4AsLR7q6pV5716vkkrDPV1HNtnyn4Vg4gAhQY0WZsAonKkOfT4sdOD5iD46I8ZtMAiWz68DJpYR80KHXXSGiFdehADGhRdJJ0yFANcEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753528245; c=relaxed/simple;
	bh=zpxRZMw9rB/5fFeIWws28JfSeA4HvOsIJJ7lOh4MnwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BU3hyVXF0MGpH2W/gKRFP0TiRgGu6+nh+y9sspuilRmnNfLJLJydQtAB/oHg4VfDYRNJLJZROARSMrRMqN9P8ddFHJqleZN+W5FpDst0okfTMIhCVWwHYsu7Inm/84DIT0X8SHnEBy/k4PJyIdMYtwbVWwJcYM8zRP3OixOmZIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jvHb2mII; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jvHb2mII"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753528233; x=1785064233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zpxRZMw9rB/5fFeIWws28JfSeA4HvOsIJJ7lOh4MnwY=;
  b=jvHb2mIIzjMu2mp+wqdYUqIZHzQCNqI2EqV7j0Iiizj0zyeHmbH7KZmi
   kdnOLPM3IZllAfLSEmE9jokoseL5D44ahegC+HJL4A6m5hmg0n+nWgpyB
   uVvl8fh8BMtUceae2xs2hy6K8MDU7LqVHBlhcimq62GJlmlJ+XT2ysoLP
   qHMYuTuJSxAjE43WXXZOPbOJnm5TZWAgoX7tCeb/asrSaadzYXc0+A8rp
   fJeTBv4CZGwppH3dlROj79v7Imb+JeIFTMwXUGFuNlcLQKIaAX7yMcgxo
   PPXtXiK5JSE7GYgi/rC5VMKFemDCtkHSgSdPikaNLsQlLneP3xHB5VBpS
   A==;
X-CSE-ConnectionGUID: GfunYf/ATvOA1Bui7qKGCg==
X-CSE-MsgGUID: GhWekNqhQne0JX5vg9EB8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55057926"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55057926"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 04:10:32 -0700
X-CSE-ConnectionGUID: /0Ca8EkZTv61iU6+77ZQHg==
X-CSE-MsgGUID: 2YBkNWWgQfCzCOemNK+Mww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="192442302"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Jul 2025 04:10:30 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufcnM-000Luw-0S;
	Sat, 26 Jul 2025 11:10:28 +0000
Date: Sat, 26 Jul 2025 19:10:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Flatten primary usb
 controller node
Message-ID: <202507261801.sCnXaB7H-lkp@intel.com>
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
In-Reply-To: <20250725050216.526327-1-krishna.kurapati@oss.qualcomm.com>
References: <20250725050216.526327-1-krishna.kurapati@oss.qualcomm.com>
TO: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: cros-qcom-dts-watchers@chromium.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Hi Krishna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Kurapati/arm64-dts-qcom-sc7280-Flatten-primary-usb-controller-node/20250725-130452
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250725050216.526327-1-krishna.kurapati%40oss.qualcomm.com
patch subject: [PATCH v2] arm64: dts: qcom: sc7280: Flatten primary usb controller node
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm64-randconfig-004-20250726 (https://download.01.org/0day-ci/archive/20250726/202507261801.sCnXaB7H-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261801.sCnXaB7H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507261801.sCnXaB7H-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sc7280.dtsi:4247.22-4320.5: Warning (simple_bus_reg): /soc@0/usb@a6f8800: simple-bus unit address format error, expected "a600000"
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4802.26-4875.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:154.29-157.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sc7280.dtsi:4247.22-4320.5: Warning (simple_bus_reg): /soc@0/usb@a6f8800: simple-bus unit address format error, expected "a600000"
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4802.26-4875.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sc7280.dtsi:4247.22-4320.5: Warning (simple_bus_reg): /soc@0/usb@a6f8800: simple-bus unit address format error, expected "a600000"
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4802.26-4875.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:154.29-157.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sc7280.dtsi:4247.22-4320.5: Warning (simple_bus_reg): /soc@0/usb@a6f8800: simple-bus unit address format error, expected "a600000"
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sc7280.dtsi:4247.22-4320.5: Warning (simple_bus_reg): /soc@0/usb@a6f8800: simple-bus unit address format error, expected "a600000"
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4802.26-4875.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sc7280.dtsi:4247.22-4320.5: Warning (simple_bus_reg): /soc@0/usb@a6f8800: simple-bus unit address format error, expected "a600000"
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sc7280.dtsi:4247.22-4320.5: Warning (simple_bus_reg): /soc@0/usb@a6f8800: simple-bus unit address format error, expected "a600000"
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +/a600000 +4247 arch/arm64/boot/dts/qcom/sc7280.dtsi

7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    33  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    34  / {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    35  	interrupt-parent = <&intc>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    36  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    37  	#address-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    38  	#size-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    39  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    40  	chosen { };
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    41  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13    42  	aliases {
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    43  		i2c0 = &i2c0;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    44  		i2c1 = &i2c1;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    45  		i2c2 = &i2c2;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    46  		i2c3 = &i2c3;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    47  		i2c4 = &i2c4;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    48  		i2c5 = &i2c5;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    49  		i2c6 = &i2c6;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    50  		i2c7 = &i2c7;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    51  		i2c8 = &i2c8;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    52  		i2c9 = &i2c9;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    53  		i2c10 = &i2c10;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    54  		i2c11 = &i2c11;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    55  		i2c12 = &i2c12;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    56  		i2c13 = &i2c13;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    57  		i2c14 = &i2c14;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    58  		i2c15 = &i2c15;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13    59  		mmc1 = &sdhc_1;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13    60  		mmc2 = &sdhc_2;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    61  		spi0 = &spi0;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    62  		spi1 = &spi1;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    63  		spi2 = &spi2;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    64  		spi3 = &spi3;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    65  		spi4 = &spi4;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    66  		spi5 = &spi5;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    67  		spi6 = &spi6;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    68  		spi7 = &spi7;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    69  		spi8 = &spi8;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    70  		spi9 = &spi9;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    71  		spi10 = &spi10;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    72  		spi11 = &spi11;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    73  		spi12 = &spi12;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    74  		spi13 = &spi13;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    75  		spi14 = &spi14;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    76  		spi15 = &spi15;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13    77  	};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13    78  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    79  	clocks {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    80  		xo_board: xo-board {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    81  			compatible = "fixed-clock";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    82  			clock-frequency = <76800000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    83  			#clock-cells = <0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    84  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    85  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    86  		sleep_clk: sleep-clk {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    87  			compatible = "fixed-clock";
f6ccdca14eac54 Dmitry Baryshkov                 2024-12-24    88  			clock-frequency = <32764>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    89  			#clock-cells = <0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    90  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    91  	};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    92  
3450bb5b9570a2 Maulik Shah                      2021-03-11    93  	reserved-memory {
3450bb5b9570a2 Maulik Shah                      2021-03-11    94  		#address-cells = <2>;
3450bb5b9570a2 Maulik Shah                      2021-03-11    95  		#size-cells = <2>;
3450bb5b9570a2 Maulik Shah                      2021-03-11    96  		ranges;
3450bb5b9570a2 Maulik Shah                      2021-03-11    97  
6615713c10c974 Luca Weiss                       2023-12-08    98  		wlan_ce_mem: wlan-ce@4cd000 {
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06    99  			no-map;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06   100  			reg = <0x0 0x004cd000 0x0 0x1000>;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06   101  		};
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06   102  
6615713c10c974 Luca Weiss                       2023-12-08   103  		hyp_mem: hyp@80000000 {
eca7d3a366b3ab Sibi Sankar                      2021-09-17   104  			reg = <0x0 0x80000000 0x0 0x600000>;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   105  			no-map;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   106  		};
eca7d3a366b3ab Sibi Sankar                      2021-09-17   107  
6615713c10c974 Luca Weiss                       2023-12-08   108  		xbl_mem: xbl@80600000 {
eca7d3a366b3ab Sibi Sankar                      2021-09-17   109  			reg = <0x0 0x80600000 0x0 0x200000>;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   110  			no-map;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   111  		};
eca7d3a366b3ab Sibi Sankar                      2021-09-17   112  
6615713c10c974 Luca Weiss                       2023-12-08   113  		aop_mem: aop@80800000 {
e9d7397467885a Maulik Shah                      2021-03-11   114  			reg = <0x0 0x80800000 0x0 0x60000>;
e9d7397467885a Maulik Shah                      2021-03-11   115  			no-map;
e9d7397467885a Maulik Shah                      2021-03-11   116  		};
e9d7397467885a Maulik Shah                      2021-03-11   117  
6615713c10c974 Luca Weiss                       2023-12-08   118  		aop_cmd_db_mem: aop-cmd-db@80860000 {
3450bb5b9570a2 Maulik Shah                      2021-03-11   119  			reg = <0x0 0x80860000 0x0 0x20000>;
3450bb5b9570a2 Maulik Shah                      2021-03-11   120  			compatible = "qcom,cmd-db";
3450bb5b9570a2 Maulik Shah                      2021-03-11   121  			no-map;
3450bb5b9570a2 Maulik Shah                      2021-03-11   122  		};
e9d7397467885a Maulik Shah                      2021-03-11   123  
6615713c10c974 Luca Weiss                       2023-12-08   124  		reserved_xbl_uefi_log: xbl-uefi-res@80880000 {
eca7d3a366b3ab Sibi Sankar                      2021-09-17   125  			reg = <0x0 0x80884000 0x0 0x10000>;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   126  			no-map;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   127  		};
eca7d3a366b3ab Sibi Sankar                      2021-09-17   128  
6615713c10c974 Luca Weiss                       2023-12-08   129  		sec_apps_mem: sec-apps@808ff000 {
eca7d3a366b3ab Sibi Sankar                      2021-09-17   130  			reg = <0x0 0x808ff000 0x0 0x1000>;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   131  			no-map;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   132  		};
eca7d3a366b3ab Sibi Sankar                      2021-09-17   133  
6615713c10c974 Luca Weiss                       2023-12-08   134  		smem_mem: smem@80900000 {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   135  			reg = <0x0 0x80900000 0x0 0x200000>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   136  			no-map;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   137  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   138  
6615713c10c974 Luca Weiss                       2023-12-08   139  		cpucp_mem: cpucp@80b00000 {
e9d7397467885a Maulik Shah                      2021-03-11   140  			no-map;
e9d7397467885a Maulik Shah                      2021-03-11   141  			reg = <0x0 0x80b00000 0x0 0x100000>;
e9d7397467885a Maulik Shah                      2021-03-11   142  		};
fc4f0273d4fba2 Alex Elder                       2021-08-04   143  
6615713c10c974 Luca Weiss                       2023-12-08   144  		wlan_fw_mem: wlan-fw@80c00000 {
eca7d3a366b3ab Sibi Sankar                      2021-09-17   145  			reg = <0x0 0x80c00000 0x0 0xc00000>;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   146  			no-map;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   147  		};
eca7d3a366b3ab Sibi Sankar                      2021-09-17   148  
3658e411efcbb4 Luca Weiss                       2023-12-08   149  		adsp_mem: adsp@86700000 {
3658e411efcbb4 Luca Weiss                       2023-12-08   150  			reg = <0x0 0x86700000 0x0 0x2800000>;
3658e411efcbb4 Luca Weiss                       2023-12-08   151  			no-map;
3658e411efcbb4 Luca Weiss                       2023-12-08   152  		};
3658e411efcbb4 Luca Weiss                       2023-12-08   153  
6615713c10c974 Luca Weiss                       2023-12-08   154  		video_mem: video@8b200000 {
37613aee217928 Dikshita Agarwal                 2021-10-26   155  			reg = <0x0 0x8b200000 0x0 0x500000>;
37613aee217928 Dikshita Agarwal                 2021-10-26   156  			no-map;
37613aee217928 Dikshita Agarwal                 2021-10-26   157  		};
37613aee217928 Dikshita Agarwal                 2021-10-26   158  
df62402e5ff9df Luca Weiss                       2023-12-08   159  		cdsp_mem: cdsp@88f00000 {
df62402e5ff9df Luca Weiss                       2023-12-08   160  			reg = <0x0 0x88f00000 0x0 0x1e00000>;
df62402e5ff9df Luca Weiss                       2023-12-08   161  			no-map;
df62402e5ff9df Luca Weiss                       2023-12-08   162  		};
df62402e5ff9df Luca Weiss                       2023-12-08   163  
6615713c10c974 Luca Weiss                       2023-12-08   164  		ipa_fw_mem: ipa-fw@8b700000 {
fc4f0273d4fba2 Alex Elder                       2021-08-04   165  			reg = <0 0x8b700000 0 0x10000>;
fc4f0273d4fba2 Alex Elder                       2021-08-04   166  			no-map;
fc4f0273d4fba2 Alex Elder                       2021-08-04   167  		};
eca7d3a366b3ab Sibi Sankar                      2021-09-17   168  
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20   169  		gpu_zap_mem: zap@8b71a000 {
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20   170  			reg = <0 0x8b71a000 0 0x2000>;
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20   171  			no-map;
5037ca35ce42a9 Luca Weiss                       2023-12-08   172  		};
5037ca35ce42a9 Luca Weiss                       2023-12-08   173  
5037ca35ce42a9 Luca Weiss                       2023-12-08   174  		mpss_mem: mpss@8b800000 {
5037ca35ce42a9 Luca Weiss                       2023-12-08   175  			reg = <0x0 0x8b800000 0x0 0xf600000>;
5037ca35ce42a9 Luca Weiss                       2023-12-08   176  			no-map;
5037ca35ce42a9 Luca Weiss                       2023-12-08   177  		};
5037ca35ce42a9 Luca Weiss                       2023-12-08   178  
5037ca35ce42a9 Luca Weiss                       2023-12-08   179  		wpss_mem: wpss@9ae00000 {
5037ca35ce42a9 Luca Weiss                       2023-12-08   180  			reg = <0x0 0x9ae00000 0x0 0x1900000>;
5037ca35ce42a9 Luca Weiss                       2023-12-08   181  			no-map;
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20   182  		};
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20   183  
6615713c10c974 Luca Weiss                       2023-12-08   184  		rmtfs_mem: rmtfs@9c900000 {
eca7d3a366b3ab Sibi Sankar                      2021-09-17   185  			compatible = "qcom,rmtfs-mem";
eca7d3a366b3ab Sibi Sankar                      2021-09-17   186  			reg = <0x0 0x9c900000 0x0 0x280000>;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   187  			no-map;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   188  
eca7d3a366b3ab Sibi Sankar                      2021-09-17   189  			qcom,client-id = <1>;
018c949b32df9f Luca Weiss                       2023-08-18   190  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   191  		};
3450bb5b9570a2 Maulik Shah                      2021-03-11   192  	};
3450bb5b9570a2 Maulik Shah                      2021-03-11   193  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   194  	cpus {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   195  		#address-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   196  		#size-cells = <0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   197  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   198  		cpu0: cpu@0 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   199  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   200  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   201  			reg = <0x0 0x0>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   202  			clocks = <&cpufreq_hw 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   203  			enable-method = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   204  			power-domains = <&cpu_pd0>;
7925ca85e95619 Maulik Shah                      2023-07-03   205  			power-domain-names = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   206  			next-level-cache = <&l2_0>;
1e8853c698276d Sibi Sankar                      2022-02-09   207  			operating-points-v2 = <&cpu0_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   208  			capacity-dmips-mhz = <1024>;
942bf463dec369 Ankit Sharma                     2023-11-03   209  			dynamic-power-coefficient = <100>;
1e8853c698276d Sibi Sankar                      2022-02-09   210  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   211  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   212  			qcom,freq-domain = <&cpufreq_hw 0>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   213  			#cooling-cells = <2>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   214  			l2_0: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   215  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   216  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   217  				cache-unified;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   218  				next-level-cache = <&l3_0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   219  				l3_0: l3-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   220  					compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   221  					cache-level = <3>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   222  					cache-unified;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   223  				};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   224  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   225  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   226  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   227  		cpu1: cpu@100 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   228  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   229  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   230  			reg = <0x0 0x100>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   231  			clocks = <&cpufreq_hw 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   232  			enable-method = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   233  			power-domains = <&cpu_pd1>;
7925ca85e95619 Maulik Shah                      2023-07-03   234  			power-domain-names = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   235  			next-level-cache = <&l2_100>;
1e8853c698276d Sibi Sankar                      2022-02-09   236  			operating-points-v2 = <&cpu0_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   237  			capacity-dmips-mhz = <1024>;
942bf463dec369 Ankit Sharma                     2023-11-03   238  			dynamic-power-coefficient = <100>;
1e8853c698276d Sibi Sankar                      2022-02-09   239  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   240  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   241  			qcom,freq-domain = <&cpufreq_hw 0>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   242  			#cooling-cells = <2>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   243  			l2_100: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   244  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   245  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   246  				cache-unified;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   247  				next-level-cache = <&l3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   248  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   249  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   250  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   251  		cpu2: cpu@200 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   252  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   253  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   254  			reg = <0x0 0x200>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   255  			clocks = <&cpufreq_hw 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   256  			enable-method = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   257  			power-domains = <&cpu_pd2>;
7925ca85e95619 Maulik Shah                      2023-07-03   258  			power-domain-names = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   259  			next-level-cache = <&l2_200>;
1e8853c698276d Sibi Sankar                      2022-02-09   260  			operating-points-v2 = <&cpu0_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   261  			capacity-dmips-mhz = <1024>;
942bf463dec369 Ankit Sharma                     2023-11-03   262  			dynamic-power-coefficient = <100>;
1e8853c698276d Sibi Sankar                      2022-02-09   263  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   264  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   265  			qcom,freq-domain = <&cpufreq_hw 0>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   266  			#cooling-cells = <2>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   267  			l2_200: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   268  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   269  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   270  				cache-unified;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   271  				next-level-cache = <&l3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   272  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   273  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   274  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   275  		cpu3: cpu@300 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   276  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   277  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   278  			reg = <0x0 0x300>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   279  			clocks = <&cpufreq_hw 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   280  			enable-method = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   281  			power-domains = <&cpu_pd3>;
7925ca85e95619 Maulik Shah                      2023-07-03   282  			power-domain-names = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   283  			next-level-cache = <&l2_300>;
1e8853c698276d Sibi Sankar                      2022-02-09   284  			operating-points-v2 = <&cpu0_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   285  			capacity-dmips-mhz = <1024>;
942bf463dec369 Ankit Sharma                     2023-11-03   286  			dynamic-power-coefficient = <100>;
1e8853c698276d Sibi Sankar                      2022-02-09   287  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   288  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   289  			qcom,freq-domain = <&cpufreq_hw 0>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   290  			#cooling-cells = <2>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   291  			l2_300: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   292  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   293  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   294  				cache-unified;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   295  				next-level-cache = <&l3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   296  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   297  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   298  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   299  		cpu4: cpu@400 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   300  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   301  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   302  			reg = <0x0 0x400>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   303  			clocks = <&cpufreq_hw 1>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   304  			enable-method = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   305  			power-domains = <&cpu_pd4>;
7925ca85e95619 Maulik Shah                      2023-07-03   306  			power-domain-names = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   307  			next-level-cache = <&l2_400>;
1e8853c698276d Sibi Sankar                      2022-02-09   308  			operating-points-v2 = <&cpu4_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   309  			capacity-dmips-mhz = <1946>;
942bf463dec369 Ankit Sharma                     2023-11-03   310  			dynamic-power-coefficient = <520>;
1e8853c698276d Sibi Sankar                      2022-02-09   311  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   312  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   313  			qcom,freq-domain = <&cpufreq_hw 1>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   314  			#cooling-cells = <2>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   315  			l2_400: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   316  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   317  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   318  				cache-unified;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   319  				next-level-cache = <&l3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   320  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   321  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   322  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   323  		cpu5: cpu@500 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   324  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   325  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   326  			reg = <0x0 0x500>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   327  			clocks = <&cpufreq_hw 1>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   328  			enable-method = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   329  			power-domains = <&cpu_pd5>;
7925ca85e95619 Maulik Shah                      2023-07-03   330  			power-domain-names = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   331  			next-level-cache = <&l2_500>;
1e8853c698276d Sibi Sankar                      2022-02-09   332  			operating-points-v2 = <&cpu4_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   333  			capacity-dmips-mhz = <1946>;
942bf463dec369 Ankit Sharma                     2023-11-03   334  			dynamic-power-coefficient = <520>;
1e8853c698276d Sibi Sankar                      2022-02-09   335  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   336  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   337  			qcom,freq-domain = <&cpufreq_hw 1>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   338  			#cooling-cells = <2>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   339  			l2_500: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   340  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   341  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   342  				cache-unified;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   343  				next-level-cache = <&l3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   344  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   345  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   346  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   347  		cpu6: cpu@600 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   348  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   349  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   350  			reg = <0x0 0x600>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   351  			clocks = <&cpufreq_hw 1>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   352  			enable-method = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   353  			power-domains = <&cpu_pd6>;
7925ca85e95619 Maulik Shah                      2023-07-03   354  			power-domain-names = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   355  			next-level-cache = <&l2_600>;
1e8853c698276d Sibi Sankar                      2022-02-09   356  			operating-points-v2 = <&cpu4_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   357  			capacity-dmips-mhz = <1946>;
942bf463dec369 Ankit Sharma                     2023-11-03   358  			dynamic-power-coefficient = <520>;
1e8853c698276d Sibi Sankar                      2022-02-09   359  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   360  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   361  			qcom,freq-domain = <&cpufreq_hw 1>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   362  			#cooling-cells = <2>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   363  			l2_600: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   364  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   365  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   366  				cache-unified;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   367  				next-level-cache = <&l3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   368  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   369  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   370  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   371  		cpu7: cpu@700 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   372  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   373  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   374  			reg = <0x0 0x700>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   375  			clocks = <&cpufreq_hw 2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   376  			enable-method = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   377  			power-domains = <&cpu_pd7>;
7925ca85e95619 Maulik Shah                      2023-07-03   378  			power-domain-names = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   379  			next-level-cache = <&l2_700>;
1e8853c698276d Sibi Sankar                      2022-02-09   380  			operating-points-v2 = <&cpu7_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   381  			capacity-dmips-mhz = <1985>;
942bf463dec369 Ankit Sharma                     2023-11-03   382  			dynamic-power-coefficient = <552>;
1e8853c698276d Sibi Sankar                      2022-02-09   383  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   384  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
4cbb02fa76de4b Sibi Sankar                      2021-07-20   385  			qcom,freq-domain = <&cpufreq_hw 2>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   386  			#cooling-cells = <2>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   387  			l2_700: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   388  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   389  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   390  				cache-unified;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   391  				next-level-cache = <&l3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   392  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   393  		};
0ef5463c7a5648 Maulik Shah                      2021-03-11   394  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   395  		cpu-map {
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   396  			cluster0 {
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   397  				core0 {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   398  					cpu = <&cpu0>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   399  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   400  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   401  				core1 {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   402  					cpu = <&cpu1>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   403  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   404  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   405  				core2 {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   406  					cpu = <&cpu2>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   407  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   408  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   409  				core3 {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   410  					cpu = <&cpu3>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   411  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   412  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   413  				core4 {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   414  					cpu = <&cpu4>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   415  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   416  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   417  				core5 {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   418  					cpu = <&cpu5>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   419  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   420  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   421  				core6 {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   422  					cpu = <&cpu6>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   423  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   424  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   425  				core7 {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   426  					cpu = <&cpu7>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   427  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   428  			};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   429  		};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   430  
0ef5463c7a5648 Maulik Shah                      2021-03-11   431  		idle-states {
0ef5463c7a5648 Maulik Shah                      2021-03-11   432  			entry-method = "psci";
0ef5463c7a5648 Maulik Shah                      2021-03-11   433  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   434  			little_cpu_sleep_0: cpu-sleep-0-0 {
0ef5463c7a5648 Maulik Shah                      2021-03-11   435  				compatible = "arm,idle-state";
0ef5463c7a5648 Maulik Shah                      2021-03-11   436  				idle-state-name = "little-power-down";
0ef5463c7a5648 Maulik Shah                      2021-03-11   437  				arm,psci-suspend-param = <0x40000003>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   438  				entry-latency-us = <549>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   439  				exit-latency-us = <901>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   440  				min-residency-us = <1774>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   441  				local-timer-stop;
0ef5463c7a5648 Maulik Shah                      2021-03-11   442  			};
0ef5463c7a5648 Maulik Shah                      2021-03-11   443  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   444  			little_cpu_sleep_1: cpu-sleep-0-1 {
0ef5463c7a5648 Maulik Shah                      2021-03-11   445  				compatible = "arm,idle-state";
0ef5463c7a5648 Maulik Shah                      2021-03-11   446  				idle-state-name = "little-rail-power-down";
0ef5463c7a5648 Maulik Shah                      2021-03-11   447  				arm,psci-suspend-param = <0x40000004>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   448  				entry-latency-us = <702>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   449  				exit-latency-us = <915>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   450  				min-residency-us = <4001>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   451  				local-timer-stop;
0ef5463c7a5648 Maulik Shah                      2021-03-11   452  			};
0ef5463c7a5648 Maulik Shah                      2021-03-11   453  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   454  			big_cpu_sleep_0: cpu-sleep-1-0 {
0ef5463c7a5648 Maulik Shah                      2021-03-11   455  				compatible = "arm,idle-state";
0ef5463c7a5648 Maulik Shah                      2021-03-11   456  				idle-state-name = "big-power-down";
0ef5463c7a5648 Maulik Shah                      2021-03-11   457  				arm,psci-suspend-param = <0x40000003>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   458  				entry-latency-us = <523>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   459  				exit-latency-us = <1244>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   460  				min-residency-us = <2207>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   461  				local-timer-stop;
0ef5463c7a5648 Maulik Shah                      2021-03-11   462  			};
0ef5463c7a5648 Maulik Shah                      2021-03-11   463  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   464  			big_cpu_sleep_1: cpu-sleep-1-1 {
0ef5463c7a5648 Maulik Shah                      2021-03-11   465  				compatible = "arm,idle-state";
0ef5463c7a5648 Maulik Shah                      2021-03-11   466  				idle-state-name = "big-rail-power-down";
0ef5463c7a5648 Maulik Shah                      2021-03-11   467  				arm,psci-suspend-param = <0x40000004>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   468  				entry-latency-us = <526>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   469  				exit-latency-us = <1854>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   470  				min-residency-us = <5555>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   471  				local-timer-stop;
0ef5463c7a5648 Maulik Shah                      2021-03-11   472  			};
7925ca85e95619 Maulik Shah                      2023-07-03   473  		};
0ef5463c7a5648 Maulik Shah                      2021-03-11   474  
db5d137e81bcce Maulik Shah                      2024-01-09   475  		domain_idle_states: domain-idle-states {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   476  			cluster_sleep_apss_off: cluster-sleep-0 {
7925ca85e95619 Maulik Shah                      2023-07-03   477  				compatible = "domain-idle-state";
db5d137e81bcce Maulik Shah                      2024-01-09   478  				arm,psci-suspend-param = <0x41000044>;
db5d137e81bcce Maulik Shah                      2024-01-09   479  				entry-latency-us = <2752>;
db5d137e81bcce Maulik Shah                      2024-01-09   480  				exit-latency-us = <3048>;
db5d137e81bcce Maulik Shah                      2024-01-09   481  				min-residency-us = <6118>;
db5d137e81bcce Maulik Shah                      2024-01-09   482  			};
db5d137e81bcce Maulik Shah                      2024-01-09   483  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   484  			cluster_sleep_cx_ret: cluster-sleep-1 {
db5d137e81bcce Maulik Shah                      2024-01-09   485  				compatible = "domain-idle-state";
db5d137e81bcce Maulik Shah                      2024-01-09   486  				arm,psci-suspend-param = <0x41001344>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   487  				entry-latency-us = <3263>;
db5d137e81bcce Maulik Shah                      2024-01-09   488  				exit-latency-us = <4562>;
db5d137e81bcce Maulik Shah                      2024-01-09   489  				min-residency-us = <8467>;
db5d137e81bcce Maulik Shah                      2024-01-09   490  			};
db5d137e81bcce Maulik Shah                      2024-01-09   491  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   492  			cluster_sleep_llcc_off: cluster-sleep-2 {
db5d137e81bcce Maulik Shah                      2024-01-09   493  				compatible = "domain-idle-state";
db5d137e81bcce Maulik Shah                      2024-01-09   494  				arm,psci-suspend-param = <0x4100b344>;
db5d137e81bcce Maulik Shah                      2024-01-09   495  				entry-latency-us = <3638>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   496  				exit-latency-us = <6562>;
db5d137e81bcce Maulik Shah                      2024-01-09   497  				min-residency-us = <9826>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   498  			};
0ef5463c7a5648 Maulik Shah                      2021-03-11   499  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   500  	};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   501  
0e3e654696074b Krzysztof Kozlowski              2022-06-27   502  	cpu0_opp_table: opp-table-cpu0 {
1e8853c698276d Sibi Sankar                      2022-02-09   503  		compatible = "operating-points-v2";
1e8853c698276d Sibi Sankar                      2022-02-09   504  		opp-shared;
1e8853c698276d Sibi Sankar                      2022-02-09   505  
1e8853c698276d Sibi Sankar                      2022-02-09   506  		cpu0_opp_300mhz: opp-300000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   507  			opp-hz = /bits/ 64 <300000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   508  			opp-peak-kBps = <800000 9600000>;
1e8853c698276d Sibi Sankar                      2022-02-09   509  		};
1e8853c698276d Sibi Sankar                      2022-02-09   510  
1e8853c698276d Sibi Sankar                      2022-02-09   511  		cpu0_opp_691mhz: opp-691200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   512  			opp-hz = /bits/ 64 <691200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   513  			opp-peak-kBps = <800000 17817600>;
1e8853c698276d Sibi Sankar                      2022-02-09   514  		};
1e8853c698276d Sibi Sankar                      2022-02-09   515  
1e8853c698276d Sibi Sankar                      2022-02-09   516  		cpu0_opp_806mhz: opp-806400000 {
1e8853c698276d Sibi Sankar                      2022-02-09   517  			opp-hz = /bits/ 64 <806400000>;
1e8853c698276d Sibi Sankar                      2022-02-09   518  			opp-peak-kBps = <800000 20889600>;
1e8853c698276d Sibi Sankar                      2022-02-09   519  		};
1e8853c698276d Sibi Sankar                      2022-02-09   520  
1e8853c698276d Sibi Sankar                      2022-02-09   521  		cpu0_opp_941mhz: opp-940800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   522  			opp-hz = /bits/ 64 <940800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   523  			opp-peak-kBps = <1804000 24576000>;
1e8853c698276d Sibi Sankar                      2022-02-09   524  		};
1e8853c698276d Sibi Sankar                      2022-02-09   525  
1e8853c698276d Sibi Sankar                      2022-02-09   526  		cpu0_opp_1152mhz: opp-1152000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   527  			opp-hz = /bits/ 64 <1152000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   528  			opp-peak-kBps = <2188000 27033600>;
1e8853c698276d Sibi Sankar                      2022-02-09   529  		};
1e8853c698276d Sibi Sankar                      2022-02-09   530  
1e8853c698276d Sibi Sankar                      2022-02-09   531  		cpu0_opp_1325mhz: opp-1324800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   532  			opp-hz = /bits/ 64 <1324800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   533  			opp-peak-kBps = <2188000 33792000>;
1e8853c698276d Sibi Sankar                      2022-02-09   534  		};
1e8853c698276d Sibi Sankar                      2022-02-09   535  
1e8853c698276d Sibi Sankar                      2022-02-09   536  		cpu0_opp_1517mhz: opp-1516800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   537  			opp-hz = /bits/ 64 <1516800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   538  			opp-peak-kBps = <3072000 38092800>;
1e8853c698276d Sibi Sankar                      2022-02-09   539  		};
1e8853c698276d Sibi Sankar                      2022-02-09   540  
1e8853c698276d Sibi Sankar                      2022-02-09   541  		cpu0_opp_1651mhz: opp-1651200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   542  			opp-hz = /bits/ 64 <1651200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   543  			opp-peak-kBps = <3072000 41779200>;
1e8853c698276d Sibi Sankar                      2022-02-09   544  		};
1e8853c698276d Sibi Sankar                      2022-02-09   545  
1e8853c698276d Sibi Sankar                      2022-02-09   546  		cpu0_opp_1805mhz: opp-1804800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   547  			opp-hz = /bits/ 64 <1804800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   548  			opp-peak-kBps = <4068000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   549  		};
1e8853c698276d Sibi Sankar                      2022-02-09   550  
1e8853c698276d Sibi Sankar                      2022-02-09   551  		cpu0_opp_1958mhz: opp-1958400000 {
1e8853c698276d Sibi Sankar                      2022-02-09   552  			opp-hz = /bits/ 64 <1958400000>;
1e8853c698276d Sibi Sankar                      2022-02-09   553  			opp-peak-kBps = <4068000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   554  		};
1e8853c698276d Sibi Sankar                      2022-02-09   555  
1e8853c698276d Sibi Sankar                      2022-02-09   556  		cpu0_opp_2016mhz: opp-2016000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   557  			opp-hz = /bits/ 64 <2016000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   558  			opp-peak-kBps = <6220000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   559  		};
1e8853c698276d Sibi Sankar                      2022-02-09   560  	};
1e8853c698276d Sibi Sankar                      2022-02-09   561  
0e3e654696074b Krzysztof Kozlowski              2022-06-27   562  	cpu4_opp_table: opp-table-cpu4 {
1e8853c698276d Sibi Sankar                      2022-02-09   563  		compatible = "operating-points-v2";
1e8853c698276d Sibi Sankar                      2022-02-09   564  		opp-shared;
1e8853c698276d Sibi Sankar                      2022-02-09   565  
1e8853c698276d Sibi Sankar                      2022-02-09   566  		cpu4_opp_691mhz: opp-691200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   567  			opp-hz = /bits/ 64 <691200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   568  			opp-peak-kBps = <1804000 9600000>;
1e8853c698276d Sibi Sankar                      2022-02-09   569  		};
1e8853c698276d Sibi Sankar                      2022-02-09   570  
1e8853c698276d Sibi Sankar                      2022-02-09   571  		cpu4_opp_941mhz: opp-940800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   572  			opp-hz = /bits/ 64 <940800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   573  			opp-peak-kBps = <2188000 17817600>;
1e8853c698276d Sibi Sankar                      2022-02-09   574  		};
1e8853c698276d Sibi Sankar                      2022-02-09   575  
1e8853c698276d Sibi Sankar                      2022-02-09   576  		cpu4_opp_1229mhz: opp-1228800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   577  			opp-hz = /bits/ 64 <1228800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   578  			opp-peak-kBps = <4068000 24576000>;
1e8853c698276d Sibi Sankar                      2022-02-09   579  		};
1e8853c698276d Sibi Sankar                      2022-02-09   580  
1e8853c698276d Sibi Sankar                      2022-02-09   581  		cpu4_opp_1344mhz: opp-1344000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   582  			opp-hz = /bits/ 64 <1344000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   583  			opp-peak-kBps = <4068000 24576000>;
1e8853c698276d Sibi Sankar                      2022-02-09   584  		};
1e8853c698276d Sibi Sankar                      2022-02-09   585  
1e8853c698276d Sibi Sankar                      2022-02-09   586  		cpu4_opp_1517mhz: opp-1516800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   587  			opp-hz = /bits/ 64 <1516800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   588  			opp-peak-kBps = <4068000 24576000>;
1e8853c698276d Sibi Sankar                      2022-02-09   589  		};
1e8853c698276d Sibi Sankar                      2022-02-09   590  
1e8853c698276d Sibi Sankar                      2022-02-09   591  		cpu4_opp_1651mhz: opp-1651200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   592  			opp-hz = /bits/ 64 <1651200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   593  			opp-peak-kBps = <6220000 38092800>;
1e8853c698276d Sibi Sankar                      2022-02-09   594  		};
1e8853c698276d Sibi Sankar                      2022-02-09   595  
1e8853c698276d Sibi Sankar                      2022-02-09   596  		cpu4_opp_1901mhz: opp-1900800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   597  			opp-hz = /bits/ 64 <1900800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   598  			opp-peak-kBps = <6220000 44851200>;
1e8853c698276d Sibi Sankar                      2022-02-09   599  		};
1e8853c698276d Sibi Sankar                      2022-02-09   600  
1e8853c698276d Sibi Sankar                      2022-02-09   601  		cpu4_opp_2054mhz: opp-2054400000 {
1e8853c698276d Sibi Sankar                      2022-02-09   602  			opp-hz = /bits/ 64 <2054400000>;
1e8853c698276d Sibi Sankar                      2022-02-09   603  			opp-peak-kBps = <6220000 44851200>;
1e8853c698276d Sibi Sankar                      2022-02-09   604  		};
1e8853c698276d Sibi Sankar                      2022-02-09   605  
1e8853c698276d Sibi Sankar                      2022-02-09   606  		cpu4_opp_2112mhz: opp-2112000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   607  			opp-hz = /bits/ 64 <2112000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   608  			opp-peak-kBps = <6220000 44851200>;
1e8853c698276d Sibi Sankar                      2022-02-09   609  		};
1e8853c698276d Sibi Sankar                      2022-02-09   610  
1e8853c698276d Sibi Sankar                      2022-02-09   611  		cpu4_opp_2131mhz: opp-2131200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   612  			opp-hz = /bits/ 64 <2131200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   613  			opp-peak-kBps = <6220000 44851200>;
1e8853c698276d Sibi Sankar                      2022-02-09   614  		};
1e8853c698276d Sibi Sankar                      2022-02-09   615  
1e8853c698276d Sibi Sankar                      2022-02-09   616  		cpu4_opp_2208mhz: opp-2208000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   617  			opp-hz = /bits/ 64 <2208000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   618  			opp-peak-kBps = <6220000 44851200>;
1e8853c698276d Sibi Sankar                      2022-02-09   619  		};
1e8853c698276d Sibi Sankar                      2022-02-09   620  
1e8853c698276d Sibi Sankar                      2022-02-09   621  		cpu4_opp_2400mhz: opp-2400000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   622  			opp-hz = /bits/ 64 <2400000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   623  			opp-peak-kBps = <8532000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   624  		};
1e8853c698276d Sibi Sankar                      2022-02-09   625  
1e8853c698276d Sibi Sankar                      2022-02-09   626  		cpu4_opp_2611mhz: opp-2611200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   627  			opp-hz = /bits/ 64 <2611200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   628  			opp-peak-kBps = <8532000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   629  		};
1e8853c698276d Sibi Sankar                      2022-02-09   630  	};
1e8853c698276d Sibi Sankar                      2022-02-09   631  
0e3e654696074b Krzysztof Kozlowski              2022-06-27   632  	cpu7_opp_table: opp-table-cpu7 {
1e8853c698276d Sibi Sankar                      2022-02-09   633  		compatible = "operating-points-v2";
1e8853c698276d Sibi Sankar                      2022-02-09   634  		opp-shared;
1e8853c698276d Sibi Sankar                      2022-02-09   635  
1e8853c698276d Sibi Sankar                      2022-02-09   636  		cpu7_opp_806mhz: opp-806400000 {
1e8853c698276d Sibi Sankar                      2022-02-09   637  			opp-hz = /bits/ 64 <806400000>;
1e8853c698276d Sibi Sankar                      2022-02-09   638  			opp-peak-kBps = <1804000 9600000>;
1e8853c698276d Sibi Sankar                      2022-02-09   639  		};
1e8853c698276d Sibi Sankar                      2022-02-09   640  
1e8853c698276d Sibi Sankar                      2022-02-09   641  		cpu7_opp_1056mhz: opp-1056000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   642  			opp-hz = /bits/ 64 <1056000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   643  			opp-peak-kBps = <2188000 17817600>;
1e8853c698276d Sibi Sankar                      2022-02-09   644  		};
1e8853c698276d Sibi Sankar                      2022-02-09   645  
1e8853c698276d Sibi Sankar                      2022-02-09   646  		cpu7_opp_1325mhz: opp-1324800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   647  			opp-hz = /bits/ 64 <1324800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   648  			opp-peak-kBps = <4068000 24576000>;
1e8853c698276d Sibi Sankar                      2022-02-09   649  		};
1e8853c698276d Sibi Sankar                      2022-02-09   650  
1e8853c698276d Sibi Sankar                      2022-02-09   651  		cpu7_opp_1517mhz: opp-1516800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   652  			opp-hz = /bits/ 64 <1516800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   653  			opp-peak-kBps = <4068000 24576000>;
1e8853c698276d Sibi Sankar                      2022-02-09   654  		};
1e8853c698276d Sibi Sankar                      2022-02-09   655  
1e8853c698276d Sibi Sankar                      2022-02-09   656  		cpu7_opp_1766mhz: opp-1766400000 {
1e8853c698276d Sibi Sankar                      2022-02-09   657  			opp-hz = /bits/ 64 <1766400000>;
1e8853c698276d Sibi Sankar                      2022-02-09   658  			opp-peak-kBps = <6220000 38092800>;
1e8853c698276d Sibi Sankar                      2022-02-09   659  		};
1e8853c698276d Sibi Sankar                      2022-02-09   660  
1e8853c698276d Sibi Sankar                      2022-02-09   661  		cpu7_opp_1862mhz: opp-1862400000 {
1e8853c698276d Sibi Sankar                      2022-02-09   662  			opp-hz = /bits/ 64 <1862400000>;
1e8853c698276d Sibi Sankar                      2022-02-09   663  			opp-peak-kBps = <6220000 38092800>;
1e8853c698276d Sibi Sankar                      2022-02-09   664  		};
1e8853c698276d Sibi Sankar                      2022-02-09   665  
1e8853c698276d Sibi Sankar                      2022-02-09   666  		cpu7_opp_2035mhz: opp-2035200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   667  			opp-hz = /bits/ 64 <2035200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   668  			opp-peak-kBps = <6220000 38092800>;
1e8853c698276d Sibi Sankar                      2022-02-09   669  		};
1e8853c698276d Sibi Sankar                      2022-02-09   670  
1e8853c698276d Sibi Sankar                      2022-02-09   671  		cpu7_opp_2112mhz: opp-2112000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   672  			opp-hz = /bits/ 64 <2112000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   673  			opp-peak-kBps = <6220000 44851200>;
1e8853c698276d Sibi Sankar                      2022-02-09   674  		};
1e8853c698276d Sibi Sankar                      2022-02-09   675  
1e8853c698276d Sibi Sankar                      2022-02-09   676  		cpu7_opp_2208mhz: opp-2208000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   677  			opp-hz = /bits/ 64 <2208000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   678  			opp-peak-kBps = <6220000 44851200>;
1e8853c698276d Sibi Sankar                      2022-02-09   679  		};
1e8853c698276d Sibi Sankar                      2022-02-09   680  
1e8853c698276d Sibi Sankar                      2022-02-09   681  		cpu7_opp_2381mhz: opp-2380800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   682  			opp-hz = /bits/ 64 <2380800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   683  			opp-peak-kBps = <6832000 44851200>;
1e8853c698276d Sibi Sankar                      2022-02-09   684  		};
1e8853c698276d Sibi Sankar                      2022-02-09   685  
1e8853c698276d Sibi Sankar                      2022-02-09   686  		cpu7_opp_2400mhz: opp-2400000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   687  			opp-hz = /bits/ 64 <2400000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   688  			opp-peak-kBps = <8532000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   689  		};
1e8853c698276d Sibi Sankar                      2022-02-09   690  
1e8853c698276d Sibi Sankar                      2022-02-09   691  		cpu7_opp_2515mhz: opp-2515200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   692  			opp-hz = /bits/ 64 <2515200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   693  			opp-peak-kBps = <8532000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   694  		};
1e8853c698276d Sibi Sankar                      2022-02-09   695  
1e8853c698276d Sibi Sankar                      2022-02-09   696  		cpu7_opp_2707mhz: opp-2707200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   697  			opp-hz = /bits/ 64 <2707200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   698  			opp-peak-kBps = <8532000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   699  		};
1e8853c698276d Sibi Sankar                      2022-02-09   700  
1e8853c698276d Sibi Sankar                      2022-02-09   701  		cpu7_opp_3014mhz: opp-3014400000 {
1e8853c698276d Sibi Sankar                      2022-02-09   702  			opp-hz = /bits/ 64 <3014400000>;
1e8853c698276d Sibi Sankar                      2022-02-09   703  			opp-peak-kBps = <8532000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   704  		};
1e8853c698276d Sibi Sankar                      2022-02-09   705  	};
1e8853c698276d Sibi Sankar                      2022-02-09   706  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   707  	memory@80000000 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   708  		device_type = "memory";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   709  		/* We expect the bootloader to fill in the size */
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   710  		reg = <0 0x80000000 0 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   711  	};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   712  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   713  	firmware {
7b59e8ae92fe08 Douglas Anderson                 2023-06-16   714  		scm: scm {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   715  			compatible = "qcom,scm-sc7280", "qcom,scm";
134a4b2f3be287 Mukesh Ojha                      2024-07-05   716  			qcom,dload-mode = <&tcsr_2 0x13000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   717  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   718  	};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   719  
297e6e38320f32 Odelu Kukatla                    2021-04-27   720  	clk_virt: interconnect {
297e6e38320f32 Odelu Kukatla                    2021-04-27   721  		compatible = "qcom,sc7280-clk-virt";
297e6e38320f32 Odelu Kukatla                    2021-04-27   722  		#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27   723  		qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27   724  	};
297e6e38320f32 Odelu Kukatla                    2021-04-27   725  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   726  	smem {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   727  		compatible = "qcom,smem";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   728  		memory-region = <&smem_mem>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   729  		hwlocks = <&tcsr_mutex 3>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   730  	};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   731  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   732  	smp2p-adsp {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   733  		compatible = "qcom,smp2p";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   734  		qcom,smem = <443>, <429>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   735  		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
c3bbe55c942d2a Sibi Sankar                      2021-04-27   736  					     IPCC_MPROC_SIGNAL_SMP2P
c3bbe55c942d2a Sibi Sankar                      2021-04-27   737  					     IRQ_TYPE_EDGE_RISING>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   738  		mboxes = <&ipcc IPCC_CLIENT_LPASS
c3bbe55c942d2a Sibi Sankar                      2021-04-27   739  				IPCC_MPROC_SIGNAL_SMP2P>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   740  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   741  		qcom,local-pid = <0>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   742  		qcom,remote-pid = <2>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   743  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   744  		adsp_smp2p_out: master-kernel {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   745  			qcom,entry-name = "master-kernel";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   746  			#qcom,smem-state-cells = <1>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   747  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   748  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   749  		adsp_smp2p_in: slave-kernel {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   750  			qcom,entry-name = "slave-kernel";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   751  			interrupt-controller;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   752  			#interrupt-cells = <2>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   753  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   754  	};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   755  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   756  	smp2p-cdsp {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   757  		compatible = "qcom,smp2p";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   758  		qcom,smem = <94>, <432>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   759  		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
c3bbe55c942d2a Sibi Sankar                      2021-04-27   760  					     IPCC_MPROC_SIGNAL_SMP2P
c3bbe55c942d2a Sibi Sankar                      2021-04-27   761  					     IRQ_TYPE_EDGE_RISING>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   762  		mboxes = <&ipcc IPCC_CLIENT_CDSP
c3bbe55c942d2a Sibi Sankar                      2021-04-27   763  				IPCC_MPROC_SIGNAL_SMP2P>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   764  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   765  		qcom,local-pid = <0>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   766  		qcom,remote-pid = <5>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   767  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   768  		cdsp_smp2p_out: master-kernel {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   769  			qcom,entry-name = "master-kernel";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   770  			#qcom,smem-state-cells = <1>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   771  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   772  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   773  		cdsp_smp2p_in: slave-kernel {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   774  			qcom,entry-name = "slave-kernel";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   775  			interrupt-controller;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   776  			#interrupt-cells = <2>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   777  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   778  	};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   779  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   780  	smp2p-mpss {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   781  		compatible = "qcom,smp2p";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   782  		qcom,smem = <435>, <428>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   783  		interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
c3bbe55c942d2a Sibi Sankar                      2021-04-27   784  					     IPCC_MPROC_SIGNAL_SMP2P
c3bbe55c942d2a Sibi Sankar                      2021-04-27   785  					     IRQ_TYPE_EDGE_RISING>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   786  		mboxes = <&ipcc IPCC_CLIENT_MPSS
c3bbe55c942d2a Sibi Sankar                      2021-04-27   787  				IPCC_MPROC_SIGNAL_SMP2P>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   788  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   789  		qcom,local-pid = <0>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   790  		qcom,remote-pid = <1>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   791  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   792  		modem_smp2p_out: master-kernel {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   793  			qcom,entry-name = "master-kernel";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   794  			#qcom,smem-state-cells = <1>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   795  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   796  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   797  		modem_smp2p_in: slave-kernel {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   798  			qcom,entry-name = "slave-kernel";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   799  			interrupt-controller;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   800  			#interrupt-cells = <2>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   801  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   802  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   803  		ipa_smp2p_out: ipa-ap-to-modem {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   804  			qcom,entry-name = "ipa";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   805  			#qcom,smem-state-cells = <1>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   806  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   807  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   808  		ipa_smp2p_in: ipa-modem-to-ap {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   809  			qcom,entry-name = "ipa";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   810  			interrupt-controller;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   811  			#interrupt-cells = <2>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   812  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   813  	};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   814  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   815  	smp2p-wpss {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   816  		compatible = "qcom,smp2p";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   817  		qcom,smem = <617>, <616>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   818  		interrupts-extended = <&ipcc IPCC_CLIENT_WPSS
c3bbe55c942d2a Sibi Sankar                      2021-04-27   819  					     IPCC_MPROC_SIGNAL_SMP2P
c3bbe55c942d2a Sibi Sankar                      2021-04-27   820  					     IRQ_TYPE_EDGE_RISING>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   821  		mboxes = <&ipcc IPCC_CLIENT_WPSS
c3bbe55c942d2a Sibi Sankar                      2021-04-27   822  				IPCC_MPROC_SIGNAL_SMP2P>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   823  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   824  		qcom,local-pid = <0>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   825  		qcom,remote-pid = <13>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   826  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   827  		wpss_smp2p_out: master-kernel {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   828  			qcom,entry-name = "master-kernel";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   829  			#qcom,smem-state-cells = <1>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   830  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   831  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   832  		wpss_smp2p_in: slave-kernel {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   833  			qcom,entry-name = "slave-kernel";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   834  			interrupt-controller;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   835  			#interrupt-cells = <2>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   836  		};
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   837  
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   838  		wlan_smp2p_out: wlan-ap-to-wpss {
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   839  			qcom,entry-name = "wlan";
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   840  			#qcom,smem-state-cells = <1>;
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   841  		};
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   842  
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   843  		wlan_smp2p_in: wlan-wpss-to-ap {
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   844  			qcom,entry-name = "wlan";
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   845  			interrupt-controller;
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   846  			#interrupt-cells = <2>;
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   847  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   848  	};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   849  
89f324ef54a2ae Danila Tikhonov                  2024-08-18   850  	pmu-a55 {
89f324ef54a2ae Danila Tikhonov                  2024-08-18   851  		compatible = "arm,cortex-a55-pmu";
89f324ef54a2ae Danila Tikhonov                  2024-08-18   852  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
89f324ef54a2ae Danila Tikhonov                  2024-08-18   853  	};
89f324ef54a2ae Danila Tikhonov                  2024-08-18   854  
89f324ef54a2ae Danila Tikhonov                  2024-08-18   855  	pmu-a78 {
89f324ef54a2ae Danila Tikhonov                  2024-08-18   856  		compatible = "arm,cortex-a78-pmu";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   857  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   858  	};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   859  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   860  	psci {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   861  		compatible = "arm,psci-1.0";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   862  		method = "smc";
7925ca85e95619 Maulik Shah                      2023-07-03   863  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   864  		cpu_pd0: power-domain-cpu0 {
7925ca85e95619 Maulik Shah                      2023-07-03   865  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   866  			power-domains = <&cluster_pd>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   867  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   868  		};
7925ca85e95619 Maulik Shah                      2023-07-03   869  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   870  		cpu_pd1: power-domain-cpu1 {
7925ca85e95619 Maulik Shah                      2023-07-03   871  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   872  			power-domains = <&cluster_pd>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   873  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   874  		};
7925ca85e95619 Maulik Shah                      2023-07-03   875  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   876  		cpu_pd2: power-domain-cpu2 {
7925ca85e95619 Maulik Shah                      2023-07-03   877  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   878  			power-domains = <&cluster_pd>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   879  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   880  		};
7925ca85e95619 Maulik Shah                      2023-07-03   881  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   882  		cpu_pd3: power-domain-cpu3 {
7925ca85e95619 Maulik Shah                      2023-07-03   883  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   884  			power-domains = <&cluster_pd>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   885  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   886  		};
7925ca85e95619 Maulik Shah                      2023-07-03   887  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   888  		cpu_pd4: power-domain-cpu4 {
7925ca85e95619 Maulik Shah                      2023-07-03   889  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   890  			power-domains = <&cluster_pd>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   891  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   892  		};
7925ca85e95619 Maulik Shah                      2023-07-03   893  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   894  		cpu_pd5: power-domain-cpu5 {
7925ca85e95619 Maulik Shah                      2023-07-03   895  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   896  			power-domains = <&cluster_pd>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   897  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   898  		};
7925ca85e95619 Maulik Shah                      2023-07-03   899  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   900  		cpu_pd6: power-domain-cpu6 {
7925ca85e95619 Maulik Shah                      2023-07-03   901  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   902  			power-domains = <&cluster_pd>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   903  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   904  		};
7925ca85e95619 Maulik Shah                      2023-07-03   905  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   906  		cpu_pd7: power-domain-cpu7 {
7925ca85e95619 Maulik Shah                      2023-07-03   907  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   908  			power-domains = <&cluster_pd>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   909  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   910  		};
7925ca85e95619 Maulik Shah                      2023-07-03   911  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   912  		cluster_pd: power-domain-cluster {
7925ca85e95619 Maulik Shah                      2023-07-03   913  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   914  			domain-idle-states = <&cluster_sleep_apss_off &cluster_sleep_cx_ret &cluster_sleep_llcc_off>;
7925ca85e95619 Maulik Shah                      2023-07-03   915  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   916  	};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   917  
0e3e654696074b Krzysztof Kozlowski              2022-06-27   918  	qspi_opp_table: opp-table-qspi {
7720ea001b528d Roja Rani Yarubandi              2021-09-23   919  		compatible = "operating-points-v2";
7720ea001b528d Roja Rani Yarubandi              2021-09-23   920  
7720ea001b528d Roja Rani Yarubandi              2021-09-23   921  		opp-75000000 {
7720ea001b528d Roja Rani Yarubandi              2021-09-23   922  			opp-hz = /bits/ 64 <75000000>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23   923  			required-opps = <&rpmhpd_opp_low_svs>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23   924  		};
7720ea001b528d Roja Rani Yarubandi              2021-09-23   925  
7720ea001b528d Roja Rani Yarubandi              2021-09-23   926  		opp-150000000 {
7720ea001b528d Roja Rani Yarubandi              2021-09-23   927  			opp-hz = /bits/ 64 <150000000>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23   928  			required-opps = <&rpmhpd_opp_svs>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23   929  		};
7720ea001b528d Roja Rani Yarubandi              2021-09-23   930  
6ea15b5065e554 Rajesh Patil                     2021-09-29   931  		opp-200000000 {
6ea15b5065e554 Rajesh Patil                     2021-09-29   932  			opp-hz = /bits/ 64 <200000000>;
6ea15b5065e554 Rajesh Patil                     2021-09-29   933  			required-opps = <&rpmhpd_opp_svs_l1>;
6ea15b5065e554 Rajesh Patil                     2021-09-29   934  		};
6ea15b5065e554 Rajesh Patil                     2021-09-29   935  
7720ea001b528d Roja Rani Yarubandi              2021-09-23   936  		opp-300000000 {
7720ea001b528d Roja Rani Yarubandi              2021-09-23   937  			opp-hz = /bits/ 64 <300000000>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23   938  			required-opps = <&rpmhpd_opp_nom>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23   939  		};
7720ea001b528d Roja Rani Yarubandi              2021-09-23   940  	};
7720ea001b528d Roja Rani Yarubandi              2021-09-23   941  
0e3e654696074b Krzysztof Kozlowski              2022-06-27   942  	qup_opp_table: opp-table-qup {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   943  		compatible = "operating-points-v2";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   944  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   945  		opp-75000000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   946  			opp-hz = /bits/ 64 <75000000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   947  			required-opps = <&rpmhpd_opp_low_svs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   948  		};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   949  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   950  		opp-100000000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   951  			opp-hz = /bits/ 64 <100000000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   952  			required-opps = <&rpmhpd_opp_svs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   953  		};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   954  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   955  		opp-128000000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   956  			opp-hz = /bits/ 64 <128000000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   957  			required-opps = <&rpmhpd_opp_nom>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   958  		};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   959  	};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   960  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   961  	soc: soc@0 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   962  		#address-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   963  		#size-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   964  		ranges = <0 0 0 0 0x10 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   965  		dma-ranges = <0 0 0 0 0x10 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   966  		compatible = "simple-bus";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   967  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   968  		gcc: clock-controller@100000 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   969  			compatible = "qcom,gcc-sc7280";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   970  			reg = <0 0x00100000 0 0x1f0000>;
ab7772de861200 Rajendra Nayak                   2021-03-11   971  			clocks = <&rpmhcc RPMH_CXO_CLK>,
ab7772de861200 Rajendra Nayak                   2021-03-11   972  				 <&rpmhcc RPMH_CXO_CLK_A>, <&sleep_clk>,
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20   973  				 <0>, <&pcie1_phy>,
c8a074789d71c1 Nitin Rawat                      2023-12-05   974  				 <&ufs_mem_phy 0>, <&ufs_mem_phy 1>, <&ufs_mem_phy 2>,
36888ed83f998c Dmitry Baryshkov                 2023-07-11   975  				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
ab7772de861200 Rajendra Nayak                   2021-03-11   976  			clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk",
fa09b2248714c6 Prasad Malisetty                 2021-11-16   977  				      "pcie_0_pipe_clk", "pcie_1_pipe_clk",
ab7772de861200 Rajendra Nayak                   2021-03-11   978  				      "ufs_phy_rx_symbol_0_clk", "ufs_phy_rx_symbol_1_clk",
ab7772de861200 Rajendra Nayak                   2021-03-11   979  				      "ufs_phy_tx_symbol_0_clk",
ab7772de861200 Rajendra Nayak                   2021-03-11   980  				      "usb3_phy_wrapper_gcc_usb30_pipe_clk";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   981  			#clock-cells = <1>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   982  			#reset-cells = <1>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   983  			#power-domain-cells = <1>;
3d59187efc982b Rajendra Nayak                   2022-09-16   984  			power-domains = <&rpmhpd SC7280_CX>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   985  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   986  
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   987  		ipcc: mailbox@408000 {
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   988  			compatible = "qcom,sc7280-ipcc", "qcom,ipcc";
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   989  			reg = <0 0x00408000 0 0x1000>;
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   990  			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   991  			interrupt-controller;
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   992  			#interrupt-cells = <3>;
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   993  			#mbox-cells = <2>;
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   994  		};
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   995  
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   996  		qfprom: efuse@784000 {
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   997  			compatible = "qcom,sc7280-qfprom", "qcom,qfprom";
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   998  			reg = <0 0x00784000 0 0xa20>,
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   999  			      <0 0x00780000 0 0xa20>,
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1000  			      <0 0x00782000 0 0x120>,
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1001  			      <0 0x00786000 0 0x1fff>;
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1002  			clocks = <&gcc GCC_SEC_CTRL_CLK_SRC>;
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1003  			clock-names = "core";
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1004  			power-domains = <&rpmhpd SC7280_MX>;
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1005  			#address-cells = <1>;
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1006  			#size-cells = <1>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  1007  
408e1776516149 Krzysztof Kozlowski              2024-02-13  1008  			gpu_speed_bin: gpu-speed-bin@1e9 {
3bfef00d767124 Akhil P Oommen                   2022-02-26  1009  				reg = <0x1e9 0x2>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  1010  				bits = <5 8>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  1011  			};
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1012  		};
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1013  
96bb736f05d156 Bhupesh Sharma                   2022-05-15  1014  		sdhc_1: mmc@7c4000 {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1015  			compatible = "qcom,sc7280-sdhci", "qcom,sdhci-msm-v5";
f9800dde34e678 Douglas Anderson                 2022-02-02  1016  			pinctrl-names = "default", "sleep";
f9800dde34e678 Douglas Anderson                 2022-02-02  1017  			pinctrl-0 = <&sdc1_clk>, <&sdc1_cmd>, <&sdc1_data>, <&sdc1_rclk>;
f9800dde34e678 Douglas Anderson                 2022-02-02  1018  			pinctrl-1 = <&sdc1_clk_sleep>, <&sdc1_cmd_sleep>, <&sdc1_data_sleep>, <&sdc1_rclk_sleep>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1019  			status = "disabled";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1020  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1021  			reg = <0 0x007c4000 0 0x1000>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1022  			      <0 0x007c5000 0 0x1000>;
21857088fa2747 Douglas Anderson                 2022-07-06  1023  			reg-names = "hc", "cqhci";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1024  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1025  			iommus = <&apps_smmu 0xc0 0x0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1026  			interrupts = <GIC_SPI 652 IRQ_TYPE_LEVEL_HIGH>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1027  				     <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1028  			interrupt-names = "hc_irq", "pwr_irq";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1029  
4ff12270dbbe24 Bhupesh Sharma                   2022-05-15  1030  			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
4ff12270dbbe24 Bhupesh Sharma                   2022-05-15  1031  				 <&gcc GCC_SDCC1_APPS_CLK>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1032  				 <&rpmhcc RPMH_CXO_CLK>;
4ff12270dbbe24 Bhupesh Sharma                   2022-05-15  1033  			clock-names = "iface", "core", "xo";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1034  			interconnects = <&aggre1_noc MASTER_SDCC_1 0 &mc_virt SLAVE_EBI1 0>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1035  					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_SDCC_1 0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1036  			interconnect-names = "sdhc-ddr","cpu-sdhc";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1037  			power-domains = <&rpmhpd SC7280_CX>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1038  			operating-points-v2 = <&sdhc1_opp_table>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1039  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1040  			bus-width = <8>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1041  			supports-cqe;
827f5fc8d91220 Konrad Dybcio                    2023-12-18  1042  			dma-coherent;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1043  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1044  			qcom,dll-config = <0x0007642c>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1045  			qcom,ddr-config = <0x80040868>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1046  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1047  			mmc-ddr-1_8v;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1048  			mmc-hs200-1_8v;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1049  			mmc-hs400-1_8v;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1050  			mmc-hs400-enhanced-strobe;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1051  
959cb513074386 Shaik Sajida Bhanu               2022-04-12  1052  			resets = <&gcc GCC_SDCC1_BCR>;
959cb513074386 Shaik Sajida Bhanu               2022-04-12  1053  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1054  			sdhc1_opp_table: opp-table {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1055  				compatible = "operating-points-v2";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1056  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1057  				opp-100000000 {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1058  					opp-hz = /bits/ 64 <100000000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1059  					required-opps = <&rpmhpd_opp_low_svs>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1060  					opp-peak-kBps = <1800000 400000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1061  					opp-avg-kBps = <100000 0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1062  				};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1063  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1064  				opp-384000000 {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1065  					opp-hz = /bits/ 64 <384000000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1066  					required-opps = <&rpmhpd_opp_nom>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1067  					opp-peak-kBps = <5400000 1600000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1068  					opp-avg-kBps = <390000 0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1069  				};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1070  			};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1071  		};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1072  
c11e239f6aee32 Vinod Koul                       2022-04-21  1073  		gpi_dma0: dma-controller@900000 {
c11e239f6aee32 Vinod Koul                       2022-04-21  1074  			#dma-cells = <3>;
e9f2053b7866ac Krzysztof Kozlowski              2022-10-18  1075  			compatible = "qcom,sc7280-gpi-dma", "qcom,sm6350-gpi-dma";
c11e239f6aee32 Vinod Koul                       2022-04-21  1076  			reg = <0 0x00900000 0 0x60000>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1077  			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1078  				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1079  				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1080  				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1081  				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1082  				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1083  				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1084  				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1085  				     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1086  				     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1087  				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1088  				     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1089  			dma-channels = <12>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1090  			dma-channel-mask = <0x7f>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1091  			iommus = <&apps_smmu 0x0136 0x0>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1092  			status = "disabled";
c11e239f6aee32 Vinod Koul                       2022-04-21  1093  		};
c11e239f6aee32 Vinod Koul                       2022-04-21  1094  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1095  		qupv3_id_0: geniqup@9c0000 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1096  			compatible = "qcom,geni-se-qup";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1097  			reg = <0 0x009c0000 0 0x2000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1098  			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1099  				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1100  			clock-names = "m-ahb", "s-ahb";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1101  			#address-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1102  			#size-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1103  			ranges;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1104  			iommus = <&apps_smmu 0x123 0x0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1105  			status = "disabled";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1106  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1107  			i2c0: i2c@980000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1108  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1109  				reg = <0 0x00980000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1110  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1111  				clock-names = "se";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1112  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1113  				pinctrl-0 = <&qup_i2c0_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1114  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1115  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1116  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1117  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1118  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1119  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1120  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1121  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1122  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1123  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1124  				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1125  				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1126  				dma-names = "tx", "rx";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1127  				status = "disabled";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1128  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1129  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1130  			spi0: spi@980000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1131  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1132  				reg = <0 0x00980000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1133  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1134  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1135  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1136  				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1137  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1138  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1139  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1140  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1141  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1142  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1143  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1144  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1145  				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1146  				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1147  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1148  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1149  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1150  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1151  			uart0: serial@980000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1152  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1153  				reg = <0 0x00980000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1154  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1155  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1156  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1157  				pinctrl-0 = <&qup_uart0_cts>, <&qup_uart0_rts>, <&qup_uart0_tx>, <&qup_uart0_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1158  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1159  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1160  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1161  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1162  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1163  				interconnect-names = "qup-core", "qup-config";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1164  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1165  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1166  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1167  			i2c1: i2c@984000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1168  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1169  				reg = <0 0x00984000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1170  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1171  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1172  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1173  				pinctrl-0 = <&qup_i2c1_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1174  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1175  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1176  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1177  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1178  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1179  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1180  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1181  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1182  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1183  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1184  				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1185  				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1186  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1187  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1188  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1189  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1190  			spi1: spi@984000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1191  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1192  				reg = <0 0x00984000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1193  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1194  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1195  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1196  				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1197  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1198  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1199  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1200  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1201  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1202  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1203  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1204  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1205  				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1206  				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1207  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1208  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1209  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1210  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1211  			uart1: serial@984000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1212  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1213  				reg = <0 0x00984000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1214  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1215  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1216  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1217  				pinctrl-0 = <&qup_uart1_cts>, <&qup_uart1_rts>, <&qup_uart1_tx>, <&qup_uart1_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1218  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1219  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1220  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1221  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1222  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1223  				interconnect-names = "qup-core", "qup-config";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1224  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1225  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1226  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1227  			i2c2: i2c@988000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1228  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1229  				reg = <0 0x00988000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1230  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1231  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1232  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1233  				pinctrl-0 = <&qup_i2c2_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1234  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1235  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1236  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1237  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1238  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1239  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1240  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1241  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1242  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1243  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1244  				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1245  				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1246  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1247  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1248  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1249  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1250  			spi2: spi@988000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1251  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1252  				reg = <0 0x00988000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1253  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1254  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1255  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1256  				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1257  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1258  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1259  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1260  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1261  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1262  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1263  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1264  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1265  				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1266  				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1267  				dma-names = "tx", "rx";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1268  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1269  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1270  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1271  			uart2: serial@988000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1272  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1273  				reg = <0 0x00988000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1274  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1275  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1276  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1277  				pinctrl-0 = <&qup_uart2_cts>, <&qup_uart2_rts>, <&qup_uart2_tx>, <&qup_uart2_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1278  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1279  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1280  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1281  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1282  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1283  				interconnect-names = "qup-core", "qup-config";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1284  				status = "disabled";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1285  			};
fc4f0273d4fba2 Alex Elder                       2021-08-04  1286  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1287  			i2c3: i2c@98c000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1288  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1289  				reg = <0 0x0098c000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1290  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1291  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1292  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1293  				pinctrl-0 = <&qup_i2c3_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1294  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1295  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1296  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1297  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1298  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1299  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1300  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1301  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1302  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1303  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1304  				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1305  				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1306  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1307  				status = "disabled";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1308  			};
fc4f0273d4fba2 Alex Elder                       2021-08-04  1309  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1310  			spi3: spi@98c000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1311  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1312  				reg = <0 0x0098c000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1313  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1314  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1315  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1316  				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1317  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1318  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1319  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1320  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1321  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1322  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1323  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1324  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1325  				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1326  				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1327  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1328  				status = "disabled";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1329  			};
fc4f0273d4fba2 Alex Elder                       2021-08-04  1330  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1331  			uart3: serial@98c000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1332  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1333  				reg = <0 0x0098c000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1334  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1335  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1336  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1337  				pinctrl-0 = <&qup_uart3_cts>, <&qup_uart3_rts>, <&qup_uart3_tx>, <&qup_uart3_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1338  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1339  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1340  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1341  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1342  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1343  				interconnect-names = "qup-core", "qup-config";
fc4f0273d4fba2 Alex Elder                       2021-08-04  1344  				status = "disabled";
fc4f0273d4fba2 Alex Elder                       2021-08-04  1345  			};
fc4f0273d4fba2 Alex Elder                       2021-08-04  1346  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1347  			i2c4: i2c@990000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1348  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1349  				reg = <0 0x00990000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1350  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1351  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1352  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1353  				pinctrl-0 = <&qup_i2c4_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1354  				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1355  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1356  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1357  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1358  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1359  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1360  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1361  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1362  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1363  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1364  				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1365  				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1366  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1367  				status = "disabled";
c3bbe55c942d2a Sibi Sankar                      2021-04-27  1368  			};
c3bbe55c942d2a Sibi Sankar                      2021-04-27  1369  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1370  			spi4: spi@990000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1371  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1372  				reg = <0 0x00990000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1373  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1374  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1375  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1376  				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1377  				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1378  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1379  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1380  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1381  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1382  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1383  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1384  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1385  				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1386  				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1387  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1388  				status = "disabled";
422a295221bba8 Taniya Das                       2021-04-10  1389  			};
422a295221bba8 Taniya Das                       2021-04-10  1390  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1391  			uart4: serial@990000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1392  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1393  				reg = <0 0x00990000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1394  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1395  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1396  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1397  				pinctrl-0 = <&qup_uart4_cts>, <&qup_uart4_rts>, <&qup_uart4_tx>, <&qup_uart4_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1398  				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1399  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1400  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1401  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1402  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1403  				interconnect-names = "qup-core", "qup-config";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1404  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1405  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1406  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1407  			i2c5: i2c@994000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1408  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1409  				reg = <0 0x00994000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1410  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1411  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1412  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1413  				pinctrl-0 = <&qup_i2c5_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1414  				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1415  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1416  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1417  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1418  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1419  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1420  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1421  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1422  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1423  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1424  				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1425  				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1426  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1427  				status = "disabled";
422a295221bba8 Taniya Das                       2021-04-10  1428  			};
422a295221bba8 Taniya Das                       2021-04-10  1429  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1430  			spi5: spi@994000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1431  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1432  				reg = <0 0x00994000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1433  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1434  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1435  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1436  				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1437  				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1438  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1439  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1440  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1441  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1442  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1443  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1444  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1445  				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1446  				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1447  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1448  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1449  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1450  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1451  			uart5: serial@994000 {
2b96407b8f10f1 Viken Dadhaniya                  2024-04-24  1452  				compatible = "qcom,geni-debug-uart";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1453  				reg = <0 0x00994000 0 0x4000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1454  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1455  				clock-names = "se";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1456  				pinctrl-names = "default";
2b96407b8f10f1 Viken Dadhaniya                  2024-04-24  1457  				pinctrl-0 = <&qup_uart5_tx>, <&qup_uart5_rx>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1458  				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
38cd93f413fd94 Roja Rani Yarubandi              2021-09-23  1459  				power-domains = <&rpmhpd SC7280_CX>;
38cd93f413fd94 Roja Rani Yarubandi              2021-09-23  1460  				operating-points-v2 = <&qup_opp_table>;
38cd93f413fd94 Roja Rani Yarubandi              2021-09-23  1461  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
38cd93f413fd94 Roja Rani Yarubandi              2021-09-23  1462  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
38cd93f413fd94 Roja Rani Yarubandi              2021-09-23  1463  				interconnect-names = "qup-core", "qup-config";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1464  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1465  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1466  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1467  			i2c6: i2c@998000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1468  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1469  				reg = <0 0x00998000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1470  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1471  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1472  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1473  				pinctrl-0 = <&qup_i2c6_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1474  				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1475  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1476  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1477  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1478  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1479  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1480  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1481  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1482  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1483  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1484  				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1485  				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1486  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1487  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1488  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1489  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1490  			spi6: spi@998000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1491  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1492  				reg = <0 0x00998000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1493  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1494  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1495  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1496  				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1497  				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1498  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1499  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1500  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1501  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1502  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1503  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1504  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1505  				dmas = <&gpi_dma0 0 6 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1506  				       <&gpi_dma0 1 6 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1507  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1508  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1509  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1510  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1511  			uart6: serial@998000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1512  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1513  				reg = <0 0x00998000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1514  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1515  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1516  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1517  				pinctrl-0 = <&qup_uart6_cts>, <&qup_uart6_rts>, <&qup_uart6_tx>, <&qup_uart6_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1518  				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1519  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1520  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1521  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1522  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1523  				interconnect-names = "qup-core", "qup-config";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1524  				status = "disabled";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1525  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1526  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1527  			i2c7: i2c@99c000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1528  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1529  				reg = <0 0x0099c000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1530  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1531  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1532  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1533  				pinctrl-0 = <&qup_i2c7_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1534  				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1535  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1536  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1537  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1538  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1539  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1540  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1541  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1542  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1543  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1544  				dmas = <&gpi_dma0 0 7 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1545  				       <&gpi_dma0 1 7 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1546  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1547  				status = "disabled";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1548  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1549  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1550  			spi7: spi@99c000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1551  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1552  				reg = <0 0x0099c000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1553  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1554  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1555  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1556  				pinctrl-0 = <&qup_spi7_data_clk>, <&qup_spi7_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1557  				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1558  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1559  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1560  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1561  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1562  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1563  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1564  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1565  				dmas = <&gpi_dma0 0 7 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1566  				       <&gpi_dma0 1 7 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1567  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1568  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1569  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1570  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1571  			uart7: serial@99c000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1572  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1573  				reg = <0 0x0099c000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1574  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1575  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1576  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1577  				pinctrl-0 = <&qup_uart7_cts>, <&qup_uart7_rts>, <&qup_uart7_tx>, <&qup_uart7_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1578  				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1579  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1580  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1581  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1582  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1583  				interconnect-names = "qup-core", "qup-config";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1584  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1585  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1586  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1587  
c11e239f6aee32 Vinod Koul                       2022-04-21  1588  		gpi_dma1: dma-controller@a00000 {
c11e239f6aee32 Vinod Koul                       2022-04-21  1589  			#dma-cells = <3>;
e9f2053b7866ac Krzysztof Kozlowski              2022-10-18  1590  			compatible = "qcom,sc7280-gpi-dma", "qcom,sm6350-gpi-dma";
c11e239f6aee32 Vinod Koul                       2022-04-21  1591  			reg = <0 0x00a00000 0 0x60000>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1592  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1593  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1594  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1595  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1596  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1597  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1598  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1599  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1600  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1601  				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1602  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1603  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1604  			dma-channels = <12>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1605  			dma-channel-mask = <0x1e>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1606  			iommus = <&apps_smmu 0x56 0x0>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1607  			status = "disabled";
c11e239f6aee32 Vinod Koul                       2022-04-21  1608  		};
c11e239f6aee32 Vinod Koul                       2022-04-21  1609  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1610  		qupv3_id_1: geniqup@ac0000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1611  			compatible = "qcom,geni-se-qup";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1612  			reg = <0 0x00ac0000 0 0x2000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1613  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1614  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1615  			clock-names = "m-ahb", "s-ahb";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1616  			#address-cells = <2>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1617  			#size-cells = <2>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1618  			ranges;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1619  			iommus = <&apps_smmu 0x43 0x0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1620  			status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1621  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1622  			i2c8: i2c@a80000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1623  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1624  				reg = <0 0x00a80000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1625  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1626  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1627  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1628  				pinctrl-0 = <&qup_i2c8_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1629  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1630  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1631  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1632  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1633  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1634  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1635  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1636  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1637  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1638  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1639  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1640  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1641  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1642  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1643  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1644  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1645  			spi8: spi@a80000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1646  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1647  				reg = <0 0x00a80000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1648  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1649  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1650  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1651  				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1652  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1653  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1654  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1655  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1656  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1657  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1658  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1659  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1660  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1661  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1662  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1663  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1664  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1665  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1666  			uart8: serial@a80000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1667  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1668  				reg = <0 0x00a80000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1669  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1670  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1671  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1672  				pinctrl-0 = <&qup_uart8_cts>, <&qup_uart8_rts>, <&qup_uart8_tx>, <&qup_uart8_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1673  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1674  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1675  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1676  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1677  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1678  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1679  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1680  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1681  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1682  			i2c9: i2c@a84000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1683  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1684  				reg = <0 0x00a84000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1685  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1686  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1687  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1688  				pinctrl-0 = <&qup_i2c9_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1689  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1690  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1691  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1692  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1693  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1694  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1695  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1696  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1697  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1698  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1699  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1700  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1701  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1702  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1703  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1704  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1705  			spi9: spi@a84000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1706  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1707  				reg = <0 0x00a84000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1708  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1709  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1710  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1711  				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1712  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1713  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1714  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1715  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1716  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1717  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1718  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1719  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1720  				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1721  				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1722  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1723  				status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1724  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1725  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1726  			uart9: serial@a84000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1727  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1728  				reg = <0 0x00a84000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1729  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1730  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1731  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1732  				pinctrl-0 = <&qup_uart9_cts>, <&qup_uart9_rts>, <&qup_uart9_tx>, <&qup_uart9_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1733  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1734  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1735  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1736  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1737  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1738  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1739  				status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1740  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1741  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1742  			i2c10: i2c@a88000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1743  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1744  				reg = <0 0x00a88000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1745  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1746  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1747  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1748  				pinctrl-0 = <&qup_i2c10_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1749  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1750  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1751  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1752  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1753  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1754  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1755  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1756  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1757  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1758  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1759  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1760  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1761  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1762  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1763  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1764  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1765  			spi10: spi@a88000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1766  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1767  				reg = <0 0x00a88000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1768  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1769  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1770  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1771  				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1772  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1773  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1774  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1775  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1776  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1777  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1778  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1779  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1780  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1781  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1782  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1783  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1784  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1785  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1786  			uart10: serial@a88000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1787  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1788  				reg = <0 0x00a88000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1789  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1790  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1791  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1792  				pinctrl-0 = <&qup_uart10_cts>, <&qup_uart10_rts>, <&qup_uart10_tx>, <&qup_uart10_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1793  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1794  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1795  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1796  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1797  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1798  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1799  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1800  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1801  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1802  			i2c11: i2c@a8c000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1803  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1804  				reg = <0 0x00a8c000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1805  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1806  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1807  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1808  				pinctrl-0 = <&qup_i2c11_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1809  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1810  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1811  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1812  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1813  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1814  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1815  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1816  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1817  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1818  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1819  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1820  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1821  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1822  				status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1823  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1824  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1825  			spi11: spi@a8c000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1826  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1827  				reg = <0 0x00a8c000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1828  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1829  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1830  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1831  				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1832  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1833  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1834  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1835  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1836  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1837  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1838  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1839  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1840  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1841  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1842  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1843  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1844  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1845  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1846  			uart11: serial@a8c000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1847  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1848  				reg = <0 0x00a8c000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1849  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1850  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1851  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1852  				pinctrl-0 = <&qup_uart11_cts>, <&qup_uart11_rts>, <&qup_uart11_tx>, <&qup_uart11_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1853  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1854  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1855  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1856  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1857  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1858  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1859  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1860  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1861  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1862  			i2c12: i2c@a90000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1863  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1864  				reg = <0 0x00a90000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1865  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1866  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1867  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1868  				pinctrl-0 = <&qup_i2c12_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1869  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1870  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1871  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1872  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1873  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1874  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1875  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1876  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1877  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1878  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1879  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1880  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1881  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1882  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1883  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1884  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1885  			spi12: spi@a90000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1886  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1887  				reg = <0 0x00a90000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1888  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1889  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1890  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1891  				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1892  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1893  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1894  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1895  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1896  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1897  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1898  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1899  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1900  				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1901  				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1902  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1903  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1904  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1905  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1906  			uart12: serial@a90000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1907  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1908  				reg = <0 0x00a90000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1909  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1910  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1911  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1912  				pinctrl-0 = <&qup_uart12_cts>, <&qup_uart12_rts>, <&qup_uart12_tx>, <&qup_uart12_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1913  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1914  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1915  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1916  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1917  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1918  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1919  				status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1920  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1921  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1922  			i2c13: i2c@a94000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1923  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1924  				reg = <0 0x00a94000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1925  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1926  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1927  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1928  				pinctrl-0 = <&qup_i2c13_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1929  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1930  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1931  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1932  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1933  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1934  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1935  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1936  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1937  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1938  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1939  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1940  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1941  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1942  				status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1943  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1944  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1945  			spi13: spi@a94000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1946  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1947  				reg = <0 0x00a94000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1948  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1949  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1950  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1951  				pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1952  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1953  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1954  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1955  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1956  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1957  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1958  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1959  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1960  				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1961  				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1962  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1963  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1964  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1965  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1966  			uart13: serial@a94000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1967  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1968  				reg = <0 0x00a94000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1969  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1970  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1971  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1972  				pinctrl-0 = <&qup_uart13_cts>, <&qup_uart13_rts>, <&qup_uart13_tx>, <&qup_uart13_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1973  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1974  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1975  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1976  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1977  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1978  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1979  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1980  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1981  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1982  			i2c14: i2c@a98000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1983  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1984  				reg = <0 0x00a98000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1985  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1986  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1987  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1988  				pinctrl-0 = <&qup_i2c14_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1989  				interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1990  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1991  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1992  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1993  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1994  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1995  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1996  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1997  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1998  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1999  				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  2000  				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  2001  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2002  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2003  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2004  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2005  			spi14: spi@a98000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2006  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2007  				reg = <0 0x00a98000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2008  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2009  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2010  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2011  				pinctrl-0 = <&qup_spi14_data_clk>, <&qup_spi14_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2012  				interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2013  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2014  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2015  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2016  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2017  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2018  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2019  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  2020  				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  2021  				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  2022  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2023  				status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2024  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2025  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2026  			uart14: serial@a98000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2027  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2028  				reg = <0 0x00a98000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2029  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2030  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2031  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2032  				pinctrl-0 = <&qup_uart14_cts>, <&qup_uart14_rts>, <&qup_uart14_tx>, <&qup_uart14_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2033  				interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2034  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2035  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2036  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2037  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2038  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2039  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2040  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2041  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2042  			i2c15: i2c@a9c000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2043  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2044  				reg = <0 0x00a9c000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2045  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2046  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2047  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2048  				pinctrl-0 = <&qup_i2c15_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2049  				interrupts = <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2050  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2051  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2052  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2053  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2054  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2055  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2056  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  2057  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  2058  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  2059  				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  2060  				       <&gpi_dma1 1 7 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  2061  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2062  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2063  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2064  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2065  			spi15: spi@a9c000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2066  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2067  				reg = <0 0x00a9c000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2068  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2069  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2070  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2071  				pinctrl-0 = <&qup_spi15_data_clk>, <&qup_spi15_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2072  				interrupts = <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2073  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2074  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2075  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2076  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2077  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2078  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2079  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  2080  				dmas = <&gpi_dma1 0 7 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  2081  				       <&gpi_dma1 1 7 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  2082  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2083  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2084  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2085  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2086  			uart15: serial@a9c000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2087  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2088  				reg = <0 0x00a9c000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2089  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2090  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2091  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2092  				pinctrl-0 = <&qup_uart15_cts>, <&qup_uart15_rts>, <&qup_uart15_tx>, <&qup_uart15_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2093  				interrupts = <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2094  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2095  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2096  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2097  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2098  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2099  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2100  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2101  		};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2102  
d9f33f465114b8 Om Prakash Singh                 2023-10-16  2103  		rng: rng@10d3000 {
d9f33f465114b8 Om Prakash Singh                 2023-10-16  2104  			compatible = "qcom,sc7280-trng", "qcom,trng";
d9f33f465114b8 Om Prakash Singh                 2023-10-16  2105  			reg = <0 0x010d3000 0 0x1000>;
d9f33f465114b8 Om Prakash Singh                 2023-10-16  2106  		};
d9f33f465114b8 Om Prakash Singh                 2023-10-16  2107  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2108  		cnoc2: interconnect@1500000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2109  			reg = <0 0x01500000 0 0x1000>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2110  			compatible = "qcom,sc7280-cnoc2";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2111  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2112  			qcom,bcm-voters = <&apps_bcm_voter>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2113  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2114  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2115  		cnoc3: interconnect@1502000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2116  			reg = <0 0x01502000 0 0x1000>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2117  			compatible = "qcom,sc7280-cnoc3";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2118  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2119  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2120  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2121  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2122  		mc_virt: interconnect@1580000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2123  			reg = <0 0x01580000 0 0x4>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2124  			compatible = "qcom,sc7280-mc-virt";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2125  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2126  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2127  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2128  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2129  		system_noc: interconnect@1680000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2130  			reg = <0 0x01680000 0 0x15480>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2131  			compatible = "qcom,sc7280-system-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2132  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2133  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2134  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  2135  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2136  		aggre1_noc: interconnect@16e0000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2137  			compatible = "qcom,sc7280-aggre1-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2138  			reg = <0 0x016e0000 0 0x1c080>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2139  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2140  			qcom,bcm-voters = <&apps_bcm_voter>;
2b5004956affaa Odelu Kukatla                    2024-06-07  2141  			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
2b5004956affaa Odelu Kukatla                    2024-06-07  2142  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2143  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  2144  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2145  		aggre2_noc: interconnect@1700000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2146  			reg = <0 0x01700000 0 0x2b080>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2147  			compatible = "qcom,sc7280-aggre2-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2148  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2149  			qcom,bcm-voters = <&apps_bcm_voter>;
2b5004956affaa Odelu Kukatla                    2024-06-07  2150  			clocks = <&rpmhcc RPMH_IPA_CLK>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2151  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  2152  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2153  		mmss_noc: interconnect@1740000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2154  			reg = <0 0x01740000 0 0x1e080>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2155  			compatible = "qcom,sc7280-mmss-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2156  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2157  			qcom,bcm-voters = <&apps_bcm_voter>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2158  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2159  
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2160  		wifi: wifi@17a10040 {
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2161  			compatible = "qcom,wcn6750-wifi";
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2162  			reg = <0 0x17a10040 0 0x0>;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2163  			iommus = <&apps_smmu 0x1c00 0x1>;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2164  			interrupts = <GIC_SPI 768 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2165  				     <GIC_SPI 769 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2166  				     <GIC_SPI 770 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2167  				     <GIC_SPI 771 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2168  				     <GIC_SPI 772 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2169  				     <GIC_SPI 773 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2170  				     <GIC_SPI 774 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2171  				     <GIC_SPI 775 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2172  				     <GIC_SPI 776 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2173  				     <GIC_SPI 777 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2174  				     <GIC_SPI 778 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2175  				     <GIC_SPI 779 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2176  				     <GIC_SPI 780 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2177  				     <GIC_SPI 781 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2178  				     <GIC_SPI 782 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2179  				     <GIC_SPI 783 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2180  				     <GIC_SPI 784 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2181  				     <GIC_SPI 785 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2182  				     <GIC_SPI 786 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2183  				     <GIC_SPI 787 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2184  				     <GIC_SPI 788 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2185  				     <GIC_SPI 789 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2186  				     <GIC_SPI 790 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2187  				     <GIC_SPI 791 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2188  				     <GIC_SPI 792 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2189  				     <GIC_SPI 793 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2190  				     <GIC_SPI 794 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2191  				     <GIC_SPI 795 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2192  				     <GIC_SPI 796 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2193  				     <GIC_SPI 797 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2194  				     <GIC_SPI 798 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2195  				     <GIC_SPI 799 IRQ_TYPE_EDGE_RISING>;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2196  			qcom,rproc = <&remoteproc_wpss>;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2197  			memory-region = <&wlan_fw_mem>, <&wlan_ce_mem>;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2198  			status = "disabled";
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17  2199  			qcom,smem-states = <&wlan_smp2p_out 0>;
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17  2200  			qcom,smem-state-names = "wlan-smp2p-out";
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2201  		};
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2202  
052c9a1f1400f1 Manivannan Sadhasivam            2023-12-06  2203  		pcie1: pcie@1c08000 {
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2204  			compatible = "qcom,pcie-sc7280";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2205  			reg = <0 0x01c08000 0 0x3000>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2206  			      <0 0x40000000 0 0xf1d>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2207  			      <0 0x40000f20 0 0xa8>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2208  			      <0 0x40001000 0 0x1000>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2209  			      <0 0x40100000 0 0x100000>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2210  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2211  			reg-names = "parf", "dbi", "elbi", "atu", "config";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2212  			device_type = "pci";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2213  			linux,pci-domain = <1>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2214  			bus-range = <0x00 0xff>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2215  			num-lanes = <2>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2216  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2217  			#address-cells = <3>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2218  			#size-cells = <2>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2219  
1d4743d6312582 Manivannan Sadhasivam            2023-02-28  2220  			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2221  				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2222  
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2223  			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2224  				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2225  				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2226  				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2227  				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2228  				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2229  				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2230  				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2231  			interrupt-names = "msi0", "msi1", "msi2", "msi3",
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2232  					  "msi4", "msi5", "msi6", "msi7";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2233  			#interrupt-cells = <1>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2234  			interrupt-map-mask = <0 0 0 0x7>;
66b788133030f0 Prasad Malisetty                 2021-11-16  2235  			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>,
66b788133030f0 Prasad Malisetty                 2021-11-16  2236  					<0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>,
66b788133030f0 Prasad Malisetty                 2021-11-16  2237  					<0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH>,
66b788133030f0 Prasad Malisetty                 2021-11-16  2238  					<0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2239  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2240  			clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2241  				 <&gcc GCC_PCIE_1_PIPE_CLK_SRC>,
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2242  				 <&pcie1_phy>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2243  				 <&rpmhcc RPMH_CXO_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2244  				 <&gcc GCC_PCIE_1_AUX_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2245  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2246  				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2247  				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2248  				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2249  				 <&gcc GCC_AGGRE_NOC_PCIE_TBU_CLK>,
aaf85b46aa4145 Krishna chaitanya chundru        2022-09-08  2250  				 <&gcc GCC_DDRSS_PCIE_SF_CLK>,
aaf85b46aa4145 Krishna chaitanya chundru        2022-09-08  2251  				 <&gcc GCC_AGGRE_NOC_PCIE_CENTER_SF_AXI_CLK>,
aaf85b46aa4145 Krishna chaitanya chundru        2022-09-08  2252  				 <&gcc GCC_AGGRE_NOC_PCIE_1_AXI_CLK>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2253  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2254  			clock-names = "pipe",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2255  				      "pipe_mux",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2256  				      "phy_pipe",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2257  				      "ref",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2258  				      "aux",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2259  				      "cfg",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2260  				      "bus_master",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2261  				      "bus_slave",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2262  				      "slave_q2a",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2263  				      "tbu",
aaf85b46aa4145 Krishna chaitanya chundru        2022-09-08  2264  				      "ddrss_sf_tbu",
aaf85b46aa4145 Krishna chaitanya chundru        2022-09-08  2265  				      "aggre0",
aaf85b46aa4145 Krishna chaitanya chundru        2022-09-08  2266  				      "aggre1";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2267  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2268  			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2269  			assigned-clock-rates = <19200000>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2270  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2271  			resets = <&gcc GCC_PCIE_1_BCR>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2272  			reset-names = "pci";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2273  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2274  			power-domains = <&gcc GCC_PCIE_1_GDSC>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2275  
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2276  			phys = <&pcie1_phy>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2277  			phy-names = "pciephy";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2278  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2279  			pinctrl-names = "default";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2280  			pinctrl-0 = <&pcie1_clkreq_n>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2281  
8a63441e83724f Krishna chaitanya chundru        2023-02-28  2282  			dma-coherent;
8a63441e83724f Krishna chaitanya chundru        2023-02-28  2283  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2284  			iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2285  				    <0x100 &apps_smmu 0x1c81 0x1>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2286  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2287  			status = "disabled";
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2288  
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2289  			pcie@0 {
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2290  				device_type = "pci";
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2291  				reg = <0x0 0x0 0x0 0x0 0x0>;
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2292  				bus-range = <0x01 0xff>;
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2293  
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2294  				#address-cells = <3>;
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2295  				#size-cells = <2>;
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2296  				ranges;
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2297  			};
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2298  		};
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2299  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2300  		pcie1_phy: phy@1c0e000 {
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2301  			compatible = "qcom,sm8250-qmp-gen3x2-pcie-phy";
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2302  			reg = <0 0x01c0e000 0 0x1000>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2303  			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2304  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2305  				 <&gcc GCC_PCIE_CLKREF_EN>,
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2306  				 <&gcc GCC_PCIE1_PHY_RCHNG_CLK>,
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2307  				 <&gcc GCC_PCIE_1_PIPE_CLK>;
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2308  			clock-names = "aux",
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2309  				      "cfg_ahb",
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2310  				      "ref",
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2311  				      "refgen",
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2312  				      "pipe";
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2313  
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2314  			clock-output-names = "pcie_1_pipe_clk";
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2315  			#clock-cells = <0>;
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2316  
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2317  			#phy-cells = <0>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2318  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2319  			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2320  			reset-names = "phy";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2321  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2322  			assigned-clocks = <&gcc GCC_PCIE1_PHY_RCHNG_CLK>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2323  			assigned-clock-rates = <100000000>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2324  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2325  			status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2326  		};
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2327  
15288649e4c037 Manivannan Sadhasivam            2024-05-14  2328  		ufs_mem_hc: ufshc@1d84000 {
c8a074789d71c1 Nitin Rawat                      2023-12-05  2329  			compatible = "qcom,sc7280-ufshc", "qcom,ufshc",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2330  				     "jedec,ufs-2.0";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2331  			reg = <0x0 0x01d84000 0x0 0x3000>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2332  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2333  			phys = <&ufs_mem_phy>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2334  			phy-names = "ufsphy";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2335  			lanes-per-direction = <2>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2336  			#reset-cells = <1>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2337  			resets = <&gcc GCC_UFS_PHY_BCR>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2338  			reset-names = "rst";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2339  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2340  			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2341  			required-opps = <&rpmhpd_opp_nom>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2342  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2343  			iommus = <&apps_smmu 0x80 0x0>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2344  			dma-coherent;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2345  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2346  			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
c8a074789d71c1 Nitin Rawat                      2023-12-05  2347  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2348  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
c8a074789d71c1 Nitin Rawat                      2023-12-05  2349  					 &cnoc2 SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2350  			interconnect-names = "ufs-ddr", "cpu-ufs";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2351  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2352  			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2353  				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2354  				 <&gcc GCC_UFS_PHY_AHB_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2355  				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2356  				 <&rpmhcc RPMH_CXO_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2357  				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2358  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2359  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2360  			clock-names = "core_clk",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2361  				      "bus_aggr_clk",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2362  				      "iface_clk",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2363  				      "core_clk_unipro",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2364  				      "ref_clk",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2365  				      "tx_lane0_sync_clk",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2366  				      "rx_lane0_sync_clk",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2367  				      "rx_lane1_sync_clk";
099f3401dc3b7f Neil Armstrong                   2025-04-24  2368  
099f3401dc3b7f Neil Armstrong                   2025-04-24  2369  			operating-points-v2 = <&ufs_opp_table>;
099f3401dc3b7f Neil Armstrong                   2025-04-24  2370  
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2371  			qcom,ice = <&ice>;
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2372  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2373  			status = "disabled";
099f3401dc3b7f Neil Armstrong                   2025-04-24  2374  
099f3401dc3b7f Neil Armstrong                   2025-04-24  2375  			ufs_opp_table: opp-table {
099f3401dc3b7f Neil Armstrong                   2025-04-24  2376  				compatible = "operating-points-v2";
099f3401dc3b7f Neil Armstrong                   2025-04-24  2377  
099f3401dc3b7f Neil Armstrong                   2025-04-24  2378  				opp-75000000 {
099f3401dc3b7f Neil Armstrong                   2025-04-24  2379  					opp-hz = /bits/ 64 <75000000>,
099f3401dc3b7f Neil Armstrong                   2025-04-24  2380  						 /bits/ 64 <0>,
099f3401dc3b7f Neil Armstrong                   2025-04-24  2381  						 /bits/ 64 <0>,
099f3401dc3b7f Neil Armstrong                   2025-04-24  2382  						 /bits/ 64 <75000000>,
099f3401dc3b7f Neil Armstrong                   2025-04-24  2383  						 /bits/ 64 <0>,
099f3401dc3b7f Neil Armstrong                   2025-04-24  2384  						 /bits/ 64 <0>,
099f3401dc3b7f Neil Armstrong                   2025-04-24  2385  						 /bits/ 64 <0>,
099f3401dc3b7f Neil Armstrong                   2025-04-24  2386  						 /bits/ 64 <0>;
099f3401dc3b7f Neil Armstrong                   2025-04-24  2387  					required-opps = <&rpmhpd_opp_low_svs>;
099f3401dc3b7f Neil Armstrong                   2025-04-24  2388  				};
099f3401dc3b7f Neil Armstrong                   2025-04-24  2389  
099f3401dc3b7f Neil Armstrong                   2025-04-24  2390  				opp-150000000 {
099f3401dc3b7f Neil Armstrong                   2025-04-24  2391  					opp-hz = /bits/ 64 <150000000>,
099f3401dc3b7f Neil Armstrong                   2025-04-24  2392  						 /bits/ 64 <0>,
099f3401dc3b7f Neil Armstrong                   2025-04-24  2393  						 /bits/ 64 <0>,
099f3401dc3b7f Neil Armstrong                   2025-04-24  2394  						 /bits/ 64 <150000000>,
099f3401dc3b7f Neil Armstrong                   2025-04-24  2395  						 /bits/ 64 <0>,
099f3401dc3b7f Neil Armstrong                   2025-04-24  2396  						 /bits/ 64 <0>,
099f3401dc3b7f Neil Armstrong                   2025-04-24  2397  						 /bits/ 64 <0>,
099f3401dc3b7f Neil Armstrong                   2025-04-24  2398  						 /bits/ 64 <0>;
099f3401dc3b7f Neil Armstrong                   2025-04-24  2399  					required-opps = <&rpmhpd_opp_svs>;
099f3401dc3b7f Neil Armstrong                   2025-04-24  2400  				};
099f3401dc3b7f Neil Armstrong                   2025-04-24  2401  
099f3401dc3b7f Neil Armstrong                   2025-04-24  2402  				opp-300000000 {
099f3401dc3b7f Neil Armstrong                   2025-04-24  2403  					opp-hz = /bits/ 64 <300000000>,
099f3401dc3b7f Neil Armstrong                   2025-04-24  2404  						 /bits/ 64 <0>,
099f3401dc3b7f Neil Armstrong                   2025-04-24  2405  						 /bits/ 64 <0>,
099f3401dc3b7f Neil Armstrong                   2025-04-24  2406  						 /bits/ 64 <300000000>,
099f3401dc3b7f Neil Armstrong                   2025-04-24  2407  						 /bits/ 64 <0>,
099f3401dc3b7f Neil Armstrong                   2025-04-24  2408  						 /bits/ 64 <0>,
099f3401dc3b7f Neil Armstrong                   2025-04-24  2409  						 /bits/ 64 <0>,
099f3401dc3b7f Neil Armstrong                   2025-04-24  2410  						 /bits/ 64 <0>;
099f3401dc3b7f Neil Armstrong                   2025-04-24  2411  					required-opps = <&rpmhpd_opp_nom>;
099f3401dc3b7f Neil Armstrong                   2025-04-24  2412  				};
099f3401dc3b7f Neil Armstrong                   2025-04-24  2413  			};
c8a074789d71c1 Nitin Rawat                      2023-12-05  2414  		};
c8a074789d71c1 Nitin Rawat                      2023-12-05  2415  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2416  		ufs_mem_phy: phy@1d87000 {
c8a074789d71c1 Nitin Rawat                      2023-12-05  2417  			compatible = "qcom,sc7280-qmp-ufs-phy";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2418  			reg = <0x0 0x01d87000 0x0 0xe00>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2419  			clocks = <&rpmhcc RPMH_CXO_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2420  				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2421  				 <&gcc GCC_UFS_1_CLKREF_EN>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2422  			clock-names = "ref", "ref_aux", "qref";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2423  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2424  			power-domains = <&rpmhpd SC7280_MX>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2425  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2426  			resets = <&ufs_mem_hc 0>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2427  			reset-names = "ufsphy";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2428  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2429  			#clock-cells = <1>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2430  			#phy-cells = <0>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2431  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2432  			status = "disabled";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2433  		};
c8a074789d71c1 Nitin Rawat                      2023-12-05  2434  
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2435  		ice: crypto@1d88000 {
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2436  			compatible = "qcom,sc7280-inline-crypto-engine",
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2437  				     "qcom,inline-crypto-engine";
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2438  			reg = <0 0x01d88000 0 0x8000>;
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2439  			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2440  		};
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2441  
d488f903a86002 Om Prakash Singh                 2023-12-14  2442  		cryptobam: dma-controller@1dc4000 {
d488f903a86002 Om Prakash Singh                 2023-12-14  2443  			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
d488f903a86002 Om Prakash Singh                 2023-12-14  2444  			reg = <0x0 0x01dc4000 0x0 0x28000>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2445  			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2446  			#dma-cells = <1>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2447  			iommus = <&apps_smmu 0x4e4 0x0011>,
d488f903a86002 Om Prakash Singh                 2023-12-14  2448  				 <&apps_smmu 0x4e6 0x0011>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2449  			qcom,ee = <0>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2450  			qcom,controlled-remotely;
40ec6a2817d927 Luca Weiss                       2023-12-29  2451  			num-channels = <16>;
40ec6a2817d927 Luca Weiss                       2023-12-29  2452  			qcom,num-ees = <4>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2453  		};
d488f903a86002 Om Prakash Singh                 2023-12-14  2454  
d488f903a86002 Om Prakash Singh                 2023-12-14  2455  		crypto: crypto@1dfa000 {
d488f903a86002 Om Prakash Singh                 2023-12-14  2456  			compatible = "qcom,sc7280-qce", "qcom,sm8150-qce", "qcom,qce";
d488f903a86002 Om Prakash Singh                 2023-12-14  2457  			reg = <0x0 0x01dfa000 0x0 0x6000>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2458  			dmas = <&cryptobam 4>, <&cryptobam 5>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2459  			dma-names = "rx", "tx";
d488f903a86002 Om Prakash Singh                 2023-12-14  2460  			iommus = <&apps_smmu 0x4e4 0x0011>,
d488f903a86002 Om Prakash Singh                 2023-12-14  2461  				 <&apps_smmu 0x4e4 0x0011>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2462  			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2463  			interconnect-names = "memory";
d488f903a86002 Om Prakash Singh                 2023-12-14  2464  		};
d488f903a86002 Om Prakash Singh                 2023-12-14  2465  
fc4f0273d4fba2 Alex Elder                       2021-08-04  2466  		ipa: ipa@1e40000 {
fc4f0273d4fba2 Alex Elder                       2021-08-04  2467  			compatible = "qcom,sc7280-ipa";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2468  
fc4f0273d4fba2 Alex Elder                       2021-08-04  2469  			iommus = <&apps_smmu 0x480 0x0>,
fc4f0273d4fba2 Alex Elder                       2021-08-04  2470  				 <&apps_smmu 0x482 0x0>;
94ca994d7e932c Konrad Dybcio                    2023-01-02  2471  			reg = <0 0x01e40000 0 0x8000>,
94ca994d7e932c Konrad Dybcio                    2023-01-02  2472  			      <0 0x01e50000 0 0x4ad0>,
94ca994d7e932c Konrad Dybcio                    2023-01-02  2473  			      <0 0x01e04000 0 0x23000>;
fc4f0273d4fba2 Alex Elder                       2021-08-04  2474  			reg-names = "ipa-reg",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2475  				    "ipa-shared",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2476  				    "gsi";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2477  
33b89923d02153 Stephen Boyd                     2021-08-11  2478  			interrupts-extended = <&intc GIC_SPI 654 IRQ_TYPE_EDGE_RISING>,
33b89923d02153 Stephen Boyd                     2021-08-11  2479  					      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
fc4f0273d4fba2 Alex Elder                       2021-08-04  2480  					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
fc4f0273d4fba2 Alex Elder                       2021-08-04  2481  					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
fc4f0273d4fba2 Alex Elder                       2021-08-04  2482  			interrupt-names = "ipa",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2483  					  "gsi",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2484  					  "ipa-clock-query",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2485  					  "ipa-setup-ready";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2486  
fc4f0273d4fba2 Alex Elder                       2021-08-04  2487  			clocks = <&rpmhcc RPMH_IPA_CLK>;
fc4f0273d4fba2 Alex Elder                       2021-08-04  2488  			clock-names = "core";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2489  
fc4f0273d4fba2 Alex Elder                       2021-08-04  2490  			interconnects = <&aggre2_noc MASTER_IPA 0 &mc_virt SLAVE_EBI1 0>,
fc4f0273d4fba2 Alex Elder                       2021-08-04  2491  					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_IPA_CFG 0>;
fc4f0273d4fba2 Alex Elder                       2021-08-04  2492  			interconnect-names = "memory",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2493  					     "config";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2494  
73419e4d2fd1b8 Alex Elder                       2022-02-01  2495  			qcom,qmp = <&aoss_qmp>;
73419e4d2fd1b8 Alex Elder                       2022-02-01  2496  
fc4f0273d4fba2 Alex Elder                       2021-08-04  2497  			qcom,smem-states = <&ipa_smp2p_out 0>,
fc4f0273d4fba2 Alex Elder                       2021-08-04  2498  					   <&ipa_smp2p_out 1>;
fc4f0273d4fba2 Alex Elder                       2021-08-04  2499  			qcom,smem-state-names = "ipa-clock-enabled-valid",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2500  						"ipa-clock-enabled";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2501  
fc4f0273d4fba2 Alex Elder                       2021-08-04  2502  			status = "disabled";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2503  		};
fc4f0273d4fba2 Alex Elder                       2021-08-04  2504  
c3bbe55c942d2a Sibi Sankar                      2021-04-27  2505  		tcsr_mutex: hwlock@1f40000 {
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2506  			compatible = "qcom,tcsr-mutex";
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2507  			reg = <0 0x01f40000 0 0x20000>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27  2508  			#hwlock-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2509  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27  2510  
d0909bf4fa0fd7 Johan Hovold                     2022-09-05  2511  		tcsr_1: syscon@1f60000 {
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2512  			compatible = "qcom,sc7280-tcsr", "syscon";
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2513  			reg = <0 0x01f60000 0 0x20000>;
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2514  		};
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2515  
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2516  		tcsr_2: syscon@1fc0000 {
dddf4b0621d61b Sibi Sankar                      2021-09-17  2517  			compatible = "qcom,sc7280-tcsr", "syscon";
dddf4b0621d61b Sibi Sankar                      2021-09-17  2518  			reg = <0 0x01fc0000 0 0x30000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2519  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2520  
422a295221bba8 Taniya Das                       2021-04-10  2521  		lpasscc: lpasscc@3000000 {
422a295221bba8 Taniya Das                       2021-04-10  2522  			compatible = "qcom,sc7280-lpasscc";
422a295221bba8 Taniya Das                       2021-04-10  2523  			reg = <0 0x03000000 0 0x40>,
8c7ebabd2e3f33 Satya Priya                      2022-08-10  2524  			      <0 0x03c04000 0 0x4>;
8c7ebabd2e3f33 Satya Priya                      2022-08-10  2525  			reg-names = "qdsp6ss", "top_cc";
422a295221bba8 Taniya Das                       2021-04-10  2526  			clocks = <&gcc GCC_CFG_NOC_LPASS_CLK>;
422a295221bba8 Taniya Das                       2021-04-10  2527  			clock-names = "iface";
422a295221bba8 Taniya Das                       2021-04-10  2528  			#clock-cells = <1>;
6da24ba932082b Luca Weiss                       2023-09-19  2529  			status = "reserved"; /* Owned by ADSP firmware */
422a295221bba8 Taniya Das                       2021-04-10  2530  		};
422a295221bba8 Taniya Das                       2021-04-10  2531  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2532  		lpass_rx_macro: codec@3200000 {
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2533  			compatible = "qcom,sc7280-lpass-rx-macro";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2534  			reg = <0 0x03200000 0 0x1000>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2535  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2536  			pinctrl-names = "default";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2537  			pinctrl-0 = <&lpass_rx_swr_clk>, <&lpass_rx_swr_data>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2538  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2539  			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2540  				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2541  				 <&lpass_va_macro>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2542  			clock-names = "mclk", "npl", "fsgen";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2543  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2544  			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2545  					<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2546  			power-domain-names = "macro", "dcodec";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2547  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2548  			#clock-cells = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2549  			#sound-dai-cells = <1>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2550  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2551  			status = "disabled";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2552  		};
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2553  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2554  		swr0: soundwire@3210000 {
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2555  			compatible = "qcom,soundwire-v1.6.0";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2556  			reg = <0 0x03210000 0 0x2000>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2557  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2558  			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2559  			clocks = <&lpass_rx_macro>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2560  			clock-names = "iface";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2561  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2562  			qcom,din-ports = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2563  			qcom,dout-ports = <5>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2564  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2565  			resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2566  			reset-names = "swr_audio_cgcr";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2567  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2568  			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2569  			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x3f 0x1f 0x03 0x03>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2570  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x01>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2571  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2572  			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2573  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2574  			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2575  			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2576  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2577  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2578  			#sound-dai-cells = <1>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2579  			#address-cells = <2>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2580  			#size-cells = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2581  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2582  			status = "disabled";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2583  		};
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2584  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2585  		lpass_tx_macro: codec@3220000 {
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2586  			compatible = "qcom,sc7280-lpass-tx-macro";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2587  			reg = <0 0x03220000 0 0x1000>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2588  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2589  			pinctrl-names = "default";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2590  			pinctrl-0 = <&lpass_tx_swr_clk>, <&lpass_tx_swr_data>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2591  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2592  			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2593  				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2594  				 <&lpass_va_macro>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2595  			clock-names = "mclk", "npl", "fsgen";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2596  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2597  			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2598  					<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2599  			power-domain-names = "macro", "dcodec";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2600  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2601  			#clock-cells = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2602  			#sound-dai-cells = <1>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2603  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2604  			status = "disabled";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2605  		};
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2606  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2607  		swr1: soundwire@3230000 {
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2608  			compatible = "qcom,soundwire-v1.6.0";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2609  			reg = <0 0x03230000 0 0x2000>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2610  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2611  			interrupts-extended = <&intc GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2612  					      <&pdc 130 IRQ_TYPE_LEVEL_HIGH>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2613  			clocks = <&lpass_tx_macro>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2614  			clock-names = "iface";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2615  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2616  			qcom,din-ports = <3>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2617  			qcom,dout-ports = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2618  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2619  			resets = <&lpass_audiocc LPASS_AUDIO_SWR_TX_CGCR>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2620  			reset-names = "swr_audio_cgcr";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2621  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2622  			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x03 0x03>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2623  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x00 0x02>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2624  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2625  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2626  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2627  			qcom,ports-word-length =	/bits/ 8 <0xff 0x00 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2628  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2629  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2630  			qcom,ports-lane-control =	/bits/ 8 <0x00 0x01 0x00>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2631  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2632  			#sound-dai-cells = <1>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2633  			#address-cells = <2>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2634  			#size-cells = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2635  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2636  			status = "disabled";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2637  		};
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2638  
9499240d15f297 Taniya Das                       2022-02-02  2639  		lpass_audiocc: clock-controller@3300000 {
9499240d15f297 Taniya Das                       2022-02-02  2640  			compatible = "qcom,sc7280-lpassaudiocc";
cb1d0aaa674e99 Satya Priya                      2022-09-20  2641  			reg = <0 0x03300000 0 0x30000>,
cb1d0aaa674e99 Satya Priya                      2022-09-20  2642  			      <0 0x032a9000 0 0x1000>;
9499240d15f297 Taniya Das                       2022-02-02  2643  			clocks = <&rpmhcc RPMH_CXO_CLK>,
9499240d15f297 Taniya Das                       2022-02-02  2644  			       <&lpass_aon LPASS_AON_CC_MAIN_RCG_CLK_SRC>;
9499240d15f297 Taniya Das                       2022-02-02  2645  			clock-names = "bi_tcxo", "lpass_aon_cc_main_rcg_clk_src";
9499240d15f297 Taniya Das                       2022-02-02  2646  			power-domains = <&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
9499240d15f297 Taniya Das                       2022-02-02  2647  			#clock-cells = <1>;
9499240d15f297 Taniya Das                       2022-02-02  2648  			#power-domain-cells = <1>;
e02a16c23410a1 Taniya Das                       2022-08-10  2649  			#reset-cells = <1>;
9499240d15f297 Taniya Das                       2022-02-02  2650  		};
9499240d15f297 Taniya Das                       2022-02-02  2651  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2652  		lpass_va_macro: codec@3370000 {
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2653  			compatible = "qcom,sc7280-lpass-va-macro";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2654  			reg = <0 0x03370000 0 0x1000>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2655  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2656  			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2657  			clock-names = "mclk";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2658  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2659  			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2660  					<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2661  			power-domain-names = "macro", "dcodec";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2662  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2663  			#clock-cells = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2664  			#sound-dai-cells = <1>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2665  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2666  			status = "disabled";
9499240d15f297 Taniya Das                       2022-02-02  2667  		};
9499240d15f297 Taniya Das                       2022-02-02  2668  
9499240d15f297 Taniya Das                       2022-02-02  2669  		lpass_aon: clock-controller@3380000 {
9499240d15f297 Taniya Das                       2022-02-02  2670  			compatible = "qcom,sc7280-lpassaoncc";
9499240d15f297 Taniya Das                       2022-02-02  2671  			reg = <0 0x03380000 0 0x30000>;
9499240d15f297 Taniya Das                       2022-02-02  2672  			clocks = <&rpmhcc RPMH_CXO_CLK>,
9499240d15f297 Taniya Das                       2022-02-02  2673  			       <&rpmhcc RPMH_CXO_CLK_A>,
d9a1e922730389 Satya Priya                      2022-08-10  2674  			       <&lpass_core LPASS_CORE_CC_CORE_CLK>;
9499240d15f297 Taniya Das                       2022-02-02  2675  			clock-names = "bi_tcxo", "bi_tcxo_ao", "iface";
9499240d15f297 Taniya Das                       2022-02-02  2676  			#clock-cells = <1>;
9499240d15f297 Taniya Das                       2022-02-02  2677  			#power-domain-cells = <1>;
6da24ba932082b Luca Weiss                       2023-09-19  2678  			status = "reserved"; /* Owned by ADSP firmware */
9499240d15f297 Taniya Das                       2022-02-02  2679  		};
9499240d15f297 Taniya Das                       2022-02-02  2680  
d9a1e922730389 Satya Priya                      2022-08-10  2681  		lpass_core: clock-controller@3900000 {
9499240d15f297 Taniya Das                       2022-02-02  2682  			compatible = "qcom,sc7280-lpasscorecc";
9499240d15f297 Taniya Das                       2022-02-02  2683  			reg = <0 0x03900000 0 0x50000>;
9499240d15f297 Taniya Das                       2022-02-02  2684  			clocks = <&rpmhcc RPMH_CXO_CLK>;
9499240d15f297 Taniya Das                       2022-02-02  2685  			clock-names = "bi_tcxo";
9499240d15f297 Taniya Das                       2022-02-02  2686  			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>;
9499240d15f297 Taniya Das                       2022-02-02  2687  			#clock-cells = <1>;
9499240d15f297 Taniya Das                       2022-02-02  2688  			#power-domain-cells = <1>;
6da24ba932082b Luca Weiss                       2023-09-19  2689  			status = "reserved"; /* Owned by ADSP firmware */
9499240d15f297 Taniya Das                       2022-02-02  2690  		};
9499240d15f297 Taniya Das                       2022-02-02  2691  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2692  		lpass_cpu: audio@3987000 {
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2693  			compatible = "qcom,sc7280-lpass-cpu";
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2694  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2695  			reg = <0 0x03987000 0 0x68000>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2696  			      <0 0x03b00000 0 0x29000>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2697  			      <0 0x03260000 0 0xc000>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2698  			      <0 0x03280000 0 0x29000>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2699  			      <0 0x03340000 0 0x29000>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2700  			      <0 0x0336c000 0 0x3000>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2701  			reg-names = "lpass-hdmiif",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2702  				    "lpass-lpaif",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2703  				    "lpass-rxtx-cdc-dma-lpm",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2704  				    "lpass-rxtx-lpaif",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2705  				    "lpass-va-lpaif",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2706  				    "lpass-va-cdc-dma-lpm";
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2707  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2708  			iommus = <&apps_smmu 0x1820 0>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2709  				 <&apps_smmu 0x1821 0>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2710  				 <&apps_smmu 0x1832 0>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2711  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2712  			power-domains = <&rpmhpd SC7280_LCX>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2713  			power-domain-names = "lcx";
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2714  			required-opps = <&rpmhpd_opp_nom>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2715  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2716  			clocks = <&lpass_aon LPASS_AON_CC_AUDIO_HM_H_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2717  				 <&lpass_core LPASS_CORE_CC_EXT_MCLK0_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2718  				 <&lpass_core LPASS_CORE_CC_SYSNOC_MPORT_CORE_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2719  				 <&lpass_core LPASS_CORE_CC_EXT_IF0_IBIT_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2720  				 <&lpass_core LPASS_CORE_CC_EXT_IF1_IBIT_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2721  				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2722  				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM0_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2723  				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM1_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2724  				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM2_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2725  				 <&lpass_aon LPASS_AON_CC_VA_MEM0_CLK>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2726  			clock-names = "aon_cc_audio_hm_h",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2727  				      "audio_cc_ext_mclk0",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2728  				      "core_cc_sysnoc_mport_core",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2729  				      "core_cc_ext_if0_ibit",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2730  				      "core_cc_ext_if1_ibit",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2731  				      "audio_cc_codec_mem",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2732  				      "audio_cc_codec_mem0",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2733  				      "audio_cc_codec_mem1",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2734  				      "audio_cc_codec_mem2",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2735  				      "aon_cc_va_mem0";
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2736  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2737  			#sound-dai-cells = <1>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2738  			#address-cells = <1>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2739  			#size-cells = <0>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2740  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2741  			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2742  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2743  				     <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2744  				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2745  			interrupt-names = "lpass-irq-lpaif",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2746  					  "lpass-irq-hdmi",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2747  					  "lpass-irq-vaif",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2748  					  "lpass-irq-rxtxif";
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2749  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2750  			status = "disabled";
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2751  		};
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2752  
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2753  		slimbam: dma-controller@3a84000 {
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2754  			compatible = "qcom,bam-v1.7.0";
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2755  			reg = <0 0x03a84000 0 0x20000>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2756  			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2757  			#dma-cells = <1>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2758  			qcom,controlled-remotely;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2759  			num-channels = <31>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2760  			qcom,ee = <1>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2761  			qcom,num-ees = <2>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2762  			iommus = <&apps_smmu 0x1826 0x0>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2763  			status = "disabled";
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2764  		};
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2765  
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2766  		slim: slim-ngd@3ac0000 {
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2767  			compatible = "qcom,slim-ngd-v1.5.0";
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2768  			reg = <0 0x03ac0000 0 0x2c000>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2769  			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2770  			dmas = <&slimbam 3>, <&slimbam 4>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2771  			dma-names = "rx", "tx";
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2772  			iommus = <&apps_smmu 0x1826 0x0>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2773  			#address-cells = <1>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2774  			#size-cells = <0>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2775  			status = "disabled";
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2776  		};
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2777  
9499240d15f297 Taniya Das                       2022-02-02  2778  		lpass_hm: clock-controller@3c00000 {
9499240d15f297 Taniya Das                       2022-02-02  2779  			compatible = "qcom,sc7280-lpasshm";
94ca994d7e932c Konrad Dybcio                    2023-01-02  2780  			reg = <0 0x03c00000 0 0x28>;
9499240d15f297 Taniya Das                       2022-02-02  2781  			clocks = <&rpmhcc RPMH_CXO_CLK>;
9499240d15f297 Taniya Das                       2022-02-02  2782  			clock-names = "bi_tcxo";
9499240d15f297 Taniya Das                       2022-02-02  2783  			#clock-cells = <1>;
9499240d15f297 Taniya Das                       2022-02-02  2784  			#power-domain-cells = <1>;
6da24ba932082b Luca Weiss                       2023-09-19  2785  			status = "reserved"; /* Owned by ADSP firmware */
9499240d15f297 Taniya Das                       2022-02-02  2786  		};
9499240d15f297 Taniya Das                       2022-02-02  2787  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2788  		lpass_ag_noc: interconnect@3c40000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2789  			reg = <0 0x03c40000 0 0xf080>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2790  			compatible = "qcom,sc7280-lpass-ag-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2791  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2792  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2793  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  2794  
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2795  		lpass_tlmm: pinctrl@33c0000 {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2796  			compatible = "qcom,sc7280-lpass-lpi-pinctrl";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2797  			reg = <0 0x033c0000 0x0 0x20000>,
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2798  				<0 0x03550000 0x0 0x10000>;
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2799  			gpio-controller;
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2800  			#gpio-cells = <2>;
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2801  			gpio-ranges = <&lpass_tlmm 0 0 15>;
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2802  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2803  			lpass_dmic01_clk: dmic01-clk-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2804  				pins = "gpio6";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2805  				function = "dmic1_clk";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2806  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2807  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2808  			lpass_dmic01_data: dmic01-data-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2809  				pins = "gpio7";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2810  				function = "dmic1_data";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2811  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2812  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2813  			lpass_dmic23_clk: dmic23-clk-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2814  				pins = "gpio8";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2815  				function = "dmic2_clk";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2816  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2817  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2818  			lpass_dmic23_data: dmic23-data-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2819  				pins = "gpio9";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2820  				function = "dmic2_data";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2821  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2822  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2823  			lpass_rx_swr_clk: rx-swr-clk-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2824  				pins = "gpio3";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2825  				function = "swr_rx_clk";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2826  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2827  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2828  			lpass_rx_swr_data: rx-swr-data-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2829  				pins = "gpio4", "gpio5";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2830  				function = "swr_rx_data";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2831  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2832  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2833  			lpass_tx_swr_clk: tx-swr-clk-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2834  				pins = "gpio0";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2835  				function = "swr_tx_clk";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2836  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2837  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2838  			lpass_tx_swr_data: tx-swr-data-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2839  				pins = "gpio1", "gpio2", "gpio14";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2840  				function = "swr_tx_data";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2841  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2842  		};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2843  
b39f266c19f02c Manaf Meethalavalappu Pallikunhi 2021-08-11  2844  		gpu: gpu@3d00000 {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2845  			compatible = "qcom,adreno-635.0", "qcom,adreno";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2846  			reg = <0 0x03d00000 0 0x40000>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2847  			      <0 0x03d9e000 0 0x1000>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2848  			      <0 0x03d61000 0 0x800>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2849  			reg-names = "kgsl_3d0_reg_memory",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2850  				    "cx_mem",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2851  				    "cx_dbgc";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2852  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
94085049fdad7a Konrad Dybcio                    2023-11-20  2853  			iommus = <&adreno_smmu 0 0x400>,
94085049fdad7a Konrad Dybcio                    2023-11-20  2854  				 <&adreno_smmu 1 0x400>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2855  			operating-points-v2 = <&gpu_opp_table>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2856  			qcom,gmu = <&gmu>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2857  			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2858  			interconnect-names = "gfx-mem";
b39f266c19f02c Manaf Meethalavalappu Pallikunhi 2021-08-11  2859  			#cooling-cells = <2>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2860  
3bfef00d767124 Akhil P Oommen                   2022-02-26  2861  			nvmem-cells = <&gpu_speed_bin>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2862  			nvmem-cell-names = "speed_bin";
3bfef00d767124 Akhil P Oommen                   2022-02-26  2863  
94d5ffab9d5ebc Dmitry Baryshkov                 2024-09-07  2864  			status = "disabled";
94d5ffab9d5ebc Dmitry Baryshkov                 2024-09-07  2865  
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20  2866  			gpu_zap_shader: zap-shader {
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20  2867  				memory-region = <&gpu_zap_mem>;
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20  2868  			};
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20  2869  
96c471970b7bcb Akhil P Oommen                   2021-08-11  2870  			gpu_opp_table: opp-table {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2871  				compatible = "operating-points-v2";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2872  
96c471970b7bcb Akhil P Oommen                   2021-08-11  2873  				opp-315000000 {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2874  					opp-hz = /bits/ 64 <315000000>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2875  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2876  					opp-peak-kBps = <1804000>;
f92dbc3807a92f Eugene Lepshy                    2024-10-14  2877  					opp-supported-hw = <0x17>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2878  				};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2879  
96c471970b7bcb Akhil P Oommen                   2021-08-11  2880  				opp-450000000 {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2881  					opp-hz = /bits/ 64 <450000000>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2882  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2883  					opp-peak-kBps = <4068000>;
f92dbc3807a92f Eugene Lepshy                    2024-10-14  2884  					opp-supported-hw = <0x17>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2885  				};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2886  
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2887  				/* Only applicable for SKUs which has 550Mhz as Fmax */
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2888  				opp-550000000-0 {
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2889  					opp-hz = /bits/ 64 <550000000>;
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2890  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2891  					opp-peak-kBps = <8368000>;
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2892  					opp-supported-hw = <0x01>;
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2893  				};
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2894  
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2895  				opp-550000000-1 {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2896  					opp-hz = /bits/ 64 <550000000>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2897  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2898  					opp-peak-kBps = <6832000>;
f92dbc3807a92f Eugene Lepshy                    2024-10-14  2899  					opp-supported-hw = <0x16>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2900  				};
3bfef00d767124 Akhil P Oommen                   2022-02-26  2901  
3bfef00d767124 Akhil P Oommen                   2022-02-26  2902  				opp-608000000 {
3bfef00d767124 Akhil P Oommen                   2022-02-26  2903  					opp-hz = /bits/ 64 <608000000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2904  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2905  					opp-peak-kBps = <8368000>;
f92dbc3807a92f Eugene Lepshy                    2024-10-14  2906  					opp-supported-hw = <0x16>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2907  				};
3bfef00d767124 Akhil P Oommen                   2022-02-26  2908  
3bfef00d767124 Akhil P Oommen                   2022-02-26  2909  				opp-700000000 {
3bfef00d767124 Akhil P Oommen                   2022-02-26  2910  					opp-hz = /bits/ 64 <700000000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2911  					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2912  					opp-peak-kBps = <8532000>;
6a7f8c635dab30 Konrad Dybcio                    2023-11-20  2913  					opp-supported-hw = <0x06>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2914  				};
3bfef00d767124 Akhil P Oommen                   2022-02-26  2915  
3bfef00d767124 Akhil P Oommen                   2022-02-26  2916  				opp-812000000 {
3bfef00d767124 Akhil P Oommen                   2022-02-26  2917  					opp-hz = /bits/ 64 <812000000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2918  					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2919  					opp-peak-kBps = <8532000>;
6a7f8c635dab30 Konrad Dybcio                    2023-11-20  2920  					opp-supported-hw = <0x06>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2921  				};
3bfef00d767124 Akhil P Oommen                   2022-02-26  2922  
3bfef00d767124 Akhil P Oommen                   2022-02-26  2923  				opp-840000000 {
3bfef00d767124 Akhil P Oommen                   2022-02-26  2924  					opp-hz = /bits/ 64 <840000000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2925  					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2926  					opp-peak-kBps = <8532000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2927  					opp-supported-hw = <0x02>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2928  				};
3bfef00d767124 Akhil P Oommen                   2022-02-26  2929  
3bfef00d767124 Akhil P Oommen                   2022-02-26  2930  				opp-900000000 {
3bfef00d767124 Akhil P Oommen                   2022-02-26  2931  					opp-hz = /bits/ 64 <900000000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2932  					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2933  					opp-peak-kBps = <8532000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2934  					opp-supported-hw = <0x02>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2935  				};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2936  			};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2937  		};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2938  
142a4d995c6adb Douglas Anderson                 2022-01-25  2939  		gmu: gmu@3d6a000 {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2940  			compatible = "qcom,adreno-gmu-635.0", "qcom,adreno-gmu";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2941  			reg = <0 0x03d6a000 0 0x34000>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2942  				<0 0x3de0000 0 0x10000>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2943  				<0 0x0b290000 0 0x10000>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2944  			reg-names = "gmu", "rscc", "gmu_pdc";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2945  			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2946  					<GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2947  			interrupt-names = "hfi", "gmu";
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2948  			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2949  				 <&gpucc GPU_CC_CXO_CLK>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2950  				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2951  				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2952  				 <&gpucc GPU_CC_AHB_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2953  				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2954  				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2955  			clock-names = "gmu",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2956  				      "cxo",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2957  				      "axi",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2958  				      "memnoc",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2959  				      "ahb",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2960  				      "hub",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2961  				      "smmu_vote";
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2962  			power-domains = <&gpucc GPU_CC_CX_GDSC>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2963  					<&gpucc GPU_CC_GX_GDSC>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2964  			power-domain-names = "cx",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2965  					     "gx";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2966  			iommus = <&adreno_smmu 5 0x400>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2967  			operating-points-v2 = <&gmu_opp_table>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2968  
96c471970b7bcb Akhil P Oommen                   2021-08-11  2969  			gmu_opp_table: opp-table {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2970  				compatible = "operating-points-v2";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2971  
96c471970b7bcb Akhil P Oommen                   2021-08-11  2972  				opp-200000000 {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2973  					opp-hz = /bits/ 64 <200000000>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2974  					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2975  				};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2976  			};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2977  		};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2978  
422a295221bba8 Taniya Das                       2021-04-10  2979  		gpucc: clock-controller@3d90000 {
422a295221bba8 Taniya Das                       2021-04-10  2980  			compatible = "qcom,sc7280-gpucc";
422a295221bba8 Taniya Das                       2021-04-10  2981  			reg = <0 0x03d90000 0 0x9000>;
422a295221bba8 Taniya Das                       2021-04-10  2982  			clocks = <&rpmhcc RPMH_CXO_CLK>,
422a295221bba8 Taniya Das                       2021-04-10  2983  				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
422a295221bba8 Taniya Das                       2021-04-10  2984  				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
422a295221bba8 Taniya Das                       2021-04-10  2985  			clock-names = "bi_tcxo",
422a295221bba8 Taniya Das                       2021-04-10  2986  				      "gcc_gpu_gpll0_clk_src",
422a295221bba8 Taniya Das                       2021-04-10  2987  				      "gcc_gpu_gpll0_div_clk_src";
422a295221bba8 Taniya Das                       2021-04-10  2988  			#clock-cells = <1>;
422a295221bba8 Taniya Das                       2021-04-10  2989  			#reset-cells = <1>;
422a295221bba8 Taniya Das                       2021-04-10  2990  			#power-domain-cells = <1>;
422a295221bba8 Taniya Das                       2021-04-10  2991  		};
422a295221bba8 Taniya Das                       2021-04-10  2992  
029d6586dc2d1d Souradeep Chowdhury              2022-12-27  2993  		dma@117f000 {
029d6586dc2d1d Souradeep Chowdhury              2022-12-27  2994  			compatible = "qcom,sc7280-dcc", "qcom,dcc";
029d6586dc2d1d Souradeep Chowdhury              2022-12-27  2995  			reg = <0x0 0x0117f000 0x0 0x1000>,
029d6586dc2d1d Souradeep Chowdhury              2022-12-27  2996  			      <0x0 0x01112000 0x0 0x6000>;
029d6586dc2d1d Souradeep Chowdhury              2022-12-27  2997  		};
029d6586dc2d1d Souradeep Chowdhury              2022-12-27  2998  
96c471970b7bcb Akhil P Oommen                   2021-08-11  2999  		adreno_smmu: iommu@3da0000 {
c564b69984a78c Konrad Dybcio                    2023-02-16  3000  			compatible = "qcom,sc7280-smmu-500", "qcom,adreno-smmu",
c564b69984a78c Konrad Dybcio                    2023-02-16  3001  				     "qcom,smmu-500", "arm,mmu-500";
96c471970b7bcb Akhil P Oommen                   2021-08-11  3002  			reg = <0 0x03da0000 0 0x20000>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  3003  			#iommu-cells = <2>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  3004  			#global-interrupts = <2>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  3005  			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  3006  					<GIC_SPI 675 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  3007  					<GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  3008  					<GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  3009  					<GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  3010  					<GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  3011  					<GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  3012  					<GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  3013  					<GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  3014  					<GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  3015  					<GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  3016  					<GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  3017  
96c471970b7bcb Akhil P Oommen                   2021-08-11  3018  			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  3019  				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  3020  				 <&gpucc GPU_CC_AHB_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  3021  				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  3022  				 <&gpucc GPU_CC_CX_GMU_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  3023  				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  3024  				 <&gpucc GPU_CC_HUB_AON_CLK>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  3025  			clock-names = "gcc_gpu_memnoc_gfx_clk",
96c471970b7bcb Akhil P Oommen                   2021-08-11  3026  					"gcc_gpu_snoc_dvm_gfx_clk",
96c471970b7bcb Akhil P Oommen                   2021-08-11  3027  					"gpu_cc_ahb_clk",
96c471970b7bcb Akhil P Oommen                   2021-08-11  3028  					"gpu_cc_hlos1_vote_gpu_smmu_clk",
96c471970b7bcb Akhil P Oommen                   2021-08-11  3029  					"gpu_cc_cx_gmu_clk",
96c471970b7bcb Akhil P Oommen                   2021-08-11  3030  					"gpu_cc_hub_cx_int_clk",
96c471970b7bcb Akhil P Oommen                   2021-08-11  3031  					"gpu_cc_hub_aon_clk";
96c471970b7bcb Akhil P Oommen                   2021-08-11  3032  
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  3033  			power-domains = <&gpucc GPU_CC_CX_GDSC>;
31edad47853418 Konrad Dybcio                    2023-11-20  3034  			dma-coherent;
96c471970b7bcb Akhil P Oommen                   2021-08-11  3035  		};
96c471970b7bcb Akhil P Oommen                   2021-08-11  3036  
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3037  		gfx_0_tbu: tbu@3dd9000 {
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3038  			compatible = "qcom,sc7280-tbu";
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3039  			reg = <0x0 0x3dd9000 0x0 0x1000>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3040  			qcom,stream-id-range = <&adreno_smmu 0x0 0x400>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3041  		};
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3042  
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3043  		gfx_1_tbu: tbu@3ddd000 {
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3044  			compatible = "qcom,sc7280-tbu";
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3045  			reg = <0x0 0x3ddd000 0x0 0x1000>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3046  			qcom,stream-id-range = <&adreno_smmu 0x400 0x400>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3047  		};
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3048  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3049  		remoteproc_mpss: remoteproc@4080000 {
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3050  			compatible = "qcom,sc7280-mpss-pas";
419618bd90f6b2 Luca Weiss                       2023-12-08  3051  			reg = <0 0x04080000 0 0x10000>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3052  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3053  			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3054  					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3055  					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3056  					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3057  					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3058  					      <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3059  			interrupt-names = "wdog", "fatal", "ready", "handover",
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3060  					  "stop-ack", "shutdown-ack";
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3061  
92476ddf02b566 Krzysztof Kozlowski              2022-11-24  3062  			clocks = <&rpmhcc RPMH_CXO_CLK>;
92476ddf02b566 Krzysztof Kozlowski              2022-11-24  3063  			clock-names = "xo";
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3064  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3065  			power-domains = <&rpmhpd SC7280_CX>,
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3066  					<&rpmhpd SC7280_MSS>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3067  			power-domain-names = "cx", "mss";
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3068  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3069  			memory-region = <&mpss_mem>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3070  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3071  			qcom,qmp = <&aoss_qmp>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3072  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3073  			qcom,smem-states = <&modem_smp2p_out 0>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3074  			qcom,smem-state-names = "stop";
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3075  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3076  			status = "disabled";
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3077  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3078  			glink-edge {
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3079  				interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3080  							     IPCC_MPROC_SIGNAL_GLINK_QMP
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3081  							     IRQ_TYPE_EDGE_RISING>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3082  				mboxes = <&ipcc IPCC_CLIENT_MPSS
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3083  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3084  				label = "modem";
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3085  				qcom,remote-pid = <1>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3086  			};
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3087  		};
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3088  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3089  		stm@6002000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3090  			compatible = "arm,coresight-stm", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3091  			reg = <0 0x06002000 0 0x1000>,
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3092  			      <0 0x16280000 0 0x180000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3093  			reg-names = "stm-base", "stm-stimulus-base";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3094  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3095  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3096  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3097  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3098  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3099  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3100  					stm_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3101  						remote-endpoint = <&funnel0_in7>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3102  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3103  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3104  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3105  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3106  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3107  		funnel@6041000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3108  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3109  			reg = <0 0x06041000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3110  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3111  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3112  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3113  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3114  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3115  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3116  					funnel0_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3117  						remote-endpoint = <&merge_funnel_in0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3118  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3119  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3120  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3121  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3122  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3123  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3124  				#size-cells = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3125  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3126  				port@7 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3127  					reg = <7>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3128  					funnel0_in7: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3129  						remote-endpoint = <&stm_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3130  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3131  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3132  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3133  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3134  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3135  		funnel@6042000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3136  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3137  			reg = <0 0x06042000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3138  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3139  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3140  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3141  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3142  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3143  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3144  					funnel1_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3145  						remote-endpoint = <&merge_funnel_in1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3146  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3147  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3148  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3149  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3150  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3151  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3152  				#size-cells = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3153  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3154  				port@4 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3155  					reg = <4>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3156  					funnel1_in4: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3157  						remote-endpoint = <&apss_merge_funnel_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3158  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3159  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3160  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3161  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3162  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3163  		funnel@6045000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3164  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3165  			reg = <0 0x06045000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3166  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3167  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3168  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3169  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3170  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3171  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3172  					merge_funnel_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3173  						remote-endpoint = <&swao_funnel_in>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3174  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3175  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3176  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3177  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3178  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3179  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3180  				#size-cells = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3181  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3182  				port@0 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3183  					reg = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3184  					merge_funnel_in0: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3185  						remote-endpoint = <&funnel0_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3186  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3187  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3188  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3189  				port@1 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3190  					reg = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3191  					merge_funnel_in1: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3192  						remote-endpoint = <&funnel1_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3193  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3194  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3195  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3196  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3197  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3198  		replicator@6046000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3199  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3200  			reg = <0 0x06046000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3201  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3202  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3203  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3204  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3205  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3206  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3207  					replicator_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3208  						remote-endpoint = <&etr_in>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3209  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3210  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3211  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3212  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3213  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3214  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3215  					replicator_in: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3216  						remote-endpoint = <&swao_replicator_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3217  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3218  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3219  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3220  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3221  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3222  		etr@6048000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3223  			compatible = "arm,coresight-tmc", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3224  			reg = <0 0x06048000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3225  			iommus = <&apps_smmu 0x04c0 0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3226  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3227  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3228  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3229  			arm,scatter-gather;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3230  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3231  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3232  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3233  					etr_in: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3234  						remote-endpoint = <&replicator_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3235  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3236  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3237  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3238  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3239  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3240  		funnel@6b04000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3241  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3242  			reg = <0 0x06b04000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3243  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3244  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3245  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3246  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3247  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3248  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3249  					swao_funnel_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3250  						remote-endpoint = <&etf_in>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3251  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3252  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3253  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3254  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3255  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3256  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3257  				#size-cells = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3258  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3259  				port@7 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3260  					reg = <7>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3261  					swao_funnel_in: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3262  						remote-endpoint = <&merge_funnel_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3263  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3264  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3265  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3266  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3267  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3268  		etf@6b05000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3269  			compatible = "arm,coresight-tmc", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3270  			reg = <0 0x06b05000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3271  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3272  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3273  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3274  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3275  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3276  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3277  					etf_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3278  						remote-endpoint = <&swao_replicator_in>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3279  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3280  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3281  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3282  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3283  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3284  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3285  					etf_in: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3286  						remote-endpoint = <&swao_funnel_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3287  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3288  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3289  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3290  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3291  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3292  		replicator@6b06000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3293  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3294  			reg = <0 0x06b06000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3295  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3296  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3297  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3298  			qcom,replicator-loses-context;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3299  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3300  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3301  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3302  					swao_replicator_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3303  						remote-endpoint = <&replicator_in>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3304  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3305  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3306  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3307  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3308  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3309  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3310  					swao_replicator_in: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3311  						remote-endpoint = <&etf_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3312  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3313  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3314  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3315  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3316  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3317  		etm@7040000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3318  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3319  			reg = <0 0x07040000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3320  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  3321  			cpu = <&cpu0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3322  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3323  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3324  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3325  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3326  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3327  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3328  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3329  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3330  					etm0_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3331  						remote-endpoint = <&apss_funnel_in0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3332  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3333  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3334  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3335  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3336  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3337  		etm@7140000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3338  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3339  			reg = <0 0x07140000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3340  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  3341  			cpu = <&cpu1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3342  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3343  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3344  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3345  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3346  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3347  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3348  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3349  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3350  					etm1_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3351  						remote-endpoint = <&apss_funnel_in1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3352  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3353  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3354  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3355  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3356  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3357  		etm@7240000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3358  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3359  			reg = <0 0x07240000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3360  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  3361  			cpu = <&cpu2>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3362  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3363  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3364  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3365  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3366  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3367  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3368  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3369  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3370  					etm2_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3371  						remote-endpoint = <&apss_funnel_in2>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3372  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3373  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3374  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3375  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3376  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3377  		etm@7340000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3378  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3379  			reg = <0 0x07340000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3380  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  3381  			cpu = <&cpu3>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3382  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3383  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3384  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3385  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3386  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3387  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3388  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3389  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3390  					etm3_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3391  						remote-endpoint = <&apss_funnel_in3>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3392  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3393  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3394  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3395  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3396  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3397  		etm@7440000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3398  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3399  			reg = <0 0x07440000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3400  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  3401  			cpu = <&cpu4>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3402  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3403  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3404  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3405  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3406  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3407  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3408  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3409  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3410  					etm4_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3411  						remote-endpoint = <&apss_funnel_in4>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3412  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3413  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3414  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3415  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3416  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3417  		etm@7540000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3418  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3419  			reg = <0 0x07540000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3420  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  3421  			cpu = <&cpu5>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3422  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3423  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3424  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3425  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3426  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3427  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3428  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3429  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3430  					etm5_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3431  						remote-endpoint = <&apss_funnel_in5>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3432  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3433  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3434  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3435  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3436  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3437  		etm@7640000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3438  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3439  			reg = <0 0x07640000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3440  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  3441  			cpu = <&cpu6>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3442  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3443  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3444  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3445  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3446  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3447  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3448  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3449  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3450  					etm6_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3451  						remote-endpoint = <&apss_funnel_in6>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3452  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3453  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3454  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3455  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3456  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3457  		etm@7740000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3458  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3459  			reg = <0 0x07740000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3460  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  3461  			cpu = <&cpu7>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3462  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3463  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3464  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3465  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3466  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3467  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3468  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3469  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3470  					etm7_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3471  						remote-endpoint = <&apss_funnel_in7>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3472  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3473  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3474  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3475  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3476  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3477  		funnel@7800000 { /* APSS Funnel */
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3478  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3479  			reg = <0 0x07800000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3480  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3481  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3482  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3483  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3484  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3485  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3486  					apss_funnel_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3487  						remote-endpoint = <&apss_merge_funnel_in>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3488  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3489  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3490  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3491  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3492  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3493  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3494  				#size-cells = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3495  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3496  				port@0 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3497  					reg = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3498  					apss_funnel_in0: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3499  						remote-endpoint = <&etm0_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3500  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3501  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3502  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3503  				port@1 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3504  					reg = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3505  					apss_funnel_in1: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3506  						remote-endpoint = <&etm1_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3507  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3508  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3509  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3510  				port@2 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3511  					reg = <2>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3512  					apss_funnel_in2: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3513  						remote-endpoint = <&etm2_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3514  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3515  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3516  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3517  				port@3 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3518  					reg = <3>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3519  					apss_funnel_in3: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3520  						remote-endpoint = <&etm3_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3521  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3522  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3523  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3524  				port@4 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3525  					reg = <4>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3526  					apss_funnel_in4: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3527  						remote-endpoint = <&etm4_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3528  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3529  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3530  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3531  				port@5 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3532  					reg = <5>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3533  					apss_funnel_in5: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3534  						remote-endpoint = <&etm5_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3535  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3536  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3537  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3538  				port@6 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3539  					reg = <6>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3540  					apss_funnel_in6: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3541  						remote-endpoint = <&etm6_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3542  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3543  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3544  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3545  				port@7 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3546  					reg = <7>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3547  					apss_funnel_in7: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3548  						remote-endpoint = <&etm7_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3549  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3550  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3551  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3552  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3553  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3554  		funnel@7810000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3555  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3556  			reg = <0 0x07810000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3557  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3558  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3559  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3560  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3561  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3562  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3563  					apss_merge_funnel_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3564  						remote-endpoint = <&funnel1_in4>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3565  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3566  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3567  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3568  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3569  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3570  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3571  					apss_merge_funnel_in: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3572  						remote-endpoint = <&apss_funnel_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3573  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3574  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3575  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3576  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3577  
96bb736f05d156 Bhupesh Sharma                   2022-05-15  3578  		sdhc_2: mmc@8804000 {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3579  			compatible = "qcom,sc7280-sdhci", "qcom,sdhci-msm-v5";
f9800dde34e678 Douglas Anderson                 2022-02-02  3580  			pinctrl-names = "default", "sleep";
f9800dde34e678 Douglas Anderson                 2022-02-02  3581  			pinctrl-0 = <&sdc2_clk>, <&sdc2_cmd>, <&sdc2_data>;
f9800dde34e678 Douglas Anderson                 2022-02-02  3582  			pinctrl-1 = <&sdc2_clk_sleep>, <&sdc2_cmd_sleep>, <&sdc2_data_sleep>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3583  			status = "disabled";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3584  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3585  			reg = <0 0x08804000 0 0x1000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3586  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3587  			iommus = <&apps_smmu 0x100 0x0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3588  			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3589  				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3590  			interrupt-names = "hc_irq", "pwr_irq";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3591  
4ff12270dbbe24 Bhupesh Sharma                   2022-05-15  3592  			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
4ff12270dbbe24 Bhupesh Sharma                   2022-05-15  3593  				 <&gcc GCC_SDCC2_APPS_CLK>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3594  				 <&rpmhcc RPMH_CXO_CLK>;
4ff12270dbbe24 Bhupesh Sharma                   2022-05-15  3595  			clock-names = "iface", "core", "xo";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3596  			interconnects = <&aggre1_noc MASTER_SDCC_2 0 &mc_virt SLAVE_EBI1 0>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3597  					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_SDCC_2 0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3598  			interconnect-names = "sdhc-ddr","cpu-sdhc";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3599  			power-domains = <&rpmhpd SC7280_CX>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3600  			operating-points-v2 = <&sdhc2_opp_table>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3601  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3602  			bus-width = <4>;
827f5fc8d91220 Konrad Dybcio                    2023-12-18  3603  			dma-coherent;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3604  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3605  			qcom,dll-config = <0x0007642c>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3606  
959cb513074386 Shaik Sajida Bhanu               2022-04-12  3607  			resets = <&gcc GCC_SDCC2_BCR>;
959cb513074386 Shaik Sajida Bhanu               2022-04-12  3608  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3609  			sdhc2_opp_table: opp-table {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3610  				compatible = "operating-points-v2";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3611  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3612  				opp-100000000 {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3613  					opp-hz = /bits/ 64 <100000000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3614  					required-opps = <&rpmhpd_opp_low_svs>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3615  					opp-peak-kBps = <1800000 400000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3616  					opp-avg-kBps = <100000 0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3617  				};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3618  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3619  				opp-202000000 {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3620  					opp-hz = /bits/ 64 <202000000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3621  					required-opps = <&rpmhpd_opp_nom>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3622  					opp-peak-kBps = <5400000 1600000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3623  					opp-avg-kBps = <200000 0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3624  				};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3625  			};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3626  		};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3627  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3628  		usb_1_hsphy: phy@88e3000 {
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3629  			compatible = "qcom,sc7280-usb-hs-phy",
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3630  				     "qcom,usb-snps-hs-7nm-phy";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3631  			reg = <0 0x088e3000 0 0x400>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3632  			status = "disabled";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3633  			#phy-cells = <0>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3634  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3635  			clocks = <&rpmhcc RPMH_CXO_CLK>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3636  			clock-names = "ref";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3637  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3638  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3639  		};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3640  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3641  		usb_2_hsphy: phy@88e4000 {
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3642  			compatible = "qcom,sc7280-usb-hs-phy",
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3643  				     "qcom,usb-snps-hs-7nm-phy";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3644  			reg = <0 0x088e4000 0 0x400>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3645  			status = "disabled";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3646  			#phy-cells = <0>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3647  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3648  			clocks = <&rpmhcc RPMH_CXO_CLK>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3649  			clock-names = "ref";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3650  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3651  			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3652  		};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3653  
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3654  		usb_1_qmpphy: phy@88e8000 {
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3655  			compatible = "qcom,sc7280-qmp-usb3-dp-phy";
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3656  			reg = <0 0x088e8000 0 0x3000>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3657  			status = "disabled";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3658  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3659  			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3660  				 <&rpmhcc RPMH_CXO_CLK>,
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3661  				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3662  				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3663  			clock-names = "aux",
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3664  				      "ref",
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3665  				      "com_aux",
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3666  				      "usb3_pipe";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3667  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3668  			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3669  				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3670  			reset-names = "phy", "common";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3671  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3672  			#clock-cells = <1>;
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3673  			#phy-cells = <1>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3674  
6b51f5e1811398 Luca Weiss                       2025-04-25  3675  			orientation-switch;
6b51f5e1811398 Luca Weiss                       2025-04-25  3676  
2278b16f12a9cc Luca Weiss                       2023-09-29  3677  			ports {
2278b16f12a9cc Luca Weiss                       2023-09-29  3678  				#address-cells = <1>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3679  				#size-cells = <0>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3680  
2278b16f12a9cc Luca Weiss                       2023-09-29  3681  				port@0 {
2278b16f12a9cc Luca Weiss                       2023-09-29  3682  					reg = <0>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3683  
2278b16f12a9cc Luca Weiss                       2023-09-29  3684  					usb_dp_qmpphy_out: endpoint {
2278b16f12a9cc Luca Weiss                       2023-09-29  3685  					};
2278b16f12a9cc Luca Weiss                       2023-09-29  3686  				};
2278b16f12a9cc Luca Weiss                       2023-09-29  3687  
2278b16f12a9cc Luca Weiss                       2023-09-29  3688  				port@1 {
2278b16f12a9cc Luca Weiss                       2023-09-29  3689  					reg = <1>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3690  
2278b16f12a9cc Luca Weiss                       2023-09-29  3691  					usb_dp_qmpphy_usb_ss_in: endpoint {
6b51f5e1811398 Luca Weiss                       2025-04-25  3692  						remote-endpoint = <&usb_1_dwc3_ss>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3693  					};
2278b16f12a9cc Luca Weiss                       2023-09-29  3694  				};
2278b16f12a9cc Luca Weiss                       2023-09-29  3695  
2278b16f12a9cc Luca Weiss                       2023-09-29  3696  				port@2 {
2278b16f12a9cc Luca Weiss                       2023-09-29  3697  					reg = <2>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3698  
2278b16f12a9cc Luca Weiss                       2023-09-29  3699  					usb_dp_qmpphy_dp_in: endpoint {
6b51f5e1811398 Luca Weiss                       2025-04-25  3700  						remote-endpoint = <&mdss_dp_out>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3701  					};
2278b16f12a9cc Luca Weiss                       2023-09-29  3702  				};
2278b16f12a9cc Luca Weiss                       2023-09-29  3703  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3704  		};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3705  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3706  		usb_2: usb@8cf8800 {
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3707  			compatible = "qcom,sc7280-dwc3", "qcom,dwc3";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3708  			reg = <0 0x08cf8800 0 0x400>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3709  			status = "disabled";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3710  			#address-cells = <2>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3711  			#size-cells = <2>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3712  			ranges;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3713  			dma-ranges;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3714  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3715  			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3716  				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3717  				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3718  				 <&gcc GCC_USB30_SEC_SLEEP_CLK>,
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3719  				 <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>;
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3720  			clock-names = "cfg_noc",
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3721  				      "core",
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3722  				      "iface",
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3723  				      "sleep",
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3724  				      "mock_utmi";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3725  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3726  			assigned-clocks = <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3727  					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3728  			assigned-clock-rates = <19200000>, <200000000>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3729  
6bf150aef236fb Krishna Kurapati                 2024-01-26  3730  			interrupts-extended = <&intc GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
6bf150aef236fb Krishna Kurapati                 2024-01-26  3731  					      <&intc GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
24f8aba9a7c77c Johan Hovold                     2023-11-20  3732  					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
24f8aba9a7c77c Johan Hovold                     2023-11-20  3733  					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>;
6bf150aef236fb Krishna Kurapati                 2024-01-26  3734  			interrupt-names = "pwr_event",
6bf150aef236fb Krishna Kurapati                 2024-01-26  3735  					  "hs_phy_irq",
2a8d28b8af7906 Johan Hovold                     2022-07-15  3736  					  "dp_hs_phy_irq",
2a8d28b8af7906 Johan Hovold                     2022-07-15  3737  					  "dm_hs_phy_irq";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3738  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3739  			power-domains = <&gcc GCC_USB30_SEC_GDSC>;
3d59187efc982b Rajendra Nayak                   2022-09-16  3740  			required-opps = <&rpmhpd_opp_nom>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3741  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3742  			resets = <&gcc GCC_USB30_SEC_BCR>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3743  
6493367f8031b1 Sandeep Maheswaram               2021-08-02  3744  			interconnects = <&aggre1_noc MASTER_USB2 0 &mc_virt SLAVE_EBI1 0>,
6493367f8031b1 Sandeep Maheswaram               2021-08-02  3745  					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_USB2 0>;
6493367f8031b1 Sandeep Maheswaram               2021-08-02  3746  			interconnect-names = "usb-ddr", "apps-usb";
6493367f8031b1 Sandeep Maheswaram               2021-08-02  3747  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3748  			usb_2_dwc3: usb@8c00000 {
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3749  				compatible = "snps,dwc3";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3750  				reg = <0 0x08c00000 0 0xe000>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3751  				interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3752  				iommus = <&apps_smmu 0xa0 0x0>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3753  				snps,dis_u2_susphy_quirk;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3754  				snps,dis_enblslpm_quirk;
0a13ba449afd41 Krishna Kurapati                 2024-12-31  3755  				snps,dis-u1-entry-quirk;
0a13ba449afd41 Krishna Kurapati                 2024-12-31  3756  				snps,dis-u2-entry-quirk;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3757  				phys = <&usb_2_hsphy>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3758  				phy-names = "usb2-phy";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3759  				maximum-speed = "high-speed";
0b059979090d72 Souradeep Chowdhury              2022-04-06  3760  				usb-role-switch;
9ee402ccfeb163 Bhupesh Sharma                   2023-05-02  3761  
0b059979090d72 Souradeep Chowdhury              2022-04-06  3762  				port {
0b059979090d72 Souradeep Chowdhury              2022-04-06  3763  					usb2_role_switch: endpoint {
0b059979090d72 Souradeep Chowdhury              2022-04-06  3764  						remote-endpoint = <&eud_ep>;
0b059979090d72 Souradeep Chowdhury              2022-04-06  3765  					};
0b059979090d72 Souradeep Chowdhury              2022-04-06  3766  				};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3767  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3768  		};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3769  
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3770  		qspi: spi@88dc000 {
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3771  			compatible = "qcom,sc7280-qspi", "qcom,qspi-v1";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3772  			reg = <0 0x088dc000 0 0x1000>;
cc406006126e89 Vijaya Krishna Nivarthi          2023-04-24  3773  			iommus = <&apps_smmu 0x20 0x0>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3774  			#address-cells = <1>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3775  			#size-cells = <0>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3776  			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3777  			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3778  				 <&gcc GCC_QSPI_CORE_CLK>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3779  			clock-names = "iface", "core";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3780  			interconnects = <&gem_noc MASTER_APPSS_PROC 0
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3781  					&cnoc2 SLAVE_QSPI_0 0>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3782  			interconnect-names = "qspi-config";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3783  			power-domains = <&rpmhpd SC7280_CX>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3784  			operating-points-v2 = <&qspi_opp_table>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3785  			status = "disabled";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3786  		};
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3787  
3658e411efcbb4 Luca Weiss                       2023-12-08  3788  		remoteproc_adsp: remoteproc@3700000 {
3658e411efcbb4 Luca Weiss                       2023-12-08  3789  			compatible = "qcom,sc7280-adsp-pas";
3658e411efcbb4 Luca Weiss                       2023-12-08  3790  			reg = <0 0x03700000 0 0x100>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3791  
f011688162ec4c Luca Weiss                       2024-02-19  3792  			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
3658e411efcbb4 Luca Weiss                       2023-12-08  3793  					      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
3658e411efcbb4 Luca Weiss                       2023-12-08  3794  					      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
3658e411efcbb4 Luca Weiss                       2023-12-08  3795  					      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
3658e411efcbb4 Luca Weiss                       2023-12-08  3796  					      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
3658e411efcbb4 Luca Weiss                       2023-12-08  3797  					      <&adsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3798  			interrupt-names = "wdog", "fatal", "ready", "handover",
3658e411efcbb4 Luca Weiss                       2023-12-08  3799  					  "stop-ack", "shutdown-ack";
3658e411efcbb4 Luca Weiss                       2023-12-08  3800  
3658e411efcbb4 Luca Weiss                       2023-12-08  3801  			clocks = <&rpmhcc RPMH_CXO_CLK>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3802  			clock-names = "xo";
3658e411efcbb4 Luca Weiss                       2023-12-08  3803  
3658e411efcbb4 Luca Weiss                       2023-12-08  3804  			power-domains = <&rpmhpd SC7280_LCX>,
3658e411efcbb4 Luca Weiss                       2023-12-08  3805  					<&rpmhpd SC7280_LMX>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3806  			power-domain-names = "lcx", "lmx";
3658e411efcbb4 Luca Weiss                       2023-12-08  3807  
3658e411efcbb4 Luca Weiss                       2023-12-08  3808  			memory-region = <&adsp_mem>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3809  
3658e411efcbb4 Luca Weiss                       2023-12-08  3810  			qcom,qmp = <&aoss_qmp>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3811  
3658e411efcbb4 Luca Weiss                       2023-12-08  3812  			qcom,smem-states = <&adsp_smp2p_out 0>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3813  			qcom,smem-state-names = "stop";
3658e411efcbb4 Luca Weiss                       2023-12-08  3814  
3658e411efcbb4 Luca Weiss                       2023-12-08  3815  			status = "disabled";
3658e411efcbb4 Luca Weiss                       2023-12-08  3816  
3658e411efcbb4 Luca Weiss                       2023-12-08  3817  			glink-edge {
3658e411efcbb4 Luca Weiss                       2023-12-08  3818  				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
3658e411efcbb4 Luca Weiss                       2023-12-08  3819  							     IPCC_MPROC_SIGNAL_GLINK_QMP
3658e411efcbb4 Luca Weiss                       2023-12-08  3820  							     IRQ_TYPE_EDGE_RISING>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3821  
3658e411efcbb4 Luca Weiss                       2023-12-08  3822  				mboxes = <&ipcc IPCC_CLIENT_LPASS
3658e411efcbb4 Luca Weiss                       2023-12-08  3823  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3824  
3658e411efcbb4 Luca Weiss                       2023-12-08  3825  				label = "lpass";
3658e411efcbb4 Luca Weiss                       2023-12-08  3826  				qcom,remote-pid = <2>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3827  
f44da5d8722de3 Luca Weiss                       2024-05-10  3828  				apr {
f44da5d8722de3 Luca Weiss                       2024-05-10  3829  					compatible = "qcom,apr-v2";
f44da5d8722de3 Luca Weiss                       2024-05-10  3830  					qcom,glink-channels = "apr_audio_svc";
f44da5d8722de3 Luca Weiss                       2024-05-10  3831  					qcom,domain = <APR_DOMAIN_ADSP>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3832  					#address-cells = <1>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3833  					#size-cells = <0>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3834  
f44da5d8722de3 Luca Weiss                       2024-05-10  3835  					service@3 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3836  						reg = <APR_SVC_ADSP_CORE>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3837  						compatible = "qcom,q6core";
f44da5d8722de3 Luca Weiss                       2024-05-10  3838  						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
f44da5d8722de3 Luca Weiss                       2024-05-10  3839  					};
f44da5d8722de3 Luca Weiss                       2024-05-10  3840  
f44da5d8722de3 Luca Weiss                       2024-05-10  3841  					q6afe: service@4 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3842  						compatible = "qcom,q6afe";
f44da5d8722de3 Luca Weiss                       2024-05-10  3843  						reg = <APR_SVC_AFE>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3844  						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
f44da5d8722de3 Luca Weiss                       2024-05-10  3845  
f44da5d8722de3 Luca Weiss                       2024-05-10  3846  						q6afedai: dais {
f44da5d8722de3 Luca Weiss                       2024-05-10  3847  							compatible = "qcom,q6afe-dais";
f44da5d8722de3 Luca Weiss                       2024-05-10  3848  							#address-cells = <1>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3849  							#size-cells = <0>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3850  							#sound-dai-cells = <1>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3851  						};
f44da5d8722de3 Luca Weiss                       2024-05-10  3852  
f44da5d8722de3 Luca Weiss                       2024-05-10  3853  						q6afecc: clock-controller {
f44da5d8722de3 Luca Weiss                       2024-05-10  3854  							compatible = "qcom,q6afe-clocks";
f44da5d8722de3 Luca Weiss                       2024-05-10  3855  							#clock-cells = <2>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3856  						};
f44da5d8722de3 Luca Weiss                       2024-05-10  3857  					};
f44da5d8722de3 Luca Weiss                       2024-05-10  3858  
f44da5d8722de3 Luca Weiss                       2024-05-10  3859  					q6asm: service@7 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3860  						compatible = "qcom,q6asm";
f44da5d8722de3 Luca Weiss                       2024-05-10  3861  						reg = <APR_SVC_ASM>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3862  						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
f44da5d8722de3 Luca Weiss                       2024-05-10  3863  
f44da5d8722de3 Luca Weiss                       2024-05-10  3864  						q6asmdai: dais {
f44da5d8722de3 Luca Weiss                       2024-05-10  3865  							compatible = "qcom,q6asm-dais";
f44da5d8722de3 Luca Weiss                       2024-05-10  3866  							#address-cells = <1>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3867  							#size-cells = <0>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3868  							#sound-dai-cells = <1>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3869  							iommus = <&apps_smmu 0x1801 0x0>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3870  
f44da5d8722de3 Luca Weiss                       2024-05-10  3871  							dai@0 {
f1275b0a1de733 Luca Weiss                       2025-04-25  3872  								reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3873  							};
f44da5d8722de3 Luca Weiss                       2024-05-10  3874  
f44da5d8722de3 Luca Weiss                       2024-05-10  3875  							dai@1 {
f1275b0a1de733 Luca Weiss                       2025-04-25  3876  								reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3877  							};
f44da5d8722de3 Luca Weiss                       2024-05-10  3878  
f44da5d8722de3 Luca Weiss                       2024-05-10  3879  							dai@2 {
f1275b0a1de733 Luca Weiss                       2025-04-25  3880  								reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3881  							};
f44da5d8722de3 Luca Weiss                       2024-05-10  3882  						};
f44da5d8722de3 Luca Weiss                       2024-05-10  3883  					};
f44da5d8722de3 Luca Weiss                       2024-05-10  3884  
f44da5d8722de3 Luca Weiss                       2024-05-10  3885  					q6adm: service@8 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3886  						compatible = "qcom,q6adm";
f44da5d8722de3 Luca Weiss                       2024-05-10  3887  						reg = <APR_SVC_ADM>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3888  						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
f44da5d8722de3 Luca Weiss                       2024-05-10  3889  
f44da5d8722de3 Luca Weiss                       2024-05-10  3890  						q6routing: routing {
f44da5d8722de3 Luca Weiss                       2024-05-10  3891  							compatible = "qcom,q6adm-routing";
f44da5d8722de3 Luca Weiss                       2024-05-10  3892  							#sound-dai-cells = <0>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3893  						};
f44da5d8722de3 Luca Weiss                       2024-05-10  3894  					};
f44da5d8722de3 Luca Weiss                       2024-05-10  3895  				};
f44da5d8722de3 Luca Weiss                       2024-05-10  3896  
3658e411efcbb4 Luca Weiss                       2023-12-08  3897  				fastrpc {
3658e411efcbb4 Luca Weiss                       2023-12-08  3898  					compatible = "qcom,fastrpc";
3658e411efcbb4 Luca Weiss                       2023-12-08  3899  					qcom,glink-channels = "fastrpcglink-apps-dsp";
3658e411efcbb4 Luca Weiss                       2023-12-08  3900  					label = "adsp";
3658e411efcbb4 Luca Weiss                       2023-12-08  3901  					qcom,non-secure-domain;
3658e411efcbb4 Luca Weiss                       2023-12-08  3902  					#address-cells = <1>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3903  					#size-cells = <0>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3904  
3658e411efcbb4 Luca Weiss                       2023-12-08  3905  					compute-cb@3 {
3658e411efcbb4 Luca Weiss                       2023-12-08  3906  						compatible = "qcom,fastrpc-compute-cb";
3658e411efcbb4 Luca Weiss                       2023-12-08  3907  						reg = <3>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3908  						iommus = <&apps_smmu 0x1803 0x0>;
2a49326081e1e5 Xilin Wu                         2025-04-16  3909  						dma-coherent;
3658e411efcbb4 Luca Weiss                       2023-12-08  3910  					};
3658e411efcbb4 Luca Weiss                       2023-12-08  3911  
3658e411efcbb4 Luca Weiss                       2023-12-08  3912  					compute-cb@4 {
3658e411efcbb4 Luca Weiss                       2023-12-08  3913  						compatible = "qcom,fastrpc-compute-cb";
3658e411efcbb4 Luca Weiss                       2023-12-08  3914  						reg = <4>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3915  						iommus = <&apps_smmu 0x1804 0x0>;
2a49326081e1e5 Xilin Wu                         2025-04-16  3916  						dma-coherent;
3658e411efcbb4 Luca Weiss                       2023-12-08  3917  					};
3658e411efcbb4 Luca Weiss                       2023-12-08  3918  
3658e411efcbb4 Luca Weiss                       2023-12-08  3919  					compute-cb@5 {
3658e411efcbb4 Luca Weiss                       2023-12-08  3920  						compatible = "qcom,fastrpc-compute-cb";
3658e411efcbb4 Luca Weiss                       2023-12-08  3921  						reg = <5>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3922  						iommus = <&apps_smmu 0x1805 0x0>;
2a49326081e1e5 Xilin Wu                         2025-04-16  3923  						dma-coherent;
3658e411efcbb4 Luca Weiss                       2023-12-08  3924  					};
3658e411efcbb4 Luca Weiss                       2023-12-08  3925  				};
3658e411efcbb4 Luca Weiss                       2023-12-08  3926  			};
3658e411efcbb4 Luca Weiss                       2023-12-08  3927  		};
3658e411efcbb4 Luca Weiss                       2023-12-08  3928  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3929  		remoteproc_wpss: remoteproc@8a00000 {
0bcbf092560cc1 Luca Weiss                       2023-12-08  3930  			compatible = "qcom,sc7280-wpss-pas";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3931  			reg = <0 0x08a00000 0 0x10000>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3932  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3933  			interrupts-extended = <&intc GIC_SPI 587 IRQ_TYPE_EDGE_RISING>,
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3934  					      <&wpss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3935  					      <&wpss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3936  					      <&wpss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3937  					      <&wpss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3938  					      <&wpss_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3939  			interrupt-names = "wdog", "fatal", "ready", "handover",
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3940  					  "stop-ack", "shutdown-ack";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3941  
0bcbf092560cc1 Luca Weiss                       2023-12-08  3942  			clocks = <&rpmhcc RPMH_CXO_CLK>;
0bcbf092560cc1 Luca Weiss                       2023-12-08  3943  			clock-names = "xo";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3944  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3945  			power-domains = <&rpmhpd SC7280_CX>,
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3946  					<&rpmhpd SC7280_MX>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3947  			power-domain-names = "cx", "mx";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3948  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3949  			memory-region = <&wpss_mem>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3950  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3951  			qcom,qmp = <&aoss_qmp>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3952  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3953  			qcom,smem-states = <&wpss_smp2p_out 0>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3954  			qcom,smem-state-names = "stop";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3955  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3956  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3957  			status = "disabled";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3958  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3959  			glink-edge {
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3960  				interrupts-extended = <&ipcc IPCC_CLIENT_WPSS
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3961  							     IPCC_MPROC_SIGNAL_GLINK_QMP
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3962  							     IRQ_TYPE_EDGE_RISING>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3963  				mboxes = <&ipcc IPCC_CLIENT_WPSS
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3964  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3965  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3966  				label = "wpss";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3967  				qcom,remote-pid = <13>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3968  			};
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3969  		};
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3970  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3971  		pmu@9091000 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3972  			compatible = "qcom,sc7280-llcc-bwmon";
94ca994d7e932c Konrad Dybcio                    2023-01-02  3973  			reg = <0 0x09091000 0 0x1000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3974  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3975  			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3976  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3977  			interconnects = <&mc_virt MASTER_LLCC 3 &mc_virt SLAVE_EBI1 3>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3978  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3979  			operating-points-v2 = <&llcc_bwmon_opp_table>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3980  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3981  			llcc_bwmon_opp_table: opp-table {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3982  				compatible = "operating-points-v2";
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3983  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3984  				opp-0 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3985  					opp-peak-kBps = <800000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3986  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3987  				opp-1 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3988  					opp-peak-kBps = <1804000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3989  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3990  				opp-2 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3991  					opp-peak-kBps = <2188000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3992  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3993  				opp-3 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3994  					opp-peak-kBps = <3072000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3995  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3996  				opp-4 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3997  					opp-peak-kBps = <4068000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3998  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3999  				opp-5 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4000  					opp-peak-kBps = <6220000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4001  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4002  				opp-6 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4003  					opp-peak-kBps = <6832000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4004  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4005  				opp-7 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4006  					opp-peak-kBps = <8532000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4007  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4008  			};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4009  		};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4010  
b626ac159e5e2c Krzysztof Kozlowski              2022-09-08  4011  		pmu@90b6400 {
bad26511c4cb54 Konrad Dybcio                    2023-03-15  4012  			compatible = "qcom,sc7280-cpu-bwmon", "qcom,sdm845-bwmon";
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4013  			reg = <0 0x090b6400 0 0x600>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4014  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4015  			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4016  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4017  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &gem_noc SLAVE_LLCC 3>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4018  			operating-points-v2 = <&cpu_bwmon_opp_table>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4019  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4020  			cpu_bwmon_opp_table: opp-table {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4021  				compatible = "operating-points-v2";
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4022  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4023  				opp-0 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4024  					opp-peak-kBps = <2400000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4025  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4026  				opp-1 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4027  					opp-peak-kBps = <4800000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4028  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4029  				opp-2 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4030  					opp-peak-kBps = <7456000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4031  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4032  				opp-3 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4033  					opp-peak-kBps = <9600000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4034  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4035  				opp-4 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4036  					opp-peak-kBps = <12896000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4037  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4038  				opp-5 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4039  					opp-peak-kBps = <14928000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4040  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4041  				opp-6 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4042  					opp-peak-kBps = <17056000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4043  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4044  			};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4045  		};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4046  
297e6e38320f32 Odelu Kukatla                    2021-04-27  4047  		dc_noc: interconnect@90e0000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  4048  			reg = <0 0x090e0000 0 0x5080>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4049  			compatible = "qcom,sc7280-dc-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  4050  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4051  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4052  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  4053  
297e6e38320f32 Odelu Kukatla                    2021-04-27  4054  		gem_noc: interconnect@9100000 {
94ca994d7e932c Konrad Dybcio                    2023-01-02  4055  			reg = <0 0x09100000 0 0xe2200>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4056  			compatible = "qcom,sc7280-gem-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  4057  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4058  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4059  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  4060  
0392968dbe099d Sai Prakash Ranjan               2021-03-16  4061  		system-cache-controller@9200000 {
0392968dbe099d Sai Prakash Ranjan               2021-03-16  4062  			compatible = "qcom,sc7280-llcc";
62e5ee9db98ed6 Manivannan Sadhasivam            2023-03-14  4063  			reg = <0 0x09200000 0 0x58000>, <0 0x09280000 0 0x58000>,
62e5ee9db98ed6 Manivannan Sadhasivam            2023-03-14  4064  			      <0 0x09600000 0 0x58000>;
62e5ee9db98ed6 Manivannan Sadhasivam            2023-03-14  4065  			reg-names = "llcc0_base", "llcc1_base", "llcc_broadcast_base";
0392968dbe099d Sai Prakash Ranjan               2021-03-16  4066  			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
0392968dbe099d Sai Prakash Ranjan               2021-03-16  4067  		};
0392968dbe099d Sai Prakash Ranjan               2021-03-16  4068  
0b059979090d72 Souradeep Chowdhury              2022-04-06  4069  		eud: eud@88e0000 {
0b059979090d72 Souradeep Chowdhury              2022-04-06  4070  			compatible = "qcom,sc7280-eud", "qcom,eud";
9ee402ccfeb163 Bhupesh Sharma                   2023-05-02  4071  			reg = <0 0x88e0000 0 0x2000>,
9ee402ccfeb163 Bhupesh Sharma                   2023-05-02  4072  			      <0 0x88e2000 0 0x1000>;
0b059979090d72 Souradeep Chowdhury              2022-04-06  4073  			interrupts-extended = <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
9ee402ccfeb163 Bhupesh Sharma                   2023-05-02  4074  
39c8af78cbefb8 Krzysztof Kozlowski              2023-08-20  4075  			status = "disabled";
39c8af78cbefb8 Krzysztof Kozlowski              2023-08-20  4076  
0b059979090d72 Souradeep Chowdhury              2022-04-06  4077  			ports {
a369c74243ca4a Krzysztof Kozlowski              2023-03-08  4078  				#address-cells = <1>;
a369c74243ca4a Krzysztof Kozlowski              2023-03-08  4079  				#size-cells = <0>;
a369c74243ca4a Krzysztof Kozlowski              2023-03-08  4080  
0b059979090d72 Souradeep Chowdhury              2022-04-06  4081  				port@0 {
a369c74243ca4a Krzysztof Kozlowski              2023-03-08  4082  					reg = <0>;
0b059979090d72 Souradeep Chowdhury              2022-04-06  4083  					eud_ep: endpoint {
0b059979090d72 Souradeep Chowdhury              2022-04-06  4084  						remote-endpoint = <&usb2_role_switch>;
0b059979090d72 Souradeep Chowdhury              2022-04-06  4085  					};
0b059979090d72 Souradeep Chowdhury              2022-04-06  4086  				};
0b059979090d72 Souradeep Chowdhury              2022-04-06  4087  			};
0b059979090d72 Souradeep Chowdhury              2022-04-06  4088  		};
0b059979090d72 Souradeep Chowdhury              2022-04-06  4089  
297e6e38320f32 Odelu Kukatla                    2021-04-27  4090  		nsp_noc: interconnect@a0c0000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  4091  			reg = <0 0x0a0c0000 0 0x10000>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4092  			compatible = "qcom,sc7280-nsp-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  4093  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4094  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4095  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  4096  
df62402e5ff9df Luca Weiss                       2023-12-08  4097  		remoteproc_cdsp: remoteproc@a300000 {
df62402e5ff9df Luca Weiss                       2023-12-08  4098  			compatible = "qcom,sc7280-cdsp-pas";
df62402e5ff9df Luca Weiss                       2023-12-08  4099  			reg = <0 0x0a300000 0 0x10000>;
df62402e5ff9df Luca Weiss                       2023-12-08  4100  
f011688162ec4c Luca Weiss                       2024-02-19  4101  			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
df62402e5ff9df Luca Weiss                       2023-12-08  4102  					      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
df62402e5ff9df Luca Weiss                       2023-12-08  4103  					      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
df62402e5ff9df Luca Weiss                       2023-12-08  4104  					      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
df62402e5ff9df Luca Weiss                       2023-12-08  4105  					      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
df62402e5ff9df Luca Weiss                       2023-12-08  4106  					      <&cdsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
df62402e5ff9df Luca Weiss                       2023-12-08  4107  			interrupt-names = "wdog", "fatal", "ready", "handover",
df62402e5ff9df Luca Weiss                       2023-12-08  4108  					  "stop-ack", "shutdown-ack";
df62402e5ff9df Luca Weiss                       2023-12-08  4109  
df62402e5ff9df Luca Weiss                       2023-12-08  4110  			clocks = <&rpmhcc RPMH_CXO_CLK>;
df62402e5ff9df Luca Weiss                       2023-12-08  4111  			clock-names = "xo";
df62402e5ff9df Luca Weiss                       2023-12-08  4112  
df62402e5ff9df Luca Weiss                       2023-12-08  4113  			power-domains = <&rpmhpd SC7280_CX>,
df62402e5ff9df Luca Weiss                       2023-12-08  4114  					<&rpmhpd SC7280_MX>;
df62402e5ff9df Luca Weiss                       2023-12-08  4115  			power-domain-names = "cx", "mx";
df62402e5ff9df Luca Weiss                       2023-12-08  4116  
df62402e5ff9df Luca Weiss                       2023-12-08  4117  			interconnects = <&nsp_noc MASTER_CDSP_PROC 0 &mc_virt SLAVE_EBI1 0>;
df62402e5ff9df Luca Weiss                       2023-12-08  4118  
df62402e5ff9df Luca Weiss                       2023-12-08  4119  			memory-region = <&cdsp_mem>;
df62402e5ff9df Luca Weiss                       2023-12-08  4120  
df62402e5ff9df Luca Weiss                       2023-12-08  4121  			qcom,qmp = <&aoss_qmp>;
df62402e5ff9df Luca Weiss                       2023-12-08  4122  
df62402e5ff9df Luca Weiss                       2023-12-08  4123  			qcom,smem-states = <&cdsp_smp2p_out 0>;
df62402e5ff9df Luca Weiss                       2023-12-08  4124  			qcom,smem-state-names = "stop";
df62402e5ff9df Luca Weiss                       2023-12-08  4125  
df62402e5ff9df Luca Weiss                       2023-12-08  4126  			status = "disabled";
df62402e5ff9df Luca Weiss                       2023-12-08  4127  
df62402e5ff9df Luca Weiss                       2023-12-08  4128  			glink-edge {
df62402e5ff9df Luca Weiss                       2023-12-08  4129  				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
df62402e5ff9df Luca Weiss                       2023-12-08  4130  							     IPCC_MPROC_SIGNAL_GLINK_QMP
df62402e5ff9df Luca Weiss                       2023-12-08  4131  							     IRQ_TYPE_EDGE_RISING>;
df62402e5ff9df Luca Weiss                       2023-12-08  4132  				mboxes = <&ipcc IPCC_CLIENT_CDSP
df62402e5ff9df Luca Weiss                       2023-12-08  4133  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
df62402e5ff9df Luca Weiss                       2023-12-08  4134  
df62402e5ff9df Luca Weiss                       2023-12-08  4135  				label = "cdsp";
df62402e5ff9df Luca Weiss                       2023-12-08  4136  				qcom,remote-pid = <5>;
df62402e5ff9df Luca Weiss                       2023-12-08  4137  
df62402e5ff9df Luca Weiss                       2023-12-08  4138  				fastrpc {
df62402e5ff9df Luca Weiss                       2023-12-08  4139  					compatible = "qcom,fastrpc";
df62402e5ff9df Luca Weiss                       2023-12-08  4140  					qcom,glink-channels = "fastrpcglink-apps-dsp";
df62402e5ff9df Luca Weiss                       2023-12-08  4141  					label = "cdsp";
df62402e5ff9df Luca Weiss                       2023-12-08  4142  					qcom,non-secure-domain;
df62402e5ff9df Luca Weiss                       2023-12-08  4143  					#address-cells = <1>;
df62402e5ff9df Luca Weiss                       2023-12-08  4144  					#size-cells = <0>;
df62402e5ff9df Luca Weiss                       2023-12-08  4145  
df62402e5ff9df Luca Weiss                       2023-12-08  4146  					compute-cb@1 {
df62402e5ff9df Luca Weiss                       2023-12-08  4147  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4148  						reg = <1>;
df62402e5ff9df Luca Weiss                       2023-12-08  4149  						iommus = <&apps_smmu 0x11a1 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4150  							 <&apps_smmu 0x1181 0x0420>;
2a49326081e1e5 Xilin Wu                         2025-04-16  4151  						dma-coherent;
df62402e5ff9df Luca Weiss                       2023-12-08  4152  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4153  
df62402e5ff9df Luca Weiss                       2023-12-08  4154  					compute-cb@2 {
df62402e5ff9df Luca Weiss                       2023-12-08  4155  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4156  						reg = <2>;
df62402e5ff9df Luca Weiss                       2023-12-08  4157  						iommus = <&apps_smmu 0x11a2 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4158  							 <&apps_smmu 0x1182 0x0420>;
2a49326081e1e5 Xilin Wu                         2025-04-16  4159  						dma-coherent;
df62402e5ff9df Luca Weiss                       2023-12-08  4160  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4161  
df62402e5ff9df Luca Weiss                       2023-12-08  4162  					compute-cb@3 {
df62402e5ff9df Luca Weiss                       2023-12-08  4163  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4164  						reg = <3>;
df62402e5ff9df Luca Weiss                       2023-12-08  4165  						iommus = <&apps_smmu 0x11a3 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4166  							 <&apps_smmu 0x1183 0x0420>;
2a49326081e1e5 Xilin Wu                         2025-04-16  4167  						dma-coherent;
df62402e5ff9df Luca Weiss                       2023-12-08  4168  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4169  
df62402e5ff9df Luca Weiss                       2023-12-08  4170  					compute-cb@4 {
df62402e5ff9df Luca Weiss                       2023-12-08  4171  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4172  						reg = <4>;
df62402e5ff9df Luca Weiss                       2023-12-08  4173  						iommus = <&apps_smmu 0x11a4 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4174  							 <&apps_smmu 0x1184 0x0420>;
2a49326081e1e5 Xilin Wu                         2025-04-16  4175  						dma-coherent;
df62402e5ff9df Luca Weiss                       2023-12-08  4176  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4177  
df62402e5ff9df Luca Weiss                       2023-12-08  4178  					compute-cb@5 {
df62402e5ff9df Luca Weiss                       2023-12-08  4179  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4180  						reg = <5>;
df62402e5ff9df Luca Weiss                       2023-12-08  4181  						iommus = <&apps_smmu 0x11a5 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4182  							 <&apps_smmu 0x1185 0x0420>;
2a49326081e1e5 Xilin Wu                         2025-04-16  4183  						dma-coherent;
df62402e5ff9df Luca Weiss                       2023-12-08  4184  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4185  
df62402e5ff9df Luca Weiss                       2023-12-08  4186  					compute-cb@6 {
df62402e5ff9df Luca Weiss                       2023-12-08  4187  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4188  						reg = <6>;
df62402e5ff9df Luca Weiss                       2023-12-08  4189  						iommus = <&apps_smmu 0x11a6 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4190  							 <&apps_smmu 0x1186 0x0420>;
2a49326081e1e5 Xilin Wu                         2025-04-16  4191  						dma-coherent;
df62402e5ff9df Luca Weiss                       2023-12-08  4192  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4193  
df62402e5ff9df Luca Weiss                       2023-12-08  4194  					compute-cb@7 {
df62402e5ff9df Luca Weiss                       2023-12-08  4195  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4196  						reg = <7>;
df62402e5ff9df Luca Weiss                       2023-12-08  4197  						iommus = <&apps_smmu 0x11a7 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4198  							 <&apps_smmu 0x1187 0x0420>;
2a49326081e1e5 Xilin Wu                         2025-04-16  4199  						dma-coherent;
df62402e5ff9df Luca Weiss                       2023-12-08  4200  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4201  
df62402e5ff9df Luca Weiss                       2023-12-08  4202  					compute-cb@8 {
df62402e5ff9df Luca Weiss                       2023-12-08  4203  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4204  						reg = <8>;
df62402e5ff9df Luca Weiss                       2023-12-08  4205  						iommus = <&apps_smmu 0x11a8 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4206  							 <&apps_smmu 0x1188 0x0420>;
2a49326081e1e5 Xilin Wu                         2025-04-16  4207  						dma-coherent;
df62402e5ff9df Luca Weiss                       2023-12-08  4208  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4209  
df62402e5ff9df Luca Weiss                       2023-12-08  4210  					/* note: secure cb9 in downstream */
df62402e5ff9df Luca Weiss                       2023-12-08  4211  
df62402e5ff9df Luca Weiss                       2023-12-08  4212  					compute-cb@11 {
df62402e5ff9df Luca Weiss                       2023-12-08  4213  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4214  						reg = <11>;
df62402e5ff9df Luca Weiss                       2023-12-08  4215  						iommus = <&apps_smmu 0x11ab 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4216  							 <&apps_smmu 0x118b 0x0420>;
2a49326081e1e5 Xilin Wu                         2025-04-16  4217  						dma-coherent;
df62402e5ff9df Luca Weiss                       2023-12-08  4218  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4219  
df62402e5ff9df Luca Weiss                       2023-12-08  4220  					compute-cb@12 {
df62402e5ff9df Luca Weiss                       2023-12-08  4221  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4222  						reg = <12>;
df62402e5ff9df Luca Weiss                       2023-12-08  4223  						iommus = <&apps_smmu 0x11ac 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4224  							 <&apps_smmu 0x118c 0x0420>;
2a49326081e1e5 Xilin Wu                         2025-04-16  4225  						dma-coherent;
df62402e5ff9df Luca Weiss                       2023-12-08  4226  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4227  
df62402e5ff9df Luca Weiss                       2023-12-08  4228  					compute-cb@13 {
df62402e5ff9df Luca Weiss                       2023-12-08  4229  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4230  						reg = <13>;
df62402e5ff9df Luca Weiss                       2023-12-08  4231  						iommus = <&apps_smmu 0x11ad 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4232  							 <&apps_smmu 0x118d 0x0420>;
2a49326081e1e5 Xilin Wu                         2025-04-16  4233  						dma-coherent;
df62402e5ff9df Luca Weiss                       2023-12-08  4234  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4235  
df62402e5ff9df Luca Weiss                       2023-12-08  4236  					compute-cb@14 {
df62402e5ff9df Luca Weiss                       2023-12-08  4237  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4238  						reg = <14>;
df62402e5ff9df Luca Weiss                       2023-12-08  4239  						iommus = <&apps_smmu 0x11ae 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4240  							 <&apps_smmu 0x118e 0x0420>;
2a49326081e1e5 Xilin Wu                         2025-04-16  4241  						dma-coherent;
df62402e5ff9df Luca Weiss                       2023-12-08  4242  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4243  				};
df62402e5ff9df Luca Weiss                       2023-12-08  4244  			};
df62402e5ff9df Luca Weiss                       2023-12-08  4245  		};
df62402e5ff9df Luca Weiss                       2023-12-08  4246  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06 @4247  		usb_1: usb@a6f8800 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
