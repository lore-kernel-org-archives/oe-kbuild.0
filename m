Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1236E18FDC2
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Nov 2024 18:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731780551; cv=none; b=FncQpN4Pv8AJMXkqmJA7tvo6Utw58E/kiuMH8lD5kU66oVUQvETKC1ON+Nsm1N4EsTP9Nei2eW8D9VFMSD8DeG+JpDkLD+Xrv6+RiWIzIt0eJctw+1wusdRDJ79ZhYDa4e4xIjpyQRyOxPWzWsaWe/r+BV1WdMGuq1rqo4uRDw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731780551; c=relaxed/simple;
	bh=3n+8duERbj6YWYFcpKxNqE8V39UquyRjHZ32cx2+sZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NKv9wm2GPwFh8EBe/OLs9Lqi0eJQO+pf1AD/AZJGtjmwlXYi4rBwxbTIAIH+GtTKWlc8IKCHTFt9jEHZwn+VI0hULQvvBoxup/Jrrh1VENtuAC55rqvegwYFCgEnVVTfzVFb3fBP+xLg2aNBCbRXq2n1dINMvs8IV1XdrvscUOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U2o9JgOV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U2o9JgOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731780539; x=1763316539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3n+8duERbj6YWYFcpKxNqE8V39UquyRjHZ32cx2+sZE=;
  b=U2o9JgOVwHYugnQhIpGVrbTzvfaAAniYWtUadxPXpLLGaOFX1ARqNF/P
   c/oVTAcwY2JZVuFoc65MDCGW3F8zQvuKPb84J2Cj+ads0seSXE/ypFMct
   1vt0BkgU1AKWLa4MTXnUOA7tpyQt2rian/6PotLMMXdcr+BeuWxL1CV5R
   /JcTYeGJjsDZZbY6gDltZ/QxQRqZvG4m8rzz9mrmfUEbK1rI5Gu2lLdHm
   c4StLgEaKB5d7ENobKHrJ1UWF137T6YZ6a+Ua+Rp/suhuI1ch4eqTctkB
   g1qmPjUFikADRTchHLIUIFDshWAqK9GygoJidYTn6AHOEgkXzwnWaW7Np
   A==;
X-CSE-ConnectionGUID: /mim8aktQ5GkrzSKs8XJcQ==
X-CSE-MsgGUID: hxcrDskORL+4NHneSh4r2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="19379858"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="19379858"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 10:08:56 -0800
X-CSE-ConnectionGUID: 6CL3rENjRwWT9Ksp2hUXGg==
X-CSE-MsgGUID: jg1qcWr0RACdoEbbBKDQtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="93680645"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Nov 2024 10:08:54 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCNE3-00011F-11;
	Sat, 16 Nov 2024 18:08:51 +0000
Date: Sun, 17 Nov 2024 02:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: sc7280: Add support for camss
Message-ID: <202411170136.Lpiz0ryS-lkp@intel.com>
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
In-Reply-To: <20241112173032.2740119-5-quic_vikramsa@quicinc.com>
References: <20241112173032.2740119-5-quic_vikramsa@quicinc.com>
TO: Vikram Sharma <quic_vikramsa@quicinc.com>
TO: rfoss@kernel.org
TO: todor.too@gmail.com
TO: bryan.odonoghue@linaro.org
TO: mchehab@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: akapatra@quicinc.com
TO: hariramp@quicinc.com
TO: andersson@kernel.org
TO: konradybcio@kernel.org
TO: hverkuil-cisco@xs4all.nl
TO: cros-qcom-dts-watchers@chromium.org
TO: catalin.marinas@arm.com
TO: will@kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: quic_vikramsa@quicinc.com
CC: linux-media@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: kernel@quicinc.com

Hi Vikram,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20241112]
[also build test WARNING on linus/master v6.12-rc7]
[cannot apply to robh/for-next linuxtv-media-stage/master media-tree/master v6.12-rc7 v6.12-rc6 v6.12-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vikram-Sharma/media-dt-bindings-Add-qcom-sc7280-camss/20241113-020909
base:   next-20241112
patch link:    https://lore.kernel.org/r/20241112173032.2740119-5-quic_vikramsa%40quicinc.com
patch subject: [PATCH v5 4/5] arm64: dts: qcom: sc7280: Add support for camss
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-002-20241116 (https://download.01.org/0day-ci/archive/20241117/202411170136.Lpiz0ryS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170136.Lpiz0ryS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411170136.Lpiz0ryS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sc7280.dtsi:4429.24-4597.5: Warning (simple_bus_reg): /soc@0/camss@acaf000: simple-bus unit address format error, expected "acb3000"
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4752.26-4823.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4035.10-4045.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sc7280.dtsi:4429.24-4597.5: Warning (simple_bus_reg): /soc@0/camss@acaf000: simple-bus unit address format error, expected "acb3000"
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4752.26-4823.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:152.29-155.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4035.10-4045.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sc7280.dtsi:4429.24-4597.5: Warning (simple_bus_reg): /soc@0/camss@acaf000: simple-bus unit address format error, expected "acb3000"
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4752.26-4823.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4035.10-4045.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sc7280.dtsi:4429.24-4597.5: Warning (simple_bus_reg): /soc@0/camss@acaf000: simple-bus unit address format error, expected "acb3000"
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4752.26-4823.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4035.10-4045.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sc7280.dtsi:4429.24-4597.5: Warning (simple_bus_reg): /soc@0/camss@acaf000: simple-bus unit address format error, expected "acb3000"
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4035.10-4045.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +/acb3000 +4429 arch/arm64/boot/dts/qcom/sc7280.dtsi

7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    31  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    32  / {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    33  	interrupt-parent = <&intc>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    34  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    35  	#address-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    36  	#size-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    37  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    38  	chosen { };
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    39  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13    40  	aliases {
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    41  		i2c0 = &i2c0;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    42  		i2c1 = &i2c1;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    43  		i2c2 = &i2c2;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    44  		i2c3 = &i2c3;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    45  		i2c4 = &i2c4;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    46  		i2c5 = &i2c5;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    47  		i2c6 = &i2c6;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    48  		i2c7 = &i2c7;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    49  		i2c8 = &i2c8;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    50  		i2c9 = &i2c9;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    51  		i2c10 = &i2c10;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    52  		i2c11 = &i2c11;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    53  		i2c12 = &i2c12;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    54  		i2c13 = &i2c13;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    55  		i2c14 = &i2c14;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    56  		i2c15 = &i2c15;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13    57  		mmc1 = &sdhc_1;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13    58  		mmc2 = &sdhc_2;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    59  		spi0 = &spi0;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    60  		spi1 = &spi1;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    61  		spi2 = &spi2;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    62  		spi3 = &spi3;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    63  		spi4 = &spi4;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    64  		spi5 = &spi5;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    65  		spi6 = &spi6;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    66  		spi7 = &spi7;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    67  		spi8 = &spi8;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    68  		spi9 = &spi9;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    69  		spi10 = &spi10;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    70  		spi11 = &spi11;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    71  		spi12 = &spi12;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    72  		spi13 = &spi13;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    73  		spi14 = &spi14;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    74  		spi15 = &spi15;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13    75  	};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13    76  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    77  	clocks {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    78  		xo_board: xo-board {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    79  			compatible = "fixed-clock";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    80  			clock-frequency = <76800000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    81  			#clock-cells = <0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    82  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    83  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    84  		sleep_clk: sleep-clk {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    85  			compatible = "fixed-clock";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    86  			clock-frequency = <32000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    87  			#clock-cells = <0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    88  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    89  	};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    90  
3450bb5b9570a2 Maulik Shah                      2021-03-11    91  	reserved-memory {
3450bb5b9570a2 Maulik Shah                      2021-03-11    92  		#address-cells = <2>;
3450bb5b9570a2 Maulik Shah                      2021-03-11    93  		#size-cells = <2>;
3450bb5b9570a2 Maulik Shah                      2021-03-11    94  		ranges;
3450bb5b9570a2 Maulik Shah                      2021-03-11    95  
6615713c10c974 Luca Weiss                       2023-12-08    96  		wlan_ce_mem: wlan-ce@4cd000 {
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06    97  			no-map;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06    98  			reg = <0x0 0x004cd000 0x0 0x1000>;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06    99  		};
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06   100  
6615713c10c974 Luca Weiss                       2023-12-08   101  		hyp_mem: hyp@80000000 {
eca7d3a366b3ab Sibi Sankar                      2021-09-17   102  			reg = <0x0 0x80000000 0x0 0x600000>;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   103  			no-map;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   104  		};
eca7d3a366b3ab Sibi Sankar                      2021-09-17   105  
6615713c10c974 Luca Weiss                       2023-12-08   106  		xbl_mem: xbl@80600000 {
eca7d3a366b3ab Sibi Sankar                      2021-09-17   107  			reg = <0x0 0x80600000 0x0 0x200000>;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   108  			no-map;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   109  		};
eca7d3a366b3ab Sibi Sankar                      2021-09-17   110  
6615713c10c974 Luca Weiss                       2023-12-08   111  		aop_mem: aop@80800000 {
e9d7397467885a Maulik Shah                      2021-03-11   112  			reg = <0x0 0x80800000 0x0 0x60000>;
e9d7397467885a Maulik Shah                      2021-03-11   113  			no-map;
e9d7397467885a Maulik Shah                      2021-03-11   114  		};
e9d7397467885a Maulik Shah                      2021-03-11   115  
6615713c10c974 Luca Weiss                       2023-12-08   116  		aop_cmd_db_mem: aop-cmd-db@80860000 {
3450bb5b9570a2 Maulik Shah                      2021-03-11   117  			reg = <0x0 0x80860000 0x0 0x20000>;
3450bb5b9570a2 Maulik Shah                      2021-03-11   118  			compatible = "qcom,cmd-db";
3450bb5b9570a2 Maulik Shah                      2021-03-11   119  			no-map;
3450bb5b9570a2 Maulik Shah                      2021-03-11   120  		};
e9d7397467885a Maulik Shah                      2021-03-11   121  
6615713c10c974 Luca Weiss                       2023-12-08   122  		reserved_xbl_uefi_log: xbl-uefi-res@80880000 {
eca7d3a366b3ab Sibi Sankar                      2021-09-17   123  			reg = <0x0 0x80884000 0x0 0x10000>;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   124  			no-map;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   125  		};
eca7d3a366b3ab Sibi Sankar                      2021-09-17   126  
6615713c10c974 Luca Weiss                       2023-12-08   127  		sec_apps_mem: sec-apps@808ff000 {
eca7d3a366b3ab Sibi Sankar                      2021-09-17   128  			reg = <0x0 0x808ff000 0x0 0x1000>;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   129  			no-map;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   130  		};
eca7d3a366b3ab Sibi Sankar                      2021-09-17   131  
6615713c10c974 Luca Weiss                       2023-12-08   132  		smem_mem: smem@80900000 {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   133  			reg = <0x0 0x80900000 0x0 0x200000>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   134  			no-map;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   135  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   136  
6615713c10c974 Luca Weiss                       2023-12-08   137  		cpucp_mem: cpucp@80b00000 {
e9d7397467885a Maulik Shah                      2021-03-11   138  			no-map;
e9d7397467885a Maulik Shah                      2021-03-11   139  			reg = <0x0 0x80b00000 0x0 0x100000>;
e9d7397467885a Maulik Shah                      2021-03-11   140  		};
fc4f0273d4fba2 Alex Elder                       2021-08-04   141  
6615713c10c974 Luca Weiss                       2023-12-08   142  		wlan_fw_mem: wlan-fw@80c00000 {
eca7d3a366b3ab Sibi Sankar                      2021-09-17   143  			reg = <0x0 0x80c00000 0x0 0xc00000>;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   144  			no-map;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   145  		};
eca7d3a366b3ab Sibi Sankar                      2021-09-17   146  
3658e411efcbb4 Luca Weiss                       2023-12-08   147  		adsp_mem: adsp@86700000 {
3658e411efcbb4 Luca Weiss                       2023-12-08   148  			reg = <0x0 0x86700000 0x0 0x2800000>;
3658e411efcbb4 Luca Weiss                       2023-12-08   149  			no-map;
3658e411efcbb4 Luca Weiss                       2023-12-08   150  		};
3658e411efcbb4 Luca Weiss                       2023-12-08   151  
6615713c10c974 Luca Weiss                       2023-12-08   152  		video_mem: video@8b200000 {
37613aee217928 Dikshita Agarwal                 2021-10-26   153  			reg = <0x0 0x8b200000 0x0 0x500000>;
37613aee217928 Dikshita Agarwal                 2021-10-26   154  			no-map;
37613aee217928 Dikshita Agarwal                 2021-10-26   155  		};
37613aee217928 Dikshita Agarwal                 2021-10-26   156  
df62402e5ff9df Luca Weiss                       2023-12-08   157  		cdsp_mem: cdsp@88f00000 {
df62402e5ff9df Luca Weiss                       2023-12-08   158  			reg = <0x0 0x88f00000 0x0 0x1e00000>;
df62402e5ff9df Luca Weiss                       2023-12-08   159  			no-map;
df62402e5ff9df Luca Weiss                       2023-12-08   160  		};
df62402e5ff9df Luca Weiss                       2023-12-08   161  
6615713c10c974 Luca Weiss                       2023-12-08   162  		ipa_fw_mem: ipa-fw@8b700000 {
fc4f0273d4fba2 Alex Elder                       2021-08-04   163  			reg = <0 0x8b700000 0 0x10000>;
fc4f0273d4fba2 Alex Elder                       2021-08-04   164  			no-map;
fc4f0273d4fba2 Alex Elder                       2021-08-04   165  		};
eca7d3a366b3ab Sibi Sankar                      2021-09-17   166  
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20   167  		gpu_zap_mem: zap@8b71a000 {
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20   168  			reg = <0 0x8b71a000 0 0x2000>;
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20   169  			no-map;
5037ca35ce42a9 Luca Weiss                       2023-12-08   170  		};
5037ca35ce42a9 Luca Weiss                       2023-12-08   171  
5037ca35ce42a9 Luca Weiss                       2023-12-08   172  		mpss_mem: mpss@8b800000 {
5037ca35ce42a9 Luca Weiss                       2023-12-08   173  			reg = <0x0 0x8b800000 0x0 0xf600000>;
5037ca35ce42a9 Luca Weiss                       2023-12-08   174  			no-map;
5037ca35ce42a9 Luca Weiss                       2023-12-08   175  		};
5037ca35ce42a9 Luca Weiss                       2023-12-08   176  
5037ca35ce42a9 Luca Weiss                       2023-12-08   177  		wpss_mem: wpss@9ae00000 {
5037ca35ce42a9 Luca Weiss                       2023-12-08   178  			reg = <0x0 0x9ae00000 0x0 0x1900000>;
5037ca35ce42a9 Luca Weiss                       2023-12-08   179  			no-map;
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20   180  		};
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20   181  
6615713c10c974 Luca Weiss                       2023-12-08   182  		rmtfs_mem: rmtfs@9c900000 {
eca7d3a366b3ab Sibi Sankar                      2021-09-17   183  			compatible = "qcom,rmtfs-mem";
eca7d3a366b3ab Sibi Sankar                      2021-09-17   184  			reg = <0x0 0x9c900000 0x0 0x280000>;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   185  			no-map;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   186  
eca7d3a366b3ab Sibi Sankar                      2021-09-17   187  			qcom,client-id = <1>;
018c949b32df9f Luca Weiss                       2023-08-18   188  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   189  		};
3450bb5b9570a2 Maulik Shah                      2021-03-11   190  	};
3450bb5b9570a2 Maulik Shah                      2021-03-11   191  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   192  	cpus {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   193  		#address-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   194  		#size-cells = <0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   195  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   196  		cpu0: cpu@0 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   197  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   198  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   199  			reg = <0x0 0x0>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   200  			clocks = <&cpufreq_hw 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   201  			enable-method = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   202  			power-domains = <&cpu_pd0>;
7925ca85e95619 Maulik Shah                      2023-07-03   203  			power-domain-names = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   204  			next-level-cache = <&l2_0>;
1e8853c698276d Sibi Sankar                      2022-02-09   205  			operating-points-v2 = <&cpu0_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   206  			capacity-dmips-mhz = <1024>;
942bf463dec369 Ankit Sharma                     2023-11-03   207  			dynamic-power-coefficient = <100>;
1e8853c698276d Sibi Sankar                      2022-02-09   208  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   209  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   210  			qcom,freq-domain = <&cpufreq_hw 0>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   211  			#cooling-cells = <2>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   212  			l2_0: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   213  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   214  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   215  				cache-unified;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   216  				next-level-cache = <&l3_0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   217  				l3_0: l3-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   218  					compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   219  					cache-level = <3>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   220  					cache-unified;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   221  				};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   222  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   223  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   224  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   225  		cpu1: cpu@100 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   226  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   227  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   228  			reg = <0x0 0x100>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   229  			clocks = <&cpufreq_hw 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   230  			enable-method = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   231  			power-domains = <&cpu_pd1>;
7925ca85e95619 Maulik Shah                      2023-07-03   232  			power-domain-names = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   233  			next-level-cache = <&l2_100>;
1e8853c698276d Sibi Sankar                      2022-02-09   234  			operating-points-v2 = <&cpu0_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   235  			capacity-dmips-mhz = <1024>;
942bf463dec369 Ankit Sharma                     2023-11-03   236  			dynamic-power-coefficient = <100>;
1e8853c698276d Sibi Sankar                      2022-02-09   237  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   238  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   239  			qcom,freq-domain = <&cpufreq_hw 0>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   240  			#cooling-cells = <2>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   241  			l2_100: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   242  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   243  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   244  				cache-unified;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   245  				next-level-cache = <&l3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   246  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   247  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   248  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   249  		cpu2: cpu@200 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   250  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   251  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   252  			reg = <0x0 0x200>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   253  			clocks = <&cpufreq_hw 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   254  			enable-method = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   255  			power-domains = <&cpu_pd2>;
7925ca85e95619 Maulik Shah                      2023-07-03   256  			power-domain-names = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   257  			next-level-cache = <&l2_200>;
1e8853c698276d Sibi Sankar                      2022-02-09   258  			operating-points-v2 = <&cpu0_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   259  			capacity-dmips-mhz = <1024>;
942bf463dec369 Ankit Sharma                     2023-11-03   260  			dynamic-power-coefficient = <100>;
1e8853c698276d Sibi Sankar                      2022-02-09   261  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   262  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   263  			qcom,freq-domain = <&cpufreq_hw 0>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   264  			#cooling-cells = <2>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   265  			l2_200: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   266  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   267  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   268  				cache-unified;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   269  				next-level-cache = <&l3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   270  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   271  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   272  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   273  		cpu3: cpu@300 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   274  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   275  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   276  			reg = <0x0 0x300>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   277  			clocks = <&cpufreq_hw 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   278  			enable-method = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   279  			power-domains = <&cpu_pd3>;
7925ca85e95619 Maulik Shah                      2023-07-03   280  			power-domain-names = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   281  			next-level-cache = <&l2_300>;
1e8853c698276d Sibi Sankar                      2022-02-09   282  			operating-points-v2 = <&cpu0_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   283  			capacity-dmips-mhz = <1024>;
942bf463dec369 Ankit Sharma                     2023-11-03   284  			dynamic-power-coefficient = <100>;
1e8853c698276d Sibi Sankar                      2022-02-09   285  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   286  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   287  			qcom,freq-domain = <&cpufreq_hw 0>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   288  			#cooling-cells = <2>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   289  			l2_300: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   290  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   291  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   292  				cache-unified;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   293  				next-level-cache = <&l3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   294  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   295  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   296  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   297  		cpu4: cpu@400 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   298  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   299  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   300  			reg = <0x0 0x400>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   301  			clocks = <&cpufreq_hw 1>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   302  			enable-method = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   303  			power-domains = <&cpu_pd4>;
7925ca85e95619 Maulik Shah                      2023-07-03   304  			power-domain-names = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   305  			next-level-cache = <&l2_400>;
1e8853c698276d Sibi Sankar                      2022-02-09   306  			operating-points-v2 = <&cpu4_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   307  			capacity-dmips-mhz = <1946>;
942bf463dec369 Ankit Sharma                     2023-11-03   308  			dynamic-power-coefficient = <520>;
1e8853c698276d Sibi Sankar                      2022-02-09   309  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   310  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   311  			qcom,freq-domain = <&cpufreq_hw 1>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   312  			#cooling-cells = <2>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   313  			l2_400: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   314  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   315  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   316  				cache-unified;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   317  				next-level-cache = <&l3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   318  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   319  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   320  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   321  		cpu5: cpu@500 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   322  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   323  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   324  			reg = <0x0 0x500>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   325  			clocks = <&cpufreq_hw 1>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   326  			enable-method = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   327  			power-domains = <&cpu_pd5>;
7925ca85e95619 Maulik Shah                      2023-07-03   328  			power-domain-names = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   329  			next-level-cache = <&l2_500>;
1e8853c698276d Sibi Sankar                      2022-02-09   330  			operating-points-v2 = <&cpu4_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   331  			capacity-dmips-mhz = <1946>;
942bf463dec369 Ankit Sharma                     2023-11-03   332  			dynamic-power-coefficient = <520>;
1e8853c698276d Sibi Sankar                      2022-02-09   333  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   334  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   335  			qcom,freq-domain = <&cpufreq_hw 1>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   336  			#cooling-cells = <2>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   337  			l2_500: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   338  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   339  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   340  				cache-unified;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   341  				next-level-cache = <&l3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   342  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   343  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   344  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   345  		cpu6: cpu@600 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   346  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   347  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   348  			reg = <0x0 0x600>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   349  			clocks = <&cpufreq_hw 1>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   350  			enable-method = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   351  			power-domains = <&cpu_pd6>;
7925ca85e95619 Maulik Shah                      2023-07-03   352  			power-domain-names = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   353  			next-level-cache = <&l2_600>;
1e8853c698276d Sibi Sankar                      2022-02-09   354  			operating-points-v2 = <&cpu4_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   355  			capacity-dmips-mhz = <1946>;
942bf463dec369 Ankit Sharma                     2023-11-03   356  			dynamic-power-coefficient = <520>;
1e8853c698276d Sibi Sankar                      2022-02-09   357  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   358  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   359  			qcom,freq-domain = <&cpufreq_hw 1>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   360  			#cooling-cells = <2>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   361  			l2_600: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   362  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   363  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   364  				cache-unified;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   365  				next-level-cache = <&l3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   366  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   367  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   368  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   369  		cpu7: cpu@700 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   370  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   371  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   372  			reg = <0x0 0x700>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   373  			clocks = <&cpufreq_hw 2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   374  			enable-method = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   375  			power-domains = <&cpu_pd7>;
7925ca85e95619 Maulik Shah                      2023-07-03   376  			power-domain-names = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   377  			next-level-cache = <&l2_700>;
1e8853c698276d Sibi Sankar                      2022-02-09   378  			operating-points-v2 = <&cpu7_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   379  			capacity-dmips-mhz = <1985>;
942bf463dec369 Ankit Sharma                     2023-11-03   380  			dynamic-power-coefficient = <552>;
1e8853c698276d Sibi Sankar                      2022-02-09   381  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   382  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
4cbb02fa76de4b Sibi Sankar                      2021-07-20   383  			qcom,freq-domain = <&cpufreq_hw 2>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   384  			#cooling-cells = <2>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   385  			l2_700: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   386  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   387  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   388  				cache-unified;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   389  				next-level-cache = <&l3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   390  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   391  		};
0ef5463c7a5648 Maulik Shah                      2021-03-11   392  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   393  		cpu-map {
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   394  			cluster0 {
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   395  				core0 {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   396  					cpu = <&cpu0>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   397  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   398  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   399  				core1 {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   400  					cpu = <&cpu1>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   401  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   402  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   403  				core2 {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   404  					cpu = <&cpu2>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   405  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   406  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   407  				core3 {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   408  					cpu = <&cpu3>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   409  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   410  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   411  				core4 {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   412  					cpu = <&cpu4>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   413  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   414  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   415  				core5 {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   416  					cpu = <&cpu5>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   417  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   418  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   419  				core6 {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   420  					cpu = <&cpu6>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   421  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   422  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   423  				core7 {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   424  					cpu = <&cpu7>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   425  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   426  			};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   427  		};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   428  
0ef5463c7a5648 Maulik Shah                      2021-03-11   429  		idle-states {
0ef5463c7a5648 Maulik Shah                      2021-03-11   430  			entry-method = "psci";
0ef5463c7a5648 Maulik Shah                      2021-03-11   431  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   432  			little_cpu_sleep_0: cpu-sleep-0-0 {
0ef5463c7a5648 Maulik Shah                      2021-03-11   433  				compatible = "arm,idle-state";
0ef5463c7a5648 Maulik Shah                      2021-03-11   434  				idle-state-name = "little-power-down";
0ef5463c7a5648 Maulik Shah                      2021-03-11   435  				arm,psci-suspend-param = <0x40000003>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   436  				entry-latency-us = <549>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   437  				exit-latency-us = <901>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   438  				min-residency-us = <1774>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   439  				local-timer-stop;
0ef5463c7a5648 Maulik Shah                      2021-03-11   440  			};
0ef5463c7a5648 Maulik Shah                      2021-03-11   441  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   442  			little_cpu_sleep_1: cpu-sleep-0-1 {
0ef5463c7a5648 Maulik Shah                      2021-03-11   443  				compatible = "arm,idle-state";
0ef5463c7a5648 Maulik Shah                      2021-03-11   444  				idle-state-name = "little-rail-power-down";
0ef5463c7a5648 Maulik Shah                      2021-03-11   445  				arm,psci-suspend-param = <0x40000004>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   446  				entry-latency-us = <702>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   447  				exit-latency-us = <915>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   448  				min-residency-us = <4001>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   449  				local-timer-stop;
0ef5463c7a5648 Maulik Shah                      2021-03-11   450  			};
0ef5463c7a5648 Maulik Shah                      2021-03-11   451  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   452  			big_cpu_sleep_0: cpu-sleep-1-0 {
0ef5463c7a5648 Maulik Shah                      2021-03-11   453  				compatible = "arm,idle-state";
0ef5463c7a5648 Maulik Shah                      2021-03-11   454  				idle-state-name = "big-power-down";
0ef5463c7a5648 Maulik Shah                      2021-03-11   455  				arm,psci-suspend-param = <0x40000003>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   456  				entry-latency-us = <523>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   457  				exit-latency-us = <1244>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   458  				min-residency-us = <2207>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   459  				local-timer-stop;
0ef5463c7a5648 Maulik Shah                      2021-03-11   460  			};
0ef5463c7a5648 Maulik Shah                      2021-03-11   461  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   462  			big_cpu_sleep_1: cpu-sleep-1-1 {
0ef5463c7a5648 Maulik Shah                      2021-03-11   463  				compatible = "arm,idle-state";
0ef5463c7a5648 Maulik Shah                      2021-03-11   464  				idle-state-name = "big-rail-power-down";
0ef5463c7a5648 Maulik Shah                      2021-03-11   465  				arm,psci-suspend-param = <0x40000004>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   466  				entry-latency-us = <526>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   467  				exit-latency-us = <1854>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   468  				min-residency-us = <5555>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   469  				local-timer-stop;
0ef5463c7a5648 Maulik Shah                      2021-03-11   470  			};
7925ca85e95619 Maulik Shah                      2023-07-03   471  		};
0ef5463c7a5648 Maulik Shah                      2021-03-11   472  
db5d137e81bcce Maulik Shah                      2024-01-09   473  		domain_idle_states: domain-idle-states {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   474  			cluster_sleep_apss_off: cluster-sleep-0 {
7925ca85e95619 Maulik Shah                      2023-07-03   475  				compatible = "domain-idle-state";
db5d137e81bcce Maulik Shah                      2024-01-09   476  				arm,psci-suspend-param = <0x41000044>;
db5d137e81bcce Maulik Shah                      2024-01-09   477  				entry-latency-us = <2752>;
db5d137e81bcce Maulik Shah                      2024-01-09   478  				exit-latency-us = <3048>;
db5d137e81bcce Maulik Shah                      2024-01-09   479  				min-residency-us = <6118>;
db5d137e81bcce Maulik Shah                      2024-01-09   480  			};
db5d137e81bcce Maulik Shah                      2024-01-09   481  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   482  			cluster_sleep_cx_ret: cluster-sleep-1 {
db5d137e81bcce Maulik Shah                      2024-01-09   483  				compatible = "domain-idle-state";
db5d137e81bcce Maulik Shah                      2024-01-09   484  				arm,psci-suspend-param = <0x41001344>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   485  				entry-latency-us = <3263>;
db5d137e81bcce Maulik Shah                      2024-01-09   486  				exit-latency-us = <4562>;
db5d137e81bcce Maulik Shah                      2024-01-09   487  				min-residency-us = <8467>;
db5d137e81bcce Maulik Shah                      2024-01-09   488  			};
db5d137e81bcce Maulik Shah                      2024-01-09   489  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   490  			cluster_sleep_llcc_off: cluster-sleep-2 {
db5d137e81bcce Maulik Shah                      2024-01-09   491  				compatible = "domain-idle-state";
db5d137e81bcce Maulik Shah                      2024-01-09   492  				arm,psci-suspend-param = <0x4100b344>;
db5d137e81bcce Maulik Shah                      2024-01-09   493  				entry-latency-us = <3638>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   494  				exit-latency-us = <6562>;
db5d137e81bcce Maulik Shah                      2024-01-09   495  				min-residency-us = <9826>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   496  			};
0ef5463c7a5648 Maulik Shah                      2021-03-11   497  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   498  	};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   499  
0e3e654696074b Krzysztof Kozlowski              2022-06-27   500  	cpu0_opp_table: opp-table-cpu0 {
1e8853c698276d Sibi Sankar                      2022-02-09   501  		compatible = "operating-points-v2";
1e8853c698276d Sibi Sankar                      2022-02-09   502  		opp-shared;
1e8853c698276d Sibi Sankar                      2022-02-09   503  
1e8853c698276d Sibi Sankar                      2022-02-09   504  		cpu0_opp_300mhz: opp-300000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   505  			opp-hz = /bits/ 64 <300000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   506  			opp-peak-kBps = <800000 9600000>;
1e8853c698276d Sibi Sankar                      2022-02-09   507  		};
1e8853c698276d Sibi Sankar                      2022-02-09   508  
1e8853c698276d Sibi Sankar                      2022-02-09   509  		cpu0_opp_691mhz: opp-691200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   510  			opp-hz = /bits/ 64 <691200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   511  			opp-peak-kBps = <800000 17817600>;
1e8853c698276d Sibi Sankar                      2022-02-09   512  		};
1e8853c698276d Sibi Sankar                      2022-02-09   513  
1e8853c698276d Sibi Sankar                      2022-02-09   514  		cpu0_opp_806mhz: opp-806400000 {
1e8853c698276d Sibi Sankar                      2022-02-09   515  			opp-hz = /bits/ 64 <806400000>;
1e8853c698276d Sibi Sankar                      2022-02-09   516  			opp-peak-kBps = <800000 20889600>;
1e8853c698276d Sibi Sankar                      2022-02-09   517  		};
1e8853c698276d Sibi Sankar                      2022-02-09   518  
1e8853c698276d Sibi Sankar                      2022-02-09   519  		cpu0_opp_941mhz: opp-940800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   520  			opp-hz = /bits/ 64 <940800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   521  			opp-peak-kBps = <1804000 24576000>;
1e8853c698276d Sibi Sankar                      2022-02-09   522  		};
1e8853c698276d Sibi Sankar                      2022-02-09   523  
1e8853c698276d Sibi Sankar                      2022-02-09   524  		cpu0_opp_1152mhz: opp-1152000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   525  			opp-hz = /bits/ 64 <1152000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   526  			opp-peak-kBps = <2188000 27033600>;
1e8853c698276d Sibi Sankar                      2022-02-09   527  		};
1e8853c698276d Sibi Sankar                      2022-02-09   528  
1e8853c698276d Sibi Sankar                      2022-02-09   529  		cpu0_opp_1325mhz: opp-1324800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   530  			opp-hz = /bits/ 64 <1324800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   531  			opp-peak-kBps = <2188000 33792000>;
1e8853c698276d Sibi Sankar                      2022-02-09   532  		};
1e8853c698276d Sibi Sankar                      2022-02-09   533  
1e8853c698276d Sibi Sankar                      2022-02-09   534  		cpu0_opp_1517mhz: opp-1516800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   535  			opp-hz = /bits/ 64 <1516800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   536  			opp-peak-kBps = <3072000 38092800>;
1e8853c698276d Sibi Sankar                      2022-02-09   537  		};
1e8853c698276d Sibi Sankar                      2022-02-09   538  
1e8853c698276d Sibi Sankar                      2022-02-09   539  		cpu0_opp_1651mhz: opp-1651200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   540  			opp-hz = /bits/ 64 <1651200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   541  			opp-peak-kBps = <3072000 41779200>;
1e8853c698276d Sibi Sankar                      2022-02-09   542  		};
1e8853c698276d Sibi Sankar                      2022-02-09   543  
1e8853c698276d Sibi Sankar                      2022-02-09   544  		cpu0_opp_1805mhz: opp-1804800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   545  			opp-hz = /bits/ 64 <1804800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   546  			opp-peak-kBps = <4068000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   547  		};
1e8853c698276d Sibi Sankar                      2022-02-09   548  
1e8853c698276d Sibi Sankar                      2022-02-09   549  		cpu0_opp_1958mhz: opp-1958400000 {
1e8853c698276d Sibi Sankar                      2022-02-09   550  			opp-hz = /bits/ 64 <1958400000>;
1e8853c698276d Sibi Sankar                      2022-02-09   551  			opp-peak-kBps = <4068000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   552  		};
1e8853c698276d Sibi Sankar                      2022-02-09   553  
1e8853c698276d Sibi Sankar                      2022-02-09   554  		cpu0_opp_2016mhz: opp-2016000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   555  			opp-hz = /bits/ 64 <2016000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   556  			opp-peak-kBps = <6220000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   557  		};
1e8853c698276d Sibi Sankar                      2022-02-09   558  	};
1e8853c698276d Sibi Sankar                      2022-02-09   559  
0e3e654696074b Krzysztof Kozlowski              2022-06-27   560  	cpu4_opp_table: opp-table-cpu4 {
1e8853c698276d Sibi Sankar                      2022-02-09   561  		compatible = "operating-points-v2";
1e8853c698276d Sibi Sankar                      2022-02-09   562  		opp-shared;
1e8853c698276d Sibi Sankar                      2022-02-09   563  
1e8853c698276d Sibi Sankar                      2022-02-09   564  		cpu4_opp_691mhz: opp-691200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   565  			opp-hz = /bits/ 64 <691200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   566  			opp-peak-kBps = <1804000 9600000>;
1e8853c698276d Sibi Sankar                      2022-02-09   567  		};
1e8853c698276d Sibi Sankar                      2022-02-09   568  
1e8853c698276d Sibi Sankar                      2022-02-09   569  		cpu4_opp_941mhz: opp-940800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   570  			opp-hz = /bits/ 64 <940800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   571  			opp-peak-kBps = <2188000 17817600>;
1e8853c698276d Sibi Sankar                      2022-02-09   572  		};
1e8853c698276d Sibi Sankar                      2022-02-09   573  
1e8853c698276d Sibi Sankar                      2022-02-09   574  		cpu4_opp_1229mhz: opp-1228800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   575  			opp-hz = /bits/ 64 <1228800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   576  			opp-peak-kBps = <4068000 24576000>;
1e8853c698276d Sibi Sankar                      2022-02-09   577  		};
1e8853c698276d Sibi Sankar                      2022-02-09   578  
1e8853c698276d Sibi Sankar                      2022-02-09   579  		cpu4_opp_1344mhz: opp-1344000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   580  			opp-hz = /bits/ 64 <1344000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   581  			opp-peak-kBps = <4068000 24576000>;
1e8853c698276d Sibi Sankar                      2022-02-09   582  		};
1e8853c698276d Sibi Sankar                      2022-02-09   583  
1e8853c698276d Sibi Sankar                      2022-02-09   584  		cpu4_opp_1517mhz: opp-1516800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   585  			opp-hz = /bits/ 64 <1516800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   586  			opp-peak-kBps = <4068000 24576000>;
1e8853c698276d Sibi Sankar                      2022-02-09   587  		};
1e8853c698276d Sibi Sankar                      2022-02-09   588  
1e8853c698276d Sibi Sankar                      2022-02-09   589  		cpu4_opp_1651mhz: opp-1651200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   590  			opp-hz = /bits/ 64 <1651200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   591  			opp-peak-kBps = <6220000 38092800>;
1e8853c698276d Sibi Sankar                      2022-02-09   592  		};
1e8853c698276d Sibi Sankar                      2022-02-09   593  
1e8853c698276d Sibi Sankar                      2022-02-09   594  		cpu4_opp_1901mhz: opp-1900800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   595  			opp-hz = /bits/ 64 <1900800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   596  			opp-peak-kBps = <6220000 44851200>;
1e8853c698276d Sibi Sankar                      2022-02-09   597  		};
1e8853c698276d Sibi Sankar                      2022-02-09   598  
1e8853c698276d Sibi Sankar                      2022-02-09   599  		cpu4_opp_2054mhz: opp-2054400000 {
1e8853c698276d Sibi Sankar                      2022-02-09   600  			opp-hz = /bits/ 64 <2054400000>;
1e8853c698276d Sibi Sankar                      2022-02-09   601  			opp-peak-kBps = <6220000 44851200>;
1e8853c698276d Sibi Sankar                      2022-02-09   602  		};
1e8853c698276d Sibi Sankar                      2022-02-09   603  
1e8853c698276d Sibi Sankar                      2022-02-09   604  		cpu4_opp_2112mhz: opp-2112000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   605  			opp-hz = /bits/ 64 <2112000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   606  			opp-peak-kBps = <6220000 44851200>;
1e8853c698276d Sibi Sankar                      2022-02-09   607  		};
1e8853c698276d Sibi Sankar                      2022-02-09   608  
1e8853c698276d Sibi Sankar                      2022-02-09   609  		cpu4_opp_2131mhz: opp-2131200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   610  			opp-hz = /bits/ 64 <2131200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   611  			opp-peak-kBps = <6220000 44851200>;
1e8853c698276d Sibi Sankar                      2022-02-09   612  		};
1e8853c698276d Sibi Sankar                      2022-02-09   613  
1e8853c698276d Sibi Sankar                      2022-02-09   614  		cpu4_opp_2208mhz: opp-2208000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   615  			opp-hz = /bits/ 64 <2208000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   616  			opp-peak-kBps = <6220000 44851200>;
1e8853c698276d Sibi Sankar                      2022-02-09   617  		};
1e8853c698276d Sibi Sankar                      2022-02-09   618  
1e8853c698276d Sibi Sankar                      2022-02-09   619  		cpu4_opp_2400mhz: opp-2400000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   620  			opp-hz = /bits/ 64 <2400000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   621  			opp-peak-kBps = <8532000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   622  		};
1e8853c698276d Sibi Sankar                      2022-02-09   623  
1e8853c698276d Sibi Sankar                      2022-02-09   624  		cpu4_opp_2611mhz: opp-2611200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   625  			opp-hz = /bits/ 64 <2611200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   626  			opp-peak-kBps = <8532000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   627  		};
1e8853c698276d Sibi Sankar                      2022-02-09   628  	};
1e8853c698276d Sibi Sankar                      2022-02-09   629  
0e3e654696074b Krzysztof Kozlowski              2022-06-27   630  	cpu7_opp_table: opp-table-cpu7 {
1e8853c698276d Sibi Sankar                      2022-02-09   631  		compatible = "operating-points-v2";
1e8853c698276d Sibi Sankar                      2022-02-09   632  		opp-shared;
1e8853c698276d Sibi Sankar                      2022-02-09   633  
1e8853c698276d Sibi Sankar                      2022-02-09   634  		cpu7_opp_806mhz: opp-806400000 {
1e8853c698276d Sibi Sankar                      2022-02-09   635  			opp-hz = /bits/ 64 <806400000>;
1e8853c698276d Sibi Sankar                      2022-02-09   636  			opp-peak-kBps = <1804000 9600000>;
1e8853c698276d Sibi Sankar                      2022-02-09   637  		};
1e8853c698276d Sibi Sankar                      2022-02-09   638  
1e8853c698276d Sibi Sankar                      2022-02-09   639  		cpu7_opp_1056mhz: opp-1056000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   640  			opp-hz = /bits/ 64 <1056000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   641  			opp-peak-kBps = <2188000 17817600>;
1e8853c698276d Sibi Sankar                      2022-02-09   642  		};
1e8853c698276d Sibi Sankar                      2022-02-09   643  
1e8853c698276d Sibi Sankar                      2022-02-09   644  		cpu7_opp_1325mhz: opp-1324800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   645  			opp-hz = /bits/ 64 <1324800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   646  			opp-peak-kBps = <4068000 24576000>;
1e8853c698276d Sibi Sankar                      2022-02-09   647  		};
1e8853c698276d Sibi Sankar                      2022-02-09   648  
1e8853c698276d Sibi Sankar                      2022-02-09   649  		cpu7_opp_1517mhz: opp-1516800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   650  			opp-hz = /bits/ 64 <1516800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   651  			opp-peak-kBps = <4068000 24576000>;
1e8853c698276d Sibi Sankar                      2022-02-09   652  		};
1e8853c698276d Sibi Sankar                      2022-02-09   653  
1e8853c698276d Sibi Sankar                      2022-02-09   654  		cpu7_opp_1766mhz: opp-1766400000 {
1e8853c698276d Sibi Sankar                      2022-02-09   655  			opp-hz = /bits/ 64 <1766400000>;
1e8853c698276d Sibi Sankar                      2022-02-09   656  			opp-peak-kBps = <6220000 38092800>;
1e8853c698276d Sibi Sankar                      2022-02-09   657  		};
1e8853c698276d Sibi Sankar                      2022-02-09   658  
1e8853c698276d Sibi Sankar                      2022-02-09   659  		cpu7_opp_1862mhz: opp-1862400000 {
1e8853c698276d Sibi Sankar                      2022-02-09   660  			opp-hz = /bits/ 64 <1862400000>;
1e8853c698276d Sibi Sankar                      2022-02-09   661  			opp-peak-kBps = <6220000 38092800>;
1e8853c698276d Sibi Sankar                      2022-02-09   662  		};
1e8853c698276d Sibi Sankar                      2022-02-09   663  
1e8853c698276d Sibi Sankar                      2022-02-09   664  		cpu7_opp_2035mhz: opp-2035200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   665  			opp-hz = /bits/ 64 <2035200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   666  			opp-peak-kBps = <6220000 38092800>;
1e8853c698276d Sibi Sankar                      2022-02-09   667  		};
1e8853c698276d Sibi Sankar                      2022-02-09   668  
1e8853c698276d Sibi Sankar                      2022-02-09   669  		cpu7_opp_2112mhz: opp-2112000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   670  			opp-hz = /bits/ 64 <2112000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   671  			opp-peak-kBps = <6220000 44851200>;
1e8853c698276d Sibi Sankar                      2022-02-09   672  		};
1e8853c698276d Sibi Sankar                      2022-02-09   673  
1e8853c698276d Sibi Sankar                      2022-02-09   674  		cpu7_opp_2208mhz: opp-2208000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   675  			opp-hz = /bits/ 64 <2208000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   676  			opp-peak-kBps = <6220000 44851200>;
1e8853c698276d Sibi Sankar                      2022-02-09   677  		};
1e8853c698276d Sibi Sankar                      2022-02-09   678  
1e8853c698276d Sibi Sankar                      2022-02-09   679  		cpu7_opp_2381mhz: opp-2380800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   680  			opp-hz = /bits/ 64 <2380800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   681  			opp-peak-kBps = <6832000 44851200>;
1e8853c698276d Sibi Sankar                      2022-02-09   682  		};
1e8853c698276d Sibi Sankar                      2022-02-09   683  
1e8853c698276d Sibi Sankar                      2022-02-09   684  		cpu7_opp_2400mhz: opp-2400000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   685  			opp-hz = /bits/ 64 <2400000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   686  			opp-peak-kBps = <8532000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   687  		};
1e8853c698276d Sibi Sankar                      2022-02-09   688  
1e8853c698276d Sibi Sankar                      2022-02-09   689  		cpu7_opp_2515mhz: opp-2515200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   690  			opp-hz = /bits/ 64 <2515200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   691  			opp-peak-kBps = <8532000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   692  		};
1e8853c698276d Sibi Sankar                      2022-02-09   693  
1e8853c698276d Sibi Sankar                      2022-02-09   694  		cpu7_opp_2707mhz: opp-2707200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   695  			opp-hz = /bits/ 64 <2707200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   696  			opp-peak-kBps = <8532000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   697  		};
1e8853c698276d Sibi Sankar                      2022-02-09   698  
1e8853c698276d Sibi Sankar                      2022-02-09   699  		cpu7_opp_3014mhz: opp-3014400000 {
1e8853c698276d Sibi Sankar                      2022-02-09   700  			opp-hz = /bits/ 64 <3014400000>;
1e8853c698276d Sibi Sankar                      2022-02-09   701  			opp-peak-kBps = <8532000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   702  		};
1e8853c698276d Sibi Sankar                      2022-02-09   703  	};
1e8853c698276d Sibi Sankar                      2022-02-09   704  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   705  	memory@80000000 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   706  		device_type = "memory";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   707  		/* We expect the bootloader to fill in the size */
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   708  		reg = <0 0x80000000 0 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   709  	};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   710  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   711  	firmware {
7b59e8ae92fe08 Douglas Anderson                 2023-06-16   712  		scm: scm {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   713  			compatible = "qcom,scm-sc7280", "qcom,scm";
134a4b2f3be287 Mukesh Ojha                      2024-07-05   714  			qcom,dload-mode = <&tcsr_2 0x13000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   715  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   716  	};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   717  
297e6e38320f32 Odelu Kukatla                    2021-04-27   718  	clk_virt: interconnect {
297e6e38320f32 Odelu Kukatla                    2021-04-27   719  		compatible = "qcom,sc7280-clk-virt";
297e6e38320f32 Odelu Kukatla                    2021-04-27   720  		#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27   721  		qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27   722  	};
297e6e38320f32 Odelu Kukatla                    2021-04-27   723  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   724  	smem {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   725  		compatible = "qcom,smem";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   726  		memory-region = <&smem_mem>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   727  		hwlocks = <&tcsr_mutex 3>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   728  	};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   729  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   730  	smp2p-adsp {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   731  		compatible = "qcom,smp2p";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   732  		qcom,smem = <443>, <429>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   733  		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
c3bbe55c942d2a Sibi Sankar                      2021-04-27   734  					     IPCC_MPROC_SIGNAL_SMP2P
c3bbe55c942d2a Sibi Sankar                      2021-04-27   735  					     IRQ_TYPE_EDGE_RISING>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   736  		mboxes = <&ipcc IPCC_CLIENT_LPASS
c3bbe55c942d2a Sibi Sankar                      2021-04-27   737  				IPCC_MPROC_SIGNAL_SMP2P>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   738  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   739  		qcom,local-pid = <0>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   740  		qcom,remote-pid = <2>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   741  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   742  		adsp_smp2p_out: master-kernel {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   743  			qcom,entry-name = "master-kernel";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   744  			#qcom,smem-state-cells = <1>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   745  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   746  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   747  		adsp_smp2p_in: slave-kernel {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   748  			qcom,entry-name = "slave-kernel";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   749  			interrupt-controller;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   750  			#interrupt-cells = <2>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   751  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   752  	};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   753  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   754  	smp2p-cdsp {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   755  		compatible = "qcom,smp2p";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   756  		qcom,smem = <94>, <432>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   757  		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
c3bbe55c942d2a Sibi Sankar                      2021-04-27   758  					     IPCC_MPROC_SIGNAL_SMP2P
c3bbe55c942d2a Sibi Sankar                      2021-04-27   759  					     IRQ_TYPE_EDGE_RISING>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   760  		mboxes = <&ipcc IPCC_CLIENT_CDSP
c3bbe55c942d2a Sibi Sankar                      2021-04-27   761  				IPCC_MPROC_SIGNAL_SMP2P>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   762  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   763  		qcom,local-pid = <0>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   764  		qcom,remote-pid = <5>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   765  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   766  		cdsp_smp2p_out: master-kernel {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   767  			qcom,entry-name = "master-kernel";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   768  			#qcom,smem-state-cells = <1>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   769  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   770  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   771  		cdsp_smp2p_in: slave-kernel {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   772  			qcom,entry-name = "slave-kernel";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   773  			interrupt-controller;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   774  			#interrupt-cells = <2>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   775  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   776  	};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   777  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   778  	smp2p-mpss {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   779  		compatible = "qcom,smp2p";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   780  		qcom,smem = <435>, <428>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   781  		interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
c3bbe55c942d2a Sibi Sankar                      2021-04-27   782  					     IPCC_MPROC_SIGNAL_SMP2P
c3bbe55c942d2a Sibi Sankar                      2021-04-27   783  					     IRQ_TYPE_EDGE_RISING>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   784  		mboxes = <&ipcc IPCC_CLIENT_MPSS
c3bbe55c942d2a Sibi Sankar                      2021-04-27   785  				IPCC_MPROC_SIGNAL_SMP2P>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   786  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   787  		qcom,local-pid = <0>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   788  		qcom,remote-pid = <1>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   789  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   790  		modem_smp2p_out: master-kernel {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   791  			qcom,entry-name = "master-kernel";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   792  			#qcom,smem-state-cells = <1>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   793  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   794  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   795  		modem_smp2p_in: slave-kernel {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   796  			qcom,entry-name = "slave-kernel";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   797  			interrupt-controller;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   798  			#interrupt-cells = <2>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   799  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   800  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   801  		ipa_smp2p_out: ipa-ap-to-modem {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   802  			qcom,entry-name = "ipa";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   803  			#qcom,smem-state-cells = <1>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   804  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   805  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   806  		ipa_smp2p_in: ipa-modem-to-ap {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   807  			qcom,entry-name = "ipa";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   808  			interrupt-controller;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   809  			#interrupt-cells = <2>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   810  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   811  	};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   812  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   813  	smp2p-wpss {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   814  		compatible = "qcom,smp2p";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   815  		qcom,smem = <617>, <616>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   816  		interrupts-extended = <&ipcc IPCC_CLIENT_WPSS
c3bbe55c942d2a Sibi Sankar                      2021-04-27   817  					     IPCC_MPROC_SIGNAL_SMP2P
c3bbe55c942d2a Sibi Sankar                      2021-04-27   818  					     IRQ_TYPE_EDGE_RISING>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   819  		mboxes = <&ipcc IPCC_CLIENT_WPSS
c3bbe55c942d2a Sibi Sankar                      2021-04-27   820  				IPCC_MPROC_SIGNAL_SMP2P>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   821  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   822  		qcom,local-pid = <0>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   823  		qcom,remote-pid = <13>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   824  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   825  		wpss_smp2p_out: master-kernel {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   826  			qcom,entry-name = "master-kernel";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   827  			#qcom,smem-state-cells = <1>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   828  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   829  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   830  		wpss_smp2p_in: slave-kernel {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   831  			qcom,entry-name = "slave-kernel";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   832  			interrupt-controller;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   833  			#interrupt-cells = <2>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   834  		};
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   835  
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   836  		wlan_smp2p_out: wlan-ap-to-wpss {
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   837  			qcom,entry-name = "wlan";
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   838  			#qcom,smem-state-cells = <1>;
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   839  		};
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   840  
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   841  		wlan_smp2p_in: wlan-wpss-to-ap {
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   842  			qcom,entry-name = "wlan";
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   843  			interrupt-controller;
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   844  			#interrupt-cells = <2>;
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   845  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   846  	};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   847  
89f324ef54a2ae Danila Tikhonov                  2024-08-18   848  	pmu-a55 {
89f324ef54a2ae Danila Tikhonov                  2024-08-18   849  		compatible = "arm,cortex-a55-pmu";
89f324ef54a2ae Danila Tikhonov                  2024-08-18   850  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
89f324ef54a2ae Danila Tikhonov                  2024-08-18   851  	};
89f324ef54a2ae Danila Tikhonov                  2024-08-18   852  
89f324ef54a2ae Danila Tikhonov                  2024-08-18   853  	pmu-a78 {
89f324ef54a2ae Danila Tikhonov                  2024-08-18   854  		compatible = "arm,cortex-a78-pmu";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   855  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   856  	};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   857  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   858  	psci {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   859  		compatible = "arm,psci-1.0";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   860  		method = "smc";
7925ca85e95619 Maulik Shah                      2023-07-03   861  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   862  		cpu_pd0: power-domain-cpu0 {
7925ca85e95619 Maulik Shah                      2023-07-03   863  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   864  			power-domains = <&cluster_pd>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   865  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   866  		};
7925ca85e95619 Maulik Shah                      2023-07-03   867  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   868  		cpu_pd1: power-domain-cpu1 {
7925ca85e95619 Maulik Shah                      2023-07-03   869  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   870  			power-domains = <&cluster_pd>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   871  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   872  		};
7925ca85e95619 Maulik Shah                      2023-07-03   873  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   874  		cpu_pd2: power-domain-cpu2 {
7925ca85e95619 Maulik Shah                      2023-07-03   875  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   876  			power-domains = <&cluster_pd>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   877  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   878  		};
7925ca85e95619 Maulik Shah                      2023-07-03   879  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   880  		cpu_pd3: power-domain-cpu3 {
7925ca85e95619 Maulik Shah                      2023-07-03   881  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   882  			power-domains = <&cluster_pd>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   883  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   884  		};
7925ca85e95619 Maulik Shah                      2023-07-03   885  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   886  		cpu_pd4: power-domain-cpu4 {
7925ca85e95619 Maulik Shah                      2023-07-03   887  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   888  			power-domains = <&cluster_pd>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   889  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   890  		};
7925ca85e95619 Maulik Shah                      2023-07-03   891  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   892  		cpu_pd5: power-domain-cpu5 {
7925ca85e95619 Maulik Shah                      2023-07-03   893  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   894  			power-domains = <&cluster_pd>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   895  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   896  		};
7925ca85e95619 Maulik Shah                      2023-07-03   897  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   898  		cpu_pd6: power-domain-cpu6 {
7925ca85e95619 Maulik Shah                      2023-07-03   899  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   900  			power-domains = <&cluster_pd>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   901  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   902  		};
7925ca85e95619 Maulik Shah                      2023-07-03   903  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   904  		cpu_pd7: power-domain-cpu7 {
7925ca85e95619 Maulik Shah                      2023-07-03   905  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   906  			power-domains = <&cluster_pd>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   907  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   908  		};
7925ca85e95619 Maulik Shah                      2023-07-03   909  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   910  		cluster_pd: power-domain-cluster {
7925ca85e95619 Maulik Shah                      2023-07-03   911  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   912  			domain-idle-states = <&cluster_sleep_apss_off &cluster_sleep_cx_ret &cluster_sleep_llcc_off>;
7925ca85e95619 Maulik Shah                      2023-07-03   913  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   914  	};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   915  
0e3e654696074b Krzysztof Kozlowski              2022-06-27   916  	qspi_opp_table: opp-table-qspi {
7720ea001b528d Roja Rani Yarubandi              2021-09-23   917  		compatible = "operating-points-v2";
7720ea001b528d Roja Rani Yarubandi              2021-09-23   918  
7720ea001b528d Roja Rani Yarubandi              2021-09-23   919  		opp-75000000 {
7720ea001b528d Roja Rani Yarubandi              2021-09-23   920  			opp-hz = /bits/ 64 <75000000>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23   921  			required-opps = <&rpmhpd_opp_low_svs>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23   922  		};
7720ea001b528d Roja Rani Yarubandi              2021-09-23   923  
7720ea001b528d Roja Rani Yarubandi              2021-09-23   924  		opp-150000000 {
7720ea001b528d Roja Rani Yarubandi              2021-09-23   925  			opp-hz = /bits/ 64 <150000000>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23   926  			required-opps = <&rpmhpd_opp_svs>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23   927  		};
7720ea001b528d Roja Rani Yarubandi              2021-09-23   928  
6ea15b5065e554 Rajesh Patil                     2021-09-29   929  		opp-200000000 {
6ea15b5065e554 Rajesh Patil                     2021-09-29   930  			opp-hz = /bits/ 64 <200000000>;
6ea15b5065e554 Rajesh Patil                     2021-09-29   931  			required-opps = <&rpmhpd_opp_svs_l1>;
6ea15b5065e554 Rajesh Patil                     2021-09-29   932  		};
6ea15b5065e554 Rajesh Patil                     2021-09-29   933  
7720ea001b528d Roja Rani Yarubandi              2021-09-23   934  		opp-300000000 {
7720ea001b528d Roja Rani Yarubandi              2021-09-23   935  			opp-hz = /bits/ 64 <300000000>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23   936  			required-opps = <&rpmhpd_opp_nom>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23   937  		};
7720ea001b528d Roja Rani Yarubandi              2021-09-23   938  	};
7720ea001b528d Roja Rani Yarubandi              2021-09-23   939  
0e3e654696074b Krzysztof Kozlowski              2022-06-27   940  	qup_opp_table: opp-table-qup {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   941  		compatible = "operating-points-v2";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   942  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   943  		opp-75000000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   944  			opp-hz = /bits/ 64 <75000000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   945  			required-opps = <&rpmhpd_opp_low_svs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   946  		};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   947  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   948  		opp-100000000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   949  			opp-hz = /bits/ 64 <100000000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   950  			required-opps = <&rpmhpd_opp_svs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   951  		};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   952  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   953  		opp-128000000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   954  			opp-hz = /bits/ 64 <128000000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   955  			required-opps = <&rpmhpd_opp_nom>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   956  		};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   957  	};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   958  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   959  	soc: soc@0 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   960  		#address-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   961  		#size-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   962  		ranges = <0 0 0 0 0x10 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   963  		dma-ranges = <0 0 0 0 0x10 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   964  		compatible = "simple-bus";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   965  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   966  		gcc: clock-controller@100000 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   967  			compatible = "qcom,gcc-sc7280";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   968  			reg = <0 0x00100000 0 0x1f0000>;
ab7772de861200 Rajendra Nayak                   2021-03-11   969  			clocks = <&rpmhcc RPMH_CXO_CLK>,
ab7772de861200 Rajendra Nayak                   2021-03-11   970  				 <&rpmhcc RPMH_CXO_CLK_A>, <&sleep_clk>,
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20   971  				 <0>, <&pcie1_phy>,
c8a074789d71c1 Nitin Rawat                      2023-12-05   972  				 <&ufs_mem_phy 0>, <&ufs_mem_phy 1>, <&ufs_mem_phy 2>,
36888ed83f998c Dmitry Baryshkov                 2023-07-11   973  				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
ab7772de861200 Rajendra Nayak                   2021-03-11   974  			clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk",
fa09b2248714c6 Prasad Malisetty                 2021-11-16   975  				      "pcie_0_pipe_clk", "pcie_1_pipe_clk",
ab7772de861200 Rajendra Nayak                   2021-03-11   976  				      "ufs_phy_rx_symbol_0_clk", "ufs_phy_rx_symbol_1_clk",
ab7772de861200 Rajendra Nayak                   2021-03-11   977  				      "ufs_phy_tx_symbol_0_clk",
ab7772de861200 Rajendra Nayak                   2021-03-11   978  				      "usb3_phy_wrapper_gcc_usb30_pipe_clk";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   979  			#clock-cells = <1>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   980  			#reset-cells = <1>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   981  			#power-domain-cells = <1>;
3d59187efc982b Rajendra Nayak                   2022-09-16   982  			power-domains = <&rpmhpd SC7280_CX>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   983  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   984  
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   985  		ipcc: mailbox@408000 {
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   986  			compatible = "qcom,sc7280-ipcc", "qcom,ipcc";
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   987  			reg = <0 0x00408000 0 0x1000>;
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   988  			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   989  			interrupt-controller;
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   990  			#interrupt-cells = <3>;
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   991  			#mbox-cells = <2>;
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   992  		};
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   993  
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   994  		qfprom: efuse@784000 {
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   995  			compatible = "qcom,sc7280-qfprom", "qcom,qfprom";
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   996  			reg = <0 0x00784000 0 0xa20>,
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   997  			      <0 0x00780000 0 0xa20>,
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   998  			      <0 0x00782000 0 0x120>,
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   999  			      <0 0x00786000 0 0x1fff>;
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1000  			clocks = <&gcc GCC_SEC_CTRL_CLK_SRC>;
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1001  			clock-names = "core";
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1002  			power-domains = <&rpmhpd SC7280_MX>;
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1003  			#address-cells = <1>;
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1004  			#size-cells = <1>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  1005  
408e1776516149 Krzysztof Kozlowski              2024-02-13  1006  			gpu_speed_bin: gpu-speed-bin@1e9 {
3bfef00d767124 Akhil P Oommen                   2022-02-26  1007  				reg = <0x1e9 0x2>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  1008  				bits = <5 8>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  1009  			};
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1010  		};
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1011  
96bb736f05d156 Bhupesh Sharma                   2022-05-15  1012  		sdhc_1: mmc@7c4000 {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1013  			compatible = "qcom,sc7280-sdhci", "qcom,sdhci-msm-v5";
f9800dde34e678 Douglas Anderson                 2022-02-02  1014  			pinctrl-names = "default", "sleep";
f9800dde34e678 Douglas Anderson                 2022-02-02  1015  			pinctrl-0 = <&sdc1_clk>, <&sdc1_cmd>, <&sdc1_data>, <&sdc1_rclk>;
f9800dde34e678 Douglas Anderson                 2022-02-02  1016  			pinctrl-1 = <&sdc1_clk_sleep>, <&sdc1_cmd_sleep>, <&sdc1_data_sleep>, <&sdc1_rclk_sleep>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1017  			status = "disabled";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1018  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1019  			reg = <0 0x007c4000 0 0x1000>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1020  			      <0 0x007c5000 0 0x1000>;
21857088fa2747 Douglas Anderson                 2022-07-06  1021  			reg-names = "hc", "cqhci";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1022  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1023  			iommus = <&apps_smmu 0xc0 0x0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1024  			interrupts = <GIC_SPI 652 IRQ_TYPE_LEVEL_HIGH>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1025  				     <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1026  			interrupt-names = "hc_irq", "pwr_irq";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1027  
4ff12270dbbe24 Bhupesh Sharma                   2022-05-15  1028  			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
4ff12270dbbe24 Bhupesh Sharma                   2022-05-15  1029  				 <&gcc GCC_SDCC1_APPS_CLK>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1030  				 <&rpmhcc RPMH_CXO_CLK>;
4ff12270dbbe24 Bhupesh Sharma                   2022-05-15  1031  			clock-names = "iface", "core", "xo";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1032  			interconnects = <&aggre1_noc MASTER_SDCC_1 0 &mc_virt SLAVE_EBI1 0>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1033  					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_SDCC_1 0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1034  			interconnect-names = "sdhc-ddr","cpu-sdhc";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1035  			power-domains = <&rpmhpd SC7280_CX>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1036  			operating-points-v2 = <&sdhc1_opp_table>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1037  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1038  			bus-width = <8>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1039  			supports-cqe;
827f5fc8d91220 Konrad Dybcio                    2023-12-18  1040  			dma-coherent;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1041  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1042  			qcom,dll-config = <0x0007642c>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1043  			qcom,ddr-config = <0x80040868>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1044  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1045  			mmc-ddr-1_8v;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1046  			mmc-hs200-1_8v;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1047  			mmc-hs400-1_8v;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1048  			mmc-hs400-enhanced-strobe;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1049  
959cb513074386 Shaik Sajida Bhanu               2022-04-12  1050  			resets = <&gcc GCC_SDCC1_BCR>;
959cb513074386 Shaik Sajida Bhanu               2022-04-12  1051  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1052  			sdhc1_opp_table: opp-table {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1053  				compatible = "operating-points-v2";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1054  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1055  				opp-100000000 {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1056  					opp-hz = /bits/ 64 <100000000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1057  					required-opps = <&rpmhpd_opp_low_svs>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1058  					opp-peak-kBps = <1800000 400000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1059  					opp-avg-kBps = <100000 0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1060  				};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1061  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1062  				opp-384000000 {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1063  					opp-hz = /bits/ 64 <384000000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1064  					required-opps = <&rpmhpd_opp_nom>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1065  					opp-peak-kBps = <5400000 1600000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1066  					opp-avg-kBps = <390000 0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1067  				};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1068  			};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1069  		};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1070  
c11e239f6aee32 Vinod Koul                       2022-04-21  1071  		gpi_dma0: dma-controller@900000 {
c11e239f6aee32 Vinod Koul                       2022-04-21  1072  			#dma-cells = <3>;
e9f2053b7866ac Krzysztof Kozlowski              2022-10-18  1073  			compatible = "qcom,sc7280-gpi-dma", "qcom,sm6350-gpi-dma";
c11e239f6aee32 Vinod Koul                       2022-04-21  1074  			reg = <0 0x00900000 0 0x60000>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1075  			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1076  				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1077  				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1078  				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1079  				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1080  				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1081  				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1082  				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1083  				     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1084  				     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1085  				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1086  				     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1087  			dma-channels = <12>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1088  			dma-channel-mask = <0x7f>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1089  			iommus = <&apps_smmu 0x0136 0x0>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1090  			status = "disabled";
c11e239f6aee32 Vinod Koul                       2022-04-21  1091  		};
c11e239f6aee32 Vinod Koul                       2022-04-21  1092  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1093  		qupv3_id_0: geniqup@9c0000 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1094  			compatible = "qcom,geni-se-qup";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1095  			reg = <0 0x009c0000 0 0x2000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1096  			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1097  				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1098  			clock-names = "m-ahb", "s-ahb";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1099  			#address-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1100  			#size-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1101  			ranges;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1102  			iommus = <&apps_smmu 0x123 0x0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1103  			status = "disabled";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1104  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1105  			i2c0: i2c@980000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1106  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1107  				reg = <0 0x00980000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1108  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1109  				clock-names = "se";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1110  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1111  				pinctrl-0 = <&qup_i2c0_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1112  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1113  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1114  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1115  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1116  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1117  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1118  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1119  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1120  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1121  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1122  				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1123  				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1124  				dma-names = "tx", "rx";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1125  				status = "disabled";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1126  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1127  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1128  			spi0: spi@980000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1129  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1130  				reg = <0 0x00980000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1131  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1132  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1133  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1134  				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1135  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1136  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1137  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1138  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1139  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1140  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1141  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1142  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1143  				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1144  				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1145  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1146  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1147  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1148  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1149  			uart0: serial@980000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1150  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1151  				reg = <0 0x00980000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1152  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1153  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1154  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1155  				pinctrl-0 = <&qup_uart0_cts>, <&qup_uart0_rts>, <&qup_uart0_tx>, <&qup_uart0_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1156  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1157  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1158  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1159  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1160  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1161  				interconnect-names = "qup-core", "qup-config";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1162  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1163  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1164  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1165  			i2c1: i2c@984000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1166  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1167  				reg = <0 0x00984000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1168  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1169  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1170  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1171  				pinctrl-0 = <&qup_i2c1_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1172  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1173  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1174  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1175  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1176  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1177  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1178  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1179  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1180  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1181  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1182  				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1183  				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1184  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1185  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1186  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1187  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1188  			spi1: spi@984000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1189  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1190  				reg = <0 0x00984000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1191  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1192  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1193  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1194  				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1195  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1196  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1197  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1198  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1199  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1200  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1201  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1202  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1203  				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1204  				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1205  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1206  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1207  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1208  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1209  			uart1: serial@984000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1210  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1211  				reg = <0 0x00984000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1212  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1213  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1214  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1215  				pinctrl-0 = <&qup_uart1_cts>, <&qup_uart1_rts>, <&qup_uart1_tx>, <&qup_uart1_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1216  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1217  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1218  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1219  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1220  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1221  				interconnect-names = "qup-core", "qup-config";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1222  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1223  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1224  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1225  			i2c2: i2c@988000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1226  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1227  				reg = <0 0x00988000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1228  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1229  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1230  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1231  				pinctrl-0 = <&qup_i2c2_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1232  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1233  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1234  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1235  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1236  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1237  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1238  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1239  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1240  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1241  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1242  				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1243  				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1244  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1245  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1246  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1247  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1248  			spi2: spi@988000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1249  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1250  				reg = <0 0x00988000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1251  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1252  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1253  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1254  				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1255  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1256  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1257  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1258  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1259  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1260  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1261  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1262  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1263  				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1264  				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1265  				dma-names = "tx", "rx";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1266  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1267  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1268  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1269  			uart2: serial@988000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1270  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1271  				reg = <0 0x00988000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1272  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1273  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1274  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1275  				pinctrl-0 = <&qup_uart2_cts>, <&qup_uart2_rts>, <&qup_uart2_tx>, <&qup_uart2_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1276  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1277  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1278  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1279  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1280  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1281  				interconnect-names = "qup-core", "qup-config";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1282  				status = "disabled";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1283  			};
fc4f0273d4fba2 Alex Elder                       2021-08-04  1284  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1285  			i2c3: i2c@98c000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1286  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1287  				reg = <0 0x0098c000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1288  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1289  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1290  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1291  				pinctrl-0 = <&qup_i2c3_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1292  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1293  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1294  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1295  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1296  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1297  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1298  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1299  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1300  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1301  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1302  				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1303  				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1304  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1305  				status = "disabled";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1306  			};
fc4f0273d4fba2 Alex Elder                       2021-08-04  1307  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1308  			spi3: spi@98c000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1309  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1310  				reg = <0 0x0098c000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1311  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1312  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1313  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1314  				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1315  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1316  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1317  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1318  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1319  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1320  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1321  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1322  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1323  				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1324  				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1325  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1326  				status = "disabled";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1327  			};
fc4f0273d4fba2 Alex Elder                       2021-08-04  1328  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1329  			uart3: serial@98c000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1330  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1331  				reg = <0 0x0098c000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1332  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1333  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1334  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1335  				pinctrl-0 = <&qup_uart3_cts>, <&qup_uart3_rts>, <&qup_uart3_tx>, <&qup_uart3_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1336  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1337  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1338  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1339  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1340  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1341  				interconnect-names = "qup-core", "qup-config";
fc4f0273d4fba2 Alex Elder                       2021-08-04  1342  				status = "disabled";
fc4f0273d4fba2 Alex Elder                       2021-08-04  1343  			};
fc4f0273d4fba2 Alex Elder                       2021-08-04  1344  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1345  			i2c4: i2c@990000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1346  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1347  				reg = <0 0x00990000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1348  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1349  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1350  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1351  				pinctrl-0 = <&qup_i2c4_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1352  				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1353  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1354  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1355  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1356  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1357  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1358  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1359  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1360  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1361  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1362  				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1363  				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1364  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1365  				status = "disabled";
c3bbe55c942d2a Sibi Sankar                      2021-04-27  1366  			};
c3bbe55c942d2a Sibi Sankar                      2021-04-27  1367  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1368  			spi4: spi@990000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1369  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1370  				reg = <0 0x00990000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1371  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1372  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1373  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1374  				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1375  				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1376  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1377  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1378  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1379  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1380  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1381  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1382  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1383  				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1384  				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1385  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1386  				status = "disabled";
422a295221bba8 Taniya Das                       2021-04-10  1387  			};
422a295221bba8 Taniya Das                       2021-04-10  1388  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1389  			uart4: serial@990000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1390  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1391  				reg = <0 0x00990000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1392  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1393  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1394  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1395  				pinctrl-0 = <&qup_uart4_cts>, <&qup_uart4_rts>, <&qup_uart4_tx>, <&qup_uart4_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1396  				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1397  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1398  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1399  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1400  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1401  				interconnect-names = "qup-core", "qup-config";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1402  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1403  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1404  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1405  			i2c5: i2c@994000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1406  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1407  				reg = <0 0x00994000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1408  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1409  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1410  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1411  				pinctrl-0 = <&qup_i2c5_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1412  				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1413  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1414  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1415  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1416  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1417  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1418  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1419  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1420  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1421  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1422  				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1423  				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1424  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1425  				status = "disabled";
422a295221bba8 Taniya Das                       2021-04-10  1426  			};
422a295221bba8 Taniya Das                       2021-04-10  1427  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1428  			spi5: spi@994000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1429  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1430  				reg = <0 0x00994000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1431  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1432  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1433  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1434  				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1435  				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1436  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1437  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1438  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1439  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1440  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1441  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1442  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1443  				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1444  				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1445  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1446  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1447  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1448  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1449  			uart5: serial@994000 {
2b96407b8f10f1 Viken Dadhaniya                  2024-04-24  1450  				compatible = "qcom,geni-debug-uart";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1451  				reg = <0 0x00994000 0 0x4000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1452  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1453  				clock-names = "se";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1454  				pinctrl-names = "default";
2b96407b8f10f1 Viken Dadhaniya                  2024-04-24  1455  				pinctrl-0 = <&qup_uart5_tx>, <&qup_uart5_rx>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1456  				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
38cd93f413fd94 Roja Rani Yarubandi              2021-09-23  1457  				power-domains = <&rpmhpd SC7280_CX>;
38cd93f413fd94 Roja Rani Yarubandi              2021-09-23  1458  				operating-points-v2 = <&qup_opp_table>;
38cd93f413fd94 Roja Rani Yarubandi              2021-09-23  1459  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
38cd93f413fd94 Roja Rani Yarubandi              2021-09-23  1460  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
38cd93f413fd94 Roja Rani Yarubandi              2021-09-23  1461  				interconnect-names = "qup-core", "qup-config";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1462  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1463  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1464  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1465  			i2c6: i2c@998000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1466  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1467  				reg = <0 0x00998000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1468  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1469  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1470  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1471  				pinctrl-0 = <&qup_i2c6_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1472  				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1473  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1474  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1475  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1476  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1477  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1478  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1479  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1480  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1481  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1482  				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1483  				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1484  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1485  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1486  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1487  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1488  			spi6: spi@998000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1489  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1490  				reg = <0 0x00998000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1491  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1492  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1493  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1494  				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1495  				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1496  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1497  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1498  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1499  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1500  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1501  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1502  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1503  				dmas = <&gpi_dma0 0 6 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1504  				       <&gpi_dma0 1 6 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1505  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1506  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1507  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1508  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1509  			uart6: serial@998000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1510  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1511  				reg = <0 0x00998000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1512  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1513  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1514  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1515  				pinctrl-0 = <&qup_uart6_cts>, <&qup_uart6_rts>, <&qup_uart6_tx>, <&qup_uart6_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1516  				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1517  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1518  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1519  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1520  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1521  				interconnect-names = "qup-core", "qup-config";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1522  				status = "disabled";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1523  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1524  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1525  			i2c7: i2c@99c000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1526  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1527  				reg = <0 0x0099c000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1528  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1529  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1530  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1531  				pinctrl-0 = <&qup_i2c7_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1532  				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1533  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1534  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1535  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1536  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1537  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1538  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1539  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1540  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1541  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1542  				dmas = <&gpi_dma0 0 7 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1543  				       <&gpi_dma0 1 7 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1544  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1545  				status = "disabled";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1546  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1547  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1548  			spi7: spi@99c000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1549  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1550  				reg = <0 0x0099c000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1551  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1552  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1553  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1554  				pinctrl-0 = <&qup_spi7_data_clk>, <&qup_spi7_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1555  				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1556  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1557  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1558  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1559  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1560  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1561  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1562  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1563  				dmas = <&gpi_dma0 0 7 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1564  				       <&gpi_dma0 1 7 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1565  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1566  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1567  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1568  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1569  			uart7: serial@99c000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1570  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1571  				reg = <0 0x0099c000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1572  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1573  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1574  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1575  				pinctrl-0 = <&qup_uart7_cts>, <&qup_uart7_rts>, <&qup_uart7_tx>, <&qup_uart7_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1576  				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1577  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1578  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1579  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1580  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1581  				interconnect-names = "qup-core", "qup-config";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1582  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1583  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1584  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1585  
c11e239f6aee32 Vinod Koul                       2022-04-21  1586  		gpi_dma1: dma-controller@a00000 {
c11e239f6aee32 Vinod Koul                       2022-04-21  1587  			#dma-cells = <3>;
e9f2053b7866ac Krzysztof Kozlowski              2022-10-18  1588  			compatible = "qcom,sc7280-gpi-dma", "qcom,sm6350-gpi-dma";
c11e239f6aee32 Vinod Koul                       2022-04-21  1589  			reg = <0 0x00a00000 0 0x60000>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1590  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1591  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1592  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1593  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1594  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1595  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1596  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1597  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1598  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1599  				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1600  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1601  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1602  			dma-channels = <12>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1603  			dma-channel-mask = <0x1e>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1604  			iommus = <&apps_smmu 0x56 0x0>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1605  			status = "disabled";
c11e239f6aee32 Vinod Koul                       2022-04-21  1606  		};
c11e239f6aee32 Vinod Koul                       2022-04-21  1607  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1608  		qupv3_id_1: geniqup@ac0000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1609  			compatible = "qcom,geni-se-qup";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1610  			reg = <0 0x00ac0000 0 0x2000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1611  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1612  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1613  			clock-names = "m-ahb", "s-ahb";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1614  			#address-cells = <2>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1615  			#size-cells = <2>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1616  			ranges;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1617  			iommus = <&apps_smmu 0x43 0x0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1618  			status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1619  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1620  			i2c8: i2c@a80000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1621  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1622  				reg = <0 0x00a80000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1623  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1624  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1625  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1626  				pinctrl-0 = <&qup_i2c8_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1627  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1628  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1629  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1630  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1631  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1632  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1633  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1634  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1635  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1636  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1637  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1638  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1639  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1640  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1641  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1642  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1643  			spi8: spi@a80000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1644  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1645  				reg = <0 0x00a80000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1646  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1647  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1648  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1649  				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1650  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1651  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1652  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1653  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1654  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1655  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1656  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1657  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1658  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1659  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1660  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1661  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1662  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1663  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1664  			uart8: serial@a80000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1665  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1666  				reg = <0 0x00a80000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1667  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1668  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1669  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1670  				pinctrl-0 = <&qup_uart8_cts>, <&qup_uart8_rts>, <&qup_uart8_tx>, <&qup_uart8_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1671  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1672  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1673  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1674  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1675  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1676  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1677  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1678  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1679  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1680  			i2c9: i2c@a84000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1681  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1682  				reg = <0 0x00a84000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1683  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1684  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1685  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1686  				pinctrl-0 = <&qup_i2c9_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1687  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1688  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1689  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1690  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1691  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1692  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1693  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1694  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1695  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1696  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1697  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1698  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1699  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1700  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1701  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1702  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1703  			spi9: spi@a84000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1704  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1705  				reg = <0 0x00a84000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1706  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1707  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1708  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1709  				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1710  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1711  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1712  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1713  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1714  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1715  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1716  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1717  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1718  				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1719  				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1720  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1721  				status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1722  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1723  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1724  			uart9: serial@a84000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1725  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1726  				reg = <0 0x00a84000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1727  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1728  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1729  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1730  				pinctrl-0 = <&qup_uart9_cts>, <&qup_uart9_rts>, <&qup_uart9_tx>, <&qup_uart9_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1731  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1732  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1733  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1734  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1735  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1736  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1737  				status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1738  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1739  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1740  			i2c10: i2c@a88000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1741  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1742  				reg = <0 0x00a88000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1743  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1744  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1745  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1746  				pinctrl-0 = <&qup_i2c10_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1747  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1748  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1749  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1750  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1751  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1752  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1753  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1754  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1755  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1756  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1757  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1758  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1759  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1760  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1761  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1762  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1763  			spi10: spi@a88000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1764  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1765  				reg = <0 0x00a88000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1766  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1767  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1768  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1769  				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1770  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1771  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1772  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1773  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1774  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1775  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1776  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1777  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1778  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1779  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1780  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1781  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1782  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1783  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1784  			uart10: serial@a88000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1785  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1786  				reg = <0 0x00a88000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1787  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1788  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1789  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1790  				pinctrl-0 = <&qup_uart10_cts>, <&qup_uart10_rts>, <&qup_uart10_tx>, <&qup_uart10_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1791  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1792  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1793  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1794  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1795  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1796  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1797  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1798  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1799  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1800  			i2c11: i2c@a8c000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1801  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1802  				reg = <0 0x00a8c000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1803  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1804  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1805  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1806  				pinctrl-0 = <&qup_i2c11_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1807  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1808  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1809  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1810  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1811  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1812  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1813  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1814  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1815  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1816  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1817  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1818  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1819  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1820  				status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1821  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1822  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1823  			spi11: spi@a8c000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1824  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1825  				reg = <0 0x00a8c000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1826  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1827  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1828  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1829  				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1830  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1831  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1832  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1833  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1834  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1835  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1836  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1837  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1838  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1839  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1840  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1841  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1842  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1843  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1844  			uart11: serial@a8c000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1845  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1846  				reg = <0 0x00a8c000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1847  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1848  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1849  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1850  				pinctrl-0 = <&qup_uart11_cts>, <&qup_uart11_rts>, <&qup_uart11_tx>, <&qup_uart11_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1851  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1852  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1853  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1854  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1855  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1856  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1857  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1858  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1859  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1860  			i2c12: i2c@a90000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1861  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1862  				reg = <0 0x00a90000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1863  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1864  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1865  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1866  				pinctrl-0 = <&qup_i2c12_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1867  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1868  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1869  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1870  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1871  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1872  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1873  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1874  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1875  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1876  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1877  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1878  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1879  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1880  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1881  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1882  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1883  			spi12: spi@a90000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1884  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1885  				reg = <0 0x00a90000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1886  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1887  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1888  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1889  				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1890  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1891  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1892  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1893  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1894  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1895  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1896  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1897  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1898  				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1899  				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1900  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1901  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1902  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1903  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1904  			uart12: serial@a90000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1905  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1906  				reg = <0 0x00a90000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1907  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1908  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1909  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1910  				pinctrl-0 = <&qup_uart12_cts>, <&qup_uart12_rts>, <&qup_uart12_tx>, <&qup_uart12_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1911  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1912  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1913  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1914  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1915  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1916  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1917  				status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1918  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1919  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1920  			i2c13: i2c@a94000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1921  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1922  				reg = <0 0x00a94000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1923  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1924  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1925  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1926  				pinctrl-0 = <&qup_i2c13_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1927  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1928  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1929  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1930  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1931  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1932  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1933  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1934  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1935  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1936  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1937  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1938  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1939  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1940  				status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1941  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1942  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1943  			spi13: spi@a94000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1944  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1945  				reg = <0 0x00a94000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1946  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1947  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1948  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1949  				pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1950  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1951  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1952  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1953  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1954  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1955  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1956  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1957  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1958  				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1959  				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1960  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1961  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1962  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1963  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1964  			uart13: serial@a94000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1965  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1966  				reg = <0 0x00a94000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1967  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1968  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1969  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1970  				pinctrl-0 = <&qup_uart13_cts>, <&qup_uart13_rts>, <&qup_uart13_tx>, <&qup_uart13_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1971  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1972  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1973  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1974  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1975  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1976  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1977  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1978  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1979  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1980  			i2c14: i2c@a98000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1981  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1982  				reg = <0 0x00a98000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1983  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1984  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1985  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1986  				pinctrl-0 = <&qup_i2c14_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1987  				interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1988  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1989  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1990  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1991  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1992  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1993  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1994  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1995  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1996  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1997  				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1998  				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1999  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2000  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2001  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2002  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2003  			spi14: spi@a98000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2004  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2005  				reg = <0 0x00a98000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2006  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2007  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2008  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2009  				pinctrl-0 = <&qup_spi14_data_clk>, <&qup_spi14_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2010  				interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2011  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2012  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2013  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2014  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2015  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2016  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2017  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  2018  				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  2019  				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  2020  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2021  				status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2022  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2023  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2024  			uart14: serial@a98000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2025  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2026  				reg = <0 0x00a98000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2027  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2028  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2029  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2030  				pinctrl-0 = <&qup_uart14_cts>, <&qup_uart14_rts>, <&qup_uart14_tx>, <&qup_uart14_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2031  				interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2032  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2033  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2034  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2035  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2036  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2037  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2038  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2039  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2040  			i2c15: i2c@a9c000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2041  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2042  				reg = <0 0x00a9c000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2043  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2044  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2045  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2046  				pinctrl-0 = <&qup_i2c15_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2047  				interrupts = <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2048  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2049  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2050  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2051  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2052  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2053  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2054  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  2055  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  2056  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  2057  				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  2058  				       <&gpi_dma1 1 7 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  2059  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2060  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2061  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2062  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2063  			spi15: spi@a9c000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2064  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2065  				reg = <0 0x00a9c000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2066  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2067  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2068  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2069  				pinctrl-0 = <&qup_spi15_data_clk>, <&qup_spi15_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2070  				interrupts = <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2071  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2072  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2073  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2074  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2075  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2076  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2077  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  2078  				dmas = <&gpi_dma1 0 7 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  2079  				       <&gpi_dma1 1 7 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  2080  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2081  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2082  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2083  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2084  			uart15: serial@a9c000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2085  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2086  				reg = <0 0x00a9c000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2087  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2088  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2089  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2090  				pinctrl-0 = <&qup_uart15_cts>, <&qup_uart15_rts>, <&qup_uart15_tx>, <&qup_uart15_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2091  				interrupts = <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2092  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2093  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2094  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2095  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2096  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2097  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2098  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2099  		};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2100  
d9f33f465114b8 Om Prakash Singh                 2023-10-16  2101  		rng: rng@10d3000 {
d9f33f465114b8 Om Prakash Singh                 2023-10-16  2102  			compatible = "qcom,sc7280-trng", "qcom,trng";
d9f33f465114b8 Om Prakash Singh                 2023-10-16  2103  			reg = <0 0x010d3000 0 0x1000>;
d9f33f465114b8 Om Prakash Singh                 2023-10-16  2104  		};
d9f33f465114b8 Om Prakash Singh                 2023-10-16  2105  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2106  		cnoc2: interconnect@1500000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2107  			reg = <0 0x01500000 0 0x1000>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2108  			compatible = "qcom,sc7280-cnoc2";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2109  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2110  			qcom,bcm-voters = <&apps_bcm_voter>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2111  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2112  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2113  		cnoc3: interconnect@1502000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2114  			reg = <0 0x01502000 0 0x1000>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2115  			compatible = "qcom,sc7280-cnoc3";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2116  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2117  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2118  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2119  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2120  		mc_virt: interconnect@1580000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2121  			reg = <0 0x01580000 0 0x4>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2122  			compatible = "qcom,sc7280-mc-virt";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2123  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2124  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2125  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2126  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2127  		system_noc: interconnect@1680000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2128  			reg = <0 0x01680000 0 0x15480>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2129  			compatible = "qcom,sc7280-system-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2130  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2131  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2132  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  2133  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2134  		aggre1_noc: interconnect@16e0000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2135  			compatible = "qcom,sc7280-aggre1-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2136  			reg = <0 0x016e0000 0 0x1c080>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2137  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2138  			qcom,bcm-voters = <&apps_bcm_voter>;
2b5004956affaa Odelu Kukatla                    2024-06-07  2139  			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
2b5004956affaa Odelu Kukatla                    2024-06-07  2140  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2141  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  2142  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2143  		aggre2_noc: interconnect@1700000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2144  			reg = <0 0x01700000 0 0x2b080>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2145  			compatible = "qcom,sc7280-aggre2-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2146  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2147  			qcom,bcm-voters = <&apps_bcm_voter>;
2b5004956affaa Odelu Kukatla                    2024-06-07  2148  			clocks = <&rpmhcc RPMH_IPA_CLK>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2149  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  2150  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2151  		mmss_noc: interconnect@1740000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2152  			reg = <0 0x01740000 0 0x1e080>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2153  			compatible = "qcom,sc7280-mmss-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2154  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2155  			qcom,bcm-voters = <&apps_bcm_voter>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2156  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2157  
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2158  		wifi: wifi@17a10040 {
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2159  			compatible = "qcom,wcn6750-wifi";
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2160  			reg = <0 0x17a10040 0 0x0>;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2161  			iommus = <&apps_smmu 0x1c00 0x1>;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2162  			interrupts = <GIC_SPI 768 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2163  				     <GIC_SPI 769 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2164  				     <GIC_SPI 770 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2165  				     <GIC_SPI 771 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2166  				     <GIC_SPI 772 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2167  				     <GIC_SPI 773 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2168  				     <GIC_SPI 774 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2169  				     <GIC_SPI 775 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2170  				     <GIC_SPI 776 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2171  				     <GIC_SPI 777 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2172  				     <GIC_SPI 778 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2173  				     <GIC_SPI 779 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2174  				     <GIC_SPI 780 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2175  				     <GIC_SPI 781 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2176  				     <GIC_SPI 782 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2177  				     <GIC_SPI 783 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2178  				     <GIC_SPI 784 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2179  				     <GIC_SPI 785 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2180  				     <GIC_SPI 786 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2181  				     <GIC_SPI 787 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2182  				     <GIC_SPI 788 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2183  				     <GIC_SPI 789 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2184  				     <GIC_SPI 790 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2185  				     <GIC_SPI 791 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2186  				     <GIC_SPI 792 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2187  				     <GIC_SPI 793 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2188  				     <GIC_SPI 794 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2189  				     <GIC_SPI 795 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2190  				     <GIC_SPI 796 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2191  				     <GIC_SPI 797 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2192  				     <GIC_SPI 798 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2193  				     <GIC_SPI 799 IRQ_TYPE_EDGE_RISING>;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2194  			qcom,rproc = <&remoteproc_wpss>;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2195  			memory-region = <&wlan_fw_mem>, <&wlan_ce_mem>;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2196  			status = "disabled";
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17  2197  			qcom,smem-states = <&wlan_smp2p_out 0>;
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17  2198  			qcom,smem-state-names = "wlan-smp2p-out";
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2199  		};
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2200  
052c9a1f1400f1 Manivannan Sadhasivam            2023-12-06  2201  		pcie1: pcie@1c08000 {
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2202  			compatible = "qcom,pcie-sc7280";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2203  			reg = <0 0x01c08000 0 0x3000>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2204  			      <0 0x40000000 0 0xf1d>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2205  			      <0 0x40000f20 0 0xa8>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2206  			      <0 0x40001000 0 0x1000>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2207  			      <0 0x40100000 0 0x100000>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2208  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2209  			reg-names = "parf", "dbi", "elbi", "atu", "config";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2210  			device_type = "pci";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2211  			linux,pci-domain = <1>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2212  			bus-range = <0x00 0xff>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2213  			num-lanes = <2>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2214  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2215  			#address-cells = <3>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2216  			#size-cells = <2>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2217  
1d4743d6312582 Manivannan Sadhasivam            2023-02-28  2218  			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2219  				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2220  
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2221  			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2222  				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2223  				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2224  				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2225  				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2226  				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2227  				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2228  				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2229  			interrupt-names = "msi0", "msi1", "msi2", "msi3",
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2230  					  "msi4", "msi5", "msi6", "msi7";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2231  			#interrupt-cells = <1>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2232  			interrupt-map-mask = <0 0 0 0x7>;
66b788133030f0 Prasad Malisetty                 2021-11-16  2233  			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>,
66b788133030f0 Prasad Malisetty                 2021-11-16  2234  					<0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>,
66b788133030f0 Prasad Malisetty                 2021-11-16  2235  					<0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH>,
66b788133030f0 Prasad Malisetty                 2021-11-16  2236  					<0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2237  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2238  			clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2239  				 <&gcc GCC_PCIE_1_PIPE_CLK_SRC>,
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2240  				 <&pcie1_phy>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2241  				 <&rpmhcc RPMH_CXO_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2242  				 <&gcc GCC_PCIE_1_AUX_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2243  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2244  				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2245  				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2246  				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2247  				 <&gcc GCC_AGGRE_NOC_PCIE_TBU_CLK>,
aaf85b46aa4145 Krishna chaitanya chundru        2022-09-08  2248  				 <&gcc GCC_DDRSS_PCIE_SF_CLK>,
aaf85b46aa4145 Krishna chaitanya chundru        2022-09-08  2249  				 <&gcc GCC_AGGRE_NOC_PCIE_CENTER_SF_AXI_CLK>,
aaf85b46aa4145 Krishna chaitanya chundru        2022-09-08  2250  				 <&gcc GCC_AGGRE_NOC_PCIE_1_AXI_CLK>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2251  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2252  			clock-names = "pipe",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2253  				      "pipe_mux",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2254  				      "phy_pipe",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2255  				      "ref",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2256  				      "aux",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2257  				      "cfg",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2258  				      "bus_master",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2259  				      "bus_slave",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2260  				      "slave_q2a",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2261  				      "tbu",
aaf85b46aa4145 Krishna chaitanya chundru        2022-09-08  2262  				      "ddrss_sf_tbu",
aaf85b46aa4145 Krishna chaitanya chundru        2022-09-08  2263  				      "aggre0",
aaf85b46aa4145 Krishna chaitanya chundru        2022-09-08  2264  				      "aggre1";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2265  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2266  			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2267  			assigned-clock-rates = <19200000>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2268  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2269  			resets = <&gcc GCC_PCIE_1_BCR>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2270  			reset-names = "pci";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2271  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2272  			power-domains = <&gcc GCC_PCIE_1_GDSC>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2273  
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2274  			phys = <&pcie1_phy>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2275  			phy-names = "pciephy";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2276  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2277  			pinctrl-names = "default";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2278  			pinctrl-0 = <&pcie1_clkreq_n>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2279  
8a63441e83724f Krishna chaitanya chundru        2023-02-28  2280  			dma-coherent;
8a63441e83724f Krishna chaitanya chundru        2023-02-28  2281  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2282  			iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2283  				    <0x100 &apps_smmu 0x1c81 0x1>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2284  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2285  			status = "disabled";
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2286  
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2287  			pcie@0 {
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2288  				device_type = "pci";
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2289  				reg = <0x0 0x0 0x0 0x0 0x0>;
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2290  				bus-range = <0x01 0xff>;
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2291  
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2292  				#address-cells = <3>;
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2293  				#size-cells = <2>;
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2294  				ranges;
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2295  			};
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2296  		};
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2297  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2298  		pcie1_phy: phy@1c0e000 {
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2299  			compatible = "qcom,sm8250-qmp-gen3x2-pcie-phy";
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2300  			reg = <0 0x01c0e000 0 0x1000>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2301  			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2302  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2303  				 <&gcc GCC_PCIE_CLKREF_EN>,
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2304  				 <&gcc GCC_PCIE1_PHY_RCHNG_CLK>,
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2305  				 <&gcc GCC_PCIE_1_PIPE_CLK>;
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2306  			clock-names = "aux",
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2307  				      "cfg_ahb",
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2308  				      "ref",
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2309  				      "refgen",
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2310  				      "pipe";
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2311  
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2312  			clock-output-names = "pcie_1_pipe_clk";
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2313  			#clock-cells = <0>;
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2314  
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2315  			#phy-cells = <0>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2316  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2317  			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2318  			reset-names = "phy";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2319  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2320  			assigned-clocks = <&gcc GCC_PCIE1_PHY_RCHNG_CLK>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2321  			assigned-clock-rates = <100000000>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2322  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2323  			status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2324  		};
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2325  
15288649e4c037 Manivannan Sadhasivam            2024-05-14  2326  		ufs_mem_hc: ufshc@1d84000 {
c8a074789d71c1 Nitin Rawat                      2023-12-05  2327  			compatible = "qcom,sc7280-ufshc", "qcom,ufshc",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2328  				     "jedec,ufs-2.0";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2329  			reg = <0x0 0x01d84000 0x0 0x3000>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2330  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2331  			phys = <&ufs_mem_phy>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2332  			phy-names = "ufsphy";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2333  			lanes-per-direction = <2>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2334  			#reset-cells = <1>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2335  			resets = <&gcc GCC_UFS_PHY_BCR>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2336  			reset-names = "rst";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2337  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2338  			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2339  			required-opps = <&rpmhpd_opp_nom>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2340  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2341  			iommus = <&apps_smmu 0x80 0x0>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2342  			dma-coherent;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2343  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2344  			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
c8a074789d71c1 Nitin Rawat                      2023-12-05  2345  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2346  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
c8a074789d71c1 Nitin Rawat                      2023-12-05  2347  					 &cnoc2 SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2348  			interconnect-names = "ufs-ddr", "cpu-ufs";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2349  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2350  			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2351  				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2352  				 <&gcc GCC_UFS_PHY_AHB_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2353  				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2354  				 <&rpmhcc RPMH_CXO_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2355  				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2356  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2357  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2358  			clock-names = "core_clk",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2359  				      "bus_aggr_clk",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2360  				      "iface_clk",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2361  				      "core_clk_unipro",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2362  				      "ref_clk",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2363  				      "tx_lane0_sync_clk",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2364  				      "rx_lane0_sync_clk",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2365  				      "rx_lane1_sync_clk";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2366  			freq-table-hz =
c8a074789d71c1 Nitin Rawat                      2023-12-05  2367  				<75000000 300000000>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2368  				<0 0>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2369  				<0 0>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2370  				<75000000 300000000>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2371  				<0 0>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2372  				<0 0>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2373  				<0 0>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2374  				<0 0>;
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2375  			qcom,ice = <&ice>;
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2376  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2377  			status = "disabled";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2378  		};
c8a074789d71c1 Nitin Rawat                      2023-12-05  2379  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2380  		ufs_mem_phy: phy@1d87000 {
c8a074789d71c1 Nitin Rawat                      2023-12-05  2381  			compatible = "qcom,sc7280-qmp-ufs-phy";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2382  			reg = <0x0 0x01d87000 0x0 0xe00>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2383  			clocks = <&rpmhcc RPMH_CXO_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2384  				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2385  				 <&gcc GCC_UFS_1_CLKREF_EN>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2386  			clock-names = "ref", "ref_aux", "qref";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2387  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2388  			power-domains = <&rpmhpd SC7280_MX>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2389  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2390  			resets = <&ufs_mem_hc 0>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2391  			reset-names = "ufsphy";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2392  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2393  			#clock-cells = <1>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2394  			#phy-cells = <0>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2395  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2396  			status = "disabled";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2397  		};
c8a074789d71c1 Nitin Rawat                      2023-12-05  2398  
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2399  		ice: crypto@1d88000 {
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2400  			compatible = "qcom,sc7280-inline-crypto-engine",
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2401  				     "qcom,inline-crypto-engine";
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2402  			reg = <0 0x01d88000 0 0x8000>;
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2403  			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2404  		};
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2405  
d488f903a86002 Om Prakash Singh                 2023-12-14  2406  		cryptobam: dma-controller@1dc4000 {
d488f903a86002 Om Prakash Singh                 2023-12-14  2407  			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
d488f903a86002 Om Prakash Singh                 2023-12-14  2408  			reg = <0x0 0x01dc4000 0x0 0x28000>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2409  			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2410  			#dma-cells = <1>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2411  			iommus = <&apps_smmu 0x4e4 0x0011>,
d488f903a86002 Om Prakash Singh                 2023-12-14  2412  				 <&apps_smmu 0x4e6 0x0011>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2413  			qcom,ee = <0>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2414  			qcom,controlled-remotely;
40ec6a2817d927 Luca Weiss                       2023-12-29  2415  			num-channels = <16>;
40ec6a2817d927 Luca Weiss                       2023-12-29  2416  			qcom,num-ees = <4>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2417  		};
d488f903a86002 Om Prakash Singh                 2023-12-14  2418  
d488f903a86002 Om Prakash Singh                 2023-12-14  2419  		crypto: crypto@1dfa000 {
d488f903a86002 Om Prakash Singh                 2023-12-14  2420  			compatible = "qcom,sc7280-qce", "qcom,sm8150-qce", "qcom,qce";
d488f903a86002 Om Prakash Singh                 2023-12-14  2421  			reg = <0x0 0x01dfa000 0x0 0x6000>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2422  			dmas = <&cryptobam 4>, <&cryptobam 5>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2423  			dma-names = "rx", "tx";
d488f903a86002 Om Prakash Singh                 2023-12-14  2424  			iommus = <&apps_smmu 0x4e4 0x0011>,
d488f903a86002 Om Prakash Singh                 2023-12-14  2425  				 <&apps_smmu 0x4e4 0x0011>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2426  			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2427  			interconnect-names = "memory";
d488f903a86002 Om Prakash Singh                 2023-12-14  2428  		};
d488f903a86002 Om Prakash Singh                 2023-12-14  2429  
fc4f0273d4fba2 Alex Elder                       2021-08-04  2430  		ipa: ipa@1e40000 {
fc4f0273d4fba2 Alex Elder                       2021-08-04  2431  			compatible = "qcom,sc7280-ipa";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2432  
fc4f0273d4fba2 Alex Elder                       2021-08-04  2433  			iommus = <&apps_smmu 0x480 0x0>,
fc4f0273d4fba2 Alex Elder                       2021-08-04  2434  				 <&apps_smmu 0x482 0x0>;
94ca994d7e932c Konrad Dybcio                    2023-01-02  2435  			reg = <0 0x01e40000 0 0x8000>,
94ca994d7e932c Konrad Dybcio                    2023-01-02  2436  			      <0 0x01e50000 0 0x4ad0>,
94ca994d7e932c Konrad Dybcio                    2023-01-02  2437  			      <0 0x01e04000 0 0x23000>;
fc4f0273d4fba2 Alex Elder                       2021-08-04  2438  			reg-names = "ipa-reg",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2439  				    "ipa-shared",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2440  				    "gsi";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2441  
33b89923d02153 Stephen Boyd                     2021-08-11  2442  			interrupts-extended = <&intc GIC_SPI 654 IRQ_TYPE_EDGE_RISING>,
33b89923d02153 Stephen Boyd                     2021-08-11  2443  					      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
fc4f0273d4fba2 Alex Elder                       2021-08-04  2444  					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
fc4f0273d4fba2 Alex Elder                       2021-08-04  2445  					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
fc4f0273d4fba2 Alex Elder                       2021-08-04  2446  			interrupt-names = "ipa",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2447  					  "gsi",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2448  					  "ipa-clock-query",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2449  					  "ipa-setup-ready";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2450  
fc4f0273d4fba2 Alex Elder                       2021-08-04  2451  			clocks = <&rpmhcc RPMH_IPA_CLK>;
fc4f0273d4fba2 Alex Elder                       2021-08-04  2452  			clock-names = "core";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2453  
fc4f0273d4fba2 Alex Elder                       2021-08-04  2454  			interconnects = <&aggre2_noc MASTER_IPA 0 &mc_virt SLAVE_EBI1 0>,
fc4f0273d4fba2 Alex Elder                       2021-08-04  2455  					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_IPA_CFG 0>;
fc4f0273d4fba2 Alex Elder                       2021-08-04  2456  			interconnect-names = "memory",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2457  					     "config";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2458  
73419e4d2fd1b8 Alex Elder                       2022-02-01  2459  			qcom,qmp = <&aoss_qmp>;
73419e4d2fd1b8 Alex Elder                       2022-02-01  2460  
fc4f0273d4fba2 Alex Elder                       2021-08-04  2461  			qcom,smem-states = <&ipa_smp2p_out 0>,
fc4f0273d4fba2 Alex Elder                       2021-08-04  2462  					   <&ipa_smp2p_out 1>;
fc4f0273d4fba2 Alex Elder                       2021-08-04  2463  			qcom,smem-state-names = "ipa-clock-enabled-valid",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2464  						"ipa-clock-enabled";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2465  
fc4f0273d4fba2 Alex Elder                       2021-08-04  2466  			status = "disabled";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2467  		};
fc4f0273d4fba2 Alex Elder                       2021-08-04  2468  
c3bbe55c942d2a Sibi Sankar                      2021-04-27  2469  		tcsr_mutex: hwlock@1f40000 {
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2470  			compatible = "qcom,tcsr-mutex";
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2471  			reg = <0 0x01f40000 0 0x20000>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27  2472  			#hwlock-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2473  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27  2474  
d0909bf4fa0fd7 Johan Hovold                     2022-09-05  2475  		tcsr_1: syscon@1f60000 {
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2476  			compatible = "qcom,sc7280-tcsr", "syscon";
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2477  			reg = <0 0x01f60000 0 0x20000>;
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2478  		};
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2479  
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2480  		tcsr_2: syscon@1fc0000 {
dddf4b0621d61b Sibi Sankar                      2021-09-17  2481  			compatible = "qcom,sc7280-tcsr", "syscon";
dddf4b0621d61b Sibi Sankar                      2021-09-17  2482  			reg = <0 0x01fc0000 0 0x30000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2483  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2484  
422a295221bba8 Taniya Das                       2021-04-10  2485  		lpasscc: lpasscc@3000000 {
422a295221bba8 Taniya Das                       2021-04-10  2486  			compatible = "qcom,sc7280-lpasscc";
422a295221bba8 Taniya Das                       2021-04-10  2487  			reg = <0 0x03000000 0 0x40>,
8c7ebabd2e3f33 Satya Priya                      2022-08-10  2488  			      <0 0x03c04000 0 0x4>;
8c7ebabd2e3f33 Satya Priya                      2022-08-10  2489  			reg-names = "qdsp6ss", "top_cc";
422a295221bba8 Taniya Das                       2021-04-10  2490  			clocks = <&gcc GCC_CFG_NOC_LPASS_CLK>;
422a295221bba8 Taniya Das                       2021-04-10  2491  			clock-names = "iface";
422a295221bba8 Taniya Das                       2021-04-10  2492  			#clock-cells = <1>;
6da24ba932082b Luca Weiss                       2023-09-19  2493  			status = "reserved"; /* Owned by ADSP firmware */
422a295221bba8 Taniya Das                       2021-04-10  2494  		};
422a295221bba8 Taniya Das                       2021-04-10  2495  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2496  		lpass_rx_macro: codec@3200000 {
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2497  			compatible = "qcom,sc7280-lpass-rx-macro";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2498  			reg = <0 0x03200000 0 0x1000>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2499  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2500  			pinctrl-names = "default";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2501  			pinctrl-0 = <&lpass_rx_swr_clk>, <&lpass_rx_swr_data>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2502  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2503  			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2504  				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2505  				 <&lpass_va_macro>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2506  			clock-names = "mclk", "npl", "fsgen";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2507  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2508  			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2509  					<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2510  			power-domain-names = "macro", "dcodec";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2511  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2512  			#clock-cells = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2513  			#sound-dai-cells = <1>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2514  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2515  			status = "disabled";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2516  		};
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2517  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2518  		swr0: soundwire@3210000 {
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2519  			compatible = "qcom,soundwire-v1.6.0";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2520  			reg = <0 0x03210000 0 0x2000>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2521  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2522  			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2523  			clocks = <&lpass_rx_macro>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2524  			clock-names = "iface";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2525  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2526  			qcom,din-ports = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2527  			qcom,dout-ports = <5>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2528  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2529  			resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2530  			reset-names = "swr_audio_cgcr";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2531  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2532  			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2533  			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x3f 0x1f 0x03 0x03>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2534  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x01>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2535  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2536  			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2537  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2538  			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2539  			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2540  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2541  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2542  			#sound-dai-cells = <1>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2543  			#address-cells = <2>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2544  			#size-cells = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2545  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2546  			status = "disabled";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2547  		};
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2548  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2549  		lpass_tx_macro: codec@3220000 {
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2550  			compatible = "qcom,sc7280-lpass-tx-macro";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2551  			reg = <0 0x03220000 0 0x1000>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2552  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2553  			pinctrl-names = "default";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2554  			pinctrl-0 = <&lpass_tx_swr_clk>, <&lpass_tx_swr_data>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2555  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2556  			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2557  				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2558  				 <&lpass_va_macro>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2559  			clock-names = "mclk", "npl", "fsgen";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2560  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2561  			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2562  					<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2563  			power-domain-names = "macro", "dcodec";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2564  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2565  			#clock-cells = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2566  			#sound-dai-cells = <1>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2567  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2568  			status = "disabled";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2569  		};
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2570  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2571  		swr1: soundwire@3230000 {
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2572  			compatible = "qcom,soundwire-v1.6.0";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2573  			reg = <0 0x03230000 0 0x2000>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2574  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2575  			interrupts-extended = <&intc GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2576  					      <&pdc 130 IRQ_TYPE_LEVEL_HIGH>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2577  			clocks = <&lpass_tx_macro>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2578  			clock-names = "iface";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2579  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2580  			qcom,din-ports = <3>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2581  			qcom,dout-ports = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2582  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2583  			resets = <&lpass_audiocc LPASS_AUDIO_SWR_TX_CGCR>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2584  			reset-names = "swr_audio_cgcr";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2585  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2586  			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x03 0x03>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2587  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x00 0x02>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2588  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2589  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2590  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2591  			qcom,ports-word-length =	/bits/ 8 <0xff 0x00 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2592  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2593  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2594  			qcom,ports-lane-control =	/bits/ 8 <0x00 0x01 0x00>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2595  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2596  			#sound-dai-cells = <1>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2597  			#address-cells = <2>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2598  			#size-cells = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2599  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2600  			status = "disabled";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2601  		};
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2602  
9499240d15f297 Taniya Das                       2022-02-02  2603  		lpass_audiocc: clock-controller@3300000 {
9499240d15f297 Taniya Das                       2022-02-02  2604  			compatible = "qcom,sc7280-lpassaudiocc";
cb1d0aaa674e99 Satya Priya                      2022-09-20  2605  			reg = <0 0x03300000 0 0x30000>,
cb1d0aaa674e99 Satya Priya                      2022-09-20  2606  			      <0 0x032a9000 0 0x1000>;
9499240d15f297 Taniya Das                       2022-02-02  2607  			clocks = <&rpmhcc RPMH_CXO_CLK>,
9499240d15f297 Taniya Das                       2022-02-02  2608  			       <&lpass_aon LPASS_AON_CC_MAIN_RCG_CLK_SRC>;
9499240d15f297 Taniya Das                       2022-02-02  2609  			clock-names = "bi_tcxo", "lpass_aon_cc_main_rcg_clk_src";
9499240d15f297 Taniya Das                       2022-02-02  2610  			power-domains = <&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
9499240d15f297 Taniya Das                       2022-02-02  2611  			#clock-cells = <1>;
9499240d15f297 Taniya Das                       2022-02-02  2612  			#power-domain-cells = <1>;
e02a16c23410a1 Taniya Das                       2022-08-10  2613  			#reset-cells = <1>;
9499240d15f297 Taniya Das                       2022-02-02  2614  		};
9499240d15f297 Taniya Das                       2022-02-02  2615  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2616  		lpass_va_macro: codec@3370000 {
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2617  			compatible = "qcom,sc7280-lpass-va-macro";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2618  			reg = <0 0x03370000 0 0x1000>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2619  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2620  			pinctrl-names = "default";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2621  			pinctrl-0 = <&lpass_dmic01_clk>, <&lpass_dmic01_data>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2622  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2623  			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2624  			clock-names = "mclk";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2625  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2626  			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2627  					<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2628  			power-domain-names = "macro", "dcodec";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2629  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2630  			#clock-cells = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2631  			#sound-dai-cells = <1>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2632  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2633  			status = "disabled";
9499240d15f297 Taniya Das                       2022-02-02  2634  		};
9499240d15f297 Taniya Das                       2022-02-02  2635  
9499240d15f297 Taniya Das                       2022-02-02  2636  		lpass_aon: clock-controller@3380000 {
9499240d15f297 Taniya Das                       2022-02-02  2637  			compatible = "qcom,sc7280-lpassaoncc";
9499240d15f297 Taniya Das                       2022-02-02  2638  			reg = <0 0x03380000 0 0x30000>;
9499240d15f297 Taniya Das                       2022-02-02  2639  			clocks = <&rpmhcc RPMH_CXO_CLK>,
9499240d15f297 Taniya Das                       2022-02-02  2640  			       <&rpmhcc RPMH_CXO_CLK_A>,
d9a1e922730389 Satya Priya                      2022-08-10  2641  			       <&lpass_core LPASS_CORE_CC_CORE_CLK>;
9499240d15f297 Taniya Das                       2022-02-02  2642  			clock-names = "bi_tcxo", "bi_tcxo_ao", "iface";
9499240d15f297 Taniya Das                       2022-02-02  2643  			#clock-cells = <1>;
9499240d15f297 Taniya Das                       2022-02-02  2644  			#power-domain-cells = <1>;
6da24ba932082b Luca Weiss                       2023-09-19  2645  			status = "reserved"; /* Owned by ADSP firmware */
9499240d15f297 Taniya Das                       2022-02-02  2646  		};
9499240d15f297 Taniya Das                       2022-02-02  2647  
d9a1e922730389 Satya Priya                      2022-08-10  2648  		lpass_core: clock-controller@3900000 {
9499240d15f297 Taniya Das                       2022-02-02  2649  			compatible = "qcom,sc7280-lpasscorecc";
9499240d15f297 Taniya Das                       2022-02-02  2650  			reg = <0 0x03900000 0 0x50000>;
9499240d15f297 Taniya Das                       2022-02-02  2651  			clocks = <&rpmhcc RPMH_CXO_CLK>;
9499240d15f297 Taniya Das                       2022-02-02  2652  			clock-names = "bi_tcxo";
9499240d15f297 Taniya Das                       2022-02-02  2653  			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>;
9499240d15f297 Taniya Das                       2022-02-02  2654  			#clock-cells = <1>;
9499240d15f297 Taniya Das                       2022-02-02  2655  			#power-domain-cells = <1>;
6da24ba932082b Luca Weiss                       2023-09-19  2656  			status = "reserved"; /* Owned by ADSP firmware */
9499240d15f297 Taniya Das                       2022-02-02  2657  		};
9499240d15f297 Taniya Das                       2022-02-02  2658  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2659  		lpass_cpu: audio@3987000 {
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2660  			compatible = "qcom,sc7280-lpass-cpu";
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2661  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2662  			reg = <0 0x03987000 0 0x68000>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2663  			      <0 0x03b00000 0 0x29000>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2664  			      <0 0x03260000 0 0xc000>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2665  			      <0 0x03280000 0 0x29000>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2666  			      <0 0x03340000 0 0x29000>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2667  			      <0 0x0336c000 0 0x3000>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2668  			reg-names = "lpass-hdmiif",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2669  				    "lpass-lpaif",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2670  				    "lpass-rxtx-cdc-dma-lpm",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2671  				    "lpass-rxtx-lpaif",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2672  				    "lpass-va-lpaif",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2673  				    "lpass-va-cdc-dma-lpm";
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2674  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2675  			iommus = <&apps_smmu 0x1820 0>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2676  				 <&apps_smmu 0x1821 0>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2677  				 <&apps_smmu 0x1832 0>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2678  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2679  			power-domains = <&rpmhpd SC7280_LCX>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2680  			power-domain-names = "lcx";
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2681  			required-opps = <&rpmhpd_opp_nom>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2682  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2683  			clocks = <&lpass_aon LPASS_AON_CC_AUDIO_HM_H_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2684  				 <&lpass_core LPASS_CORE_CC_EXT_MCLK0_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2685  				 <&lpass_core LPASS_CORE_CC_SYSNOC_MPORT_CORE_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2686  				 <&lpass_core LPASS_CORE_CC_EXT_IF0_IBIT_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2687  				 <&lpass_core LPASS_CORE_CC_EXT_IF1_IBIT_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2688  				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2689  				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM0_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2690  				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM1_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2691  				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM2_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2692  				 <&lpass_aon LPASS_AON_CC_VA_MEM0_CLK>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2693  			clock-names = "aon_cc_audio_hm_h",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2694  				      "audio_cc_ext_mclk0",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2695  				      "core_cc_sysnoc_mport_core",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2696  				      "core_cc_ext_if0_ibit",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2697  				      "core_cc_ext_if1_ibit",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2698  				      "audio_cc_codec_mem",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2699  				      "audio_cc_codec_mem0",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2700  				      "audio_cc_codec_mem1",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2701  				      "audio_cc_codec_mem2",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2702  				      "aon_cc_va_mem0";
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2703  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2704  			#sound-dai-cells = <1>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2705  			#address-cells = <1>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2706  			#size-cells = <0>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2707  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2708  			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2709  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2710  				     <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2711  				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2712  			interrupt-names = "lpass-irq-lpaif",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2713  					  "lpass-irq-hdmi",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2714  					  "lpass-irq-vaif",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2715  					  "lpass-irq-rxtxif";
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2716  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2717  			status = "disabled";
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2718  		};
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2719  
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2720  		slimbam: dma-controller@3a84000 {
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2721  			compatible = "qcom,bam-v1.7.0";
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2722  			reg = <0 0x03a84000 0 0x20000>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2723  			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2724  			#dma-cells = <1>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2725  			qcom,controlled-remotely;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2726  			num-channels = <31>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2727  			qcom,ee = <1>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2728  			qcom,num-ees = <2>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2729  			iommus = <&apps_smmu 0x1826 0x0>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2730  			status = "disabled";
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2731  		};
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2732  
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2733  		slim: slim-ngd@3ac0000 {
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2734  			compatible = "qcom,slim-ngd-v1.5.0";
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2735  			reg = <0 0x03ac0000 0 0x2c000>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2736  			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2737  			dmas = <&slimbam 3>, <&slimbam 4>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2738  			dma-names = "rx", "tx";
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2739  			iommus = <&apps_smmu 0x1826 0x0>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2740  			#address-cells = <1>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2741  			#size-cells = <0>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2742  			status = "disabled";
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2743  		};
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2744  
9499240d15f297 Taniya Das                       2022-02-02  2745  		lpass_hm: clock-controller@3c00000 {
9499240d15f297 Taniya Das                       2022-02-02  2746  			compatible = "qcom,sc7280-lpasshm";
94ca994d7e932c Konrad Dybcio                    2023-01-02  2747  			reg = <0 0x03c00000 0 0x28>;
9499240d15f297 Taniya Das                       2022-02-02  2748  			clocks = <&rpmhcc RPMH_CXO_CLK>;
9499240d15f297 Taniya Das                       2022-02-02  2749  			clock-names = "bi_tcxo";
9499240d15f297 Taniya Das                       2022-02-02  2750  			#clock-cells = <1>;
9499240d15f297 Taniya Das                       2022-02-02  2751  			#power-domain-cells = <1>;
6da24ba932082b Luca Weiss                       2023-09-19  2752  			status = "reserved"; /* Owned by ADSP firmware */
9499240d15f297 Taniya Das                       2022-02-02  2753  		};
9499240d15f297 Taniya Das                       2022-02-02  2754  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2755  		lpass_ag_noc: interconnect@3c40000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2756  			reg = <0 0x03c40000 0 0xf080>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2757  			compatible = "qcom,sc7280-lpass-ag-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2758  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2759  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2760  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  2761  
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2762  		lpass_tlmm: pinctrl@33c0000 {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2763  			compatible = "qcom,sc7280-lpass-lpi-pinctrl";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2764  			reg = <0 0x033c0000 0x0 0x20000>,
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2765  				<0 0x03550000 0x0 0x10000>;
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2766  			gpio-controller;
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2767  			#gpio-cells = <2>;
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2768  			gpio-ranges = <&lpass_tlmm 0 0 15>;
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2769  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2770  			lpass_dmic01_clk: dmic01-clk-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2771  				pins = "gpio6";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2772  				function = "dmic1_clk";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2773  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2774  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2775  			lpass_dmic01_data: dmic01-data-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2776  				pins = "gpio7";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2777  				function = "dmic1_data";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2778  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2779  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2780  			lpass_dmic23_clk: dmic23-clk-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2781  				pins = "gpio8";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2782  				function = "dmic2_clk";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2783  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2784  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2785  			lpass_dmic23_data: dmic23-data-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2786  				pins = "gpio9";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2787  				function = "dmic2_data";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2788  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2789  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2790  			lpass_rx_swr_clk: rx-swr-clk-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2791  				pins = "gpio3";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2792  				function = "swr_rx_clk";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2793  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2794  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2795  			lpass_rx_swr_data: rx-swr-data-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2796  				pins = "gpio4", "gpio5";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2797  				function = "swr_rx_data";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2798  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2799  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2800  			lpass_tx_swr_clk: tx-swr-clk-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2801  				pins = "gpio0";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2802  				function = "swr_tx_clk";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2803  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2804  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2805  			lpass_tx_swr_data: tx-swr-data-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2806  				pins = "gpio1", "gpio2", "gpio14";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2807  				function = "swr_tx_data";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2808  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2809  		};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2810  
b39f266c19f02c Manaf Meethalavalappu Pallikunhi 2021-08-11  2811  		gpu: gpu@3d00000 {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2812  			compatible = "qcom,adreno-635.0", "qcom,adreno";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2813  			reg = <0 0x03d00000 0 0x40000>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2814  			      <0 0x03d9e000 0 0x1000>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2815  			      <0 0x03d61000 0 0x800>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2816  			reg-names = "kgsl_3d0_reg_memory",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2817  				    "cx_mem",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2818  				    "cx_dbgc";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2819  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
94085049fdad7a Konrad Dybcio                    2023-11-20  2820  			iommus = <&adreno_smmu 0 0x400>,
94085049fdad7a Konrad Dybcio                    2023-11-20  2821  				 <&adreno_smmu 1 0x400>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2822  			operating-points-v2 = <&gpu_opp_table>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2823  			qcom,gmu = <&gmu>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2824  			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2825  			interconnect-names = "gfx-mem";
b39f266c19f02c Manaf Meethalavalappu Pallikunhi 2021-08-11  2826  			#cooling-cells = <2>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2827  
3bfef00d767124 Akhil P Oommen                   2022-02-26  2828  			nvmem-cells = <&gpu_speed_bin>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2829  			nvmem-cell-names = "speed_bin";
3bfef00d767124 Akhil P Oommen                   2022-02-26  2830  
94d5ffab9d5ebc Dmitry Baryshkov                 2024-09-07  2831  			status = "disabled";
94d5ffab9d5ebc Dmitry Baryshkov                 2024-09-07  2832  
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20  2833  			gpu_zap_shader: zap-shader {
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20  2834  				memory-region = <&gpu_zap_mem>;
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20  2835  			};
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20  2836  
96c471970b7bcb Akhil P Oommen                   2021-08-11  2837  			gpu_opp_table: opp-table {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2838  				compatible = "operating-points-v2";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2839  
96c471970b7bcb Akhil P Oommen                   2021-08-11  2840  				opp-315000000 {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2841  					opp-hz = /bits/ 64 <315000000>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2842  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2843  					opp-peak-kBps = <1804000>;
f92dbc3807a92f Eugene Lepshy                    2024-10-14  2844  					opp-supported-hw = <0x17>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2845  				};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2846  
96c471970b7bcb Akhil P Oommen                   2021-08-11  2847  				opp-450000000 {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2848  					opp-hz = /bits/ 64 <450000000>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2849  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2850  					opp-peak-kBps = <4068000>;
f92dbc3807a92f Eugene Lepshy                    2024-10-14  2851  					opp-supported-hw = <0x17>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2852  				};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2853  
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2854  				/* Only applicable for SKUs which has 550Mhz as Fmax */
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2855  				opp-550000000-0 {
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2856  					opp-hz = /bits/ 64 <550000000>;
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2857  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2858  					opp-peak-kBps = <8368000>;
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2859  					opp-supported-hw = <0x01>;
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2860  				};
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2861  
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2862  				opp-550000000-1 {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2863  					opp-hz = /bits/ 64 <550000000>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2864  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2865  					opp-peak-kBps = <6832000>;
f92dbc3807a92f Eugene Lepshy                    2024-10-14  2866  					opp-supported-hw = <0x16>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2867  				};
3bfef00d767124 Akhil P Oommen                   2022-02-26  2868  
3bfef00d767124 Akhil P Oommen                   2022-02-26  2869  				opp-608000000 {
3bfef00d767124 Akhil P Oommen                   2022-02-26  2870  					opp-hz = /bits/ 64 <608000000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2871  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2872  					opp-peak-kBps = <8368000>;
f92dbc3807a92f Eugene Lepshy                    2024-10-14  2873  					opp-supported-hw = <0x16>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2874  				};
3bfef00d767124 Akhil P Oommen                   2022-02-26  2875  
3bfef00d767124 Akhil P Oommen                   2022-02-26  2876  				opp-700000000 {
3bfef00d767124 Akhil P Oommen                   2022-02-26  2877  					opp-hz = /bits/ 64 <700000000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2878  					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2879  					opp-peak-kBps = <8532000>;
6a7f8c635dab30 Konrad Dybcio                    2023-11-20  2880  					opp-supported-hw = <0x06>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2881  				};
3bfef00d767124 Akhil P Oommen                   2022-02-26  2882  
3bfef00d767124 Akhil P Oommen                   2022-02-26  2883  				opp-812000000 {
3bfef00d767124 Akhil P Oommen                   2022-02-26  2884  					opp-hz = /bits/ 64 <812000000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2885  					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2886  					opp-peak-kBps = <8532000>;
6a7f8c635dab30 Konrad Dybcio                    2023-11-20  2887  					opp-supported-hw = <0x06>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2888  				};
3bfef00d767124 Akhil P Oommen                   2022-02-26  2889  
3bfef00d767124 Akhil P Oommen                   2022-02-26  2890  				opp-840000000 {
3bfef00d767124 Akhil P Oommen                   2022-02-26  2891  					opp-hz = /bits/ 64 <840000000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2892  					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2893  					opp-peak-kBps = <8532000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2894  					opp-supported-hw = <0x02>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2895  				};
3bfef00d767124 Akhil P Oommen                   2022-02-26  2896  
3bfef00d767124 Akhil P Oommen                   2022-02-26  2897  				opp-900000000 {
3bfef00d767124 Akhil P Oommen                   2022-02-26  2898  					opp-hz = /bits/ 64 <900000000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2899  					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2900  					opp-peak-kBps = <8532000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2901  					opp-supported-hw = <0x02>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2902  				};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2903  			};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2904  		};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2905  
142a4d995c6adb Douglas Anderson                 2022-01-25  2906  		gmu: gmu@3d6a000 {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2907  			compatible = "qcom,adreno-gmu-635.0", "qcom,adreno-gmu";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2908  			reg = <0 0x03d6a000 0 0x34000>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2909  				<0 0x3de0000 0 0x10000>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2910  				<0 0x0b290000 0 0x10000>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2911  			reg-names = "gmu", "rscc", "gmu_pdc";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2912  			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2913  					<GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2914  			interrupt-names = "hfi", "gmu";
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2915  			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2916  				 <&gpucc GPU_CC_CXO_CLK>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2917  				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2918  				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2919  				 <&gpucc GPU_CC_AHB_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2920  				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2921  				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2922  			clock-names = "gmu",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2923  				      "cxo",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2924  				      "axi",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2925  				      "memnoc",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2926  				      "ahb",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2927  				      "hub",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2928  				      "smmu_vote";
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2929  			power-domains = <&gpucc GPU_CC_CX_GDSC>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2930  					<&gpucc GPU_CC_GX_GDSC>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2931  			power-domain-names = "cx",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2932  					     "gx";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2933  			iommus = <&adreno_smmu 5 0x400>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2934  			operating-points-v2 = <&gmu_opp_table>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2935  
96c471970b7bcb Akhil P Oommen                   2021-08-11  2936  			gmu_opp_table: opp-table {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2937  				compatible = "operating-points-v2";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2938  
96c471970b7bcb Akhil P Oommen                   2021-08-11  2939  				opp-200000000 {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2940  					opp-hz = /bits/ 64 <200000000>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2941  					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2942  				};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2943  			};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2944  		};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2945  
422a295221bba8 Taniya Das                       2021-04-10  2946  		gpucc: clock-controller@3d90000 {
422a295221bba8 Taniya Das                       2021-04-10  2947  			compatible = "qcom,sc7280-gpucc";
422a295221bba8 Taniya Das                       2021-04-10  2948  			reg = <0 0x03d90000 0 0x9000>;
422a295221bba8 Taniya Das                       2021-04-10  2949  			clocks = <&rpmhcc RPMH_CXO_CLK>,
422a295221bba8 Taniya Das                       2021-04-10  2950  				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
422a295221bba8 Taniya Das                       2021-04-10  2951  				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
422a295221bba8 Taniya Das                       2021-04-10  2952  			clock-names = "bi_tcxo",
422a295221bba8 Taniya Das                       2021-04-10  2953  				      "gcc_gpu_gpll0_clk_src",
422a295221bba8 Taniya Das                       2021-04-10  2954  				      "gcc_gpu_gpll0_div_clk_src";
422a295221bba8 Taniya Das                       2021-04-10  2955  			#clock-cells = <1>;
422a295221bba8 Taniya Das                       2021-04-10  2956  			#reset-cells = <1>;
422a295221bba8 Taniya Das                       2021-04-10  2957  			#power-domain-cells = <1>;
422a295221bba8 Taniya Das                       2021-04-10  2958  		};
422a295221bba8 Taniya Das                       2021-04-10  2959  
029d6586dc2d1d Souradeep Chowdhury              2022-12-27  2960  		dma@117f000 {
029d6586dc2d1d Souradeep Chowdhury              2022-12-27  2961  			compatible = "qcom,sc7280-dcc", "qcom,dcc";
029d6586dc2d1d Souradeep Chowdhury              2022-12-27  2962  			reg = <0x0 0x0117f000 0x0 0x1000>,
029d6586dc2d1d Souradeep Chowdhury              2022-12-27  2963  			      <0x0 0x01112000 0x0 0x6000>;
029d6586dc2d1d Souradeep Chowdhury              2022-12-27  2964  		};
029d6586dc2d1d Souradeep Chowdhury              2022-12-27  2965  
96c471970b7bcb Akhil P Oommen                   2021-08-11  2966  		adreno_smmu: iommu@3da0000 {
c564b69984a78c Konrad Dybcio                    2023-02-16  2967  			compatible = "qcom,sc7280-smmu-500", "qcom,adreno-smmu",
c564b69984a78c Konrad Dybcio                    2023-02-16  2968  				     "qcom,smmu-500", "arm,mmu-500";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2969  			reg = <0 0x03da0000 0 0x20000>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2970  			#iommu-cells = <2>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2971  			#global-interrupts = <2>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2972  			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2973  					<GIC_SPI 675 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2974  					<GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2975  					<GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2976  					<GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2977  					<GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2978  					<GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2979  					<GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2980  					<GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2981  					<GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2982  					<GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2983  					<GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2984  
96c471970b7bcb Akhil P Oommen                   2021-08-11  2985  			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2986  				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2987  				 <&gpucc GPU_CC_AHB_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2988  				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2989  				 <&gpucc GPU_CC_CX_GMU_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2990  				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2991  				 <&gpucc GPU_CC_HUB_AON_CLK>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2992  			clock-names = "gcc_gpu_memnoc_gfx_clk",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2993  					"gcc_gpu_snoc_dvm_gfx_clk",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2994  					"gpu_cc_ahb_clk",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2995  					"gpu_cc_hlos1_vote_gpu_smmu_clk",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2996  					"gpu_cc_cx_gmu_clk",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2997  					"gpu_cc_hub_cx_int_clk",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2998  					"gpu_cc_hub_aon_clk";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2999  
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  3000  			power-domains = <&gpucc GPU_CC_CX_GDSC>;
31edad47853418 Konrad Dybcio                    2023-11-20  3001  			dma-coherent;
96c471970b7bcb Akhil P Oommen                   2021-08-11  3002  		};
96c471970b7bcb Akhil P Oommen                   2021-08-11  3003  
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3004  		gfx_0_tbu: tbu@3dd9000 {
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3005  			compatible = "qcom,sc7280-tbu";
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3006  			reg = <0x0 0x3dd9000 0x0 0x1000>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3007  			qcom,stream-id-range = <&adreno_smmu 0x0 0x400>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3008  		};
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3009  
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3010  		gfx_1_tbu: tbu@3ddd000 {
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3011  			compatible = "qcom,sc7280-tbu";
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3012  			reg = <0x0 0x3ddd000 0x0 0x1000>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3013  			qcom,stream-id-range = <&adreno_smmu 0x400 0x400>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3014  		};
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3015  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3016  		remoteproc_mpss: remoteproc@4080000 {
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3017  			compatible = "qcom,sc7280-mpss-pas";
419618bd90f6b2 Luca Weiss                       2023-12-08  3018  			reg = <0 0x04080000 0 0x10000>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3019  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3020  			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3021  					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3022  					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3023  					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3024  					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3025  					      <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3026  			interrupt-names = "wdog", "fatal", "ready", "handover",
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3027  					  "stop-ack", "shutdown-ack";
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3028  
92476ddf02b566 Krzysztof Kozlowski              2022-11-24  3029  			clocks = <&rpmhcc RPMH_CXO_CLK>;
92476ddf02b566 Krzysztof Kozlowski              2022-11-24  3030  			clock-names = "xo";
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3031  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3032  			power-domains = <&rpmhpd SC7280_CX>,
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3033  					<&rpmhpd SC7280_MSS>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3034  			power-domain-names = "cx", "mss";
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3035  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3036  			memory-region = <&mpss_mem>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3037  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3038  			qcom,qmp = <&aoss_qmp>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3039  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3040  			qcom,smem-states = <&modem_smp2p_out 0>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3041  			qcom,smem-state-names = "stop";
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3042  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3043  			status = "disabled";
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3044  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3045  			glink-edge {
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3046  				interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3047  							     IPCC_MPROC_SIGNAL_GLINK_QMP
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3048  							     IRQ_TYPE_EDGE_RISING>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3049  				mboxes = <&ipcc IPCC_CLIENT_MPSS
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3050  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3051  				label = "modem";
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3052  				qcom,remote-pid = <1>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3053  			};
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3054  		};
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3055  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3056  		stm@6002000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3057  			compatible = "arm,coresight-stm", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3058  			reg = <0 0x06002000 0 0x1000>,
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3059  			      <0 0x16280000 0 0x180000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3060  			reg-names = "stm-base", "stm-stimulus-base";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3061  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3062  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3063  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3064  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3065  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3066  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3067  					stm_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3068  						remote-endpoint = <&funnel0_in7>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3069  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3070  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3071  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3072  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3073  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3074  		funnel@6041000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3075  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3076  			reg = <0 0x06041000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3077  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3078  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3079  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3080  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3081  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3082  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3083  					funnel0_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3084  						remote-endpoint = <&merge_funnel_in0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3085  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3086  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3087  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3088  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3089  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3090  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3091  				#size-cells = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3092  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3093  				port@7 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3094  					reg = <7>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3095  					funnel0_in7: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3096  						remote-endpoint = <&stm_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3097  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3098  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3099  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3100  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3101  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3102  		funnel@6042000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3103  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3104  			reg = <0 0x06042000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3105  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3106  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3107  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3108  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3109  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3110  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3111  					funnel1_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3112  						remote-endpoint = <&merge_funnel_in1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3113  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3114  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3115  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3116  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3117  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3118  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3119  				#size-cells = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3120  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3121  				port@4 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3122  					reg = <4>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3123  					funnel1_in4: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3124  						remote-endpoint = <&apss_merge_funnel_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3125  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3126  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3127  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3128  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3129  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3130  		funnel@6045000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3131  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3132  			reg = <0 0x06045000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3133  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3134  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3135  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3136  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3137  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3138  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3139  					merge_funnel_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3140  						remote-endpoint = <&swao_funnel_in>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3141  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3142  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3143  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3144  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3145  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3146  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3147  				#size-cells = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3148  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3149  				port@0 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3150  					reg = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3151  					merge_funnel_in0: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3152  						remote-endpoint = <&funnel0_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3153  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3154  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3155  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3156  				port@1 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3157  					reg = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3158  					merge_funnel_in1: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3159  						remote-endpoint = <&funnel1_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3160  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3161  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3162  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3163  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3164  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3165  		replicator@6046000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3166  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3167  			reg = <0 0x06046000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3168  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3169  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3170  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3171  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3172  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3173  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3174  					replicator_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3175  						remote-endpoint = <&etr_in>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3176  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3177  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3178  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3179  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3180  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3181  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3182  					replicator_in: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3183  						remote-endpoint = <&swao_replicator_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3184  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3185  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3186  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3187  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3188  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3189  		etr@6048000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3190  			compatible = "arm,coresight-tmc", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3191  			reg = <0 0x06048000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3192  			iommus = <&apps_smmu 0x04c0 0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3193  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3194  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3195  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3196  			arm,scatter-gather;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3197  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3198  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3199  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3200  					etr_in: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3201  						remote-endpoint = <&replicator_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3202  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3203  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3204  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3205  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3206  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3207  		funnel@6b04000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3208  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3209  			reg = <0 0x06b04000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3210  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3211  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3212  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3213  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3214  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3215  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3216  					swao_funnel_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3217  						remote-endpoint = <&etf_in>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3218  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3219  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3220  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3221  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3222  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3223  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3224  				#size-cells = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3225  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3226  				port@7 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3227  					reg = <7>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3228  					swao_funnel_in: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3229  						remote-endpoint = <&merge_funnel_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3230  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3231  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3232  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3233  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3234  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3235  		etf@6b05000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3236  			compatible = "arm,coresight-tmc", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3237  			reg = <0 0x06b05000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3238  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3239  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3240  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3241  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3242  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3243  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3244  					etf_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3245  						remote-endpoint = <&swao_replicator_in>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3246  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3247  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3248  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3249  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3250  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3251  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3252  					etf_in: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3253  						remote-endpoint = <&swao_funnel_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3254  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3255  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3256  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3257  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3258  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3259  		replicator@6b06000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3260  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3261  			reg = <0 0x06b06000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3262  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3263  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3264  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3265  			qcom,replicator-loses-context;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3266  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3267  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3268  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3269  					swao_replicator_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3270  						remote-endpoint = <&replicator_in>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3271  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3272  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3273  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3274  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3275  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3276  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3277  					swao_replicator_in: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3278  						remote-endpoint = <&etf_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3279  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3280  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3281  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3282  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3283  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3284  		etm@7040000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3285  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3286  			reg = <0 0x07040000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3287  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  3288  			cpu = <&cpu0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3289  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3290  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3291  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3292  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3293  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3294  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3295  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3296  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3297  					etm0_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3298  						remote-endpoint = <&apss_funnel_in0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3299  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3300  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3301  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3302  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3303  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3304  		etm@7140000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3305  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3306  			reg = <0 0x07140000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3307  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  3308  			cpu = <&cpu1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3309  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3310  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3311  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3312  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3313  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3314  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3315  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3316  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3317  					etm1_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3318  						remote-endpoint = <&apss_funnel_in1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3319  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3320  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3321  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3322  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3323  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3324  		etm@7240000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3325  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3326  			reg = <0 0x07240000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3327  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  3328  			cpu = <&cpu2>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3329  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3330  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3331  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3332  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3333  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3334  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3335  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3336  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3337  					etm2_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3338  						remote-endpoint = <&apss_funnel_in2>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3339  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3340  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3341  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3342  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3343  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3344  		etm@7340000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3345  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3346  			reg = <0 0x07340000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3347  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  3348  			cpu = <&cpu3>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3349  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3350  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3351  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3352  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3353  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3354  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3355  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3356  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3357  					etm3_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3358  						remote-endpoint = <&apss_funnel_in3>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3359  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3360  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3361  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3362  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3363  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3364  		etm@7440000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3365  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3366  			reg = <0 0x07440000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3367  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  3368  			cpu = <&cpu4>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3369  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3370  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3371  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3372  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3373  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3374  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3375  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3376  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3377  					etm4_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3378  						remote-endpoint = <&apss_funnel_in4>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3379  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3380  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3381  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3382  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3383  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3384  		etm@7540000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3385  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3386  			reg = <0 0x07540000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3387  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  3388  			cpu = <&cpu5>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3389  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3390  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3391  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3392  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3393  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3394  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3395  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3396  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3397  					etm5_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3398  						remote-endpoint = <&apss_funnel_in5>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3399  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3400  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3401  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3402  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3403  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3404  		etm@7640000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3405  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3406  			reg = <0 0x07640000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3407  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  3408  			cpu = <&cpu6>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3409  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3410  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3411  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3412  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3413  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3414  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3415  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3416  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3417  					etm6_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3418  						remote-endpoint = <&apss_funnel_in6>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3419  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3420  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3421  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3422  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3423  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3424  		etm@7740000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3425  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3426  			reg = <0 0x07740000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3427  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  3428  			cpu = <&cpu7>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3429  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3430  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3431  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3432  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3433  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3434  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3435  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3436  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3437  					etm7_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3438  						remote-endpoint = <&apss_funnel_in7>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3439  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3440  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3441  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3442  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3443  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3444  		funnel@7800000 { /* APSS Funnel */
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3445  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3446  			reg = <0 0x07800000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3447  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3448  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3449  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3450  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3451  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3452  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3453  					apss_funnel_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3454  						remote-endpoint = <&apss_merge_funnel_in>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3455  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3456  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3457  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3458  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3459  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3460  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3461  				#size-cells = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3462  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3463  				port@0 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3464  					reg = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3465  					apss_funnel_in0: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3466  						remote-endpoint = <&etm0_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3467  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3468  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3469  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3470  				port@1 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3471  					reg = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3472  					apss_funnel_in1: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3473  						remote-endpoint = <&etm1_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3474  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3475  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3476  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3477  				port@2 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3478  					reg = <2>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3479  					apss_funnel_in2: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3480  						remote-endpoint = <&etm2_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3481  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3482  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3483  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3484  				port@3 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3485  					reg = <3>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3486  					apss_funnel_in3: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3487  						remote-endpoint = <&etm3_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3488  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3489  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3490  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3491  				port@4 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3492  					reg = <4>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3493  					apss_funnel_in4: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3494  						remote-endpoint = <&etm4_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3495  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3496  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3497  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3498  				port@5 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3499  					reg = <5>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3500  					apss_funnel_in5: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3501  						remote-endpoint = <&etm5_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3502  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3503  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3504  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3505  				port@6 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3506  					reg = <6>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3507  					apss_funnel_in6: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3508  						remote-endpoint = <&etm6_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3509  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3510  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3511  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3512  				port@7 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3513  					reg = <7>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3514  					apss_funnel_in7: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3515  						remote-endpoint = <&etm7_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3516  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3517  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3518  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3519  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3520  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3521  		funnel@7810000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3522  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3523  			reg = <0 0x07810000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3524  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3525  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3526  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3527  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3528  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3529  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3530  					apss_merge_funnel_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3531  						remote-endpoint = <&funnel1_in4>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3532  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3533  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3534  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3535  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3536  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3537  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3538  					apss_merge_funnel_in: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3539  						remote-endpoint = <&apss_funnel_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3540  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3541  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3542  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3543  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3544  
96bb736f05d156 Bhupesh Sharma                   2022-05-15  3545  		sdhc_2: mmc@8804000 {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3546  			compatible = "qcom,sc7280-sdhci", "qcom,sdhci-msm-v5";
f9800dde34e678 Douglas Anderson                 2022-02-02  3547  			pinctrl-names = "default", "sleep";
f9800dde34e678 Douglas Anderson                 2022-02-02  3548  			pinctrl-0 = <&sdc2_clk>, <&sdc2_cmd>, <&sdc2_data>;
f9800dde34e678 Douglas Anderson                 2022-02-02  3549  			pinctrl-1 = <&sdc2_clk_sleep>, <&sdc2_cmd_sleep>, <&sdc2_data_sleep>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3550  			status = "disabled";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3551  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3552  			reg = <0 0x08804000 0 0x1000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3553  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3554  			iommus = <&apps_smmu 0x100 0x0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3555  			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3556  				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3557  			interrupt-names = "hc_irq", "pwr_irq";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3558  
4ff12270dbbe24 Bhupesh Sharma                   2022-05-15  3559  			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
4ff12270dbbe24 Bhupesh Sharma                   2022-05-15  3560  				 <&gcc GCC_SDCC2_APPS_CLK>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3561  				 <&rpmhcc RPMH_CXO_CLK>;
4ff12270dbbe24 Bhupesh Sharma                   2022-05-15  3562  			clock-names = "iface", "core", "xo";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3563  			interconnects = <&aggre1_noc MASTER_SDCC_2 0 &mc_virt SLAVE_EBI1 0>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3564  					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_SDCC_2 0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3565  			interconnect-names = "sdhc-ddr","cpu-sdhc";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3566  			power-domains = <&rpmhpd SC7280_CX>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3567  			operating-points-v2 = <&sdhc2_opp_table>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3568  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3569  			bus-width = <4>;
827f5fc8d91220 Konrad Dybcio                    2023-12-18  3570  			dma-coherent;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3571  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3572  			qcom,dll-config = <0x0007642c>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3573  
959cb513074386 Shaik Sajida Bhanu               2022-04-12  3574  			resets = <&gcc GCC_SDCC2_BCR>;
959cb513074386 Shaik Sajida Bhanu               2022-04-12  3575  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3576  			sdhc2_opp_table: opp-table {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3577  				compatible = "operating-points-v2";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3578  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3579  				opp-100000000 {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3580  					opp-hz = /bits/ 64 <100000000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3581  					required-opps = <&rpmhpd_opp_low_svs>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3582  					opp-peak-kBps = <1800000 400000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3583  					opp-avg-kBps = <100000 0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3584  				};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3585  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3586  				opp-202000000 {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3587  					opp-hz = /bits/ 64 <202000000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3588  					required-opps = <&rpmhpd_opp_nom>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3589  					opp-peak-kBps = <5400000 1600000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3590  					opp-avg-kBps = <200000 0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3591  				};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3592  			};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3593  		};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3594  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3595  		usb_1_hsphy: phy@88e3000 {
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3596  			compatible = "qcom,sc7280-usb-hs-phy",
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3597  				     "qcom,usb-snps-hs-7nm-phy";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3598  			reg = <0 0x088e3000 0 0x400>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3599  			status = "disabled";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3600  			#phy-cells = <0>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3601  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3602  			clocks = <&rpmhcc RPMH_CXO_CLK>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3603  			clock-names = "ref";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3604  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3605  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3606  		};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3607  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3608  		usb_2_hsphy: phy@88e4000 {
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3609  			compatible = "qcom,sc7280-usb-hs-phy",
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3610  				     "qcom,usb-snps-hs-7nm-phy";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3611  			reg = <0 0x088e4000 0 0x400>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3612  			status = "disabled";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3613  			#phy-cells = <0>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3614  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3615  			clocks = <&rpmhcc RPMH_CXO_CLK>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3616  			clock-names = "ref";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3617  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3618  			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3619  		};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3620  
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3621  		usb_1_qmpphy: phy@88e8000 {
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3622  			compatible = "qcom,sc7280-qmp-usb3-dp-phy";
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3623  			reg = <0 0x088e8000 0 0x3000>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3624  			status = "disabled";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3625  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3626  			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3627  				 <&rpmhcc RPMH_CXO_CLK>,
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3628  				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3629  				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3630  			clock-names = "aux",
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3631  				      "ref",
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3632  				      "com_aux",
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3633  				      "usb3_pipe";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3634  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3635  			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3636  				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3637  			reset-names = "phy", "common";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3638  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3639  			#clock-cells = <1>;
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3640  			#phy-cells = <1>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3641  
2278b16f12a9cc Luca Weiss                       2023-09-29  3642  			ports {
2278b16f12a9cc Luca Weiss                       2023-09-29  3643  				#address-cells = <1>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3644  				#size-cells = <0>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3645  
2278b16f12a9cc Luca Weiss                       2023-09-29  3646  				port@0 {
2278b16f12a9cc Luca Weiss                       2023-09-29  3647  					reg = <0>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3648  
2278b16f12a9cc Luca Weiss                       2023-09-29  3649  					usb_dp_qmpphy_out: endpoint {
2278b16f12a9cc Luca Weiss                       2023-09-29  3650  					};
2278b16f12a9cc Luca Weiss                       2023-09-29  3651  				};
2278b16f12a9cc Luca Weiss                       2023-09-29  3652  
2278b16f12a9cc Luca Weiss                       2023-09-29  3653  				port@1 {
2278b16f12a9cc Luca Weiss                       2023-09-29  3654  					reg = <1>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3655  
2278b16f12a9cc Luca Weiss                       2023-09-29  3656  					usb_dp_qmpphy_usb_ss_in: endpoint {
2278b16f12a9cc Luca Weiss                       2023-09-29  3657  					};
2278b16f12a9cc Luca Weiss                       2023-09-29  3658  				};
2278b16f12a9cc Luca Weiss                       2023-09-29  3659  
2278b16f12a9cc Luca Weiss                       2023-09-29  3660  				port@2 {
2278b16f12a9cc Luca Weiss                       2023-09-29  3661  					reg = <2>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3662  
2278b16f12a9cc Luca Weiss                       2023-09-29  3663  					usb_dp_qmpphy_dp_in: endpoint {
2278b16f12a9cc Luca Weiss                       2023-09-29  3664  					};
2278b16f12a9cc Luca Weiss                       2023-09-29  3665  				};
2278b16f12a9cc Luca Weiss                       2023-09-29  3666  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3667  		};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3668  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3669  		usb_2: usb@8cf8800 {
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3670  			compatible = "qcom,sc7280-dwc3", "qcom,dwc3";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3671  			reg = <0 0x08cf8800 0 0x400>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3672  			status = "disabled";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3673  			#address-cells = <2>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3674  			#size-cells = <2>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3675  			ranges;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3676  			dma-ranges;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3677  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3678  			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3679  				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3680  				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3681  				 <&gcc GCC_USB30_SEC_SLEEP_CLK>,
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3682  				 <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>;
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3683  			clock-names = "cfg_noc",
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3684  				      "core",
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3685  				      "iface",
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3686  				      "sleep",
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3687  				      "mock_utmi";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3688  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3689  			assigned-clocks = <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3690  					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3691  			assigned-clock-rates = <19200000>, <200000000>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3692  
6bf150aef236fb Krishna Kurapati                 2024-01-26  3693  			interrupts-extended = <&intc GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
6bf150aef236fb Krishna Kurapati                 2024-01-26  3694  					      <&intc GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
24f8aba9a7c77c Johan Hovold                     2023-11-20  3695  					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
24f8aba9a7c77c Johan Hovold                     2023-11-20  3696  					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>;
6bf150aef236fb Krishna Kurapati                 2024-01-26  3697  			interrupt-names = "pwr_event",
6bf150aef236fb Krishna Kurapati                 2024-01-26  3698  					  "hs_phy_irq",
2a8d28b8af7906 Johan Hovold                     2022-07-15  3699  					  "dp_hs_phy_irq",
2a8d28b8af7906 Johan Hovold                     2022-07-15  3700  					  "dm_hs_phy_irq";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3701  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3702  			power-domains = <&gcc GCC_USB30_SEC_GDSC>;
3d59187efc982b Rajendra Nayak                   2022-09-16  3703  			required-opps = <&rpmhpd_opp_nom>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3704  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3705  			resets = <&gcc GCC_USB30_SEC_BCR>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3706  
6493367f8031b1 Sandeep Maheswaram               2021-08-02  3707  			interconnects = <&aggre1_noc MASTER_USB2 0 &mc_virt SLAVE_EBI1 0>,
6493367f8031b1 Sandeep Maheswaram               2021-08-02  3708  					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_USB2 0>;
6493367f8031b1 Sandeep Maheswaram               2021-08-02  3709  			interconnect-names = "usb-ddr", "apps-usb";
6493367f8031b1 Sandeep Maheswaram               2021-08-02  3710  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3711  			usb_2_dwc3: usb@8c00000 {
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3712  				compatible = "snps,dwc3";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3713  				reg = <0 0x08c00000 0 0xe000>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3714  				interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3715  				iommus = <&apps_smmu 0xa0 0x0>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3716  				snps,dis_u2_susphy_quirk;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3717  				snps,dis_enblslpm_quirk;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3718  				phys = <&usb_2_hsphy>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3719  				phy-names = "usb2-phy";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3720  				maximum-speed = "high-speed";
0b059979090d72 Souradeep Chowdhury              2022-04-06  3721  				usb-role-switch;
9ee402ccfeb163 Bhupesh Sharma                   2023-05-02  3722  
0b059979090d72 Souradeep Chowdhury              2022-04-06  3723  				port {
0b059979090d72 Souradeep Chowdhury              2022-04-06  3724  					usb2_role_switch: endpoint {
0b059979090d72 Souradeep Chowdhury              2022-04-06  3725  						remote-endpoint = <&eud_ep>;
0b059979090d72 Souradeep Chowdhury              2022-04-06  3726  					};
0b059979090d72 Souradeep Chowdhury              2022-04-06  3727  				};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3728  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3729  		};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3730  
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3731  		qspi: spi@88dc000 {
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3732  			compatible = "qcom,sc7280-qspi", "qcom,qspi-v1";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3733  			reg = <0 0x088dc000 0 0x1000>;
cc406006126e89 Vijaya Krishna Nivarthi          2023-04-24  3734  			iommus = <&apps_smmu 0x20 0x0>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3735  			#address-cells = <1>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3736  			#size-cells = <0>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3737  			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3738  			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3739  				 <&gcc GCC_QSPI_CORE_CLK>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3740  			clock-names = "iface", "core";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3741  			interconnects = <&gem_noc MASTER_APPSS_PROC 0
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3742  					&cnoc2 SLAVE_QSPI_0 0>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3743  			interconnect-names = "qspi-config";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3744  			power-domains = <&rpmhpd SC7280_CX>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3745  			operating-points-v2 = <&qspi_opp_table>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3746  			status = "disabled";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3747  		};
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3748  
3658e411efcbb4 Luca Weiss                       2023-12-08  3749  		remoteproc_adsp: remoteproc@3700000 {
3658e411efcbb4 Luca Weiss                       2023-12-08  3750  			compatible = "qcom,sc7280-adsp-pas";
3658e411efcbb4 Luca Weiss                       2023-12-08  3751  			reg = <0 0x03700000 0 0x100>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3752  
f011688162ec4c Luca Weiss                       2024-02-19  3753  			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
3658e411efcbb4 Luca Weiss                       2023-12-08  3754  					      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
3658e411efcbb4 Luca Weiss                       2023-12-08  3755  					      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
3658e411efcbb4 Luca Weiss                       2023-12-08  3756  					      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
3658e411efcbb4 Luca Weiss                       2023-12-08  3757  					      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
3658e411efcbb4 Luca Weiss                       2023-12-08  3758  					      <&adsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3759  			interrupt-names = "wdog", "fatal", "ready", "handover",
3658e411efcbb4 Luca Weiss                       2023-12-08  3760  					  "stop-ack", "shutdown-ack";
3658e411efcbb4 Luca Weiss                       2023-12-08  3761  
3658e411efcbb4 Luca Weiss                       2023-12-08  3762  			clocks = <&rpmhcc RPMH_CXO_CLK>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3763  			clock-names = "xo";
3658e411efcbb4 Luca Weiss                       2023-12-08  3764  
3658e411efcbb4 Luca Weiss                       2023-12-08  3765  			power-domains = <&rpmhpd SC7280_LCX>,
3658e411efcbb4 Luca Weiss                       2023-12-08  3766  					<&rpmhpd SC7280_LMX>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3767  			power-domain-names = "lcx", "lmx";
3658e411efcbb4 Luca Weiss                       2023-12-08  3768  
3658e411efcbb4 Luca Weiss                       2023-12-08  3769  			memory-region = <&adsp_mem>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3770  
3658e411efcbb4 Luca Weiss                       2023-12-08  3771  			qcom,qmp = <&aoss_qmp>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3772  
3658e411efcbb4 Luca Weiss                       2023-12-08  3773  			qcom,smem-states = <&adsp_smp2p_out 0>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3774  			qcom,smem-state-names = "stop";
3658e411efcbb4 Luca Weiss                       2023-12-08  3775  
3658e411efcbb4 Luca Weiss                       2023-12-08  3776  			status = "disabled";
3658e411efcbb4 Luca Weiss                       2023-12-08  3777  
3658e411efcbb4 Luca Weiss                       2023-12-08  3778  			glink-edge {
3658e411efcbb4 Luca Weiss                       2023-12-08  3779  				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
3658e411efcbb4 Luca Weiss                       2023-12-08  3780  							     IPCC_MPROC_SIGNAL_GLINK_QMP
3658e411efcbb4 Luca Weiss                       2023-12-08  3781  							     IRQ_TYPE_EDGE_RISING>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3782  
3658e411efcbb4 Luca Weiss                       2023-12-08  3783  				mboxes = <&ipcc IPCC_CLIENT_LPASS
3658e411efcbb4 Luca Weiss                       2023-12-08  3784  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3785  
3658e411efcbb4 Luca Weiss                       2023-12-08  3786  				label = "lpass";
3658e411efcbb4 Luca Weiss                       2023-12-08  3787  				qcom,remote-pid = <2>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3788  
f44da5d8722de3 Luca Weiss                       2024-05-10  3789  				apr {
f44da5d8722de3 Luca Weiss                       2024-05-10  3790  					compatible = "qcom,apr-v2";
f44da5d8722de3 Luca Weiss                       2024-05-10  3791  					qcom,glink-channels = "apr_audio_svc";
f44da5d8722de3 Luca Weiss                       2024-05-10  3792  					qcom,domain = <APR_DOMAIN_ADSP>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3793  					#address-cells = <1>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3794  					#size-cells = <0>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3795  
f44da5d8722de3 Luca Weiss                       2024-05-10  3796  					service@3 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3797  						reg = <APR_SVC_ADSP_CORE>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3798  						compatible = "qcom,q6core";
f44da5d8722de3 Luca Weiss                       2024-05-10  3799  						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
f44da5d8722de3 Luca Weiss                       2024-05-10  3800  					};
f44da5d8722de3 Luca Weiss                       2024-05-10  3801  
f44da5d8722de3 Luca Weiss                       2024-05-10  3802  					q6afe: service@4 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3803  						compatible = "qcom,q6afe";
f44da5d8722de3 Luca Weiss                       2024-05-10  3804  						reg = <APR_SVC_AFE>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3805  						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
f44da5d8722de3 Luca Weiss                       2024-05-10  3806  
f44da5d8722de3 Luca Weiss                       2024-05-10  3807  						q6afedai: dais {
f44da5d8722de3 Luca Weiss                       2024-05-10  3808  							compatible = "qcom,q6afe-dais";
f44da5d8722de3 Luca Weiss                       2024-05-10  3809  							#address-cells = <1>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3810  							#size-cells = <0>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3811  							#sound-dai-cells = <1>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3812  						};
f44da5d8722de3 Luca Weiss                       2024-05-10  3813  
f44da5d8722de3 Luca Weiss                       2024-05-10  3814  						q6afecc: clock-controller {
f44da5d8722de3 Luca Weiss                       2024-05-10  3815  							compatible = "qcom,q6afe-clocks";
f44da5d8722de3 Luca Weiss                       2024-05-10  3816  							#clock-cells = <2>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3817  						};
f44da5d8722de3 Luca Weiss                       2024-05-10  3818  					};
f44da5d8722de3 Luca Weiss                       2024-05-10  3819  
f44da5d8722de3 Luca Weiss                       2024-05-10  3820  					q6asm: service@7 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3821  						compatible = "qcom,q6asm";
f44da5d8722de3 Luca Weiss                       2024-05-10  3822  						reg = <APR_SVC_ASM>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3823  						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
f44da5d8722de3 Luca Weiss                       2024-05-10  3824  
f44da5d8722de3 Luca Weiss                       2024-05-10  3825  						q6asmdai: dais {
f44da5d8722de3 Luca Weiss                       2024-05-10  3826  							compatible = "qcom,q6asm-dais";
f44da5d8722de3 Luca Weiss                       2024-05-10  3827  							#address-cells = <1>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3828  							#size-cells = <0>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3829  							#sound-dai-cells = <1>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3830  							iommus = <&apps_smmu 0x1801 0x0>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3831  
f44da5d8722de3 Luca Weiss                       2024-05-10  3832  							dai@0 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3833  								reg = <0>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3834  							};
f44da5d8722de3 Luca Weiss                       2024-05-10  3835  
f44da5d8722de3 Luca Weiss                       2024-05-10  3836  							dai@1 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3837  								reg = <1>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3838  							};
f44da5d8722de3 Luca Weiss                       2024-05-10  3839  
f44da5d8722de3 Luca Weiss                       2024-05-10  3840  							dai@2 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3841  								reg = <2>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3842  							};
f44da5d8722de3 Luca Weiss                       2024-05-10  3843  						};
f44da5d8722de3 Luca Weiss                       2024-05-10  3844  					};
f44da5d8722de3 Luca Weiss                       2024-05-10  3845  
f44da5d8722de3 Luca Weiss                       2024-05-10  3846  					q6adm: service@8 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3847  						compatible = "qcom,q6adm";
f44da5d8722de3 Luca Weiss                       2024-05-10  3848  						reg = <APR_SVC_ADM>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3849  						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
f44da5d8722de3 Luca Weiss                       2024-05-10  3850  
f44da5d8722de3 Luca Weiss                       2024-05-10  3851  						q6routing: routing {
f44da5d8722de3 Luca Weiss                       2024-05-10  3852  							compatible = "qcom,q6adm-routing";
f44da5d8722de3 Luca Weiss                       2024-05-10  3853  							#sound-dai-cells = <0>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3854  						};
f44da5d8722de3 Luca Weiss                       2024-05-10  3855  					};
f44da5d8722de3 Luca Weiss                       2024-05-10  3856  				};
f44da5d8722de3 Luca Weiss                       2024-05-10  3857  
3658e411efcbb4 Luca Weiss                       2023-12-08  3858  				fastrpc {
3658e411efcbb4 Luca Weiss                       2023-12-08  3859  					compatible = "qcom,fastrpc";
3658e411efcbb4 Luca Weiss                       2023-12-08  3860  					qcom,glink-channels = "fastrpcglink-apps-dsp";
3658e411efcbb4 Luca Weiss                       2023-12-08  3861  					label = "adsp";
3658e411efcbb4 Luca Weiss                       2023-12-08  3862  					qcom,non-secure-domain;
3658e411efcbb4 Luca Weiss                       2023-12-08  3863  					#address-cells = <1>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3864  					#size-cells = <0>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3865  
3658e411efcbb4 Luca Weiss                       2023-12-08  3866  					compute-cb@3 {
3658e411efcbb4 Luca Weiss                       2023-12-08  3867  						compatible = "qcom,fastrpc-compute-cb";
3658e411efcbb4 Luca Weiss                       2023-12-08  3868  						reg = <3>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3869  						iommus = <&apps_smmu 0x1803 0x0>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3870  					};
3658e411efcbb4 Luca Weiss                       2023-12-08  3871  
3658e411efcbb4 Luca Weiss                       2023-12-08  3872  					compute-cb@4 {
3658e411efcbb4 Luca Weiss                       2023-12-08  3873  						compatible = "qcom,fastrpc-compute-cb";
3658e411efcbb4 Luca Weiss                       2023-12-08  3874  						reg = <4>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3875  						iommus = <&apps_smmu 0x1804 0x0>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3876  					};
3658e411efcbb4 Luca Weiss                       2023-12-08  3877  
3658e411efcbb4 Luca Weiss                       2023-12-08  3878  					compute-cb@5 {
3658e411efcbb4 Luca Weiss                       2023-12-08  3879  						compatible = "qcom,fastrpc-compute-cb";
3658e411efcbb4 Luca Weiss                       2023-12-08  3880  						reg = <5>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3881  						iommus = <&apps_smmu 0x1805 0x0>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3882  					};
3658e411efcbb4 Luca Weiss                       2023-12-08  3883  				};
3658e411efcbb4 Luca Weiss                       2023-12-08  3884  			};
3658e411efcbb4 Luca Weiss                       2023-12-08  3885  		};
3658e411efcbb4 Luca Weiss                       2023-12-08  3886  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3887  		remoteproc_wpss: remoteproc@8a00000 {
0bcbf092560cc1 Luca Weiss                       2023-12-08  3888  			compatible = "qcom,sc7280-wpss-pas";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3889  			reg = <0 0x08a00000 0 0x10000>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3890  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3891  			interrupts-extended = <&intc GIC_SPI 587 IRQ_TYPE_EDGE_RISING>,
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3892  					      <&wpss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3893  					      <&wpss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3894  					      <&wpss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3895  					      <&wpss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3896  					      <&wpss_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3897  			interrupt-names = "wdog", "fatal", "ready", "handover",
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3898  					  "stop-ack", "shutdown-ack";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3899  
0bcbf092560cc1 Luca Weiss                       2023-12-08  3900  			clocks = <&rpmhcc RPMH_CXO_CLK>;
0bcbf092560cc1 Luca Weiss                       2023-12-08  3901  			clock-names = "xo";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3902  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3903  			power-domains = <&rpmhpd SC7280_CX>,
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3904  					<&rpmhpd SC7280_MX>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3905  			power-domain-names = "cx", "mx";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3906  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3907  			memory-region = <&wpss_mem>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3908  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3909  			qcom,qmp = <&aoss_qmp>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3910  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3911  			qcom,smem-states = <&wpss_smp2p_out 0>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3912  			qcom,smem-state-names = "stop";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3913  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3914  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3915  			status = "disabled";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3916  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3917  			glink-edge {
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3918  				interrupts-extended = <&ipcc IPCC_CLIENT_WPSS
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3919  							     IPCC_MPROC_SIGNAL_GLINK_QMP
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3920  							     IRQ_TYPE_EDGE_RISING>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3921  				mboxes = <&ipcc IPCC_CLIENT_WPSS
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3922  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3923  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3924  				label = "wpss";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3925  				qcom,remote-pid = <13>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3926  			};
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3927  		};
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3928  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3929  		pmu@9091000 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3930  			compatible = "qcom,sc7280-llcc-bwmon";
94ca994d7e932c Konrad Dybcio                    2023-01-02  3931  			reg = <0 0x09091000 0 0x1000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3932  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3933  			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3934  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3935  			interconnects = <&mc_virt MASTER_LLCC 3 &mc_virt SLAVE_EBI1 3>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3936  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3937  			operating-points-v2 = <&llcc_bwmon_opp_table>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3938  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3939  			llcc_bwmon_opp_table: opp-table {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3940  				compatible = "operating-points-v2";
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3941  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3942  				opp-0 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3943  					opp-peak-kBps = <800000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3944  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3945  				opp-1 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3946  					opp-peak-kBps = <1804000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3947  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3948  				opp-2 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3949  					opp-peak-kBps = <2188000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3950  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3951  				opp-3 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3952  					opp-peak-kBps = <3072000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3953  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3954  				opp-4 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3955  					opp-peak-kBps = <4068000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3956  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3957  				opp-5 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3958  					opp-peak-kBps = <6220000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3959  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3960  				opp-6 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3961  					opp-peak-kBps = <6832000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3962  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3963  				opp-7 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3964  					opp-peak-kBps = <8532000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3965  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3966  			};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3967  		};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3968  
b626ac159e5e2c Krzysztof Kozlowski              2022-09-08  3969  		pmu@90b6400 {
bad26511c4cb54 Konrad Dybcio                    2023-03-15  3970  			compatible = "qcom,sc7280-cpu-bwmon", "qcom,sdm845-bwmon";
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3971  			reg = <0 0x090b6400 0 0x600>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3972  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3973  			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3974  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3975  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &gem_noc SLAVE_LLCC 3>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3976  			operating-points-v2 = <&cpu_bwmon_opp_table>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3977  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3978  			cpu_bwmon_opp_table: opp-table {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3979  				compatible = "operating-points-v2";
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3980  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3981  				opp-0 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3982  					opp-peak-kBps = <2400000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3983  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3984  				opp-1 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3985  					opp-peak-kBps = <4800000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3986  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3987  				opp-2 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3988  					opp-peak-kBps = <7456000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3989  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3990  				opp-3 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3991  					opp-peak-kBps = <9600000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3992  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3993  				opp-4 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3994  					opp-peak-kBps = <12896000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3995  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3996  				opp-5 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3997  					opp-peak-kBps = <14928000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3998  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3999  				opp-6 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4000  					opp-peak-kBps = <17056000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4001  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4002  			};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4003  		};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4004  
297e6e38320f32 Odelu Kukatla                    2021-04-27  4005  		dc_noc: interconnect@90e0000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  4006  			reg = <0 0x090e0000 0 0x5080>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4007  			compatible = "qcom,sc7280-dc-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  4008  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4009  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4010  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  4011  
297e6e38320f32 Odelu Kukatla                    2021-04-27  4012  		gem_noc: interconnect@9100000 {
94ca994d7e932c Konrad Dybcio                    2023-01-02  4013  			reg = <0 0x09100000 0 0xe2200>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4014  			compatible = "qcom,sc7280-gem-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  4015  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4016  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4017  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  4018  
0392968dbe099d Sai Prakash Ranjan               2021-03-16  4019  		system-cache-controller@9200000 {
0392968dbe099d Sai Prakash Ranjan               2021-03-16  4020  			compatible = "qcom,sc7280-llcc";
62e5ee9db98ed6 Manivannan Sadhasivam            2023-03-14  4021  			reg = <0 0x09200000 0 0x58000>, <0 0x09280000 0 0x58000>,
62e5ee9db98ed6 Manivannan Sadhasivam            2023-03-14  4022  			      <0 0x09600000 0 0x58000>;
62e5ee9db98ed6 Manivannan Sadhasivam            2023-03-14  4023  			reg-names = "llcc0_base", "llcc1_base", "llcc_broadcast_base";
0392968dbe099d Sai Prakash Ranjan               2021-03-16  4024  			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
0392968dbe099d Sai Prakash Ranjan               2021-03-16  4025  		};
0392968dbe099d Sai Prakash Ranjan               2021-03-16  4026  
0b059979090d72 Souradeep Chowdhury              2022-04-06  4027  		eud: eud@88e0000 {
0b059979090d72 Souradeep Chowdhury              2022-04-06  4028  			compatible = "qcom,sc7280-eud", "qcom,eud";
9ee402ccfeb163 Bhupesh Sharma                   2023-05-02  4029  			reg = <0 0x88e0000 0 0x2000>,
9ee402ccfeb163 Bhupesh Sharma                   2023-05-02  4030  			      <0 0x88e2000 0 0x1000>;
0b059979090d72 Souradeep Chowdhury              2022-04-06  4031  			interrupts-extended = <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
9ee402ccfeb163 Bhupesh Sharma                   2023-05-02  4032  
39c8af78cbefb8 Krzysztof Kozlowski              2023-08-20  4033  			status = "disabled";
39c8af78cbefb8 Krzysztof Kozlowski              2023-08-20  4034  
0b059979090d72 Souradeep Chowdhury              2022-04-06  4035  			ports {
a369c74243ca4a Krzysztof Kozlowski              2023-03-08  4036  				#address-cells = <1>;
a369c74243ca4a Krzysztof Kozlowski              2023-03-08  4037  				#size-cells = <0>;
a369c74243ca4a Krzysztof Kozlowski              2023-03-08  4038  
0b059979090d72 Souradeep Chowdhury              2022-04-06  4039  				port@0 {
a369c74243ca4a Krzysztof Kozlowski              2023-03-08  4040  					reg = <0>;
0b059979090d72 Souradeep Chowdhury              2022-04-06  4041  					eud_ep: endpoint {
0b059979090d72 Souradeep Chowdhury              2022-04-06  4042  						remote-endpoint = <&usb2_role_switch>;
0b059979090d72 Souradeep Chowdhury              2022-04-06  4043  					};
0b059979090d72 Souradeep Chowdhury              2022-04-06  4044  				};
0b059979090d72 Souradeep Chowdhury              2022-04-06  4045  			};
0b059979090d72 Souradeep Chowdhury              2022-04-06  4046  		};
0b059979090d72 Souradeep Chowdhury              2022-04-06  4047  
297e6e38320f32 Odelu Kukatla                    2021-04-27  4048  		nsp_noc: interconnect@a0c0000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  4049  			reg = <0 0x0a0c0000 0 0x10000>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4050  			compatible = "qcom,sc7280-nsp-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  4051  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4052  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4053  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  4054  
df62402e5ff9df Luca Weiss                       2023-12-08  4055  		remoteproc_cdsp: remoteproc@a300000 {
df62402e5ff9df Luca Weiss                       2023-12-08  4056  			compatible = "qcom,sc7280-cdsp-pas";
df62402e5ff9df Luca Weiss                       2023-12-08  4057  			reg = <0 0x0a300000 0 0x10000>;
df62402e5ff9df Luca Weiss                       2023-12-08  4058  
f011688162ec4c Luca Weiss                       2024-02-19  4059  			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
df62402e5ff9df Luca Weiss                       2023-12-08  4060  					      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
df62402e5ff9df Luca Weiss                       2023-12-08  4061  					      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
df62402e5ff9df Luca Weiss                       2023-12-08  4062  					      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
df62402e5ff9df Luca Weiss                       2023-12-08  4063  					      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
df62402e5ff9df Luca Weiss                       2023-12-08  4064  					      <&cdsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
df62402e5ff9df Luca Weiss                       2023-12-08  4065  			interrupt-names = "wdog", "fatal", "ready", "handover",
df62402e5ff9df Luca Weiss                       2023-12-08  4066  					  "stop-ack", "shutdown-ack";
df62402e5ff9df Luca Weiss                       2023-12-08  4067  
df62402e5ff9df Luca Weiss                       2023-12-08  4068  			clocks = <&rpmhcc RPMH_CXO_CLK>;
df62402e5ff9df Luca Weiss                       2023-12-08  4069  			clock-names = "xo";
df62402e5ff9df Luca Weiss                       2023-12-08  4070  
df62402e5ff9df Luca Weiss                       2023-12-08  4071  			power-domains = <&rpmhpd SC7280_CX>,
df62402e5ff9df Luca Weiss                       2023-12-08  4072  					<&rpmhpd SC7280_MX>;
df62402e5ff9df Luca Weiss                       2023-12-08  4073  			power-domain-names = "cx", "mx";
df62402e5ff9df Luca Weiss                       2023-12-08  4074  
df62402e5ff9df Luca Weiss                       2023-12-08  4075  			interconnects = <&nsp_noc MASTER_CDSP_PROC 0 &mc_virt SLAVE_EBI1 0>;
df62402e5ff9df Luca Weiss                       2023-12-08  4076  
df62402e5ff9df Luca Weiss                       2023-12-08  4077  			memory-region = <&cdsp_mem>;
df62402e5ff9df Luca Weiss                       2023-12-08  4078  
df62402e5ff9df Luca Weiss                       2023-12-08  4079  			qcom,qmp = <&aoss_qmp>;
df62402e5ff9df Luca Weiss                       2023-12-08  4080  
df62402e5ff9df Luca Weiss                       2023-12-08  4081  			qcom,smem-states = <&cdsp_smp2p_out 0>;
df62402e5ff9df Luca Weiss                       2023-12-08  4082  			qcom,smem-state-names = "stop";
df62402e5ff9df Luca Weiss                       2023-12-08  4083  
df62402e5ff9df Luca Weiss                       2023-12-08  4084  			status = "disabled";
df62402e5ff9df Luca Weiss                       2023-12-08  4085  
df62402e5ff9df Luca Weiss                       2023-12-08  4086  			glink-edge {
df62402e5ff9df Luca Weiss                       2023-12-08  4087  				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
df62402e5ff9df Luca Weiss                       2023-12-08  4088  							     IPCC_MPROC_SIGNAL_GLINK_QMP
df62402e5ff9df Luca Weiss                       2023-12-08  4089  							     IRQ_TYPE_EDGE_RISING>;
df62402e5ff9df Luca Weiss                       2023-12-08  4090  				mboxes = <&ipcc IPCC_CLIENT_CDSP
df62402e5ff9df Luca Weiss                       2023-12-08  4091  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
df62402e5ff9df Luca Weiss                       2023-12-08  4092  
df62402e5ff9df Luca Weiss                       2023-12-08  4093  				label = "cdsp";
df62402e5ff9df Luca Weiss                       2023-12-08  4094  				qcom,remote-pid = <5>;
df62402e5ff9df Luca Weiss                       2023-12-08  4095  
df62402e5ff9df Luca Weiss                       2023-12-08  4096  				fastrpc {
df62402e5ff9df Luca Weiss                       2023-12-08  4097  					compatible = "qcom,fastrpc";
df62402e5ff9df Luca Weiss                       2023-12-08  4098  					qcom,glink-channels = "fastrpcglink-apps-dsp";
df62402e5ff9df Luca Weiss                       2023-12-08  4099  					label = "cdsp";
df62402e5ff9df Luca Weiss                       2023-12-08  4100  					qcom,non-secure-domain;
df62402e5ff9df Luca Weiss                       2023-12-08  4101  					#address-cells = <1>;
df62402e5ff9df Luca Weiss                       2023-12-08  4102  					#size-cells = <0>;
df62402e5ff9df Luca Weiss                       2023-12-08  4103  
df62402e5ff9df Luca Weiss                       2023-12-08  4104  					compute-cb@1 {
df62402e5ff9df Luca Weiss                       2023-12-08  4105  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4106  						reg = <1>;
df62402e5ff9df Luca Weiss                       2023-12-08  4107  						iommus = <&apps_smmu 0x11a1 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4108  							 <&apps_smmu 0x1181 0x0420>;
df62402e5ff9df Luca Weiss                       2023-12-08  4109  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4110  
df62402e5ff9df Luca Weiss                       2023-12-08  4111  					compute-cb@2 {
df62402e5ff9df Luca Weiss                       2023-12-08  4112  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4113  						reg = <2>;
df62402e5ff9df Luca Weiss                       2023-12-08  4114  						iommus = <&apps_smmu 0x11a2 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4115  							 <&apps_smmu 0x1182 0x0420>;
df62402e5ff9df Luca Weiss                       2023-12-08  4116  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4117  
df62402e5ff9df Luca Weiss                       2023-12-08  4118  					compute-cb@3 {
df62402e5ff9df Luca Weiss                       2023-12-08  4119  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4120  						reg = <3>;
df62402e5ff9df Luca Weiss                       2023-12-08  4121  						iommus = <&apps_smmu 0x11a3 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4122  							 <&apps_smmu 0x1183 0x0420>;
df62402e5ff9df Luca Weiss                       2023-12-08  4123  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4124  
df62402e5ff9df Luca Weiss                       2023-12-08  4125  					compute-cb@4 {
df62402e5ff9df Luca Weiss                       2023-12-08  4126  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4127  						reg = <4>;
df62402e5ff9df Luca Weiss                       2023-12-08  4128  						iommus = <&apps_smmu 0x11a4 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4129  							 <&apps_smmu 0x1184 0x0420>;
df62402e5ff9df Luca Weiss                       2023-12-08  4130  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4131  
df62402e5ff9df Luca Weiss                       2023-12-08  4132  					compute-cb@5 {
df62402e5ff9df Luca Weiss                       2023-12-08  4133  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4134  						reg = <5>;
df62402e5ff9df Luca Weiss                       2023-12-08  4135  						iommus = <&apps_smmu 0x11a5 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4136  							 <&apps_smmu 0x1185 0x0420>;
df62402e5ff9df Luca Weiss                       2023-12-08  4137  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4138  
df62402e5ff9df Luca Weiss                       2023-12-08  4139  					compute-cb@6 {
df62402e5ff9df Luca Weiss                       2023-12-08  4140  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4141  						reg = <6>;
df62402e5ff9df Luca Weiss                       2023-12-08  4142  						iommus = <&apps_smmu 0x11a6 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4143  							 <&apps_smmu 0x1186 0x0420>;
df62402e5ff9df Luca Weiss                       2023-12-08  4144  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4145  
df62402e5ff9df Luca Weiss                       2023-12-08  4146  					compute-cb@7 {
df62402e5ff9df Luca Weiss                       2023-12-08  4147  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4148  						reg = <7>;
df62402e5ff9df Luca Weiss                       2023-12-08  4149  						iommus = <&apps_smmu 0x11a7 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4150  							 <&apps_smmu 0x1187 0x0420>;
df62402e5ff9df Luca Weiss                       2023-12-08  4151  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4152  
df62402e5ff9df Luca Weiss                       2023-12-08  4153  					compute-cb@8 {
df62402e5ff9df Luca Weiss                       2023-12-08  4154  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4155  						reg = <8>;
df62402e5ff9df Luca Weiss                       2023-12-08  4156  						iommus = <&apps_smmu 0x11a8 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4157  							 <&apps_smmu 0x1188 0x0420>;
df62402e5ff9df Luca Weiss                       2023-12-08  4158  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4159  
df62402e5ff9df Luca Weiss                       2023-12-08  4160  					/* note: secure cb9 in downstream */
df62402e5ff9df Luca Weiss                       2023-12-08  4161  
df62402e5ff9df Luca Weiss                       2023-12-08  4162  					compute-cb@11 {
df62402e5ff9df Luca Weiss                       2023-12-08  4163  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4164  						reg = <11>;
df62402e5ff9df Luca Weiss                       2023-12-08  4165  						iommus = <&apps_smmu 0x11ab 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4166  							 <&apps_smmu 0x118b 0x0420>;
df62402e5ff9df Luca Weiss                       2023-12-08  4167  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4168  
df62402e5ff9df Luca Weiss                       2023-12-08  4169  					compute-cb@12 {
df62402e5ff9df Luca Weiss                       2023-12-08  4170  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4171  						reg = <12>;
df62402e5ff9df Luca Weiss                       2023-12-08  4172  						iommus = <&apps_smmu 0x11ac 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4173  							 <&apps_smmu 0x118c 0x0420>;
df62402e5ff9df Luca Weiss                       2023-12-08  4174  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4175  
df62402e5ff9df Luca Weiss                       2023-12-08  4176  					compute-cb@13 {
df62402e5ff9df Luca Weiss                       2023-12-08  4177  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4178  						reg = <13>;
df62402e5ff9df Luca Weiss                       2023-12-08  4179  						iommus = <&apps_smmu 0x11ad 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4180  							 <&apps_smmu 0x118d 0x0420>;
df62402e5ff9df Luca Weiss                       2023-12-08  4181  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4182  
df62402e5ff9df Luca Weiss                       2023-12-08  4183  					compute-cb@14 {
df62402e5ff9df Luca Weiss                       2023-12-08  4184  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4185  						reg = <14>;
df62402e5ff9df Luca Weiss                       2023-12-08  4186  						iommus = <&apps_smmu 0x11ae 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4187  							 <&apps_smmu 0x118e 0x0420>;
df62402e5ff9df Luca Weiss                       2023-12-08  4188  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4189  				};
df62402e5ff9df Luca Weiss                       2023-12-08  4190  			};
df62402e5ff9df Luca Weiss                       2023-12-08  4191  		};
df62402e5ff9df Luca Weiss                       2023-12-08  4192  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4193  		usb_1: usb@a6f8800 {
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4194  			compatible = "qcom,sc7280-dwc3", "qcom,dwc3";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4195  			reg = <0 0x0a6f8800 0 0x400>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4196  			status = "disabled";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4197  			#address-cells = <2>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4198  			#size-cells = <2>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4199  			ranges;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4200  			dma-ranges;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4201  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4202  			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4203  				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4204  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  4205  				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  4206  				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  4207  			clock-names = "cfg_noc",
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  4208  				      "core",
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  4209  				      "iface",
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  4210  				      "sleep",
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  4211  				      "mock_utmi";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4212  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4213  			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4214  					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4215  			assigned-clock-rates = <19200000>, <200000000>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4216  
6bf150aef236fb Krishna Kurapati                 2024-01-26  4217  			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
6bf150aef236fb Krishna Kurapati                 2024-01-26  4218  					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
c34199d967a946 Johan Hovold                     2023-11-20  4219  					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4220  					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
c34199d967a946 Johan Hovold                     2023-11-20  4221  					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
6bf150aef236fb Krishna Kurapati                 2024-01-26  4222  			interrupt-names = "pwr_event",
6bf150aef236fb Krishna Kurapati                 2024-01-26  4223  					  "hs_phy_irq",
2a8d28b8af7906 Johan Hovold                     2022-07-15  4224  					  "dp_hs_phy_irq",
4a7ffc10d19555 Krzysztof Kozlowski              2022-05-04  4225  					  "dm_hs_phy_irq",
2a8d28b8af7906 Johan Hovold                     2022-07-15  4226  					  "ss_phy_irq";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4227  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4228  			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
3d59187efc982b Rajendra Nayak                   2022-09-16  4229  			required-opps = <&rpmhpd_opp_nom>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4230  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4231  			resets = <&gcc GCC_USB30_PRIM_BCR>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4232  
6493367f8031b1 Sandeep Maheswaram               2021-08-02  4233  			interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,
6493367f8031b1 Sandeep Maheswaram               2021-08-02  4234  					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_USB3_0 0>;
6493367f8031b1 Sandeep Maheswaram               2021-08-02  4235  			interconnect-names = "usb-ddr", "apps-usb";
6493367f8031b1 Sandeep Maheswaram               2021-08-02  4236  
d5089f79b1e4fa Johan Hovold                     2022-08-02  4237  			wakeup-source;
d5089f79b1e4fa Johan Hovold                     2022-08-02  4238  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4239  			usb_1_dwc3: usb@a600000 {
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4240  				compatible = "snps,dwc3";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4241  				reg = <0 0x0a600000 0 0xe000>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4242  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4243  				iommus = <&apps_smmu 0xe0 0x0>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4244  				snps,dis_u2_susphy_quirk;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4245  				snps,dis_enblslpm_quirk;
3d930f1750ce30 Krishna Kurapati                 2024-06-04  4246  				snps,parkmode-disable-ss-quirk;
36888ed83f998c Dmitry Baryshkov                 2023-07-11  4247  				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4248  				phy-names = "usb2-phy", "usb3-phy";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4249  				maximum-speed = "super-speed";
d51b2d5c4a041b Luca Weiss                       2023-12-20  4250  
d51b2d5c4a041b Luca Weiss                       2023-12-20  4251  				ports {
d51b2d5c4a041b Luca Weiss                       2023-12-20  4252  					#address-cells = <1>;
d51b2d5c4a041b Luca Weiss                       2023-12-20  4253  					#size-cells = <0>;
d51b2d5c4a041b Luca Weiss                       2023-12-20  4254  
d51b2d5c4a041b Luca Weiss                       2023-12-20  4255  					port@0 {
d51b2d5c4a041b Luca Weiss                       2023-12-20  4256  						reg = <0>;
d51b2d5c4a041b Luca Weiss                       2023-12-20  4257  
d51b2d5c4a041b Luca Weiss                       2023-12-20  4258  						usb_1_dwc3_hs: endpoint {
d51b2d5c4a041b Luca Weiss                       2023-12-20  4259  						};
d51b2d5c4a041b Luca Weiss                       2023-12-20  4260  					};
d51b2d5c4a041b Luca Weiss                       2023-12-20  4261  
d51b2d5c4a041b Luca Weiss                       2023-12-20  4262  					port@1 {
d51b2d5c4a041b Luca Weiss                       2023-12-20  4263  						reg = <1>;
d51b2d5c4a041b Luca Weiss                       2023-12-20  4264  
d51b2d5c4a041b Luca Weiss                       2023-12-20  4265  						usb_1_dwc3_ss: endpoint {
d51b2d5c4a041b Luca Weiss                       2023-12-20  4266  						};
d51b2d5c4a041b Luca Weiss                       2023-12-20  4267  					};
d51b2d5c4a041b Luca Weiss                       2023-12-20  4268  				};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4269  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4270  		};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4271  
37613aee217928 Dikshita Agarwal                 2021-10-26  4272  		venus: video-codec@aa00000 {
37613aee217928 Dikshita Agarwal                 2021-10-26  4273  			compatible = "qcom,sc7280-venus";
37613aee217928 Dikshita Agarwal                 2021-10-26  4274  			reg = <0 0x0aa00000 0 0xd0600>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4275  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4276  
37613aee217928 Dikshita Agarwal                 2021-10-26  4277  			clocks = <&videocc VIDEO_CC_MVSC_CORE_CLK>,
37613aee217928 Dikshita Agarwal                 2021-10-26  4278  				 <&videocc VIDEO_CC_MVSC_CTL_AXI_CLK>,
37613aee217928 Dikshita Agarwal                 2021-10-26  4279  				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
37613aee217928 Dikshita Agarwal                 2021-10-26  4280  				 <&videocc VIDEO_CC_MVS0_CORE_CLK>,
37613aee217928 Dikshita Agarwal                 2021-10-26  4281  				 <&videocc VIDEO_CC_MVS0_AXI_CLK>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4282  			clock-names = "core", "bus", "iface",
37613aee217928 Dikshita Agarwal                 2021-10-26  4283  				      "vcodec_core", "vcodec_bus";
37613aee217928 Dikshita Agarwal                 2021-10-26  4284  
37613aee217928 Dikshita Agarwal                 2021-10-26  4285  			power-domains = <&videocc MVSC_GDSC>,
37613aee217928 Dikshita Agarwal                 2021-10-26  4286  					<&videocc MVS0_GDSC>,
37613aee217928 Dikshita Agarwal                 2021-10-26  4287  					<&rpmhpd SC7280_CX>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4288  			power-domain-names = "venus", "vcodec0", "cx";
37613aee217928 Dikshita Agarwal                 2021-10-26  4289  			operating-points-v2 = <&venus_opp_table>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4290  
37613aee217928 Dikshita Agarwal                 2021-10-26  4291  			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_VENUS_CFG 0>,
37613aee217928 Dikshita Agarwal                 2021-10-26  4292  					<&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4293  			interconnect-names = "cpu-cfg", "video-mem";
37613aee217928 Dikshita Agarwal                 2021-10-26  4294  
82066cdb17608a Luca Weiss                       2023-12-01  4295  			iommus = <&apps_smmu 0x2180 0x20>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4296  			memory-region = <&video_mem>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4297  
82066cdb17608a Luca Weiss                       2023-12-01  4298  			status = "disabled";
82066cdb17608a Luca Weiss                       2023-12-01  4299  
37613aee217928 Dikshita Agarwal                 2021-10-26  4300  			video-decoder {
37613aee217928 Dikshita Agarwal                 2021-10-26  4301  				compatible = "venus-decoder";
37613aee217928 Dikshita Agarwal                 2021-10-26  4302  			};
37613aee217928 Dikshita Agarwal                 2021-10-26  4303  
37613aee217928 Dikshita Agarwal                 2021-10-26  4304  			video-encoder {
37613aee217928 Dikshita Agarwal                 2021-10-26  4305  				compatible = "venus-encoder";
37613aee217928 Dikshita Agarwal                 2021-10-26  4306  			};
37613aee217928 Dikshita Agarwal                 2021-10-26  4307  
0e3e654696074b Krzysztof Kozlowski              2022-06-27  4308  			venus_opp_table: opp-table {
37613aee217928 Dikshita Agarwal                 2021-10-26  4309  				compatible = "operating-points-v2";
37613aee217928 Dikshita Agarwal                 2021-10-26  4310  
37613aee217928 Dikshita Agarwal                 2021-10-26  4311  				opp-133330000 {
37613aee217928 Dikshita Agarwal                 2021-10-26  4312  					opp-hz = /bits/ 64 <133330000>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4313  					required-opps = <&rpmhpd_opp_low_svs>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4314  				};
37613aee217928 Dikshita Agarwal                 2021-10-26  4315  
37613aee217928 Dikshita Agarwal                 2021-10-26  4316  				opp-240000000 {
37613aee217928 Dikshita Agarwal                 2021-10-26  4317  					opp-hz = /bits/ 64 <240000000>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4318  					required-opps = <&rpmhpd_opp_svs>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4319  				};
37613aee217928 Dikshita Agarwal                 2021-10-26  4320  
37613aee217928 Dikshita Agarwal                 2021-10-26  4321  				opp-335000000 {
37613aee217928 Dikshita Agarwal                 2021-10-26  4322  					opp-hz = /bits/ 64 <335000000>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4323  					required-opps = <&rpmhpd_opp_svs_l1>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4324  				};
37613aee217928 Dikshita Agarwal                 2021-10-26  4325  
37613aee217928 Dikshita Agarwal                 2021-10-26  4326  				opp-424000000 {
37613aee217928 Dikshita Agarwal                 2021-10-26  4327  					opp-hz = /bits/ 64 <424000000>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4328  					required-opps = <&rpmhpd_opp_nom>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4329  				};
37613aee217928 Dikshita Agarwal                 2021-10-26  4330  
37613aee217928 Dikshita Agarwal                 2021-10-26  4331  				opp-460000048 {
37613aee217928 Dikshita Agarwal                 2021-10-26  4332  					opp-hz = /bits/ 64 <460000048>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4333  					required-opps = <&rpmhpd_opp_turbo>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4334  				};
37613aee217928 Dikshita Agarwal                 2021-10-26  4335  			};
37613aee217928 Dikshita Agarwal                 2021-10-26  4336  		};
37613aee217928 Dikshita Agarwal                 2021-10-26  4337  
422a295221bba8 Taniya Das                       2021-04-10  4338  		videocc: clock-controller@aaf0000 {
422a295221bba8 Taniya Das                       2021-04-10  4339  			compatible = "qcom,sc7280-videocc";
94ca994d7e932c Konrad Dybcio                    2023-01-02  4340  			reg = <0 0x0aaf0000 0 0x10000>;
422a295221bba8 Taniya Das                       2021-04-10  4341  			clocks = <&rpmhcc RPMH_CXO_CLK>,
422a295221bba8 Taniya Das                       2021-04-10  4342  				<&rpmhcc RPMH_CXO_CLK_A>;
422a295221bba8 Taniya Das                       2021-04-10  4343  			clock-names = "bi_tcxo", "bi_tcxo_ao";
422a295221bba8 Taniya Das                       2021-04-10  4344  			#clock-cells = <1>;
422a295221bba8 Taniya Das                       2021-04-10  4345  			#reset-cells = <1>;
422a295221bba8 Taniya Das                       2021-04-10  4346  			#power-domain-cells = <1>;
422a295221bba8 Taniya Das                       2021-04-10  4347  		};
422a295221bba8 Taniya Das                       2021-04-10  4348  
0c149ca7653286 Luca Weiss                       2023-10-02  4349  		cci0: cci@ac4a000 {
0c149ca7653286 Luca Weiss                       2023-10-02  4350  			compatible = "qcom,sc7280-cci", "qcom,msm8996-cci";
0c149ca7653286 Luca Weiss                       2023-10-02  4351  			reg = <0 0x0ac4a000 0 0x1000>;
0c149ca7653286 Luca Weiss                       2023-10-02  4352  			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
0c149ca7653286 Luca Weiss                       2023-10-02  4353  			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
0c149ca7653286 Luca Weiss                       2023-10-02  4354  
0c149ca7653286 Luca Weiss                       2023-10-02  4355  			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
0c149ca7653286 Luca Weiss                       2023-10-02  4356  				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
0c149ca7653286 Luca Weiss                       2023-10-02  4357  				 <&camcc CAM_CC_CPAS_AHB_CLK>,
0c149ca7653286 Luca Weiss                       2023-10-02  4358  				 <&camcc CAM_CC_CCI_0_CLK>,
0c149ca7653286 Luca Weiss                       2023-10-02  4359  				 <&camcc CAM_CC_CCI_0_CLK_SRC>;
0c149ca7653286 Luca Weiss                       2023-10-02  4360  			clock-names = "camnoc_axi",
0c149ca7653286 Luca Weiss                       2023-10-02  4361  				      "slow_ahb_src",
0c149ca7653286 Luca Weiss                       2023-10-02  4362  				      "cpas_ahb",
0c149ca7653286 Luca Weiss                       2023-10-02  4363  				      "cci",
0c149ca7653286 Luca Weiss                       2023-10-02  4364  				      "cci_src";
0c149ca7653286 Luca Weiss                       2023-10-02  4365  			pinctrl-0 = <&cci0_default &cci1_default>;
0c149ca7653286 Luca Weiss                       2023-10-02  4366  			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
0c149ca7653286 Luca Weiss                       2023-10-02  4367  			pinctrl-names = "default", "sleep";
0c149ca7653286 Luca Weiss                       2023-10-02  4368  
0c149ca7653286 Luca Weiss                       2023-10-02  4369  			#address-cells = <1>;
0c149ca7653286 Luca Weiss                       2023-10-02  4370  			#size-cells = <0>;
0c149ca7653286 Luca Weiss                       2023-10-02  4371  
0c149ca7653286 Luca Weiss                       2023-10-02  4372  			status = "disabled";
0c149ca7653286 Luca Weiss                       2023-10-02  4373  
0c149ca7653286 Luca Weiss                       2023-10-02  4374  			cci0_i2c0: i2c-bus@0 {
0c149ca7653286 Luca Weiss                       2023-10-02  4375  				reg = <0>;
0c149ca7653286 Luca Weiss                       2023-10-02  4376  				clock-frequency = <1000000>;
0c149ca7653286 Luca Weiss                       2023-10-02  4377  				#address-cells = <1>;
0c149ca7653286 Luca Weiss                       2023-10-02  4378  				#size-cells = <0>;
0c149ca7653286 Luca Weiss                       2023-10-02  4379  			};
0c149ca7653286 Luca Weiss                       2023-10-02  4380  
0c149ca7653286 Luca Weiss                       2023-10-02  4381  			cci0_i2c1: i2c-bus@1 {
0c149ca7653286 Luca Weiss                       2023-10-02  4382  				reg = <1>;
0c149ca7653286 Luca Weiss                       2023-10-02  4383  				clock-frequency = <1000000>;
0c149ca7653286 Luca Weiss                       2023-10-02  4384  				#address-cells = <1>;
0c149ca7653286 Luca Weiss                       2023-10-02  4385  				#size-cells = <0>;
0c149ca7653286 Luca Weiss                       2023-10-02  4386  			};
0c149ca7653286 Luca Weiss                       2023-10-02  4387  		};
0c149ca7653286 Luca Weiss                       2023-10-02  4388  
0c149ca7653286 Luca Weiss                       2023-10-02  4389  		cci1: cci@ac4b000 {
0c149ca7653286 Luca Weiss                       2023-10-02  4390  			compatible = "qcom,sc7280-cci", "qcom,msm8996-cci";
0c149ca7653286 Luca Weiss                       2023-10-02  4391  			reg = <0 0x0ac4b000 0 0x1000>;
0c149ca7653286 Luca Weiss                       2023-10-02  4392  			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
0c149ca7653286 Luca Weiss                       2023-10-02  4393  			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
0c149ca7653286 Luca Weiss                       2023-10-02  4394  
0c149ca7653286 Luca Weiss                       2023-10-02  4395  			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
0c149ca7653286 Luca Weiss                       2023-10-02  4396  				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
0c149ca7653286 Luca Weiss                       2023-10-02  4397  				 <&camcc CAM_CC_CPAS_AHB_CLK>,
0c149ca7653286 Luca Weiss                       2023-10-02  4398  				 <&camcc CAM_CC_CCI_1_CLK>,
0c149ca7653286 Luca Weiss                       2023-10-02  4399  				 <&camcc CAM_CC_CCI_1_CLK_SRC>;
0c149ca7653286 Luca Weiss                       2023-10-02  4400  			clock-names = "camnoc_axi",
0c149ca7653286 Luca Weiss                       2023-10-02  4401  				      "slow_ahb_src",
0c149ca7653286 Luca Weiss                       2023-10-02  4402  				      "cpas_ahb",
0c149ca7653286 Luca Weiss                       2023-10-02  4403  				      "cci",
0c149ca7653286 Luca Weiss                       2023-10-02  4404  				      "cci_src";
0c149ca7653286 Luca Weiss                       2023-10-02  4405  			pinctrl-0 = <&cci2_default &cci3_default>;
0c149ca7653286 Luca Weiss                       2023-10-02  4406  			pinctrl-1 = <&cci2_sleep &cci3_sleep>;
0c149ca7653286 Luca Weiss                       2023-10-02  4407  			pinctrl-names = "default", "sleep";
0c149ca7653286 Luca Weiss                       2023-10-02  4408  
0c149ca7653286 Luca Weiss                       2023-10-02  4409  			#address-cells = <1>;
0c149ca7653286 Luca Weiss                       2023-10-02  4410  			#size-cells = <0>;
0c149ca7653286 Luca Weiss                       2023-10-02  4411  
0c149ca7653286 Luca Weiss                       2023-10-02  4412  			status = "disabled";
0c149ca7653286 Luca Weiss                       2023-10-02  4413  
0c149ca7653286 Luca Weiss                       2023-10-02  4414  			cci1_i2c0: i2c-bus@0 {
0c149ca7653286 Luca Weiss                       2023-10-02  4415  				reg = <0>;
0c149ca7653286 Luca Weiss                       2023-10-02  4416  				clock-frequency = <1000000>;
0c149ca7653286 Luca Weiss                       2023-10-02  4417  				#address-cells = <1>;
0c149ca7653286 Luca Weiss                       2023-10-02  4418  				#size-cells = <0>;
0c149ca7653286 Luca Weiss                       2023-10-02  4419  			};
0c149ca7653286 Luca Weiss                       2023-10-02  4420  
0c149ca7653286 Luca Weiss                       2023-10-02  4421  			cci1_i2c1: i2c-bus@1 {
0c149ca7653286 Luca Weiss                       2023-10-02  4422  				reg = <1>;
0c149ca7653286 Luca Weiss                       2023-10-02  4423  				clock-frequency = <1000000>;
0c149ca7653286 Luca Weiss                       2023-10-02  4424  				#address-cells = <1>;
0c149ca7653286 Luca Weiss                       2023-10-02  4425  				#size-cells = <0>;
0c149ca7653286 Luca Weiss                       2023-10-02  4426  			};
0c149ca7653286 Luca Weiss                       2023-10-02  4427  		};
0c149ca7653286 Luca Weiss                       2023-10-02  4428  
b1f28f6cc511c6 Vikram Sharma                    2024-11-12 @4429  		camss: camss@acaf000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
