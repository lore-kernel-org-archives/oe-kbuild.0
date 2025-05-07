Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F348A1FDA8E
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 06:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746598046; cv=none; b=QdBNQLNvirxOwjjPDZWL6E/w0A3w2ohdY7a8jvlrelHSIYVqMwiMJjN1h3TET/HLlXcrXy1wyMdZBZeMFAQp48GTKqGA3FLW9PF4UF4gngzqIpOenBujXaS3E61/xgwG3+kzjPfsqAVvTrcZQAdmgmm+NHOnYta2ZRcPbHcl92g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746598046; c=relaxed/simple;
	bh=qOk5f2Ex78kTXgCI+HLLZzYYY+n3Nh70MyzvZP/byqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CTNlfjiD856QVgsbeiqRkKXiWAymPzmEuGly86E399rOvBqvwMDc8SHADt0fnZha5QLHXkKftks00dRI3RSezkQvG3+lffX9/mgqU6A1aab95l952BgXKXaye4xRr1ukoKSDUHaubYyfLhJyOEF+4POKVba/zU7j9GvQ+QUTDwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJhfl6WN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJhfl6WN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746598029; x=1778134029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qOk5f2Ex78kTXgCI+HLLZzYYY+n3Nh70MyzvZP/byqI=;
  b=iJhfl6WNxk6sYpGW8SrILIk661eCboO1EUaijlhPdXQDGCgq2TxiJPiA
   NreQYVfBAOiQqDMTHGK47S2HREoUpqe4p+xnG7WccgQWXa1DMh4bArKUk
   vJGkOfg9cquIQxyEsKUFRr1vbIgrjCg8L1gy3e9lKty90aAh5z9kmrjAI
   rShGjWeYJ6+wPK4dG0uXw9JkV+hqtlQrWuyHcPO7hIbmnK9LpKS/jCatm
   PPeEha1qovlEu9sbvuZdC9R9lB8Y9XDTUFQWgXCZrwZCUAJ+pNY3yrHmW
   W5tVSQrdd3umIc8SduVORe/jJLujvTtef+n5O/FFlMjn4mlKlUSBp2jcl
   g==;
X-CSE-ConnectionGUID: foUkwB71SZCKpr9gCavZwA==
X-CSE-MsgGUID: mhuFDQuVRhaZssjr+jr1QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48316396"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48316396"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:07:07 -0700
X-CSE-ConnectionGUID: b+hWb3QTQqKAyUVp1w+FwA==
X-CSE-MsgGUID: XJqnEQqKTbSizrOUlrRTwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136370579"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 May 2025 23:07:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXvr-00079P-04;
	Wed, 07 May 2025 06:07:03 +0000
Date: Wed, 7 May 2025 14:06:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
Message-ID: <202505071313.uOSsUY38-lkp@intel.com>
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
In-Reply-To: <20250429092430.21477-6-quic_pkumpatl@quicinc.com>
References: <20250429092430.21477-6-quic_pkumpatl@quicinc.com>
TO: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: cros-qcom-dts-watchers@chromium.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: kernel@oss.qualcomm.com
CC: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
CC: Prasad Kumpatla <quic_pkumpatl@quicinc.com>

Hi Prasad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 33035b665157558254b3c21c3f049fd728e72368]

url:    https://github.com/intel-lab-lkp/linux/commits/Prasad-Kumpatla/arm64-dts-qcom-qcs6490-audioreach-Add-gpr-node/20250429-172836
base:   33035b665157558254b3c21c3f049fd728e72368
patch link:    https://lore.kernel.org/r/20250429092430.21477-6-quic_pkumpatl%40quicinc.com
patch subject: [PATCH v2 5/7] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-002-20250430 (https://download.01.org/0day-ci/archive/20250507/202505071313.uOSsUY38-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071313.uOSsUY38-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505071313.uOSsUY38-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4825.26-4898.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sc7280.dtsi:6400.15-6401.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4106.10-4116.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +6400 arch/arm64/boot/dts/qcom/sc7280.dtsi

7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    32  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    33  / {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    34  	interrupt-parent = <&intc>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    35  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    36  	#address-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    37  	#size-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    38  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    39  	chosen { };
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    40  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13    41  	aliases {
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    42  		i2c0 = &i2c0;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    43  		i2c1 = &i2c1;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    44  		i2c2 = &i2c2;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    45  		i2c3 = &i2c3;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    46  		i2c4 = &i2c4;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    47  		i2c5 = &i2c5;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    48  		i2c6 = &i2c6;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    49  		i2c7 = &i2c7;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    50  		i2c8 = &i2c8;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    51  		i2c9 = &i2c9;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    52  		i2c10 = &i2c10;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    53  		i2c11 = &i2c11;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    54  		i2c12 = &i2c12;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    55  		i2c13 = &i2c13;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    56  		i2c14 = &i2c14;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    57  		i2c15 = &i2c15;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13    58  		mmc1 = &sdhc_1;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13    59  		mmc2 = &sdhc_2;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    60  		spi0 = &spi0;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    61  		spi1 = &spi1;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    62  		spi2 = &spi2;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    63  		spi3 = &spi3;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    64  		spi4 = &spi4;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    65  		spi5 = &spi5;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    66  		spi6 = &spi6;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    67  		spi7 = &spi7;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    68  		spi8 = &spi8;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    69  		spi9 = &spi9;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    70  		spi10 = &spi10;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    71  		spi11 = &spi11;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    72  		spi12 = &spi12;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    73  		spi13 = &spi13;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    74  		spi14 = &spi14;
5f65408d9bfcc4 Rajesh Patil                     2021-09-23    75  		spi15 = &spi15;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13    76  	};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13    77  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    78  	clocks {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    79  		xo_board: xo-board {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    80  			compatible = "fixed-clock";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    81  			clock-frequency = <76800000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    82  			#clock-cells = <0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    83  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    84  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    85  		sleep_clk: sleep-clk {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    86  			compatible = "fixed-clock";
f6ccdca14eac54 Dmitry Baryshkov                 2024-12-24    87  			clock-frequency = <32764>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    88  			#clock-cells = <0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    89  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    90  	};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11    91  
3450bb5b9570a2 Maulik Shah                      2021-03-11    92  	reserved-memory {
3450bb5b9570a2 Maulik Shah                      2021-03-11    93  		#address-cells = <2>;
3450bb5b9570a2 Maulik Shah                      2021-03-11    94  		#size-cells = <2>;
3450bb5b9570a2 Maulik Shah                      2021-03-11    95  		ranges;
3450bb5b9570a2 Maulik Shah                      2021-03-11    96  
6615713c10c974 Luca Weiss                       2023-12-08    97  		wlan_ce_mem: wlan-ce@4cd000 {
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06    98  			no-map;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06    99  			reg = <0x0 0x004cd000 0x0 0x1000>;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06   100  		};
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06   101  
6615713c10c974 Luca Weiss                       2023-12-08   102  		hyp_mem: hyp@80000000 {
eca7d3a366b3ab Sibi Sankar                      2021-09-17   103  			reg = <0x0 0x80000000 0x0 0x600000>;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   104  			no-map;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   105  		};
eca7d3a366b3ab Sibi Sankar                      2021-09-17   106  
6615713c10c974 Luca Weiss                       2023-12-08   107  		xbl_mem: xbl@80600000 {
eca7d3a366b3ab Sibi Sankar                      2021-09-17   108  			reg = <0x0 0x80600000 0x0 0x200000>;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   109  			no-map;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   110  		};
eca7d3a366b3ab Sibi Sankar                      2021-09-17   111  
6615713c10c974 Luca Weiss                       2023-12-08   112  		aop_mem: aop@80800000 {
e9d7397467885a Maulik Shah                      2021-03-11   113  			reg = <0x0 0x80800000 0x0 0x60000>;
e9d7397467885a Maulik Shah                      2021-03-11   114  			no-map;
e9d7397467885a Maulik Shah                      2021-03-11   115  		};
e9d7397467885a Maulik Shah                      2021-03-11   116  
6615713c10c974 Luca Weiss                       2023-12-08   117  		aop_cmd_db_mem: aop-cmd-db@80860000 {
3450bb5b9570a2 Maulik Shah                      2021-03-11   118  			reg = <0x0 0x80860000 0x0 0x20000>;
3450bb5b9570a2 Maulik Shah                      2021-03-11   119  			compatible = "qcom,cmd-db";
3450bb5b9570a2 Maulik Shah                      2021-03-11   120  			no-map;
3450bb5b9570a2 Maulik Shah                      2021-03-11   121  		};
e9d7397467885a Maulik Shah                      2021-03-11   122  
6615713c10c974 Luca Weiss                       2023-12-08   123  		reserved_xbl_uefi_log: xbl-uefi-res@80880000 {
eca7d3a366b3ab Sibi Sankar                      2021-09-17   124  			reg = <0x0 0x80884000 0x0 0x10000>;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   125  			no-map;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   126  		};
eca7d3a366b3ab Sibi Sankar                      2021-09-17   127  
6615713c10c974 Luca Weiss                       2023-12-08   128  		sec_apps_mem: sec-apps@808ff000 {
eca7d3a366b3ab Sibi Sankar                      2021-09-17   129  			reg = <0x0 0x808ff000 0x0 0x1000>;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   130  			no-map;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   131  		};
eca7d3a366b3ab Sibi Sankar                      2021-09-17   132  
6615713c10c974 Luca Weiss                       2023-12-08   133  		smem_mem: smem@80900000 {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   134  			reg = <0x0 0x80900000 0x0 0x200000>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   135  			no-map;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   136  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   137  
6615713c10c974 Luca Weiss                       2023-12-08   138  		cpucp_mem: cpucp@80b00000 {
e9d7397467885a Maulik Shah                      2021-03-11   139  			no-map;
e9d7397467885a Maulik Shah                      2021-03-11   140  			reg = <0x0 0x80b00000 0x0 0x100000>;
e9d7397467885a Maulik Shah                      2021-03-11   141  		};
fc4f0273d4fba2 Alex Elder                       2021-08-04   142  
6615713c10c974 Luca Weiss                       2023-12-08   143  		wlan_fw_mem: wlan-fw@80c00000 {
eca7d3a366b3ab Sibi Sankar                      2021-09-17   144  			reg = <0x0 0x80c00000 0x0 0xc00000>;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   145  			no-map;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   146  		};
eca7d3a366b3ab Sibi Sankar                      2021-09-17   147  
3658e411efcbb4 Luca Weiss                       2023-12-08   148  		adsp_mem: adsp@86700000 {
3658e411efcbb4 Luca Weiss                       2023-12-08   149  			reg = <0x0 0x86700000 0x0 0x2800000>;
3658e411efcbb4 Luca Weiss                       2023-12-08   150  			no-map;
3658e411efcbb4 Luca Weiss                       2023-12-08   151  		};
3658e411efcbb4 Luca Weiss                       2023-12-08   152  
6615713c10c974 Luca Weiss                       2023-12-08   153  		video_mem: video@8b200000 {
37613aee217928 Dikshita Agarwal                 2021-10-26   154  			reg = <0x0 0x8b200000 0x0 0x500000>;
37613aee217928 Dikshita Agarwal                 2021-10-26   155  			no-map;
37613aee217928 Dikshita Agarwal                 2021-10-26   156  		};
37613aee217928 Dikshita Agarwal                 2021-10-26   157  
df62402e5ff9df Luca Weiss                       2023-12-08   158  		cdsp_mem: cdsp@88f00000 {
df62402e5ff9df Luca Weiss                       2023-12-08   159  			reg = <0x0 0x88f00000 0x0 0x1e00000>;
df62402e5ff9df Luca Weiss                       2023-12-08   160  			no-map;
df62402e5ff9df Luca Weiss                       2023-12-08   161  		};
df62402e5ff9df Luca Weiss                       2023-12-08   162  
6615713c10c974 Luca Weiss                       2023-12-08   163  		ipa_fw_mem: ipa-fw@8b700000 {
fc4f0273d4fba2 Alex Elder                       2021-08-04   164  			reg = <0 0x8b700000 0 0x10000>;
fc4f0273d4fba2 Alex Elder                       2021-08-04   165  			no-map;
fc4f0273d4fba2 Alex Elder                       2021-08-04   166  		};
eca7d3a366b3ab Sibi Sankar                      2021-09-17   167  
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20   168  		gpu_zap_mem: zap@8b71a000 {
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20   169  			reg = <0 0x8b71a000 0 0x2000>;
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20   170  			no-map;
5037ca35ce42a9 Luca Weiss                       2023-12-08   171  		};
5037ca35ce42a9 Luca Weiss                       2023-12-08   172  
5037ca35ce42a9 Luca Weiss                       2023-12-08   173  		mpss_mem: mpss@8b800000 {
5037ca35ce42a9 Luca Weiss                       2023-12-08   174  			reg = <0x0 0x8b800000 0x0 0xf600000>;
5037ca35ce42a9 Luca Weiss                       2023-12-08   175  			no-map;
5037ca35ce42a9 Luca Weiss                       2023-12-08   176  		};
5037ca35ce42a9 Luca Weiss                       2023-12-08   177  
5037ca35ce42a9 Luca Weiss                       2023-12-08   178  		wpss_mem: wpss@9ae00000 {
5037ca35ce42a9 Luca Weiss                       2023-12-08   179  			reg = <0x0 0x9ae00000 0x0 0x1900000>;
5037ca35ce42a9 Luca Weiss                       2023-12-08   180  			no-map;
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20   181  		};
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20   182  
6615713c10c974 Luca Weiss                       2023-12-08   183  		rmtfs_mem: rmtfs@9c900000 {
eca7d3a366b3ab Sibi Sankar                      2021-09-17   184  			compatible = "qcom,rmtfs-mem";
eca7d3a366b3ab Sibi Sankar                      2021-09-17   185  			reg = <0x0 0x9c900000 0x0 0x280000>;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   186  			no-map;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   187  
eca7d3a366b3ab Sibi Sankar                      2021-09-17   188  			qcom,client-id = <1>;
018c949b32df9f Luca Weiss                       2023-08-18   189  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
eca7d3a366b3ab Sibi Sankar                      2021-09-17   190  		};
3450bb5b9570a2 Maulik Shah                      2021-03-11   191  	};
3450bb5b9570a2 Maulik Shah                      2021-03-11   192  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   193  	cpus {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   194  		#address-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   195  		#size-cells = <0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   196  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   197  		cpu0: cpu@0 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   198  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   199  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   200  			reg = <0x0 0x0>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   201  			clocks = <&cpufreq_hw 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   202  			enable-method = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   203  			power-domains = <&cpu_pd0>;
7925ca85e95619 Maulik Shah                      2023-07-03   204  			power-domain-names = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   205  			next-level-cache = <&l2_0>;
1e8853c698276d Sibi Sankar                      2022-02-09   206  			operating-points-v2 = <&cpu0_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   207  			capacity-dmips-mhz = <1024>;
942bf463dec369 Ankit Sharma                     2023-11-03   208  			dynamic-power-coefficient = <100>;
1e8853c698276d Sibi Sankar                      2022-02-09   209  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   210  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   211  			qcom,freq-domain = <&cpufreq_hw 0>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   212  			#cooling-cells = <2>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   213  			l2_0: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   214  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   215  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   216  				cache-unified;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   217  				next-level-cache = <&l3_0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   218  				l3_0: l3-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   219  					compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   220  					cache-level = <3>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   221  					cache-unified;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   222  				};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   223  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   224  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   225  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   226  		cpu1: cpu@100 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   227  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   228  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   229  			reg = <0x0 0x100>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   230  			clocks = <&cpufreq_hw 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   231  			enable-method = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   232  			power-domains = <&cpu_pd1>;
7925ca85e95619 Maulik Shah                      2023-07-03   233  			power-domain-names = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   234  			next-level-cache = <&l2_100>;
1e8853c698276d Sibi Sankar                      2022-02-09   235  			operating-points-v2 = <&cpu0_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   236  			capacity-dmips-mhz = <1024>;
942bf463dec369 Ankit Sharma                     2023-11-03   237  			dynamic-power-coefficient = <100>;
1e8853c698276d Sibi Sankar                      2022-02-09   238  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   239  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   240  			qcom,freq-domain = <&cpufreq_hw 0>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   241  			#cooling-cells = <2>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   242  			l2_100: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   243  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   244  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   245  				cache-unified;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   246  				next-level-cache = <&l3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   247  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   248  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   249  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   250  		cpu2: cpu@200 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   251  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   252  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   253  			reg = <0x0 0x200>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   254  			clocks = <&cpufreq_hw 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   255  			enable-method = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   256  			power-domains = <&cpu_pd2>;
7925ca85e95619 Maulik Shah                      2023-07-03   257  			power-domain-names = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   258  			next-level-cache = <&l2_200>;
1e8853c698276d Sibi Sankar                      2022-02-09   259  			operating-points-v2 = <&cpu0_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   260  			capacity-dmips-mhz = <1024>;
942bf463dec369 Ankit Sharma                     2023-11-03   261  			dynamic-power-coefficient = <100>;
1e8853c698276d Sibi Sankar                      2022-02-09   262  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   263  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   264  			qcom,freq-domain = <&cpufreq_hw 0>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   265  			#cooling-cells = <2>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   266  			l2_200: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   267  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   268  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   269  				cache-unified;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   270  				next-level-cache = <&l3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   271  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   272  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   273  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   274  		cpu3: cpu@300 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   275  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   276  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   277  			reg = <0x0 0x300>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   278  			clocks = <&cpufreq_hw 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   279  			enable-method = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   280  			power-domains = <&cpu_pd3>;
7925ca85e95619 Maulik Shah                      2023-07-03   281  			power-domain-names = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   282  			next-level-cache = <&l2_300>;
1e8853c698276d Sibi Sankar                      2022-02-09   283  			operating-points-v2 = <&cpu0_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   284  			capacity-dmips-mhz = <1024>;
942bf463dec369 Ankit Sharma                     2023-11-03   285  			dynamic-power-coefficient = <100>;
1e8853c698276d Sibi Sankar                      2022-02-09   286  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   287  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   288  			qcom,freq-domain = <&cpufreq_hw 0>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   289  			#cooling-cells = <2>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   290  			l2_300: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   291  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   292  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   293  				cache-unified;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   294  				next-level-cache = <&l3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   295  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   296  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   297  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   298  		cpu4: cpu@400 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   299  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   300  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   301  			reg = <0x0 0x400>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   302  			clocks = <&cpufreq_hw 1>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   303  			enable-method = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   304  			power-domains = <&cpu_pd4>;
7925ca85e95619 Maulik Shah                      2023-07-03   305  			power-domain-names = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   306  			next-level-cache = <&l2_400>;
1e8853c698276d Sibi Sankar                      2022-02-09   307  			operating-points-v2 = <&cpu4_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   308  			capacity-dmips-mhz = <1946>;
942bf463dec369 Ankit Sharma                     2023-11-03   309  			dynamic-power-coefficient = <520>;
1e8853c698276d Sibi Sankar                      2022-02-09   310  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   311  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   312  			qcom,freq-domain = <&cpufreq_hw 1>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   313  			#cooling-cells = <2>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   314  			l2_400: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   315  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   316  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   317  				cache-unified;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   318  				next-level-cache = <&l3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   319  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   320  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   321  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   322  		cpu5: cpu@500 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   323  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   324  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   325  			reg = <0x0 0x500>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   326  			clocks = <&cpufreq_hw 1>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   327  			enable-method = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   328  			power-domains = <&cpu_pd5>;
7925ca85e95619 Maulik Shah                      2023-07-03   329  			power-domain-names = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   330  			next-level-cache = <&l2_500>;
1e8853c698276d Sibi Sankar                      2022-02-09   331  			operating-points-v2 = <&cpu4_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   332  			capacity-dmips-mhz = <1946>;
942bf463dec369 Ankit Sharma                     2023-11-03   333  			dynamic-power-coefficient = <520>;
1e8853c698276d Sibi Sankar                      2022-02-09   334  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   335  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   336  			qcom,freq-domain = <&cpufreq_hw 1>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   337  			#cooling-cells = <2>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   338  			l2_500: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   339  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   340  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   341  				cache-unified;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   342  				next-level-cache = <&l3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   343  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   344  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   345  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   346  		cpu6: cpu@600 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   347  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   348  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   349  			reg = <0x0 0x600>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   350  			clocks = <&cpufreq_hw 1>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   351  			enable-method = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   352  			power-domains = <&cpu_pd6>;
7925ca85e95619 Maulik Shah                      2023-07-03   353  			power-domain-names = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   354  			next-level-cache = <&l2_600>;
1e8853c698276d Sibi Sankar                      2022-02-09   355  			operating-points-v2 = <&cpu4_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   356  			capacity-dmips-mhz = <1946>;
942bf463dec369 Ankit Sharma                     2023-11-03   357  			dynamic-power-coefficient = <520>;
1e8853c698276d Sibi Sankar                      2022-02-09   358  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   359  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
7dbd121a2c587c Taniya Das                       2021-04-10   360  			qcom,freq-domain = <&cpufreq_hw 1>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   361  			#cooling-cells = <2>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   362  			l2_600: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   363  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   364  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   365  				cache-unified;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   366  				next-level-cache = <&l3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   367  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   368  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   369  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   370  		cpu7: cpu@700 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   371  			device_type = "cpu";
9293c3e85a200d Rob Herring                      2022-12-07   372  			compatible = "qcom,kryo";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   373  			reg = <0x0 0x700>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15   374  			clocks = <&cpufreq_hw 2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   375  			enable-method = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   376  			power-domains = <&cpu_pd7>;
7925ca85e95619 Maulik Shah                      2023-07-03   377  			power-domain-names = "psci";
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   378  			next-level-cache = <&l2_700>;
1e8853c698276d Sibi Sankar                      2022-02-09   379  			operating-points-v2 = <&cpu7_opp_table>;
942bf463dec369 Ankit Sharma                     2023-11-03   380  			capacity-dmips-mhz = <1985>;
942bf463dec369 Ankit Sharma                     2023-11-03   381  			dynamic-power-coefficient = <552>;
1e8853c698276d Sibi Sankar                      2022-02-09   382  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
1e8853c698276d Sibi Sankar                      2022-02-09   383  					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
4cbb02fa76de4b Sibi Sankar                      2021-07-20   384  			qcom,freq-domain = <&cpufreq_hw 2>;
9ec1c5867c0269 Rajeshwari Ravindra Kamble       2021-05-07   385  			#cooling-cells = <2>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   386  			l2_700: l2-cache {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   387  				compatible = "cache";
9435294c6517dc Pierre Gondois                   2022-11-07   388  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski              2023-04-16   389  				cache-unified;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   390  				next-level-cache = <&l3_0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   391  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   392  		};
0ef5463c7a5648 Maulik Shah                      2021-03-11   393  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   394  		cpu-map {
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   395  			cluster0 {
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   396  				core0 {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   397  					cpu = <&cpu0>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   398  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   399  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   400  				core1 {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   401  					cpu = <&cpu1>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   402  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   403  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   404  				core2 {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   405  					cpu = <&cpu2>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   406  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   407  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   408  				core3 {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   409  					cpu = <&cpu3>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   410  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   411  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   412  				core4 {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   413  					cpu = <&cpu4>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   414  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   415  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   416  				core5 {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   417  					cpu = <&cpu5>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   418  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   419  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   420  				core6 {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   421  					cpu = <&cpu6>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   422  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   423  
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   424  				core7 {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   425  					cpu = <&cpu7>;
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   426  				};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   427  			};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   428  		};
ec04b0ebef7c5a Rajendra Nayak                   2021-08-25   429  
0ef5463c7a5648 Maulik Shah                      2021-03-11   430  		idle-states {
0ef5463c7a5648 Maulik Shah                      2021-03-11   431  			entry-method = "psci";
0ef5463c7a5648 Maulik Shah                      2021-03-11   432  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   433  			little_cpu_sleep_0: cpu-sleep-0-0 {
0ef5463c7a5648 Maulik Shah                      2021-03-11   434  				compatible = "arm,idle-state";
0ef5463c7a5648 Maulik Shah                      2021-03-11   435  				idle-state-name = "little-power-down";
0ef5463c7a5648 Maulik Shah                      2021-03-11   436  				arm,psci-suspend-param = <0x40000003>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   437  				entry-latency-us = <549>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   438  				exit-latency-us = <901>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   439  				min-residency-us = <1774>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   440  				local-timer-stop;
0ef5463c7a5648 Maulik Shah                      2021-03-11   441  			};
0ef5463c7a5648 Maulik Shah                      2021-03-11   442  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   443  			little_cpu_sleep_1: cpu-sleep-0-1 {
0ef5463c7a5648 Maulik Shah                      2021-03-11   444  				compatible = "arm,idle-state";
0ef5463c7a5648 Maulik Shah                      2021-03-11   445  				idle-state-name = "little-rail-power-down";
0ef5463c7a5648 Maulik Shah                      2021-03-11   446  				arm,psci-suspend-param = <0x40000004>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   447  				entry-latency-us = <702>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   448  				exit-latency-us = <915>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   449  				min-residency-us = <4001>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   450  				local-timer-stop;
0ef5463c7a5648 Maulik Shah                      2021-03-11   451  			};
0ef5463c7a5648 Maulik Shah                      2021-03-11   452  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   453  			big_cpu_sleep_0: cpu-sleep-1-0 {
0ef5463c7a5648 Maulik Shah                      2021-03-11   454  				compatible = "arm,idle-state";
0ef5463c7a5648 Maulik Shah                      2021-03-11   455  				idle-state-name = "big-power-down";
0ef5463c7a5648 Maulik Shah                      2021-03-11   456  				arm,psci-suspend-param = <0x40000003>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   457  				entry-latency-us = <523>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   458  				exit-latency-us = <1244>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   459  				min-residency-us = <2207>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   460  				local-timer-stop;
0ef5463c7a5648 Maulik Shah                      2021-03-11   461  			};
0ef5463c7a5648 Maulik Shah                      2021-03-11   462  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   463  			big_cpu_sleep_1: cpu-sleep-1-1 {
0ef5463c7a5648 Maulik Shah                      2021-03-11   464  				compatible = "arm,idle-state";
0ef5463c7a5648 Maulik Shah                      2021-03-11   465  				idle-state-name = "big-rail-power-down";
0ef5463c7a5648 Maulik Shah                      2021-03-11   466  				arm,psci-suspend-param = <0x40000004>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   467  				entry-latency-us = <526>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   468  				exit-latency-us = <1854>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   469  				min-residency-us = <5555>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   470  				local-timer-stop;
0ef5463c7a5648 Maulik Shah                      2021-03-11   471  			};
7925ca85e95619 Maulik Shah                      2023-07-03   472  		};
0ef5463c7a5648 Maulik Shah                      2021-03-11   473  
db5d137e81bcce Maulik Shah                      2024-01-09   474  		domain_idle_states: domain-idle-states {
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   475  			cluster_sleep_apss_off: cluster-sleep-0 {
7925ca85e95619 Maulik Shah                      2023-07-03   476  				compatible = "domain-idle-state";
db5d137e81bcce Maulik Shah                      2024-01-09   477  				arm,psci-suspend-param = <0x41000044>;
db5d137e81bcce Maulik Shah                      2024-01-09   478  				entry-latency-us = <2752>;
db5d137e81bcce Maulik Shah                      2024-01-09   479  				exit-latency-us = <3048>;
db5d137e81bcce Maulik Shah                      2024-01-09   480  				min-residency-us = <6118>;
db5d137e81bcce Maulik Shah                      2024-01-09   481  			};
db5d137e81bcce Maulik Shah                      2024-01-09   482  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   483  			cluster_sleep_cx_ret: cluster-sleep-1 {
db5d137e81bcce Maulik Shah                      2024-01-09   484  				compatible = "domain-idle-state";
db5d137e81bcce Maulik Shah                      2024-01-09   485  				arm,psci-suspend-param = <0x41001344>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   486  				entry-latency-us = <3263>;
db5d137e81bcce Maulik Shah                      2024-01-09   487  				exit-latency-us = <4562>;
db5d137e81bcce Maulik Shah                      2024-01-09   488  				min-residency-us = <8467>;
db5d137e81bcce Maulik Shah                      2024-01-09   489  			};
db5d137e81bcce Maulik Shah                      2024-01-09   490  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   491  			cluster_sleep_llcc_off: cluster-sleep-2 {
db5d137e81bcce Maulik Shah                      2024-01-09   492  				compatible = "domain-idle-state";
db5d137e81bcce Maulik Shah                      2024-01-09   493  				arm,psci-suspend-param = <0x4100b344>;
db5d137e81bcce Maulik Shah                      2024-01-09   494  				entry-latency-us = <3638>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   495  				exit-latency-us = <6562>;
db5d137e81bcce Maulik Shah                      2024-01-09   496  				min-residency-us = <9826>;
0ef5463c7a5648 Maulik Shah                      2021-03-11   497  			};
0ef5463c7a5648 Maulik Shah                      2021-03-11   498  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   499  	};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   500  
0e3e654696074b Krzysztof Kozlowski              2022-06-27   501  	cpu0_opp_table: opp-table-cpu0 {
1e8853c698276d Sibi Sankar                      2022-02-09   502  		compatible = "operating-points-v2";
1e8853c698276d Sibi Sankar                      2022-02-09   503  		opp-shared;
1e8853c698276d Sibi Sankar                      2022-02-09   504  
1e8853c698276d Sibi Sankar                      2022-02-09   505  		cpu0_opp_300mhz: opp-300000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   506  			opp-hz = /bits/ 64 <300000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   507  			opp-peak-kBps = <800000 9600000>;
1e8853c698276d Sibi Sankar                      2022-02-09   508  		};
1e8853c698276d Sibi Sankar                      2022-02-09   509  
1e8853c698276d Sibi Sankar                      2022-02-09   510  		cpu0_opp_691mhz: opp-691200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   511  			opp-hz = /bits/ 64 <691200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   512  			opp-peak-kBps = <800000 17817600>;
1e8853c698276d Sibi Sankar                      2022-02-09   513  		};
1e8853c698276d Sibi Sankar                      2022-02-09   514  
1e8853c698276d Sibi Sankar                      2022-02-09   515  		cpu0_opp_806mhz: opp-806400000 {
1e8853c698276d Sibi Sankar                      2022-02-09   516  			opp-hz = /bits/ 64 <806400000>;
1e8853c698276d Sibi Sankar                      2022-02-09   517  			opp-peak-kBps = <800000 20889600>;
1e8853c698276d Sibi Sankar                      2022-02-09   518  		};
1e8853c698276d Sibi Sankar                      2022-02-09   519  
1e8853c698276d Sibi Sankar                      2022-02-09   520  		cpu0_opp_941mhz: opp-940800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   521  			opp-hz = /bits/ 64 <940800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   522  			opp-peak-kBps = <1804000 24576000>;
1e8853c698276d Sibi Sankar                      2022-02-09   523  		};
1e8853c698276d Sibi Sankar                      2022-02-09   524  
1e8853c698276d Sibi Sankar                      2022-02-09   525  		cpu0_opp_1152mhz: opp-1152000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   526  			opp-hz = /bits/ 64 <1152000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   527  			opp-peak-kBps = <2188000 27033600>;
1e8853c698276d Sibi Sankar                      2022-02-09   528  		};
1e8853c698276d Sibi Sankar                      2022-02-09   529  
1e8853c698276d Sibi Sankar                      2022-02-09   530  		cpu0_opp_1325mhz: opp-1324800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   531  			opp-hz = /bits/ 64 <1324800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   532  			opp-peak-kBps = <2188000 33792000>;
1e8853c698276d Sibi Sankar                      2022-02-09   533  		};
1e8853c698276d Sibi Sankar                      2022-02-09   534  
1e8853c698276d Sibi Sankar                      2022-02-09   535  		cpu0_opp_1517mhz: opp-1516800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   536  			opp-hz = /bits/ 64 <1516800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   537  			opp-peak-kBps = <3072000 38092800>;
1e8853c698276d Sibi Sankar                      2022-02-09   538  		};
1e8853c698276d Sibi Sankar                      2022-02-09   539  
1e8853c698276d Sibi Sankar                      2022-02-09   540  		cpu0_opp_1651mhz: opp-1651200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   541  			opp-hz = /bits/ 64 <1651200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   542  			opp-peak-kBps = <3072000 41779200>;
1e8853c698276d Sibi Sankar                      2022-02-09   543  		};
1e8853c698276d Sibi Sankar                      2022-02-09   544  
1e8853c698276d Sibi Sankar                      2022-02-09   545  		cpu0_opp_1805mhz: opp-1804800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   546  			opp-hz = /bits/ 64 <1804800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   547  			opp-peak-kBps = <4068000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   548  		};
1e8853c698276d Sibi Sankar                      2022-02-09   549  
1e8853c698276d Sibi Sankar                      2022-02-09   550  		cpu0_opp_1958mhz: opp-1958400000 {
1e8853c698276d Sibi Sankar                      2022-02-09   551  			opp-hz = /bits/ 64 <1958400000>;
1e8853c698276d Sibi Sankar                      2022-02-09   552  			opp-peak-kBps = <4068000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   553  		};
1e8853c698276d Sibi Sankar                      2022-02-09   554  
1e8853c698276d Sibi Sankar                      2022-02-09   555  		cpu0_opp_2016mhz: opp-2016000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   556  			opp-hz = /bits/ 64 <2016000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   557  			opp-peak-kBps = <6220000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   558  		};
1e8853c698276d Sibi Sankar                      2022-02-09   559  	};
1e8853c698276d Sibi Sankar                      2022-02-09   560  
0e3e654696074b Krzysztof Kozlowski              2022-06-27   561  	cpu4_opp_table: opp-table-cpu4 {
1e8853c698276d Sibi Sankar                      2022-02-09   562  		compatible = "operating-points-v2";
1e8853c698276d Sibi Sankar                      2022-02-09   563  		opp-shared;
1e8853c698276d Sibi Sankar                      2022-02-09   564  
1e8853c698276d Sibi Sankar                      2022-02-09   565  		cpu4_opp_691mhz: opp-691200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   566  			opp-hz = /bits/ 64 <691200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   567  			opp-peak-kBps = <1804000 9600000>;
1e8853c698276d Sibi Sankar                      2022-02-09   568  		};
1e8853c698276d Sibi Sankar                      2022-02-09   569  
1e8853c698276d Sibi Sankar                      2022-02-09   570  		cpu4_opp_941mhz: opp-940800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   571  			opp-hz = /bits/ 64 <940800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   572  			opp-peak-kBps = <2188000 17817600>;
1e8853c698276d Sibi Sankar                      2022-02-09   573  		};
1e8853c698276d Sibi Sankar                      2022-02-09   574  
1e8853c698276d Sibi Sankar                      2022-02-09   575  		cpu4_opp_1229mhz: opp-1228800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   576  			opp-hz = /bits/ 64 <1228800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   577  			opp-peak-kBps = <4068000 24576000>;
1e8853c698276d Sibi Sankar                      2022-02-09   578  		};
1e8853c698276d Sibi Sankar                      2022-02-09   579  
1e8853c698276d Sibi Sankar                      2022-02-09   580  		cpu4_opp_1344mhz: opp-1344000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   581  			opp-hz = /bits/ 64 <1344000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   582  			opp-peak-kBps = <4068000 24576000>;
1e8853c698276d Sibi Sankar                      2022-02-09   583  		};
1e8853c698276d Sibi Sankar                      2022-02-09   584  
1e8853c698276d Sibi Sankar                      2022-02-09   585  		cpu4_opp_1517mhz: opp-1516800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   586  			opp-hz = /bits/ 64 <1516800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   587  			opp-peak-kBps = <4068000 24576000>;
1e8853c698276d Sibi Sankar                      2022-02-09   588  		};
1e8853c698276d Sibi Sankar                      2022-02-09   589  
1e8853c698276d Sibi Sankar                      2022-02-09   590  		cpu4_opp_1651mhz: opp-1651200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   591  			opp-hz = /bits/ 64 <1651200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   592  			opp-peak-kBps = <6220000 38092800>;
1e8853c698276d Sibi Sankar                      2022-02-09   593  		};
1e8853c698276d Sibi Sankar                      2022-02-09   594  
1e8853c698276d Sibi Sankar                      2022-02-09   595  		cpu4_opp_1901mhz: opp-1900800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   596  			opp-hz = /bits/ 64 <1900800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   597  			opp-peak-kBps = <6220000 44851200>;
1e8853c698276d Sibi Sankar                      2022-02-09   598  		};
1e8853c698276d Sibi Sankar                      2022-02-09   599  
1e8853c698276d Sibi Sankar                      2022-02-09   600  		cpu4_opp_2054mhz: opp-2054400000 {
1e8853c698276d Sibi Sankar                      2022-02-09   601  			opp-hz = /bits/ 64 <2054400000>;
1e8853c698276d Sibi Sankar                      2022-02-09   602  			opp-peak-kBps = <6220000 44851200>;
1e8853c698276d Sibi Sankar                      2022-02-09   603  		};
1e8853c698276d Sibi Sankar                      2022-02-09   604  
1e8853c698276d Sibi Sankar                      2022-02-09   605  		cpu4_opp_2112mhz: opp-2112000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   606  			opp-hz = /bits/ 64 <2112000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   607  			opp-peak-kBps = <6220000 44851200>;
1e8853c698276d Sibi Sankar                      2022-02-09   608  		};
1e8853c698276d Sibi Sankar                      2022-02-09   609  
1e8853c698276d Sibi Sankar                      2022-02-09   610  		cpu4_opp_2131mhz: opp-2131200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   611  			opp-hz = /bits/ 64 <2131200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   612  			opp-peak-kBps = <6220000 44851200>;
1e8853c698276d Sibi Sankar                      2022-02-09   613  		};
1e8853c698276d Sibi Sankar                      2022-02-09   614  
1e8853c698276d Sibi Sankar                      2022-02-09   615  		cpu4_opp_2208mhz: opp-2208000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   616  			opp-hz = /bits/ 64 <2208000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   617  			opp-peak-kBps = <6220000 44851200>;
1e8853c698276d Sibi Sankar                      2022-02-09   618  		};
1e8853c698276d Sibi Sankar                      2022-02-09   619  
1e8853c698276d Sibi Sankar                      2022-02-09   620  		cpu4_opp_2400mhz: opp-2400000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   621  			opp-hz = /bits/ 64 <2400000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   622  			opp-peak-kBps = <8532000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   623  		};
1e8853c698276d Sibi Sankar                      2022-02-09   624  
1e8853c698276d Sibi Sankar                      2022-02-09   625  		cpu4_opp_2611mhz: opp-2611200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   626  			opp-hz = /bits/ 64 <2611200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   627  			opp-peak-kBps = <8532000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   628  		};
1e8853c698276d Sibi Sankar                      2022-02-09   629  	};
1e8853c698276d Sibi Sankar                      2022-02-09   630  
0e3e654696074b Krzysztof Kozlowski              2022-06-27   631  	cpu7_opp_table: opp-table-cpu7 {
1e8853c698276d Sibi Sankar                      2022-02-09   632  		compatible = "operating-points-v2";
1e8853c698276d Sibi Sankar                      2022-02-09   633  		opp-shared;
1e8853c698276d Sibi Sankar                      2022-02-09   634  
1e8853c698276d Sibi Sankar                      2022-02-09   635  		cpu7_opp_806mhz: opp-806400000 {
1e8853c698276d Sibi Sankar                      2022-02-09   636  			opp-hz = /bits/ 64 <806400000>;
1e8853c698276d Sibi Sankar                      2022-02-09   637  			opp-peak-kBps = <1804000 9600000>;
1e8853c698276d Sibi Sankar                      2022-02-09   638  		};
1e8853c698276d Sibi Sankar                      2022-02-09   639  
1e8853c698276d Sibi Sankar                      2022-02-09   640  		cpu7_opp_1056mhz: opp-1056000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   641  			opp-hz = /bits/ 64 <1056000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   642  			opp-peak-kBps = <2188000 17817600>;
1e8853c698276d Sibi Sankar                      2022-02-09   643  		};
1e8853c698276d Sibi Sankar                      2022-02-09   644  
1e8853c698276d Sibi Sankar                      2022-02-09   645  		cpu7_opp_1325mhz: opp-1324800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   646  			opp-hz = /bits/ 64 <1324800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   647  			opp-peak-kBps = <4068000 24576000>;
1e8853c698276d Sibi Sankar                      2022-02-09   648  		};
1e8853c698276d Sibi Sankar                      2022-02-09   649  
1e8853c698276d Sibi Sankar                      2022-02-09   650  		cpu7_opp_1517mhz: opp-1516800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   651  			opp-hz = /bits/ 64 <1516800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   652  			opp-peak-kBps = <4068000 24576000>;
1e8853c698276d Sibi Sankar                      2022-02-09   653  		};
1e8853c698276d Sibi Sankar                      2022-02-09   654  
1e8853c698276d Sibi Sankar                      2022-02-09   655  		cpu7_opp_1766mhz: opp-1766400000 {
1e8853c698276d Sibi Sankar                      2022-02-09   656  			opp-hz = /bits/ 64 <1766400000>;
1e8853c698276d Sibi Sankar                      2022-02-09   657  			opp-peak-kBps = <6220000 38092800>;
1e8853c698276d Sibi Sankar                      2022-02-09   658  		};
1e8853c698276d Sibi Sankar                      2022-02-09   659  
1e8853c698276d Sibi Sankar                      2022-02-09   660  		cpu7_opp_1862mhz: opp-1862400000 {
1e8853c698276d Sibi Sankar                      2022-02-09   661  			opp-hz = /bits/ 64 <1862400000>;
1e8853c698276d Sibi Sankar                      2022-02-09   662  			opp-peak-kBps = <6220000 38092800>;
1e8853c698276d Sibi Sankar                      2022-02-09   663  		};
1e8853c698276d Sibi Sankar                      2022-02-09   664  
1e8853c698276d Sibi Sankar                      2022-02-09   665  		cpu7_opp_2035mhz: opp-2035200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   666  			opp-hz = /bits/ 64 <2035200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   667  			opp-peak-kBps = <6220000 38092800>;
1e8853c698276d Sibi Sankar                      2022-02-09   668  		};
1e8853c698276d Sibi Sankar                      2022-02-09   669  
1e8853c698276d Sibi Sankar                      2022-02-09   670  		cpu7_opp_2112mhz: opp-2112000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   671  			opp-hz = /bits/ 64 <2112000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   672  			opp-peak-kBps = <6220000 44851200>;
1e8853c698276d Sibi Sankar                      2022-02-09   673  		};
1e8853c698276d Sibi Sankar                      2022-02-09   674  
1e8853c698276d Sibi Sankar                      2022-02-09   675  		cpu7_opp_2208mhz: opp-2208000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   676  			opp-hz = /bits/ 64 <2208000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   677  			opp-peak-kBps = <6220000 44851200>;
1e8853c698276d Sibi Sankar                      2022-02-09   678  		};
1e8853c698276d Sibi Sankar                      2022-02-09   679  
1e8853c698276d Sibi Sankar                      2022-02-09   680  		cpu7_opp_2381mhz: opp-2380800000 {
1e8853c698276d Sibi Sankar                      2022-02-09   681  			opp-hz = /bits/ 64 <2380800000>;
1e8853c698276d Sibi Sankar                      2022-02-09   682  			opp-peak-kBps = <6832000 44851200>;
1e8853c698276d Sibi Sankar                      2022-02-09   683  		};
1e8853c698276d Sibi Sankar                      2022-02-09   684  
1e8853c698276d Sibi Sankar                      2022-02-09   685  		cpu7_opp_2400mhz: opp-2400000000 {
1e8853c698276d Sibi Sankar                      2022-02-09   686  			opp-hz = /bits/ 64 <2400000000>;
1e8853c698276d Sibi Sankar                      2022-02-09   687  			opp-peak-kBps = <8532000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   688  		};
1e8853c698276d Sibi Sankar                      2022-02-09   689  
1e8853c698276d Sibi Sankar                      2022-02-09   690  		cpu7_opp_2515mhz: opp-2515200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   691  			opp-hz = /bits/ 64 <2515200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   692  			opp-peak-kBps = <8532000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   693  		};
1e8853c698276d Sibi Sankar                      2022-02-09   694  
1e8853c698276d Sibi Sankar                      2022-02-09   695  		cpu7_opp_2707mhz: opp-2707200000 {
1e8853c698276d Sibi Sankar                      2022-02-09   696  			opp-hz = /bits/ 64 <2707200000>;
1e8853c698276d Sibi Sankar                      2022-02-09   697  			opp-peak-kBps = <8532000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   698  		};
1e8853c698276d Sibi Sankar                      2022-02-09   699  
1e8853c698276d Sibi Sankar                      2022-02-09   700  		cpu7_opp_3014mhz: opp-3014400000 {
1e8853c698276d Sibi Sankar                      2022-02-09   701  			opp-hz = /bits/ 64 <3014400000>;
1e8853c698276d Sibi Sankar                      2022-02-09   702  			opp-peak-kBps = <8532000 48537600>;
1e8853c698276d Sibi Sankar                      2022-02-09   703  		};
1e8853c698276d Sibi Sankar                      2022-02-09   704  	};
1e8853c698276d Sibi Sankar                      2022-02-09   705  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   706  	memory@80000000 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   707  		device_type = "memory";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   708  		/* We expect the bootloader to fill in the size */
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   709  		reg = <0 0x80000000 0 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   710  	};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   711  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   712  	firmware {
7b59e8ae92fe08 Douglas Anderson                 2023-06-16   713  		scm: scm {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   714  			compatible = "qcom,scm-sc7280", "qcom,scm";
134a4b2f3be287 Mukesh Ojha                      2024-07-05   715  			qcom,dload-mode = <&tcsr_2 0x13000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   716  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   717  	};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   718  
297e6e38320f32 Odelu Kukatla                    2021-04-27   719  	clk_virt: interconnect {
297e6e38320f32 Odelu Kukatla                    2021-04-27   720  		compatible = "qcom,sc7280-clk-virt";
297e6e38320f32 Odelu Kukatla                    2021-04-27   721  		#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27   722  		qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27   723  	};
297e6e38320f32 Odelu Kukatla                    2021-04-27   724  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   725  	smem {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   726  		compatible = "qcom,smem";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   727  		memory-region = <&smem_mem>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   728  		hwlocks = <&tcsr_mutex 3>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   729  	};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   730  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   731  	smp2p-adsp {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   732  		compatible = "qcom,smp2p";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   733  		qcom,smem = <443>, <429>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   734  		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
c3bbe55c942d2a Sibi Sankar                      2021-04-27   735  					     IPCC_MPROC_SIGNAL_SMP2P
c3bbe55c942d2a Sibi Sankar                      2021-04-27   736  					     IRQ_TYPE_EDGE_RISING>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   737  		mboxes = <&ipcc IPCC_CLIENT_LPASS
c3bbe55c942d2a Sibi Sankar                      2021-04-27   738  				IPCC_MPROC_SIGNAL_SMP2P>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   739  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   740  		qcom,local-pid = <0>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   741  		qcom,remote-pid = <2>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   742  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   743  		adsp_smp2p_out: master-kernel {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   744  			qcom,entry-name = "master-kernel";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   745  			#qcom,smem-state-cells = <1>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   746  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   747  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   748  		adsp_smp2p_in: slave-kernel {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   749  			qcom,entry-name = "slave-kernel";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   750  			interrupt-controller;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   751  			#interrupt-cells = <2>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   752  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   753  	};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   754  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   755  	smp2p-cdsp {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   756  		compatible = "qcom,smp2p";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   757  		qcom,smem = <94>, <432>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   758  		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
c3bbe55c942d2a Sibi Sankar                      2021-04-27   759  					     IPCC_MPROC_SIGNAL_SMP2P
c3bbe55c942d2a Sibi Sankar                      2021-04-27   760  					     IRQ_TYPE_EDGE_RISING>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   761  		mboxes = <&ipcc IPCC_CLIENT_CDSP
c3bbe55c942d2a Sibi Sankar                      2021-04-27   762  				IPCC_MPROC_SIGNAL_SMP2P>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   763  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   764  		qcom,local-pid = <0>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   765  		qcom,remote-pid = <5>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   766  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   767  		cdsp_smp2p_out: master-kernel {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   768  			qcom,entry-name = "master-kernel";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   769  			#qcom,smem-state-cells = <1>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   770  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   771  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   772  		cdsp_smp2p_in: slave-kernel {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   773  			qcom,entry-name = "slave-kernel";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   774  			interrupt-controller;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   775  			#interrupt-cells = <2>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   776  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   777  	};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   778  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   779  	smp2p-mpss {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   780  		compatible = "qcom,smp2p";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   781  		qcom,smem = <435>, <428>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   782  		interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
c3bbe55c942d2a Sibi Sankar                      2021-04-27   783  					     IPCC_MPROC_SIGNAL_SMP2P
c3bbe55c942d2a Sibi Sankar                      2021-04-27   784  					     IRQ_TYPE_EDGE_RISING>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   785  		mboxes = <&ipcc IPCC_CLIENT_MPSS
c3bbe55c942d2a Sibi Sankar                      2021-04-27   786  				IPCC_MPROC_SIGNAL_SMP2P>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   787  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   788  		qcom,local-pid = <0>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   789  		qcom,remote-pid = <1>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   790  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   791  		modem_smp2p_out: master-kernel {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   792  			qcom,entry-name = "master-kernel";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   793  			#qcom,smem-state-cells = <1>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   794  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   795  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   796  		modem_smp2p_in: slave-kernel {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   797  			qcom,entry-name = "slave-kernel";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   798  			interrupt-controller;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   799  			#interrupt-cells = <2>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   800  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   801  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   802  		ipa_smp2p_out: ipa-ap-to-modem {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   803  			qcom,entry-name = "ipa";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   804  			#qcom,smem-state-cells = <1>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   805  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   806  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   807  		ipa_smp2p_in: ipa-modem-to-ap {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   808  			qcom,entry-name = "ipa";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   809  			interrupt-controller;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   810  			#interrupt-cells = <2>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   811  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   812  	};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   813  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   814  	smp2p-wpss {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   815  		compatible = "qcom,smp2p";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   816  		qcom,smem = <617>, <616>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   817  		interrupts-extended = <&ipcc IPCC_CLIENT_WPSS
c3bbe55c942d2a Sibi Sankar                      2021-04-27   818  					     IPCC_MPROC_SIGNAL_SMP2P
c3bbe55c942d2a Sibi Sankar                      2021-04-27   819  					     IRQ_TYPE_EDGE_RISING>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   820  		mboxes = <&ipcc IPCC_CLIENT_WPSS
c3bbe55c942d2a Sibi Sankar                      2021-04-27   821  				IPCC_MPROC_SIGNAL_SMP2P>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   822  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   823  		qcom,local-pid = <0>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   824  		qcom,remote-pid = <13>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   825  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   826  		wpss_smp2p_out: master-kernel {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   827  			qcom,entry-name = "master-kernel";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   828  			#qcom,smem-state-cells = <1>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   829  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   830  
c3bbe55c942d2a Sibi Sankar                      2021-04-27   831  		wpss_smp2p_in: slave-kernel {
c3bbe55c942d2a Sibi Sankar                      2021-04-27   832  			qcom,entry-name = "slave-kernel";
c3bbe55c942d2a Sibi Sankar                      2021-04-27   833  			interrupt-controller;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   834  			#interrupt-cells = <2>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27   835  		};
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   836  
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   837  		wlan_smp2p_out: wlan-ap-to-wpss {
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   838  			qcom,entry-name = "wlan";
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   839  			#qcom,smem-state-cells = <1>;
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   840  		};
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   841  
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   842  		wlan_smp2p_in: wlan-wpss-to-ap {
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   843  			qcom,entry-name = "wlan";
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   844  			interrupt-controller;
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   845  			#interrupt-cells = <2>;
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17   846  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   847  	};
c3bbe55c942d2a Sibi Sankar                      2021-04-27   848  
89f324ef54a2ae Danila Tikhonov                  2024-08-18   849  	pmu-a55 {
89f324ef54a2ae Danila Tikhonov                  2024-08-18   850  		compatible = "arm,cortex-a55-pmu";
89f324ef54a2ae Danila Tikhonov                  2024-08-18   851  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
89f324ef54a2ae Danila Tikhonov                  2024-08-18   852  	};
89f324ef54a2ae Danila Tikhonov                  2024-08-18   853  
89f324ef54a2ae Danila Tikhonov                  2024-08-18   854  	pmu-a78 {
89f324ef54a2ae Danila Tikhonov                  2024-08-18   855  		compatible = "arm,cortex-a78-pmu";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   856  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   857  	};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   858  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   859  	psci {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   860  		compatible = "arm,psci-1.0";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   861  		method = "smc";
7925ca85e95619 Maulik Shah                      2023-07-03   862  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   863  		cpu_pd0: power-domain-cpu0 {
7925ca85e95619 Maulik Shah                      2023-07-03   864  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   865  			power-domains = <&cluster_pd>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   866  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   867  		};
7925ca85e95619 Maulik Shah                      2023-07-03   868  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   869  		cpu_pd1: power-domain-cpu1 {
7925ca85e95619 Maulik Shah                      2023-07-03   870  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   871  			power-domains = <&cluster_pd>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   872  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   873  		};
7925ca85e95619 Maulik Shah                      2023-07-03   874  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   875  		cpu_pd2: power-domain-cpu2 {
7925ca85e95619 Maulik Shah                      2023-07-03   876  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   877  			power-domains = <&cluster_pd>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   878  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   879  		};
7925ca85e95619 Maulik Shah                      2023-07-03   880  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   881  		cpu_pd3: power-domain-cpu3 {
7925ca85e95619 Maulik Shah                      2023-07-03   882  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   883  			power-domains = <&cluster_pd>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   884  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   885  		};
7925ca85e95619 Maulik Shah                      2023-07-03   886  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   887  		cpu_pd4: power-domain-cpu4 {
7925ca85e95619 Maulik Shah                      2023-07-03   888  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   889  			power-domains = <&cluster_pd>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   890  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   891  		};
7925ca85e95619 Maulik Shah                      2023-07-03   892  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   893  		cpu_pd5: power-domain-cpu5 {
7925ca85e95619 Maulik Shah                      2023-07-03   894  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   895  			power-domains = <&cluster_pd>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   896  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   897  		};
7925ca85e95619 Maulik Shah                      2023-07-03   898  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   899  		cpu_pd6: power-domain-cpu6 {
7925ca85e95619 Maulik Shah                      2023-07-03   900  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   901  			power-domains = <&cluster_pd>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   902  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   903  		};
7925ca85e95619 Maulik Shah                      2023-07-03   904  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   905  		cpu_pd7: power-domain-cpu7 {
7925ca85e95619 Maulik Shah                      2023-07-03   906  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   907  			power-domains = <&cluster_pd>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   908  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
7925ca85e95619 Maulik Shah                      2023-07-03   909  		};
7925ca85e95619 Maulik Shah                      2023-07-03   910  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   911  		cluster_pd: power-domain-cluster {
7925ca85e95619 Maulik Shah                      2023-07-03   912  			#power-domain-cells = <0>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22   913  			domain-idle-states = <&cluster_sleep_apss_off &cluster_sleep_cx_ret &cluster_sleep_llcc_off>;
7925ca85e95619 Maulik Shah                      2023-07-03   914  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   915  	};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   916  
0e3e654696074b Krzysztof Kozlowski              2022-06-27   917  	qspi_opp_table: opp-table-qspi {
7720ea001b528d Roja Rani Yarubandi              2021-09-23   918  		compatible = "operating-points-v2";
7720ea001b528d Roja Rani Yarubandi              2021-09-23   919  
7720ea001b528d Roja Rani Yarubandi              2021-09-23   920  		opp-75000000 {
7720ea001b528d Roja Rani Yarubandi              2021-09-23   921  			opp-hz = /bits/ 64 <75000000>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23   922  			required-opps = <&rpmhpd_opp_low_svs>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23   923  		};
7720ea001b528d Roja Rani Yarubandi              2021-09-23   924  
7720ea001b528d Roja Rani Yarubandi              2021-09-23   925  		opp-150000000 {
7720ea001b528d Roja Rani Yarubandi              2021-09-23   926  			opp-hz = /bits/ 64 <150000000>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23   927  			required-opps = <&rpmhpd_opp_svs>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23   928  		};
7720ea001b528d Roja Rani Yarubandi              2021-09-23   929  
6ea15b5065e554 Rajesh Patil                     2021-09-29   930  		opp-200000000 {
6ea15b5065e554 Rajesh Patil                     2021-09-29   931  			opp-hz = /bits/ 64 <200000000>;
6ea15b5065e554 Rajesh Patil                     2021-09-29   932  			required-opps = <&rpmhpd_opp_svs_l1>;
6ea15b5065e554 Rajesh Patil                     2021-09-29   933  		};
6ea15b5065e554 Rajesh Patil                     2021-09-29   934  
7720ea001b528d Roja Rani Yarubandi              2021-09-23   935  		opp-300000000 {
7720ea001b528d Roja Rani Yarubandi              2021-09-23   936  			opp-hz = /bits/ 64 <300000000>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23   937  			required-opps = <&rpmhpd_opp_nom>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23   938  		};
7720ea001b528d Roja Rani Yarubandi              2021-09-23   939  	};
7720ea001b528d Roja Rani Yarubandi              2021-09-23   940  
0e3e654696074b Krzysztof Kozlowski              2022-06-27   941  	qup_opp_table: opp-table-qup {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   942  		compatible = "operating-points-v2";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   943  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   944  		opp-75000000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   945  			opp-hz = /bits/ 64 <75000000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   946  			required-opps = <&rpmhpd_opp_low_svs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   947  		};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   948  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   949  		opp-100000000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   950  			opp-hz = /bits/ 64 <100000000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   951  			required-opps = <&rpmhpd_opp_svs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   952  		};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   953  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   954  		opp-128000000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   955  			opp-hz = /bits/ 64 <128000000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   956  			required-opps = <&rpmhpd_opp_nom>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   957  		};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   958  	};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23   959  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   960  	soc: soc@0 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   961  		#address-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   962  		#size-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   963  		ranges = <0 0 0 0 0x10 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   964  		dma-ranges = <0 0 0 0 0x10 0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   965  		compatible = "simple-bus";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   966  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   967  		gcc: clock-controller@100000 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   968  			compatible = "qcom,gcc-sc7280";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   969  			reg = <0 0x00100000 0 0x1f0000>;
ab7772de861200 Rajendra Nayak                   2021-03-11   970  			clocks = <&rpmhcc RPMH_CXO_CLK>,
ab7772de861200 Rajendra Nayak                   2021-03-11   971  				 <&rpmhcc RPMH_CXO_CLK_A>, <&sleep_clk>,
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20   972  				 <0>, <&pcie1_phy>,
c8a074789d71c1 Nitin Rawat                      2023-12-05   973  				 <&ufs_mem_phy 0>, <&ufs_mem_phy 1>, <&ufs_mem_phy 2>,
36888ed83f998c Dmitry Baryshkov                 2023-07-11   974  				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
ab7772de861200 Rajendra Nayak                   2021-03-11   975  			clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk",
fa09b2248714c6 Prasad Malisetty                 2021-11-16   976  				      "pcie_0_pipe_clk", "pcie_1_pipe_clk",
ab7772de861200 Rajendra Nayak                   2021-03-11   977  				      "ufs_phy_rx_symbol_0_clk", "ufs_phy_rx_symbol_1_clk",
ab7772de861200 Rajendra Nayak                   2021-03-11   978  				      "ufs_phy_tx_symbol_0_clk",
ab7772de861200 Rajendra Nayak                   2021-03-11   979  				      "usb3_phy_wrapper_gcc_usb30_pipe_clk";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   980  			#clock-cells = <1>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   981  			#reset-cells = <1>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   982  			#power-domain-cells = <1>;
3d59187efc982b Rajendra Nayak                   2022-09-16   983  			power-domains = <&rpmhpd SC7280_CX>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   984  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11   985  
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   986  		ipcc: mailbox@408000 {
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   987  			compatible = "qcom,sc7280-ipcc", "qcom,ipcc";
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   988  			reg = <0 0x00408000 0 0x1000>;
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   989  			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   990  			interrupt-controller;
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   991  			#interrupt-cells = <3>;
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   992  			#mbox-cells = <2>;
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   993  		};
2257fac94bc24d Sai Prakash Ranjan               2021-03-16   994  
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   995  		qfprom: efuse@784000 {
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   996  			compatible = "qcom,sc7280-qfprom", "qcom,qfprom";
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   997  			reg = <0 0x00784000 0 0xa20>,
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   998  			      <0 0x00780000 0 0xa20>,
c1b2189a19cf2a Rajendra Nayak                   2021-07-30   999  			      <0 0x00782000 0 0x120>,
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1000  			      <0 0x00786000 0 0x1fff>;
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1001  			clocks = <&gcc GCC_SEC_CTRL_CLK_SRC>;
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1002  			clock-names = "core";
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1003  			power-domains = <&rpmhpd SC7280_MX>;
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1004  			#address-cells = <1>;
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1005  			#size-cells = <1>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  1006  
408e1776516149 Krzysztof Kozlowski              2024-02-13  1007  			gpu_speed_bin: gpu-speed-bin@1e9 {
3bfef00d767124 Akhil P Oommen                   2022-02-26  1008  				reg = <0x1e9 0x2>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  1009  				bits = <5 8>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  1010  			};
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1011  		};
c1b2189a19cf2a Rajendra Nayak                   2021-07-30  1012  
96bb736f05d156 Bhupesh Sharma                   2022-05-15  1013  		sdhc_1: mmc@7c4000 {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1014  			compatible = "qcom,sc7280-sdhci", "qcom,sdhci-msm-v5";
f9800dde34e678 Douglas Anderson                 2022-02-02  1015  			pinctrl-names = "default", "sleep";
f9800dde34e678 Douglas Anderson                 2022-02-02  1016  			pinctrl-0 = <&sdc1_clk>, <&sdc1_cmd>, <&sdc1_data>, <&sdc1_rclk>;
f9800dde34e678 Douglas Anderson                 2022-02-02  1017  			pinctrl-1 = <&sdc1_clk_sleep>, <&sdc1_cmd_sleep>, <&sdc1_data_sleep>, <&sdc1_rclk_sleep>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1018  			status = "disabled";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1019  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1020  			reg = <0 0x007c4000 0 0x1000>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1021  			      <0 0x007c5000 0 0x1000>;
21857088fa2747 Douglas Anderson                 2022-07-06  1022  			reg-names = "hc", "cqhci";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1023  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1024  			iommus = <&apps_smmu 0xc0 0x0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1025  			interrupts = <GIC_SPI 652 IRQ_TYPE_LEVEL_HIGH>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1026  				     <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1027  			interrupt-names = "hc_irq", "pwr_irq";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1028  
4ff12270dbbe24 Bhupesh Sharma                   2022-05-15  1029  			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
4ff12270dbbe24 Bhupesh Sharma                   2022-05-15  1030  				 <&gcc GCC_SDCC1_APPS_CLK>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1031  				 <&rpmhcc RPMH_CXO_CLK>;
4ff12270dbbe24 Bhupesh Sharma                   2022-05-15  1032  			clock-names = "iface", "core", "xo";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1033  			interconnects = <&aggre1_noc MASTER_SDCC_1 0 &mc_virt SLAVE_EBI1 0>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1034  					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_SDCC_1 0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1035  			interconnect-names = "sdhc-ddr","cpu-sdhc";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1036  			power-domains = <&rpmhpd SC7280_CX>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1037  			operating-points-v2 = <&sdhc1_opp_table>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1038  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1039  			bus-width = <8>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1040  			supports-cqe;
827f5fc8d91220 Konrad Dybcio                    2023-12-18  1041  			dma-coherent;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1042  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1043  			qcom,dll-config = <0x0007642c>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1044  			qcom,ddr-config = <0x80040868>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1045  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1046  			mmc-ddr-1_8v;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1047  			mmc-hs200-1_8v;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1048  			mmc-hs400-1_8v;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1049  			mmc-hs400-enhanced-strobe;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1050  
959cb513074386 Shaik Sajida Bhanu               2022-04-12  1051  			resets = <&gcc GCC_SDCC1_BCR>;
959cb513074386 Shaik Sajida Bhanu               2022-04-12  1052  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1053  			sdhc1_opp_table: opp-table {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1054  				compatible = "operating-points-v2";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1055  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1056  				opp-100000000 {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1057  					opp-hz = /bits/ 64 <100000000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1058  					required-opps = <&rpmhpd_opp_low_svs>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1059  					opp-peak-kBps = <1800000 400000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1060  					opp-avg-kBps = <100000 0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1061  				};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1062  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1063  				opp-384000000 {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1064  					opp-hz = /bits/ 64 <384000000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1065  					required-opps = <&rpmhpd_opp_nom>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1066  					opp-peak-kBps = <5400000 1600000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1067  					opp-avg-kBps = <390000 0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1068  				};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1069  			};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1070  		};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  1071  
c11e239f6aee32 Vinod Koul                       2022-04-21  1072  		gpi_dma0: dma-controller@900000 {
c11e239f6aee32 Vinod Koul                       2022-04-21  1073  			#dma-cells = <3>;
e9f2053b7866ac Krzysztof Kozlowski              2022-10-18  1074  			compatible = "qcom,sc7280-gpi-dma", "qcom,sm6350-gpi-dma";
c11e239f6aee32 Vinod Koul                       2022-04-21  1075  			reg = <0 0x00900000 0 0x60000>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1076  			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1077  				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1078  				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1079  				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1080  				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1081  				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1082  				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1083  				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1084  				     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1085  				     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1086  				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1087  				     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1088  			dma-channels = <12>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1089  			dma-channel-mask = <0x7f>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1090  			iommus = <&apps_smmu 0x0136 0x0>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1091  			status = "disabled";
c11e239f6aee32 Vinod Koul                       2022-04-21  1092  		};
c11e239f6aee32 Vinod Koul                       2022-04-21  1093  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1094  		qupv3_id_0: geniqup@9c0000 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1095  			compatible = "qcom,geni-se-qup";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1096  			reg = <0 0x009c0000 0 0x2000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1097  			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1098  				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1099  			clock-names = "m-ahb", "s-ahb";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1100  			#address-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1101  			#size-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1102  			ranges;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1103  			iommus = <&apps_smmu 0x123 0x0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1104  			status = "disabled";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1105  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1106  			i2c0: i2c@980000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1107  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1108  				reg = <0 0x00980000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1109  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1110  				clock-names = "se";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1111  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1112  				pinctrl-0 = <&qup_i2c0_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1113  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1114  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1115  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1116  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1117  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1118  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1119  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1120  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1121  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1122  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1123  				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1124  				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1125  				dma-names = "tx", "rx";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1126  				status = "disabled";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1127  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1128  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1129  			spi0: spi@980000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1130  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1131  				reg = <0 0x00980000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1132  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1133  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1134  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1135  				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1136  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1137  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1138  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1139  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1140  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1141  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1142  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1143  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1144  				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1145  				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1146  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1147  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1148  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1149  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1150  			uart0: serial@980000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1151  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1152  				reg = <0 0x00980000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1153  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1154  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1155  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1156  				pinctrl-0 = <&qup_uart0_cts>, <&qup_uart0_rts>, <&qup_uart0_tx>, <&qup_uart0_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1157  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1158  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1159  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1160  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1161  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1162  				interconnect-names = "qup-core", "qup-config";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1163  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1164  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1165  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1166  			i2c1: i2c@984000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1167  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1168  				reg = <0 0x00984000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1169  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1170  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1171  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1172  				pinctrl-0 = <&qup_i2c1_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1173  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1174  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1175  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1176  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1177  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1178  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1179  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1180  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1181  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1182  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1183  				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1184  				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1185  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1186  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1187  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1188  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1189  			spi1: spi@984000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1190  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1191  				reg = <0 0x00984000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1192  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1193  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1194  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1195  				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1196  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1197  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1198  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1199  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1200  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1201  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1202  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1203  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1204  				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1205  				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1206  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1207  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1208  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1209  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1210  			uart1: serial@984000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1211  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1212  				reg = <0 0x00984000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1213  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1214  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1215  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1216  				pinctrl-0 = <&qup_uart1_cts>, <&qup_uart1_rts>, <&qup_uart1_tx>, <&qup_uart1_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1217  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1218  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1219  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1220  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1221  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1222  				interconnect-names = "qup-core", "qup-config";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1223  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1224  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1225  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1226  			i2c2: i2c@988000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1227  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1228  				reg = <0 0x00988000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1229  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1230  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1231  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1232  				pinctrl-0 = <&qup_i2c2_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1233  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1234  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1235  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1236  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1237  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1238  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1239  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1240  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1241  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1242  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1243  				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1244  				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1245  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1246  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1247  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1248  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1249  			spi2: spi@988000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1250  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1251  				reg = <0 0x00988000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1252  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1253  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1254  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1255  				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1256  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1257  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1258  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1259  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1260  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1261  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1262  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1263  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1264  				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1265  				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1266  				dma-names = "tx", "rx";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1267  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1268  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1269  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1270  			uart2: serial@988000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1271  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1272  				reg = <0 0x00988000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1273  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1274  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1275  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1276  				pinctrl-0 = <&qup_uart2_cts>, <&qup_uart2_rts>, <&qup_uart2_tx>, <&qup_uart2_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1277  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1278  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1279  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1280  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1281  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1282  				interconnect-names = "qup-core", "qup-config";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1283  				status = "disabled";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1284  			};
fc4f0273d4fba2 Alex Elder                       2021-08-04  1285  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1286  			i2c3: i2c@98c000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1287  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1288  				reg = <0 0x0098c000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1289  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1290  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1291  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1292  				pinctrl-0 = <&qup_i2c3_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1293  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1294  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1295  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1296  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1297  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1298  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1299  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1300  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1301  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1302  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1303  				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1304  				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1305  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1306  				status = "disabled";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1307  			};
fc4f0273d4fba2 Alex Elder                       2021-08-04  1308  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1309  			spi3: spi@98c000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1310  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1311  				reg = <0 0x0098c000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1312  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1313  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1314  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1315  				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1316  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1317  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1318  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1319  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1320  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1321  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1322  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1323  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1324  				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1325  				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1326  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1327  				status = "disabled";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1328  			};
fc4f0273d4fba2 Alex Elder                       2021-08-04  1329  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1330  			uart3: serial@98c000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1331  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1332  				reg = <0 0x0098c000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1333  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1334  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1335  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1336  				pinctrl-0 = <&qup_uart3_cts>, <&qup_uart3_rts>, <&qup_uart3_tx>, <&qup_uart3_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1337  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1338  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1339  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1340  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1341  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1342  				interconnect-names = "qup-core", "qup-config";
fc4f0273d4fba2 Alex Elder                       2021-08-04  1343  				status = "disabled";
fc4f0273d4fba2 Alex Elder                       2021-08-04  1344  			};
fc4f0273d4fba2 Alex Elder                       2021-08-04  1345  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1346  			i2c4: i2c@990000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1347  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1348  				reg = <0 0x00990000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1349  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1350  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1351  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1352  				pinctrl-0 = <&qup_i2c4_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1353  				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1354  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1355  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1356  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1357  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1358  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1359  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1360  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1361  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1362  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1363  				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1364  				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1365  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1366  				status = "disabled";
c3bbe55c942d2a Sibi Sankar                      2021-04-27  1367  			};
c3bbe55c942d2a Sibi Sankar                      2021-04-27  1368  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1369  			spi4: spi@990000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1370  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1371  				reg = <0 0x00990000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1372  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1373  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1374  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1375  				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1376  				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1377  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1378  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1379  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1380  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1381  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1382  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1383  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1384  				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1385  				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1386  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1387  				status = "disabled";
422a295221bba8 Taniya Das                       2021-04-10  1388  			};
422a295221bba8 Taniya Das                       2021-04-10  1389  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1390  			uart4: serial@990000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1391  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1392  				reg = <0 0x00990000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1393  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1394  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1395  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1396  				pinctrl-0 = <&qup_uart4_cts>, <&qup_uart4_rts>, <&qup_uart4_tx>, <&qup_uart4_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1397  				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1398  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1399  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1400  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1401  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1402  				interconnect-names = "qup-core", "qup-config";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1403  				status = "disabled";
297e6e38320f32 Odelu Kukatla                    2021-04-27  1404  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  1405  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1406  			i2c5: i2c@994000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1407  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1408  				reg = <0 0x00994000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1409  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1410  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1411  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1412  				pinctrl-0 = <&qup_i2c5_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1413  				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1414  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1415  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1416  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1417  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1418  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1419  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1420  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1421  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1422  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1423  				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1424  				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1425  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1426  				status = "disabled";
422a295221bba8 Taniya Das                       2021-04-10  1427  			};
422a295221bba8 Taniya Das                       2021-04-10  1428  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1429  			spi5: spi@994000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1430  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1431  				reg = <0 0x00994000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1432  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1433  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1434  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1435  				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1436  				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1437  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1438  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1439  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1440  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1441  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1442  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1443  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1444  				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1445  				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1446  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1447  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1448  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1449  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1450  			uart5: serial@994000 {
2b96407b8f10f1 Viken Dadhaniya                  2024-04-24  1451  				compatible = "qcom,geni-debug-uart";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1452  				reg = <0 0x00994000 0 0x4000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1453  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1454  				clock-names = "se";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1455  				pinctrl-names = "default";
2b96407b8f10f1 Viken Dadhaniya                  2024-04-24  1456  				pinctrl-0 = <&qup_uart5_tx>, <&qup_uart5_rx>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1457  				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
38cd93f413fd94 Roja Rani Yarubandi              2021-09-23  1458  				power-domains = <&rpmhpd SC7280_CX>;
38cd93f413fd94 Roja Rani Yarubandi              2021-09-23  1459  				operating-points-v2 = <&qup_opp_table>;
38cd93f413fd94 Roja Rani Yarubandi              2021-09-23  1460  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
38cd93f413fd94 Roja Rani Yarubandi              2021-09-23  1461  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
38cd93f413fd94 Roja Rani Yarubandi              2021-09-23  1462  				interconnect-names = "qup-core", "qup-config";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  1463  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1464  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1465  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1466  			i2c6: i2c@998000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1467  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1468  				reg = <0 0x00998000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1469  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1470  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1471  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1472  				pinctrl-0 = <&qup_i2c6_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1473  				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1474  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1475  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1476  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1477  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1478  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1479  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1480  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1481  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1482  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1483  				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1484  				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1485  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1486  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1487  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1488  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1489  			spi6: spi@998000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1490  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1491  				reg = <0 0x00998000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1492  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1493  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1494  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1495  				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1496  				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1497  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1498  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1499  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1500  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1501  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1502  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1503  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1504  				dmas = <&gpi_dma0 0 6 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1505  				       <&gpi_dma0 1 6 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1506  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1507  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1508  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1509  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1510  			uart6: serial@998000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1511  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1512  				reg = <0 0x00998000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1513  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1514  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1515  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1516  				pinctrl-0 = <&qup_uart6_cts>, <&qup_uart6_rts>, <&qup_uart6_tx>, <&qup_uart6_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1517  				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1518  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1519  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1520  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1521  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1522  				interconnect-names = "qup-core", "qup-config";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1523  				status = "disabled";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1524  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1525  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1526  			i2c7: i2c@99c000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1527  				compatible = "qcom,geni-i2c";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1528  				reg = <0 0x0099c000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1529  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1530  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1531  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1532  				pinctrl-0 = <&qup_i2c7_data_clk>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1533  				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1534  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1535  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1536  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1537  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1538  						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1539  				interconnect-names = "qup-core", "qup-config",
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1540  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1541  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1542  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1543  				dmas = <&gpi_dma0 0 7 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1544  				       <&gpi_dma0 1 7 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1545  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1546  				status = "disabled";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1547  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1548  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1549  			spi7: spi@99c000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1550  				compatible = "qcom,geni-spi";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1551  				reg = <0 0x0099c000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1552  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1553  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1554  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1555  				pinctrl-0 = <&qup_spi7_data_clk>, <&qup_spi7_cs>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1556  				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1557  				#address-cells = <1>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1558  				#size-cells = <0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1559  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1560  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1561  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1562  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1563  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1564  				dmas = <&gpi_dma0 0 7 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1565  				       <&gpi_dma0 1 7 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1566  				dma-names = "tx", "rx";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1567  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1568  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1569  
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1570  			uart7: serial@99c000 {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1571  				compatible = "qcom,geni-uart";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1572  				reg = <0 0x0099c000 0 0x4000>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1573  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1574  				clock-names = "se";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1575  				pinctrl-names = "default";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1576  				pinctrl-0 = <&qup_uart7_cts>, <&qup_uart7_rts>, <&qup_uart7_tx>, <&qup_uart7_rx>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1577  				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1578  				power-domains = <&rpmhpd SC7280_CX>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1579  				operating-points-v2 = <&qup_opp_table>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1580  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1581  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1582  				interconnect-names = "qup-core", "qup-config";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  1583  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1584  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1585  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1586  
c11e239f6aee32 Vinod Koul                       2022-04-21  1587  		gpi_dma1: dma-controller@a00000 {
c11e239f6aee32 Vinod Koul                       2022-04-21  1588  			#dma-cells = <3>;
e9f2053b7866ac Krzysztof Kozlowski              2022-10-18  1589  			compatible = "qcom,sc7280-gpi-dma", "qcom,sm6350-gpi-dma";
c11e239f6aee32 Vinod Koul                       2022-04-21  1590  			reg = <0 0x00a00000 0 0x60000>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1591  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1592  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1593  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1594  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1595  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1596  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1597  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1598  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1599  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1600  				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1601  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
c11e239f6aee32 Vinod Koul                       2022-04-21  1602  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1603  			dma-channels = <12>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1604  			dma-channel-mask = <0x1e>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1605  			iommus = <&apps_smmu 0x56 0x0>;
c11e239f6aee32 Vinod Koul                       2022-04-21  1606  			status = "disabled";
c11e239f6aee32 Vinod Koul                       2022-04-21  1607  		};
c11e239f6aee32 Vinod Koul                       2022-04-21  1608  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1609  		qupv3_id_1: geniqup@ac0000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1610  			compatible = "qcom,geni-se-qup";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1611  			reg = <0 0x00ac0000 0 0x2000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1612  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1613  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1614  			clock-names = "m-ahb", "s-ahb";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1615  			#address-cells = <2>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1616  			#size-cells = <2>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1617  			ranges;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1618  			iommus = <&apps_smmu 0x43 0x0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1619  			status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1620  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1621  			i2c8: i2c@a80000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1622  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1623  				reg = <0 0x00a80000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1624  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1625  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1626  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1627  				pinctrl-0 = <&qup_i2c8_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1628  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1629  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1630  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1631  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1632  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1633  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1634  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1635  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1636  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1637  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1638  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1639  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1640  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1641  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1642  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1643  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1644  			spi8: spi@a80000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1645  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1646  				reg = <0 0x00a80000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1647  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1648  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1649  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1650  				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1651  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1652  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1653  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1654  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1655  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1656  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1657  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1658  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1659  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1660  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1661  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1662  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1663  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1664  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1665  			uart8: serial@a80000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1666  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1667  				reg = <0 0x00a80000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1668  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1669  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1670  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1671  				pinctrl-0 = <&qup_uart8_cts>, <&qup_uart8_rts>, <&qup_uart8_tx>, <&qup_uart8_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1672  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1673  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1674  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1675  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1676  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1677  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1678  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1679  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1680  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1681  			i2c9: i2c@a84000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1682  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1683  				reg = <0 0x00a84000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1684  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1685  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1686  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1687  				pinctrl-0 = <&qup_i2c9_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1688  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1689  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1690  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1691  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1692  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1693  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1694  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1695  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1696  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1697  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1698  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1699  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1700  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1701  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1702  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1703  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1704  			spi9: spi@a84000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1705  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1706  				reg = <0 0x00a84000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1707  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1708  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1709  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1710  				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1711  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1712  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1713  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1714  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1715  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1716  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1717  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1718  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1719  				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1720  				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1721  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1722  				status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1723  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1724  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1725  			uart9: serial@a84000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1726  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1727  				reg = <0 0x00a84000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1728  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1729  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1730  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1731  				pinctrl-0 = <&qup_uart9_cts>, <&qup_uart9_rts>, <&qup_uart9_tx>, <&qup_uart9_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1732  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1733  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1734  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1735  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1736  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1737  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1738  				status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1739  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1740  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1741  			i2c10: i2c@a88000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1742  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1743  				reg = <0 0x00a88000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1744  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1745  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1746  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1747  				pinctrl-0 = <&qup_i2c10_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1748  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1749  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1750  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1751  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1752  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1753  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1754  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1755  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1756  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1757  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1758  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1759  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1760  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1761  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1762  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1763  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1764  			spi10: spi@a88000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1765  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1766  				reg = <0 0x00a88000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1767  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1768  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1769  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1770  				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1771  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1772  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1773  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1774  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1775  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1776  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1777  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1778  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1779  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1780  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1781  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1782  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1783  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1784  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1785  			uart10: serial@a88000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1786  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1787  				reg = <0 0x00a88000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1788  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1789  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1790  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1791  				pinctrl-0 = <&qup_uart10_cts>, <&qup_uart10_rts>, <&qup_uart10_tx>, <&qup_uart10_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1792  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1793  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1794  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1795  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1796  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1797  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1798  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1799  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1800  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1801  			i2c11: i2c@a8c000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1802  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1803  				reg = <0 0x00a8c000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1804  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1805  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1806  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1807  				pinctrl-0 = <&qup_i2c11_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1808  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1809  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1810  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1811  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1812  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1813  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1814  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1815  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1816  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1817  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1818  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1819  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1820  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1821  				status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1822  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1823  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1824  			spi11: spi@a8c000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1825  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1826  				reg = <0 0x00a8c000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1827  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1828  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1829  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1830  				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1831  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1832  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1833  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1834  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1835  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1836  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1837  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1838  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1839  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1840  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1841  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1842  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1843  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1844  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1845  			uart11: serial@a8c000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1846  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1847  				reg = <0 0x00a8c000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1848  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1849  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1850  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1851  				pinctrl-0 = <&qup_uart11_cts>, <&qup_uart11_rts>, <&qup_uart11_tx>, <&qup_uart11_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1852  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1853  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1854  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1855  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1856  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1857  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1858  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1859  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1860  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1861  			i2c12: i2c@a90000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1862  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1863  				reg = <0 0x00a90000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1864  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1865  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1866  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1867  				pinctrl-0 = <&qup_i2c12_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1868  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1869  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1870  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1871  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1872  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1873  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1874  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1875  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1876  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1877  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1878  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1879  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1880  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1881  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1882  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1883  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1884  			spi12: spi@a90000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1885  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1886  				reg = <0 0x00a90000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1887  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1888  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1889  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1890  				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1891  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1892  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1893  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1894  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1895  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1896  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1897  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1898  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1899  				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1900  				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1901  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1902  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1903  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1904  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1905  			uart12: serial@a90000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1906  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1907  				reg = <0 0x00a90000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1908  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1909  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1910  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1911  				pinctrl-0 = <&qup_uart12_cts>, <&qup_uart12_rts>, <&qup_uart12_tx>, <&qup_uart12_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1912  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1913  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1914  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1915  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1916  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1917  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1918  				status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1919  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1920  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1921  			i2c13: i2c@a94000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1922  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1923  				reg = <0 0x00a94000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1924  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1925  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1926  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1927  				pinctrl-0 = <&qup_i2c13_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1928  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1929  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1930  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1931  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1932  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1933  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1934  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1935  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1936  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1937  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1938  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1939  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  1940  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1941  				status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1942  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1943  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1944  			spi13: spi@a94000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1945  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1946  				reg = <0 0x00a94000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1947  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1948  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1949  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1950  				pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1951  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1952  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1953  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1954  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1955  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1956  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1957  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1958  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  1959  				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  1960  				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  1961  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1962  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1963  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1964  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1965  			uart13: serial@a94000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1966  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1967  				reg = <0 0x00a94000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1968  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1969  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1970  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1971  				pinctrl-0 = <&qup_uart13_cts>, <&qup_uart13_rts>, <&qup_uart13_tx>, <&qup_uart13_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1972  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1973  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1974  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1975  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1976  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1977  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1978  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  1979  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1980  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1981  			i2c14: i2c@a98000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1982  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1983  				reg = <0 0x00a98000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1984  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1985  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1986  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1987  				pinctrl-0 = <&qup_i2c14_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1988  				interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1989  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1990  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1991  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1992  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1993  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1994  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  1995  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  1996  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  1997  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  1998  				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  1999  				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  2000  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2001  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2002  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2003  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2004  			spi14: spi@a98000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2005  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2006  				reg = <0 0x00a98000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2007  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2008  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2009  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2010  				pinctrl-0 = <&qup_spi14_data_clk>, <&qup_spi14_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2011  				interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2012  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2013  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2014  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2015  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2016  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2017  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2018  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  2019  				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  2020  				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  2021  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2022  				status = "disabled";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2023  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2024  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2025  			uart14: serial@a98000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2026  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2027  				reg = <0 0x00a98000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2028  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2029  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2030  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2031  				pinctrl-0 = <&qup_uart14_cts>, <&qup_uart14_rts>, <&qup_uart14_tx>, <&qup_uart14_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2032  				interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2033  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2034  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2035  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2036  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2037  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2038  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2039  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2040  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2041  			i2c15: i2c@a9c000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2042  				compatible = "qcom,geni-i2c";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2043  				reg = <0 0x00a9c000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2044  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2045  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2046  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2047  				pinctrl-0 = <&qup_i2c15_data_clk>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2048  				interrupts = <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2049  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2050  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2051  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2052  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2053  						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2054  				interconnect-names = "qup-core", "qup-config",
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2055  							"qup-memory";
e3e9a580380730 Rajendra Nayak                   2022-09-27  2056  				power-domains = <&rpmhpd SC7280_CX>;
e3e9a580380730 Rajendra Nayak                   2022-09-27  2057  				required-opps = <&rpmhpd_opp_low_svs>;
18bec7f725c518 Vinod Koul                       2022-04-21  2058  				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
18bec7f725c518 Vinod Koul                       2022-04-21  2059  				       <&gpi_dma1 1 7 QCOM_GPI_I2C>;
18bec7f725c518 Vinod Koul                       2022-04-21  2060  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2061  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2062  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2063  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2064  			spi15: spi@a9c000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2065  				compatible = "qcom,geni-spi";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2066  				reg = <0 0x00a9c000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2067  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2068  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2069  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2070  				pinctrl-0 = <&qup_spi15_data_clk>, <&qup_spi15_cs>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2071  				interrupts = <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2072  				#address-cells = <1>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2073  				#size-cells = <0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2074  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2075  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2076  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2077  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2078  				interconnect-names = "qup-core", "qup-config";
18bec7f725c518 Vinod Koul                       2022-04-21  2079  				dmas = <&gpi_dma1 0 7 QCOM_GPI_SPI>,
18bec7f725c518 Vinod Koul                       2022-04-21  2080  				       <&gpi_dma1 1 7 QCOM_GPI_SPI>;
18bec7f725c518 Vinod Koul                       2022-04-21  2081  				dma-names = "tx", "rx";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2082  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2083  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2084  
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2085  			uart15: serial@a9c000 {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2086  				compatible = "qcom,geni-uart";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2087  				reg = <0 0x00a9c000 0 0x4000>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2088  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2089  				clock-names = "se";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2090  				pinctrl-names = "default";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2091  				pinctrl-0 = <&qup_uart15_cts>, <&qup_uart15_rts>, <&qup_uart15_tx>, <&qup_uart15_rx>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2092  				interrupts = <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2093  				power-domains = <&rpmhpd SC7280_CX>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2094  				operating-points-v2 = <&qup_opp_table>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2095  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2096  						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2097  				interconnect-names = "qup-core", "qup-config";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2098  				status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2099  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2100  		};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  2101  
d9f33f465114b8 Om Prakash Singh                 2023-10-16  2102  		rng: rng@10d3000 {
d9f33f465114b8 Om Prakash Singh                 2023-10-16  2103  			compatible = "qcom,sc7280-trng", "qcom,trng";
d9f33f465114b8 Om Prakash Singh                 2023-10-16  2104  			reg = <0 0x010d3000 0 0x1000>;
d9f33f465114b8 Om Prakash Singh                 2023-10-16  2105  		};
d9f33f465114b8 Om Prakash Singh                 2023-10-16  2106  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2107  		cnoc2: interconnect@1500000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2108  			reg = <0 0x01500000 0 0x1000>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2109  			compatible = "qcom,sc7280-cnoc2";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2110  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2111  			qcom,bcm-voters = <&apps_bcm_voter>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2112  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2113  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2114  		cnoc3: interconnect@1502000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2115  			reg = <0 0x01502000 0 0x1000>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2116  			compatible = "qcom,sc7280-cnoc3";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2117  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2118  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2119  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2120  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2121  		mc_virt: interconnect@1580000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2122  			reg = <0 0x01580000 0 0x4>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2123  			compatible = "qcom,sc7280-mc-virt";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2124  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2125  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2126  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2127  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2128  		system_noc: interconnect@1680000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2129  			reg = <0 0x01680000 0 0x15480>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2130  			compatible = "qcom,sc7280-system-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2131  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2132  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2133  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  2134  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2135  		aggre1_noc: interconnect@16e0000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2136  			compatible = "qcom,sc7280-aggre1-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2137  			reg = <0 0x016e0000 0 0x1c080>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2138  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2139  			qcom,bcm-voters = <&apps_bcm_voter>;
2b5004956affaa Odelu Kukatla                    2024-06-07  2140  			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
2b5004956affaa Odelu Kukatla                    2024-06-07  2141  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2142  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  2143  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2144  		aggre2_noc: interconnect@1700000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2145  			reg = <0 0x01700000 0 0x2b080>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2146  			compatible = "qcom,sc7280-aggre2-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2147  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2148  			qcom,bcm-voters = <&apps_bcm_voter>;
2b5004956affaa Odelu Kukatla                    2024-06-07  2149  			clocks = <&rpmhcc RPMH_IPA_CLK>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2150  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  2151  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2152  		mmss_noc: interconnect@1740000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2153  			reg = <0 0x01740000 0 0x1e080>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2154  			compatible = "qcom,sc7280-mmss-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2155  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2156  			qcom,bcm-voters = <&apps_bcm_voter>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2157  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2158  
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2159  		wifi: wifi@17a10040 {
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2160  			compatible = "qcom,wcn6750-wifi";
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2161  			reg = <0 0x17a10040 0 0x0>;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2162  			iommus = <&apps_smmu 0x1c00 0x1>;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2163  			interrupts = <GIC_SPI 768 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2164  				     <GIC_SPI 769 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2165  				     <GIC_SPI 770 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2166  				     <GIC_SPI 771 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2167  				     <GIC_SPI 772 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2168  				     <GIC_SPI 773 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2169  				     <GIC_SPI 774 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2170  				     <GIC_SPI 775 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2171  				     <GIC_SPI 776 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2172  				     <GIC_SPI 777 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2173  				     <GIC_SPI 778 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2174  				     <GIC_SPI 779 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2175  				     <GIC_SPI 780 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2176  				     <GIC_SPI 781 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2177  				     <GIC_SPI 782 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2178  				     <GIC_SPI 783 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2179  				     <GIC_SPI 784 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2180  				     <GIC_SPI 785 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2181  				     <GIC_SPI 786 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2182  				     <GIC_SPI 787 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2183  				     <GIC_SPI 788 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2184  				     <GIC_SPI 789 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2185  				     <GIC_SPI 790 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2186  				     <GIC_SPI 791 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2187  				     <GIC_SPI 792 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2188  				     <GIC_SPI 793 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2189  				     <GIC_SPI 794 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2190  				     <GIC_SPI 795 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2191  				     <GIC_SPI 796 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2192  				     <GIC_SPI 797 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2193  				     <GIC_SPI 798 IRQ_TYPE_EDGE_RISING>,
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2194  				     <GIC_SPI 799 IRQ_TYPE_EDGE_RISING>;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2195  			qcom,rproc = <&remoteproc_wpss>;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2196  			memory-region = <&wlan_fw_mem>, <&wlan_ce_mem>;
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2197  			status = "disabled";
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17  2198  			qcom,smem-states = <&wlan_smp2p_out 0>;
42582b27dcb1cb Manikanta Pubbisetty             2022-10-17  2199  			qcom,smem-state-names = "wlan-smp2p-out";
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2200  		};
cdbfb815d63a79 Manikanta Pubbisetty             2022-04-06  2201  
052c9a1f1400f1 Manivannan Sadhasivam            2023-12-06  2202  		pcie1: pcie@1c08000 {
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2203  			compatible = "qcom,pcie-sc7280";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2204  			reg = <0 0x01c08000 0 0x3000>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2205  			      <0 0x40000000 0 0xf1d>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2206  			      <0 0x40000f20 0 0xa8>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2207  			      <0 0x40001000 0 0x1000>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2208  			      <0 0x40100000 0 0x100000>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2209  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2210  			reg-names = "parf", "dbi", "elbi", "atu", "config";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2211  			device_type = "pci";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2212  			linux,pci-domain = <1>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2213  			bus-range = <0x00 0xff>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2214  			num-lanes = <2>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2215  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2216  			#address-cells = <3>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2217  			#size-cells = <2>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2218  
1d4743d6312582 Manivannan Sadhasivam            2023-02-28  2219  			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2220  				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2221  
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2222  			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2223  				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2224  				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2225  				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2226  				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2227  				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2228  				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2229  				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2230  			interrupt-names = "msi0", "msi1", "msi2", "msi3",
b8ba66b40da323 Krishna chaitanya chundru        2023-12-18  2231  					  "msi4", "msi5", "msi6", "msi7";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2232  			#interrupt-cells = <1>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2233  			interrupt-map-mask = <0 0 0 0x7>;
66b788133030f0 Prasad Malisetty                 2021-11-16  2234  			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>,
66b788133030f0 Prasad Malisetty                 2021-11-16  2235  					<0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>,
66b788133030f0 Prasad Malisetty                 2021-11-16  2236  					<0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH>,
66b788133030f0 Prasad Malisetty                 2021-11-16  2237  					<0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2238  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2239  			clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2240  				 <&gcc GCC_PCIE_1_PIPE_CLK_SRC>,
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2241  				 <&pcie1_phy>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2242  				 <&rpmhcc RPMH_CXO_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2243  				 <&gcc GCC_PCIE_1_AUX_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2244  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2245  				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2246  				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2247  				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2248  				 <&gcc GCC_AGGRE_NOC_PCIE_TBU_CLK>,
aaf85b46aa4145 Krishna chaitanya chundru        2022-09-08  2249  				 <&gcc GCC_DDRSS_PCIE_SF_CLK>,
aaf85b46aa4145 Krishna chaitanya chundru        2022-09-08  2250  				 <&gcc GCC_AGGRE_NOC_PCIE_CENTER_SF_AXI_CLK>,
aaf85b46aa4145 Krishna chaitanya chundru        2022-09-08  2251  				 <&gcc GCC_AGGRE_NOC_PCIE_1_AXI_CLK>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2252  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2253  			clock-names = "pipe",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2254  				      "pipe_mux",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2255  				      "phy_pipe",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2256  				      "ref",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2257  				      "aux",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2258  				      "cfg",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2259  				      "bus_master",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2260  				      "bus_slave",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2261  				      "slave_q2a",
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2262  				      "tbu",
aaf85b46aa4145 Krishna chaitanya chundru        2022-09-08  2263  				      "ddrss_sf_tbu",
aaf85b46aa4145 Krishna chaitanya chundru        2022-09-08  2264  				      "aggre0",
aaf85b46aa4145 Krishna chaitanya chundru        2022-09-08  2265  				      "aggre1";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2266  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2267  			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2268  			assigned-clock-rates = <19200000>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2269  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2270  			resets = <&gcc GCC_PCIE_1_BCR>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2271  			reset-names = "pci";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2272  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2273  			power-domains = <&gcc GCC_PCIE_1_GDSC>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2274  
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2275  			phys = <&pcie1_phy>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2276  			phy-names = "pciephy";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2277  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2278  			pinctrl-names = "default";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2279  			pinctrl-0 = <&pcie1_clkreq_n>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2280  
8a63441e83724f Krishna chaitanya chundru        2023-02-28  2281  			dma-coherent;
8a63441e83724f Krishna chaitanya chundru        2023-02-28  2282  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2283  			iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2284  				    <0x100 &apps_smmu 0x1c81 0x1>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2285  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2286  			status = "disabled";
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2287  
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2288  			pcie@0 {
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2289  				device_type = "pci";
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2290  				reg = <0x0 0x0 0x0 0x0 0x0>;
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2291  				bus-range = <0x01 0xff>;
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2292  
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2293  				#address-cells = <3>;
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2294  				#size-cells = <2>;
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2295  				ranges;
df307c906c48d1 Manivannan Sadhasivam            2024-03-21  2296  			};
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2297  		};
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2298  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2299  		pcie1_phy: phy@1c0e000 {
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2300  			compatible = "qcom,sm8250-qmp-gen3x2-pcie-phy";
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2301  			reg = <0 0x01c0e000 0 0x1000>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2302  			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2303  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2304  				 <&gcc GCC_PCIE_CLKREF_EN>,
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2305  				 <&gcc GCC_PCIE1_PHY_RCHNG_CLK>,
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2306  				 <&gcc GCC_PCIE_1_PIPE_CLK>;
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2307  			clock-names = "aux",
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2308  				      "cfg_ahb",
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2309  				      "ref",
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2310  				      "refgen",
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2311  				      "pipe";
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2312  
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2313  			clock-output-names = "pcie_1_pipe_clk";
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2314  			#clock-cells = <0>;
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2315  
4a8fbb7c176a97 Dmitry Baryshkov                 2023-08-20  2316  			#phy-cells = <0>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2317  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2318  			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2319  			reset-names = "phy";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2320  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2321  			assigned-clocks = <&gcc GCC_PCIE1_PHY_RCHNG_CLK>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2322  			assigned-clock-rates = <100000000>;
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2323  
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2324  			status = "disabled";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2325  		};
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  2326  
15288649e4c037 Manivannan Sadhasivam            2024-05-14  2327  		ufs_mem_hc: ufshc@1d84000 {
c8a074789d71c1 Nitin Rawat                      2023-12-05  2328  			compatible = "qcom,sc7280-ufshc", "qcom,ufshc",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2329  				     "jedec,ufs-2.0";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2330  			reg = <0x0 0x01d84000 0x0 0x3000>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2331  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2332  			phys = <&ufs_mem_phy>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2333  			phy-names = "ufsphy";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2334  			lanes-per-direction = <2>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2335  			#reset-cells = <1>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2336  			resets = <&gcc GCC_UFS_PHY_BCR>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2337  			reset-names = "rst";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2338  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2339  			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2340  			required-opps = <&rpmhpd_opp_nom>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2341  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2342  			iommus = <&apps_smmu 0x80 0x0>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2343  			dma-coherent;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2344  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2345  			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
c8a074789d71c1 Nitin Rawat                      2023-12-05  2346  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2347  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
c8a074789d71c1 Nitin Rawat                      2023-12-05  2348  					 &cnoc2 SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2349  			interconnect-names = "ufs-ddr", "cpu-ufs";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2350  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2351  			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2352  				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2353  				 <&gcc GCC_UFS_PHY_AHB_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2354  				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2355  				 <&rpmhcc RPMH_CXO_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2356  				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2357  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2358  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2359  			clock-names = "core_clk",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2360  				      "bus_aggr_clk",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2361  				      "iface_clk",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2362  				      "core_clk_unipro",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2363  				      "ref_clk",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2364  				      "tx_lane0_sync_clk",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2365  				      "rx_lane0_sync_clk",
c8a074789d71c1 Nitin Rawat                      2023-12-05  2366  				      "rx_lane1_sync_clk";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2367  			freq-table-hz =
c8a074789d71c1 Nitin Rawat                      2023-12-05  2368  				<75000000 300000000>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2369  				<0 0>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2370  				<0 0>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2371  				<75000000 300000000>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2372  				<0 0>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2373  				<0 0>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2374  				<0 0>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2375  				<0 0>;
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2376  			qcom,ice = <&ice>;
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2377  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2378  			status = "disabled";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2379  		};
c8a074789d71c1 Nitin Rawat                      2023-12-05  2380  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2381  		ufs_mem_phy: phy@1d87000 {
c8a074789d71c1 Nitin Rawat                      2023-12-05  2382  			compatible = "qcom,sc7280-qmp-ufs-phy";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2383  			reg = <0x0 0x01d87000 0x0 0xe00>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2384  			clocks = <&rpmhcc RPMH_CXO_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2385  				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
c8a074789d71c1 Nitin Rawat                      2023-12-05  2386  				 <&gcc GCC_UFS_1_CLKREF_EN>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2387  			clock-names = "ref", "ref_aux", "qref";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2388  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2389  			power-domains = <&rpmhpd SC7280_MX>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2390  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2391  			resets = <&ufs_mem_hc 0>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2392  			reset-names = "ufsphy";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2393  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2394  			#clock-cells = <1>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2395  			#phy-cells = <0>;
c8a074789d71c1 Nitin Rawat                      2023-12-05  2396  
c8a074789d71c1 Nitin Rawat                      2023-12-05  2397  			status = "disabled";
c8a074789d71c1 Nitin Rawat                      2023-12-05  2398  		};
c8a074789d71c1 Nitin Rawat                      2023-12-05  2399  
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2400  		ice: crypto@1d88000 {
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2401  			compatible = "qcom,sc7280-inline-crypto-engine",
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2402  				     "qcom,inline-crypto-engine";
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2403  			reg = <0 0x01d88000 0 0x8000>;
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2404  			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2405  		};
dfd5ee7b34bb76 Luca Weiss                       2024-03-13  2406  
d488f903a86002 Om Prakash Singh                 2023-12-14  2407  		cryptobam: dma-controller@1dc4000 {
d488f903a86002 Om Prakash Singh                 2023-12-14  2408  			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
d488f903a86002 Om Prakash Singh                 2023-12-14  2409  			reg = <0x0 0x01dc4000 0x0 0x28000>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2410  			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2411  			#dma-cells = <1>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2412  			iommus = <&apps_smmu 0x4e4 0x0011>,
d488f903a86002 Om Prakash Singh                 2023-12-14  2413  				 <&apps_smmu 0x4e6 0x0011>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2414  			qcom,ee = <0>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2415  			qcom,controlled-remotely;
40ec6a2817d927 Luca Weiss                       2023-12-29  2416  			num-channels = <16>;
40ec6a2817d927 Luca Weiss                       2023-12-29  2417  			qcom,num-ees = <4>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2418  		};
d488f903a86002 Om Prakash Singh                 2023-12-14  2419  
d488f903a86002 Om Prakash Singh                 2023-12-14  2420  		crypto: crypto@1dfa000 {
d488f903a86002 Om Prakash Singh                 2023-12-14  2421  			compatible = "qcom,sc7280-qce", "qcom,sm8150-qce", "qcom,qce";
d488f903a86002 Om Prakash Singh                 2023-12-14  2422  			reg = <0x0 0x01dfa000 0x0 0x6000>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2423  			dmas = <&cryptobam 4>, <&cryptobam 5>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2424  			dma-names = "rx", "tx";
d488f903a86002 Om Prakash Singh                 2023-12-14  2425  			iommus = <&apps_smmu 0x4e4 0x0011>,
d488f903a86002 Om Prakash Singh                 2023-12-14  2426  				 <&apps_smmu 0x4e4 0x0011>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2427  			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
d488f903a86002 Om Prakash Singh                 2023-12-14  2428  			interconnect-names = "memory";
d488f903a86002 Om Prakash Singh                 2023-12-14  2429  		};
d488f903a86002 Om Prakash Singh                 2023-12-14  2430  
fc4f0273d4fba2 Alex Elder                       2021-08-04  2431  		ipa: ipa@1e40000 {
fc4f0273d4fba2 Alex Elder                       2021-08-04  2432  			compatible = "qcom,sc7280-ipa";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2433  
fc4f0273d4fba2 Alex Elder                       2021-08-04  2434  			iommus = <&apps_smmu 0x480 0x0>,
fc4f0273d4fba2 Alex Elder                       2021-08-04  2435  				 <&apps_smmu 0x482 0x0>;
94ca994d7e932c Konrad Dybcio                    2023-01-02  2436  			reg = <0 0x01e40000 0 0x8000>,
94ca994d7e932c Konrad Dybcio                    2023-01-02  2437  			      <0 0x01e50000 0 0x4ad0>,
94ca994d7e932c Konrad Dybcio                    2023-01-02  2438  			      <0 0x01e04000 0 0x23000>;
fc4f0273d4fba2 Alex Elder                       2021-08-04  2439  			reg-names = "ipa-reg",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2440  				    "ipa-shared",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2441  				    "gsi";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2442  
33b89923d02153 Stephen Boyd                     2021-08-11  2443  			interrupts-extended = <&intc GIC_SPI 654 IRQ_TYPE_EDGE_RISING>,
33b89923d02153 Stephen Boyd                     2021-08-11  2444  					      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
fc4f0273d4fba2 Alex Elder                       2021-08-04  2445  					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
fc4f0273d4fba2 Alex Elder                       2021-08-04  2446  					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
fc4f0273d4fba2 Alex Elder                       2021-08-04  2447  			interrupt-names = "ipa",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2448  					  "gsi",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2449  					  "ipa-clock-query",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2450  					  "ipa-setup-ready";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2451  
fc4f0273d4fba2 Alex Elder                       2021-08-04  2452  			clocks = <&rpmhcc RPMH_IPA_CLK>;
fc4f0273d4fba2 Alex Elder                       2021-08-04  2453  			clock-names = "core";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2454  
fc4f0273d4fba2 Alex Elder                       2021-08-04  2455  			interconnects = <&aggre2_noc MASTER_IPA 0 &mc_virt SLAVE_EBI1 0>,
fc4f0273d4fba2 Alex Elder                       2021-08-04  2456  					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_IPA_CFG 0>;
fc4f0273d4fba2 Alex Elder                       2021-08-04  2457  			interconnect-names = "memory",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2458  					     "config";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2459  
73419e4d2fd1b8 Alex Elder                       2022-02-01  2460  			qcom,qmp = <&aoss_qmp>;
73419e4d2fd1b8 Alex Elder                       2022-02-01  2461  
fc4f0273d4fba2 Alex Elder                       2021-08-04  2462  			qcom,smem-states = <&ipa_smp2p_out 0>,
fc4f0273d4fba2 Alex Elder                       2021-08-04  2463  					   <&ipa_smp2p_out 1>;
fc4f0273d4fba2 Alex Elder                       2021-08-04  2464  			qcom,smem-state-names = "ipa-clock-enabled-valid",
fc4f0273d4fba2 Alex Elder                       2021-08-04  2465  						"ipa-clock-enabled";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2466  
fc4f0273d4fba2 Alex Elder                       2021-08-04  2467  			status = "disabled";
fc4f0273d4fba2 Alex Elder                       2021-08-04  2468  		};
fc4f0273d4fba2 Alex Elder                       2021-08-04  2469  
c3bbe55c942d2a Sibi Sankar                      2021-04-27  2470  		tcsr_mutex: hwlock@1f40000 {
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2471  			compatible = "qcom,tcsr-mutex";
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2472  			reg = <0 0x01f40000 0 0x20000>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27  2473  			#hwlock-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2474  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27  2475  
d0909bf4fa0fd7 Johan Hovold                     2022-09-05  2476  		tcsr_1: syscon@1f60000 {
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2477  			compatible = "qcom,sc7280-tcsr", "syscon";
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2478  			reg = <0 0x01f60000 0 0x20000>;
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2479  		};
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2480  
d9a2214d6ba5b6 Krzysztof Kozlowski              2022-08-19  2481  		tcsr_2: syscon@1fc0000 {
dddf4b0621d61b Sibi Sankar                      2021-09-17  2482  			compatible = "qcom,sc7280-tcsr", "syscon";
dddf4b0621d61b Sibi Sankar                      2021-09-17  2483  			reg = <0 0x01fc0000 0 0x30000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2484  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  2485  
422a295221bba8 Taniya Das                       2021-04-10  2486  		lpasscc: lpasscc@3000000 {
422a295221bba8 Taniya Das                       2021-04-10  2487  			compatible = "qcom,sc7280-lpasscc";
422a295221bba8 Taniya Das                       2021-04-10  2488  			reg = <0 0x03000000 0 0x40>,
8c7ebabd2e3f33 Satya Priya                      2022-08-10  2489  			      <0 0x03c04000 0 0x4>;
8c7ebabd2e3f33 Satya Priya                      2022-08-10  2490  			reg-names = "qdsp6ss", "top_cc";
422a295221bba8 Taniya Das                       2021-04-10  2491  			clocks = <&gcc GCC_CFG_NOC_LPASS_CLK>;
422a295221bba8 Taniya Das                       2021-04-10  2492  			clock-names = "iface";
422a295221bba8 Taniya Das                       2021-04-10  2493  			#clock-cells = <1>;
6da24ba932082b Luca Weiss                       2023-09-19  2494  			status = "reserved"; /* Owned by ADSP firmware */
422a295221bba8 Taniya Das                       2021-04-10  2495  		};
422a295221bba8 Taniya Das                       2021-04-10  2496  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2497  		lpass_rx_macro: codec@3200000 {
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2498  			compatible = "qcom,sc7280-lpass-rx-macro";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2499  			reg = <0 0x03200000 0 0x1000>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2500  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2501  			pinctrl-names = "default";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2502  			pinctrl-0 = <&lpass_rx_swr_clk>, <&lpass_rx_swr_data>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2503  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2504  			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2505  				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2506  				 <&lpass_va_macro>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2507  			clock-names = "mclk", "npl", "fsgen";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2508  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2509  			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2510  					<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2511  			power-domain-names = "macro", "dcodec";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2512  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2513  			#clock-cells = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2514  			#sound-dai-cells = <1>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2515  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2516  			status = "disabled";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2517  		};
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2518  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2519  		swr0: soundwire@3210000 {
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2520  			compatible = "qcom,soundwire-v1.6.0";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2521  			reg = <0 0x03210000 0 0x2000>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2522  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2523  			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2524  			clocks = <&lpass_rx_macro>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2525  			clock-names = "iface";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2526  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2527  			qcom,din-ports = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2528  			qcom,dout-ports = <5>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2529  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2530  			resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2531  			reset-names = "swr_audio_cgcr";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2532  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2533  			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2534  			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x3f 0x1f 0x03 0x03>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2535  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x01>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2536  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2537  			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2538  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2539  			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2540  			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2541  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2542  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2543  			#sound-dai-cells = <1>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2544  			#address-cells = <2>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2545  			#size-cells = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2546  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2547  			status = "disabled";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2548  		};
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2549  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2550  		lpass_tx_macro: codec@3220000 {
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2551  			compatible = "qcom,sc7280-lpass-tx-macro";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2552  			reg = <0 0x03220000 0 0x1000>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2553  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2554  			pinctrl-names = "default";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2555  			pinctrl-0 = <&lpass_tx_swr_clk>, <&lpass_tx_swr_data>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2556  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2557  			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2558  				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2559  				 <&lpass_va_macro>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2560  			clock-names = "mclk", "npl", "fsgen";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2561  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2562  			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2563  					<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2564  			power-domain-names = "macro", "dcodec";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2565  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2566  			#clock-cells = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2567  			#sound-dai-cells = <1>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2568  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2569  			status = "disabled";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2570  		};
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2571  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2572  		swr1: soundwire@3230000 {
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2573  			compatible = "qcom,soundwire-v1.6.0";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2574  			reg = <0 0x03230000 0 0x2000>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2575  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2576  			interrupts-extended = <&intc GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2577  					      <&pdc 130 IRQ_TYPE_LEVEL_HIGH>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2578  			clocks = <&lpass_tx_macro>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2579  			clock-names = "iface";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2580  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2581  			qcom,din-ports = <3>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2582  			qcom,dout-ports = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2583  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2584  			resets = <&lpass_audiocc LPASS_AUDIO_SWR_TX_CGCR>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2585  			reset-names = "swr_audio_cgcr";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2586  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2587  			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x03 0x03>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2588  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x00 0x02>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2589  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2590  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2591  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2592  			qcom,ports-word-length =	/bits/ 8 <0xff 0x00 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2593  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2594  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2595  			qcom,ports-lane-control =	/bits/ 8 <0x00 0x01 0x00>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2596  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2597  			#sound-dai-cells = <1>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2598  			#address-cells = <2>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2599  			#size-cells = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2600  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2601  			status = "disabled";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2602  		};
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2603  
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2604  		lpass_wsa_macro: codec@3240000 {
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2605  			compatible = "qcom,sc7280-lpass-wsa-macro";
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2606  			reg = <0x0 0x03240000 0x0 0x1000>;
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2607  
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2608  			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2609  				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2610  				 <&lpass_va_macro>;
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2611  			clock-names = "mclk", "npl", "fsgen";
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2612  
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2613  			pinctrl-names = "default";
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2614  			pinctrl-0 = <&lpass_wsa_swr_clk>, <&lpass_wsa_swr_data>;
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2615  
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2616  			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2617  					<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2618  			power-domain-names = "macro", "dcodec";
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2619  
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2620  			#clock-cells = <0>;
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2621  			clock-output-names = "mclk";
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2622  			#sound-dai-cells = <1>;
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2623  
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2624  			status = "disabled";
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2625  		};
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2626  
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2627  		swr2: soundwire@3250000 {
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2628  			compatible = "qcom,soundwire-v1.6.0";
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2629  			reg = <0x0 0x03250000 0x0 0x2000>;
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2630  
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2631  			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2632  			clocks = <&lpass_wsa_macro>;
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2633  			clock-names = "iface";
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2634  
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2635  			resets = <&lpass_audiocc LPASS_AUDIO_SWR_WSA_CGCR>;
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2636  			reset-names = "swr_audio_cgcr";
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2637  
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2638  			qcom,din-ports = <2>;
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2639  			qcom,dout-ports = <6>;
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2640  
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2641  			qcom,ports-sinterval-low = /bits/ 8 <0x07 0x1f 0x3f 0x07
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2642  								0x1f 0x3f 0x0f 0x0f>;
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2643  			qcom,ports-offset1 = /bits/ 8 <0x01 0x02 0x0c 0x06 0x12 0x0d 0x07 0x0a>;
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2644  			qcom,ports-offset2 = /bits/ 8 <0xff 0x00 0x1f 0xff 0x00 0x1f 0x00 0x00>;
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2645  			qcom,ports-hstart = /bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2646  			qcom,ports-hstop = /bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2647  			qcom,ports-word-length = /bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2648  			qcom,ports-block-pack-mode = /bits/ 8 <0xff 0xff 0x01 0xff 0xff 0x01
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2649  							       0xff 0xff>;
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2650  			qcom,ports-block-group-count = /bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2651  								0xff 0xff>;
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2652  			qcom,ports-lane-control = /bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2653  							    0xff 0xff>;
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2654  
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2655  			#address-cells = <2>;
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2656  			#size-cells = <0>;
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2657  			#sound-dai-cells = <1>;
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2658  
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2659  			status = "disabled";
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2660  		};
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2661  
9499240d15f297 Taniya Das                       2022-02-02  2662  		lpass_audiocc: clock-controller@3300000 {
9499240d15f297 Taniya Das                       2022-02-02  2663  			compatible = "qcom,sc7280-lpassaudiocc";
cb1d0aaa674e99 Satya Priya                      2022-09-20  2664  			reg = <0 0x03300000 0 0x30000>,
cb1d0aaa674e99 Satya Priya                      2022-09-20  2665  			      <0 0x032a9000 0 0x1000>;
9499240d15f297 Taniya Das                       2022-02-02  2666  			clocks = <&rpmhcc RPMH_CXO_CLK>,
9499240d15f297 Taniya Das                       2022-02-02  2667  			       <&lpass_aon LPASS_AON_CC_MAIN_RCG_CLK_SRC>;
9499240d15f297 Taniya Das                       2022-02-02  2668  			clock-names = "bi_tcxo", "lpass_aon_cc_main_rcg_clk_src";
9499240d15f297 Taniya Das                       2022-02-02  2669  			power-domains = <&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
9499240d15f297 Taniya Das                       2022-02-02  2670  			#clock-cells = <1>;
9499240d15f297 Taniya Das                       2022-02-02  2671  			#power-domain-cells = <1>;
e02a16c23410a1 Taniya Das                       2022-08-10  2672  			#reset-cells = <1>;
9499240d15f297 Taniya Das                       2022-02-02  2673  		};
9499240d15f297 Taniya Das                       2022-02-02  2674  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2675  		lpass_va_macro: codec@3370000 {
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2676  			compatible = "qcom,sc7280-lpass-va-macro";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2677  			reg = <0 0x03370000 0 0x1000>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2678  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2679  			pinctrl-names = "default";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2680  			pinctrl-0 = <&lpass_dmic01_clk>, <&lpass_dmic01_data>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2681  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2682  			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2683  			clock-names = "mclk";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2684  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2685  			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2686  					<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2687  			power-domain-names = "macro", "dcodec";
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2688  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2689  			#clock-cells = <0>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2690  			#sound-dai-cells = <1>;
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2691  
12ef689f09abb5 Srinivasa Rao Mandadapu          2022-07-07  2692  			status = "disabled";
9499240d15f297 Taniya Das                       2022-02-02  2693  		};
9499240d15f297 Taniya Das                       2022-02-02  2694  
9499240d15f297 Taniya Das                       2022-02-02  2695  		lpass_aon: clock-controller@3380000 {
9499240d15f297 Taniya Das                       2022-02-02  2696  			compatible = "qcom,sc7280-lpassaoncc";
9499240d15f297 Taniya Das                       2022-02-02  2697  			reg = <0 0x03380000 0 0x30000>;
9499240d15f297 Taniya Das                       2022-02-02  2698  			clocks = <&rpmhcc RPMH_CXO_CLK>,
9499240d15f297 Taniya Das                       2022-02-02  2699  			       <&rpmhcc RPMH_CXO_CLK_A>,
d9a1e922730389 Satya Priya                      2022-08-10  2700  			       <&lpass_core LPASS_CORE_CC_CORE_CLK>;
9499240d15f297 Taniya Das                       2022-02-02  2701  			clock-names = "bi_tcxo", "bi_tcxo_ao", "iface";
9499240d15f297 Taniya Das                       2022-02-02  2702  			#clock-cells = <1>;
9499240d15f297 Taniya Das                       2022-02-02  2703  			#power-domain-cells = <1>;
6da24ba932082b Luca Weiss                       2023-09-19  2704  			status = "reserved"; /* Owned by ADSP firmware */
9499240d15f297 Taniya Das                       2022-02-02  2705  		};
9499240d15f297 Taniya Das                       2022-02-02  2706  
d9a1e922730389 Satya Priya                      2022-08-10  2707  		lpass_core: clock-controller@3900000 {
9499240d15f297 Taniya Das                       2022-02-02  2708  			compatible = "qcom,sc7280-lpasscorecc";
9499240d15f297 Taniya Das                       2022-02-02  2709  			reg = <0 0x03900000 0 0x50000>;
9499240d15f297 Taniya Das                       2022-02-02  2710  			clocks = <&rpmhcc RPMH_CXO_CLK>;
9499240d15f297 Taniya Das                       2022-02-02  2711  			clock-names = "bi_tcxo";
9499240d15f297 Taniya Das                       2022-02-02  2712  			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>;
9499240d15f297 Taniya Das                       2022-02-02  2713  			#clock-cells = <1>;
9499240d15f297 Taniya Das                       2022-02-02  2714  			#power-domain-cells = <1>;
6da24ba932082b Luca Weiss                       2023-09-19  2715  			status = "reserved"; /* Owned by ADSP firmware */
9499240d15f297 Taniya Das                       2022-02-02  2716  		};
9499240d15f297 Taniya Das                       2022-02-02  2717  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2718  		lpass_cpu: audio@3987000 {
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2719  			compatible = "qcom,sc7280-lpass-cpu";
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2720  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2721  			reg = <0 0x03987000 0 0x68000>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2722  			      <0 0x03b00000 0 0x29000>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2723  			      <0 0x03260000 0 0xc000>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2724  			      <0 0x03280000 0 0x29000>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2725  			      <0 0x03340000 0 0x29000>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2726  			      <0 0x0336c000 0 0x3000>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2727  			reg-names = "lpass-hdmiif",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2728  				    "lpass-lpaif",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2729  				    "lpass-rxtx-cdc-dma-lpm",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2730  				    "lpass-rxtx-lpaif",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2731  				    "lpass-va-lpaif",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2732  				    "lpass-va-cdc-dma-lpm";
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2733  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2734  			iommus = <&apps_smmu 0x1820 0>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2735  				 <&apps_smmu 0x1821 0>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2736  				 <&apps_smmu 0x1832 0>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2737  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2738  			power-domains = <&rpmhpd SC7280_LCX>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2739  			power-domain-names = "lcx";
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2740  			required-opps = <&rpmhpd_opp_nom>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2741  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2742  			clocks = <&lpass_aon LPASS_AON_CC_AUDIO_HM_H_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2743  				 <&lpass_core LPASS_CORE_CC_EXT_MCLK0_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2744  				 <&lpass_core LPASS_CORE_CC_SYSNOC_MPORT_CORE_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2745  				 <&lpass_core LPASS_CORE_CC_EXT_IF0_IBIT_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2746  				 <&lpass_core LPASS_CORE_CC_EXT_IF1_IBIT_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2747  				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2748  				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM0_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2749  				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM1_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2750  				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM2_CLK>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2751  				 <&lpass_aon LPASS_AON_CC_VA_MEM0_CLK>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2752  			clock-names = "aon_cc_audio_hm_h",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2753  				      "audio_cc_ext_mclk0",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2754  				      "core_cc_sysnoc_mport_core",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2755  				      "core_cc_ext_if0_ibit",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2756  				      "core_cc_ext_if1_ibit",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2757  				      "audio_cc_codec_mem",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2758  				      "audio_cc_codec_mem0",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2759  				      "audio_cc_codec_mem1",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2760  				      "audio_cc_codec_mem2",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2761  				      "aon_cc_va_mem0";
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2762  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2763  			#sound-dai-cells = <1>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2764  			#address-cells = <1>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2765  			#size-cells = <0>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2766  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2767  			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2768  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2769  				     <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2770  				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2771  			interrupt-names = "lpass-irq-lpaif",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2772  					  "lpass-irq-hdmi",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2773  					  "lpass-irq-vaif",
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2774  					  "lpass-irq-rxtxif";
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2775  
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2776  			status = "disabled";
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2777  		};
aee6873edb93a3 Srinivasa Rao Mandadapu          2022-07-07  2778  
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2779  		slimbam: dma-controller@3a84000 {
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2780  			compatible = "qcom,bam-v1.7.0";
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2781  			reg = <0 0x03a84000 0 0x20000>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2782  			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2783  			#dma-cells = <1>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2784  			qcom,controlled-remotely;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2785  			num-channels = <31>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2786  			qcom,ee = <1>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2787  			qcom,num-ees = <2>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2788  			iommus = <&apps_smmu 0x1826 0x0>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2789  			status = "disabled";
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2790  		};
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2791  
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2792  		slim: slim-ngd@3ac0000 {
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2793  			compatible = "qcom,slim-ngd-v1.5.0";
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2794  			reg = <0 0x03ac0000 0 0x2c000>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2795  			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2796  			dmas = <&slimbam 3>, <&slimbam 4>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2797  			dma-names = "rx", "tx";
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2798  			iommus = <&apps_smmu 0x1826 0x0>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2799  			#address-cells = <1>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2800  			#size-cells = <0>;
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2801  			status = "disabled";
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2802  		};
498006fd49c2d8 Viken Dadhaniya                  2024-02-15  2803  
9499240d15f297 Taniya Das                       2022-02-02  2804  		lpass_hm: clock-controller@3c00000 {
9499240d15f297 Taniya Das                       2022-02-02  2805  			compatible = "qcom,sc7280-lpasshm";
94ca994d7e932c Konrad Dybcio                    2023-01-02  2806  			reg = <0 0x03c00000 0 0x28>;
9499240d15f297 Taniya Das                       2022-02-02  2807  			clocks = <&rpmhcc RPMH_CXO_CLK>;
9499240d15f297 Taniya Das                       2022-02-02  2808  			clock-names = "bi_tcxo";
9499240d15f297 Taniya Das                       2022-02-02  2809  			#clock-cells = <1>;
9499240d15f297 Taniya Das                       2022-02-02  2810  			#power-domain-cells = <1>;
6da24ba932082b Luca Weiss                       2023-09-19  2811  			status = "reserved"; /* Owned by ADSP firmware */
9499240d15f297 Taniya Das                       2022-02-02  2812  		};
9499240d15f297 Taniya Das                       2022-02-02  2813  
297e6e38320f32 Odelu Kukatla                    2021-04-27  2814  		lpass_ag_noc: interconnect@3c40000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  2815  			reg = <0 0x03c40000 0 0xf080>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2816  			compatible = "qcom,sc7280-lpass-ag-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  2817  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2818  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  2819  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  2820  
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2821  		lpass_tlmm: pinctrl@33c0000 {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2822  			compatible = "qcom,sc7280-lpass-lpi-pinctrl";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2823  			reg = <0 0x033c0000 0x0 0x20000>,
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2824  				<0 0x03550000 0x0 0x10000>;
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2825  			gpio-controller;
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2826  			#gpio-cells = <2>;
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2827  			gpio-ranges = <&lpass_tlmm 0 0 15>;
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2828  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2829  			lpass_dmic01_clk: dmic01-clk-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2830  				pins = "gpio6";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2831  				function = "dmic1_clk";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2832  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2833  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2834  			lpass_dmic01_data: dmic01-data-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2835  				pins = "gpio7";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2836  				function = "dmic1_data";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2837  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2838  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2839  			lpass_dmic23_clk: dmic23-clk-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2840  				pins = "gpio8";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2841  				function = "dmic2_clk";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2842  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2843  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2844  			lpass_dmic23_data: dmic23-data-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2845  				pins = "gpio9";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2846  				function = "dmic2_data";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2847  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2848  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2849  			lpass_rx_swr_clk: rx-swr-clk-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2850  				pins = "gpio3";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2851  				function = "swr_rx_clk";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2852  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2853  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2854  			lpass_rx_swr_data: rx-swr-data-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2855  				pins = "gpio4", "gpio5";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2856  				function = "swr_rx_data";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2857  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2858  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2859  			lpass_tx_swr_clk: tx-swr-clk-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2860  				pins = "gpio0";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2861  				function = "swr_tx_clk";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2862  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2863  
886a50bd031aae Krzysztof Kozlowski              2022-09-27  2864  			lpass_tx_swr_data: tx-swr-data-state {
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2865  				pins = "gpio1", "gpio2", "gpio14";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2866  				function = "swr_tx_data";
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2867  			};
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2868  
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2869  			lpass_wsa_swr_clk: wsa-swr-clk-state {
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2870  				pins = "gpio10";
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2871  				function = "wsa_swr_clk";
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2872  			};
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2873  
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2874  			lpass_wsa_swr_data: wsa-swr-data-state {
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2875  				pins = "gpio11";
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2876  				function = "wsa_swr_data";
4938ea23aa31c8 Mohammad Rafi Shaik              2025-04-29  2877  			};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2878  		};
32d4541abe0f98 Srinivasa Rao Mandadapu          2022-06-13  2879  
b39f266c19f02c Manaf Meethalavalappu Pallikunhi 2021-08-11  2880  		gpu: gpu@3d00000 {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2881  			compatible = "qcom,adreno-635.0", "qcom,adreno";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2882  			reg = <0 0x03d00000 0 0x40000>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2883  			      <0 0x03d9e000 0 0x1000>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2884  			      <0 0x03d61000 0 0x800>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2885  			reg-names = "kgsl_3d0_reg_memory",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2886  				    "cx_mem",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2887  				    "cx_dbgc";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2888  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
94085049fdad7a Konrad Dybcio                    2023-11-20  2889  			iommus = <&adreno_smmu 0 0x400>,
94085049fdad7a Konrad Dybcio                    2023-11-20  2890  				 <&adreno_smmu 1 0x400>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2891  			operating-points-v2 = <&gpu_opp_table>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2892  			qcom,gmu = <&gmu>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2893  			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2894  			interconnect-names = "gfx-mem";
b39f266c19f02c Manaf Meethalavalappu Pallikunhi 2021-08-11  2895  			#cooling-cells = <2>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2896  
3bfef00d767124 Akhil P Oommen                   2022-02-26  2897  			nvmem-cells = <&gpu_speed_bin>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2898  			nvmem-cell-names = "speed_bin";
3bfef00d767124 Akhil P Oommen                   2022-02-26  2899  
94d5ffab9d5ebc Dmitry Baryshkov                 2024-09-07  2900  			status = "disabled";
94d5ffab9d5ebc Dmitry Baryshkov                 2024-09-07  2901  
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20  2902  			gpu_zap_shader: zap-shader {
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20  2903  				memory-region = <&gpu_zap_mem>;
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20  2904  			};
0ab1bef0b7c359 Konrad Dybcio                    2023-11-20  2905  
96c471970b7bcb Akhil P Oommen                   2021-08-11  2906  			gpu_opp_table: opp-table {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2907  				compatible = "operating-points-v2";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2908  
96c471970b7bcb Akhil P Oommen                   2021-08-11  2909  				opp-315000000 {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2910  					opp-hz = /bits/ 64 <315000000>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2911  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2912  					opp-peak-kBps = <1804000>;
f92dbc3807a92f Eugene Lepshy                    2024-10-14  2913  					opp-supported-hw = <0x17>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2914  				};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2915  
96c471970b7bcb Akhil P Oommen                   2021-08-11  2916  				opp-450000000 {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2917  					opp-hz = /bits/ 64 <450000000>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2918  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2919  					opp-peak-kBps = <4068000>;
f92dbc3807a92f Eugene Lepshy                    2024-10-14  2920  					opp-supported-hw = <0x17>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2921  				};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2922  
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2923  				/* Only applicable for SKUs which has 550Mhz as Fmax */
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2924  				opp-550000000-0 {
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2925  					opp-hz = /bits/ 64 <550000000>;
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2926  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2927  					opp-peak-kBps = <8368000>;
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2928  					opp-supported-hw = <0x01>;
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2929  				};
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2930  
ad3b0f33fa54b4 Akhil P Oommen                   2022-08-29  2931  				opp-550000000-1 {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2932  					opp-hz = /bits/ 64 <550000000>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2933  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2934  					opp-peak-kBps = <6832000>;
f92dbc3807a92f Eugene Lepshy                    2024-10-14  2935  					opp-supported-hw = <0x16>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2936  				};
3bfef00d767124 Akhil P Oommen                   2022-02-26  2937  
3bfef00d767124 Akhil P Oommen                   2022-02-26  2938  				opp-608000000 {
3bfef00d767124 Akhil P Oommen                   2022-02-26  2939  					opp-hz = /bits/ 64 <608000000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2940  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2941  					opp-peak-kBps = <8368000>;
f92dbc3807a92f Eugene Lepshy                    2024-10-14  2942  					opp-supported-hw = <0x16>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2943  				};
3bfef00d767124 Akhil P Oommen                   2022-02-26  2944  
3bfef00d767124 Akhil P Oommen                   2022-02-26  2945  				opp-700000000 {
3bfef00d767124 Akhil P Oommen                   2022-02-26  2946  					opp-hz = /bits/ 64 <700000000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2947  					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2948  					opp-peak-kBps = <8532000>;
6a7f8c635dab30 Konrad Dybcio                    2023-11-20  2949  					opp-supported-hw = <0x06>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2950  				};
3bfef00d767124 Akhil P Oommen                   2022-02-26  2951  
3bfef00d767124 Akhil P Oommen                   2022-02-26  2952  				opp-812000000 {
3bfef00d767124 Akhil P Oommen                   2022-02-26  2953  					opp-hz = /bits/ 64 <812000000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2954  					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2955  					opp-peak-kBps = <8532000>;
6a7f8c635dab30 Konrad Dybcio                    2023-11-20  2956  					opp-supported-hw = <0x06>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2957  				};
3bfef00d767124 Akhil P Oommen                   2022-02-26  2958  
3bfef00d767124 Akhil P Oommen                   2022-02-26  2959  				opp-840000000 {
3bfef00d767124 Akhil P Oommen                   2022-02-26  2960  					opp-hz = /bits/ 64 <840000000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2961  					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2962  					opp-peak-kBps = <8532000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2963  					opp-supported-hw = <0x02>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2964  				};
3bfef00d767124 Akhil P Oommen                   2022-02-26  2965  
3bfef00d767124 Akhil P Oommen                   2022-02-26  2966  				opp-900000000 {
3bfef00d767124 Akhil P Oommen                   2022-02-26  2967  					opp-hz = /bits/ 64 <900000000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2968  					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2969  					opp-peak-kBps = <8532000>;
3bfef00d767124 Akhil P Oommen                   2022-02-26  2970  					opp-supported-hw = <0x02>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2971  				};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2972  			};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2973  		};
96c471970b7bcb Akhil P Oommen                   2021-08-11  2974  
142a4d995c6adb Douglas Anderson                 2022-01-25  2975  		gmu: gmu@3d6a000 {
96c471970b7bcb Akhil P Oommen                   2021-08-11  2976  			compatible = "qcom,adreno-gmu-635.0", "qcom,adreno-gmu";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2977  			reg = <0 0x03d6a000 0 0x34000>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2978  				<0 0x3de0000 0 0x10000>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2979  				<0 0x0b290000 0 0x10000>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2980  			reg-names = "gmu", "rscc", "gmu_pdc";
96c471970b7bcb Akhil P Oommen                   2021-08-11  2981  			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2982  					<GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2983  			interrupt-names = "hfi", "gmu";
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2984  			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2985  				 <&gpucc GPU_CC_CXO_CLK>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2986  				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  2987  				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2988  				 <&gpucc GPU_CC_AHB_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2989  				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2990  				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  2991  			clock-names = "gmu",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2992  				      "cxo",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2993  				      "axi",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2994  				      "memnoc",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2995  				      "ahb",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2996  				      "hub",
96c471970b7bcb Akhil P Oommen                   2021-08-11  2997  				      "smmu_vote";
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2998  			power-domains = <&gpucc GPU_CC_CX_GDSC>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  2999  					<&gpucc GPU_CC_GX_GDSC>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  3000  			power-domain-names = "cx",
96c471970b7bcb Akhil P Oommen                   2021-08-11  3001  					     "gx";
96c471970b7bcb Akhil P Oommen                   2021-08-11  3002  			iommus = <&adreno_smmu 5 0x400>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  3003  			operating-points-v2 = <&gmu_opp_table>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  3004  
96c471970b7bcb Akhil P Oommen                   2021-08-11  3005  			gmu_opp_table: opp-table {
96c471970b7bcb Akhil P Oommen                   2021-08-11  3006  				compatible = "operating-points-v2";
96c471970b7bcb Akhil P Oommen                   2021-08-11  3007  
96c471970b7bcb Akhil P Oommen                   2021-08-11  3008  				opp-200000000 {
96c471970b7bcb Akhil P Oommen                   2021-08-11  3009  					opp-hz = /bits/ 64 <200000000>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  3010  					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  3011  				};
96c471970b7bcb Akhil P Oommen                   2021-08-11  3012  			};
96c471970b7bcb Akhil P Oommen                   2021-08-11  3013  		};
96c471970b7bcb Akhil P Oommen                   2021-08-11  3014  
422a295221bba8 Taniya Das                       2021-04-10  3015  		gpucc: clock-controller@3d90000 {
422a295221bba8 Taniya Das                       2021-04-10  3016  			compatible = "qcom,sc7280-gpucc";
422a295221bba8 Taniya Das                       2021-04-10  3017  			reg = <0 0x03d90000 0 0x9000>;
422a295221bba8 Taniya Das                       2021-04-10  3018  			clocks = <&rpmhcc RPMH_CXO_CLK>,
422a295221bba8 Taniya Das                       2021-04-10  3019  				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
422a295221bba8 Taniya Das                       2021-04-10  3020  				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
422a295221bba8 Taniya Das                       2021-04-10  3021  			clock-names = "bi_tcxo",
422a295221bba8 Taniya Das                       2021-04-10  3022  				      "gcc_gpu_gpll0_clk_src",
422a295221bba8 Taniya Das                       2021-04-10  3023  				      "gcc_gpu_gpll0_div_clk_src";
422a295221bba8 Taniya Das                       2021-04-10  3024  			#clock-cells = <1>;
422a295221bba8 Taniya Das                       2021-04-10  3025  			#reset-cells = <1>;
422a295221bba8 Taniya Das                       2021-04-10  3026  			#power-domain-cells = <1>;
422a295221bba8 Taniya Das                       2021-04-10  3027  		};
422a295221bba8 Taniya Das                       2021-04-10  3028  
029d6586dc2d1d Souradeep Chowdhury              2022-12-27  3029  		dma@117f000 {
029d6586dc2d1d Souradeep Chowdhury              2022-12-27  3030  			compatible = "qcom,sc7280-dcc", "qcom,dcc";
029d6586dc2d1d Souradeep Chowdhury              2022-12-27  3031  			reg = <0x0 0x0117f000 0x0 0x1000>,
029d6586dc2d1d Souradeep Chowdhury              2022-12-27  3032  			      <0x0 0x01112000 0x0 0x6000>;
029d6586dc2d1d Souradeep Chowdhury              2022-12-27  3033  		};
029d6586dc2d1d Souradeep Chowdhury              2022-12-27  3034  
96c471970b7bcb Akhil P Oommen                   2021-08-11  3035  		adreno_smmu: iommu@3da0000 {
c564b69984a78c Konrad Dybcio                    2023-02-16  3036  			compatible = "qcom,sc7280-smmu-500", "qcom,adreno-smmu",
c564b69984a78c Konrad Dybcio                    2023-02-16  3037  				     "qcom,smmu-500", "arm,mmu-500";
96c471970b7bcb Akhil P Oommen                   2021-08-11  3038  			reg = <0 0x03da0000 0 0x20000>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  3039  			#iommu-cells = <2>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  3040  			#global-interrupts = <2>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  3041  			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  3042  					<GIC_SPI 675 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  3043  					<GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  3044  					<GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  3045  					<GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  3046  					<GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  3047  					<GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  3048  					<GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  3049  					<GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  3050  					<GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  3051  					<GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  3052  					<GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  3053  
96c471970b7bcb Akhil P Oommen                   2021-08-11  3054  			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
96c471970b7bcb Akhil P Oommen                   2021-08-11  3055  				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  3056  				 <&gpucc GPU_CC_AHB_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  3057  				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  3058  				 <&gpucc GPU_CC_CX_GMU_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  3059  				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  3060  				 <&gpucc GPU_CC_HUB_AON_CLK>;
96c471970b7bcb Akhil P Oommen                   2021-08-11  3061  			clock-names = "gcc_gpu_memnoc_gfx_clk",
96c471970b7bcb Akhil P Oommen                   2021-08-11  3062  					"gcc_gpu_snoc_dvm_gfx_clk",
96c471970b7bcb Akhil P Oommen                   2021-08-11  3063  					"gpu_cc_ahb_clk",
96c471970b7bcb Akhil P Oommen                   2021-08-11  3064  					"gpu_cc_hlos1_vote_gpu_smmu_clk",
96c471970b7bcb Akhil P Oommen                   2021-08-11  3065  					"gpu_cc_cx_gmu_clk",
96c471970b7bcb Akhil P Oommen                   2021-08-11  3066  					"gpu_cc_hub_cx_int_clk",
96c471970b7bcb Akhil P Oommen                   2021-08-11  3067  					"gpu_cc_hub_aon_clk";
96c471970b7bcb Akhil P Oommen                   2021-08-11  3068  
63162b473e3ae0 Dmitry Baryshkov                 2022-07-06  3069  			power-domains = <&gpucc GPU_CC_CX_GDSC>;
31edad47853418 Konrad Dybcio                    2023-11-20  3070  			dma-coherent;
96c471970b7bcb Akhil P Oommen                   2021-08-11  3071  		};
96c471970b7bcb Akhil P Oommen                   2021-08-11  3072  
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3073  		gfx_0_tbu: tbu@3dd9000 {
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3074  			compatible = "qcom,sc7280-tbu";
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3075  			reg = <0x0 0x3dd9000 0x0 0x1000>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3076  			qcom,stream-id-range = <&adreno_smmu 0x0 0x400>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3077  		};
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3078  
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3079  		gfx_1_tbu: tbu@3ddd000 {
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3080  			compatible = "qcom,sc7280-tbu";
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3081  			reg = <0x0 0x3ddd000 0x0 0x1000>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3082  			qcom,stream-id-range = <&adreno_smmu 0x400 0x400>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3083  		};
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  3084  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3085  		remoteproc_mpss: remoteproc@4080000 {
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3086  			compatible = "qcom,sc7280-mpss-pas";
419618bd90f6b2 Luca Weiss                       2023-12-08  3087  			reg = <0 0x04080000 0 0x10000>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3088  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3089  			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3090  					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3091  					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3092  					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3093  					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3094  					      <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3095  			interrupt-names = "wdog", "fatal", "ready", "handover",
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3096  					  "stop-ack", "shutdown-ack";
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3097  
92476ddf02b566 Krzysztof Kozlowski              2022-11-24  3098  			clocks = <&rpmhcc RPMH_CXO_CLK>;
92476ddf02b566 Krzysztof Kozlowski              2022-11-24  3099  			clock-names = "xo";
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3100  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3101  			power-domains = <&rpmhpd SC7280_CX>,
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3102  					<&rpmhpd SC7280_MSS>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3103  			power-domain-names = "cx", "mss";
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3104  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3105  			memory-region = <&mpss_mem>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3106  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3107  			qcom,qmp = <&aoss_qmp>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3108  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3109  			qcom,smem-states = <&modem_smp2p_out 0>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3110  			qcom,smem-state-names = "stop";
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3111  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3112  			status = "disabled";
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3113  
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3114  			glink-edge {
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3115  				interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3116  							     IPCC_MPROC_SIGNAL_GLINK_QMP
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3117  							     IRQ_TYPE_EDGE_RISING>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3118  				mboxes = <&ipcc IPCC_CLIENT_MPSS
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3119  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3120  				label = "modem";
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3121  				qcom,remote-pid = <1>;
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3122  			};
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3123  		};
4882cafb99c2b0 Sibi Sankar                      2021-09-17  3124  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3125  		stm@6002000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3126  			compatible = "arm,coresight-stm", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3127  			reg = <0 0x06002000 0 0x1000>,
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3128  			      <0 0x16280000 0 0x180000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3129  			reg-names = "stm-base", "stm-stimulus-base";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3130  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3131  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3132  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3133  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3134  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3135  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3136  					stm_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3137  						remote-endpoint = <&funnel0_in7>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3138  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3139  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3140  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3141  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3142  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3143  		funnel@6041000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3144  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3145  			reg = <0 0x06041000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3146  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3147  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3148  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3149  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3150  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3151  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3152  					funnel0_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3153  						remote-endpoint = <&merge_funnel_in0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3154  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3155  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3156  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3157  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3158  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3159  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3160  				#size-cells = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3161  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3162  				port@7 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3163  					reg = <7>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3164  					funnel0_in7: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3165  						remote-endpoint = <&stm_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3166  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3167  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3168  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3169  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3170  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3171  		funnel@6042000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3172  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3173  			reg = <0 0x06042000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3174  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3175  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3176  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3177  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3178  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3179  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3180  					funnel1_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3181  						remote-endpoint = <&merge_funnel_in1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3182  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3183  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3184  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3185  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3186  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3187  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3188  				#size-cells = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3189  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3190  				port@4 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3191  					reg = <4>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3192  					funnel1_in4: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3193  						remote-endpoint = <&apss_merge_funnel_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3194  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3195  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3196  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3197  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3198  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3199  		funnel@6045000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3200  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3201  			reg = <0 0x06045000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3202  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3203  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3204  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3205  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3206  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3207  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3208  					merge_funnel_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3209  						remote-endpoint = <&swao_funnel_in>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3210  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3211  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3212  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3213  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3214  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3215  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3216  				#size-cells = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3217  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3218  				port@0 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3219  					reg = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3220  					merge_funnel_in0: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3221  						remote-endpoint = <&funnel0_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3222  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3223  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3224  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3225  				port@1 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3226  					reg = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3227  					merge_funnel_in1: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3228  						remote-endpoint = <&funnel1_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3229  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3230  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3231  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3232  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3233  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3234  		replicator@6046000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3235  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3236  			reg = <0 0x06046000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3237  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3238  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3239  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3240  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3241  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3242  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3243  					replicator_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3244  						remote-endpoint = <&etr_in>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3245  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3246  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3247  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3248  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3249  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3250  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3251  					replicator_in: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3252  						remote-endpoint = <&swao_replicator_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3253  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3254  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3255  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3256  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3257  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3258  		etr@6048000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3259  			compatible = "arm,coresight-tmc", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3260  			reg = <0 0x06048000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3261  			iommus = <&apps_smmu 0x04c0 0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3262  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3263  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3264  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3265  			arm,scatter-gather;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3266  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3267  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3268  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3269  					etr_in: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3270  						remote-endpoint = <&replicator_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3271  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3272  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3273  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3274  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3275  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3276  		funnel@6b04000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3277  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3278  			reg = <0 0x06b04000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3279  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3280  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3281  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3282  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3283  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3284  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3285  					swao_funnel_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3286  						remote-endpoint = <&etf_in>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3287  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3288  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3289  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3290  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3291  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3292  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3293  				#size-cells = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3294  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3295  				port@7 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3296  					reg = <7>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3297  					swao_funnel_in: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3298  						remote-endpoint = <&merge_funnel_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3299  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3300  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3301  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3302  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3303  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3304  		etf@6b05000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3305  			compatible = "arm,coresight-tmc", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3306  			reg = <0 0x06b05000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3307  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3308  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3309  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3310  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3311  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3312  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3313  					etf_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3314  						remote-endpoint = <&swao_replicator_in>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3315  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3316  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3317  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3318  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3319  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3320  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3321  					etf_in: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3322  						remote-endpoint = <&swao_funnel_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3323  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3324  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3325  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3326  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3327  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3328  		replicator@6b06000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3329  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3330  			reg = <0 0x06b06000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3331  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3332  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3333  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3334  			qcom,replicator-loses-context;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3335  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3336  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3337  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3338  					swao_replicator_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3339  						remote-endpoint = <&replicator_in>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3340  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3341  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3342  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3343  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3344  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3345  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3346  					swao_replicator_in: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3347  						remote-endpoint = <&etf_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3348  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3349  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3350  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3351  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3352  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3353  		etm@7040000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3354  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3355  			reg = <0 0x07040000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3356  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  3357  			cpu = <&cpu0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3358  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3359  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3360  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3361  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3362  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3363  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3364  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3365  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3366  					etm0_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3367  						remote-endpoint = <&apss_funnel_in0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3368  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3369  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3370  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3371  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3372  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3373  		etm@7140000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3374  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3375  			reg = <0 0x07140000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3376  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  3377  			cpu = <&cpu1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3378  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3379  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3380  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3381  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3382  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3383  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3384  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3385  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3386  					etm1_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3387  						remote-endpoint = <&apss_funnel_in1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3388  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3389  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3390  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3391  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3392  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3393  		etm@7240000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3394  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3395  			reg = <0 0x07240000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3396  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  3397  			cpu = <&cpu2>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3398  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3399  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3400  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3401  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3402  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3403  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3404  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3405  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3406  					etm2_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3407  						remote-endpoint = <&apss_funnel_in2>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3408  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3409  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3410  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3411  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3412  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3413  		etm@7340000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3414  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3415  			reg = <0 0x07340000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3416  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  3417  			cpu = <&cpu3>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3418  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3419  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3420  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3421  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3422  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3423  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3424  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3425  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3426  					etm3_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3427  						remote-endpoint = <&apss_funnel_in3>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3428  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3429  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3430  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3431  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3432  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3433  		etm@7440000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3434  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3435  			reg = <0 0x07440000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3436  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  3437  			cpu = <&cpu4>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3438  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3439  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3440  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3441  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3442  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3443  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3444  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3445  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3446  					etm4_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3447  						remote-endpoint = <&apss_funnel_in4>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3448  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3449  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3450  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3451  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3452  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3453  		etm@7540000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3454  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3455  			reg = <0 0x07540000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3456  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  3457  			cpu = <&cpu5>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3458  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3459  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3460  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3461  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3462  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3463  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3464  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3465  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3466  					etm5_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3467  						remote-endpoint = <&apss_funnel_in5>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3468  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3469  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3470  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3471  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3472  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3473  		etm@7640000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3474  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3475  			reg = <0 0x07640000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3476  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  3477  			cpu = <&cpu6>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3478  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3479  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3480  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3481  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3482  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3483  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3484  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3485  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3486  					etm6_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3487  						remote-endpoint = <&apss_funnel_in6>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3488  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3489  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3490  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3491  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3492  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3493  		etm@7740000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3494  			compatible = "arm,coresight-etm4x", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3495  			reg = <0 0x07740000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3496  
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  3497  			cpu = <&cpu7>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3498  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3499  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3500  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3501  			arm,coresight-loses-context-with-cpu;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3502  			qcom,skip-power-up;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3503  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3504  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3505  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3506  					etm7_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3507  						remote-endpoint = <&apss_funnel_in7>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3508  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3509  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3510  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3511  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3512  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3513  		funnel@7800000 { /* APSS Funnel */
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3514  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3515  			reg = <0 0x07800000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3516  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3517  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3518  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3519  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3520  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3521  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3522  					apss_funnel_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3523  						remote-endpoint = <&apss_merge_funnel_in>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3524  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3525  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3526  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3527  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3528  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3529  				#address-cells = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3530  				#size-cells = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3531  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3532  				port@0 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3533  					reg = <0>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3534  					apss_funnel_in0: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3535  						remote-endpoint = <&etm0_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3536  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3537  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3538  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3539  				port@1 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3540  					reg = <1>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3541  					apss_funnel_in1: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3542  						remote-endpoint = <&etm1_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3543  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3544  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3545  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3546  				port@2 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3547  					reg = <2>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3548  					apss_funnel_in2: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3549  						remote-endpoint = <&etm2_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3550  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3551  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3552  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3553  				port@3 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3554  					reg = <3>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3555  					apss_funnel_in3: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3556  						remote-endpoint = <&etm3_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3557  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3558  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3559  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3560  				port@4 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3561  					reg = <4>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3562  					apss_funnel_in4: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3563  						remote-endpoint = <&etm4_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3564  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3565  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3566  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3567  				port@5 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3568  					reg = <5>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3569  					apss_funnel_in5: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3570  						remote-endpoint = <&etm5_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3571  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3572  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3573  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3574  				port@6 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3575  					reg = <6>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3576  					apss_funnel_in6: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3577  						remote-endpoint = <&etm6_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3578  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3579  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3580  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3581  				port@7 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3582  					reg = <7>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3583  					apss_funnel_in7: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3584  						remote-endpoint = <&etm7_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3585  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3586  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3587  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3588  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3589  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3590  		funnel@7810000 {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3591  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3592  			reg = <0 0x07810000 0 0x1000>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3593  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3594  			clocks = <&aoss_qmp>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3595  			clock-names = "apb_pclk";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3596  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3597  			out-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3598  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3599  					apss_merge_funnel_out: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3600  						remote-endpoint = <&funnel1_in4>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3601  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3602  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3603  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3604  
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3605  			in-ports {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3606  				port {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3607  					apss_merge_funnel_in: endpoint {
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3608  						remote-endpoint = <&apss_funnel_out>;
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3609  					};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3610  				};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3611  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3612  		};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  3613  
96bb736f05d156 Bhupesh Sharma                   2022-05-15  3614  		sdhc_2: mmc@8804000 {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3615  			compatible = "qcom,sc7280-sdhci", "qcom,sdhci-msm-v5";
f9800dde34e678 Douglas Anderson                 2022-02-02  3616  			pinctrl-names = "default", "sleep";
f9800dde34e678 Douglas Anderson                 2022-02-02  3617  			pinctrl-0 = <&sdc2_clk>, <&sdc2_cmd>, <&sdc2_data>;
f9800dde34e678 Douglas Anderson                 2022-02-02  3618  			pinctrl-1 = <&sdc2_clk_sleep>, <&sdc2_cmd_sleep>, <&sdc2_data_sleep>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3619  			status = "disabled";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3620  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3621  			reg = <0 0x08804000 0 0x1000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3622  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3623  			iommus = <&apps_smmu 0x100 0x0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3624  			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3625  				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3626  			interrupt-names = "hc_irq", "pwr_irq";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3627  
4ff12270dbbe24 Bhupesh Sharma                   2022-05-15  3628  			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
4ff12270dbbe24 Bhupesh Sharma                   2022-05-15  3629  				 <&gcc GCC_SDCC2_APPS_CLK>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3630  				 <&rpmhcc RPMH_CXO_CLK>;
4ff12270dbbe24 Bhupesh Sharma                   2022-05-15  3631  			clock-names = "iface", "core", "xo";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3632  			interconnects = <&aggre1_noc MASTER_SDCC_2 0 &mc_virt SLAVE_EBI1 0>,
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3633  					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_SDCC_2 0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3634  			interconnect-names = "sdhc-ddr","cpu-sdhc";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3635  			power-domains = <&rpmhpd SC7280_CX>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3636  			operating-points-v2 = <&sdhc2_opp_table>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3637  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3638  			bus-width = <4>;
827f5fc8d91220 Konrad Dybcio                    2023-12-18  3639  			dma-coherent;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3640  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3641  			qcom,dll-config = <0x0007642c>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3642  
959cb513074386 Shaik Sajida Bhanu               2022-04-12  3643  			resets = <&gcc GCC_SDCC2_BCR>;
959cb513074386 Shaik Sajida Bhanu               2022-04-12  3644  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3645  			sdhc2_opp_table: opp-table {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3646  				compatible = "operating-points-v2";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3647  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3648  				opp-100000000 {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3649  					opp-hz = /bits/ 64 <100000000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3650  					required-opps = <&rpmhpd_opp_low_svs>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3651  					opp-peak-kBps = <1800000 400000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3652  					opp-avg-kBps = <100000 0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3653  				};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3654  
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3655  				opp-202000000 {
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3656  					opp-hz = /bits/ 64 <202000000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3657  					required-opps = <&rpmhpd_opp_nom>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3658  					opp-peak-kBps = <5400000 1600000>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3659  					opp-avg-kBps = <200000 0>;
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3660  				};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3661  			};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3662  		};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  3663  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3664  		usb_1_hsphy: phy@88e3000 {
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3665  			compatible = "qcom,sc7280-usb-hs-phy",
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3666  				     "qcom,usb-snps-hs-7nm-phy";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3667  			reg = <0 0x088e3000 0 0x400>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3668  			status = "disabled";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3669  			#phy-cells = <0>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3670  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3671  			clocks = <&rpmhcc RPMH_CXO_CLK>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3672  			clock-names = "ref";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3673  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3674  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3675  		};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3676  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3677  		usb_2_hsphy: phy@88e4000 {
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3678  			compatible = "qcom,sc7280-usb-hs-phy",
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3679  				     "qcom,usb-snps-hs-7nm-phy";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3680  			reg = <0 0x088e4000 0 0x400>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3681  			status = "disabled";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3682  			#phy-cells = <0>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3683  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3684  			clocks = <&rpmhcc RPMH_CXO_CLK>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3685  			clock-names = "ref";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3686  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3687  			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3688  		};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3689  
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3690  		usb_1_qmpphy: phy@88e8000 {
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3691  			compatible = "qcom,sc7280-qmp-usb3-dp-phy";
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3692  			reg = <0 0x088e8000 0 0x3000>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3693  			status = "disabled";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3694  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3695  			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3696  				 <&rpmhcc RPMH_CXO_CLK>,
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3697  				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3698  				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3699  			clock-names = "aux",
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3700  				      "ref",
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3701  				      "com_aux",
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3702  				      "usb3_pipe";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3703  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3704  			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3705  				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3706  			reset-names = "phy", "common";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3707  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3708  			#clock-cells = <1>;
36888ed83f998c Dmitry Baryshkov                 2023-07-11  3709  			#phy-cells = <1>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3710  
2278b16f12a9cc Luca Weiss                       2023-09-29  3711  			ports {
2278b16f12a9cc Luca Weiss                       2023-09-29  3712  				#address-cells = <1>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3713  				#size-cells = <0>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3714  
2278b16f12a9cc Luca Weiss                       2023-09-29  3715  				port@0 {
2278b16f12a9cc Luca Weiss                       2023-09-29  3716  					reg = <0>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3717  
2278b16f12a9cc Luca Weiss                       2023-09-29  3718  					usb_dp_qmpphy_out: endpoint {
2278b16f12a9cc Luca Weiss                       2023-09-29  3719  					};
2278b16f12a9cc Luca Weiss                       2023-09-29  3720  				};
2278b16f12a9cc Luca Weiss                       2023-09-29  3721  
2278b16f12a9cc Luca Weiss                       2023-09-29  3722  				port@1 {
2278b16f12a9cc Luca Weiss                       2023-09-29  3723  					reg = <1>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3724  
2278b16f12a9cc Luca Weiss                       2023-09-29  3725  					usb_dp_qmpphy_usb_ss_in: endpoint {
2278b16f12a9cc Luca Weiss                       2023-09-29  3726  					};
2278b16f12a9cc Luca Weiss                       2023-09-29  3727  				};
2278b16f12a9cc Luca Weiss                       2023-09-29  3728  
2278b16f12a9cc Luca Weiss                       2023-09-29  3729  				port@2 {
2278b16f12a9cc Luca Weiss                       2023-09-29  3730  					reg = <2>;
2278b16f12a9cc Luca Weiss                       2023-09-29  3731  
2278b16f12a9cc Luca Weiss                       2023-09-29  3732  					usb_dp_qmpphy_dp_in: endpoint {
2278b16f12a9cc Luca Weiss                       2023-09-29  3733  					};
2278b16f12a9cc Luca Weiss                       2023-09-29  3734  				};
2278b16f12a9cc Luca Weiss                       2023-09-29  3735  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3736  		};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3737  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3738  		usb_2: usb@8cf8800 {
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3739  			compatible = "qcom,sc7280-dwc3", "qcom,dwc3";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3740  			reg = <0 0x08cf8800 0 0x400>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3741  			status = "disabled";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3742  			#address-cells = <2>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3743  			#size-cells = <2>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3744  			ranges;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3745  			dma-ranges;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3746  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3747  			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3748  				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3749  				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3750  				 <&gcc GCC_USB30_SEC_SLEEP_CLK>,
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3751  				 <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>;
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3752  			clock-names = "cfg_noc",
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3753  				      "core",
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3754  				      "iface",
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3755  				      "sleep",
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  3756  				      "mock_utmi";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3757  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3758  			assigned-clocks = <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3759  					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3760  			assigned-clock-rates = <19200000>, <200000000>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3761  
6bf150aef236fb Krishna Kurapati                 2024-01-26  3762  			interrupts-extended = <&intc GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
6bf150aef236fb Krishna Kurapati                 2024-01-26  3763  					      <&intc GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
24f8aba9a7c77c Johan Hovold                     2023-11-20  3764  					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
24f8aba9a7c77c Johan Hovold                     2023-11-20  3765  					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>;
6bf150aef236fb Krishna Kurapati                 2024-01-26  3766  			interrupt-names = "pwr_event",
6bf150aef236fb Krishna Kurapati                 2024-01-26  3767  					  "hs_phy_irq",
2a8d28b8af7906 Johan Hovold                     2022-07-15  3768  					  "dp_hs_phy_irq",
2a8d28b8af7906 Johan Hovold                     2022-07-15  3769  					  "dm_hs_phy_irq";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3770  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3771  			power-domains = <&gcc GCC_USB30_SEC_GDSC>;
3d59187efc982b Rajendra Nayak                   2022-09-16  3772  			required-opps = <&rpmhpd_opp_nom>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3773  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3774  			resets = <&gcc GCC_USB30_SEC_BCR>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3775  
6493367f8031b1 Sandeep Maheswaram               2021-08-02  3776  			interconnects = <&aggre1_noc MASTER_USB2 0 &mc_virt SLAVE_EBI1 0>,
6493367f8031b1 Sandeep Maheswaram               2021-08-02  3777  					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_USB2 0>;
6493367f8031b1 Sandeep Maheswaram               2021-08-02  3778  			interconnect-names = "usb-ddr", "apps-usb";
6493367f8031b1 Sandeep Maheswaram               2021-08-02  3779  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3780  			usb_2_dwc3: usb@8c00000 {
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3781  				compatible = "snps,dwc3";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3782  				reg = <0 0x08c00000 0 0xe000>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3783  				interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3784  				iommus = <&apps_smmu 0xa0 0x0>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3785  				snps,dis_u2_susphy_quirk;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3786  				snps,dis_enblslpm_quirk;
0a13ba449afd41 Krishna Kurapati                 2024-12-31  3787  				snps,dis-u1-entry-quirk;
0a13ba449afd41 Krishna Kurapati                 2024-12-31  3788  				snps,dis-u2-entry-quirk;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3789  				phys = <&usb_2_hsphy>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3790  				phy-names = "usb2-phy";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3791  				maximum-speed = "high-speed";
0b059979090d72 Souradeep Chowdhury              2022-04-06  3792  				usb-role-switch;
9ee402ccfeb163 Bhupesh Sharma                   2023-05-02  3793  
0b059979090d72 Souradeep Chowdhury              2022-04-06  3794  				port {
0b059979090d72 Souradeep Chowdhury              2022-04-06  3795  					usb2_role_switch: endpoint {
0b059979090d72 Souradeep Chowdhury              2022-04-06  3796  						remote-endpoint = <&eud_ep>;
0b059979090d72 Souradeep Chowdhury              2022-04-06  3797  					};
0b059979090d72 Souradeep Chowdhury              2022-04-06  3798  				};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3799  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3800  		};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  3801  
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3802  		qspi: spi@88dc000 {
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3803  			compatible = "qcom,sc7280-qspi", "qcom,qspi-v1";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3804  			reg = <0 0x088dc000 0 0x1000>;
cc406006126e89 Vijaya Krishna Nivarthi          2023-04-24  3805  			iommus = <&apps_smmu 0x20 0x0>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3806  			#address-cells = <1>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3807  			#size-cells = <0>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3808  			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3809  			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3810  				 <&gcc GCC_QSPI_CORE_CLK>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3811  			clock-names = "iface", "core";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3812  			interconnects = <&gem_noc MASTER_APPSS_PROC 0
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3813  					&cnoc2 SLAVE_QSPI_0 0>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3814  			interconnect-names = "qspi-config";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3815  			power-domains = <&rpmhpd SC7280_CX>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3816  			operating-points-v2 = <&qspi_opp_table>;
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3817  			status = "disabled";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3818  		};
7720ea001b528d Roja Rani Yarubandi              2021-09-23  3819  
3658e411efcbb4 Luca Weiss                       2023-12-08  3820  		remoteproc_adsp: remoteproc@3700000 {
3658e411efcbb4 Luca Weiss                       2023-12-08  3821  			compatible = "qcom,sc7280-adsp-pas";
3658e411efcbb4 Luca Weiss                       2023-12-08  3822  			reg = <0 0x03700000 0 0x100>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3823  
f011688162ec4c Luca Weiss                       2024-02-19  3824  			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
3658e411efcbb4 Luca Weiss                       2023-12-08  3825  					      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
3658e411efcbb4 Luca Weiss                       2023-12-08  3826  					      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
3658e411efcbb4 Luca Weiss                       2023-12-08  3827  					      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
3658e411efcbb4 Luca Weiss                       2023-12-08  3828  					      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
3658e411efcbb4 Luca Weiss                       2023-12-08  3829  					      <&adsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3830  			interrupt-names = "wdog", "fatal", "ready", "handover",
3658e411efcbb4 Luca Weiss                       2023-12-08  3831  					  "stop-ack", "shutdown-ack";
3658e411efcbb4 Luca Weiss                       2023-12-08  3832  
3658e411efcbb4 Luca Weiss                       2023-12-08  3833  			clocks = <&rpmhcc RPMH_CXO_CLK>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3834  			clock-names = "xo";
3658e411efcbb4 Luca Weiss                       2023-12-08  3835  
3658e411efcbb4 Luca Weiss                       2023-12-08  3836  			power-domains = <&rpmhpd SC7280_LCX>,
3658e411efcbb4 Luca Weiss                       2023-12-08  3837  					<&rpmhpd SC7280_LMX>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3838  			power-domain-names = "lcx", "lmx";
3658e411efcbb4 Luca Weiss                       2023-12-08  3839  
3658e411efcbb4 Luca Weiss                       2023-12-08  3840  			memory-region = <&adsp_mem>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3841  
3658e411efcbb4 Luca Weiss                       2023-12-08  3842  			qcom,qmp = <&aoss_qmp>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3843  
3658e411efcbb4 Luca Weiss                       2023-12-08  3844  			qcom,smem-states = <&adsp_smp2p_out 0>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3845  			qcom,smem-state-names = "stop";
3658e411efcbb4 Luca Weiss                       2023-12-08  3846  
3658e411efcbb4 Luca Weiss                       2023-12-08  3847  			status = "disabled";
3658e411efcbb4 Luca Weiss                       2023-12-08  3848  
2c6191dcb6b852 Mohammad Rafi Shaik              2025-04-29  3849  			remoteproc_adsp_glink: glink-edge {
3658e411efcbb4 Luca Weiss                       2023-12-08  3850  				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
3658e411efcbb4 Luca Weiss                       2023-12-08  3851  							     IPCC_MPROC_SIGNAL_GLINK_QMP
3658e411efcbb4 Luca Weiss                       2023-12-08  3852  							     IRQ_TYPE_EDGE_RISING>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3853  
3658e411efcbb4 Luca Weiss                       2023-12-08  3854  				mboxes = <&ipcc IPCC_CLIENT_LPASS
3658e411efcbb4 Luca Weiss                       2023-12-08  3855  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3856  
3658e411efcbb4 Luca Weiss                       2023-12-08  3857  				label = "lpass";
3658e411efcbb4 Luca Weiss                       2023-12-08  3858  				qcom,remote-pid = <2>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3859  
f44da5d8722de3 Luca Weiss                       2024-05-10  3860  				apr {
f44da5d8722de3 Luca Weiss                       2024-05-10  3861  					compatible = "qcom,apr-v2";
f44da5d8722de3 Luca Weiss                       2024-05-10  3862  					qcom,glink-channels = "apr_audio_svc";
f44da5d8722de3 Luca Weiss                       2024-05-10  3863  					qcom,domain = <APR_DOMAIN_ADSP>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3864  					#address-cells = <1>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3865  					#size-cells = <0>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3866  
f44da5d8722de3 Luca Weiss                       2024-05-10  3867  					service@3 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3868  						reg = <APR_SVC_ADSP_CORE>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3869  						compatible = "qcom,q6core";
f44da5d8722de3 Luca Weiss                       2024-05-10  3870  						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
f44da5d8722de3 Luca Weiss                       2024-05-10  3871  					};
f44da5d8722de3 Luca Weiss                       2024-05-10  3872  
f44da5d8722de3 Luca Weiss                       2024-05-10  3873  					q6afe: service@4 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3874  						compatible = "qcom,q6afe";
f44da5d8722de3 Luca Weiss                       2024-05-10  3875  						reg = <APR_SVC_AFE>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3876  						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
f44da5d8722de3 Luca Weiss                       2024-05-10  3877  
f44da5d8722de3 Luca Weiss                       2024-05-10  3878  						q6afedai: dais {
f44da5d8722de3 Luca Weiss                       2024-05-10  3879  							compatible = "qcom,q6afe-dais";
f44da5d8722de3 Luca Weiss                       2024-05-10  3880  							#address-cells = <1>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3881  							#size-cells = <0>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3882  							#sound-dai-cells = <1>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3883  						};
f44da5d8722de3 Luca Weiss                       2024-05-10  3884  
f44da5d8722de3 Luca Weiss                       2024-05-10  3885  						q6afecc: clock-controller {
f44da5d8722de3 Luca Weiss                       2024-05-10  3886  							compatible = "qcom,q6afe-clocks";
f44da5d8722de3 Luca Weiss                       2024-05-10  3887  							#clock-cells = <2>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3888  						};
f44da5d8722de3 Luca Weiss                       2024-05-10  3889  					};
f44da5d8722de3 Luca Weiss                       2024-05-10  3890  
f44da5d8722de3 Luca Weiss                       2024-05-10  3891  					q6asm: service@7 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3892  						compatible = "qcom,q6asm";
f44da5d8722de3 Luca Weiss                       2024-05-10  3893  						reg = <APR_SVC_ASM>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3894  						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
f44da5d8722de3 Luca Weiss                       2024-05-10  3895  
f44da5d8722de3 Luca Weiss                       2024-05-10  3896  						q6asmdai: dais {
f44da5d8722de3 Luca Weiss                       2024-05-10  3897  							compatible = "qcom,q6asm-dais";
f44da5d8722de3 Luca Weiss                       2024-05-10  3898  							#address-cells = <1>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3899  							#size-cells = <0>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3900  							#sound-dai-cells = <1>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3901  							iommus = <&apps_smmu 0x1801 0x0>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3902  
f44da5d8722de3 Luca Weiss                       2024-05-10  3903  							dai@0 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3904  								reg = <0>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3905  							};
f44da5d8722de3 Luca Weiss                       2024-05-10  3906  
f44da5d8722de3 Luca Weiss                       2024-05-10  3907  							dai@1 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3908  								reg = <1>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3909  							};
f44da5d8722de3 Luca Weiss                       2024-05-10  3910  
f44da5d8722de3 Luca Weiss                       2024-05-10  3911  							dai@2 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3912  								reg = <2>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3913  							};
f44da5d8722de3 Luca Weiss                       2024-05-10  3914  						};
f44da5d8722de3 Luca Weiss                       2024-05-10  3915  					};
f44da5d8722de3 Luca Weiss                       2024-05-10  3916  
f44da5d8722de3 Luca Weiss                       2024-05-10  3917  					q6adm: service@8 {
f44da5d8722de3 Luca Weiss                       2024-05-10  3918  						compatible = "qcom,q6adm";
f44da5d8722de3 Luca Weiss                       2024-05-10  3919  						reg = <APR_SVC_ADM>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3920  						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
f44da5d8722de3 Luca Weiss                       2024-05-10  3921  
f44da5d8722de3 Luca Weiss                       2024-05-10  3922  						q6routing: routing {
f44da5d8722de3 Luca Weiss                       2024-05-10  3923  							compatible = "qcom,q6adm-routing";
f44da5d8722de3 Luca Weiss                       2024-05-10  3924  							#sound-dai-cells = <0>;
f44da5d8722de3 Luca Weiss                       2024-05-10  3925  						};
f44da5d8722de3 Luca Weiss                       2024-05-10  3926  					};
f44da5d8722de3 Luca Weiss                       2024-05-10  3927  				};
f44da5d8722de3 Luca Weiss                       2024-05-10  3928  
3658e411efcbb4 Luca Weiss                       2023-12-08  3929  				fastrpc {
3658e411efcbb4 Luca Weiss                       2023-12-08  3930  					compatible = "qcom,fastrpc";
3658e411efcbb4 Luca Weiss                       2023-12-08  3931  					qcom,glink-channels = "fastrpcglink-apps-dsp";
3658e411efcbb4 Luca Weiss                       2023-12-08  3932  					label = "adsp";
3658e411efcbb4 Luca Weiss                       2023-12-08  3933  					qcom,non-secure-domain;
3658e411efcbb4 Luca Weiss                       2023-12-08  3934  					#address-cells = <1>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3935  					#size-cells = <0>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3936  
3658e411efcbb4 Luca Weiss                       2023-12-08  3937  					compute-cb@3 {
3658e411efcbb4 Luca Weiss                       2023-12-08  3938  						compatible = "qcom,fastrpc-compute-cb";
3658e411efcbb4 Luca Weiss                       2023-12-08  3939  						reg = <3>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3940  						iommus = <&apps_smmu 0x1803 0x0>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3941  					};
3658e411efcbb4 Luca Weiss                       2023-12-08  3942  
3658e411efcbb4 Luca Weiss                       2023-12-08  3943  					compute-cb@4 {
3658e411efcbb4 Luca Weiss                       2023-12-08  3944  						compatible = "qcom,fastrpc-compute-cb";
3658e411efcbb4 Luca Weiss                       2023-12-08  3945  						reg = <4>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3946  						iommus = <&apps_smmu 0x1804 0x0>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3947  					};
3658e411efcbb4 Luca Weiss                       2023-12-08  3948  
3658e411efcbb4 Luca Weiss                       2023-12-08  3949  					compute-cb@5 {
3658e411efcbb4 Luca Weiss                       2023-12-08  3950  						compatible = "qcom,fastrpc-compute-cb";
3658e411efcbb4 Luca Weiss                       2023-12-08  3951  						reg = <5>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3952  						iommus = <&apps_smmu 0x1805 0x0>;
3658e411efcbb4 Luca Weiss                       2023-12-08  3953  					};
3658e411efcbb4 Luca Weiss                       2023-12-08  3954  				};
3658e411efcbb4 Luca Weiss                       2023-12-08  3955  			};
3658e411efcbb4 Luca Weiss                       2023-12-08  3956  		};
3658e411efcbb4 Luca Weiss                       2023-12-08  3957  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3958  		remoteproc_wpss: remoteproc@8a00000 {
0bcbf092560cc1 Luca Weiss                       2023-12-08  3959  			compatible = "qcom,sc7280-wpss-pas";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3960  			reg = <0 0x08a00000 0 0x10000>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3961  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3962  			interrupts-extended = <&intc GIC_SPI 587 IRQ_TYPE_EDGE_RISING>,
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3963  					      <&wpss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3964  					      <&wpss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3965  					      <&wpss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3966  					      <&wpss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3967  					      <&wpss_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3968  			interrupt-names = "wdog", "fatal", "ready", "handover",
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3969  					  "stop-ack", "shutdown-ack";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3970  
0bcbf092560cc1 Luca Weiss                       2023-12-08  3971  			clocks = <&rpmhcc RPMH_CXO_CLK>;
0bcbf092560cc1 Luca Weiss                       2023-12-08  3972  			clock-names = "xo";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3973  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3974  			power-domains = <&rpmhpd SC7280_CX>,
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3975  					<&rpmhpd SC7280_MX>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3976  			power-domain-names = "cx", "mx";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3977  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3978  			memory-region = <&wpss_mem>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3979  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3980  			qcom,qmp = <&aoss_qmp>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3981  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3982  			qcom,smem-states = <&wpss_smp2p_out 0>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3983  			qcom,smem-state-names = "stop";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3984  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3985  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3986  			status = "disabled";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3987  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3988  			glink-edge {
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3989  				interrupts-extended = <&ipcc IPCC_CLIENT_WPSS
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3990  							     IPCC_MPROC_SIGNAL_GLINK_QMP
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3991  							     IRQ_TYPE_EDGE_RISING>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3992  				mboxes = <&ipcc IPCC_CLIENT_WPSS
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3993  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3994  
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3995  				label = "wpss";
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3996  				qcom,remote-pid = <13>;
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3997  			};
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3998  		};
476dce6e50bb21 Rakesh Pillai                    2022-03-28  3999  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4000  		pmu@9091000 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4001  			compatible = "qcom,sc7280-llcc-bwmon";
94ca994d7e932c Konrad Dybcio                    2023-01-02  4002  			reg = <0 0x09091000 0 0x1000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4003  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4004  			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4005  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4006  			interconnects = <&mc_virt MASTER_LLCC 3 &mc_virt SLAVE_EBI1 3>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4007  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4008  			operating-points-v2 = <&llcc_bwmon_opp_table>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4009  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4010  			llcc_bwmon_opp_table: opp-table {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4011  				compatible = "operating-points-v2";
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4012  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4013  				opp-0 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4014  					opp-peak-kBps = <800000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4015  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4016  				opp-1 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4017  					opp-peak-kBps = <1804000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4018  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4019  				opp-2 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4020  					opp-peak-kBps = <2188000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4021  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4022  				opp-3 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4023  					opp-peak-kBps = <3072000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4024  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4025  				opp-4 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4026  					opp-peak-kBps = <4068000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4027  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4028  				opp-5 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4029  					opp-peak-kBps = <6220000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4030  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4031  				opp-6 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4032  					opp-peak-kBps = <6832000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4033  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4034  				opp-7 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4035  					opp-peak-kBps = <8532000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4036  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4037  			};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4038  		};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4039  
b626ac159e5e2c Krzysztof Kozlowski              2022-09-08  4040  		pmu@90b6400 {
bad26511c4cb54 Konrad Dybcio                    2023-03-15  4041  			compatible = "qcom,sc7280-cpu-bwmon", "qcom,sdm845-bwmon";
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4042  			reg = <0 0x090b6400 0 0x600>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4043  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4044  			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4045  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4046  			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &gem_noc SLAVE_LLCC 3>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4047  			operating-points-v2 = <&cpu_bwmon_opp_table>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4048  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4049  			cpu_bwmon_opp_table: opp-table {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4050  				compatible = "operating-points-v2";
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4051  
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4052  				opp-0 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4053  					opp-peak-kBps = <2400000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4054  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4055  				opp-1 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4056  					opp-peak-kBps = <4800000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4057  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4058  				opp-2 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4059  					opp-peak-kBps = <7456000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4060  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4061  				opp-3 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4062  					opp-peak-kBps = <9600000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4063  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4064  				opp-4 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4065  					opp-peak-kBps = <12896000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4066  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4067  				opp-5 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4068  					opp-peak-kBps = <14928000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4069  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4070  				opp-6 {
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4071  					opp-peak-kBps = <17056000>;
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4072  				};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4073  			};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4074  		};
b2f3eac1b77c6f Rajendra Nayak                   2022-09-02  4075  
297e6e38320f32 Odelu Kukatla                    2021-04-27  4076  		dc_noc: interconnect@90e0000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  4077  			reg = <0 0x090e0000 0 0x5080>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4078  			compatible = "qcom,sc7280-dc-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  4079  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4080  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4081  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  4082  
297e6e38320f32 Odelu Kukatla                    2021-04-27  4083  		gem_noc: interconnect@9100000 {
94ca994d7e932c Konrad Dybcio                    2023-01-02  4084  			reg = <0 0x09100000 0 0xe2200>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4085  			compatible = "qcom,sc7280-gem-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  4086  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4087  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4088  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  4089  
0392968dbe099d Sai Prakash Ranjan               2021-03-16  4090  		system-cache-controller@9200000 {
0392968dbe099d Sai Prakash Ranjan               2021-03-16  4091  			compatible = "qcom,sc7280-llcc";
62e5ee9db98ed6 Manivannan Sadhasivam            2023-03-14  4092  			reg = <0 0x09200000 0 0x58000>, <0 0x09280000 0 0x58000>,
62e5ee9db98ed6 Manivannan Sadhasivam            2023-03-14  4093  			      <0 0x09600000 0 0x58000>;
62e5ee9db98ed6 Manivannan Sadhasivam            2023-03-14  4094  			reg-names = "llcc0_base", "llcc1_base", "llcc_broadcast_base";
0392968dbe099d Sai Prakash Ranjan               2021-03-16  4095  			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
0392968dbe099d Sai Prakash Ranjan               2021-03-16  4096  		};
0392968dbe099d Sai Prakash Ranjan               2021-03-16  4097  
0b059979090d72 Souradeep Chowdhury              2022-04-06  4098  		eud: eud@88e0000 {
0b059979090d72 Souradeep Chowdhury              2022-04-06  4099  			compatible = "qcom,sc7280-eud", "qcom,eud";
9ee402ccfeb163 Bhupesh Sharma                   2023-05-02  4100  			reg = <0 0x88e0000 0 0x2000>,
9ee402ccfeb163 Bhupesh Sharma                   2023-05-02  4101  			      <0 0x88e2000 0 0x1000>;
0b059979090d72 Souradeep Chowdhury              2022-04-06  4102  			interrupts-extended = <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
9ee402ccfeb163 Bhupesh Sharma                   2023-05-02  4103  
39c8af78cbefb8 Krzysztof Kozlowski              2023-08-20  4104  			status = "disabled";
39c8af78cbefb8 Krzysztof Kozlowski              2023-08-20  4105  
0b059979090d72 Souradeep Chowdhury              2022-04-06  4106  			ports {
a369c74243ca4a Krzysztof Kozlowski              2023-03-08  4107  				#address-cells = <1>;
a369c74243ca4a Krzysztof Kozlowski              2023-03-08  4108  				#size-cells = <0>;
a369c74243ca4a Krzysztof Kozlowski              2023-03-08  4109  
0b059979090d72 Souradeep Chowdhury              2022-04-06  4110  				port@0 {
a369c74243ca4a Krzysztof Kozlowski              2023-03-08  4111  					reg = <0>;
0b059979090d72 Souradeep Chowdhury              2022-04-06  4112  					eud_ep: endpoint {
0b059979090d72 Souradeep Chowdhury              2022-04-06  4113  						remote-endpoint = <&usb2_role_switch>;
0b059979090d72 Souradeep Chowdhury              2022-04-06  4114  					};
0b059979090d72 Souradeep Chowdhury              2022-04-06  4115  				};
0b059979090d72 Souradeep Chowdhury              2022-04-06  4116  			};
0b059979090d72 Souradeep Chowdhury              2022-04-06  4117  		};
0b059979090d72 Souradeep Chowdhury              2022-04-06  4118  
297e6e38320f32 Odelu Kukatla                    2021-04-27  4119  		nsp_noc: interconnect@a0c0000 {
297e6e38320f32 Odelu Kukatla                    2021-04-27  4120  			reg = <0 0x0a0c0000 0 0x10000>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4121  			compatible = "qcom,sc7280-nsp-noc";
297e6e38320f32 Odelu Kukatla                    2021-04-27  4122  			#interconnect-cells = <2>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4123  			qcom,bcm-voters = <&apps_bcm_voter>;
297e6e38320f32 Odelu Kukatla                    2021-04-27  4124  		};
297e6e38320f32 Odelu Kukatla                    2021-04-27  4125  
df62402e5ff9df Luca Weiss                       2023-12-08  4126  		remoteproc_cdsp: remoteproc@a300000 {
df62402e5ff9df Luca Weiss                       2023-12-08  4127  			compatible = "qcom,sc7280-cdsp-pas";
df62402e5ff9df Luca Weiss                       2023-12-08  4128  			reg = <0 0x0a300000 0 0x10000>;
df62402e5ff9df Luca Weiss                       2023-12-08  4129  
f011688162ec4c Luca Weiss                       2024-02-19  4130  			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
df62402e5ff9df Luca Weiss                       2023-12-08  4131  					      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
df62402e5ff9df Luca Weiss                       2023-12-08  4132  					      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
df62402e5ff9df Luca Weiss                       2023-12-08  4133  					      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
df62402e5ff9df Luca Weiss                       2023-12-08  4134  					      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
df62402e5ff9df Luca Weiss                       2023-12-08  4135  					      <&cdsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
df62402e5ff9df Luca Weiss                       2023-12-08  4136  			interrupt-names = "wdog", "fatal", "ready", "handover",
df62402e5ff9df Luca Weiss                       2023-12-08  4137  					  "stop-ack", "shutdown-ack";
df62402e5ff9df Luca Weiss                       2023-12-08  4138  
df62402e5ff9df Luca Weiss                       2023-12-08  4139  			clocks = <&rpmhcc RPMH_CXO_CLK>;
df62402e5ff9df Luca Weiss                       2023-12-08  4140  			clock-names = "xo";
df62402e5ff9df Luca Weiss                       2023-12-08  4141  
df62402e5ff9df Luca Weiss                       2023-12-08  4142  			power-domains = <&rpmhpd SC7280_CX>,
df62402e5ff9df Luca Weiss                       2023-12-08  4143  					<&rpmhpd SC7280_MX>;
df62402e5ff9df Luca Weiss                       2023-12-08  4144  			power-domain-names = "cx", "mx";
df62402e5ff9df Luca Weiss                       2023-12-08  4145  
df62402e5ff9df Luca Weiss                       2023-12-08  4146  			interconnects = <&nsp_noc MASTER_CDSP_PROC 0 &mc_virt SLAVE_EBI1 0>;
df62402e5ff9df Luca Weiss                       2023-12-08  4147  
df62402e5ff9df Luca Weiss                       2023-12-08  4148  			memory-region = <&cdsp_mem>;
df62402e5ff9df Luca Weiss                       2023-12-08  4149  
df62402e5ff9df Luca Weiss                       2023-12-08  4150  			qcom,qmp = <&aoss_qmp>;
df62402e5ff9df Luca Weiss                       2023-12-08  4151  
df62402e5ff9df Luca Weiss                       2023-12-08  4152  			qcom,smem-states = <&cdsp_smp2p_out 0>;
df62402e5ff9df Luca Weiss                       2023-12-08  4153  			qcom,smem-state-names = "stop";
df62402e5ff9df Luca Weiss                       2023-12-08  4154  
df62402e5ff9df Luca Weiss                       2023-12-08  4155  			status = "disabled";
df62402e5ff9df Luca Weiss                       2023-12-08  4156  
df62402e5ff9df Luca Weiss                       2023-12-08  4157  			glink-edge {
df62402e5ff9df Luca Weiss                       2023-12-08  4158  				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
df62402e5ff9df Luca Weiss                       2023-12-08  4159  							     IPCC_MPROC_SIGNAL_GLINK_QMP
df62402e5ff9df Luca Weiss                       2023-12-08  4160  							     IRQ_TYPE_EDGE_RISING>;
df62402e5ff9df Luca Weiss                       2023-12-08  4161  				mboxes = <&ipcc IPCC_CLIENT_CDSP
df62402e5ff9df Luca Weiss                       2023-12-08  4162  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
df62402e5ff9df Luca Weiss                       2023-12-08  4163  
df62402e5ff9df Luca Weiss                       2023-12-08  4164  				label = "cdsp";
df62402e5ff9df Luca Weiss                       2023-12-08  4165  				qcom,remote-pid = <5>;
df62402e5ff9df Luca Weiss                       2023-12-08  4166  
df62402e5ff9df Luca Weiss                       2023-12-08  4167  				fastrpc {
df62402e5ff9df Luca Weiss                       2023-12-08  4168  					compatible = "qcom,fastrpc";
df62402e5ff9df Luca Weiss                       2023-12-08  4169  					qcom,glink-channels = "fastrpcglink-apps-dsp";
df62402e5ff9df Luca Weiss                       2023-12-08  4170  					label = "cdsp";
df62402e5ff9df Luca Weiss                       2023-12-08  4171  					qcom,non-secure-domain;
df62402e5ff9df Luca Weiss                       2023-12-08  4172  					#address-cells = <1>;
df62402e5ff9df Luca Weiss                       2023-12-08  4173  					#size-cells = <0>;
df62402e5ff9df Luca Weiss                       2023-12-08  4174  
df62402e5ff9df Luca Weiss                       2023-12-08  4175  					compute-cb@1 {
df62402e5ff9df Luca Weiss                       2023-12-08  4176  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4177  						reg = <1>;
df62402e5ff9df Luca Weiss                       2023-12-08  4178  						iommus = <&apps_smmu 0x11a1 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4179  							 <&apps_smmu 0x1181 0x0420>;
df62402e5ff9df Luca Weiss                       2023-12-08  4180  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4181  
df62402e5ff9df Luca Weiss                       2023-12-08  4182  					compute-cb@2 {
df62402e5ff9df Luca Weiss                       2023-12-08  4183  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4184  						reg = <2>;
df62402e5ff9df Luca Weiss                       2023-12-08  4185  						iommus = <&apps_smmu 0x11a2 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4186  							 <&apps_smmu 0x1182 0x0420>;
df62402e5ff9df Luca Weiss                       2023-12-08  4187  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4188  
df62402e5ff9df Luca Weiss                       2023-12-08  4189  					compute-cb@3 {
df62402e5ff9df Luca Weiss                       2023-12-08  4190  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4191  						reg = <3>;
df62402e5ff9df Luca Weiss                       2023-12-08  4192  						iommus = <&apps_smmu 0x11a3 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4193  							 <&apps_smmu 0x1183 0x0420>;
df62402e5ff9df Luca Weiss                       2023-12-08  4194  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4195  
df62402e5ff9df Luca Weiss                       2023-12-08  4196  					compute-cb@4 {
df62402e5ff9df Luca Weiss                       2023-12-08  4197  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4198  						reg = <4>;
df62402e5ff9df Luca Weiss                       2023-12-08  4199  						iommus = <&apps_smmu 0x11a4 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4200  							 <&apps_smmu 0x1184 0x0420>;
df62402e5ff9df Luca Weiss                       2023-12-08  4201  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4202  
df62402e5ff9df Luca Weiss                       2023-12-08  4203  					compute-cb@5 {
df62402e5ff9df Luca Weiss                       2023-12-08  4204  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4205  						reg = <5>;
df62402e5ff9df Luca Weiss                       2023-12-08  4206  						iommus = <&apps_smmu 0x11a5 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4207  							 <&apps_smmu 0x1185 0x0420>;
df62402e5ff9df Luca Weiss                       2023-12-08  4208  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4209  
df62402e5ff9df Luca Weiss                       2023-12-08  4210  					compute-cb@6 {
df62402e5ff9df Luca Weiss                       2023-12-08  4211  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4212  						reg = <6>;
df62402e5ff9df Luca Weiss                       2023-12-08  4213  						iommus = <&apps_smmu 0x11a6 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4214  							 <&apps_smmu 0x1186 0x0420>;
df62402e5ff9df Luca Weiss                       2023-12-08  4215  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4216  
df62402e5ff9df Luca Weiss                       2023-12-08  4217  					compute-cb@7 {
df62402e5ff9df Luca Weiss                       2023-12-08  4218  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4219  						reg = <7>;
df62402e5ff9df Luca Weiss                       2023-12-08  4220  						iommus = <&apps_smmu 0x11a7 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4221  							 <&apps_smmu 0x1187 0x0420>;
df62402e5ff9df Luca Weiss                       2023-12-08  4222  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4223  
df62402e5ff9df Luca Weiss                       2023-12-08  4224  					compute-cb@8 {
df62402e5ff9df Luca Weiss                       2023-12-08  4225  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4226  						reg = <8>;
df62402e5ff9df Luca Weiss                       2023-12-08  4227  						iommus = <&apps_smmu 0x11a8 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4228  							 <&apps_smmu 0x1188 0x0420>;
df62402e5ff9df Luca Weiss                       2023-12-08  4229  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4230  
df62402e5ff9df Luca Weiss                       2023-12-08  4231  					/* note: secure cb9 in downstream */
df62402e5ff9df Luca Weiss                       2023-12-08  4232  
df62402e5ff9df Luca Weiss                       2023-12-08  4233  					compute-cb@11 {
df62402e5ff9df Luca Weiss                       2023-12-08  4234  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4235  						reg = <11>;
df62402e5ff9df Luca Weiss                       2023-12-08  4236  						iommus = <&apps_smmu 0x11ab 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4237  							 <&apps_smmu 0x118b 0x0420>;
df62402e5ff9df Luca Weiss                       2023-12-08  4238  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4239  
df62402e5ff9df Luca Weiss                       2023-12-08  4240  					compute-cb@12 {
df62402e5ff9df Luca Weiss                       2023-12-08  4241  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4242  						reg = <12>;
df62402e5ff9df Luca Weiss                       2023-12-08  4243  						iommus = <&apps_smmu 0x11ac 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4244  							 <&apps_smmu 0x118c 0x0420>;
df62402e5ff9df Luca Weiss                       2023-12-08  4245  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4246  
df62402e5ff9df Luca Weiss                       2023-12-08  4247  					compute-cb@13 {
df62402e5ff9df Luca Weiss                       2023-12-08  4248  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4249  						reg = <13>;
df62402e5ff9df Luca Weiss                       2023-12-08  4250  						iommus = <&apps_smmu 0x11ad 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4251  							 <&apps_smmu 0x118d 0x0420>;
df62402e5ff9df Luca Weiss                       2023-12-08  4252  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4253  
df62402e5ff9df Luca Weiss                       2023-12-08  4254  					compute-cb@14 {
df62402e5ff9df Luca Weiss                       2023-12-08  4255  						compatible = "qcom,fastrpc-compute-cb";
df62402e5ff9df Luca Weiss                       2023-12-08  4256  						reg = <14>;
df62402e5ff9df Luca Weiss                       2023-12-08  4257  						iommus = <&apps_smmu 0x11ae 0x0420>,
df62402e5ff9df Luca Weiss                       2023-12-08  4258  							 <&apps_smmu 0x118e 0x0420>;
df62402e5ff9df Luca Weiss                       2023-12-08  4259  					};
df62402e5ff9df Luca Weiss                       2023-12-08  4260  				};
df62402e5ff9df Luca Weiss                       2023-12-08  4261  			};
df62402e5ff9df Luca Weiss                       2023-12-08  4262  		};
df62402e5ff9df Luca Weiss                       2023-12-08  4263  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4264  		usb_1: usb@a6f8800 {
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4265  			compatible = "qcom,sc7280-dwc3", "qcom,dwc3";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4266  			reg = <0 0x0a6f8800 0 0x400>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4267  			status = "disabled";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4268  			#address-cells = <2>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4269  			#size-cells = <2>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4270  			ranges;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4271  			dma-ranges;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4272  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4273  			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4274  				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4275  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  4276  				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  4277  				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  4278  			clock-names = "cfg_noc",
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  4279  				      "core",
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  4280  				      "iface",
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  4281  				      "sleep",
8d5fd4e4d4e3c1 Krzysztof Kozlowski              2022-05-04  4282  				      "mock_utmi";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4283  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4284  			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4285  					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4286  			assigned-clock-rates = <19200000>, <200000000>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4287  
6bf150aef236fb Krishna Kurapati                 2024-01-26  4288  			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
6bf150aef236fb Krishna Kurapati                 2024-01-26  4289  					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
c34199d967a946 Johan Hovold                     2023-11-20  4290  					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4291  					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
c34199d967a946 Johan Hovold                     2023-11-20  4292  					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
6bf150aef236fb Krishna Kurapati                 2024-01-26  4293  			interrupt-names = "pwr_event",
6bf150aef236fb Krishna Kurapati                 2024-01-26  4294  					  "hs_phy_irq",
2a8d28b8af7906 Johan Hovold                     2022-07-15  4295  					  "dp_hs_phy_irq",
4a7ffc10d19555 Krzysztof Kozlowski              2022-05-04  4296  					  "dm_hs_phy_irq",
2a8d28b8af7906 Johan Hovold                     2022-07-15  4297  					  "ss_phy_irq";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4298  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4299  			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
3d59187efc982b Rajendra Nayak                   2022-09-16  4300  			required-opps = <&rpmhpd_opp_nom>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4301  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4302  			resets = <&gcc GCC_USB30_PRIM_BCR>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4303  
6493367f8031b1 Sandeep Maheswaram               2021-08-02  4304  			interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,
6493367f8031b1 Sandeep Maheswaram               2021-08-02  4305  					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_USB3_0 0>;
6493367f8031b1 Sandeep Maheswaram               2021-08-02  4306  			interconnect-names = "usb-ddr", "apps-usb";
6493367f8031b1 Sandeep Maheswaram               2021-08-02  4307  
d5089f79b1e4fa Johan Hovold                     2022-08-02  4308  			wakeup-source;
d5089f79b1e4fa Johan Hovold                     2022-08-02  4309  
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4310  			usb_1_dwc3: usb@a600000 {
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4311  				compatible = "snps,dwc3";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4312  				reg = <0 0x0a600000 0 0xe000>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4313  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4314  				iommus = <&apps_smmu 0xe0 0x0>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4315  				snps,dis_u2_susphy_quirk;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4316  				snps,dis_enblslpm_quirk;
3d930f1750ce30 Krishna Kurapati                 2024-06-04  4317  				snps,parkmode-disable-ss-quirk;
0a13ba449afd41 Krishna Kurapati                 2024-12-31  4318  				snps,dis-u1-entry-quirk;
0a13ba449afd41 Krishna Kurapati                 2024-12-31  4319  				snps,dis-u2-entry-quirk;
36888ed83f998c Dmitry Baryshkov                 2023-07-11  4320  				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4321  				phy-names = "usb2-phy", "usb3-phy";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4322  				maximum-speed = "super-speed";
d51b2d5c4a041b Luca Weiss                       2023-12-20  4323  
d51b2d5c4a041b Luca Weiss                       2023-12-20  4324  				ports {
d51b2d5c4a041b Luca Weiss                       2023-12-20  4325  					#address-cells = <1>;
d51b2d5c4a041b Luca Weiss                       2023-12-20  4326  					#size-cells = <0>;
d51b2d5c4a041b Luca Weiss                       2023-12-20  4327  
d51b2d5c4a041b Luca Weiss                       2023-12-20  4328  					port@0 {
d51b2d5c4a041b Luca Weiss                       2023-12-20  4329  						reg = <0>;
d51b2d5c4a041b Luca Weiss                       2023-12-20  4330  
d51b2d5c4a041b Luca Weiss                       2023-12-20  4331  						usb_1_dwc3_hs: endpoint {
d51b2d5c4a041b Luca Weiss                       2023-12-20  4332  						};
d51b2d5c4a041b Luca Weiss                       2023-12-20  4333  					};
d51b2d5c4a041b Luca Weiss                       2023-12-20  4334  
d51b2d5c4a041b Luca Weiss                       2023-12-20  4335  					port@1 {
d51b2d5c4a041b Luca Weiss                       2023-12-20  4336  						reg = <1>;
d51b2d5c4a041b Luca Weiss                       2023-12-20  4337  
d51b2d5c4a041b Luca Weiss                       2023-12-20  4338  						usb_1_dwc3_ss: endpoint {
d51b2d5c4a041b Luca Weiss                       2023-12-20  4339  						};
d51b2d5c4a041b Luca Weiss                       2023-12-20  4340  					};
d51b2d5c4a041b Luca Weiss                       2023-12-20  4341  				};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4342  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4343  		};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  4344  
37613aee217928 Dikshita Agarwal                 2021-10-26  4345  		venus: video-codec@aa00000 {
37613aee217928 Dikshita Agarwal                 2021-10-26  4346  			compatible = "qcom,sc7280-venus";
37613aee217928 Dikshita Agarwal                 2021-10-26  4347  			reg = <0 0x0aa00000 0 0xd0600>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4348  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4349  
37613aee217928 Dikshita Agarwal                 2021-10-26  4350  			clocks = <&videocc VIDEO_CC_MVSC_CORE_CLK>,
37613aee217928 Dikshita Agarwal                 2021-10-26  4351  				 <&videocc VIDEO_CC_MVSC_CTL_AXI_CLK>,
37613aee217928 Dikshita Agarwal                 2021-10-26  4352  				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
37613aee217928 Dikshita Agarwal                 2021-10-26  4353  				 <&videocc VIDEO_CC_MVS0_CORE_CLK>,
37613aee217928 Dikshita Agarwal                 2021-10-26  4354  				 <&videocc VIDEO_CC_MVS0_AXI_CLK>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4355  			clock-names = "core", "bus", "iface",
37613aee217928 Dikshita Agarwal                 2021-10-26  4356  				      "vcodec_core", "vcodec_bus";
37613aee217928 Dikshita Agarwal                 2021-10-26  4357  
37613aee217928 Dikshita Agarwal                 2021-10-26  4358  			power-domains = <&videocc MVSC_GDSC>,
37613aee217928 Dikshita Agarwal                 2021-10-26  4359  					<&videocc MVS0_GDSC>,
37613aee217928 Dikshita Agarwal                 2021-10-26  4360  					<&rpmhpd SC7280_CX>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4361  			power-domain-names = "venus", "vcodec0", "cx";
37613aee217928 Dikshita Agarwal                 2021-10-26  4362  			operating-points-v2 = <&venus_opp_table>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4363  
37613aee217928 Dikshita Agarwal                 2021-10-26  4364  			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_VENUS_CFG 0>,
37613aee217928 Dikshita Agarwal                 2021-10-26  4365  					<&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4366  			interconnect-names = "cpu-cfg", "video-mem";
37613aee217928 Dikshita Agarwal                 2021-10-26  4367  
82066cdb17608a Luca Weiss                       2023-12-01  4368  			iommus = <&apps_smmu 0x2180 0x20>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4369  			memory-region = <&video_mem>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4370  
82066cdb17608a Luca Weiss                       2023-12-01  4371  			status = "disabled";
82066cdb17608a Luca Weiss                       2023-12-01  4372  
0e3e654696074b Krzysztof Kozlowski              2022-06-27  4373  			venus_opp_table: opp-table {
37613aee217928 Dikshita Agarwal                 2021-10-26  4374  				compatible = "operating-points-v2";
37613aee217928 Dikshita Agarwal                 2021-10-26  4375  
37613aee217928 Dikshita Agarwal                 2021-10-26  4376  				opp-133330000 {
37613aee217928 Dikshita Agarwal                 2021-10-26  4377  					opp-hz = /bits/ 64 <133330000>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4378  					required-opps = <&rpmhpd_opp_low_svs>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4379  				};
37613aee217928 Dikshita Agarwal                 2021-10-26  4380  
37613aee217928 Dikshita Agarwal                 2021-10-26  4381  				opp-240000000 {
37613aee217928 Dikshita Agarwal                 2021-10-26  4382  					opp-hz = /bits/ 64 <240000000>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4383  					required-opps = <&rpmhpd_opp_svs>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4384  				};
37613aee217928 Dikshita Agarwal                 2021-10-26  4385  
37613aee217928 Dikshita Agarwal                 2021-10-26  4386  				opp-335000000 {
37613aee217928 Dikshita Agarwal                 2021-10-26  4387  					opp-hz = /bits/ 64 <335000000>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4388  					required-opps = <&rpmhpd_opp_svs_l1>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4389  				};
37613aee217928 Dikshita Agarwal                 2021-10-26  4390  
37613aee217928 Dikshita Agarwal                 2021-10-26  4391  				opp-424000000 {
37613aee217928 Dikshita Agarwal                 2021-10-26  4392  					opp-hz = /bits/ 64 <424000000>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4393  					required-opps = <&rpmhpd_opp_nom>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4394  				};
37613aee217928 Dikshita Agarwal                 2021-10-26  4395  
37613aee217928 Dikshita Agarwal                 2021-10-26  4396  				opp-460000048 {
37613aee217928 Dikshita Agarwal                 2021-10-26  4397  					opp-hz = /bits/ 64 <460000048>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4398  					required-opps = <&rpmhpd_opp_turbo>;
37613aee217928 Dikshita Agarwal                 2021-10-26  4399  				};
37613aee217928 Dikshita Agarwal                 2021-10-26  4400  			};
37613aee217928 Dikshita Agarwal                 2021-10-26  4401  		};
37613aee217928 Dikshita Agarwal                 2021-10-26  4402  
422a295221bba8 Taniya Das                       2021-04-10  4403  		videocc: clock-controller@aaf0000 {
422a295221bba8 Taniya Das                       2021-04-10  4404  			compatible = "qcom,sc7280-videocc";
94ca994d7e932c Konrad Dybcio                    2023-01-02  4405  			reg = <0 0x0aaf0000 0 0x10000>;
422a295221bba8 Taniya Das                       2021-04-10  4406  			clocks = <&rpmhcc RPMH_CXO_CLK>,
422a295221bba8 Taniya Das                       2021-04-10  4407  				<&rpmhcc RPMH_CXO_CLK_A>;
422a295221bba8 Taniya Das                       2021-04-10  4408  			clock-names = "bi_tcxo", "bi_tcxo_ao";
422a295221bba8 Taniya Das                       2021-04-10  4409  			#clock-cells = <1>;
422a295221bba8 Taniya Das                       2021-04-10  4410  			#reset-cells = <1>;
422a295221bba8 Taniya Das                       2021-04-10  4411  			#power-domain-cells = <1>;
422a295221bba8 Taniya Das                       2021-04-10  4412  		};
422a295221bba8 Taniya Das                       2021-04-10  4413  
0c149ca7653286 Luca Weiss                       2023-10-02  4414  		cci0: cci@ac4a000 {
0c149ca7653286 Luca Weiss                       2023-10-02  4415  			compatible = "qcom,sc7280-cci", "qcom,msm8996-cci";
0c149ca7653286 Luca Weiss                       2023-10-02  4416  			reg = <0 0x0ac4a000 0 0x1000>;
0c149ca7653286 Luca Weiss                       2023-10-02  4417  			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
0c149ca7653286 Luca Weiss                       2023-10-02  4418  			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
0c149ca7653286 Luca Weiss                       2023-10-02  4419  
0c149ca7653286 Luca Weiss                       2023-10-02  4420  			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
0c149ca7653286 Luca Weiss                       2023-10-02  4421  				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
0c149ca7653286 Luca Weiss                       2023-10-02  4422  				 <&camcc CAM_CC_CPAS_AHB_CLK>,
0c149ca7653286 Luca Weiss                       2023-10-02  4423  				 <&camcc CAM_CC_CCI_0_CLK>,
0c149ca7653286 Luca Weiss                       2023-10-02  4424  				 <&camcc CAM_CC_CCI_0_CLK_SRC>;
0c149ca7653286 Luca Weiss                       2023-10-02  4425  			clock-names = "camnoc_axi",
0c149ca7653286 Luca Weiss                       2023-10-02  4426  				      "slow_ahb_src",
0c149ca7653286 Luca Weiss                       2023-10-02  4427  				      "cpas_ahb",
0c149ca7653286 Luca Weiss                       2023-10-02  4428  				      "cci",
0c149ca7653286 Luca Weiss                       2023-10-02  4429  				      "cci_src";
0c149ca7653286 Luca Weiss                       2023-10-02  4430  			pinctrl-0 = <&cci0_default &cci1_default>;
0c149ca7653286 Luca Weiss                       2023-10-02  4431  			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
0c149ca7653286 Luca Weiss                       2023-10-02  4432  			pinctrl-names = "default", "sleep";
0c149ca7653286 Luca Weiss                       2023-10-02  4433  
0c149ca7653286 Luca Weiss                       2023-10-02  4434  			#address-cells = <1>;
0c149ca7653286 Luca Weiss                       2023-10-02  4435  			#size-cells = <0>;
0c149ca7653286 Luca Weiss                       2023-10-02  4436  
0c149ca7653286 Luca Weiss                       2023-10-02  4437  			status = "disabled";
0c149ca7653286 Luca Weiss                       2023-10-02  4438  
0c149ca7653286 Luca Weiss                       2023-10-02  4439  			cci0_i2c0: i2c-bus@0 {
0c149ca7653286 Luca Weiss                       2023-10-02  4440  				reg = <0>;
0c149ca7653286 Luca Weiss                       2023-10-02  4441  				clock-frequency = <1000000>;
0c149ca7653286 Luca Weiss                       2023-10-02  4442  				#address-cells = <1>;
0c149ca7653286 Luca Weiss                       2023-10-02  4443  				#size-cells = <0>;
0c149ca7653286 Luca Weiss                       2023-10-02  4444  			};
0c149ca7653286 Luca Weiss                       2023-10-02  4445  
0c149ca7653286 Luca Weiss                       2023-10-02  4446  			cci0_i2c1: i2c-bus@1 {
0c149ca7653286 Luca Weiss                       2023-10-02  4447  				reg = <1>;
0c149ca7653286 Luca Weiss                       2023-10-02  4448  				clock-frequency = <1000000>;
0c149ca7653286 Luca Weiss                       2023-10-02  4449  				#address-cells = <1>;
0c149ca7653286 Luca Weiss                       2023-10-02  4450  				#size-cells = <0>;
0c149ca7653286 Luca Weiss                       2023-10-02  4451  			};
0c149ca7653286 Luca Weiss                       2023-10-02  4452  		};
0c149ca7653286 Luca Weiss                       2023-10-02  4453  
0c149ca7653286 Luca Weiss                       2023-10-02  4454  		cci1: cci@ac4b000 {
0c149ca7653286 Luca Weiss                       2023-10-02  4455  			compatible = "qcom,sc7280-cci", "qcom,msm8996-cci";
0c149ca7653286 Luca Weiss                       2023-10-02  4456  			reg = <0 0x0ac4b000 0 0x1000>;
0c149ca7653286 Luca Weiss                       2023-10-02  4457  			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
0c149ca7653286 Luca Weiss                       2023-10-02  4458  			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
0c149ca7653286 Luca Weiss                       2023-10-02  4459  
0c149ca7653286 Luca Weiss                       2023-10-02  4460  			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
0c149ca7653286 Luca Weiss                       2023-10-02  4461  				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
0c149ca7653286 Luca Weiss                       2023-10-02  4462  				 <&camcc CAM_CC_CPAS_AHB_CLK>,
0c149ca7653286 Luca Weiss                       2023-10-02  4463  				 <&camcc CAM_CC_CCI_1_CLK>,
0c149ca7653286 Luca Weiss                       2023-10-02  4464  				 <&camcc CAM_CC_CCI_1_CLK_SRC>;
0c149ca7653286 Luca Weiss                       2023-10-02  4465  			clock-names = "camnoc_axi",
0c149ca7653286 Luca Weiss                       2023-10-02  4466  				      "slow_ahb_src",
0c149ca7653286 Luca Weiss                       2023-10-02  4467  				      "cpas_ahb",
0c149ca7653286 Luca Weiss                       2023-10-02  4468  				      "cci",
0c149ca7653286 Luca Weiss                       2023-10-02  4469  				      "cci_src";
0c149ca7653286 Luca Weiss                       2023-10-02  4470  			pinctrl-0 = <&cci2_default &cci3_default>;
0c149ca7653286 Luca Weiss                       2023-10-02  4471  			pinctrl-1 = <&cci2_sleep &cci3_sleep>;
0c149ca7653286 Luca Weiss                       2023-10-02  4472  			pinctrl-names = "default", "sleep";
0c149ca7653286 Luca Weiss                       2023-10-02  4473  
0c149ca7653286 Luca Weiss                       2023-10-02  4474  			#address-cells = <1>;
0c149ca7653286 Luca Weiss                       2023-10-02  4475  			#size-cells = <0>;
0c149ca7653286 Luca Weiss                       2023-10-02  4476  
0c149ca7653286 Luca Weiss                       2023-10-02  4477  			status = "disabled";
0c149ca7653286 Luca Weiss                       2023-10-02  4478  
0c149ca7653286 Luca Weiss                       2023-10-02  4479  			cci1_i2c0: i2c-bus@0 {
0c149ca7653286 Luca Weiss                       2023-10-02  4480  				reg = <0>;
0c149ca7653286 Luca Weiss                       2023-10-02  4481  				clock-frequency = <1000000>;
0c149ca7653286 Luca Weiss                       2023-10-02  4482  				#address-cells = <1>;
0c149ca7653286 Luca Weiss                       2023-10-02  4483  				#size-cells = <0>;
0c149ca7653286 Luca Weiss                       2023-10-02  4484  			};
0c149ca7653286 Luca Weiss                       2023-10-02  4485  
0c149ca7653286 Luca Weiss                       2023-10-02  4486  			cci1_i2c1: i2c-bus@1 {
0c149ca7653286 Luca Weiss                       2023-10-02  4487  				reg = <1>;
0c149ca7653286 Luca Weiss                       2023-10-02  4488  				clock-frequency = <1000000>;
0c149ca7653286 Luca Weiss                       2023-10-02  4489  				#address-cells = <1>;
0c149ca7653286 Luca Weiss                       2023-10-02  4490  				#size-cells = <0>;
0c149ca7653286 Luca Weiss                       2023-10-02  4491  			};
0c149ca7653286 Luca Weiss                       2023-10-02  4492  		};
0c149ca7653286 Luca Weiss                       2023-10-02  4493  
d4da3adfc560fc Vikram Sharma                    2025-02-09  4494  		camss: isp@acb3000 {
d4da3adfc560fc Vikram Sharma                    2025-02-09  4495  			compatible = "qcom,sc7280-camss";
d4da3adfc560fc Vikram Sharma                    2025-02-09  4496  
d4da3adfc560fc Vikram Sharma                    2025-02-09  4497  			reg = <0x0 0x0acb3000 0x0 0x1000>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4498  			      <0x0 0x0acba000 0x0 0x1000>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4499  			      <0x0 0x0acc1000 0x0 0x1000>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4500  			      <0x0 0x0acc8000 0x0 0x1000>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4501  			      <0x0 0x0accf000 0x0 0x1000>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4502  			      <0x0 0x0ace0000 0x0 0x2000>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4503  			      <0x0 0x0ace2000 0x0 0x2000>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4504  			      <0x0 0x0ace4000 0x0 0x2000>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4505  			      <0x0 0x0ace6000 0x0 0x2000>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4506  			      <0x0 0x0ace8000 0x0 0x2000>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4507  			      <0x0 0x0acaf000 0x0 0x4000>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4508  			      <0x0 0x0acb6000 0x0 0x4000>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4509  			      <0x0 0x0acbd000 0x0 0x4000>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4510  			      <0x0 0x0acc4000 0x0 0x4000>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4511  			      <0x0 0x0accb000 0x0 0x4000>;
d4da3adfc560fc Vikram Sharma                    2025-02-09  4512  			reg-names = "csid0",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4513  				    "csid1",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4514  				    "csid2",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4515  				    "csid_lite0",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4516  				    "csid_lite1",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4517  				    "csiphy0",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4518  				    "csiphy1",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4519  				    "csiphy2",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4520  				    "csiphy3",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4521  				    "csiphy4",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4522  				    "vfe0",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4523  				    "vfe1",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4524  				    "vfe2",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4525  				    "vfe_lite0",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4526  				    "vfe_lite1";
d4da3adfc560fc Vikram Sharma                    2025-02-09  4527  
d4da3adfc560fc Vikram Sharma                    2025-02-09  4528  			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4529  				 <&camcc CAM_CC_CPAS_AHB_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4530  				 <&camcc CAM_CC_CSIPHY0_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4531  				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4532  				 <&camcc CAM_CC_CSIPHY1_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4533  				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4534  				 <&camcc CAM_CC_CSIPHY2_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4535  				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4536  				 <&camcc CAM_CC_CSIPHY3_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4537  				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4538  				 <&camcc CAM_CC_CSIPHY4_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4539  				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4540  				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4541  				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4542  				 <&camcc CAM_CC_ICP_AHB_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4543  				 <&camcc CAM_CC_IFE_0_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4544  				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4545  				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4546  				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4547  				 <&camcc CAM_CC_IFE_1_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4548  				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4549  				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4550  				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4551  				 <&camcc CAM_CC_IFE_2_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4552  				 <&camcc CAM_CC_IFE_2_AXI_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4553  				 <&camcc CAM_CC_IFE_2_CPHY_RX_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4554  				 <&camcc CAM_CC_IFE_2_CSID_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4555  				 <&camcc CAM_CC_IFE_LITE_0_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4556  				 <&camcc CAM_CC_IFE_LITE_0_CPHY_RX_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4557  				 <&camcc CAM_CC_IFE_LITE_0_CSID_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4558  				 <&camcc CAM_CC_IFE_LITE_1_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4559  				 <&camcc CAM_CC_IFE_LITE_1_CPHY_RX_CLK>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4560  				 <&camcc CAM_CC_IFE_LITE_1_CSID_CLK>;
d4da3adfc560fc Vikram Sharma                    2025-02-09  4561  			clock-names = "camnoc_axi",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4562  				      "cpas_ahb",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4563  				      "csiphy0",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4564  				      "csiphy0_timer",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4565  				      "csiphy1",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4566  				      "csiphy1_timer",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4567  				      "csiphy2",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4568  				      "csiphy2_timer",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4569  				      "csiphy3",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4570  				      "csiphy3_timer",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4571  				      "csiphy4",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4572  				      "csiphy4_timer",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4573  				      "gcc_axi_hf",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4574  				      "gcc_axi_sf",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4575  				      "icp_ahb",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4576  				      "vfe0",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4577  				      "vfe0_axi",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4578  				      "vfe0_cphy_rx",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4579  				      "vfe0_csid",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4580  				      "vfe1",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4581  				      "vfe1_axi",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4582  				      "vfe1_cphy_rx",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4583  				      "vfe1_csid",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4584  				      "vfe2",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4585  				      "vfe2_axi",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4586  				      "vfe2_cphy_rx",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4587  				      "vfe2_csid",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4588  				      "vfe_lite0",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4589  				      "vfe_lite0_cphy_rx",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4590  				      "vfe_lite0_csid",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4591  				      "vfe_lite1",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4592  				      "vfe_lite1_cphy_rx",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4593  				      "vfe_lite1_csid";
d4da3adfc560fc Vikram Sharma                    2025-02-09  4594  
d4da3adfc560fc Vikram Sharma                    2025-02-09  4595  			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4596  				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4597  				     <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4598  				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4599  				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4600  				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4601  				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4602  				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4603  				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4604  				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4605  				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4606  				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4607  				     <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4608  				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4609  				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
d4da3adfc560fc Vikram Sharma                    2025-02-09  4610  			interrupt-names = "csid0",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4611  					  "csid1",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4612  					  "csid2",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4613  					  "csid_lite0",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4614  					  "csid_lite1",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4615  					  "csiphy0",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4616  					  "csiphy1",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4617  					  "csiphy2",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4618  					  "csiphy3",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4619  					  "csiphy4",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4620  					  "vfe0",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4621  					  "vfe1",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4622  					  "vfe2",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4623  					  "vfe_lite0",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4624  					  "vfe_lite1";
d4da3adfc560fc Vikram Sharma                    2025-02-09  4625  
d4da3adfc560fc Vikram Sharma                    2025-02-09  4626  			interconnects = <&gem_noc  MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
d4da3adfc560fc Vikram Sharma                    2025-02-09  4627  					 &cnoc2 SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4628  					<&mmss_noc MASTER_CAMNOC_HF  QCOM_ICC_TAG_ALWAYS
d4da3adfc560fc Vikram Sharma                    2025-02-09  4629  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
d4da3adfc560fc Vikram Sharma                    2025-02-09  4630  			interconnect-names = "ahb",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4631  					     "hf_0";
d4da3adfc560fc Vikram Sharma                    2025-02-09  4632  
d4da3adfc560fc Vikram Sharma                    2025-02-09  4633  			iommus = <&apps_smmu 0x800 0x4e0>;
d4da3adfc560fc Vikram Sharma                    2025-02-09  4634  
d4da3adfc560fc Vikram Sharma                    2025-02-09  4635  			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4636  					<&camcc CAM_CC_IFE_1_GDSC>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4637  					<&camcc CAM_CC_IFE_2_GDSC>,
d4da3adfc560fc Vikram Sharma                    2025-02-09  4638  					<&camcc CAM_CC_TITAN_TOP_GDSC>;
d4da3adfc560fc Vikram Sharma                    2025-02-09  4639  			power-domain-names = "ife0",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4640  					     "ife1",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4641  					     "ife2",
d4da3adfc560fc Vikram Sharma                    2025-02-09  4642  					     "top";
d4da3adfc560fc Vikram Sharma                    2025-02-09  4643  
d4da3adfc560fc Vikram Sharma                    2025-02-09  4644  			status = "disabled";
d4da3adfc560fc Vikram Sharma                    2025-02-09  4645  
d4da3adfc560fc Vikram Sharma                    2025-02-09  4646  			ports {
d4da3adfc560fc Vikram Sharma                    2025-02-09  4647  				#address-cells = <1>;
d4da3adfc560fc Vikram Sharma                    2025-02-09  4648  				#size-cells = <0>;
d4da3adfc560fc Vikram Sharma                    2025-02-09  4649  
d4da3adfc560fc Vikram Sharma                    2025-02-09  4650  				port@0 {
d4da3adfc560fc Vikram Sharma                    2025-02-09  4651  					reg = <0>;
d4da3adfc560fc Vikram Sharma                    2025-02-09  4652  				};
d4da3adfc560fc Vikram Sharma                    2025-02-09  4653  
d4da3adfc560fc Vikram Sharma                    2025-02-09  4654  				port@1 {
d4da3adfc560fc Vikram Sharma                    2025-02-09  4655  					reg = <1>;
d4da3adfc560fc Vikram Sharma                    2025-02-09  4656  				};
d4da3adfc560fc Vikram Sharma                    2025-02-09  4657  
d4da3adfc560fc Vikram Sharma                    2025-02-09  4658  				port@2 {
d4da3adfc560fc Vikram Sharma                    2025-02-09  4659  					reg = <2>;
d4da3adfc560fc Vikram Sharma                    2025-02-09  4660  				};
d4da3adfc560fc Vikram Sharma                    2025-02-09  4661  
d4da3adfc560fc Vikram Sharma                    2025-02-09  4662  				port@3 {
d4da3adfc560fc Vikram Sharma                    2025-02-09  4663  					reg = <3>;
d4da3adfc560fc Vikram Sharma                    2025-02-09  4664  				};
d4da3adfc560fc Vikram Sharma                    2025-02-09  4665  
d4da3adfc560fc Vikram Sharma                    2025-02-09  4666  				port@4 {
d4da3adfc560fc Vikram Sharma                    2025-02-09  4667  					reg = <4>;
d4da3adfc560fc Vikram Sharma                    2025-02-09  4668  				};
d4da3adfc560fc Vikram Sharma                    2025-02-09  4669  			};
d4da3adfc560fc Vikram Sharma                    2025-02-09  4670  		};
d4da3adfc560fc Vikram Sharma                    2025-02-09  4671  
7b1e0a87730e32 Taniya Das                       2022-01-25  4672  		camcc: clock-controller@ad00000 {
7b1e0a87730e32 Taniya Das                       2022-01-25  4673  			compatible = "qcom,sc7280-camcc";
7b1e0a87730e32 Taniya Das                       2022-01-25  4674  			reg = <0 0x0ad00000 0 0x10000>;
7b1e0a87730e32 Taniya Das                       2022-01-25  4675  			clocks = <&rpmhcc RPMH_CXO_CLK>,
7b1e0a87730e32 Taniya Das                       2022-01-25  4676  				<&rpmhcc RPMH_CXO_CLK_A>,
7b1e0a87730e32 Taniya Das                       2022-01-25  4677  				<&sleep_clk>;
7b1e0a87730e32 Taniya Das                       2022-01-25  4678  			clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
7b1e0a87730e32 Taniya Das                       2022-01-25  4679  			#clock-cells = <1>;
7b1e0a87730e32 Taniya Das                       2022-01-25  4680  			#reset-cells = <1>;
7b1e0a87730e32 Taniya Das                       2022-01-25  4681  			#power-domain-cells = <1>;
7b1e0a87730e32 Taniya Das                       2022-01-25  4682  		};
7b1e0a87730e32 Taniya Das                       2022-01-25  4683  
422a295221bba8 Taniya Das                       2021-04-10  4684  		dispcc: clock-controller@af00000 {
422a295221bba8 Taniya Das                       2021-04-10  4685  			compatible = "qcom,sc7280-dispcc";
94ca994d7e932c Konrad Dybcio                    2023-01-02  4686  			reg = <0 0x0af00000 0 0x20000>;
422a295221bba8 Taniya Das                       2021-04-10  4687  			clocks = <&rpmhcc RPMH_CXO_CLK>,
422a295221bba8 Taniya Das                       2021-04-10  4688  				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
33e020b942cb4b Dmitry Baryshkov                 2025-04-15  4689  				 <&mdss_dsi_phy DSI_BYTE_PLL_CLK>,
33e020b942cb4b Dmitry Baryshkov                 2025-04-15  4690  				 <&mdss_dsi_phy DSI_PIXEL_PLL_CLK>,
36888ed83f998c Dmitry Baryshkov                 2023-07-11  4691  				 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
36888ed83f998c Dmitry Baryshkov                 2023-07-11  4692  				 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
25940788d17025 Sankeerth Billakanti             2021-12-24  4693  				 <&mdss_edp_phy 0>,
25940788d17025 Sankeerth Billakanti             2021-12-24  4694  				 <&mdss_edp_phy 1>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4695  			clock-names = "bi_tcxo",
43137272f0bc5e Rajeev Nandan                    2021-12-24  4696  				      "gcc_disp_gpll0_clk",
422a295221bba8 Taniya Das                       2021-04-10  4697  				      "dsi0_phy_pll_out_byteclk",
422a295221bba8 Taniya Das                       2021-04-10  4698  				      "dsi0_phy_pll_out_dsiclk",
422a295221bba8 Taniya Das                       2021-04-10  4699  				      "dp_phy_pll_link_clk",
422a295221bba8 Taniya Das                       2021-04-10  4700  				      "dp_phy_pll_vco_div_clk",
422a295221bba8 Taniya Das                       2021-04-10  4701  				      "edp_phy_pll_link_clk",
422a295221bba8 Taniya Das                       2021-04-10  4702  				      "edp_phy_pll_vco_div_clk";
422a295221bba8 Taniya Das                       2021-04-10  4703  			#clock-cells = <1>;
422a295221bba8 Taniya Das                       2021-04-10  4704  			#reset-cells = <1>;
422a295221bba8 Taniya Das                       2021-04-10  4705  			#power-domain-cells = <1>;
422a295221bba8 Taniya Das                       2021-04-10  4706  		};
422a295221bba8 Taniya Das                       2021-04-10  4707  
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4708  		mdss: display-subsystem@ae00000 {
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4709  			compatible = "qcom,sc7280-mdss";
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4710  			reg = <0 0x0ae00000 0 0x1000>;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4711  			reg-names = "mdss";
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4712  
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4713  			power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4714  
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4715  			clocks = <&gcc GCC_DISP_AHB_CLK>,
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4716  				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4717  				<&dispcc DISP_CC_MDSS_MDP_CLK>;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4718  			clock-names = "iface",
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4719  				      "ahb",
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4720  				      "core";
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4721  
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4722  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4723  			interrupt-controller;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4724  			#interrupt-cells = <1>;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4725  
c657056d99878c Konrad Dybcio                    2023-11-29  4726  			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
c657056d99878c Konrad Dybcio                    2023-11-29  4727  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
c657056d99878c Konrad Dybcio                    2023-11-29  4728  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
c657056d99878c Konrad Dybcio                    2023-11-29  4729  					 &cnoc2 SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ALWAYS>;
c657056d99878c Konrad Dybcio                    2023-11-29  4730  			interconnect-names = "mdp0-mem",
c657056d99878c Konrad Dybcio                    2023-11-29  4731  					     "cpu-cfg";
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4732  
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4733  			iommus = <&apps_smmu 0x900 0x402>;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4734  
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4735  			#address-cells = <2>;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4736  			#size-cells = <2>;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4737  			ranges;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4738  
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4739  			status = "disabled";
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4740  
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4741  			mdss_mdp: display-controller@ae01000 {
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4742  				compatible = "qcom,sc7280-dpu";
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4743  				reg = <0 0x0ae01000 0 0x8f030>,
545b26b926ae20 Dmitry Baryshkov                 2025-04-15  4744  					<0 0x0aeb0000 0 0x3000>;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4745  				reg-names = "mdp", "vbif";
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4746  
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4747  				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4748  					<&gcc GCC_DISP_SF_AXI_CLK>,
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4749  					<&dispcc DISP_CC_MDSS_AHB_CLK>,
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4750  					<&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4751  					<&dispcc DISP_CC_MDSS_MDP_CLK>,
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4752  					<&dispcc DISP_CC_MDSS_VSYNC_CLK>;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4753  				clock-names = "bus",
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4754  					      "nrt_bus",
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4755  					      "iface",
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4756  					      "lut",
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4757  					      "core",
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4758  					      "vsync";
5241fd7fee9bee Vinod Polimera                   2022-03-22  4759  				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4760  						<&dispcc DISP_CC_MDSS_AHB_CLK>;
5241fd7fee9bee Vinod Polimera                   2022-03-22  4761  				assigned-clock-rates = <19200000>,
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4762  							<19200000>;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4763  				operating-points-v2 = <&mdp_opp_table>;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4764  				power-domains = <&rpmhpd SC7280_CX>;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4765  
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4766  				interrupt-parent = <&mdss>;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4767  				interrupts = <0>;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4768  
43137272f0bc5e Rajeev Nandan                    2021-12-24  4769  				ports {
43137272f0bc5e Rajeev Nandan                    2021-12-24  4770  					#address-cells = <1>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4771  					#size-cells = <0>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4772  
43137272f0bc5e Rajeev Nandan                    2021-12-24  4773  					port@0 {
43137272f0bc5e Rajeev Nandan                    2021-12-24  4774  						reg = <0>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4775  						dpu_intf1_out: endpoint {
71c97412f1d773 Dmitry Baryshkov                 2023-05-31  4776  							remote-endpoint = <&mdss_dsi0_in>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4777  						};
43137272f0bc5e Rajeev Nandan                    2021-12-24  4778  					};
25940788d17025 Sankeerth Billakanti             2021-12-24  4779  
25940788d17025 Sankeerth Billakanti             2021-12-24  4780  					port@1 {
25940788d17025 Sankeerth Billakanti             2021-12-24  4781  						reg = <1>;
25940788d17025 Sankeerth Billakanti             2021-12-24  4782  						dpu_intf5_out: endpoint {
25940788d17025 Sankeerth Billakanti             2021-12-24  4783  							remote-endpoint = <&edp_in>;
25940788d17025 Sankeerth Billakanti             2021-12-24  4784  						};
25940788d17025 Sankeerth Billakanti             2021-12-24  4785  					};
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  4786  
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  4787  					port@2 {
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  4788  						reg = <2>;
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  4789  						dpu_intf0_out: endpoint {
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  4790  							remote-endpoint = <&dp_in>;
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  4791  						};
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  4792  					};
43137272f0bc5e Rajeev Nandan                    2021-12-24  4793  				};
43137272f0bc5e Rajeev Nandan                    2021-12-24  4794  
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4795  				mdp_opp_table: opp-table {
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4796  					compatible = "operating-points-v2";
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4797  
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4798  					opp-200000000 {
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4799  						opp-hz = /bits/ 64 <200000000>;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4800  						required-opps = <&rpmhpd_opp_low_svs>;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4801  					};
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4802  
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4803  					opp-300000000 {
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4804  						opp-hz = /bits/ 64 <300000000>;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4805  						required-opps = <&rpmhpd_opp_svs>;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4806  					};
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4807  
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4808  					opp-380000000 {
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4809  						opp-hz = /bits/ 64 <380000000>;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4810  						required-opps = <&rpmhpd_opp_svs_l1>;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4811  					};
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4812  
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4813  					opp-506666667 {
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4814  						opp-hz = /bits/ 64 <506666667>;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4815  						required-opps = <&rpmhpd_opp_nom>;
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4816  					};
d0d6230aa9652a Bjorn Andersson                  2024-03-26  4817  
d0d6230aa9652a Bjorn Andersson                  2024-03-26  4818  					opp-608000000 {
d0d6230aa9652a Bjorn Andersson                  2024-03-26  4819  						opp-hz = /bits/ 64 <608000000>;
d0d6230aa9652a Bjorn Andersson                  2024-03-26  4820  						required-opps = <&rpmhpd_opp_turbo>;
d0d6230aa9652a Bjorn Andersson                  2024-03-26  4821  					};
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4822  				};
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  4823  			};
43137272f0bc5e Rajeev Nandan                    2021-12-24  4824  
43137272f0bc5e Rajeev Nandan                    2021-12-24  4825  			mdss_dsi: dsi@ae94000 {
5b5e4ac378e5d2 Bryan O'Donoghue                 2022-12-23  4826  				compatible = "qcom,sc7280-dsi-ctrl",
5b5e4ac378e5d2 Bryan O'Donoghue                 2022-12-23  4827  					     "qcom,mdss-dsi-ctrl";
43137272f0bc5e Rajeev Nandan                    2021-12-24  4828  				reg = <0 0x0ae94000 0 0x400>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4829  				reg-names = "dsi_ctrl";
43137272f0bc5e Rajeev Nandan                    2021-12-24  4830  
43137272f0bc5e Rajeev Nandan                    2021-12-24  4831  				interrupt-parent = <&mdss>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4832  				interrupts = <4>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4833  
43137272f0bc5e Rajeev Nandan                    2021-12-24  4834  				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
43137272f0bc5e Rajeev Nandan                    2021-12-24  4835  					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
43137272f0bc5e Rajeev Nandan                    2021-12-24  4836  					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
43137272f0bc5e Rajeev Nandan                    2021-12-24  4837  					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
43137272f0bc5e Rajeev Nandan                    2021-12-24  4838  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
43137272f0bc5e Rajeev Nandan                    2021-12-24  4839  					 <&gcc GCC_DISP_HF_AXI_CLK>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4840  				clock-names = "byte",
43137272f0bc5e Rajeev Nandan                    2021-12-24  4841  					      "byte_intf",
43137272f0bc5e Rajeev Nandan                    2021-12-24  4842  					      "pixel",
43137272f0bc5e Rajeev Nandan                    2021-12-24  4843  					      "core",
43137272f0bc5e Rajeev Nandan                    2021-12-24  4844  					      "iface",
43137272f0bc5e Rajeev Nandan                    2021-12-24  4845  					      "bus";
43137272f0bc5e Rajeev Nandan                    2021-12-24  4846  
33e020b942cb4b Dmitry Baryshkov                 2025-04-15  4847  				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
33e020b942cb4b Dmitry Baryshkov                 2025-04-15  4848  						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
33e020b942cb4b Dmitry Baryshkov                 2025-04-15  4849  				assigned-clock-parents = <&mdss_dsi_phy DSI_BYTE_PLL_CLK>,
33e020b942cb4b Dmitry Baryshkov                 2025-04-15  4850  							 <&mdss_dsi_phy DSI_PIXEL_PLL_CLK>;
80edac18ac173f Rajeev Nandan                    2022-09-07  4851  
43137272f0bc5e Rajeev Nandan                    2021-12-24  4852  				operating-points-v2 = <&dsi_opp_table>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4853  				power-domains = <&rpmhpd SC7280_CX>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4854  
43137272f0bc5e Rajeev Nandan                    2021-12-24  4855  				phys = <&mdss_dsi_phy>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4856  
43137272f0bc5e Rajeev Nandan                    2021-12-24  4857  				#address-cells = <1>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4858  				#size-cells = <0>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4859  
43137272f0bc5e Rajeev Nandan                    2021-12-24  4860  				status = "disabled";
43137272f0bc5e Rajeev Nandan                    2021-12-24  4861  
43137272f0bc5e Rajeev Nandan                    2021-12-24  4862  				ports {
43137272f0bc5e Rajeev Nandan                    2021-12-24  4863  					#address-cells = <1>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4864  					#size-cells = <0>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4865  
43137272f0bc5e Rajeev Nandan                    2021-12-24  4866  					port@0 {
43137272f0bc5e Rajeev Nandan                    2021-12-24  4867  						reg = <0>;
71c97412f1d773 Dmitry Baryshkov                 2023-05-31  4868  						mdss_dsi0_in: endpoint {
43137272f0bc5e Rajeev Nandan                    2021-12-24  4869  							remote-endpoint = <&dpu_intf1_out>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4870  						};
43137272f0bc5e Rajeev Nandan                    2021-12-24  4871  					};
43137272f0bc5e Rajeev Nandan                    2021-12-24  4872  
43137272f0bc5e Rajeev Nandan                    2021-12-24  4873  					port@1 {
43137272f0bc5e Rajeev Nandan                    2021-12-24  4874  						reg = <1>;
71c97412f1d773 Dmitry Baryshkov                 2023-05-31  4875  						mdss_dsi0_out: endpoint {
43137272f0bc5e Rajeev Nandan                    2021-12-24  4876  						};
43137272f0bc5e Rajeev Nandan                    2021-12-24  4877  					};
43137272f0bc5e Rajeev Nandan                    2021-12-24  4878  				};
43137272f0bc5e Rajeev Nandan                    2021-12-24  4879  
43137272f0bc5e Rajeev Nandan                    2021-12-24  4880  				dsi_opp_table: opp-table {
43137272f0bc5e Rajeev Nandan                    2021-12-24  4881  					compatible = "operating-points-v2";
43137272f0bc5e Rajeev Nandan                    2021-12-24  4882  
43137272f0bc5e Rajeev Nandan                    2021-12-24  4883  					opp-187500000 {
43137272f0bc5e Rajeev Nandan                    2021-12-24  4884  						opp-hz = /bits/ 64 <187500000>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4885  						required-opps = <&rpmhpd_opp_low_svs>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4886  					};
43137272f0bc5e Rajeev Nandan                    2021-12-24  4887  
43137272f0bc5e Rajeev Nandan                    2021-12-24  4888  					opp-300000000 {
43137272f0bc5e Rajeev Nandan                    2021-12-24  4889  						opp-hz = /bits/ 64 <300000000>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4890  						required-opps = <&rpmhpd_opp_svs>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4891  					};
43137272f0bc5e Rajeev Nandan                    2021-12-24  4892  
43137272f0bc5e Rajeev Nandan                    2021-12-24  4893  					opp-358000000 {
43137272f0bc5e Rajeev Nandan                    2021-12-24  4894  						opp-hz = /bits/ 64 <358000000>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4895  						required-opps = <&rpmhpd_opp_svs_l1>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4896  					};
43137272f0bc5e Rajeev Nandan                    2021-12-24  4897  				};
43137272f0bc5e Rajeev Nandan                    2021-12-24  4898  			};
43137272f0bc5e Rajeev Nandan                    2021-12-24  4899  
43137272f0bc5e Rajeev Nandan                    2021-12-24  4900  			mdss_dsi_phy: phy@ae94400 {
43137272f0bc5e Rajeev Nandan                    2021-12-24  4901  				compatible = "qcom,sc7280-dsi-phy-7nm";
43137272f0bc5e Rajeev Nandan                    2021-12-24  4902  				reg = <0 0x0ae94400 0 0x200>,
43137272f0bc5e Rajeev Nandan                    2021-12-24  4903  				      <0 0x0ae94600 0 0x280>,
43137272f0bc5e Rajeev Nandan                    2021-12-24  4904  				      <0 0x0ae94900 0 0x280>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4905  				reg-names = "dsi_phy",
43137272f0bc5e Rajeev Nandan                    2021-12-24  4906  					    "dsi_phy_lane",
43137272f0bc5e Rajeev Nandan                    2021-12-24  4907  					    "dsi_pll";
43137272f0bc5e Rajeev Nandan                    2021-12-24  4908  
43137272f0bc5e Rajeev Nandan                    2021-12-24  4909  				#clock-cells = <1>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4910  				#phy-cells = <0>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4911  
43137272f0bc5e Rajeev Nandan                    2021-12-24  4912  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
43137272f0bc5e Rajeev Nandan                    2021-12-24  4913  					 <&rpmhcc RPMH_CXO_CLK>;
43137272f0bc5e Rajeev Nandan                    2021-12-24  4914  				clock-names = "iface", "ref";
43137272f0bc5e Rajeev Nandan                    2021-12-24  4915  
43137272f0bc5e Rajeev Nandan                    2021-12-24  4916  				status = "disabled";
43137272f0bc5e Rajeev Nandan                    2021-12-24  4917  			};
25940788d17025 Sankeerth Billakanti             2021-12-24  4918  
25940788d17025 Sankeerth Billakanti             2021-12-24  4919  			mdss_edp: edp@aea0000 {
25940788d17025 Sankeerth Billakanti             2021-12-24  4920  				compatible = "qcom,sc7280-edp";
118cd3b8ec0db0 Douglas Anderson                 2022-02-02  4921  				pinctrl-names = "default";
118cd3b8ec0db0 Douglas Anderson                 2022-02-02  4922  				pinctrl-0 = <&edp_hot_plug_det>;
25940788d17025 Sankeerth Billakanti             2021-12-24  4923  
94ca994d7e932c Konrad Dybcio                    2023-01-02  4924  				reg = <0 0x0aea0000 0 0x200>,
94ca994d7e932c Konrad Dybcio                    2023-01-02  4925  				      <0 0x0aea0200 0 0x200>,
94ca994d7e932c Konrad Dybcio                    2023-01-02  4926  				      <0 0x0aea0400 0 0xc00>,
94ca994d7e932c Konrad Dybcio                    2023-01-02  4927  				      <0 0x0aea1000 0 0x400>;
25940788d17025 Sankeerth Billakanti             2021-12-24  4928  
25940788d17025 Sankeerth Billakanti             2021-12-24  4929  				interrupt-parent = <&mdss>;
25940788d17025 Sankeerth Billakanti             2021-12-24  4930  				interrupts = <14>;
25940788d17025 Sankeerth Billakanti             2021-12-24  4931  
f32894b8d8b430 Dmitry Baryshkov                 2022-07-10  4932  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
25940788d17025 Sankeerth Billakanti             2021-12-24  4933  					 <&dispcc DISP_CC_MDSS_EDP_AUX_CLK>,
25940788d17025 Sankeerth Billakanti             2021-12-24  4934  					 <&dispcc DISP_CC_MDSS_EDP_LINK_CLK>,
25940788d17025 Sankeerth Billakanti             2021-12-24  4935  					 <&dispcc DISP_CC_MDSS_EDP_LINK_INTF_CLK>,
25940788d17025 Sankeerth Billakanti             2021-12-24  4936  					 <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK>;
f32894b8d8b430 Dmitry Baryshkov                 2022-07-10  4937  				clock-names = "core_iface",
25940788d17025 Sankeerth Billakanti             2021-12-24  4938  					      "core_aux",
25940788d17025 Sankeerth Billakanti             2021-12-24  4939  					      "ctrl_link",
25940788d17025 Sankeerth Billakanti             2021-12-24  4940  					      "ctrl_link_iface",
25940788d17025 Sankeerth Billakanti             2021-12-24  4941  					      "stream_pixel";
25940788d17025 Sankeerth Billakanti             2021-12-24  4942  				assigned-clocks = <&dispcc DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
25940788d17025 Sankeerth Billakanti             2021-12-24  4943  						  <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
25940788d17025 Sankeerth Billakanti             2021-12-24  4944  				assigned-clock-parents = <&mdss_edp_phy 0>, <&mdss_edp_phy 1>;
25940788d17025 Sankeerth Billakanti             2021-12-24  4945  
25940788d17025 Sankeerth Billakanti             2021-12-24  4946  				phys = <&mdss_edp_phy>;
25940788d17025 Sankeerth Billakanti             2021-12-24  4947  				phy-names = "dp";
25940788d17025 Sankeerth Billakanti             2021-12-24  4948  
25940788d17025 Sankeerth Billakanti             2021-12-24  4949  				operating-points-v2 = <&edp_opp_table>;
25940788d17025 Sankeerth Billakanti             2021-12-24  4950  				power-domains = <&rpmhpd SC7280_CX>;
25940788d17025 Sankeerth Billakanti             2021-12-24  4951  
25940788d17025 Sankeerth Billakanti             2021-12-24  4952  				status = "disabled";
25940788d17025 Sankeerth Billakanti             2021-12-24  4953  
25940788d17025 Sankeerth Billakanti             2021-12-24  4954  				ports {
25940788d17025 Sankeerth Billakanti             2021-12-24  4955  					#address-cells = <1>;
25940788d17025 Sankeerth Billakanti             2021-12-24  4956  					#size-cells = <0>;
118cd3b8ec0db0 Douglas Anderson                 2022-02-02  4957  
25940788d17025 Sankeerth Billakanti             2021-12-24  4958  					port@0 {
25940788d17025 Sankeerth Billakanti             2021-12-24  4959  						reg = <0>;
25940788d17025 Sankeerth Billakanti             2021-12-24  4960  						edp_in: endpoint {
25940788d17025 Sankeerth Billakanti             2021-12-24  4961  							remote-endpoint = <&dpu_intf5_out>;
25940788d17025 Sankeerth Billakanti             2021-12-24  4962  						};
25940788d17025 Sankeerth Billakanti             2021-12-24  4963  					};
118cd3b8ec0db0 Douglas Anderson                 2022-02-02  4964  
118cd3b8ec0db0 Douglas Anderson                 2022-02-02  4965  					port@1 {
118cd3b8ec0db0 Douglas Anderson                 2022-02-02  4966  						reg = <1>;
e036b77be77d23 Sankeerth Billakanti             2022-03-16  4967  						mdss_edp_out: endpoint { };
118cd3b8ec0db0 Douglas Anderson                 2022-02-02  4968  					};
25940788d17025 Sankeerth Billakanti             2021-12-24  4969  				};
25940788d17025 Sankeerth Billakanti             2021-12-24  4970  
25940788d17025 Sankeerth Billakanti             2021-12-24  4971  				edp_opp_table: opp-table {
25940788d17025 Sankeerth Billakanti             2021-12-24  4972  					compatible = "operating-points-v2";
25940788d17025 Sankeerth Billakanti             2021-12-24  4973  
25940788d17025 Sankeerth Billakanti             2021-12-24  4974  					opp-160000000 {
25940788d17025 Sankeerth Billakanti             2021-12-24  4975  						opp-hz = /bits/ 64 <160000000>;
25940788d17025 Sankeerth Billakanti             2021-12-24  4976  						required-opps = <&rpmhpd_opp_low_svs>;
25940788d17025 Sankeerth Billakanti             2021-12-24  4977  					};
25940788d17025 Sankeerth Billakanti             2021-12-24  4978  
25940788d17025 Sankeerth Billakanti             2021-12-24  4979  					opp-270000000 {
25940788d17025 Sankeerth Billakanti             2021-12-24  4980  						opp-hz = /bits/ 64 <270000000>;
25940788d17025 Sankeerth Billakanti             2021-12-24  4981  						required-opps = <&rpmhpd_opp_svs>;
25940788d17025 Sankeerth Billakanti             2021-12-24  4982  					};
25940788d17025 Sankeerth Billakanti             2021-12-24  4983  
25940788d17025 Sankeerth Billakanti             2021-12-24  4984  					opp-540000000 {
25940788d17025 Sankeerth Billakanti             2021-12-24  4985  						opp-hz = /bits/ 64 <540000000>;
25940788d17025 Sankeerth Billakanti             2021-12-24  4986  						required-opps = <&rpmhpd_opp_nom>;
25940788d17025 Sankeerth Billakanti             2021-12-24  4987  					};
25940788d17025 Sankeerth Billakanti             2021-12-24  4988  
25940788d17025 Sankeerth Billakanti             2021-12-24  4989  					opp-810000000 {
25940788d17025 Sankeerth Billakanti             2021-12-24  4990  						opp-hz = /bits/ 64 <810000000>;
25940788d17025 Sankeerth Billakanti             2021-12-24  4991  						required-opps = <&rpmhpd_opp_nom>;
25940788d17025 Sankeerth Billakanti             2021-12-24  4992  					};
25940788d17025 Sankeerth Billakanti             2021-12-24  4993  				};
25940788d17025 Sankeerth Billakanti             2021-12-24  4994  			};
25940788d17025 Sankeerth Billakanti             2021-12-24  4995  
25940788d17025 Sankeerth Billakanti             2021-12-24  4996  			mdss_edp_phy: phy@aec2a00 {
25940788d17025 Sankeerth Billakanti             2021-12-24  4997  				compatible = "qcom,sc7280-edp-phy";
25940788d17025 Sankeerth Billakanti             2021-12-24  4998  
94ca994d7e932c Konrad Dybcio                    2023-01-02  4999  				reg = <0 0x0aec2a00 0 0x19c>,
94ca994d7e932c Konrad Dybcio                    2023-01-02  5000  				      <0 0x0aec2200 0 0xa0>,
94ca994d7e932c Konrad Dybcio                    2023-01-02  5001  				      <0 0x0aec2600 0 0xa0>,
94ca994d7e932c Konrad Dybcio                    2023-01-02  5002  				      <0 0x0aec2000 0 0x1c0>;
25940788d17025 Sankeerth Billakanti             2021-12-24  5003  
25940788d17025 Sankeerth Billakanti             2021-12-24  5004  				clocks = <&rpmhcc RPMH_CXO_CLK>,
25940788d17025 Sankeerth Billakanti             2021-12-24  5005  					 <&gcc GCC_EDP_CLKREF_EN>;
25940788d17025 Sankeerth Billakanti             2021-12-24  5006  				clock-names = "aux",
25940788d17025 Sankeerth Billakanti             2021-12-24  5007  					      "cfg_ahb";
25940788d17025 Sankeerth Billakanti             2021-12-24  5008  
25940788d17025 Sankeerth Billakanti             2021-12-24  5009  				#clock-cells = <1>;
25940788d17025 Sankeerth Billakanti             2021-12-24  5010  				#phy-cells = <0>;
25940788d17025 Sankeerth Billakanti             2021-12-24  5011  
25940788d17025 Sankeerth Billakanti             2021-12-24  5012  				status = "disabled";
25940788d17025 Sankeerth Billakanti             2021-12-24  5013  			};
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5014  
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5015  			mdss_dp: displayport-controller@ae90000 {
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5016  				compatible = "qcom,sc7280-dp";
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5017  
94ca994d7e932c Konrad Dybcio                    2023-01-02  5018  				reg = <0 0x0ae90000 0 0x200>,
94ca994d7e932c Konrad Dybcio                    2023-01-02  5019  				      <0 0x0ae90200 0 0x200>,
94ca994d7e932c Konrad Dybcio                    2023-01-02  5020  				      <0 0x0ae90400 0 0xc00>,
94ca994d7e932c Konrad Dybcio                    2023-01-02  5021  				      <0 0x0ae91000 0 0x400>,
94ca994d7e932c Konrad Dybcio                    2023-01-02  5022  				      <0 0x0ae91400 0 0x400>;
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5023  
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5024  				interrupt-parent = <&mdss>;
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5025  				interrupts = <12>;
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5026  
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5027  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5028  					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5029  					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5030  					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5031  					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5032  				clock-names = "core_iface",
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5033  						"core_aux",
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5034  						"ctrl_link",
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5035  						"ctrl_link_iface",
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5036  						"stream_pixel";
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5037  				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5038  						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
36888ed83f998c Dmitry Baryshkov                 2023-07-11  5039  				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
36888ed83f998c Dmitry Baryshkov                 2023-07-11  5040  							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
36888ed83f998c Dmitry Baryshkov                 2023-07-11  5041  				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5042  				phy-names = "dp";
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5043  
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5044  				operating-points-v2 = <&dp_opp_table>;
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5045  				power-domains = <&rpmhpd SC7280_CX>;
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5046  
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5047  				#sound-dai-cells = <0>;
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5048  
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5049  				status = "disabled";
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5050  
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5051  				ports {
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5052  					#address-cells = <1>;
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5053  					#size-cells = <0>;
96b34a6ea7d038 Douglas Anderson                 2022-02-02  5054  
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5055  					port@0 {
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5056  						reg = <0>;
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5057  						dp_in: endpoint {
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5058  							remote-endpoint = <&dpu_intf0_out>;
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5059  						};
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5060  					};
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5061  
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5062  					port@1 {
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5063  						reg = <1>;
26c5aa54f5973a Kuogee Hsieh                     2022-12-27  5064  						mdss_dp_out: endpoint { };
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5065  					};
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5066  				};
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5067  
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5068  				dp_opp_table: opp-table {
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5069  					compatible = "operating-points-v2";
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5070  
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5071  					opp-160000000 {
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5072  						opp-hz = /bits/ 64 <160000000>;
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5073  						required-opps = <&rpmhpd_opp_low_svs>;
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5074  					};
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5075  
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5076  					opp-270000000 {
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5077  						opp-hz = /bits/ 64 <270000000>;
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5078  						required-opps = <&rpmhpd_opp_svs>;
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5079  					};
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5080  
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5081  					opp-540000000 {
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5082  						opp-hz = /bits/ 64 <540000000>;
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5083  						required-opps = <&rpmhpd_opp_svs_l1>;
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5084  					};
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5085  
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5086  					opp-810000000 {
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5087  						opp-hz = /bits/ 64 <810000000>;
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5088  						required-opps = <&rpmhpd_opp_nom>;
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5089  					};
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5090  				};
fc6b1225d20de0 Kuogee Hsieh                     2021-12-24  5091  			};
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  5092  		};
fcb68dfda5cbd8 Krishna Manikandan               2021-12-24  5093  
3450bb5b9570a2 Maulik Shah                      2021-03-11  5094  		pdc: interrupt-controller@b220000 {
3450bb5b9570a2 Maulik Shah                      2021-03-11  5095  			compatible = "qcom,sc7280-pdc", "qcom,pdc";
3450bb5b9570a2 Maulik Shah                      2021-03-11  5096  			reg = <0 0x0b220000 0 0x30000>;
3450bb5b9570a2 Maulik Shah                      2021-03-11  5097  			qcom,pdc-ranges = <0 480 40>, <40 140 14>, <54 263 1>,
3450bb5b9570a2 Maulik Shah                      2021-03-11  5098  					  <55 306 4>, <59 312 3>, <62 374 2>,
3450bb5b9570a2 Maulik Shah                      2021-03-11  5099  					  <64 434 2>, <66 438 3>, <69 86 1>,
3450bb5b9570a2 Maulik Shah                      2021-03-11  5100  					  <70 520 54>, <124 609 31>, <155 63 1>,
3450bb5b9570a2 Maulik Shah                      2021-03-11  5101  					  <156 716 12>;
3450bb5b9570a2 Maulik Shah                      2021-03-11  5102  			#interrupt-cells = <2>;
3450bb5b9570a2 Maulik Shah                      2021-03-11  5103  			interrupt-parent = <&intc>;
3450bb5b9570a2 Maulik Shah                      2021-03-11  5104  			interrupt-controller;
3450bb5b9570a2 Maulik Shah                      2021-03-11  5105  		};
3450bb5b9570a2 Maulik Shah                      2021-03-11  5106  
c3bbe55c942d2a Sibi Sankar                      2021-04-27  5107  		pdc_reset: reset-controller@b5e0000 {
c3bbe55c942d2a Sibi Sankar                      2021-04-27  5108  			compatible = "qcom,sc7280-pdc-global";
c3bbe55c942d2a Sibi Sankar                      2021-04-27  5109  			reg = <0 0x0b5e0000 0 0x20000>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27  5110  			#reset-cells = <1>;
6da24ba932082b Luca Weiss                       2023-09-19  5111  			status = "reserved"; /* Owned by firmware */
c3bbe55c942d2a Sibi Sankar                      2021-04-27  5112  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27  5113  
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5114  		tsens0: thermal-sensor@c263000 {
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5115  			compatible = "qcom,sc7280-tsens","qcom,tsens-v2";
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5116  			reg = <0 0x0c263000 0 0x1ff>, /* TM */
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5117  				<0 0x0c222000 0 0x1ff>; /* SROT */
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5118  			#qcom,sensors = <15>;
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5119  			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5120  				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5121  			interrupt-names = "uplow","critical";
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5122  			#thermal-sensor-cells = <1>;
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5123  		};
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5124  
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5125  		tsens1: thermal-sensor@c265000 {
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5126  			compatible = "qcom,sc7280-tsens","qcom,tsens-v2";
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5127  			reg = <0 0x0c265000 0 0x1ff>, /* TM */
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5128  				<0 0x0c223000 0 0x1ff>; /* SROT */
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5129  			#qcom,sensors = <12>;
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5130  			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5131  				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>;
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5132  			interrupt-names = "uplow","critical";
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5133  			#thermal-sensor-cells = <1>;
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5134  		};
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5135  
c3bbe55c942d2a Sibi Sankar                      2021-04-27  5136  		aoss_reset: reset-controller@c2a0000 {
c3bbe55c942d2a Sibi Sankar                      2021-04-27  5137  			compatible = "qcom,sc7280-aoss-cc", "qcom,sdm845-aoss-cc";
c3bbe55c942d2a Sibi Sankar                      2021-04-27  5138  			reg = <0 0x0c2a0000 0 0x31000>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27  5139  			#reset-cells = <1>;
c3bbe55c942d2a Sibi Sankar                      2021-04-27  5140  		};
c3bbe55c942d2a Sibi Sankar                      2021-04-27  5141  
bb99820dd284a9 Krzysztof Kozlowski              2022-12-13  5142  		aoss_qmp: power-management@c300000 {
6ba93ba9f63fbc Krzysztof Kozlowski              2022-05-04  5143  			compatible = "qcom,sc7280-aoss-qmp", "qcom,aoss-qmp";
47cb6a068409e1 Maulik Shah                      2021-10-13  5144  			reg = <0 0x0c300000 0 0x400>;
208979a8f9cb8e Sai Prakash Ranjan               2021-03-16  5145  			interrupts-extended = <&ipcc IPCC_CLIENT_AOP
208979a8f9cb8e Sai Prakash Ranjan               2021-03-16  5146  						     IPCC_MPROC_SIGNAL_GLINK_QMP
208979a8f9cb8e Sai Prakash Ranjan               2021-03-16  5147  						     IRQ_TYPE_EDGE_RISING>;
208979a8f9cb8e Sai Prakash Ranjan               2021-03-16  5148  			mboxes = <&ipcc IPCC_CLIENT_AOP
208979a8f9cb8e Sai Prakash Ranjan               2021-03-16  5149  					IPCC_MPROC_SIGNAL_GLINK_QMP>;
208979a8f9cb8e Sai Prakash Ranjan               2021-03-16  5150  
208979a8f9cb8e Sai Prakash Ranjan               2021-03-16  5151  			#clock-cells = <0>;
208979a8f9cb8e Sai Prakash Ranjan               2021-03-16  5152  		};
208979a8f9cb8e Sai Prakash Ranjan               2021-03-16  5153  
47cb6a068409e1 Maulik Shah                      2021-10-13  5154  		sram@c3f0000 {
47cb6a068409e1 Maulik Shah                      2021-10-13  5155  			compatible = "qcom,rpmh-stats";
47cb6a068409e1 Maulik Shah                      2021-10-13  5156  			reg = <0 0x0c3f0000 0 0x400>;
47cb6a068409e1 Maulik Shah                      2021-10-13  5157  		};
47cb6a068409e1 Maulik Shah                      2021-10-13  5158  
14abf8dfe3643e satya priya                      2021-03-11  5159  		spmi_bus: spmi@c440000 {
14abf8dfe3643e satya priya                      2021-03-11  5160  			compatible = "qcom,spmi-pmic-arb";
14abf8dfe3643e satya priya                      2021-03-11  5161  			reg = <0 0x0c440000 0 0x1100>,
14abf8dfe3643e satya priya                      2021-03-11  5162  			      <0 0x0c600000 0 0x2000000>,
14abf8dfe3643e satya priya                      2021-03-11  5163  			      <0 0x0e600000 0 0x100000>,
14abf8dfe3643e satya priya                      2021-03-11  5164  			      <0 0x0e700000 0 0xa0000>,
14abf8dfe3643e satya priya                      2021-03-11  5165  			      <0 0x0c40a000 0 0x26000>;
14abf8dfe3643e satya priya                      2021-03-11  5166  			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
14abf8dfe3643e satya priya                      2021-03-11  5167  			interrupt-names = "periph_irq";
14abf8dfe3643e satya priya                      2021-03-11  5168  			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
14abf8dfe3643e satya priya                      2021-03-11  5169  			qcom,ee = <0>;
14abf8dfe3643e satya priya                      2021-03-11  5170  			qcom,channel = <0>;
8da3786a91e56f Krzysztof Kozlowski              2022-12-13  5171  			#address-cells = <2>;
8da3786a91e56f Krzysztof Kozlowski              2022-12-13  5172  			#size-cells = <0>;
14abf8dfe3643e satya priya                      2021-03-11  5173  			interrupt-controller;
14abf8dfe3643e satya priya                      2021-03-11  5174  			#interrupt-cells = <4>;
14abf8dfe3643e satya priya                      2021-03-11  5175  		};
14abf8dfe3643e satya priya                      2021-03-11  5176  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  5177  		tlmm: pinctrl@f100000 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  5178  			compatible = "qcom,sc7280-pinctrl";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  5179  			reg = <0 0x0f100000 0 0x300000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  5180  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  5181  			gpio-controller;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  5182  			#gpio-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  5183  			interrupt-controller;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  5184  			#interrupt-cells = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  5185  			gpio-ranges = <&tlmm 0 0 175>;
3450bb5b9570a2 Maulik Shah                      2021-03-11  5186  			wakeup-parent = <&pdc>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  5187  
0c149ca7653286 Luca Weiss                       2023-10-02  5188  			cci0_default: cci0-default-state {
0c149ca7653286 Luca Weiss                       2023-10-02  5189  				pins = "gpio69", "gpio70";
0c149ca7653286 Luca Weiss                       2023-10-02  5190  				function = "cci_i2c";
0c149ca7653286 Luca Weiss                       2023-10-02  5191  				drive-strength = <2>;
0c149ca7653286 Luca Weiss                       2023-10-02  5192  				bias-pull-up;
0c149ca7653286 Luca Weiss                       2023-10-02  5193  			};
0c149ca7653286 Luca Weiss                       2023-10-02  5194  
0c149ca7653286 Luca Weiss                       2023-10-02  5195  			cci0_sleep: cci0-sleep-state {
0c149ca7653286 Luca Weiss                       2023-10-02  5196  				pins = "gpio69", "gpio70";
0c149ca7653286 Luca Weiss                       2023-10-02  5197  				function = "cci_i2c";
0c149ca7653286 Luca Weiss                       2023-10-02  5198  				drive-strength = <2>;
0c149ca7653286 Luca Weiss                       2023-10-02  5199  				bias-pull-down;
0c149ca7653286 Luca Weiss                       2023-10-02  5200  			};
0c149ca7653286 Luca Weiss                       2023-10-02  5201  
0c149ca7653286 Luca Weiss                       2023-10-02  5202  			cci1_default: cci1-default-state {
0c149ca7653286 Luca Weiss                       2023-10-02  5203  				pins = "gpio71", "gpio72";
0c149ca7653286 Luca Weiss                       2023-10-02  5204  				function = "cci_i2c";
0c149ca7653286 Luca Weiss                       2023-10-02  5205  				drive-strength = <2>;
0c149ca7653286 Luca Weiss                       2023-10-02  5206  				bias-pull-up;
0c149ca7653286 Luca Weiss                       2023-10-02  5207  			};
0c149ca7653286 Luca Weiss                       2023-10-02  5208  
0c149ca7653286 Luca Weiss                       2023-10-02  5209  			cci1_sleep: cci1-sleep-state {
0c149ca7653286 Luca Weiss                       2023-10-02  5210  				pins = "gpio71", "gpio72";
0c149ca7653286 Luca Weiss                       2023-10-02  5211  				function = "cci_i2c";
0c149ca7653286 Luca Weiss                       2023-10-02  5212  				drive-strength = <2>;
0c149ca7653286 Luca Weiss                       2023-10-02  5213  				bias-pull-down;
0c149ca7653286 Luca Weiss                       2023-10-02  5214  			};
0c149ca7653286 Luca Weiss                       2023-10-02  5215  
0c149ca7653286 Luca Weiss                       2023-10-02  5216  			cci2_default: cci2-default-state {
0c149ca7653286 Luca Weiss                       2023-10-02  5217  				pins = "gpio73", "gpio74";
0c149ca7653286 Luca Weiss                       2023-10-02  5218  				function = "cci_i2c";
0c149ca7653286 Luca Weiss                       2023-10-02  5219  				drive-strength = <2>;
0c149ca7653286 Luca Weiss                       2023-10-02  5220  				bias-pull-up;
0c149ca7653286 Luca Weiss                       2023-10-02  5221  			};
0c149ca7653286 Luca Weiss                       2023-10-02  5222  
0c149ca7653286 Luca Weiss                       2023-10-02  5223  			cci2_sleep: cci2-sleep-state {
0c149ca7653286 Luca Weiss                       2023-10-02  5224  				pins = "gpio73", "gpio74";
0c149ca7653286 Luca Weiss                       2023-10-02  5225  				function = "cci_i2c";
0c149ca7653286 Luca Weiss                       2023-10-02  5226  				drive-strength = <2>;
0c149ca7653286 Luca Weiss                       2023-10-02  5227  				bias-pull-down;
0c149ca7653286 Luca Weiss                       2023-10-02  5228  			};
0c149ca7653286 Luca Weiss                       2023-10-02  5229  
0c149ca7653286 Luca Weiss                       2023-10-02  5230  			cci3_default: cci3-default-state {
0c149ca7653286 Luca Weiss                       2023-10-02  5231  				pins = "gpio75", "gpio76";
0c149ca7653286 Luca Weiss                       2023-10-02  5232  				function = "cci_i2c";
0c149ca7653286 Luca Weiss                       2023-10-02  5233  				drive-strength = <2>;
0c149ca7653286 Luca Weiss                       2023-10-02  5234  				bias-pull-up;
0c149ca7653286 Luca Weiss                       2023-10-02  5235  			};
0c149ca7653286 Luca Weiss                       2023-10-02  5236  
0c149ca7653286 Luca Weiss                       2023-10-02  5237  			cci3_sleep: cci3-sleep-state {
0c149ca7653286 Luca Weiss                       2023-10-02  5238  				pins = "gpio75", "gpio76";
0c149ca7653286 Luca Weiss                       2023-10-02  5239  				function = "cci_i2c";
0c149ca7653286 Luca Weiss                       2023-10-02  5240  				drive-strength = <2>;
0c149ca7653286 Luca Weiss                       2023-10-02  5241  				bias-pull-down;
0c149ca7653286 Luca Weiss                       2023-10-02  5242  			};
0c149ca7653286 Luca Weiss                       2023-10-02  5243  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5244  			dp_hot_plug_det: dp-hot-plug-det-state {
bbef2a9ca08749 Douglas Anderson                 2022-02-02  5245  				pins = "gpio47";
bbef2a9ca08749 Douglas Anderson                 2022-02-02  5246  				function = "dp_hot";
bbef2a9ca08749 Douglas Anderson                 2022-02-02  5247  			};
bbef2a9ca08749 Douglas Anderson                 2022-02-02  5248  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5249  			edp_hot_plug_det: edp-hot-plug-det-state {
118cd3b8ec0db0 Douglas Anderson                 2022-02-02  5250  				pins = "gpio60";
118cd3b8ec0db0 Douglas Anderson                 2022-02-02  5251  				function = "edp_hot";
118cd3b8ec0db0 Douglas Anderson                 2022-02-02  5252  			};
118cd3b8ec0db0 Douglas Anderson                 2022-02-02  5253  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5254  			mi2s0_data0: mi2s0-data0-state {
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5255  				pins = "gpio98";
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5256  				function = "mi2s0_data0";
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5257  			};
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5258  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5259  			mi2s0_data1: mi2s0-data1-state {
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5260  				pins = "gpio99";
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5261  				function = "mi2s0_data1";
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5262  			};
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5263  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5264  			mi2s0_mclk: mi2s0-mclk-state {
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5265  				pins = "gpio96";
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5266  				function = "pri_mi2s";
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5267  			};
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5268  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5269  			mi2s0_sclk: mi2s0-sclk-state {
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5270  				pins = "gpio97";
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5271  				function = "mi2s0_sck";
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5272  			};
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5273  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5274  			mi2s0_ws: mi2s0-ws-state {
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5275  				pins = "gpio100";
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5276  				function = "mi2s0_ws";
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5277  			};
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5278  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5279  			mi2s1_data0: mi2s1-data0-state {
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5280  				pins = "gpio107";
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5281  				function = "mi2s1_data0";
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5282  			};
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5283  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5284  			mi2s1_sclk: mi2s1-sclk-state {
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5285  				pins = "gpio106";
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5286  				function = "mi2s1_sck";
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5287  			};
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5288  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5289  			mi2s1_ws: mi2s1-ws-state {
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5290  				pins = "gpio108";
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5291  				function = "mi2s1_ws";
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5292  			};
b9e3f65ecf8585 Srinivasa Rao Mandadapu          2022-06-13  5293  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5294  			pcie1_clkreq_n: pcie1-clkreq-n-state {
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  5295  				pins = "gpio79";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  5296  				function = "pcie1_clkreqn";
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  5297  			};
92e0ee9f83b3bc Prasad Malisetty                 2021-10-07  5298  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5299  			qspi_clk: qspi-clk-state {
7720ea001b528d Roja Rani Yarubandi              2021-09-23  5300  				pins = "gpio14";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  5301  				function = "qspi_clk";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  5302  			};
7720ea001b528d Roja Rani Yarubandi              2021-09-23  5303  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5304  			qspi_cs0: qspi-cs0-state {
7720ea001b528d Roja Rani Yarubandi              2021-09-23  5305  				pins = "gpio15";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  5306  				function = "qspi_cs";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  5307  			};
7720ea001b528d Roja Rani Yarubandi              2021-09-23  5308  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5309  			qspi_cs1: qspi-cs1-state {
7720ea001b528d Roja Rani Yarubandi              2021-09-23  5310  				pins = "gpio19";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  5311  				function = "qspi_cs";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  5312  			};
7720ea001b528d Roja Rani Yarubandi              2021-09-23  5313  
5f89df31096d67 Douglas Anderson                 2023-03-23  5314  			qspi_data0: qspi-data0-state {
5f89df31096d67 Douglas Anderson                 2023-03-23  5315  				pins = "gpio12";
5f89df31096d67 Douglas Anderson                 2023-03-23  5316  				function = "qspi_data";
5f89df31096d67 Douglas Anderson                 2023-03-23  5317  			};
5f89df31096d67 Douglas Anderson                 2023-03-23  5318  
5f89df31096d67 Douglas Anderson                 2023-03-23  5319  			qspi_data1: qspi-data1-state {
5f89df31096d67 Douglas Anderson                 2023-03-23  5320  				pins = "gpio13";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  5321  				function = "qspi_data";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  5322  			};
7720ea001b528d Roja Rani Yarubandi              2021-09-23  5323  
14acf21c0d3f7b Douglas Anderson                 2023-03-23  5324  			qspi_data23: qspi-data23-state {
7720ea001b528d Roja Rani Yarubandi              2021-09-23  5325  				pins = "gpio16", "gpio17";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  5326  				function = "qspi_data";
7720ea001b528d Roja Rani Yarubandi              2021-09-23  5327  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5328  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5329  			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5330  				pins = "gpio0", "gpio1";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5331  				function = "qup00";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5332  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5333  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5334  			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5335  				pins = "gpio4", "gpio5";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5336  				function = "qup01";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5337  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5338  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5339  			qup_i2c2_data_clk: qup-i2c2-data-clk-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5340  				pins = "gpio8", "gpio9";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5341  				function = "qup02";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5342  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5343  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5344  			qup_i2c3_data_clk: qup-i2c3-data-clk-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5345  				pins = "gpio12", "gpio13";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5346  				function = "qup03";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5347  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5348  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5349  			qup_i2c4_data_clk: qup-i2c4-data-clk-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5350  				pins = "gpio16", "gpio17";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5351  				function = "qup04";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5352  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5353  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5354  			qup_i2c5_data_clk: qup-i2c5-data-clk-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5355  				pins = "gpio20", "gpio21";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5356  				function = "qup05";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5357  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5358  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5359  			qup_i2c6_data_clk: qup-i2c6-data-clk-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5360  				pins = "gpio24", "gpio25";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5361  				function = "qup06";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5362  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5363  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5364  			qup_i2c7_data_clk: qup-i2c7-data-clk-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5365  				pins = "gpio28", "gpio29";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5366  				function = "qup07";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5367  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5368  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5369  			qup_i2c8_data_clk: qup-i2c8-data-clk-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5370  				pins = "gpio32", "gpio33";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5371  				function = "qup10";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5372  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5373  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5374  			qup_i2c9_data_clk: qup-i2c9-data-clk-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5375  				pins = "gpio36", "gpio37";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5376  				function = "qup11";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5377  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5378  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5379  			qup_i2c10_data_clk: qup-i2c10-data-clk-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5380  				pins = "gpio40", "gpio41";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5381  				function = "qup12";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5382  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5383  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5384  			qup_i2c11_data_clk: qup-i2c11-data-clk-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5385  				pins = "gpio44", "gpio45";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5386  				function = "qup13";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5387  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5388  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5389  			qup_i2c12_data_clk: qup-i2c12-data-clk-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5390  				pins = "gpio48", "gpio49";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5391  				function = "qup14";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5392  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5393  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5394  			qup_i2c13_data_clk: qup-i2c13-data-clk-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5395  				pins = "gpio52", "gpio53";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5396  				function = "qup15";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5397  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5398  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5399  			qup_i2c14_data_clk: qup-i2c14-data-clk-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5400  				pins = "gpio56", "gpio57";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5401  				function = "qup16";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5402  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5403  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5404  			qup_i2c15_data_clk: qup-i2c15-data-clk-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5405  				pins = "gpio60", "gpio61";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5406  				function = "qup17";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5407  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5408  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5409  			qup_spi0_data_clk: qup-spi0-data-clk-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5410  				pins = "gpio0", "gpio1", "gpio2";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5411  				function = "qup00";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5412  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5413  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5414  			qup_spi0_cs: qup-spi0-cs-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5415  				pins = "gpio3";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5416  				function = "qup00";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5417  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5418  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5419  			qup_spi0_cs_gpio: qup-spi0-cs-gpio-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5420  				pins = "gpio3";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5421  				function = "gpio";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5422  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5423  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5424  			qup_spi1_data_clk: qup-spi1-data-clk-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5425  				pins = "gpio4", "gpio5", "gpio6";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5426  				function = "qup01";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5427  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5428  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5429  			qup_spi1_cs: qup-spi1-cs-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5430  				pins = "gpio7";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5431  				function = "qup01";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5432  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5433  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5434  			qup_spi1_cs_gpio: qup-spi1-cs-gpio-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5435  				pins = "gpio7";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5436  				function = "gpio";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5437  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5438  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5439  			qup_spi2_data_clk: qup-spi2-data-clk-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5440  				pins = "gpio8", "gpio9", "gpio10";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5441  				function = "qup02";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5442  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5443  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5444  			qup_spi2_cs: qup-spi2-cs-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5445  				pins = "gpio11";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5446  				function = "qup02";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5447  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5448  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5449  			qup_spi2_cs_gpio: qup-spi2-cs-gpio-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5450  				pins = "gpio11";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5451  				function = "gpio";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5452  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5453  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5454  			qup_spi3_data_clk: qup-spi3-data-clk-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5455  				pins = "gpio12", "gpio13", "gpio14";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5456  				function = "qup03";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5457  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5458  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5459  			qup_spi3_cs: qup-spi3-cs-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5460  				pins = "gpio15";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5461  				function = "qup03";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5462  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5463  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5464  			qup_spi3_cs_gpio: qup-spi3-cs-gpio-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5465  				pins = "gpio15";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5466  				function = "gpio";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5467  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5468  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5469  			qup_spi4_data_clk: qup-spi4-data-clk-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5470  				pins = "gpio16", "gpio17", "gpio18";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5471  				function = "qup04";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5472  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5473  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5474  			qup_spi4_cs: qup-spi4-cs-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5475  				pins = "gpio19";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5476  				function = "qup04";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5477  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5478  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5479  			qup_spi4_cs_gpio: qup-spi4-cs-gpio-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5480  				pins = "gpio19";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5481  				function = "gpio";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5482  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5483  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5484  			qup_spi5_data_clk: qup-spi5-data-clk-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5485  				pins = "gpio20", "gpio21", "gpio22";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5486  				function = "qup05";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5487  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5488  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5489  			qup_spi5_cs: qup-spi5-cs-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5490  				pins = "gpio23";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5491  				function = "qup05";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5492  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5493  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5494  			qup_spi5_cs_gpio: qup-spi5-cs-gpio-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5495  				pins = "gpio23";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5496  				function = "gpio";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5497  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5498  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5499  			qup_spi6_data_clk: qup-spi6-data-clk-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5500  				pins = "gpio24", "gpio25", "gpio26";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5501  				function = "qup06";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5502  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5503  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5504  			qup_spi6_cs: qup-spi6-cs-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5505  				pins = "gpio27";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5506  				function = "qup06";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5507  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5508  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5509  			qup_spi6_cs_gpio: qup-spi6-cs-gpio-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5510  				pins = "gpio27";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5511  				function = "gpio";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5512  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5513  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5514  			qup_spi7_data_clk: qup-spi7-data-clk-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5515  				pins = "gpio28", "gpio29", "gpio30";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5516  				function = "qup07";
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5517  			};
544cebe1895638 Sai Prakash Ranjan               2021-03-16  5518  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5519  			qup_spi7_cs: qup-spi7-cs-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5520  				pins = "gpio31";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5521  				function = "qup07";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5522  			};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  5523  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5524  			qup_spi7_cs_gpio: qup-spi7-cs-gpio-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5525  				pins = "gpio31";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5526  				function = "gpio";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5527  			};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  5528  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5529  			qup_spi8_data_clk: qup-spi8-data-clk-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5530  				pins = "gpio32", "gpio33", "gpio34";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5531  				function = "qup10";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5532  			};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  5533  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5534  			qup_spi8_cs: qup-spi8-cs-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5535  				pins = "gpio35";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5536  				function = "qup10";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5537  			};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  5538  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5539  			qup_spi8_cs_gpio: qup-spi8-cs-gpio-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5540  				pins = "gpio35";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5541  				function = "gpio";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5542  			};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  5543  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5544  			qup_spi9_data_clk: qup-spi9-data-clk-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5545  				pins = "gpio36", "gpio37", "gpio38";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5546  				function = "qup11";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5547  			};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  5548  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5549  			qup_spi9_cs: qup-spi9-cs-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5550  				pins = "gpio39";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5551  				function = "qup11";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5552  			};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  5553  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5554  			qup_spi9_cs_gpio: qup-spi9-cs-gpio-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5555  				pins = "gpio39";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5556  				function = "gpio";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  5557  			};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  5558  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5559  			qup_spi10_data_clk: qup-spi10-data-clk-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5560  				pins = "gpio40", "gpio41", "gpio42";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5561  				function = "qup12";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  5562  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5563  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5564  			qup_spi10_cs: qup-spi10-cs-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5565  				pins = "gpio43";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5566  				function = "qup12";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  5567  			};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  5568  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5569  			qup_spi10_cs_gpio: qup-spi10-cs-gpio-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5570  				pins = "gpio43";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5571  				function = "gpio";
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  5572  			};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  5573  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5574  			qup_spi11_data_clk: qup-spi11-data-clk-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5575  				pins = "gpio44", "gpio45", "gpio46";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5576  				function = "qup13";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5577  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5578  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5579  			qup_spi11_cs: qup-spi11-cs-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5580  				pins = "gpio47";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5581  				function = "qup13";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5582  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5583  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5584  			qup_spi11_cs_gpio: qup-spi11-cs-gpio-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5585  				pins = "gpio47";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5586  				function = "gpio";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5587  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5588  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5589  			qup_spi12_data_clk: qup-spi12-data-clk-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5590  				pins = "gpio48", "gpio49", "gpio50";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5591  				function = "qup14";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5592  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5593  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5594  			qup_spi12_cs: qup-spi12-cs-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5595  				pins = "gpio51";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5596  				function = "qup14";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5597  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5598  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5599  			qup_spi12_cs_gpio: qup-spi12-cs-gpio-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5600  				pins = "gpio51";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5601  				function = "gpio";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5602  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5603  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5604  			qup_spi13_data_clk: qup-spi13-data-clk-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5605  				pins = "gpio52", "gpio53", "gpio54";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5606  				function = "qup15";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5607  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5608  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5609  			qup_spi13_cs: qup-spi13-cs-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5610  				pins = "gpio55";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5611  				function = "qup15";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5612  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5613  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5614  			qup_spi13_cs_gpio: qup-spi13-cs-gpio-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5615  				pins = "gpio55";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5616  				function = "gpio";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5617  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5618  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5619  			qup_spi14_data_clk: qup-spi14-data-clk-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5620  				pins = "gpio56", "gpio57", "gpio58";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5621  				function = "qup16";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5622  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5623  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5624  			qup_spi14_cs: qup-spi14-cs-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5625  				pins = "gpio59";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5626  				function = "qup16";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5627  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5628  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5629  			qup_spi14_cs_gpio: qup-spi14-cs-gpio-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5630  				pins = "gpio59";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5631  				function = "gpio";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5632  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5633  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5634  			qup_spi15_data_clk: qup-spi15-data-clk-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5635  				pins = "gpio60", "gpio61", "gpio62";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5636  				function = "qup17";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5637  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5638  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5639  			qup_spi15_cs: qup-spi15-cs-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5640  				pins = "gpio63";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5641  				function = "qup17";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5642  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5643  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5644  			qup_spi15_cs_gpio: qup-spi15-cs-gpio-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5645  				pins = "gpio63";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5646  				function = "gpio";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5647  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5648  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5649  			qup_uart0_cts: qup-uart0-cts-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5650  				pins = "gpio0";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5651  				function = "qup00";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5652  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5653  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5654  			qup_uart0_rts: qup-uart0-rts-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5655  				pins = "gpio1";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5656  				function = "qup00";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5657  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5658  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5659  			qup_uart0_tx: qup-uart0-tx-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5660  				pins = "gpio2";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5661  				function = "qup00";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5662  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5663  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5664  			qup_uart0_rx: qup-uart0-rx-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5665  				pins = "gpio3";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5666  				function = "qup00";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5667  			};
6493367f8031b1 Sandeep Maheswaram               2021-08-02  5668  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5669  			qup_uart1_cts: qup-uart1-cts-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5670  				pins = "gpio4";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5671  				function = "qup01";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5672  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5673  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5674  			qup_uart1_rts: qup-uart1-rts-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5675  				pins = "gpio5";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5676  				function = "qup01";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5677  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5678  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5679  			qup_uart1_tx: qup-uart1-tx-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5680  				pins = "gpio6";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5681  				function = "qup01";
297e6e38320f32 Odelu Kukatla                    2021-04-27  5682  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  5683  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5684  			qup_uart1_rx: qup-uart1-rx-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5685  				pins = "gpio7";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5686  				function = "qup01";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5687  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5688  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5689  			qup_uart2_cts: qup-uart2-cts-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5690  				pins = "gpio8";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5691  				function = "qup02";
297e6e38320f32 Odelu Kukatla                    2021-04-27  5692  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  5693  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5694  			qup_uart2_rts: qup-uart2-rts-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5695  				pins = "gpio9";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5696  				function = "qup02";
0392968dbe099d Sai Prakash Ranjan               2021-03-16  5697  			};
0392968dbe099d Sai Prakash Ranjan               2021-03-16  5698  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5699  			qup_uart2_tx: qup-uart2-tx-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5700  				pins = "gpio10";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5701  				function = "qup02";
297e6e38320f32 Odelu Kukatla                    2021-04-27  5702  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  5703  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5704  			qup_uart2_rx: qup-uart2-rx-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5705  				pins = "gpio11";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5706  				function = "qup02";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5707  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5708  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5709  			qup_uart3_cts: qup-uart3-cts-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5710  				pins = "gpio12";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5711  				function = "qup03";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5712  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5713  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5714  			qup_uart3_rts: qup-uart3-rts-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5715  				pins = "gpio13";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5716  				function = "qup03";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5717  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5718  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5719  			qup_uart3_tx: qup-uart3-tx-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5720  				pins = "gpio14";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5721  				function = "qup03";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5722  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5723  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5724  			qup_uart3_rx: qup-uart3-rx-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5725  				pins = "gpio15";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5726  				function = "qup03";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5727  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5728  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5729  			qup_uart4_cts: qup-uart4-cts-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5730  				pins = "gpio16";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5731  				function = "qup04";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5732  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5733  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5734  			qup_uart4_rts: qup-uart4-rts-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5735  				pins = "gpio17";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5736  				function = "qup04";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5737  			};
6493367f8031b1 Sandeep Maheswaram               2021-08-02  5738  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5739  			qup_uart4_tx: qup-uart4-tx-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5740  				pins = "gpio18";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5741  				function = "qup04";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5742  			};
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5743  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5744  			qup_uart4_rx: qup-uart4-rx-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5745  				pins = "gpio19";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5746  				function = "qup04";
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5747  			};
bb9efa59c6656f Sandeep Maheswaram               2021-07-06  5748  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5749  			qup_uart5_tx: qup-uart5-tx-state {
38cd93f413fd94 Roja Rani Yarubandi              2021-09-23  5750  				pins = "gpio22";
38cd93f413fd94 Roja Rani Yarubandi              2021-09-23  5751  				function = "qup05";
3450bb5b9570a2 Maulik Shah                      2021-03-11  5752  			};
3450bb5b9570a2 Maulik Shah                      2021-03-11  5753  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5754  			qup_uart5_rx: qup-uart5-rx-state {
38cd93f413fd94 Roja Rani Yarubandi              2021-09-23  5755  				pins = "gpio23";
38cd93f413fd94 Roja Rani Yarubandi              2021-09-23  5756  				function = "qup05";
c3bbe55c942d2a Sibi Sankar                      2021-04-27  5757  			};
c3bbe55c942d2a Sibi Sankar                      2021-04-27  5758  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5759  			qup_uart6_cts: qup-uart6-cts-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5760  				pins = "gpio24";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5761  				function = "qup06";
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5762  			};
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5763  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5764  			qup_uart6_rts: qup-uart6-rts-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5765  				pins = "gpio25";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5766  				function = "qup06";
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5767  			};
132f5a8df93430 Rajeshwari Ravindra Kamble       2021-05-07  5768  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5769  			qup_uart6_tx: qup-uart6-tx-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5770  				pins = "gpio26";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5771  				function = "qup06";
c3bbe55c942d2a Sibi Sankar                      2021-04-27  5772  			};
c3bbe55c942d2a Sibi Sankar                      2021-04-27  5773  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5774  			qup_uart6_rx: qup-uart6-rx-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5775  				pins = "gpio27";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5776  				function = "qup06";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5777  			};
208979a8f9cb8e Sai Prakash Ranjan               2021-03-16  5778  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5779  			qup_uart7_cts: qup-uart7-cts-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5780  				pins = "gpio28";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5781  				function = "qup07";
208979a8f9cb8e Sai Prakash Ranjan               2021-03-16  5782  			};
208979a8f9cb8e Sai Prakash Ranjan               2021-03-16  5783  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5784  			qup_uart7_rts: qup-uart7-rts-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5785  				pins = "gpio29";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5786  				function = "qup07";
14abf8dfe3643e satya priya                      2021-03-11  5787  			};
14abf8dfe3643e satya priya                      2021-03-11  5788  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5789  			qup_uart7_tx: qup-uart7-tx-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5790  				pins = "gpio30";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5791  				function = "qup07";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5792  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  5793  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5794  			qup_uart7_rx: qup-uart7-rx-state {
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5795  				pins = "gpio31";
bf6f37a3086bec Roja Rani Yarubandi              2021-09-23  5796  				function = "qup07";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  5797  			};
298c81a7d44fe0 Shaik Sajida Bhanu               2021-07-13  5798  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5799  			qup_uart8_cts: qup-uart8-cts-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5800  				pins = "gpio32";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5801  				function = "qup10";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5802  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5803  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5804  			qup_uart8_rts: qup-uart8-rts-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5805  				pins = "gpio33";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5806  				function = "qup10";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5807  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5808  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5809  			qup_uart8_tx: qup-uart8-tx-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5810  				pins = "gpio34";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5811  				function = "qup10";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5812  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5813  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5814  			qup_uart8_rx: qup-uart8-rx-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5815  				pins = "gpio35";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5816  				function = "qup10";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5817  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5818  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5819  			qup_uart9_cts: qup-uart9-cts-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5820  				pins = "gpio36";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5821  				function = "qup11";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5822  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5823  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5824  			qup_uart9_rts: qup-uart9-rts-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5825  				pins = "gpio37";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5826  				function = "qup11";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5827  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5828  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5829  			qup_uart9_tx: qup-uart9-tx-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5830  				pins = "gpio38";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5831  				function = "qup11";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5832  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5833  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5834  			qup_uart9_rx: qup-uart9-rx-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5835  				pins = "gpio39";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5836  				function = "qup11";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5837  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5838  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5839  			qup_uart10_cts: qup-uart10-cts-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5840  				pins = "gpio40";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5841  				function = "qup12";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5842  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5843  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5844  			qup_uart10_rts: qup-uart10-rts-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5845  				pins = "gpio41";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5846  				function = "qup12";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5847  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5848  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5849  			qup_uart10_tx: qup-uart10-tx-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5850  				pins = "gpio42";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5851  				function = "qup12";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5852  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5853  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5854  			qup_uart10_rx: qup-uart10-rx-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5855  				pins = "gpio43";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5856  				function = "qup12";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5857  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5858  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5859  			qup_uart11_cts: qup-uart11-cts-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5860  				pins = "gpio44";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5861  				function = "qup13";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5862  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5863  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5864  			qup_uart11_rts: qup-uart11-rts-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5865  				pins = "gpio45";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5866  				function = "qup13";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5867  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5868  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5869  			qup_uart11_tx: qup-uart11-tx-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5870  				pins = "gpio46";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5871  				function = "qup13";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5872  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5873  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5874  			qup_uart11_rx: qup-uart11-rx-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5875  				pins = "gpio47";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5876  				function = "qup13";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5877  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5878  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5879  			qup_uart12_cts: qup-uart12-cts-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5880  				pins = "gpio48";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5881  				function = "qup14";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5882  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5883  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5884  			qup_uart12_rts: qup-uart12-rts-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5885  				pins = "gpio49";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5886  				function = "qup14";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5887  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5888  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5889  			qup_uart12_tx: qup-uart12-tx-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5890  				pins = "gpio50";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5891  				function = "qup14";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5892  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5893  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5894  			qup_uart12_rx: qup-uart12-rx-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5895  				pins = "gpio51";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5896  				function = "qup14";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5897  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5898  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5899  			qup_uart13_cts: qup-uart13-cts-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5900  				pins = "gpio52";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5901  				function = "qup15";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5902  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5903  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5904  			qup_uart13_rts: qup-uart13-rts-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5905  				pins = "gpio53";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5906  				function = "qup15";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5907  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5908  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5909  			qup_uart13_tx: qup-uart13-tx-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5910  				pins = "gpio54";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5911  				function = "qup15";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5912  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5913  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5914  			qup_uart13_rx: qup-uart13-rx-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5915  				pins = "gpio55";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5916  				function = "qup15";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5917  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5918  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5919  			qup_uart14_cts: qup-uart14-cts-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5920  				pins = "gpio56";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5921  				function = "qup16";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5922  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5923  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5924  			qup_uart14_rts: qup-uart14-rts-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5925  				pins = "gpio57";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5926  				function = "qup16";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5927  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5928  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5929  			qup_uart14_tx: qup-uart14-tx-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5930  				pins = "gpio58";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5931  				function = "qup16";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5932  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5933  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5934  			qup_uart14_rx: qup-uart14-rx-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5935  				pins = "gpio59";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5936  				function = "qup16";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5937  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5938  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5939  			qup_uart15_cts: qup-uart15-cts-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5940  				pins = "gpio60";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5941  				function = "qup17";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5942  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5943  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5944  			qup_uart15_rts: qup-uart15-rts-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5945  				pins = "gpio61";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5946  				function = "qup17";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5947  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5948  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5949  			qup_uart15_tx: qup-uart15-tx-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5950  				pins = "gpio62";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5951  				function = "qup17";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5952  			};
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5953  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5954  			qup_uart15_rx: qup-uart15-rx-state {
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5955  				pins = "gpio63";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5956  				function = "qup17";
4e8e7648ae645d Roja Rani Yarubandi              2021-09-23  5957  			};
b1969bc522187d Douglas Anderson                 2022-02-02  5958  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5959  			sdc1_clk: sdc1-clk-state {
b1969bc522187d Douglas Anderson                 2022-02-02  5960  				pins = "sdc1_clk";
b1969bc522187d Douglas Anderson                 2022-02-02  5961  			};
b1969bc522187d Douglas Anderson                 2022-02-02  5962  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5963  			sdc1_cmd: sdc1-cmd-state {
b1969bc522187d Douglas Anderson                 2022-02-02  5964  				pins = "sdc1_cmd";
b1969bc522187d Douglas Anderson                 2022-02-02  5965  			};
b1969bc522187d Douglas Anderson                 2022-02-02  5966  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5967  			sdc1_data: sdc1-data-state {
b1969bc522187d Douglas Anderson                 2022-02-02  5968  				pins = "sdc1_data";
b1969bc522187d Douglas Anderson                 2022-02-02  5969  			};
b1969bc522187d Douglas Anderson                 2022-02-02  5970  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5971  			sdc1_rclk: sdc1-rclk-state {
b1969bc522187d Douglas Anderson                 2022-02-02  5972  				pins = "sdc1_rclk";
b1969bc522187d Douglas Anderson                 2022-02-02  5973  			};
b1969bc522187d Douglas Anderson                 2022-02-02  5974  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5975  			sdc1_clk_sleep: sdc1-clk-sleep-state {
b1969bc522187d Douglas Anderson                 2022-02-02  5976  				pins = "sdc1_clk";
b1969bc522187d Douglas Anderson                 2022-02-02  5977  				drive-strength = <2>;
b1969bc522187d Douglas Anderson                 2022-02-02  5978  				bias-bus-hold;
b1969bc522187d Douglas Anderson                 2022-02-02  5979  			};
b1969bc522187d Douglas Anderson                 2022-02-02  5980  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5981  			sdc1_cmd_sleep: sdc1-cmd-sleep-state {
b1969bc522187d Douglas Anderson                 2022-02-02  5982  				pins = "sdc1_cmd";
b1969bc522187d Douglas Anderson                 2022-02-02  5983  				drive-strength = <2>;
b1969bc522187d Douglas Anderson                 2022-02-02  5984  				bias-bus-hold;
b1969bc522187d Douglas Anderson                 2022-02-02  5985  			};
b1969bc522187d Douglas Anderson                 2022-02-02  5986  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5987  			sdc1_data_sleep: sdc1-data-sleep-state {
b1969bc522187d Douglas Anderson                 2022-02-02  5988  				pins = "sdc1_data";
b1969bc522187d Douglas Anderson                 2022-02-02  5989  				drive-strength = <2>;
b1969bc522187d Douglas Anderson                 2022-02-02  5990  				bias-bus-hold;
b1969bc522187d Douglas Anderson                 2022-02-02  5991  			};
b1969bc522187d Douglas Anderson                 2022-02-02  5992  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5993  			sdc1_rclk_sleep: sdc1-rclk-sleep-state {
b1969bc522187d Douglas Anderson                 2022-02-02  5994  				pins = "sdc1_rclk";
f9800dde34e678 Douglas Anderson                 2022-02-02  5995  				drive-strength = <2>;
b1969bc522187d Douglas Anderson                 2022-02-02  5996  				bias-bus-hold;
b1969bc522187d Douglas Anderson                 2022-02-02  5997  			};
b1969bc522187d Douglas Anderson                 2022-02-02  5998  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  5999  			sdc2_clk: sdc2-clk-state {
b1969bc522187d Douglas Anderson                 2022-02-02  6000  				pins = "sdc2_clk";
b1969bc522187d Douglas Anderson                 2022-02-02  6001  			};
b1969bc522187d Douglas Anderson                 2022-02-02  6002  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  6003  			sdc2_cmd: sdc2-cmd-state {
b1969bc522187d Douglas Anderson                 2022-02-02  6004  				pins = "sdc2_cmd";
b1969bc522187d Douglas Anderson                 2022-02-02  6005  			};
b1969bc522187d Douglas Anderson                 2022-02-02  6006  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  6007  			sdc2_data: sdc2-data-state {
b1969bc522187d Douglas Anderson                 2022-02-02  6008  				pins = "sdc2_data";
b1969bc522187d Douglas Anderson                 2022-02-02  6009  			};
b1969bc522187d Douglas Anderson                 2022-02-02  6010  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  6011  			sdc2_clk_sleep: sdc2-clk-sleep-state {
b1969bc522187d Douglas Anderson                 2022-02-02  6012  				pins = "sdc2_clk";
b1969bc522187d Douglas Anderson                 2022-02-02  6013  				drive-strength = <2>;
b1969bc522187d Douglas Anderson                 2022-02-02  6014  				bias-bus-hold;
b1969bc522187d Douglas Anderson                 2022-02-02  6015  			};
b1969bc522187d Douglas Anderson                 2022-02-02  6016  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  6017  			sdc2_cmd_sleep: sdc2-cmd-sleep-state {
b1969bc522187d Douglas Anderson                 2022-02-02  6018  				pins = "sdc2_cmd";
b1969bc522187d Douglas Anderson                 2022-02-02  6019  				drive-strength = <2>;
b1969bc522187d Douglas Anderson                 2022-02-02  6020  				bias-bus-hold;
b1969bc522187d Douglas Anderson                 2022-02-02  6021  			};
b1969bc522187d Douglas Anderson                 2022-02-02  6022  
ec0872a68dcf9f Krzysztof Kozlowski              2022-09-30  6023  			sdc2_data_sleep: sdc2-data-sleep-state {
b1969bc522187d Douglas Anderson                 2022-02-02  6024  				pins = "sdc2_data";
b1969bc522187d Douglas Anderson                 2022-02-02  6025  				drive-strength = <2>;
b1969bc522187d Douglas Anderson                 2022-02-02  6026  				bias-bus-hold;
b1969bc522187d Douglas Anderson                 2022-02-02  6027  			};
b1969bc522187d Douglas Anderson                 2022-02-02  6028  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6029  
bed0855657afeb Krzysztof Kozlowski              2022-06-07  6030  		sram@146a5000 {
2ffe4f99cbdd06 Krzysztof Kozlowski              2022-06-07  6031  			compatible = "qcom,sc7280-imem", "syscon", "simple-mfd";
dddf4b0621d61b Sibi Sankar                      2021-09-17  6032  			reg = <0 0x146a5000 0 0x6000>;
dddf4b0621d61b Sibi Sankar                      2021-09-17  6033  
dddf4b0621d61b Sibi Sankar                      2021-09-17  6034  			#address-cells = <1>;
dddf4b0621d61b Sibi Sankar                      2021-09-17  6035  			#size-cells = <1>;
dddf4b0621d61b Sibi Sankar                      2021-09-17  6036  
dddf4b0621d61b Sibi Sankar                      2021-09-17  6037  			ranges = <0 0 0x146a5000 0x6000>;
dddf4b0621d61b Sibi Sankar                      2021-09-17  6038  
dddf4b0621d61b Sibi Sankar                      2021-09-17  6039  			pil-reloc@594c {
dddf4b0621d61b Sibi Sankar                      2021-09-17  6040  				compatible = "qcom,pil-reloc-info";
dddf4b0621d61b Sibi Sankar                      2021-09-17  6041  				reg = <0x594c 0xc8>;
dddf4b0621d61b Sibi Sankar                      2021-09-17  6042  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6043  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6044  
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6045  		apps_smmu: iommu@15000000 {
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6046  			compatible = "qcom,sc7280-smmu-500", "arm,mmu-500";
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6047  			reg = <0 0x15000000 0 0x100000>;
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6048  			#iommu-cells = <2>;
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6049  			#global-interrupts = <1>;
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6050  			dma-coherent;
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6051  			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6052  				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6053  				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6054  				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6055  				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6056  				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6057  				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6058  				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6059  				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6060  				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6061  				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6062  				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6063  				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6064  				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6065  				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6066  				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6067  				     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6068  				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6069  				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6070  				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6071  				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6072  				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6073  				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6074  				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6075  				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6076  				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6077  				     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6078  				     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6079  				     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6080  				     <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6081  				     <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6082  				     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6083  				     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6084  				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6085  				     <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6086  				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6087  				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6088  				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6089  				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6090  				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6091  				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6092  				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6093  				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6094  				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6095  				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6096  				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6097  				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6098  				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6099  				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6100  				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6101  				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6102  				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6103  				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6104  				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6105  				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6106  				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6107  				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6108  				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6109  				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6110  				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6111  				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6112  				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6113  				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6114  				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6115  				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6116  				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6117  				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6118  				     <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6119  				     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6120  				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6121  				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6122  				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6123  				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6124  				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6125  				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6126  				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6127  				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6128  				     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6129  				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6130  				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6131  				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6132  		};
c73ed10440082e Sai Prakash Ranjan               2021-03-11  6133  
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6134  		anoc_1_tbu: tbu@151dd000 {
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6135  			compatible = "qcom,sc7280-tbu";
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6136  			reg = <0x0 0x151dd000 0x0 0x1000>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6137  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6138  					 &cnoc3 SLAVE_TCU QCOM_ICC_TAG_ACTIVE_ONLY>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6139  			qcom,stream-id-range = <&apps_smmu 0x0 0x400>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6140  		};
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6141  
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6142  		anoc_2_tbu: tbu@151e1000 {
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6143  			compatible = "qcom,sc7280-tbu";
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6144  			reg = <0x0 0x151e1000 0x0 0x1000>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6145  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6146  					 &cnoc3 SLAVE_TCU QCOM_ICC_TAG_ACTIVE_ONLY>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6147  			qcom,stream-id-range = <&apps_smmu 0x400 0x400>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6148  		};
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6149  
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6150  		mnoc_hf_0_tbu: tbu@151e5000 {
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6151  			compatible = "qcom,sc7280-tbu";
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6152  			reg = <0x0 0x151e5000 0x0 0x1000>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6153  			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ACTIVE_ONLY
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6154  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6155  			power-domains = <&gcc HLOS1_VOTE_MMNOC_MMU_TBU_HF0_GDSC>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6156  			qcom,stream-id-range = <&apps_smmu 0x800 0x400>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6157  		};
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6158  
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6159  		mnoc_hf_1_tbu: tbu@151e9000 {
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6160  			compatible = "qcom,sc7280-tbu";
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6161  			reg = <0x0 0x151e9000 0x0 0x1000>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6162  			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ACTIVE_ONLY
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6163  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6164  			power-domains = <&gcc HLOS1_VOTE_MMNOC_MMU_TBU_HF1_GDSC>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6165  			qcom,stream-id-range = <&apps_smmu 0xc00 0x400>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6166  		};
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6167  
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6168  		compute_dsp_1_tbu: tbu@151ed000 {
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6169  			compatible = "qcom,sc7280-tbu";
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6170  			reg = <0x0 0x151ed000 0x0 0x1000>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6171  			interconnects = <&nsp_noc MASTER_CDSP_PROC QCOM_ICC_TAG_ACTIVE_ONLY
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6172  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6173  			power-domains = <&gcc HLOS1_VOTE_TURING_MMU_TBU1_GDSC>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6174  			qcom,stream-id-range = <&apps_smmu 0x1000 0x400>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6175  		};
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6176  
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6177  		compute_dsp_0_tbu: tbu@151f1000 {
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6178  			compatible = "qcom,sc7280-tbu";
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6179  			reg = <0x0 0x151f1000 0x0 0x1000>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6180  			interconnects = <&nsp_noc MASTER_CDSP_PROC QCOM_ICC_TAG_ACTIVE_ONLY
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6181  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6182  			power-domains = <&gcc HLOS1_VOTE_TURING_MMU_TBU0_GDSC>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6183  			qcom,stream-id-range = <&apps_smmu 0x1400 0x400>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6184  		};
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6185  
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6186  		adsp_tbu: tbu@151f5000 {
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6187  			compatible = "qcom,sc7280-tbu";
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6188  			reg = <0x0 0x151f5000 0x0 0x1000>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6189  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6190  					 &lpass_ag_noc SLAVE_LPASS_CORE_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6191  			qcom,stream-id-range = <&apps_smmu 0x1800 0x400>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6192  		};
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6193  
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6194  		anoc_1_pcie_tbu: tbu@151f9000 {
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6195  			compatible = "qcom,sc7280-tbu";
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6196  			reg = <0x0 0x151f9000 0x0 0x1000>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6197  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6198  					 &cnoc3 SLAVE_TCU QCOM_ICC_TAG_ACTIVE_ONLY>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6199  			qcom,stream-id-range = <&apps_smmu 0x1c00 0x400>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6200  		};
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6201  
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6202  		mnoc_sf_0_tbu: tbu@151fd000 {
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6203  			compatible = "qcom,sc7280-tbu";
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6204  			reg = <0x0 0x151fd000 0x0 0x1000>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6205  			interconnects = <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ACTIVE_ONLY
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6206  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6207  			power-domains = <&gcc HLOS1_VOTE_MMNOC_MMU_TBU_SF0_GDSC>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6208  			qcom,stream-id-range = <&apps_smmu 0x2000 0x400>;
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6209  		};
d1f2b41e96f5d1 Georgi Djakov                    2024-04-17  6210  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6211  		intc: interrupt-controller@17a00000 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6212  			compatible = "arm,gic-v3";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6213  			reg = <0 0x17a00000 0 0x10000>,     /* GICD */
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6214  			      <0 0x17a60000 0 0x100000>;    /* GICR * 8 */
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6215  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
04b5840664822c Konrad Dybcio                    2023-04-07  6216  			#interrupt-cells = <3>;
04b5840664822c Konrad Dybcio                    2023-04-07  6217  			interrupt-controller;
04b5840664822c Konrad Dybcio                    2023-04-07  6218  			#address-cells = <2>;
04b5840664822c Konrad Dybcio                    2023-04-07  6219  			#size-cells = <2>;
04b5840664822c Konrad Dybcio                    2023-04-07  6220  			ranges;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6221  
04b5840664822c Konrad Dybcio                    2023-04-07  6222  			msi-controller@17a40000 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6223  				compatible = "arm,gic-v3-its";
04b5840664822c Konrad Dybcio                    2023-04-07  6224  				reg = <0 0x17a40000 0 0x20000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6225  				msi-controller;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6226  				#msi-cells = <1>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6227  				status = "disabled";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6228  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6229  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6230  
6da24ba932082b Luca Weiss                       2023-09-19  6231  		watchdog: watchdog@17c10000 {
0e51f883daa913 Sai Prakash Ranjan               2021-03-11  6232  			compatible = "qcom,apss-wdt-sc7280", "qcom,kpss-wdt";
0e51f883daa913 Sai Prakash Ranjan               2021-03-11  6233  			reg = <0 0x17c10000 0 0x1000>;
0e51f883daa913 Sai Prakash Ranjan               2021-03-11  6234  			clocks = <&sleep_clk>;
6897fac411db7b Douglas Anderson                 2023-11-06  6235  			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
6da24ba932082b Luca Weiss                       2023-09-19  6236  			status = "reserved"; /* Owned by Gunyah hyp */
0e51f883daa913 Sai Prakash Ranjan               2021-03-11  6237  		};
0e51f883daa913 Sai Prakash Ranjan               2021-03-11  6238  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6239  		timer@17c20000 {
458ebdbb8e5d59 David Heidelberg                 2022-06-26  6240  			#address-cells = <1>;
458ebdbb8e5d59 David Heidelberg                 2022-06-26  6241  			#size-cells = <1>;
458ebdbb8e5d59 David Heidelberg                 2022-06-26  6242  			ranges = <0 0 0 0x20000000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6243  			compatible = "arm,armv7-timer-mem";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6244  			reg = <0 0x17c20000 0 0x1000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6245  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6246  			frame@17c21000 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6247  				frame-number = <0>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6248  				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6249  					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
458ebdbb8e5d59 David Heidelberg                 2022-06-26  6250  				reg = <0x17c21000 0x1000>,
458ebdbb8e5d59 David Heidelberg                 2022-06-26  6251  				      <0x17c22000 0x1000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6252  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6253  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6254  			frame@17c23000 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6255  				frame-number = <1>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6256  				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
458ebdbb8e5d59 David Heidelberg                 2022-06-26  6257  				reg = <0x17c23000 0x1000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6258  				status = "disabled";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6259  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6260  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6261  			frame@17c25000 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6262  				frame-number = <2>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6263  				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
458ebdbb8e5d59 David Heidelberg                 2022-06-26  6264  				reg = <0x17c25000 0x1000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6265  				status = "disabled";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6266  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6267  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6268  			frame@17c27000 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6269  				frame-number = <3>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6270  				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
458ebdbb8e5d59 David Heidelberg                 2022-06-26  6271  				reg = <0x17c27000 0x1000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6272  				status = "disabled";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6273  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6274  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6275  			frame@17c29000 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6276  				frame-number = <4>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6277  				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
458ebdbb8e5d59 David Heidelberg                 2022-06-26  6278  				reg = <0x17c29000 0x1000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6279  				status = "disabled";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6280  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6281  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6282  			frame@17c2b000 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6283  				frame-number = <5>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6284  				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
458ebdbb8e5d59 David Heidelberg                 2022-06-26  6285  				reg = <0x17c2b000 0x1000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6286  				status = "disabled";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6287  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6288  
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6289  			frame@17c2d000 {
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6290  				frame-number = <6>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6291  				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
458ebdbb8e5d59 David Heidelberg                 2022-06-26  6292  				reg = <0x17c2d000 0x1000>;
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6293  				status = "disabled";
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6294  			};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6295  		};
3450bb5b9570a2 Maulik Shah                      2021-03-11  6296  
3450bb5b9570a2 Maulik Shah                      2021-03-11  6297  		apps_rsc: rsc@18200000 {
3450bb5b9570a2 Maulik Shah                      2021-03-11  6298  			compatible = "qcom,rpmh-rsc";
3450bb5b9570a2 Maulik Shah                      2021-03-11  6299  			reg = <0 0x18200000 0 0x10000>,
3450bb5b9570a2 Maulik Shah                      2021-03-11  6300  			      <0 0x18210000 0 0x10000>,
3450bb5b9570a2 Maulik Shah                      2021-03-11  6301  			      <0 0x18220000 0 0x10000>;
3450bb5b9570a2 Maulik Shah                      2021-03-11  6302  			reg-names = "drv-0", "drv-1", "drv-2";
3450bb5b9570a2 Maulik Shah                      2021-03-11  6303  			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
3450bb5b9570a2 Maulik Shah                      2021-03-11  6304  				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
3450bb5b9570a2 Maulik Shah                      2021-03-11  6305  				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
3450bb5b9570a2 Maulik Shah                      2021-03-11  6306  			qcom,tcs-offset = <0xd00>;
3450bb5b9570a2 Maulik Shah                      2021-03-11  6307  			qcom,drv-id = <2>;
3450bb5b9570a2 Maulik Shah                      2021-03-11  6308  			qcom,tcs-config = <ACTIVE_TCS  2>,
3450bb5b9570a2 Maulik Shah                      2021-03-11  6309  					  <SLEEP_TCS   3>,
3450bb5b9570a2 Maulik Shah                      2021-03-11  6310  					  <WAKE_TCS    3>,
3450bb5b9570a2 Maulik Shah                      2021-03-11  6311  					  <CONTROL_TCS 1>;
1683a3c76081ba Krzysztof Kozlowski              2024-10-22  6312  			power-domains = <&cluster_pd>;
ab7772de861200 Rajendra Nayak                   2021-03-11  6313  
297e6e38320f32 Odelu Kukatla                    2021-04-27  6314  			apps_bcm_voter: bcm-voter {
297e6e38320f32 Odelu Kukatla                    2021-04-27  6315  				compatible = "qcom,bcm-voter";
297e6e38320f32 Odelu Kukatla                    2021-04-27  6316  			};
297e6e38320f32 Odelu Kukatla                    2021-04-27  6317  
1608784b6129c8 Rajendra Nayak                   2021-03-11  6318  			rpmhpd: power-controller {
1608784b6129c8 Rajendra Nayak                   2021-03-11  6319  				compatible = "qcom,sc7280-rpmhpd";
1608784b6129c8 Rajendra Nayak                   2021-03-11  6320  				#power-domain-cells = <1>;
1608784b6129c8 Rajendra Nayak                   2021-03-11  6321  				operating-points-v2 = <&rpmhpd_opp_table>;
1608784b6129c8 Rajendra Nayak                   2021-03-11  6322  
1608784b6129c8 Rajendra Nayak                   2021-03-11  6323  				rpmhpd_opp_table: opp-table {
1608784b6129c8 Rajendra Nayak                   2021-03-11  6324  					compatible = "operating-points-v2";
1608784b6129c8 Rajendra Nayak                   2021-03-11  6325  
1608784b6129c8 Rajendra Nayak                   2021-03-11  6326  					rpmhpd_opp_ret: opp1 {
1608784b6129c8 Rajendra Nayak                   2021-03-11  6327  						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
1608784b6129c8 Rajendra Nayak                   2021-03-11  6328  					};
1608784b6129c8 Rajendra Nayak                   2021-03-11  6329  
1608784b6129c8 Rajendra Nayak                   2021-03-11  6330  					rpmhpd_opp_low_svs: opp2 {
1608784b6129c8 Rajendra Nayak                   2021-03-11  6331  						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
1608784b6129c8 Rajendra Nayak                   2021-03-11  6332  					};
1608784b6129c8 Rajendra Nayak                   2021-03-11  6333  
1608784b6129c8 Rajendra Nayak                   2021-03-11  6334  					rpmhpd_opp_svs: opp3 {
1608784b6129c8 Rajendra Nayak                   2021-03-11  6335  						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
1608784b6129c8 Rajendra Nayak                   2021-03-11  6336  					};
1608784b6129c8 Rajendra Nayak                   2021-03-11  6337  
1608784b6129c8 Rajendra Nayak                   2021-03-11  6338  					rpmhpd_opp_svs_l1: opp4 {
1608784b6129c8 Rajendra Nayak                   2021-03-11  6339  						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
1608784b6129c8 Rajendra Nayak                   2021-03-11  6340  					};
1608784b6129c8 Rajendra Nayak                   2021-03-11  6341  
1608784b6129c8 Rajendra Nayak                   2021-03-11  6342  					rpmhpd_opp_svs_l2: opp5 {
1608784b6129c8 Rajendra Nayak                   2021-03-11  6343  						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
1608784b6129c8 Rajendra Nayak                   2021-03-11  6344  					};
1608784b6129c8 Rajendra Nayak                   2021-03-11  6345  
1608784b6129c8 Rajendra Nayak                   2021-03-11  6346  					rpmhpd_opp_nom: opp6 {
1608784b6129c8 Rajendra Nayak                   2021-03-11  6347  						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
1608784b6129c8 Rajendra Nayak                   2021-03-11  6348  					};
1608784b6129c8 Rajendra Nayak                   2021-03-11  6349  
1608784b6129c8 Rajendra Nayak                   2021-03-11  6350  					rpmhpd_opp_nom_l1: opp7 {
1608784b6129c8 Rajendra Nayak                   2021-03-11  6351  						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
1608784b6129c8 Rajendra Nayak                   2021-03-11  6352  					};
1608784b6129c8 Rajendra Nayak                   2021-03-11  6353  
1608784b6129c8 Rajendra Nayak                   2021-03-11  6354  					rpmhpd_opp_turbo: opp8 {
1608784b6129c8 Rajendra Nayak                   2021-03-11  6355  						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
1608784b6129c8 Rajendra Nayak                   2021-03-11  6356  					};
1608784b6129c8 Rajendra Nayak                   2021-03-11  6357  
1608784b6129c8 Rajendra Nayak                   2021-03-11  6358  					rpmhpd_opp_turbo_l1: opp9 {
1608784b6129c8 Rajendra Nayak                   2021-03-11  6359  						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
1608784b6129c8 Rajendra Nayak                   2021-03-11  6360  					};
1608784b6129c8 Rajendra Nayak                   2021-03-11  6361  				};
1608784b6129c8 Rajendra Nayak                   2021-03-11  6362  			};
1608784b6129c8 Rajendra Nayak                   2021-03-11  6363  
ab7772de861200 Rajendra Nayak                   2021-03-11  6364  			rpmhcc: clock-controller {
ab7772de861200 Rajendra Nayak                   2021-03-11  6365  				compatible = "qcom,sc7280-rpmh-clk";
ab7772de861200 Rajendra Nayak                   2021-03-11  6366  				clocks = <&xo_board>;
ab7772de861200 Rajendra Nayak                   2021-03-11  6367  				clock-names = "xo";
ab7772de861200 Rajendra Nayak                   2021-03-11  6368  				#clock-cells = <1>;
ab7772de861200 Rajendra Nayak                   2021-03-11  6369  			};
3450bb5b9570a2 Maulik Shah                      2021-03-11  6370  		};
7dbd121a2c587c Taniya Das                       2021-04-10  6371  
8b93fbd95ed46b Odelu Kukatla                    2021-10-21  6372  		epss_l3: interconnect@18590000 {
a0289a1040a557 Bjorn Andersson                  2022-11-10  6373  			compatible = "qcom,sc7280-epss-l3", "qcom,epss-l3";
8b93fbd95ed46b Odelu Kukatla                    2021-10-21  6374  			reg = <0 0x18590000 0 0x1000>;
8b93fbd95ed46b Odelu Kukatla                    2021-10-21  6375  			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
8b93fbd95ed46b Odelu Kukatla                    2021-10-21  6376  			clock-names = "xo", "alternate";
8b93fbd95ed46b Odelu Kukatla                    2021-10-21  6377  			#interconnect-cells = <1>;
8b93fbd95ed46b Odelu Kukatla                    2021-10-21  6378  		};
8b93fbd95ed46b Odelu Kukatla                    2021-10-21  6379  
7dbd121a2c587c Taniya Das                       2021-04-10  6380  		cpufreq_hw: cpufreq@18591000 {
0cde1210f7b9f6 Luca Weiss                       2022-10-16  6381  			compatible = "qcom,sc7280-cpufreq-epss", "qcom,cpufreq-epss";
a48c730a4e0bf4 Douglas Anderson                 2021-09-07  6382  			reg = <0 0x18591000 0 0x1000>,
a48c730a4e0bf4 Douglas Anderson                 2021-09-07  6383  			      <0 0x18592000 0 0x1000>,
a48c730a4e0bf4 Douglas Anderson                 2021-09-07  6384  			      <0 0x18593000 0 0x1000>;
3f93d119c9d6e1 Konrad Dybcio                    2023-08-11  6385  
3f93d119c9d6e1 Konrad Dybcio                    2023-08-11  6386  			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
3f93d119c9d6e1 Konrad Dybcio                    2023-08-11  6387  				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
3f93d119c9d6e1 Konrad Dybcio                    2023-08-11  6388  				     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
3f93d119c9d6e1 Konrad Dybcio                    2023-08-11  6389  			interrupt-names = "dcvsh-irq-0",
3f93d119c9d6e1 Konrad Dybcio                    2023-08-11  6390  					  "dcvsh-irq-1",
3f93d119c9d6e1 Konrad Dybcio                    2023-08-11  6391  					  "dcvsh-irq-2";
3f93d119c9d6e1 Konrad Dybcio                    2023-08-11  6392  
7dbd121a2c587c Taniya Das                       2021-04-10  6393  			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
7dbd121a2c587c Taniya Das                       2021-04-10  6394  			clock-names = "xo", "alternate";
7dbd121a2c587c Taniya Das                       2021-04-10  6395  			#freq-domain-cells = <1>;
667d8a2039608c Manivannan Sadhasivam            2023-02-15  6396  			#clock-cells = <1>;
7dbd121a2c587c Taniya Das                       2021-04-10  6397  		};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6398  	};
7a1f4e7f740de9 Rajendra Nayak                   2021-03-11  6399  
f44da5d8722de3 Luca Weiss                       2024-05-10 @6400  	sound: sound {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
