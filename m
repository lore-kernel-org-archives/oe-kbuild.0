Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430E71B85F0
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Sep 2024 14:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727189197; cv=none; b=Chf+s+x294RhD+YNEAP2vDQS+MGm03Rq3qaMcqy+CgZtk9mvZTixVbJbVbwxPFN9XxmT4M90vUuUUiX72dwFeGhzUvGjHBbRWEIQxmw/FI6JwXdDar5w0RCJcz3f+bilIrT7uDusMUpb9ZYAF0sIqv4rny1blKRyD9z6OjEcneE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727189197; c=relaxed/simple;
	bh=ks3tEJ0LWPB+PyRvX1AB8SRBrWQAMwVA9OBBtYcycA4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hMtSpoHPvcZSwfbxF782dMdp5jVrnC0AnFhUiq7tIuXdKxXECz14XCnlqMU7Ec6KQ54JDJIQuaGFpZfyglJd5TSEMl9DFkV9DoUffFrE55625O1iCIL6Q5obYl3wnr+0q6dMR9ZqY+IC/sdu1AWxt9zI5SNjsxCDjEg0+9voyAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EjYOj93/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EjYOj93/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727189186; x=1758725186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ks3tEJ0LWPB+PyRvX1AB8SRBrWQAMwVA9OBBtYcycA4=;
  b=EjYOj93/ztFV8pk6IIXT/mABhRnfqxvQ2k84OkzlVy7KXVUzUE5p0WYr
   GcnwJm+h78NowH+W8gt+XVCa1fFbyf48rcmfhfJnHL3sIwCtHPQk+LdQr
   NLBImXQBnXCjDuvW7m4kchGdKcr8tOJCCRz09tiSOdMKV+ty0HjglQGM4
   IjC+J5M5/nYAXvoe6Q3qnTkoyOGL1pRQh69xMtAvdq37PSQkZhkcqVM/9
   +5aq1ZiI66uN8lXk4RmWhybfa5uKkWdivkptEyOkCLBgCYG8wG1qqFZ5W
   xHyRMetOq+e2a5OoDn+JHxeuNRyhHjakoAaZo+6znA8tm2r3fC6SWGETv
   A==;
X-CSE-ConnectionGUID: 3sK0T/aQS1CH8NXtSaVZ6Q==
X-CSE-MsgGUID: LoSEXdm7RoCrCQS/yBl0aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="37324615"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="37324615"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 07:46:25 -0700
X-CSE-ConnectionGUID: KCKSAfibRTyb9Z9J2MrQuQ==
X-CSE-MsgGUID: pjeqz0G3ToavqnC357evUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="71524844"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Sep 2024 07:46:22 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st6o0-000ISj-0j;
	Tue, 24 Sep 2024 14:46:20 +0000
Date: Tue, 24 Sep 2024 22:46:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc7280: Add cpucp mbox node
Message-ID: <202409242219.KbmWdSZ1-lkp@intel.com>
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
In-Reply-To: <20240924050941.1251485-4-quic_kshivnan@quicinc.com>
References: <20240924050941.1251485-4-quic_kshivnan@quicinc.com>
TO: Shivnandan Kumar <quic_kshivnan@quicinc.com>
TO: Sibi Sankar <quic_sibis@quicinc.com>
TO: Jassi Brar <jassisinghbrar@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: cros-qcom-dts-watchers@chromium.org
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
CC: Shivnandan Kumar <quic_kshivnan@quicinc.com>

Hi Shivnandan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.11 next-20240924]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shivnandan-Kumar/dt-bindings-mailbox-qcom-cpucp-mbox-Add-sc7280-cpucp-mailbox-instance/20240924-133657
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240924050941.1251485-4-quic_kshivnan%40quicinc.com
patch subject: [PATCH 3/3] arm64: dts: qcom: sc7280: Add cpucp mbox node
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arm64-randconfig-001-20240924 (https://download.01.org/0day-ci/archive/20240924/202409242219.KbmWdSZ1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409242219.KbmWdSZ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409242219.KbmWdSZ1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sc7280.dtsi:4012.32-4018.5: Warning (simple_bus_reg): /soc@0/mailbox@17430000: simple-bus unit address format error, expected "18590000"
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4583.26-4654.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:152.29-155.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4036.10-4046.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sc7280.dtsi:4012.32-4018.5: Warning (simple_bus_reg): /soc@0/mailbox@17430000: simple-bus unit address format error, expected "18590000"
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4583.26-4654.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4036.10-4046.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sc7280.dtsi:4012.32-4018.5: Warning (simple_bus_reg): /soc@0/mailbox@17430000: simple-bus unit address format error, expected "18590000"
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4583.26-4654.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4036.10-4046.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/sc7280.dtsi:4012.32-4018.5: Warning (simple_bus_reg): /soc@0/mailbox@17430000: simple-bus unit address format error, expected "18590000"
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4036.10-4046.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +/18590000 +4012 arch/arm64/boot/dts/qcom/sc7280.dtsi

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
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   196  		CPU0: cpu@0 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   197  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   198  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   199  			reg = <0x0 0x0>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   200  			clocks = <&cpufreq_hw 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   201  			enable-method = "psci";
7925ca85e95619 Maulik Shah                      2023-07-03   202  			power-domains = <&CPU_PD0>;
7925ca85e95619 Maulik Shah                      2023-07-03   203  			power-domain-names = "psci";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   204  			next-level-cache = <&L2_0>;
1e8853c698276d Sibi Sankar                      2022-02-09   205  			operating-points-v2 = <&cpu0_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   206  			capacity-dmips-mhz = <1024>;
942bf463dec369 Ankit Sharma                     2023-11-03   207  			dynamic-power-coefficient = <100>;
1e8853c698276d Sibi Sankar                      2022-02-09   208  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   209  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   210  			qcom,freq-domain = <&cpufreq_hw 0>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   211  			#cooling-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   212  			L2_0: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   213  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   214  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   215  				cache-unified;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   216  				next-level-cache = <&L3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   217  				L3_0: l3-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   218  					compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   219  					cache-level = <3>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   220  					cache-unified;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   221  				};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   222  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   223  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   224  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   225  		CPU1: cpu@100 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   226  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   227  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   228  			reg = <0x0 0x100>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   229  			clocks = <&cpufreq_hw 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   230  			enable-method = "psci";
7925ca85e95619 Maulik Shah                      2023-07-03   231  			power-domains = <&CPU_PD1>;
7925ca85e95619 Maulik Shah                      2023-07-03   232  			power-domain-names = "psci";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   233  			next-level-cache = <&L2_100>;
1e8853c698276d Sibi Sankar                      2022-02-09   234  			operating-points-v2 = <&cpu0_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   235  			capacity-dmips-mhz = <1024>;
942bf463dec369 Ankit Sharma                     2023-11-03   236  			dynamic-power-coefficient = <100>;
1e8853c698276d Sibi Sankar                      2022-02-09   237  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   238  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   239  			qcom,freq-domain = <&cpufreq_hw 0>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   240  			#cooling-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   241  			L2_100: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   242  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   243  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   244  				cache-unified;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   245  				next-level-cache = <&L3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   246  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   247  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   248  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   249  		CPU2: cpu@200 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   250  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   251  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   252  			reg = <0x0 0x200>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   253  			clocks = <&cpufreq_hw 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   254  			enable-method = "psci";
7925ca85e95619 Maulik Shah                      2023-07-03   255  			power-domains = <&CPU_PD2>;
7925ca85e95619 Maulik Shah                      2023-07-03   256  			power-domain-names = "psci";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   257  			next-level-cache = <&L2_200>;
1e8853c698276d Sibi Sankar                      2022-02-09   258  			operating-points-v2 = <&cpu0_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   259  			capacity-dmips-mhz = <1024>;
942bf463dec369 Ankit Sharma                     2023-11-03   260  			dynamic-power-coefficient = <100>;
1e8853c698276d Sibi Sankar                      2022-02-09   261  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   262  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   263  			qcom,freq-domain = <&cpufreq_hw 0>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   264  			#cooling-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   265  			L2_200: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   266  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   267  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   268  				cache-unified;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   269  				next-level-cache = <&L3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   270  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   271  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   272  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   273  		CPU3: cpu@300 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   274  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   275  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   276  			reg = <0x0 0x300>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   277  			clocks = <&cpufreq_hw 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   278  			enable-method = "psci";
7925ca85e95619 Maulik Shah                      2023-07-03   279  			power-domains = <&CPU_PD3>;
7925ca85e95619 Maulik Shah                      2023-07-03   280  			power-domain-names = "psci";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   281  			next-level-cache = <&L2_300>;
1e8853c698276d Sibi Sankar                      2022-02-09   282  			operating-points-v2 = <&cpu0_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   283  			capacity-dmips-mhz = <1024>;
942bf463dec369 Ankit Sharma                     2023-11-03   284  			dynamic-power-coefficient = <100>;
1e8853c698276d Sibi Sankar                      2022-02-09   285  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   286  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   287  			qcom,freq-domain = <&cpufreq_hw 0>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   288  			#cooling-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   289  			L2_300: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   290  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   291  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   292  				cache-unified;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   293  				next-level-cache = <&L3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   294  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   295  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   296  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   297  		CPU4: cpu@400 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   298  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   299  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   300  			reg = <0x0 0x400>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   301  			clocks = <&cpufreq_hw 1>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   302  			enable-method = "psci";
7925ca85e95619 Maulik Shah                      2023-07-03   303  			power-domains = <&CPU_PD4>;
7925ca85e95619 Maulik Shah                      2023-07-03   304  			power-domain-names = "psci";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   305  			next-level-cache = <&L2_400>;
1e8853c698276d Sibi Sankar                      2022-02-09   306  			operating-points-v2 = <&cpu4_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   307  			capacity-dmips-mhz = <1946>;
942bf463dec369 Ankit Sharma                     2023-11-03   308  			dynamic-power-coefficient = <520>;
1e8853c698276d Sibi Sankar                      2022-02-09   309  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   310  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   311  			qcom,freq-domain = <&cpufreq_hw 1>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   312  			#cooling-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   313  			L2_400: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   314  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   315  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   316  				cache-unified;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   317  				next-level-cache = <&L3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   318  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   319  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   320  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   321  		CPU5: cpu@500 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   322  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   323  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   324  			reg = <0x0 0x500>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   325  			clocks = <&cpufreq_hw 1>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   326  			enable-method = "psci";
7925ca85e95619 Maulik Shah                      2023-07-03   327  			power-domains = <&CPU_PD5>;
7925ca85e95619 Maulik Shah                      2023-07-03   328  			power-domain-names = "psci";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   329  			next-level-cache = <&L2_500>;
1e8853c698276d Sibi Sankar                      2022-02-09   330  			operating-points-v2 = <&cpu4_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   331  			capacity-dmips-mhz = <1946>;
942bf463dec369 Ankit Sharma                     2023-11-03   332  			dynamic-power-coefficient = <520>;
1e8853c698276d Sibi Sankar                      2022-02-09   333  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   334  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   335  			qcom,freq-domain = <&cpufreq_hw 1>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   336  			#cooling-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   337  			L2_500: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   338  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   339  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   340  				cache-unified;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   341  				next-level-cache = <&L3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   342  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   343  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   344  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   345  		CPU6: cpu@600 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   346  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   347  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   348  			reg = <0x0 0x600>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   349  			clocks = <&cpufreq_hw 1>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   350  			enable-method = "psci";
7925ca85e95619 Maulik Shah                      2023-07-03   351  			power-domains = <&CPU_PD6>;
7925ca85e95619 Maulik Shah                      2023-07-03   352  			power-domain-names = "psci";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   353  			next-level-cache = <&L2_600>;
1e8853c698276d Sibi Sankar                      2022-02-09   354  			operating-points-v2 = <&cpu4_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   355  			capacity-dmips-mhz = <1946>;
942bf463dec369 Ankit Sharma                     2023-11-03   356  			dynamic-power-coefficient = <520>;
1e8853c698276d Sibi Sankar                      2022-02-09   357  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   358  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   359  			qcom,freq-domain = <&cpufreq_hw 1>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   360  			#cooling-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   361  			L2_600: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   362  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   363  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   364  				cache-unified;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   365  				next-level-cache = <&L3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   366  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   367  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   368  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   369  		CPU7: cpu@700 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   370  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   371  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   372  			reg = <0x0 0x700>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   373  			clocks = <&cpufreq_hw 2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   374  			enable-method = "psci";
7925ca85e95619 Maulik Shah                      2023-07-03   375  			power-domains = <&CPU_PD7>;
7925ca85e95619 Maulik Shah                      2023-07-03   376  			power-domain-names = "psci";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   377  			next-level-cache = <&L2_700>;
1e8853c698276d Sibi Sankar                      2022-02-09   378  			operating-points-v2 = <&cpu7_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   379  			capacity-dmips-mhz = <1985>;
942bf463dec369 Ankit Sharma                     2023-11-03   380  			dynamic-power-coefficient = <552>;
1e8853c698276d Sibi Sankar                      2022-02-09   381  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   382  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
4cbb02fa76de4b Sibi Sankar                      2021-07-20   383  			qcom,freq-domain = <&cpufreq_hw 2>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   384  			#cooling-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   385  			L2_700: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   386  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   387  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   388  				cache-unified;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   389  				next-level-cache = <&L3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   390  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   391  		};
0ef5463c7a5648 Maulik Shah                      2021-03-11   392  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   393  		cpu-map {
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   394  			cluster0 {
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   395  				core0 {
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   396  					cpu = <&CPU0>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   397  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   398  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   399  				core1 {
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   400  					cpu = <&CPU1>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   401  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   402  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   403  				core2 {
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   404  					cpu = <&CPU2>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   405  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   406  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   407  				core3 {
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   408  					cpu = <&CPU3>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   409  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   410  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   411  				core4 {
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   412  					cpu = <&CPU4>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   413  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   414  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   415  				core5 {
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   416  					cpu = <&CPU5>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   417  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   418  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   419  				core6 {
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   420  					cpu = <&CPU6>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   421  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   422  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   423  				core7 {
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   424  					cpu = <&CPU7>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   425  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   426  			};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   427  		};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   428  
0ef5463c7a5648 Maulik Shah                      2021-03-11   429  		idle-states {
0ef5463c7a5648 Maulik Shah                      2021-03-11   430  			entry-method = "psci";
0ef5463c7a5648 Maulik Shah                      2021-03-11   431  
0ef5463c7a5648 Maulik Shah                      2021-03-11   432  			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
0ef5463c7a5648 Maulik Shah                      2021-03-11   433  				compatible = "arm,idle-state";
0ef5463c7a5648 Maulik Shah                      2021-03-11   434  				idle-state-name = "little-power-down";
0ef5463c7a5648 Maulik Shah                      2021-03-11   435  				arm,psci-suspend-param = <0x40000003>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   436  				entry-latency-us = <549>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   437  				exit-latency-us = <901>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   438  				min-residency-us = <1774>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   439  				local-timer-stop;
0ef5463c7a5648 Maulik Shah                      2021-03-11   440  			};
0ef5463c7a5648 Maulik Shah                      2021-03-11   441  
0ef5463c7a5648 Maulik Shah                      2021-03-11   442  			LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
0ef5463c7a5648 Maulik Shah                      2021-03-11   443  				compatible = "arm,idle-state";
0ef5463c7a5648 Maulik Shah                      2021-03-11   444  				idle-state-name = "little-rail-power-down";
0ef5463c7a5648 Maulik Shah                      2021-03-11   445  				arm,psci-suspend-param = <0x40000004>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   446  				entry-latency-us = <702>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   447  				exit-latency-us = <915>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   448  				min-residency-us = <4001>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   449  				local-timer-stop;
0ef5463c7a5648 Maulik Shah                      2021-03-11   450  			};
0ef5463c7a5648 Maulik Shah                      2021-03-11   451  
0ef5463c7a5648 Maulik Shah                      2021-03-11   452  			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
0ef5463c7a5648 Maulik Shah                      2021-03-11   453  				compatible = "arm,idle-state";
0ef5463c7a5648 Maulik Shah                      2021-03-11   454  				idle-state-name = "big-power-down";
0ef5463c7a5648 Maulik Shah                      2021-03-11   455  				arm,psci-suspend-param = <0x40000003>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   456  				entry-latency-us = <523>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   457  				exit-latency-us = <1244>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   458  				min-residency-us = <2207>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   459  				local-timer-stop;
0ef5463c7a5648 Maulik Shah                      2021-03-11   460  			};
0ef5463c7a5648 Maulik Shah                      2021-03-11   461  
0ef5463c7a5648 Maulik Shah                      2021-03-11   462  			BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
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
db5d137e81bcce Maulik Shah                      2024-01-09   474  			CLUSTER_SLEEP_APSS_OFF: cluster-sleep-0 {
7925ca85e95619 Maulik Shah                      2023-07-03   475  				compatible = "domain-idle-state";
db5d137e81bcce Maulik Shah                      2024-01-09   476  				arm,psci-suspend-param = <0x41000044>;
db5d137e81bcce Maulik Shah                      2024-01-09   477  				entry-latency-us = <2752>;
db5d137e81bcce Maulik Shah                      2024-01-09   478  				exit-latency-us = <3048>;
db5d137e81bcce Maulik Shah                      2024-01-09   479  				min-residency-us = <6118>;
db5d137e81bcce Maulik Shah                      2024-01-09   480  			};
db5d137e81bcce Maulik Shah                      2024-01-09   481  
db5d137e81bcce Maulik Shah                      2024-01-09   482  			CLUSTER_SLEEP_CX_RET: cluster-sleep-1 {
db5d137e81bcce Maulik Shah                      2024-01-09   483  				compatible = "domain-idle-state";
db5d137e81bcce Maulik Shah                      2024-01-09   484  				arm,psci-suspend-param = <0x41001344>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   485  				entry-latency-us = <3263>;
db5d137e81bcce Maulik Shah                      2024-01-09   486  				exit-latency-us = <4562>;
db5d137e81bcce Maulik Shah                      2024-01-09   487  				min-residency-us = <8467>;
db5d137e81bcce Maulik Shah                      2024-01-09   488  			};
db5d137e81bcce Maulik Shah                      2024-01-09   489  
db5d137e81bcce Maulik Shah                      2024-01-09   490  			CLUSTER_SLEEP_LLCC_OFF: cluster-sleep-2 {
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
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   848  	pmu {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   849  		compatible = "arm,armv8-pmuv3";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   850  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   851  	};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   852  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   853  	psci {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   854  		compatible = "arm,psci-1.0";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   855  		method = "smc";
7925ca85e95619 Maulik Shah                      2023-07-03   856  
7925ca85e95619 Maulik Shah                      2023-07-03   857  		CPU_PD0: power-domain-cpu0 {
7925ca85e95619 Maulik Shah                      2023-07-03   858  			#power-domain-cells = <0>;
7925ca85e95619 Maulik Shah                      2023-07-03   859  			power-domains = <&CLUSTER_PD>;
7925ca85e95619 Maulik Shah                      2023-07-03   860  			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   861  		};
7925ca85e95619 Maulik Shah                      2023-07-03   862  
7925ca85e95619 Maulik Shah                      2023-07-03   863  		CPU_PD1: power-domain-cpu1 {
7925ca85e95619 Maulik Shah                      2023-07-03   864  			#power-domain-cells = <0>;
7925ca85e95619 Maulik Shah                      2023-07-03   865  			power-domains = <&CLUSTER_PD>;
7925ca85e95619 Maulik Shah                      2023-07-03   866  			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   867  		};
7925ca85e95619 Maulik Shah                      2023-07-03   868  
7925ca85e95619 Maulik Shah                      2023-07-03   869  		CPU_PD2: power-domain-cpu2 {
7925ca85e95619 Maulik Shah                      2023-07-03   870  			#power-domain-cells = <0>;
7925ca85e95619 Maulik Shah                      2023-07-03   871  			power-domains = <&CLUSTER_PD>;
7925ca85e95619 Maulik Shah                      2023-07-03   872  			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   873  		};
7925ca85e95619 Maulik Shah                      2023-07-03   874  
7925ca85e95619 Maulik Shah                      2023-07-03   875  		CPU_PD3: power-domain-cpu3 {
7925ca85e95619 Maulik Shah                      2023-07-03   876  			#power-domain-cells = <0>;
7925ca85e95619 Maulik Shah                      2023-07-03   877  			power-domains = <&CLUSTER_PD>;
7925ca85e95619 Maulik Shah                      2023-07-03   878  			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   879  		};
7925ca85e95619 Maulik Shah                      2023-07-03   880  
7925ca85e95619 Maulik Shah                      2023-07-03   881  		CPU_PD4: power-domain-cpu4 {
7925ca85e95619 Maulik Shah                      2023-07-03   882  			#power-domain-cells = <0>;
7925ca85e95619 Maulik Shah                      2023-07-03   883  			power-domains = <&CLUSTER_PD>;
7925ca85e95619 Maulik Shah                      2023-07-03   884  			domain-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   885  		};
7925ca85e95619 Maulik Shah                      2023-07-03   886  
7925ca85e95619 Maulik Shah                      2023-07-03   887  		CPU_PD5: power-domain-cpu5 {
7925ca85e95619 Maulik Shah                      2023-07-03   888  			#power-domain-cells = <0>;
7925ca85e95619 Maulik Shah                      2023-07-03   889  			power-domains = <&CLUSTER_PD>;
7925ca85e95619 Maulik Shah                      2023-07-03   890  			domain-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   891  		};
7925ca85e95619 Maulik Shah                      2023-07-03   892  
7925ca85e95619 Maulik Shah                      2023-07-03   893  		CPU_PD6: power-domain-cpu6 {
7925ca85e95619 Maulik Shah                      2023-07-03   894  			#power-domain-cells = <0>;
7925ca85e95619 Maulik Shah                      2023-07-03   895  			power-domains = <&CLUSTER_PD>;
7925ca85e95619 Maulik Shah                      2023-07-03   896  			domain-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   897  		};
7925ca85e95619 Maulik Shah                      2023-07-03   898  
7925ca85e95619 Maulik Shah                      2023-07-03   899  		CPU_PD7: power-domain-cpu7 {
7925ca85e95619 Maulik Shah                      2023-07-03   900  			#power-domain-cells = <0>;
7925ca85e95619 Maulik Shah                      2023-07-03   901  			power-domains = <&CLUSTER_PD>;
7925ca85e95619 Maulik Shah                      2023-07-03   902  			domain-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   903  		};
7925ca85e95619 Maulik Shah                      2023-07-03   904  
7925ca85e95619 Maulik Shah                      2023-07-03   905  		CLUSTER_PD: power-domain-cluster {
7925ca85e95619 Maulik Shah                      2023-07-03   906  			#power-domain-cells = <0>;
db5d137e81bcce Maulik Shah                      2024-01-09   907  			domain-idle-states = <&CLUSTER_SLEEP_APSS_OFF &CLUSTER_SLEEP_CX_RET &CLUSTER_SLEEP_LLCC_OFF>;
7925ca85e95619 Maulik Shah                      2023-07-03   908  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   909  	};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   910  
0e3e654696074b Krzysztof Kozlowski              2022-06-27   911  	qspi_opp_table: opp-table-qspi {
7720ea001b528d Roja Rani Yarubandi              2021-09-23   912  		compatible = "operating-points-v2";
7720ea001b528d Roja Rani Yarubandi              2021-09-23   913  
7720ea001b528d Roja Rani Yarubandi              2021-09-23   914  		opp-75000000 {
7720ea001b528d Roja Rani Yarubandi              2021-09-23   915  			opp-hz = /bits/ 64 <75000000>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23   916  			required-opps = <&rpmhpd_opp_low_svs>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23   917  		};
7720ea001b528d Roja Rani Yarubandi              2021-09-23   918  
7720ea001b528d Roja Rani Yarubandi              2021-09-23   919  		opp-150000000 {
7720ea001b528d Roja Rani Yarubandi              2021-09-23   920  			opp-hz = /bits/ 64 <150000000>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23   921  			required-opps = <&rpmhpd_opp_svs>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23   922  		};
7720ea001b528d Roja Rani Yarubandi              2021-09-23   923  
6ea15b5065e554 Rajesh Patil                     2021-09-29   924  		opp-200000000 {
6ea15b5065e554 Rajesh Patil                     2021-09-29   925  			opp-hz = /bits/ 64 <200000000>;
6ea15b5065e554 Rajesh Patil                     2021-09-29   926  			required-opps = <&rpmhpd_opp_svs_l1>;
6ea15b5065e554 Rajesh Patil                     2021-09-29   927  		};
6ea15b5065e554 Rajesh Patil                     2021-09-29   928  
7720ea001b528d Roja Rani Yarubandi              2021-09-23   929  		opp-300000000 {
7720ea001b528d Roja Rani Yarubandi              2021-09-23   930  			opp-hz = /bits/ 64 <300000000>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23   931  			required-opps = <&rpmhpd_opp_nom>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23   932  		};
7720ea001b528d Roja Rani Yarubandi              2021-09-23   933  	};
7720ea001b528d Roja Rani Yarubandi              2021-09-23   934  
0e3e654696074b Krzysztof Kozlowski              2022-06-27   935  	qup_opp_table: opp-table-qup {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   936  		compatible = "operating-points-v2";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   937  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   938  		opp-75000000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   939  			opp-hz = /bits/ 64 <75000000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   940  			required-opps = <&rpmhpd_opp_low_svs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   941  		};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   942  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   943  		opp-100000000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   944  			opp-hz = /bits/ 64 <100000000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   945  			required-opps = <&rpmhpd_opp_svs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   946  		};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   947  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   948  		opp-128000000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   949  			opp-hz = /bits/ 64 <128000000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   950  			required-opps = <&rpmhpd_opp_nom>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   951  		};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   952  	};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   953  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   954  	soc: soc@0 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   955  		#address-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   956  		#size-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   957  		ranges = <0 0 0 0 0x10 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   958  		dma-ranges = <0 0 0 0 0x10 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   959  		compatible = "simple-bus";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   960  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   961  		gcc: clock-controller@100000 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   962  			compatible = "qcom,gcc-sc7280";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   963  			reg = <0 0x00100000 0 0x1f0000>;
ab7772de861200 Rajendra Nayak                   2021-03-11   964  			clocks = <&rpmhcc RPMH_CXO_CLK>,
ab7772de861200 Rajendra Nayak                   2021-03-11   965  				 <&rpmhcc RPMH_CXO_CLK_A>, <&sleep_clk>,
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20   966  				 <0>, <&pcie1_phy>,
c8a074789d71c1 Nitin Rawat                      2023-12-05   967  				 <&ufs_mem_phy 0>, <&ufs_mem_phy 1>, <&ufs_mem_phy 2>,
36888ed83f998c Dmitry Baryshkov                 2023-07-11   968  				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
ab7772de861200 Rajendra Nayak                   2021-03-11   969  			clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk",
fa09b2248714c6 Prasad Malisetty                 2021-11-16   970  				      "pcie_0_pipe_clk", "pcie_1_pipe_clk",
ab7772de861200 Rajendra Nayak                   2021-03-11   971  				      "ufs_phy_rx_symbol_0_clk", "ufs_phy_rx_symbol_1_clk",
ab7772de861200 Rajendra Nayak                   2021-03-11   972  				      "ufs_phy_tx_symbol_0_clk",
ab7772de861200 Rajendra Nayak                   2021-03-11   973  				      "usb3_phy_wrapper_gcc_usb30_pipe_clk";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   974  			#clock-cells = <1>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   975  			#reset-cells = <1>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   976  			#power-domain-cells = <1>;
3d59187efc982b Rajendra Nayak                   2022-09-16   977  			power-domains = <&rpmhpd SC7280_CX>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   978  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   979  
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   980  		ipcc: mailbox@408000 {
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   981  			compatible = "qcom,sc7280-ipcc", "qcom,ipcc";
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   982  			reg = <0 0x00408000 0 0x1000>;
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   983  			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   984  			interrupt-controller;
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   985  			#interrupt-cells = <3>;
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   986  			#mbox-cells = <2>;
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   987  		};
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   988  
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   989  		qfprom: efuse@784000 {
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   990  			compatible = "qcom,sc7280-qfprom", "qcom,qfprom";
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   991  			reg = <0 0x00784000 0 0xa20>,
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   992  			      <0 0x00780000 0 0xa20>,
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   993  			      <0 0x00782000 0 0x120>,
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   994  			      <0 0x00786000 0 0x1fff>;
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   995  			clocks = <&gcc GCC_SEC_CTRL_CLK_SRC>;
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   996  			clock-names = "core";
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   997  			power-domains = <&rpmhpd SC7280_MX>;
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   998  			#address-cells = <1>;
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   999  			#size-cells = <1>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  1000  
408e1776516149 Krzysztof Kozlowski              2024-02-13  1001  			gpu_speed_bin: gpu-speed-bin@1e9 {
3bfef00d767124 Akhil P Oommen                   2022-02-26  1002  				reg = <0x1e9 0x2>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  1003  				bits = <5 8>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  1004  			};
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1005  		};
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1006  
96bb736f05d156 Bhupesh Sharma                   2022-05-15  1007  		sdhc_1: mmc@7c4000 {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1008  			compatible = "qcom,sc7280-sdhci", "qcom,sdhci-msm-v5";
f9800dde34e678 Douglas Anderson                 2022-02-02  1009  			pinctrl-names = "default", "sleep";
f9800dde34e678 Douglas Anderson                 2022-02-02  1010  			pinctrl-0 = <&sdc1_clk>, <&sdc1_cmd>, <&sdc1_data>, <&sdc1_rclk>;
f9800dde34e678 Douglas Anderson                 2022-02-02  1011  			pinctrl-1 = <&sdc1_clk_sleep>, <&sdc1_cmd_sleep>, <&sdc1_data_sleep>, <&sdc1_rclk_sleep>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1012  			status = "disabled";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1013  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1014  			reg = <0 0x007c4000 0 0x1000>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1015  			      <0 0x007c5000 0 0x1000>;
21857088fa2747 Douglas Anderson                 2022-07-06  1016  			reg-names = "hc", "cqhci";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1017  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1018  			iommus = <&apps_smmu 0xc0 0x0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1019  			interrupts = <GIC_SPI 652 IRQ_TYPE_LEVEL_HIGH>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1020  				     <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1021  			interrupt-names = "hc_irq", "pwr_irq";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1022  
4ff12270dbbe24 Bhupesh Sharma                   2022-05-15  1023  			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
4ff12270dbbe24 Bhupesh Sharma                   2022-05-15  1024  				 <&gcc GCC_SDCC1_APPS_CLK>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1025  				 <&rpmhcc RPMH_CXO_CLK>;
4ff12270dbbe24 Bhupesh Sharma                   2022-05-15  1026  			clock-names = "iface", "core", "xo";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1027  			interconnects = <&aggre1_noc MASTER_SDCC_1 0 &mc_virt SLAVE_EBI1 0>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1028  					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_SDCC_1 0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1029  			interconnect-names = "sdhc-ddr","cpu-sdhc";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1030  			power-domains = <&rpmhpd SC7280_CX>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1031  			operating-points-v2 = <&sdhc1_opp_table>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1032  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1033  			bus-width = <8>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1034  			supports-cqe;
827f5fc8d91220 Konrad Dybcio                    2023-12-18  1035  			dma-coherent;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1036  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1037  			qcom,dll-config = <0x0007642c>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1038  			qcom,ddr-config = <0x80040868>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1039  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1040  			mmc-ddr-1_8v;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1041  			mmc-hs200-1_8v;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1042  			mmc-hs400-1_8v;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1043  			mmc-hs400-enhanced-strobe;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1044  
959cb513074386 Shaik Sajida Bhanu               2022-04-12  1045  			resets = <&gcc GCC_SDCC1_BCR>;
959cb513074386 Shaik Sajida Bhanu               2022-04-12  1046  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1047  			sdhc1_opp_table: opp-table {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1048  				compatible = "operating-points-v2";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1049  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1050  				opp-100000000 {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1051  					opp-hz = /bits/ 64 <100000000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1052  					required-opps = <&rpmhpd_opp_low_svs>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1053  					opp-peak-kBps = <1800000 400000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1054  					opp-avg-kBps = <100000 0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1055  				};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1056  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1057  				opp-384000000 {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1058  					opp-hz = /bits/ 64 <384000000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1059  					required-opps = <&rpmhpd_opp_nom>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1060  					opp-peak-kBps = <5400000 1600000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1061  					opp-avg-kBps = <390000 0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1062  				};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1063  			};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1064  		};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1065  
c11e239f6aee32 Vinod Koul                       2022-04-21  1066  		gpi_dma0: dma-controller@900000 {
c11e239f6aee32 Vinod Koul                       2022-04-21  1067  			#dma-cells = <3>;
e9f2053b7866ac Krzysztof Kozlowski              2022-10-18  1068  			compatible = "qcom,sc7280-gpi-dma", "qcom,sm6350-gpi-dma";
c11e239f6aee32 Vinod Koul                       2022-04-21  1069  			reg = <0 0x00900000 0 0x60000>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1070  			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1071  				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1072  				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1073  				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1074  				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1075  				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1076  				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1077  				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1078  				     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1079  				     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1080  				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1081  				     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1082  			dma-channels = <12>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1083  			dma-channel-mask = <0x7f>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1084  			iommus = <&apps_smmu 0x0136 0x0>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1085  			status = "disabled";
c11e239f6aee32 Vinod Koul                       2022-04-21  1086  		};
c11e239f6aee32 Vinod Koul                       2022-04-21  1087  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1088  		qupv3_id_0: geniqup@9c0000 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1089  			compatible = "qcom,geni-se-qup";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1090  			reg = <0 0x009c0000 0 0x2000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1091  			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1092  				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1093  			clock-names = "m-ahb", "s-ahb";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1094  			#address-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1095  			#size-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1096  			ranges;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1097  			iommus = <&apps_smmu 0x123 0x0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1098  			status = "disabled";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1099  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1100  			i2c0: i2c@980000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1101  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1102  				reg = <0 0x00980000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1103  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1104  				clock-names = "se";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1105  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1106  				pinctrl-0 = <&qup_i2c0_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1107  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1108  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1109  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1110  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1111  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1112  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1113  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1114  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1115  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1116  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1117  				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1118  				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1119  				dma-names = "tx", "rx";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1120  				status = "disabled";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1121  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1122  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1123  			spi0: spi@980000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1124  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1125  				reg = <0 0x00980000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1126  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1127  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1128  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1129  				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1130  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1131  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1132  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1133  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1134  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1135  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1136  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1137  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1138  				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1139  				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1140  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1141  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1142  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1143  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1144  			uart0: serial@980000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1145  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1146  				reg = <0 0x00980000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1147  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1148  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1149  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1150  				pinctrl-0 = <&qup_uart0_cts>, <&qup_uart0_rts>, <&qup_uart0_tx>, <&qup_uart0_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1151  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1152  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1153  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1154  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1155  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1156  				interconnect-names = "qup-core", "qup-config";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1157  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1158  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1159  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1160  			i2c1: i2c@984000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1161  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1162  				reg = <0 0x00984000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1163  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1164  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1165  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1166  				pinctrl-0 = <&qup_i2c1_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1167  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1168  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1169  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1170  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1171  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1172  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1173  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1174  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1175  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1176  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1177  				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1178  				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1179  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1180  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1181  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1182  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1183  			spi1: spi@984000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1184  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1185  				reg = <0 0x00984000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1186  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1187  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1188  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1189  				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1190  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1191  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1192  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1193  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1194  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1195  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1196  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1197  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1198  				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1199  				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1200  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1201  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1202  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1203  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1204  			uart1: serial@984000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1205  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1206  				reg = <0 0x00984000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1207  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1208  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1209  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1210  				pinctrl-0 = <&qup_uart1_cts>, <&qup_uart1_rts>, <&qup_uart1_tx>, <&qup_uart1_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1211  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1212  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1213  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1214  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1215  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1216  				interconnect-names = "qup-core", "qup-config";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1217  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1218  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1219  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1220  			i2c2: i2c@988000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1221  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1222  				reg = <0 0x00988000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1223  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1224  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1225  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1226  				pinctrl-0 = <&qup_i2c2_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1227  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1228  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1229  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1230  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1231  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1232  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1233  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1234  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1235  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1236  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1237  				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1238  				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1239  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1240  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1241  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1242  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1243  			spi2: spi@988000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1244  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1245  				reg = <0 0x00988000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1246  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1247  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1248  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1249  				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1250  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1251  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1252  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1253  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1254  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1255  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1256  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1257  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1258  				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1259  				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1260  				dma-names = "tx", "rx";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1261  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1262  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1263  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1264  			uart2: serial@988000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1265  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1266  				reg = <0 0x00988000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1267  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1268  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1269  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1270  				pinctrl-0 = <&qup_uart2_cts>, <&qup_uart2_rts>, <&qup_uart2_tx>, <&qup_uart2_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1271  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1272  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1273  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1274  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1275  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1276  				interconnect-names = "qup-core", "qup-config";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1277  				status = "disabled";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1278  			};
fc4f0273d4fba2 Alex Elder                       2021-08-04  1279  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1280  			i2c3: i2c@98c000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1281  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1282  				reg = <0 0x0098c000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1283  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1284  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1285  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1286  				pinctrl-0 = <&qup_i2c3_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1287  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1288  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1289  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1290  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1291  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1292  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1293  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1294  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1295  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1296  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1297  				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1298  				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1299  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1300  				status = "disabled";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1301  			};
fc4f0273d4fba2 Alex Elder                       2021-08-04  1302  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1303  			spi3: spi@98c000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1304  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1305  				reg = <0 0x0098c000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1306  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1307  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1308  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1309  				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1310  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1311  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1312  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1313  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1314  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1315  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1316  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1317  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1318  				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1319  				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1320  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1321  				status = "disabled";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1322  			};
fc4f0273d4fba2 Alex Elder                       2021-08-04  1323  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1324  			uart3: serial@98c000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1325  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1326  				reg = <0 0x0098c000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1327  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1328  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1329  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1330  				pinctrl-0 = <&qup_uart3_cts>, <&qup_uart3_rts>, <&qup_uart3_tx>, <&qup_uart3_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1331  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1332  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1333  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1334  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1335  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1336  				interconnect-names = "qup-core", "qup-config";
fc4f0273d4fba2 Alex Elder                       2021-08-04  1337  				status = "disabled";
fc4f0273d4fba2 Alex Elder                       2021-08-04  1338  			};
fc4f0273d4fba2 Alex Elder                       2021-08-04  1339  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1340  			i2c4: i2c@990000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1341  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1342  				reg = <0 0x00990000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1343  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1344  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1345  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1346  				pinctrl-0 = <&qup_i2c4_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1347  				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1348  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1349  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1350  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1351  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1352  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1353  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1354  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1355  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1356  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1357  				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1358  				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1359  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1360  				status = "disabled";
c3bbe55c942d2a Sibi Sankar                      2021-04-27  1361  			};
c3bbe55c942d2a Sibi Sankar                      2021-04-27  1362  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1363  			spi4: spi@990000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1364  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1365  				reg = <0 0x00990000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1366  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1367  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1368  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1369  				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1370  				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1371  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1372  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1373  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1374  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1375  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1376  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1377  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1378  				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1379  				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1380  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1381  				status = "disabled";
422a295221bba8 Taniya Das                       2021-04-10  1382  			};
422a295221bba8 Taniya Das                       2021-04-10  1383  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1384  			uart4: serial@990000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1385  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1386  				reg = <0 0x00990000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1387  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1388  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1389  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1390  				pinctrl-0 = <&qup_uart4_cts>, <&qup_uart4_rts>, <&qup_uart4_tx>, <&qup_uart4_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1391  				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1392  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1393  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1394  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1395  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1396  				interconnect-names = "qup-core", "qup-config";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1397  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1398  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1399  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1400  			i2c5: i2c@994000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1401  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1402  				reg = <0 0x00994000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1403  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1404  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1405  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1406  				pinctrl-0 = <&qup_i2c5_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1407  				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1408  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1409  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1410  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1411  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1412  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1413  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1414  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1415  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1416  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1417  				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1418  				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1419  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1420  				status = "disabled";
422a295221bba8 Taniya Das                       2021-04-10  1421  			};
422a295221bba8 Taniya Das                       2021-04-10  1422  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1423  			spi5: spi@994000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1424  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1425  				reg = <0 0x00994000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1426  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1427  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1428  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1429  				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1430  				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1431  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1432  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1433  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1434  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1435  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1436  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1437  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1438  				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1439  				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1440  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1441  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1442  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1443  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1444  			uart5: serial@994000 {
2b96407b8f10f1 Viken Dadhaniya                  2024-04-24  1445  				compatible = "qcom,geni-debug-uart";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1446  				reg = <0 0x00994000 0 0x4000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1447  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1448  				clock-names = "se";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1449  				pinctrl-names = "default";
2b96407b8f10f1 Viken Dadhaniya                  2024-04-24  1450  				pinctrl-0 = <&qup_uart5_tx>, <&qup_uart5_rx>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1451  				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
38cd93f413fd94 Roja Rani Yarubandi              2021-09-23  1452  				power-domains = <&rpmhpd SC7280_CX>;
38cd93f413fd94 Roja Rani Yarubandi              2021-09-23  1453  				operating-points-v2 = <&qup_opp_table>;
38cd93f413fd94 Roja Rani Yarubandi              2021-09-23  1454  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
38cd93f413fd94 Roja Rani Yarubandi              2021-09-23  1455  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
38cd93f413fd94 Roja Rani Yarubandi              2021-09-23  1456  				interconnect-names = "qup-core", "qup-config";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1457  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1458  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1459  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1460  			i2c6: i2c@998000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1461  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1462  				reg = <0 0x00998000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1463  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1464  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1465  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1466  				pinctrl-0 = <&qup_i2c6_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1467  				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1468  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1469  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1470  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1471  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1472  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1473  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1474  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1475  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1476  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1477  				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1478  				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1479  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1480  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1481  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1482  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1483  			spi6: spi@998000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1484  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1485  				reg = <0 0x00998000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1486  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1487  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1488  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1489  				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1490  				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1491  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1492  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1493  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1494  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1495  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1496  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1497  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1498  				dmas = <&gpi_dma0 0 6 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1499  				       <&gpi_dma0 1 6 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1500  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1501  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1502  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1503  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1504  			uart6: serial@998000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1505  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1506  				reg = <0 0x00998000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1507  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1508  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1509  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1510  				pinctrl-0 = <&qup_uart6_cts>, <&qup_uart6_rts>, <&qup_uart6_tx>, <&qup_uart6_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1511  				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1512  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1513  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1514  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1515  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1516  				interconnect-names = "qup-core", "qup-config";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1517  				status = "disabled";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1518  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1519  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1520  			i2c7: i2c@99c000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1521  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1522  				reg = <0 0x0099c000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1523  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1524  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1525  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1526  				pinctrl-0 = <&qup_i2c7_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1527  				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1528  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1529  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1530  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1531  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1532  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1533  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1534  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1535  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1536  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1537  				dmas = <&gpi_dma0 0 7 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1538  				       <&gpi_dma0 1 7 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1539  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1540  				status = "disabled";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1541  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1542  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1543  			spi7: spi@99c000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1544  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1545  				reg = <0 0x0099c000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1546  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1547  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1548  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1549  				pinctrl-0 = <&qup_spi7_data_clk>, <&qup_spi7_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1550  				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1551  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1552  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1553  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1554  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1555  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1556  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1557  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1558  				dmas = <&gpi_dma0 0 7 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1559  				       <&gpi_dma0 1 7 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1560  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1561  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1562  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1563  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1564  			uart7: serial@99c000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1565  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1566  				reg = <0 0x0099c000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1567  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1568  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1569  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1570  				pinctrl-0 = <&qup_uart7_cts>, <&qup_uart7_rts>, <&qup_uart7_tx>, <&qup_uart7_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1571  				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1572  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1573  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1574  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1575  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1576  				interconnect-names = "qup-core", "qup-config";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1577  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1578  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1579  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1580  
c11e239f6aee32 Vinod Koul                       2022-04-21  1581  		gpi_dma1: dma-controller@a00000 {
c11e239f6aee32 Vinod Koul                       2022-04-21  1582  			#dma-cells = <3>;
e9f2053b7866ac Krzysztof Kozlowski              2022-10-18  1583  			compatible = "qcom,sc7280-gpi-dma", "qcom,sm6350-gpi-dma";
c11e239f6aee32 Vinod Koul                       2022-04-21  1584  			reg = <0 0x00a00000 0 0x60000>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1585  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1586  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1587  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1588  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1589  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1590  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1591  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1592  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1593  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1594  				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1595  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1596  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1597  			dma-channels = <12>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1598  			dma-channel-mask = <0x1e>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1599  			iommus = <&apps_smmu 0x56 0x0>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1600  			status = "disabled";
c11e239f6aee32 Vinod Koul                       2022-04-21  1601  		};
c11e239f6aee32 Vinod Koul                       2022-04-21  1602  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1603  		qupv3_id_1: geniqup@ac0000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1604  			compatible = "qcom,geni-se-qup";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1605  			reg = <0 0x00ac0000 0 0x2000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1606  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1607  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1608  			clock-names = "m-ahb", "s-ahb";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1609  			#address-cells = <2>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1610  			#size-cells = <2>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1611  			ranges;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1612  			iommus = <&apps_smmu 0x43 0x0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1613  			status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1614  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1615  			i2c8: i2c@a80000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1616  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1617  				reg = <0 0x00a80000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1618  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1619  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1620  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1621  				pinctrl-0 = <&qup_i2c8_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1622  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1623  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1624  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1625  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1626  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1627  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1628  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1629  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1630  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1631  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1632  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1633  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1634  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1635  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1636  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1637  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1638  			spi8: spi@a80000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1639  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1640  				reg = <0 0x00a80000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1641  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1642  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1643  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1644  				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1645  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1646  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1647  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1648  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1649  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1650  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1651  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1652  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1653  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1654  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1655  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1656  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1657  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1658  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1659  			uart8: serial@a80000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1660  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1661  				reg = <0 0x00a80000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1662  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1663  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1664  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1665  				pinctrl-0 = <&qup_uart8_cts>, <&qup_uart8_rts>, <&qup_uart8_tx>, <&qup_uart8_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1666  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1667  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1668  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1669  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1670  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1671  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1672  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1673  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1674  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1675  			i2c9: i2c@a84000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1676  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1677  				reg = <0 0x00a84000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1678  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1679  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1680  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1681  				pinctrl-0 = <&qup_i2c9_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1682  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1683  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1684  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1685  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1686  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1687  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1688  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1689  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1690  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1691  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1692  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1693  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1694  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1695  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1696  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1697  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1698  			spi9: spi@a84000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1699  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1700  				reg = <0 0x00a84000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1701  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1702  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1703  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1704  				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1705  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1706  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1707  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1708  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1709  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1710  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1711  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1712  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1713  				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1714  				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1715  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1716  				status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1717  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1718  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1719  			uart9: serial@a84000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1720  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1721  				reg = <0 0x00a84000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1722  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1723  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1724  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1725  				pinctrl-0 = <&qup_uart9_cts>, <&qup_uart9_rts>, <&qup_uart9_tx>, <&qup_uart9_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1726  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1727  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1728  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1729  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1730  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1731  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1732  				status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1733  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1734  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1735  			i2c10: i2c@a88000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1736  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1737  				reg = <0 0x00a88000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1738  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1739  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1740  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1741  				pinctrl-0 = <&qup_i2c10_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1742  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1743  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1744  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1745  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1746  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1747  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1748  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1749  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1750  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1751  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1752  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1753  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1754  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1755  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1756  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1757  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1758  			spi10: spi@a88000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1759  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1760  				reg = <0 0x00a88000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1761  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1762  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1763  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1764  				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1765  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1766  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1767  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1768  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1769  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1770  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1771  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1772  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1773  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1774  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1775  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1776  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1777  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1778  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1779  			uart10: serial@a88000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1780  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1781  				reg = <0 0x00a88000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1782  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1783  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1784  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1785  				pinctrl-0 = <&qup_uart10_cts>, <&qup_uart10_rts>, <&qup_uart10_tx>, <&qup_uart10_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1786  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1787  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1788  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1789  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1790  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1791  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1792  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1793  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1794  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1795  			i2c11: i2c@a8c000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1796  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1797  				reg = <0 0x00a8c000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1798  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1799  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1800  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1801  				pinctrl-0 = <&qup_i2c11_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1802  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1803  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1804  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1805  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1806  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1807  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1808  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1809  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1810  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1811  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1812  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1813  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1814  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1815  				status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1816  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1817  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1818  			spi11: spi@a8c000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1819  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1820  				reg = <0 0x00a8c000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1821  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1822  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1823  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1824  				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1825  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1826  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1827  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1828  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1829  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1830  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1831  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1832  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1833  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1834  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1835  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1836  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1837  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1838  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1839  			uart11: serial@a8c000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1840  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1841  				reg = <0 0x00a8c000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1842  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1843  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1844  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1845  				pinctrl-0 = <&qup_uart11_cts>, <&qup_uart11_rts>, <&qup_uart11_tx>, <&qup_uart11_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1846  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1847  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1848  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1849  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1850  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1851  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1852  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1853  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1854  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1855  			i2c12: i2c@a90000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1856  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1857  				reg = <0 0x00a90000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1858  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1859  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1860  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1861  				pinctrl-0 = <&qup_i2c12_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1862  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1863  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1864  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1865  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1866  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1867  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1868  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1869  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1870  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1871  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1872  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1873  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1874  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1875  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1876  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1877  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1878  			spi12: spi@a90000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1879  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1880  				reg = <0 0x00a90000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1881  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1882  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1883  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1884  				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1885  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1886  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1887  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1888  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1889  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1890  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1891  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1892  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1893  				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1894  				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1895  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1896  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1897  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1898  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1899  			uart12: serial@a90000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1900  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1901  				reg = <0 0x00a90000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1902  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1903  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1904  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1905  				pinctrl-0 = <&qup_uart12_cts>, <&qup_uart12_rts>, <&qup_uart12_tx>, <&qup_uart12_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1906  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1907  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1908  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1909  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1910  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1911  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1912  				status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1913  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1914  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1915  			i2c13: i2c@a94000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1916  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1917  				reg = <0 0x00a94000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1918  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1919  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1920  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1921  				pinctrl-0 = <&qup_i2c13_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1922  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1923  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1924  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1925  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1926  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1927  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1928  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1929  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1930  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1931  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1932  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1933  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1934  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1935  				status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1936  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1937  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1938  			spi13: spi@a94000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1939  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1940  				reg = <0 0x00a94000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1941  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1942  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1943  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1944  				pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1945  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1946  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1947  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1948  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1949  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1950  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1951  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1952  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1953  				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1954  				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1955  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1956  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1957  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1958  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1959  			uart13: serial@a94000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1960  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1961  				reg = <0 0x00a94000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1962  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1963  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1964  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1965  				pinctrl-0 = <&qup_uart13_cts>, <&qup_uart13_rts>, <&qup_uart13_tx>, <&qup_uart13_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1966  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1967  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1968  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1969  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1970  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1971  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1972  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1973  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1974  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1975  			i2c14: i2c@a98000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1976  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1977  				reg = <0 0x00a98000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1978  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1979  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1980  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1981  				pinctrl-0 = <&qup_i2c14_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1982  				interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1983  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1984  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1985  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1986  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1987  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1988  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1989  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1990  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1991  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1992  				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1993  				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1994  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1995  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1996  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1997  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1998  			spi14: spi@a98000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1999  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2000  				reg = <0 0x00a98000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2001  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2002  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2003  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2004  				pinctrl-0 = <&qup_spi14_data_clk>, <&qup_spi14_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2005  				interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2006  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2007  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2008  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2009  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2010  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2011  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2012  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  2013  				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  2014  				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  2015  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2016  				status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2017  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2018  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2019  			uart14: serial@a98000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2020  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2021  				reg = <0 0x00a98000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2022  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2023  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2024  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2025  				pinctrl-0 = <&qup_uart14_cts>, <&qup_uart14_rts>, <&qup_uart14_tx>, <&qup_uart14_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2026  				interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2027  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2028  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2029  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2030  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2031  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2032  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2033  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2034  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2035  			i2c15: i2c@a9c000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2036  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2037  				reg = <0 0x00a9c000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2038  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2039  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2040  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2041  				pinctrl-0 = <&qup_i2c15_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2042  				interrupts = <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2043  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2044  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2045  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2046  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2047  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2048  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2049  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  2050  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  2051  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  2052  				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  2053  				       <&gpi_dma1 1 7 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  2054  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2055  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2056  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2057  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2058  			spi15: spi@a9c000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2059  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2060  				reg = <0 0x00a9c000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2061  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2062  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2063  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2064  				pinctrl-0 = <&qup_spi15_data_clk>, <&qup_spi15_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2065  				interrupts = <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2066  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2067  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2068  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2069  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2070  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2071  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2072  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  2073  				dmas = <&gpi_dma1 0 7 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  2074  				       <&gpi_dma1 1 7 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  2075  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2076  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2077  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2078  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2079  			uart15: serial@a9c000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2080  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2081  				reg = <0 0x00a9c000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2082  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2083  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2084  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2085  				pinctrl-0 = <&qup_uart15_cts>, <&qup_uart15_rts>, <&qup_uart15_tx>, <&qup_uart15_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2086  				interrupts = <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2087  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2088  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2089  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2090  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2091  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2092  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2093  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2094  		};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2095  
d9f33f465114b8 Om Prakash Singh                 2023-10-16  2096  		rng: rng@10d3000 {
d9f33f465114b8 Om Prakash Singh                 2023-10-16  2097  			compatible = "qcom,sc7280-trng", "qcom,trng";
d9f33f465114b8 Om Prakash Singh                 2023-10-16  2098  			reg = <0 0x010d3000 0 0x1000>;
d9f33f465114b8 Om Prakash Singh                 2023-10-16  2099  		};
d9f33f465114b8 Om Prakash Singh                 2023-10-16  2100  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2101  		cnoc2: interconnect@1500000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2102  			reg = <0 0x01500000 0 0x1000>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2103  			compatible = "qcom,sc7280-cnoc2";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2104  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2105  			qcom,bcm-voters = <&apps_bcm_voter>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2106  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2107  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2108  		cnoc3: interconnect@1502000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2109  			reg = <0 0x01502000 0 0x1000>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2110  			compatible = "qcom,sc7280-cnoc3";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2111  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2112  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2113  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2114  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2115  		mc_virt: interconnect@1580000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2116  			reg = <0 0x01580000 0 0x4>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2117  			compatible = "qcom,sc7280-mc-virt";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2118  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2119  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2120  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2121  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2122  		system_noc: interconnect@1680000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2123  			reg = <0 0x01680000 0 0x15480>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2124  			compatible = "qcom,sc7280-system-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2125  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2126  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2127  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  2128  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2129  		aggre1_noc: interconnect@16e0000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2130  			compatible = "qcom,sc7280-aggre1-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2131  			reg = <0 0x016e0000 0 0x1c080>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2132  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2133  			qcom,bcm-voters = <&apps_bcm_voter>;
2b5004956affaa Odelu Kukatla                    2024-06-07  2134  			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
2b5004956affaa Odelu Kukatla                    2024-06-07  2135  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2136  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  2137  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2138  		aggre2_noc: interconnect@1700000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2139  			reg = <0 0x01700000 0 0x2b080>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2140  			compatible = "qcom,sc7280-aggre2-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2141  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2142  			qcom,bcm-voters = <&apps_bcm_voter>;
2b5004956affaa Odelu Kukatla                    2024-06-07  2143  			clocks = <&rpmhcc RPMH_IPA_CLK>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2144  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  2145  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2146  		mmss_noc: interconnect@1740000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2147  			reg = <0 0x01740000 0 0x1e080>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2148  			compatible = "qcom,sc7280-mmss-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2149  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2150  			qcom,bcm-voters = <&apps_bcm_voter>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2151  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2152  
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2153  		wifi: wifi@17a10040 {
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2154  			compatible = "qcom,wcn6750-wifi";
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2155  			reg = <0 0x17a10040 0 0x0>;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2156  			iommus = <&apps_smmu 0x1c00 0x1>;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2157  			interrupts = <GIC_SPI 768 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2158  				     <GIC_SPI 769 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2159  				     <GIC_SPI 770 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2160  				     <GIC_SPI 771 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2161  				     <GIC_SPI 772 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2162  				     <GIC_SPI 773 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2163  				     <GIC_SPI 774 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2164  				     <GIC_SPI 775 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2165  				     <GIC_SPI 776 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2166  				     <GIC_SPI 777 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2167  				     <GIC_SPI 778 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2168  				     <GIC_SPI 779 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2169  				     <GIC_SPI 780 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2170  				     <GIC_SPI 781 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2171  				     <GIC_SPI 782 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2172  				     <GIC_SPI 783 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2173  				     <GIC_SPI 784 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2174  				     <GIC_SPI 785 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2175  				     <GIC_SPI 786 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2176  				     <GIC_SPI 787 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2177  				     <GIC_SPI 788 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2178  				     <GIC_SPI 789 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2179  				     <GIC_SPI 790 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2180  				     <GIC_SPI 791 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2181  				     <GIC_SPI 792 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2182  				     <GIC_SPI 793 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2183  				     <GIC_SPI 794 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2184  				     <GIC_SPI 795 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2185  				     <GIC_SPI 796 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2186  				     <GIC_SPI 797 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2187  				     <GIC_SPI 798 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2188  				     <GIC_SPI 799 IRQ_TYPE_EDGE_RISING>;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2189  			qcom,rproc = <&remoteproc_wpss>;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2190  			memory-region = <&wlan_fw_mem>, <&wlan_ce_mem>;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2191  			status = "disabled";
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17  2192  			qcom,smem-states = <&wlan_smp2p_out 0>;
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17  2193  			qcom,smem-state-names = "wlan-smp2p-out";
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2194  		};
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2195  
052c9a1f1400f1 Manivannan Sadhasivam            2023-12-06  2196  		pcie1: pcie@1c08000 {
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2197  			compatible = "qcom,pcie-sc7280";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2198  			reg = <0 0x01c08000 0 0x3000>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2199  			      <0 0x40000000 0 0xf1d>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2200  			      <0 0x40000f20 0 0xa8>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2201  			      <0 0x40001000 0 0x1000>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2202  			      <0 0x40100000 0 0x100000>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2203  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2204  			reg-names = "parf", "dbi", "elbi", "atu", "config";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2205  			device_type = "pci";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2206  			linux,pci-domain = <1>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2207  			bus-range = <0x00 0xff>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2208  			num-lanes = <2>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2209  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2210  			#address-cells = <3>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2211  			#size-cells = <2>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2212  
1d4743d6312582 Manivannan Sadhasivam            2023-02-28  2213  			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2214  				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2215  
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2216  			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2217  				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2218  				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2219  				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2220  				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2221  				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2222  				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2223  				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2224  			interrupt-names = "msi0", "msi1", "msi2", "msi3",
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2225  					  "msi4", "msi5", "msi6", "msi7";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2226  			#interrupt-cells = <1>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2227  			interrupt-map-mask = <0 0 0 0x7>;
66b788133030f0 Prasad Malisetty                 2021-11-16  2228  			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>,
66b788133030f0 Prasad Malisetty                 2021-11-16  2229  					<0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>,
66b788133030f0 Prasad Malisetty                 2021-11-16  2230  					<0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH>,
66b788133030f0 Prasad Malisetty                 2021-11-16  2231  					<0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2232  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2233  			clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2234  				 <&gcc GCC_PCIE_1_PIPE_CLK_SRC>,
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2235  				 <&pcie1_phy>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2236  				 <&rpmhcc RPMH_CXO_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2237  				 <&gcc GCC_PCIE_1_AUX_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2238  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2239  				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2240  				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2241  				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2242  				 <&gcc GCC_AGGRE_NOC_PCIE_TBU_CLK>,
aaf85b46aa4145 Krishna chaitanya chundru        2022-09-08  2243  				 <&gcc GCC_DDRSS_PCIE_SF_CLK>,
aaf85b46aa4145 Krishna chaitanya chundru        2022-09-08  2244  				 <&gcc GCC_AGGRE_NOC_PCIE_CENTER_SF_AXI_CLK>,
aaf85b46aa4145 Krishna chaitanya chundru        2022-09-08  2245  				 <&gcc GCC_AGGRE_NOC_PCIE_1_AXI_CLK>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2246  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2247  			clock-names = "pipe",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2248  				      "pipe_mux",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2249  				      "phy_pipe",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2250  				      "ref",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2251  				      "aux",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2252  				      "cfg",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2253  				      "bus_master",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2254  				      "bus_slave",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2255  				      "slave_q2a",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2256  				      "tbu",
aaf85b46aa4145 Krishna chaitanya chundru        2022-09-08  2257  				      "ddrss_sf_tbu",
aaf85b46aa4145 Krishna chaitanya chundru        2022-09-08  2258  				      "aggre0",
aaf85b46aa4145 Krishna chaitanya chundru        2022-09-08  2259  				      "aggre1";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2260  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2261  			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2262  			assigned-clock-rates = <19200000>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2263  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2264  			resets = <&gcc GCC_PCIE_1_BCR>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2265  			reset-names = "pci";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2266  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2267  			power-domains = <&gcc GCC_PCIE_1_GDSC>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2268  
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2269  			phys = <&pcie1_phy>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2270  			phy-names = "pciephy";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2271  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2272  			pinctrl-names = "default";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2273  			pinctrl-0 = <&pcie1_clkreq_n>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2274  
8a63441e83724f Krishna chaitanya chundru        2023-02-28  2275  			dma-coherent;
8a63441e83724f Krishna chaitanya chundru        2023-02-28  2276  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2277  			iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2278  				    <0x100 &apps_smmu 0x1c81 0x1>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2279  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2280  			status = "disabled";
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2281  
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2282  			pcie@0 {
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2283  				device_type = "pci";
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2284  				reg = <0x0 0x0 0x0 0x0 0x0>;
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2285  				bus-range = <0x01 0xff>;
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2286  
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2287  				#address-cells = <3>;
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2288  				#size-cells = <2>;
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2289  				ranges;
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2290  			};
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2291  		};
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2292  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2293  		pcie1_phy: phy@1c0e000 {
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2294  			compatible = "qcom,sm8250-qmp-gen3x2-pcie-phy";
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2295  			reg = <0 0x01c0e000 0 0x1000>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2296  			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2297  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2298  				 <&gcc GCC_PCIE_CLKREF_EN>,
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2299  				 <&gcc GCC_PCIE1_PHY_RCHNG_CLK>,
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2300  				 <&gcc GCC_PCIE_1_PIPE_CLK>;
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2301  			clock-names = "aux",
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2302  				      "cfg_ahb",
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2303  				      "ref",
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2304  				      "refgen",
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2305  				      "pipe";
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2306  
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2307  			clock-output-names = "pcie_1_pipe_clk";
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2308  			#clock-cells = <0>;
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2309  
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2310  			#phy-cells = <0>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2311  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2312  			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2313  			reset-names = "phy";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2314  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2315  			assigned-clocks = <&gcc GCC_PCIE1_PHY_RCHNG_CLK>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2316  			assigned-clock-rates = <100000000>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2317  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2318  			status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2319  		};
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2320  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2321  		ufs_mem_hc: ufs@1d84000 {
c8a074789d71c1 Nitin Rawat                      2023-12-05  2322  			compatible = "qcom,sc7280-ufshc", "qcom,ufshc",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2323  				     "jedec,ufs-2.0";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2324  			reg = <0x0 0x01d84000 0x0 0x3000>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2325  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2326  			phys = <&ufs_mem_phy>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2327  			phy-names = "ufsphy";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2328  			lanes-per-direction = <2>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2329  			#reset-cells = <1>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2330  			resets = <&gcc GCC_UFS_PHY_BCR>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2331  			reset-names = "rst";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2332  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2333  			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2334  			required-opps = <&rpmhpd_opp_nom>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2335  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2336  			iommus = <&apps_smmu 0x80 0x0>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2337  			dma-coherent;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2338  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2339  			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
c8a074789d71c1 Nitin Rawat                      2023-12-05  2340  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2341  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
c8a074789d71c1 Nitin Rawat                      2023-12-05  2342  					 &cnoc2 SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2343  			interconnect-names = "ufs-ddr", "cpu-ufs";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2344  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2345  			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2346  				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2347  				 <&gcc GCC_UFS_PHY_AHB_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2348  				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2349  				 <&rpmhcc RPMH_CXO_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2350  				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2351  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2352  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2353  			clock-names = "core_clk",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2354  				      "bus_aggr_clk",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2355  				      "iface_clk",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2356  				      "core_clk_unipro",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2357  				      "ref_clk",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2358  				      "tx_lane0_sync_clk",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2359  				      "rx_lane0_sync_clk",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2360  				      "rx_lane1_sync_clk";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2361  			freq-table-hz =
c8a074789d71c1 Nitin Rawat                      2023-12-05  2362  				<75000000 300000000>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2363  				<0 0>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2364  				<0 0>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2365  				<75000000 300000000>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2366  				<0 0>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2367  				<0 0>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2368  				<0 0>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2369  				<0 0>;
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2370  			qcom,ice = <&ice>;
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2371  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2372  			status = "disabled";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2373  		};
c8a074789d71c1 Nitin Rawat                      2023-12-05  2374  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2375  		ufs_mem_phy: phy@1d87000 {
c8a074789d71c1 Nitin Rawat                      2023-12-05  2376  			compatible = "qcom,sc7280-qmp-ufs-phy";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2377  			reg = <0x0 0x01d87000 0x0 0xe00>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2378  			clocks = <&rpmhcc RPMH_CXO_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2379  				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2380  				 <&gcc GCC_UFS_1_CLKREF_EN>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2381  			clock-names = "ref", "ref_aux", "qref";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2382  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2383  			power-domains = <&rpmhpd SC7280_MX>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2384  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2385  			resets = <&ufs_mem_hc 0>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2386  			reset-names = "ufsphy";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2387  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2388  			#clock-cells = <1>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2389  			#phy-cells = <0>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2390  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2391  			status = "disabled";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2392  		};
c8a074789d71c1 Nitin Rawat                      2023-12-05  2393  
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2394  		ice: crypto@1d88000 {
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2395  			compatible = "qcom,sc7280-inline-crypto-engine",
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2396  				     "qcom,inline-crypto-engine";
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2397  			reg = <0 0x01d88000 0 0x8000>;
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2398  			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2399  		};
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2400  
d488f903a86002 Om Prakash Singh                 2023-12-14  2401  		cryptobam: dma-controller@1dc4000 {
d488f903a86002 Om Prakash Singh                 2023-12-14  2402  			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
d488f903a86002 Om Prakash Singh                 2023-12-14  2403  			reg = <0x0 0x01dc4000 0x0 0x28000>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2404  			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2405  			#dma-cells = <1>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2406  			iommus = <&apps_smmu 0x4e4 0x0011>,
d488f903a86002 Om Prakash Singh                 2023-12-14  2407  				 <&apps_smmu 0x4e6 0x0011>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2408  			qcom,ee = <0>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2409  			qcom,controlled-remotely;
40ec6a2817d927 Luca Weiss                       2023-12-29  2410  			num-channels = <16>;
40ec6a2817d927 Luca Weiss                       2023-12-29  2411  			qcom,num-ees = <4>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2412  		};
d488f903a86002 Om Prakash Singh                 2023-12-14  2413  
d488f903a86002 Om Prakash Singh                 2023-12-14  2414  		crypto: crypto@1dfa000 {
d488f903a86002 Om Prakash Singh                 2023-12-14  2415  			compatible = "qcom,sc7280-qce", "qcom,sm8150-qce", "qcom,qce";
d488f903a86002 Om Prakash Singh                 2023-12-14  2416  			reg = <0x0 0x01dfa000 0x0 0x6000>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2417  			dmas = <&cryptobam 4>, <&cryptobam 5>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2418  			dma-names = "rx", "tx";
d488f903a86002 Om Prakash Singh                 2023-12-14  2419  			iommus = <&apps_smmu 0x4e4 0x0011>,
d488f903a86002 Om Prakash Singh                 2023-12-14  2420  				 <&apps_smmu 0x4e4 0x0011>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2421  			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2422  			interconnect-names = "memory";
d488f903a86002 Om Prakash Singh                 2023-12-14  2423  		};
d488f903a86002 Om Prakash Singh                 2023-12-14  2424  
fc4f0273d4fba2 Alex Elder                       2021-08-04  2425  		ipa: ipa@1e40000 {
fc4f0273d4fba2 Alex Elder                       2021-08-04  2426  			compatible = "qcom,sc7280-ipa";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2427  
fc4f0273d4fba2 Alex Elder                       2021-08-04  2428  			iommus = <&apps_smmu 0x480 0x0>,
fc4f0273d4fba2 Alex Elder                       2021-08-04  2429  				 <&apps_smmu 0x482 0x0>;
94ca994d7e932c Konrad Dybcio                    2023-01-02  2430  			reg = <0 0x01e40000 0 0x8000>,
94ca994d7e932c Konrad Dybcio                    2023-01-02  2431  			      <0 0x01e50000 0 0x4ad0>,
94ca994d7e932c Konrad Dybcio                    2023-01-02  2432  			      <0 0x01e04000 0 0x23000>;
fc4f0273d4fba2 Alex Elder                       2021-08-04  2433  			reg-names = "ipa-reg",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2434  				    "ipa-shared",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2435  				    "gsi";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2436  
33b89923d02153 Stephen Boyd                     2021-08-11  2437  			interrupts-extended = <&intc GIC_SPI 654 IRQ_TYPE_EDGE_RISING>,
33b89923d02153 Stephen Boyd                     2021-08-11  2438  					      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
fc4f0273d4fba2 Alex Elder                       2021-08-04  2439  					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
fc4f0273d4fba2 Alex Elder                       2021-08-04  2440  					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
fc4f0273d4fba2 Alex Elder                       2021-08-04  2441  			interrupt-names = "ipa",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2442  					  "gsi",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2443  					  "ipa-clock-query",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2444  					  "ipa-setup-ready";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2445  
fc4f0273d4fba2 Alex Elder                       2021-08-04  2446  			clocks = <&rpmhcc RPMH_IPA_CLK>;
fc4f0273d4fba2 Alex Elder                       2021-08-04  2447  			clock-names = "core";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2448  
fc4f0273d4fba2 Alex Elder                       2021-08-04  2449  			interconnects = <&aggre2_noc MASTER_IPA 0 &mc_virt SLAVE_EBI1 0>,
fc4f0273d4fba2 Alex Elder                       2021-08-04  2450  					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_IPA_CFG 0>;
fc4f0273d4fba2 Alex Elder                       2021-08-04  2451  			interconnect-names = "memory",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2452  					     "config";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2453  
73419e4d2fd1b8 Alex Elder                       2022-02-01  2454  			qcom,qmp = <&aoss_qmp>;
73419e4d2fd1b8 Alex Elder                       2022-02-01  2455  
fc4f0273d4fba2 Alex Elder                       2021-08-04  2456  			qcom,smem-states = <&ipa_smp2p_out 0>,
fc4f0273d4fba2 Alex Elder                       2021-08-04  2457  					   <&ipa_smp2p_out 1>;
fc4f0273d4fba2 Alex Elder                       2021-08-04  2458  			qcom,smem-state-names = "ipa-clock-enabled-valid",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2459  						"ipa-clock-enabled";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2460  
fc4f0273d4fba2 Alex Elder                       2021-08-04  2461  			status = "disabled";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2462  		};
fc4f0273d4fba2 Alex Elder                       2021-08-04  2463  
c3bbe55c942d2a Sibi Sankar                      2021-04-27  2464  		tcsr_mutex: hwlock@1f40000 {
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2465  			compatible = "qcom,tcsr-mutex";
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2466  			reg = <0 0x01f40000 0 0x20000>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27  2467  			#hwlock-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2468  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27  2469  
d0909bf4fa0fd7 Johan Hovold                     2022-09-05  2470  		tcsr_1: syscon@1f60000 {
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2471  			compatible = "qcom,sc7280-tcsr", "syscon";
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2472  			reg = <0 0x01f60000 0 0x20000>;
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2473  		};
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2474  
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2475  		tcsr_2: syscon@1fc0000 {
dddf4b0621d61b Sibi Sankar                      2021-09-17  2476  			compatible = "qcom,sc7280-tcsr", "syscon";
dddf4b0621d61b Sibi Sankar                      2021-09-17  2477  			reg = <0 0x01fc0000 0 0x30000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2478  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2479  
422a295221bba8 Taniya Das                       2021-04-10  2480  		lpasscc: lpasscc@3000000 {
422a295221bba8 Taniya Das                       2021-04-10  2481  			compatible = "qcom,sc7280-lpasscc";
422a295221bba8 Taniya Das                       2021-04-10  2482  			reg = <0 0x03000000 0 0x40>,
8c7ebabd2e3f33 Satya Priya                      2022-08-10  2483  			      <0 0x03c04000 0 0x4>;
8c7ebabd2e3f33 Satya Priya                      2022-08-10  2484  			reg-names = "qdsp6ss", "top_cc";
422a295221bba8 Taniya Das                       2021-04-10  2485  			clocks = <&gcc GCC_CFG_NOC_LPASS_CLK>;
422a295221bba8 Taniya Das                       2021-04-10  2486  			clock-names = "iface";
422a295221bba8 Taniya Das                       2021-04-10  2487  			#clock-cells = <1>;
6da24ba932082b Luca Weiss                       2023-09-19  2488  			status = "reserved"; /* Owned by ADSP firmware */
422a295221bba8 Taniya Das                       2021-04-10  2489  		};
422a295221bba8 Taniya Das                       2021-04-10  2490  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2491  		lpass_rx_macro: codec@3200000 {
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2492  			compatible = "qcom,sc7280-lpass-rx-macro";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2493  			reg = <0 0x03200000 0 0x1000>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2494  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2495  			pinctrl-names = "default";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2496  			pinctrl-0 = <&lpass_rx_swr_clk>, <&lpass_rx_swr_data>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2497  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2498  			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2499  				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2500  				 <&lpass_va_macro>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2501  			clock-names = "mclk", "npl", "fsgen";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2502  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2503  			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2504  					<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2505  			power-domain-names = "macro", "dcodec";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2506  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2507  			#clock-cells = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2508  			#sound-dai-cells = <1>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2509  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2510  			status = "disabled";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2511  		};
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2512  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2513  		swr0: soundwire@3210000 {
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2514  			compatible = "qcom,soundwire-v1.6.0";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2515  			reg = <0 0x03210000 0 0x2000>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2516  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2517  			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2518  			clocks = <&lpass_rx_macro>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2519  			clock-names = "iface";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2520  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2521  			qcom,din-ports = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2522  			qcom,dout-ports = <5>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2523  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2524  			resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2525  			reset-names = "swr_audio_cgcr";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2526  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2527  			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2528  			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x3f 0x1f 0x03 0x03>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2529  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x01>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2530  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2531  			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2532  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2533  			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2534  			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2535  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2536  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2537  			#sound-dai-cells = <1>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2538  			#address-cells = <2>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2539  			#size-cells = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2540  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2541  			status = "disabled";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2542  		};
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2543  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2544  		lpass_tx_macro: codec@3220000 {
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2545  			compatible = "qcom,sc7280-lpass-tx-macro";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2546  			reg = <0 0x03220000 0 0x1000>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2547  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2548  			pinctrl-names = "default";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2549  			pinctrl-0 = <&lpass_tx_swr_clk>, <&lpass_tx_swr_data>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2550  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2551  			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2552  				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2553  				 <&lpass_va_macro>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2554  			clock-names = "mclk", "npl", "fsgen";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2555  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2556  			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2557  					<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2558  			power-domain-names = "macro", "dcodec";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2559  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2560  			#clock-cells = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2561  			#sound-dai-cells = <1>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2562  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2563  			status = "disabled";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2564  		};
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2565  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2566  		swr1: soundwire@3230000 {
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2567  			compatible = "qcom,soundwire-v1.6.0";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2568  			reg = <0 0x03230000 0 0x2000>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2569  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2570  			interrupts-extended = <&intc GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2571  					      <&pdc 130 IRQ_TYPE_LEVEL_HIGH>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2572  			clocks = <&lpass_tx_macro>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2573  			clock-names = "iface";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2574  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2575  			qcom,din-ports = <3>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2576  			qcom,dout-ports = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2577  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2578  			resets = <&lpass_audiocc LPASS_AUDIO_SWR_TX_CGCR>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2579  			reset-names = "swr_audio_cgcr";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2580  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2581  			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x03 0x03>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2582  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x00 0x02>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2583  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2584  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2585  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2586  			qcom,ports-word-length =	/bits/ 8 <0xff 0x00 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2587  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2588  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2589  			qcom,ports-lane-control =	/bits/ 8 <0x00 0x01 0x00>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2590  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2591  			#sound-dai-cells = <1>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2592  			#address-cells = <2>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2593  			#size-cells = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2594  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2595  			status = "disabled";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2596  		};
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2597  
9499240d15f297 Taniya Das                       2022-02-02  2598  		lpass_audiocc: clock-controller@3300000 {
9499240d15f297 Taniya Das                       2022-02-02  2599  			compatible = "qcom,sc7280-lpassaudiocc";
cb1d0aaa674e99 Satya Priya                      2022-09-20  2600  			reg = <0 0x03300000 0 0x30000>,
cb1d0aaa674e99 Satya Priya                      2022-09-20  2601  			      <0 0x032a9000 0 0x1000>;
9499240d15f297 Taniya Das                       2022-02-02  2602  			clocks = <&rpmhcc RPMH_CXO_CLK>,
9499240d15f297 Taniya Das                       2022-02-02  2603  			       <&lpass_aon LPASS_AON_CC_MAIN_RCG_CLK_SRC>;
9499240d15f297 Taniya Das                       2022-02-02  2604  			clock-names = "bi_tcxo", "lpass_aon_cc_main_rcg_clk_src";
9499240d15f297 Taniya Das                       2022-02-02  2605  			power-domains = <&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
9499240d15f297 Taniya Das                       2022-02-02  2606  			#clock-cells = <1>;
9499240d15f297 Taniya Das                       2022-02-02  2607  			#power-domain-cells = <1>;
e02a16c23410a1 Taniya Das                       2022-08-10  2608  			#reset-cells = <1>;
9499240d15f297 Taniya Das                       2022-02-02  2609  		};
9499240d15f297 Taniya Das                       2022-02-02  2610  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2611  		lpass_va_macro: codec@3370000 {
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2612  			compatible = "qcom,sc7280-lpass-va-macro";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2613  			reg = <0 0x03370000 0 0x1000>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2614  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2615  			pinctrl-names = "default";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2616  			pinctrl-0 = <&lpass_dmic01_clk>, <&lpass_dmic01_data>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2617  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2618  			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2619  			clock-names = "mclk";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2620  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2621  			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2622  					<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2623  			power-domain-names = "macro", "dcodec";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2624  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2625  			#clock-cells = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2626  			#sound-dai-cells = <1>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2627  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2628  			status = "disabled";
9499240d15f297 Taniya Das                       2022-02-02  2629  		};
9499240d15f297 Taniya Das                       2022-02-02  2630  
9499240d15f297 Taniya Das                       2022-02-02  2631  		lpass_aon: clock-controller@3380000 {
9499240d15f297 Taniya Das                       2022-02-02  2632  			compatible = "qcom,sc7280-lpassaoncc";
9499240d15f297 Taniya Das                       2022-02-02  2633  			reg = <0 0x03380000 0 0x30000>;
9499240d15f297 Taniya Das                       2022-02-02  2634  			clocks = <&rpmhcc RPMH_CXO_CLK>,
9499240d15f297 Taniya Das                       2022-02-02  2635  			       <&rpmhcc RPMH_CXO_CLK_A>,
d9a1e922730389 Satya Priya                      2022-08-10  2636  			       <&lpass_core LPASS_CORE_CC_CORE_CLK>;
9499240d15f297 Taniya Das                       2022-02-02  2637  			clock-names = "bi_tcxo", "bi_tcxo_ao", "iface";
9499240d15f297 Taniya Das                       2022-02-02  2638  			#clock-cells = <1>;
9499240d15f297 Taniya Das                       2022-02-02  2639  			#power-domain-cells = <1>;
6da24ba932082b Luca Weiss                       2023-09-19  2640  			status = "reserved"; /* Owned by ADSP firmware */
9499240d15f297 Taniya Das                       2022-02-02  2641  		};
9499240d15f297 Taniya Das                       2022-02-02  2642  
d9a1e922730389 Satya Priya                      2022-08-10  2643  		lpass_core: clock-controller@3900000 {
9499240d15f297 Taniya Das                       2022-02-02  2644  			compatible = "qcom,sc7280-lpasscorecc";
9499240d15f297 Taniya Das                       2022-02-02  2645  			reg = <0 0x03900000 0 0x50000>;
9499240d15f297 Taniya Das                       2022-02-02  2646  			clocks = <&rpmhcc RPMH_CXO_CLK>;
9499240d15f297 Taniya Das                       2022-02-02  2647  			clock-names = "bi_tcxo";
9499240d15f297 Taniya Das                       2022-02-02  2648  			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>;
9499240d15f297 Taniya Das                       2022-02-02  2649  			#clock-cells = <1>;
9499240d15f297 Taniya Das                       2022-02-02  2650  			#power-domain-cells = <1>;
6da24ba932082b Luca Weiss                       2023-09-19  2651  			status = "reserved"; /* Owned by ADSP firmware */
9499240d15f297 Taniya Das                       2022-02-02  2652  		};
9499240d15f297 Taniya Das                       2022-02-02  2653  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2654  		lpass_cpu: audio@3987000 {
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2655  			compatible = "qcom,sc7280-lpass-cpu";
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2656  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2657  			reg = <0 0x03987000 0 0x68000>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2658  			      <0 0x03b00000 0 0x29000>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2659  			      <0 0x03260000 0 0xc000>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2660  			      <0 0x03280000 0 0x29000>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2661  			      <0 0x03340000 0 0x29000>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2662  			      <0 0x0336c000 0 0x3000>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2663  			reg-names = "lpass-hdmiif",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2664  				    "lpass-lpaif",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2665  				    "lpass-rxtx-cdc-dma-lpm",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2666  				    "lpass-rxtx-lpaif",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2667  				    "lpass-va-lpaif",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2668  				    "lpass-va-cdc-dma-lpm";
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2669  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2670  			iommus = <&apps_smmu 0x1820 0>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2671  				 <&apps_smmu 0x1821 0>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2672  				 <&apps_smmu 0x1832 0>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2673  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2674  			power-domains = <&rpmhpd SC7280_LCX>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2675  			power-domain-names = "lcx";
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2676  			required-opps = <&rpmhpd_opp_nom>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2677  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2678  			clocks = <&lpass_aon LPASS_AON_CC_AUDIO_HM_H_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2679  				 <&lpass_core LPASS_CORE_CC_EXT_MCLK0_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2680  				 <&lpass_core LPASS_CORE_CC_SYSNOC_MPORT_CORE_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2681  				 <&lpass_core LPASS_CORE_CC_EXT_IF0_IBIT_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2682  				 <&lpass_core LPASS_CORE_CC_EXT_IF1_IBIT_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2683  				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2684  				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM0_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2685  				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM1_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2686  				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM2_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2687  				 <&lpass_aon LPASS_AON_CC_VA_MEM0_CLK>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2688  			clock-names = "aon_cc_audio_hm_h",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2689  				      "audio_cc_ext_mclk0",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2690  				      "core_cc_sysnoc_mport_core",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2691  				      "core_cc_ext_if0_ibit",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2692  				      "core_cc_ext_if1_ibit",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2693  				      "audio_cc_codec_mem",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2694  				      "audio_cc_codec_mem0",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2695  				      "audio_cc_codec_mem1",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2696  				      "audio_cc_codec_mem2",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2697  				      "aon_cc_va_mem0";
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2698  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2699  			#sound-dai-cells = <1>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2700  			#address-cells = <1>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2701  			#size-cells = <0>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2702  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2703  			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2704  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2705  				     <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2706  				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2707  			interrupt-names = "lpass-irq-lpaif",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2708  					  "lpass-irq-hdmi",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2709  					  "lpass-irq-vaif",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2710  					  "lpass-irq-rxtxif";
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2711  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2712  			status = "disabled";
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2713  		};
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2714  
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2715  		slimbam: dma-controller@3a84000 {
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2716  			compatible = "qcom,bam-v1.7.0";
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2717  			reg = <0 0x03a84000 0 0x20000>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2718  			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2719  			#dma-cells = <1>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2720  			qcom,controlled-remotely;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2721  			num-channels  = <31>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2722  			qcom,ee = <1>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2723  			qcom,num-ees = <2>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2724  			iommus = <&apps_smmu 0x1826 0x0>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2725  			status = "disabled";
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2726  		};
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2727  
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2728  		slim: slim-ngd@3ac0000 {
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2729  			compatible = "qcom,slim-ngd-v1.5.0";
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2730  			reg = <0 0x03ac0000 0 0x2c000>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2731  			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2732  			dmas = <&slimbam 3>, <&slimbam 4>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2733  			dma-names = "rx", "tx";
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2734  			iommus = <&apps_smmu 0x1826 0x0>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2735  			#address-cells = <1>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2736  			#size-cells = <0>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2737  			status = "disabled";
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2738  		};
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2739  
9499240d15f297 Taniya Das                       2022-02-02  2740  		lpass_hm: clock-controller@3c00000 {
9499240d15f297 Taniya Das                       2022-02-02  2741  			compatible = "qcom,sc7280-lpasshm";
94ca994d7e932c Konrad Dybcio                    2023-01-02  2742  			reg = <0 0x03c00000 0 0x28>;
9499240d15f297 Taniya Das                       2022-02-02  2743  			clocks = <&rpmhcc RPMH_CXO_CLK>;
9499240d15f297 Taniya Das                       2022-02-02  2744  			clock-names = "bi_tcxo";
9499240d15f297 Taniya Das                       2022-02-02  2745  			#clock-cells = <1>;
9499240d15f297 Taniya Das                       2022-02-02  2746  			#power-domain-cells = <1>;
6da24ba932082b Luca Weiss                       2023-09-19  2747  			status = "reserved"; /* Owned by ADSP firmware */
9499240d15f297 Taniya Das                       2022-02-02  2748  		};
9499240d15f297 Taniya Das                       2022-02-02  2749  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2750  		lpass_ag_noc: interconnect@3c40000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2751  			reg = <0 0x03c40000 0 0xf080>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2752  			compatible = "qcom,sc7280-lpass-ag-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2753  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2754  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2755  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  2756  
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2757  		lpass_tlmm: pinctrl@33c0000 {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2758  			compatible = "qcom,sc7280-lpass-lpi-pinctrl";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2759  			reg = <0 0x033c0000 0x0 0x20000>,
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2760  				<0 0x03550000 0x0 0x10000>;
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2761  			gpio-controller;
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2762  			#gpio-cells = <2>;
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2763  			gpio-ranges = <&lpass_tlmm 0 0 15>;
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2764  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2765  			lpass_dmic01_clk: dmic01-clk-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2766  				pins = "gpio6";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2767  				function = "dmic1_clk";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2768  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2769  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2770  			lpass_dmic01_data: dmic01-data-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2771  				pins = "gpio7";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2772  				function = "dmic1_data";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2773  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2774  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2775  			lpass_dmic23_clk: dmic23-clk-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2776  				pins = "gpio8";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2777  				function = "dmic2_clk";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2778  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2779  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2780  			lpass_dmic23_data: dmic23-data-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2781  				pins = "gpio9";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2782  				function = "dmic2_data";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2783  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2784  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2785  			lpass_rx_swr_clk: rx-swr-clk-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2786  				pins = "gpio3";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2787  				function = "swr_rx_clk";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2788  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2789  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2790  			lpass_rx_swr_data: rx-swr-data-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2791  				pins = "gpio4", "gpio5";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2792  				function = "swr_rx_data";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2793  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2794  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2795  			lpass_tx_swr_clk: tx-swr-clk-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2796  				pins = "gpio0";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2797  				function = "swr_tx_clk";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2798  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2799  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2800  			lpass_tx_swr_data: tx-swr-data-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2801  				pins = "gpio1", "gpio2", "gpio14";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2802  				function = "swr_tx_data";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2803  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2804  		};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2805  
b39f266c19f02c Manaf Meethalavalappu Pallikunhi 2021-08-11  2806  		gpu: gpu@3d00000 {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2807  			compatible = "qcom,adreno-635.0", "qcom,adreno";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2808  			reg = <0 0x03d00000 0 0x40000>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2809  			      <0 0x03d9e000 0 0x1000>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2810  			      <0 0x03d61000 0 0x800>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2811  			reg-names = "kgsl_3d0_reg_memory",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2812  				    "cx_mem",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2813  				    "cx_dbgc";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2814  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
94085049fdad7a Konrad Dybcio                    2023-11-20  2815  			iommus = <&adreno_smmu 0 0x400>,
94085049fdad7a Konrad Dybcio                    2023-11-20  2816  				 <&adreno_smmu 1 0x400>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2817  			operating-points-v2 = <&gpu_opp_table>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2818  			qcom,gmu = <&gmu>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2819  			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2820  			interconnect-names = "gfx-mem";
b39f266c19f02c Manaf Meethalavalappu Pallikunhi 2021-08-11  2821  			#cooling-cells = <2>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2822  
3bfef00d767124 Akhil P Oommen                   2022-02-26  2823  			nvmem-cells = <&gpu_speed_bin>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2824  			nvmem-cell-names = "speed_bin";
3bfef00d767124 Akhil P Oommen                   2022-02-26  2825  
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20  2826  			gpu_zap_shader: zap-shader {
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20  2827  				memory-region = <&gpu_zap_mem>;
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20  2828  			};
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20  2829  
96c471970b7bcb Akhil P Oommen                   2021-08-11  2830  			gpu_opp_table: opp-table {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2831  				compatible = "operating-points-v2";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2832  
96c471970b7bcb Akhil P Oommen                   2021-08-11  2833  				opp-315000000 {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2834  					opp-hz = /bits/ 64 <315000000>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2835  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2836  					opp-peak-kBps = <1804000>;
6a7f8c635dab30 Konrad Dybcio                    2023-11-20  2837  					opp-supported-hw = <0x07>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2838  				};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2839  
96c471970b7bcb Akhil P Oommen                   2021-08-11  2840  				opp-450000000 {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2841  					opp-hz = /bits/ 64 <450000000>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2842  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2843  					opp-peak-kBps = <4068000>;
6a7f8c635dab30 Konrad Dybcio                    2023-11-20  2844  					opp-supported-hw = <0x07>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2845  				};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2846  
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2847  				/* Only applicable for SKUs which has 550Mhz as Fmax */
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2848  				opp-550000000-0 {
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2849  					opp-hz = /bits/ 64 <550000000>;
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2850  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2851  					opp-peak-kBps = <8368000>;
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2852  					opp-supported-hw = <0x01>;
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2853  				};
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2854  
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2855  				opp-550000000-1 {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2856  					opp-hz = /bits/ 64 <550000000>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2857  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2858  					opp-peak-kBps = <6832000>;
6a7f8c635dab30 Konrad Dybcio                    2023-11-20  2859  					opp-supported-hw = <0x06>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2860  				};
3bfef00d767124 Akhil P Oommen                   2022-02-26  2861  
3bfef00d767124 Akhil P Oommen                   2022-02-26  2862  				opp-608000000 {
3bfef00d767124 Akhil P Oommen                   2022-02-26  2863  					opp-hz = /bits/ 64 <608000000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2864  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2865  					opp-peak-kBps = <8368000>;
6a7f8c635dab30 Konrad Dybcio                    2023-11-20  2866  					opp-supported-hw = <0x06>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2867  				};
3bfef00d767124 Akhil P Oommen                   2022-02-26  2868  
3bfef00d767124 Akhil P Oommen                   2022-02-26  2869  				opp-700000000 {
3bfef00d767124 Akhil P Oommen                   2022-02-26  2870  					opp-hz = /bits/ 64 <700000000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2871  					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2872  					opp-peak-kBps = <8532000>;
6a7f8c635dab30 Konrad Dybcio                    2023-11-20  2873  					opp-supported-hw = <0x06>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2874  				};
3bfef00d767124 Akhil P Oommen                   2022-02-26  2875  
3bfef00d767124 Akhil P Oommen                   2022-02-26  2876  				opp-812000000 {
3bfef00d767124 Akhil P Oommen                   2022-02-26  2877  					opp-hz = /bits/ 64 <812000000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2878  					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2879  					opp-peak-kBps = <8532000>;
6a7f8c635dab30 Konrad Dybcio                    2023-11-20  2880  					opp-supported-hw = <0x06>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2881  				};
3bfef00d767124 Akhil P Oommen                   2022-02-26  2882  
3bfef00d767124 Akhil P Oommen                   2022-02-26  2883  				opp-840000000 {
3bfef00d767124 Akhil P Oommen                   2022-02-26  2884  					opp-hz = /bits/ 64 <840000000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2885  					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2886  					opp-peak-kBps = <8532000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2887  					opp-supported-hw = <0x02>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2888  				};
3bfef00d767124 Akhil P Oommen                   2022-02-26  2889  
3bfef00d767124 Akhil P Oommen                   2022-02-26  2890  				opp-900000000 {
3bfef00d767124 Akhil P Oommen                   2022-02-26  2891  					opp-hz = /bits/ 64 <900000000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2892  					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2893  					opp-peak-kBps = <8532000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2894  					opp-supported-hw = <0x02>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2895  				};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2896  			};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2897  		};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2898  
142a4d995c6adb Douglas Anderson                 2022-01-25  2899  		gmu: gmu@3d6a000 {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2900  			compatible = "qcom,adreno-gmu-635.0", "qcom,adreno-gmu";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2901  			reg = <0 0x03d6a000 0 0x34000>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2902  				<0 0x3de0000 0 0x10000>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2903  				<0 0x0b290000 0 0x10000>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2904  			reg-names = "gmu", "rscc", "gmu_pdc";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2905  			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2906  					<GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2907  			interrupt-names = "hfi", "gmu";
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2908  			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2909  				 <&gpucc GPU_CC_CXO_CLK>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2910  				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2911  				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2912  				 <&gpucc GPU_CC_AHB_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2913  				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2914  				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2915  			clock-names = "gmu",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2916  				      "cxo",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2917  				      "axi",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2918  				      "memnoc",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2919  				      "ahb",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2920  				      "hub",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2921  				      "smmu_vote";
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2922  			power-domains = <&gpucc GPU_CC_CX_GDSC>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2923  					<&gpucc GPU_CC_GX_GDSC>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2924  			power-domain-names = "cx",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2925  					     "gx";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2926  			iommus = <&adreno_smmu 5 0x400>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2927  			operating-points-v2 = <&gmu_opp_table>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2928  
96c471970b7bcb Akhil P Oommen                   2021-08-11  2929  			gmu_opp_table: opp-table {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2930  				compatible = "operating-points-v2";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2931  
96c471970b7bcb Akhil P Oommen                   2021-08-11  2932  				opp-200000000 {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2933  					opp-hz = /bits/ 64 <200000000>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2934  					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2935  				};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2936  			};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2937  		};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2938  
422a295221bba8 Taniya Das                       2021-04-10  2939  		gpucc: clock-controller@3d90000 {
422a295221bba8 Taniya Das                       2021-04-10  2940  			compatible = "qcom,sc7280-gpucc";
422a295221bba8 Taniya Das                       2021-04-10  2941  			reg = <0 0x03d90000 0 0x9000>;
422a295221bba8 Taniya Das                       2021-04-10  2942  			clocks = <&rpmhcc RPMH_CXO_CLK>,
422a295221bba8 Taniya Das                       2021-04-10  2943  				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
422a295221bba8 Taniya Das                       2021-04-10  2944  				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
422a295221bba8 Taniya Das                       2021-04-10  2945  			clock-names = "bi_tcxo",
422a295221bba8 Taniya Das                       2021-04-10  2946  				      "gcc_gpu_gpll0_clk_src",
422a295221bba8 Taniya Das                       2021-04-10  2947  				      "gcc_gpu_gpll0_div_clk_src";
422a295221bba8 Taniya Das                       2021-04-10  2948  			#clock-cells = <1>;
422a295221bba8 Taniya Das                       2021-04-10  2949  			#reset-cells = <1>;
422a295221bba8 Taniya Das                       2021-04-10  2950  			#power-domain-cells = <1>;
422a295221bba8 Taniya Das                       2021-04-10  2951  		};
422a295221bba8 Taniya Das                       2021-04-10  2952  
029d6586dc2d1d Souradeep Chowdhury              2022-12-27  2953  		dma@117f000 {
029d6586dc2d1d Souradeep Chowdhury              2022-12-27  2954  			compatible = "qcom,sc7280-dcc", "qcom,dcc";
029d6586dc2d1d Souradeep Chowdhury              2022-12-27  2955  			reg = <0x0 0x0117f000 0x0 0x1000>,
029d6586dc2d1d Souradeep Chowdhury              2022-12-27  2956  			      <0x0 0x01112000 0x0 0x6000>;
029d6586dc2d1d Souradeep Chowdhury              2022-12-27  2957  		};
029d6586dc2d1d Souradeep Chowdhury              2022-12-27  2958  
96c471970b7bcb Akhil P Oommen                   2021-08-11  2959  		adreno_smmu: iommu@3da0000 {
c564b69984a78c Konrad Dybcio                    2023-02-16  2960  			compatible = "qcom,sc7280-smmu-500", "qcom,adreno-smmu",
c564b69984a78c Konrad Dybcio                    2023-02-16  2961  				     "qcom,smmu-500", "arm,mmu-500";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2962  			reg = <0 0x03da0000 0 0x20000>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2963  			#iommu-cells = <2>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2964  			#global-interrupts = <2>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2965  			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2966  					<GIC_SPI 675 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2967  					<GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2968  					<GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2969  					<GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2970  					<GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2971  					<GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2972  					<GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2973  					<GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2974  					<GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2975  					<GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2976  					<GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2977  
96c471970b7bcb Akhil P Oommen                   2021-08-11  2978  			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2979  				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2980  				 <&gpucc GPU_CC_AHB_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2981  				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2982  				 <&gpucc GPU_CC_CX_GMU_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2983  				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2984  				 <&gpucc GPU_CC_HUB_AON_CLK>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2985  			clock-names = "gcc_gpu_memnoc_gfx_clk",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2986  					"gcc_gpu_snoc_dvm_gfx_clk",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2987  					"gpu_cc_ahb_clk",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2988  					"gpu_cc_hlos1_vote_gpu_smmu_clk",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2989  					"gpu_cc_cx_gmu_clk",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2990  					"gpu_cc_hub_cx_int_clk",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2991  					"gpu_cc_hub_aon_clk";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2992  
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2993  			power-domains = <&gpucc GPU_CC_CX_GDSC>;
31edad47853418 Konrad Dybcio                    2023-11-20  2994  			dma-coherent;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2995  		};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2996  
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  2997  		gfx_0_tbu: tbu@3dd9000 {
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  2998  			compatible = "qcom,sc7280-tbu";
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  2999  			reg = <0x0 0x3dd9000 0x0 0x1000>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3000  			qcom,stream-id-range = <&adreno_smmu 0x0 0x400>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3001  		};
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3002  
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3003  		gfx_1_tbu: tbu@3ddd000 {
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3004  			compatible = "qcom,sc7280-tbu";
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3005  			reg = <0x0 0x3ddd000 0x0 0x1000>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3006  			qcom,stream-id-range = <&adreno_smmu 0x400 0x400>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3007  		};
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3008  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3009  		remoteproc_mpss: remoteproc@4080000 {
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3010  			compatible = "qcom,sc7280-mpss-pas";
419618bd90f6b2 Luca Weiss                       2023-12-08  3011  			reg = <0 0x04080000 0 0x10000>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3012  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3013  			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3014  					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3015  					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3016  					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3017  					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3018  					      <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3019  			interrupt-names = "wdog", "fatal", "ready", "handover",
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3020  					  "stop-ack", "shutdown-ack";
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3021  
92476ddf02b566 Krzysztof Kozlowski              2022-11-24  3022  			clocks = <&rpmhcc RPMH_CXO_CLK>;
92476ddf02b566 Krzysztof Kozlowski              2022-11-24  3023  			clock-names = "xo";
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3024  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3025  			power-domains = <&rpmhpd SC7280_CX>,
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3026  					<&rpmhpd SC7280_MSS>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3027  			power-domain-names = "cx", "mss";
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3028  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3029  			memory-region = <&mpss_mem>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3030  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3031  			qcom,qmp = <&aoss_qmp>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3032  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3033  			qcom,smem-states = <&modem_smp2p_out 0>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3034  			qcom,smem-state-names = "stop";
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3035  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3036  			status = "disabled";
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3037  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3038  			glink-edge {
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3039  				interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3040  							     IPCC_MPROC_SIGNAL_GLINK_QMP
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3041  							     IRQ_TYPE_EDGE_RISING>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3042  				mboxes = <&ipcc IPCC_CLIENT_MPSS
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3043  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3044  				label = "modem";
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3045  				qcom,remote-pid = <1>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3046  			};
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3047  		};
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3048  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3049  		stm@6002000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3050  			compatible = "arm,coresight-stm", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3051  			reg = <0 0x06002000 0 0x1000>,
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3052  			      <0 0x16280000 0 0x180000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3053  			reg-names = "stm-base", "stm-stimulus-base";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3054  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3055  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3056  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3057  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3058  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3059  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3060  					stm_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3061  						remote-endpoint = <&funnel0_in7>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3062  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3063  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3064  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3065  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3066  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3067  		funnel@6041000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3068  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3069  			reg = <0 0x06041000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3070  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3071  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3072  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3073  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3074  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3075  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3076  					funnel0_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3077  						remote-endpoint = <&merge_funnel_in0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3078  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3079  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3080  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3081  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3082  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3083  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3084  				#size-cells = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3085  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3086  				port@7 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3087  					reg = <7>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3088  					funnel0_in7: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3089  						remote-endpoint = <&stm_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3090  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3091  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3092  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3093  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3094  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3095  		funnel@6042000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3096  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3097  			reg = <0 0x06042000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3098  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3099  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3100  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3101  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3102  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3103  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3104  					funnel1_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3105  						remote-endpoint = <&merge_funnel_in1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3106  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3107  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3108  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3109  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3110  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3111  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3112  				#size-cells = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3113  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3114  				port@4 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3115  					reg = <4>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3116  					funnel1_in4: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3117  						remote-endpoint = <&apss_merge_funnel_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3118  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3119  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3120  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3121  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3122  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3123  		funnel@6045000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3124  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3125  			reg = <0 0x06045000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3126  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3127  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3128  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3129  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3130  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3131  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3132  					merge_funnel_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3133  						remote-endpoint = <&swao_funnel_in>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3134  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3135  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3136  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3137  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3138  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3139  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3140  				#size-cells = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3141  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3142  				port@0 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3143  					reg = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3144  					merge_funnel_in0: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3145  						remote-endpoint = <&funnel0_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3146  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3147  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3148  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3149  				port@1 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3150  					reg = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3151  					merge_funnel_in1: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3152  						remote-endpoint = <&funnel1_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3153  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3154  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3155  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3156  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3157  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3158  		replicator@6046000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3159  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3160  			reg = <0 0x06046000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3161  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3162  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3163  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3164  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3165  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3166  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3167  					replicator_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3168  						remote-endpoint = <&etr_in>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3169  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3170  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3171  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3172  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3173  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3174  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3175  					replicator_in: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3176  						remote-endpoint = <&swao_replicator_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3177  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3178  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3179  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3180  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3181  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3182  		etr@6048000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3183  			compatible = "arm,coresight-tmc", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3184  			reg = <0 0x06048000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3185  			iommus = <&apps_smmu 0x04c0 0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3186  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3187  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3188  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3189  			arm,scatter-gather;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3190  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3191  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3192  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3193  					etr_in: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3194  						remote-endpoint = <&replicator_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3195  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3196  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3197  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3198  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3199  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3200  		funnel@6b04000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3201  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3202  			reg = <0 0x06b04000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3203  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3204  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3205  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3206  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3207  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3208  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3209  					swao_funnel_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3210  						remote-endpoint = <&etf_in>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3211  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3212  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3213  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3214  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3215  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3216  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3217  				#size-cells = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3218  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3219  				port@7 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3220  					reg = <7>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3221  					swao_funnel_in: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3222  						remote-endpoint = <&merge_funnel_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3223  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3224  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3225  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3226  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3227  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3228  		etf@6b05000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3229  			compatible = "arm,coresight-tmc", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3230  			reg = <0 0x06b05000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3231  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3232  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3233  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3234  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3235  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3236  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3237  					etf_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3238  						remote-endpoint = <&swao_replicator_in>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3239  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3240  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3241  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3242  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3243  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3244  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3245  					etf_in: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3246  						remote-endpoint = <&swao_funnel_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3247  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3248  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3249  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3250  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3251  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3252  		replicator@6b06000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3253  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3254  			reg = <0 0x06b06000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3255  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3256  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3257  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3258  			qcom,replicator-loses-context;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3259  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3260  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3261  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3262  					swao_replicator_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3263  						remote-endpoint = <&replicator_in>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3264  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3265  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3266  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3267  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3268  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3269  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3270  					swao_replicator_in: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3271  						remote-endpoint = <&etf_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3272  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3273  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3274  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3275  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3276  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3277  		etm@7040000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3278  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3279  			reg = <0 0x07040000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3280  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3281  			cpu = <&CPU0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3282  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3283  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3284  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3285  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3286  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3287  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3288  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3289  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3290  					etm0_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3291  						remote-endpoint = <&apss_funnel_in0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3292  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3293  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3294  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3295  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3296  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3297  		etm@7140000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3298  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3299  			reg = <0 0x07140000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3300  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3301  			cpu = <&CPU1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3302  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3303  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3304  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3305  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3306  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3307  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3308  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3309  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3310  					etm1_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3311  						remote-endpoint = <&apss_funnel_in1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3312  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3313  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3314  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3315  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3316  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3317  		etm@7240000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3318  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3319  			reg = <0 0x07240000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3320  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3321  			cpu = <&CPU2>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3322  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3323  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3324  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3325  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3326  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3327  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3328  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3329  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3330  					etm2_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3331  						remote-endpoint = <&apss_funnel_in2>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3332  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3333  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3334  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3335  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3336  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3337  		etm@7340000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3338  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3339  			reg = <0 0x07340000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3340  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3341  			cpu = <&CPU3>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3342  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3343  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3344  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3345  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3346  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3347  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3348  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3349  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3350  					etm3_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3351  						remote-endpoint = <&apss_funnel_in3>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3352  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3353  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3354  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3355  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3356  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3357  		etm@7440000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3358  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3359  			reg = <0 0x07440000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3360  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3361  			cpu = <&CPU4>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3362  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3363  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3364  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3365  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3366  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3367  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3368  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3369  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3370  					etm4_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3371  						remote-endpoint = <&apss_funnel_in4>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3372  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3373  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3374  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3375  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3376  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3377  		etm@7540000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3378  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3379  			reg = <0 0x07540000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3380  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3381  			cpu = <&CPU5>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3382  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3383  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3384  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3385  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3386  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3387  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3388  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3389  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3390  					etm5_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3391  						remote-endpoint = <&apss_funnel_in5>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3392  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3393  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3394  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3395  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3396  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3397  		etm@7640000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3398  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3399  			reg = <0 0x07640000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3400  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3401  			cpu = <&CPU6>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3402  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3403  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3404  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3405  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3406  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3407  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3408  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3409  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3410  					etm6_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3411  						remote-endpoint = <&apss_funnel_in6>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3412  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3413  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3414  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3415  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3416  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3417  		etm@7740000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3418  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3419  			reg = <0 0x07740000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3420  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3421  			cpu = <&CPU7>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3422  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3423  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3424  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3425  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3426  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3427  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3428  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3429  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3430  					etm7_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3431  						remote-endpoint = <&apss_funnel_in7>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3432  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3433  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3434  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3435  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3436  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3437  		funnel@7800000 { /* APSS Funnel */
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3438  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3439  			reg = <0 0x07800000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3440  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3441  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3442  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3443  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3444  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3445  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3446  					apss_funnel_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3447  						remote-endpoint = <&apss_merge_funnel_in>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3448  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3449  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3450  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3451  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3452  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3453  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3454  				#size-cells = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3455  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3456  				port@0 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3457  					reg = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3458  					apss_funnel_in0: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3459  						remote-endpoint = <&etm0_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3460  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3461  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3462  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3463  				port@1 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3464  					reg = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3465  					apss_funnel_in1: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3466  						remote-endpoint = <&etm1_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3467  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3468  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3469  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3470  				port@2 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3471  					reg = <2>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3472  					apss_funnel_in2: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3473  						remote-endpoint = <&etm2_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3474  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3475  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3476  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3477  				port@3 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3478  					reg = <3>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3479  					apss_funnel_in3: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3480  						remote-endpoint = <&etm3_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3481  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3482  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3483  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3484  				port@4 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3485  					reg = <4>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3486  					apss_funnel_in4: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3487  						remote-endpoint = <&etm4_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3488  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3489  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3490  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3491  				port@5 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3492  					reg = <5>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3493  					apss_funnel_in5: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3494  						remote-endpoint = <&etm5_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3495  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3496  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3497  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3498  				port@6 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3499  					reg = <6>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3500  					apss_funnel_in6: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3501  						remote-endpoint = <&etm6_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3502  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3503  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3504  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3505  				port@7 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3506  					reg = <7>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3507  					apss_funnel_in7: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3508  						remote-endpoint = <&etm7_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3509  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3510  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3511  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3512  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3513  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3514  		funnel@7810000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3515  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3516  			reg = <0 0x07810000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3517  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3518  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3519  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3520  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3521  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3522  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3523  					apss_merge_funnel_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3524  						remote-endpoint = <&funnel1_in4>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3525  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3526  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3527  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3528  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3529  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3530  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3531  					apss_merge_funnel_in: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3532  						remote-endpoint = <&apss_funnel_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3533  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3534  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3535  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3536  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3537  
96bb736f05d156 Bhupesh Sharma                   2022-05-15  3538  		sdhc_2: mmc@8804000 {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3539  			compatible = "qcom,sc7280-sdhci", "qcom,sdhci-msm-v5";
f9800dde34e678 Douglas Anderson                 2022-02-02  3540  			pinctrl-names = "default", "sleep";
f9800dde34e678 Douglas Anderson                 2022-02-02  3541  			pinctrl-0 = <&sdc2_clk>, <&sdc2_cmd>, <&sdc2_data>;
f9800dde34e678 Douglas Anderson                 2022-02-02  3542  			pinctrl-1 = <&sdc2_clk_sleep>, <&sdc2_cmd_sleep>, <&sdc2_data_sleep>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3543  			status = "disabled";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3544  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3545  			reg = <0 0x08804000 0 0x1000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3546  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3547  			iommus = <&apps_smmu 0x100 0x0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3548  			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3549  				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3550  			interrupt-names = "hc_irq", "pwr_irq";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3551  
4ff12270dbbe24 Bhupesh Sharma                   2022-05-15  3552  			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
4ff12270dbbe24 Bhupesh Sharma                   2022-05-15  3553  				 <&gcc GCC_SDCC2_APPS_CLK>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3554  				 <&rpmhcc RPMH_CXO_CLK>;
4ff12270dbbe24 Bhupesh Sharma                   2022-05-15  3555  			clock-names = "iface", "core", "xo";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3556  			interconnects = <&aggre1_noc MASTER_SDCC_2 0 &mc_virt SLAVE_EBI1 0>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3557  					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_SDCC_2 0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3558  			interconnect-names = "sdhc-ddr","cpu-sdhc";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3559  			power-domains = <&rpmhpd SC7280_CX>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3560  			operating-points-v2 = <&sdhc2_opp_table>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3561  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3562  			bus-width = <4>;
827f5fc8d91220 Konrad Dybcio                    2023-12-18  3563  			dma-coherent;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3564  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3565  			qcom,dll-config = <0x0007642c>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3566  
959cb513074386 Shaik Sajida Bhanu               2022-04-12  3567  			resets = <&gcc GCC_SDCC2_BCR>;
959cb513074386 Shaik Sajida Bhanu               2022-04-12  3568  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3569  			sdhc2_opp_table: opp-table {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3570  				compatible = "operating-points-v2";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3571  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3572  				opp-100000000 {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3573  					opp-hz = /bits/ 64 <100000000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3574  					required-opps = <&rpmhpd_opp_low_svs>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3575  					opp-peak-kBps = <1800000 400000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3576  					opp-avg-kBps = <100000 0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3577  				};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3578  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3579  				opp-202000000 {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3580  					opp-hz = /bits/ 64 <202000000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3581  					required-opps = <&rpmhpd_opp_nom>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3582  					opp-peak-kBps = <5400000 1600000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3583  					opp-avg-kBps = <200000 0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3584  				};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3585  			};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3586  		};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3587  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3588  		usb_1_hsphy: phy@88e3000 {
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3589  			compatible = "qcom,sc7280-usb-hs-phy",
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3590  				     "qcom,usb-snps-hs-7nm-phy";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3591  			reg = <0 0x088e3000 0 0x400>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3592  			status = "disabled";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3593  			#phy-cells = <0>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3594  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3595  			clocks = <&rpmhcc RPMH_CXO_CLK>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3596  			clock-names = "ref";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3597  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3598  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3599  		};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3600  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3601  		usb_2_hsphy: phy@88e4000 {
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3602  			compatible = "qcom,sc7280-usb-hs-phy",
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3603  				     "qcom,usb-snps-hs-7nm-phy";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3604  			reg = <0 0x088e4000 0 0x400>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3605  			status = "disabled";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3606  			#phy-cells = <0>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3607  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3608  			clocks = <&rpmhcc RPMH_CXO_CLK>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3609  			clock-names = "ref";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3610  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3611  			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3612  		};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3613  
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3614  		usb_1_qmpphy: phy@88e8000 {
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3615  			compatible = "qcom,sc7280-qmp-usb3-dp-phy";
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3616  			reg = <0 0x088e8000 0 0x3000>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3617  			status = "disabled";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3618  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3619  			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3620  				 <&rpmhcc RPMH_CXO_CLK>,
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3621  				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3622  				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3623  			clock-names = "aux",
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3624  				      "ref",
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3625  				      "com_aux",
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3626  				      "usb3_pipe";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3627  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3628  			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3629  				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3630  			reset-names = "phy", "common";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3631  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3632  			#clock-cells = <1>;
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3633  			#phy-cells = <1>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3634  
2278b16f12a9cc Luca Weiss                       2023-09-29  3635  			ports {
2278b16f12a9cc Luca Weiss                       2023-09-29  3636  				#address-cells = <1>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3637  				#size-cells = <0>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3638  
2278b16f12a9cc Luca Weiss                       2023-09-29  3639  				port@0 {
2278b16f12a9cc Luca Weiss                       2023-09-29  3640  					reg = <0>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3641  
2278b16f12a9cc Luca Weiss                       2023-09-29  3642  					usb_dp_qmpphy_out: endpoint {
2278b16f12a9cc Luca Weiss                       2023-09-29  3643  					};
2278b16f12a9cc Luca Weiss                       2023-09-29  3644  				};
2278b16f12a9cc Luca Weiss                       2023-09-29  3645  
2278b16f12a9cc Luca Weiss                       2023-09-29  3646  				port@1 {
2278b16f12a9cc Luca Weiss                       2023-09-29  3647  					reg = <1>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3648  
2278b16f12a9cc Luca Weiss                       2023-09-29  3649  					usb_dp_qmpphy_usb_ss_in: endpoint {
2278b16f12a9cc Luca Weiss                       2023-09-29  3650  					};
2278b16f12a9cc Luca Weiss                       2023-09-29  3651  				};
2278b16f12a9cc Luca Weiss                       2023-09-29  3652  
2278b16f12a9cc Luca Weiss                       2023-09-29  3653  				port@2 {
2278b16f12a9cc Luca Weiss                       2023-09-29  3654  					reg = <2>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3655  
2278b16f12a9cc Luca Weiss                       2023-09-29  3656  					usb_dp_qmpphy_dp_in: endpoint {
2278b16f12a9cc Luca Weiss                       2023-09-29  3657  					};
2278b16f12a9cc Luca Weiss                       2023-09-29  3658  				};
2278b16f12a9cc Luca Weiss                       2023-09-29  3659  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3660  		};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3661  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3662  		usb_2: usb@8cf8800 {
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3663  			compatible = "qcom,sc7280-dwc3", "qcom,dwc3";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3664  			reg = <0 0x08cf8800 0 0x400>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3665  			status = "disabled";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3666  			#address-cells = <2>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3667  			#size-cells = <2>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3668  			ranges;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3669  			dma-ranges;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3670  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3671  			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3672  				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3673  				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3674  				 <&gcc GCC_USB30_SEC_SLEEP_CLK>,
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3675  				 <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>;
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3676  			clock-names = "cfg_noc",
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3677  				      "core",
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3678  				      "iface",
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3679  				      "sleep",
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3680  				      "mock_utmi";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3681  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3682  			assigned-clocks = <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3683  					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3684  			assigned-clock-rates = <19200000>, <200000000>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3685  
6bf150aef236fb Krishna Kurapati                 2024-01-26  3686  			interrupts-extended = <&intc GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
6bf150aef236fb Krishna Kurapati                 2024-01-26  3687  					      <&intc GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
24f8aba9a7c77c Johan Hovold                     2023-11-20  3688  					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
24f8aba9a7c77c Johan Hovold                     2023-11-20  3689  					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>;
6bf150aef236fb Krishna Kurapati                 2024-01-26  3690  			interrupt-names = "pwr_event",
6bf150aef236fb Krishna Kurapati                 2024-01-26  3691  					  "hs_phy_irq",
2a8d28b8af7906 Johan Hovold                     2022-07-15  3692  					  "dp_hs_phy_irq",
2a8d28b8af7906 Johan Hovold                     2022-07-15  3693  					  "dm_hs_phy_irq";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3694  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3695  			power-domains = <&gcc GCC_USB30_SEC_GDSC>;
3d59187efc982b Rajendra Nayak                   2022-09-16  3696  			required-opps = <&rpmhpd_opp_nom>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3697  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3698  			resets = <&gcc GCC_USB30_SEC_BCR>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3699  
6493367f8031b1 Sandeep Maheswaram               2021-08-02  3700  			interconnects = <&aggre1_noc MASTER_USB2 0 &mc_virt SLAVE_EBI1 0>,
6493367f8031b1 Sandeep Maheswaram               2021-08-02  3701  					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_USB2 0>;
6493367f8031b1 Sandeep Maheswaram               2021-08-02  3702  			interconnect-names = "usb-ddr", "apps-usb";
6493367f8031b1 Sandeep Maheswaram               2021-08-02  3703  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3704  			usb_2_dwc3: usb@8c00000 {
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3705  				compatible = "snps,dwc3";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3706  				reg = <0 0x08c00000 0 0xe000>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3707  				interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3708  				iommus = <&apps_smmu 0xa0 0x0>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3709  				snps,dis_u2_susphy_quirk;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3710  				snps,dis_enblslpm_quirk;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3711  				phys = <&usb_2_hsphy>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3712  				phy-names = "usb2-phy";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3713  				maximum-speed = "high-speed";
0b059979090d72 Souradeep Chowdhury              2022-04-06  3714  				usb-role-switch;
9ee402ccfeb163 Bhupesh Sharma                   2023-05-02  3715  
0b059979090d72 Souradeep Chowdhury              2022-04-06  3716  				port {
0b059979090d72 Souradeep Chowdhury              2022-04-06  3717  					usb2_role_switch: endpoint {
0b059979090d72 Souradeep Chowdhury              2022-04-06  3718  						remote-endpoint = <&eud_ep>;
0b059979090d72 Souradeep Chowdhury              2022-04-06  3719  					};
0b059979090d72 Souradeep Chowdhury              2022-04-06  3720  				};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3721  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3722  		};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3723  
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3724  		qspi: spi@88dc000 {
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3725  			compatible = "qcom,sc7280-qspi", "qcom,qspi-v1";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3726  			reg = <0 0x088dc000 0 0x1000>;
cc406006126e89 Vijaya Krishna Nivarthi          2023-04-24  3727  			iommus = <&apps_smmu 0x20 0x0>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3728  			#address-cells = <1>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3729  			#size-cells = <0>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3730  			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3731  			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3732  				 <&gcc GCC_QSPI_CORE_CLK>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3733  			clock-names = "iface", "core";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3734  			interconnects = <&gem_noc MASTER_APPSS_PROC 0
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3735  					&cnoc2 SLAVE_QSPI_0 0>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3736  			interconnect-names = "qspi-config";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3737  			power-domains = <&rpmhpd SC7280_CX>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3738  			operating-points-v2 = <&qspi_opp_table>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3739  			status = "disabled";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3740  		};
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3741  
3658e411efcbb4 Luca Weiss                       2023-12-08  3742  		remoteproc_adsp: remoteproc@3700000 {
3658e411efcbb4 Luca Weiss                       2023-12-08  3743  			compatible = "qcom,sc7280-adsp-pas";
3658e411efcbb4 Luca Weiss                       2023-12-08  3744  			reg = <0 0x03700000 0 0x100>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3745  
f011688162ec4c Luca Weiss                       2024-02-19  3746  			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
3658e411efcbb4 Luca Weiss                       2023-12-08  3747  					      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
3658e411efcbb4 Luca Weiss                       2023-12-08  3748  					      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
3658e411efcbb4 Luca Weiss                       2023-12-08  3749  					      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
3658e411efcbb4 Luca Weiss                       2023-12-08  3750  					      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
3658e411efcbb4 Luca Weiss                       2023-12-08  3751  					      <&adsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3752  			interrupt-names = "wdog", "fatal", "ready", "handover",
3658e411efcbb4 Luca Weiss                       2023-12-08  3753  					  "stop-ack", "shutdown-ack";
3658e411efcbb4 Luca Weiss                       2023-12-08  3754  
3658e411efcbb4 Luca Weiss                       2023-12-08  3755  			clocks = <&rpmhcc RPMH_CXO_CLK>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3756  			clock-names = "xo";
3658e411efcbb4 Luca Weiss                       2023-12-08  3757  
3658e411efcbb4 Luca Weiss                       2023-12-08  3758  			power-domains = <&rpmhpd SC7280_LCX>,
3658e411efcbb4 Luca Weiss                       2023-12-08  3759  					<&rpmhpd SC7280_LMX>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3760  			power-domain-names = "lcx", "lmx";
3658e411efcbb4 Luca Weiss                       2023-12-08  3761  
3658e411efcbb4 Luca Weiss                       2023-12-08  3762  			memory-region = <&adsp_mem>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3763  
3658e411efcbb4 Luca Weiss                       2023-12-08  3764  			qcom,qmp = <&aoss_qmp>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3765  
3658e411efcbb4 Luca Weiss                       2023-12-08  3766  			qcom,smem-states = <&adsp_smp2p_out 0>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3767  			qcom,smem-state-names = "stop";
3658e411efcbb4 Luca Weiss                       2023-12-08  3768  
3658e411efcbb4 Luca Weiss                       2023-12-08  3769  			status = "disabled";
3658e411efcbb4 Luca Weiss                       2023-12-08  3770  
3658e411efcbb4 Luca Weiss                       2023-12-08  3771  			glink-edge {
3658e411efcbb4 Luca Weiss                       2023-12-08  3772  				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
3658e411efcbb4 Luca Weiss                       2023-12-08  3773  							     IPCC_MPROC_SIGNAL_GLINK_QMP
3658e411efcbb4 Luca Weiss                       2023-12-08  3774  							     IRQ_TYPE_EDGE_RISING>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3775  
3658e411efcbb4 Luca Weiss                       2023-12-08  3776  				mboxes = <&ipcc IPCC_CLIENT_LPASS
3658e411efcbb4 Luca Weiss                       2023-12-08  3777  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3778  
3658e411efcbb4 Luca Weiss                       2023-12-08  3779  				label = "lpass";
3658e411efcbb4 Luca Weiss                       2023-12-08  3780  				qcom,remote-pid = <2>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3781  
f44da5d8722de3 Luca Weiss                       2024-05-10  3782  				apr {
f44da5d8722de3 Luca Weiss                       2024-05-10  3783  					compatible = "qcom,apr-v2";
f44da5d8722de3 Luca Weiss                       2024-05-10  3784  					qcom,glink-channels = "apr_audio_svc";
f44da5d8722de3 Luca Weiss                       2024-05-10  3785  					qcom,domain = <APR_DOMAIN_ADSP>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3786  					#address-cells = <1>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3787  					#size-cells = <0>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3788  
f44da5d8722de3 Luca Weiss                       2024-05-10  3789  					service@3 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3790  						reg = <APR_SVC_ADSP_CORE>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3791  						compatible = "qcom,q6core";
f44da5d8722de3 Luca Weiss                       2024-05-10  3792  						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
f44da5d8722de3 Luca Weiss                       2024-05-10  3793  					};
f44da5d8722de3 Luca Weiss                       2024-05-10  3794  
f44da5d8722de3 Luca Weiss                       2024-05-10  3795  					q6afe: service@4 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3796  						compatible = "qcom,q6afe";
f44da5d8722de3 Luca Weiss                       2024-05-10  3797  						reg = <APR_SVC_AFE>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3798  						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
f44da5d8722de3 Luca Weiss                       2024-05-10  3799  
f44da5d8722de3 Luca Weiss                       2024-05-10  3800  						q6afedai: dais {
f44da5d8722de3 Luca Weiss                       2024-05-10  3801  							compatible = "qcom,q6afe-dais";
f44da5d8722de3 Luca Weiss                       2024-05-10  3802  							#address-cells = <1>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3803  							#size-cells = <0>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3804  							#sound-dai-cells = <1>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3805  						};
f44da5d8722de3 Luca Weiss                       2024-05-10  3806  
f44da5d8722de3 Luca Weiss                       2024-05-10  3807  						q6afecc: clock-controller {
f44da5d8722de3 Luca Weiss                       2024-05-10  3808  							compatible = "qcom,q6afe-clocks";
f44da5d8722de3 Luca Weiss                       2024-05-10  3809  							#clock-cells = <2>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3810  						};
f44da5d8722de3 Luca Weiss                       2024-05-10  3811  					};
f44da5d8722de3 Luca Weiss                       2024-05-10  3812  
f44da5d8722de3 Luca Weiss                       2024-05-10  3813  					q6asm: service@7 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3814  						compatible = "qcom,q6asm";
f44da5d8722de3 Luca Weiss                       2024-05-10  3815  						reg = <APR_SVC_ASM>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3816  						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
f44da5d8722de3 Luca Weiss                       2024-05-10  3817  
f44da5d8722de3 Luca Weiss                       2024-05-10  3818  						q6asmdai: dais {
f44da5d8722de3 Luca Weiss                       2024-05-10  3819  							compatible = "qcom,q6asm-dais";
f44da5d8722de3 Luca Weiss                       2024-05-10  3820  							#address-cells = <1>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3821  							#size-cells = <0>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3822  							#sound-dai-cells = <1>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3823  							iommus = <&apps_smmu 0x1801 0x0>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3824  
f44da5d8722de3 Luca Weiss                       2024-05-10  3825  							dai@0 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3826  								reg = <0>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3827  							};
f44da5d8722de3 Luca Weiss                       2024-05-10  3828  
f44da5d8722de3 Luca Weiss                       2024-05-10  3829  							dai@1 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3830  								reg = <1>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3831  							};
f44da5d8722de3 Luca Weiss                       2024-05-10  3832  
f44da5d8722de3 Luca Weiss                       2024-05-10  3833  							dai@2 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3834  								reg = <2>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3835  							};
f44da5d8722de3 Luca Weiss                       2024-05-10  3836  						};
f44da5d8722de3 Luca Weiss                       2024-05-10  3837  					};
f44da5d8722de3 Luca Weiss                       2024-05-10  3838  
f44da5d8722de3 Luca Weiss                       2024-05-10  3839  					q6adm: service@8 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3840  						compatible = "qcom,q6adm";
f44da5d8722de3 Luca Weiss                       2024-05-10  3841  						reg = <APR_SVC_ADM>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3842  						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
f44da5d8722de3 Luca Weiss                       2024-05-10  3843  
f44da5d8722de3 Luca Weiss                       2024-05-10  3844  						q6routing: routing {
f44da5d8722de3 Luca Weiss                       2024-05-10  3845  							compatible = "qcom,q6adm-routing";
f44da5d8722de3 Luca Weiss                       2024-05-10  3846  							#sound-dai-cells = <0>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3847  						};
f44da5d8722de3 Luca Weiss                       2024-05-10  3848  					};
f44da5d8722de3 Luca Weiss                       2024-05-10  3849  				};
f44da5d8722de3 Luca Weiss                       2024-05-10  3850  
3658e411efcbb4 Luca Weiss                       2023-12-08  3851  				fastrpc {
3658e411efcbb4 Luca Weiss                       2023-12-08  3852  					compatible = "qcom,fastrpc";
3658e411efcbb4 Luca Weiss                       2023-12-08  3853  					qcom,glink-channels = "fastrpcglink-apps-dsp";
3658e411efcbb4 Luca Weiss                       2023-12-08  3854  					label = "adsp";
3658e411efcbb4 Luca Weiss                       2023-12-08  3855  					qcom,non-secure-domain;
3658e411efcbb4 Luca Weiss                       2023-12-08  3856  					#address-cells = <1>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3857  					#size-cells = <0>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3858  
3658e411efcbb4 Luca Weiss                       2023-12-08  3859  					compute-cb@3 {
3658e411efcbb4 Luca Weiss                       2023-12-08  3860  						compatible = "qcom,fastrpc-compute-cb";
3658e411efcbb4 Luca Weiss                       2023-12-08  3861  						reg = <3>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3862  						iommus = <&apps_smmu 0x1803 0x0>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3863  					};
3658e411efcbb4 Luca Weiss                       2023-12-08  3864  
3658e411efcbb4 Luca Weiss                       2023-12-08  3865  					compute-cb@4 {
3658e411efcbb4 Luca Weiss                       2023-12-08  3866  						compatible = "qcom,fastrpc-compute-cb";
3658e411efcbb4 Luca Weiss                       2023-12-08  3867  						reg = <4>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3868  						iommus = <&apps_smmu 0x1804 0x0>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3869  					};
3658e411efcbb4 Luca Weiss                       2023-12-08  3870  
3658e411efcbb4 Luca Weiss                       2023-12-08  3871  					compute-cb@5 {
3658e411efcbb4 Luca Weiss                       2023-12-08  3872  						compatible = "qcom,fastrpc-compute-cb";
3658e411efcbb4 Luca Weiss                       2023-12-08  3873  						reg = <5>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3874  						iommus = <&apps_smmu 0x1805 0x0>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3875  					};
3658e411efcbb4 Luca Weiss                       2023-12-08  3876  				};
3658e411efcbb4 Luca Weiss                       2023-12-08  3877  			};
3658e411efcbb4 Luca Weiss                       2023-12-08  3878  		};
3658e411efcbb4 Luca Weiss                       2023-12-08  3879  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3880  		remoteproc_wpss: remoteproc@8a00000 {
0bcbf092560cc1 Luca Weiss                       2023-12-08  3881  			compatible = "qcom,sc7280-wpss-pas";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3882  			reg = <0 0x08a00000 0 0x10000>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3883  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3884  			interrupts-extended = <&intc GIC_SPI 587 IRQ_TYPE_EDGE_RISING>,
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3885  					      <&wpss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3886  					      <&wpss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3887  					      <&wpss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3888  					      <&wpss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3889  					      <&wpss_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3890  			interrupt-names = "wdog", "fatal", "ready", "handover",
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3891  					  "stop-ack", "shutdown-ack";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3892  
0bcbf092560cc1 Luca Weiss                       2023-12-08  3893  			clocks = <&rpmhcc RPMH_CXO_CLK>;
0bcbf092560cc1 Luca Weiss                       2023-12-08  3894  			clock-names = "xo";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3895  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3896  			power-domains = <&rpmhpd SC7280_CX>,
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3897  					<&rpmhpd SC7280_MX>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3898  			power-domain-names = "cx", "mx";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3899  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3900  			memory-region = <&wpss_mem>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3901  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3902  			qcom,qmp = <&aoss_qmp>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3903  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3904  			qcom,smem-states = <&wpss_smp2p_out 0>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3905  			qcom,smem-state-names = "stop";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3906  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3907  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3908  			status = "disabled";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3909  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3910  			glink-edge {
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3911  				interrupts-extended = <&ipcc IPCC_CLIENT_WPSS
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3912  							     IPCC_MPROC_SIGNAL_GLINK_QMP
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3913  							     IRQ_TYPE_EDGE_RISING>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3914  				mboxes = <&ipcc IPCC_CLIENT_WPSS
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3915  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3916  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3917  				label = "wpss";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3918  				qcom,remote-pid = <13>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3919  			};
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3920  		};
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3921  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3922  		pmu@9091000 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3923  			compatible = "qcom,sc7280-llcc-bwmon";
94ca994d7e932c Konrad Dybcio                    2023-01-02  3924  			reg = <0 0x09091000 0 0x1000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3925  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3926  			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3927  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3928  			interconnects = <&mc_virt MASTER_LLCC 3 &mc_virt SLAVE_EBI1 3>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3929  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3930  			operating-points-v2 = <&llcc_bwmon_opp_table>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3931  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3932  			llcc_bwmon_opp_table: opp-table {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3933  				compatible = "operating-points-v2";
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3934  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3935  				opp-0 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3936  					opp-peak-kBps = <800000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3937  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3938  				opp-1 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3939  					opp-peak-kBps = <1804000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3940  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3941  				opp-2 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3942  					opp-peak-kBps = <2188000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3943  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3944  				opp-3 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3945  					opp-peak-kBps = <3072000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3946  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3947  				opp-4 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3948  					opp-peak-kBps = <4068000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3949  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3950  				opp-5 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3951  					opp-peak-kBps = <6220000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3952  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3953  				opp-6 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3954  					opp-peak-kBps = <6832000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3955  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3956  				opp-7 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3957  					opp-peak-kBps = <8532000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3958  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3959  			};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3960  		};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3961  
b626ac159e5e2c Krzysztof Kozlowski              2022-09-08  3962  		pmu@90b6400 {
bad26511c4cb54 Konrad Dybcio                    2023-03-15  3963  			compatible = "qcom,sc7280-cpu-bwmon", "qcom,sdm845-bwmon";
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3964  			reg = <0 0x090b6400 0 0x600>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3965  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3966  			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3967  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3968  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &gem_noc SLAVE_LLCC 3>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3969  			operating-points-v2 = <&cpu_bwmon_opp_table>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3970  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3971  			cpu_bwmon_opp_table: opp-table {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3972  				compatible = "operating-points-v2";
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3973  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3974  				opp-0 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3975  					opp-peak-kBps = <2400000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3976  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3977  				opp-1 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3978  					opp-peak-kBps = <4800000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3979  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3980  				opp-2 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3981  					opp-peak-kBps = <7456000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3982  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3983  				opp-3 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3984  					opp-peak-kBps = <9600000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3985  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3986  				opp-4 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3987  					opp-peak-kBps = <12896000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3988  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3989  				opp-5 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3990  					opp-peak-kBps = <14928000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3991  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3992  				opp-6 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3993  					opp-peak-kBps = <17056000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3994  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3995  			};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3996  		};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  3997  
297e6e38320f32 Odelu Kukatla                    2021-04-27  3998  		dc_noc: interconnect@90e0000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  3999  			reg = <0 0x090e0000 0 0x5080>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4000  			compatible = "qcom,sc7280-dc-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  4001  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4002  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4003  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  4004  
297e6e38320f32 Odelu Kukatla                    2021-04-27  4005  		gem_noc: interconnect@9100000 {
94ca994d7e932c Konrad Dybcio                    2023-01-02  4006  			reg = <0 0x09100000 0 0xe2200>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4007  			compatible = "qcom,sc7280-gem-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  4008  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4009  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4010  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  4011  
dac519cdfc90d6 Shivnandan Kumar                 2024-09-24 @4012  		cpucp_mbox: mailbox@17430000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
