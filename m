Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8966F2E62DA
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Apr 2025 21:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743717014; cv=none; b=Mu9KI08xADPcQ3AEdOabTnaubyPpvZxLZp7Ke36lNFQHnwLa5Bo0HqPDhu4F1jeYgZMw5sdplxlyuMTRMtYvMXFtAMcw64869E1xtAPH2Q+O8YkydxobxHjtM2CMTHKhtMlmWJFh1qE3tmpCL2+dDMK3mXn65U6Y82m5ZhqFxKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743717014; c=relaxed/simple;
	bh=LpCIWwjYOKUXjTnT+vMHibbcmHsfl1QWUFOxtiV6e9w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Px+rLgveWX04fIpjWmAosPHzy3k9aaAEMhxzIDrs/5yMZSjjoqHVFTGn1wKVTd1yqhxbcrVDFT4bxJhY9XY8xr1YjugHv0/4NX1tVKTAfD0MziOEMo+IEu1WjlibyLKCFhpQ9UuYOY2/79t03c7n+7WeoeNXn7YCJLwje2Bq9uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qbxwj50l; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qbxwj50l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743717007; x=1775253007;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LpCIWwjYOKUXjTnT+vMHibbcmHsfl1QWUFOxtiV6e9w=;
  b=Qbxwj50luzGKpc7Kriv4Fv1b7nuHPPfnm5G99hHCAxj3ZLIr+mfjDBZk
   ftj1HuzWFTUoK0TTJt0LXPhJFRteoWTmeDdkyUbUeFygBZ1fTh06y4/GK
   Mhuzc7XVqgQUoT4DSSk3WAoYF/CludOJjJt6zy8VxniT085Rbt8WG05tL
   CTa1yUiEOiNbN38k/8gx3rl8JXbZj5hCnnWhzxZi6k4qk7qmy/DwxpmuZ
   rP0Q/u+P74VxXExS2eLQHlVypNgG97mfa+6h1ows1l3/eRFoS8weWnTq2
   W6HJ+fft8VFTxglpSIEHFwW1RHxU3z2pgJwLAGCkQJdAs/a3YHILb7lXr
   g==;
X-CSE-ConnectionGUID: nKQp7bnSSPaAbMH7egfuxg==
X-CSE-MsgGUID: Il3gyhVnQXKIrY4plhm+Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55345050"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; 
   d="scan'208";a="55345050"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 14:50:05 -0700
X-CSE-ConnectionGUID: Ye/nI1BPSViHpmp65+XFuQ==
X-CSE-MsgGUID: FDGrsiupTjy99uiy/JPACA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; 
   d="scan'208";a="127989366"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Apr 2025 14:50:04 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0SRl-0000pv-2q;
	Thu, 03 Apr 2025 21:50:01 +0000
Date: Fri, 4 Apr 2025 05:49:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 2/4] arm64: dts: mt8188: add aie node
Message-ID: <202504040549.xyLJWREO-lkp@intel.com>
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
In-Reply-To: <20250403074005.21472-3-bo.kong@mediatek.com>
References: <20250403074005.21472-3-bo.kong@mediatek.com>
TO: "bo.kong" <bo.kong@mediatek.com>
TO: Rob Herring <robh@kernel.org>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: mtk29348 <Bo.Kong@mediatek.com>
TO: linux-kernel@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-mediatek@lists.infradead.org
CC: zhaoyuan.chen@mediatek.com
CC: Teddy.Chen@mediatek.com
CC: Project_Global_Chrome_Upstream_Group@mediatek.com

Hi bo.kong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.14 next-20250403]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/bo-kong/media-dt-bindings-add-MT8188-AIE/20250403-154205
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250403074005.21472-3-bo.kong%40mediatek.com
patch subject: [PATCH v5 2/4] arm64: dts: mt8188: add aie node
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arm64-randconfig-002-20250404 (https://download.01.org/0day-ci/archive/20250404/202504040549.xyLJWREO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250404/202504040549.xyLJWREO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504040549.xyLJWREO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2306.25-2317.5: ERROR (phandle_references): /soc/larb@15340000: Reference to non-existent node or label "smi_img1"

vim +/smi_img1 +2306 arch/arm64/boot/dts/mediatek/mt8188.dtsi

9461e0caac9e4c jason-ch chen              2023-10-23    19  
9461e0caac9e4c jason-ch chen              2023-10-23    20  / {
9461e0caac9e4c jason-ch chen              2023-10-23    21  	compatible = "mediatek,mt8188";
9461e0caac9e4c jason-ch chen              2023-10-23    22  	interrupt-parent = <&gic>;
9461e0caac9e4c jason-ch chen              2023-10-23    23  	#address-cells = <2>;
9461e0caac9e4c jason-ch chen              2023-10-23    24  	#size-cells = <2>;
9461e0caac9e4c jason-ch chen              2023-10-23    25  
761b93e62a2775 Fei Shao                   2024-10-14    26  	aliases {
26132136eb27c6 Fei Shao                   2024-10-14    27  		dp-intf0 = &dp_intf0;
26132136eb27c6 Fei Shao                   2024-10-14    28  		dp-intf1 = &dp_intf1;
1e86f80e33c1bf Fei Shao                   2024-10-14    29  		ethdr0 = &ethdr0;
761b93e62a2775 Fei Shao                   2024-10-14    30  		gce0 = &gce0;
761b93e62a2775 Fei Shao                   2024-10-14    31  		gce1 = &gce1;
1e86f80e33c1bf Fei Shao                   2024-10-14    32  		merge1 = &merge1;
1e86f80e33c1bf Fei Shao                   2024-10-14    33  		merge2 = &merge2;
1e86f80e33c1bf Fei Shao                   2024-10-14    34  		merge3 = &merge3;
1e86f80e33c1bf Fei Shao                   2024-10-14    35  		merge4 = &merge4;
1e86f80e33c1bf Fei Shao                   2024-10-14    36  		merge5 = &merge5;
7075b21d1a8e55 Fei Shao                   2024-10-14    37  		mutex0 = &mutex0;
1e86f80e33c1bf Fei Shao                   2024-10-14    38  		mutex1 = &mutex1;
1e86f80e33c1bf Fei Shao                   2024-10-14    39  		padding0 = &padding0;
1e86f80e33c1bf Fei Shao                   2024-10-14    40  		padding1 = &padding1;
1e86f80e33c1bf Fei Shao                   2024-10-14    41  		padding2 = &padding2;
1e86f80e33c1bf Fei Shao                   2024-10-14    42  		padding3 = &padding3;
1e86f80e33c1bf Fei Shao                   2024-10-14    43  		padding4 = &padding4;
1e86f80e33c1bf Fei Shao                   2024-10-14    44  		padding5 = &padding5;
1e86f80e33c1bf Fei Shao                   2024-10-14    45  		padding6 = &padding6;
1e86f80e33c1bf Fei Shao                   2024-10-14    46  		padding7 = &padding7;
1e86f80e33c1bf Fei Shao                   2024-10-14    47  		vdo1-rdma0 = &vdo1_rdma0;
1e86f80e33c1bf Fei Shao                   2024-10-14    48  		vdo1-rdma1 = &vdo1_rdma1;
1e86f80e33c1bf Fei Shao                   2024-10-14    49  		vdo1-rdma2 = &vdo1_rdma2;
1e86f80e33c1bf Fei Shao                   2024-10-14    50  		vdo1-rdma3 = &vdo1_rdma3;
1e86f80e33c1bf Fei Shao                   2024-10-14    51  		vdo1-rdma4 = &vdo1_rdma4;
1e86f80e33c1bf Fei Shao                   2024-10-14    52  		vdo1-rdma5 = &vdo1_rdma5;
1e86f80e33c1bf Fei Shao                   2024-10-14    53  		vdo1-rdma6 = &vdo1_rdma6;
1e86f80e33c1bf Fei Shao                   2024-10-14    54  		vdo1-rdma7 = &vdo1_rdma7;
761b93e62a2775 Fei Shao                   2024-10-14    55  	};
761b93e62a2775 Fei Shao                   2024-10-14    56  
9461e0caac9e4c jason-ch chen              2023-10-23    57  	cpus {
9461e0caac9e4c jason-ch chen              2023-10-23    58  		#address-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23    59  		#size-cells = <0>;
9461e0caac9e4c jason-ch chen              2023-10-23    60  
9461e0caac9e4c jason-ch chen              2023-10-23    61  		cpu0: cpu@0 {
9461e0caac9e4c jason-ch chen              2023-10-23    62  			device_type = "cpu";
9461e0caac9e4c jason-ch chen              2023-10-23    63  			compatible = "arm,cortex-a55";
9461e0caac9e4c jason-ch chen              2023-10-23    64  			reg = <0x000>;
9461e0caac9e4c jason-ch chen              2023-10-23    65  			enable-method = "psci";
9461e0caac9e4c jason-ch chen              2023-10-23    66  			clock-frequency = <2000000000>;
9461e0caac9e4c jason-ch chen              2023-10-23    67  			capacity-dmips-mhz = <282>;
9461e0caac9e4c jason-ch chen              2023-10-23    68  			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
9461e0caac9e4c jason-ch chen              2023-10-23    69  			i-cache-size = <32768>;
9461e0caac9e4c jason-ch chen              2023-10-23    70  			i-cache-line-size = <64>;
9461e0caac9e4c jason-ch chen              2023-10-23    71  			i-cache-sets = <128>;
9461e0caac9e4c jason-ch chen              2023-10-23    72  			d-cache-size = <32768>;
9461e0caac9e4c jason-ch chen              2023-10-23    73  			d-cache-line-size = <64>;
9461e0caac9e4c jason-ch chen              2023-10-23    74  			d-cache-sets = <128>;
9461e0caac9e4c jason-ch chen              2023-10-23    75  			next-level-cache = <&l2_0>;
3bbae49ea02862 Fei Shao                   2024-09-11    76  			performance-domains = <&performance 0>;
9461e0caac9e4c jason-ch chen              2023-10-23    77  			#cooling-cells = <2>;
9461e0caac9e4c jason-ch chen              2023-10-23    78  		};
9461e0caac9e4c jason-ch chen              2023-10-23    79  
9461e0caac9e4c jason-ch chen              2023-10-23    80  		cpu1: cpu@100 {
9461e0caac9e4c jason-ch chen              2023-10-23    81  			device_type = "cpu";
9461e0caac9e4c jason-ch chen              2023-10-23    82  			compatible = "arm,cortex-a55";
9461e0caac9e4c jason-ch chen              2023-10-23    83  			reg = <0x100>;
9461e0caac9e4c jason-ch chen              2023-10-23    84  			enable-method = "psci";
9461e0caac9e4c jason-ch chen              2023-10-23    85  			clock-frequency = <2000000000>;
9461e0caac9e4c jason-ch chen              2023-10-23    86  			capacity-dmips-mhz = <282>;
9461e0caac9e4c jason-ch chen              2023-10-23    87  			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
9461e0caac9e4c jason-ch chen              2023-10-23    88  			i-cache-size = <32768>;
9461e0caac9e4c jason-ch chen              2023-10-23    89  			i-cache-line-size = <64>;
9461e0caac9e4c jason-ch chen              2023-10-23    90  			i-cache-sets = <128>;
9461e0caac9e4c jason-ch chen              2023-10-23    91  			d-cache-size = <32768>;
9461e0caac9e4c jason-ch chen              2023-10-23    92  			d-cache-line-size = <64>;
9461e0caac9e4c jason-ch chen              2023-10-23    93  			d-cache-sets = <128>;
9461e0caac9e4c jason-ch chen              2023-10-23    94  			next-level-cache = <&l2_0>;
3bbae49ea02862 Fei Shao                   2024-09-11    95  			performance-domains = <&performance 0>;
9461e0caac9e4c jason-ch chen              2023-10-23    96  			#cooling-cells = <2>;
9461e0caac9e4c jason-ch chen              2023-10-23    97  		};
9461e0caac9e4c jason-ch chen              2023-10-23    98  
9461e0caac9e4c jason-ch chen              2023-10-23    99  		cpu2: cpu@200 {
9461e0caac9e4c jason-ch chen              2023-10-23   100  			device_type = "cpu";
9461e0caac9e4c jason-ch chen              2023-10-23   101  			compatible = "arm,cortex-a55";
9461e0caac9e4c jason-ch chen              2023-10-23   102  			reg = <0x200>;
9461e0caac9e4c jason-ch chen              2023-10-23   103  			enable-method = "psci";
9461e0caac9e4c jason-ch chen              2023-10-23   104  			clock-frequency = <2000000000>;
9461e0caac9e4c jason-ch chen              2023-10-23   105  			capacity-dmips-mhz = <282>;
9461e0caac9e4c jason-ch chen              2023-10-23   106  			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
9461e0caac9e4c jason-ch chen              2023-10-23   107  			i-cache-size = <32768>;
9461e0caac9e4c jason-ch chen              2023-10-23   108  			i-cache-line-size = <64>;
9461e0caac9e4c jason-ch chen              2023-10-23   109  			i-cache-sets = <128>;
9461e0caac9e4c jason-ch chen              2023-10-23   110  			d-cache-size = <32768>;
9461e0caac9e4c jason-ch chen              2023-10-23   111  			d-cache-line-size = <64>;
9461e0caac9e4c jason-ch chen              2023-10-23   112  			d-cache-sets = <128>;
9461e0caac9e4c jason-ch chen              2023-10-23   113  			next-level-cache = <&l2_0>;
3bbae49ea02862 Fei Shao                   2024-09-11   114  			performance-domains = <&performance 0>;
9461e0caac9e4c jason-ch chen              2023-10-23   115  			#cooling-cells = <2>;
9461e0caac9e4c jason-ch chen              2023-10-23   116  		};
9461e0caac9e4c jason-ch chen              2023-10-23   117  
9461e0caac9e4c jason-ch chen              2023-10-23   118  		cpu3: cpu@300 {
9461e0caac9e4c jason-ch chen              2023-10-23   119  			device_type = "cpu";
9461e0caac9e4c jason-ch chen              2023-10-23   120  			compatible = "arm,cortex-a55";
9461e0caac9e4c jason-ch chen              2023-10-23   121  			reg = <0x300>;
9461e0caac9e4c jason-ch chen              2023-10-23   122  			enable-method = "psci";
9461e0caac9e4c jason-ch chen              2023-10-23   123  			clock-frequency = <2000000000>;
9461e0caac9e4c jason-ch chen              2023-10-23   124  			capacity-dmips-mhz = <282>;
9461e0caac9e4c jason-ch chen              2023-10-23   125  			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
9461e0caac9e4c jason-ch chen              2023-10-23   126  			i-cache-size = <32768>;
9461e0caac9e4c jason-ch chen              2023-10-23   127  			i-cache-line-size = <64>;
9461e0caac9e4c jason-ch chen              2023-10-23   128  			i-cache-sets = <128>;
9461e0caac9e4c jason-ch chen              2023-10-23   129  			d-cache-size = <32768>;
9461e0caac9e4c jason-ch chen              2023-10-23   130  			d-cache-line-size = <64>;
9461e0caac9e4c jason-ch chen              2023-10-23   131  			d-cache-sets = <128>;
9461e0caac9e4c jason-ch chen              2023-10-23   132  			next-level-cache = <&l2_0>;
3bbae49ea02862 Fei Shao                   2024-09-11   133  			performance-domains = <&performance 0>;
9461e0caac9e4c jason-ch chen              2023-10-23   134  			#cooling-cells = <2>;
9461e0caac9e4c jason-ch chen              2023-10-23   135  		};
9461e0caac9e4c jason-ch chen              2023-10-23   136  
9461e0caac9e4c jason-ch chen              2023-10-23   137  		cpu4: cpu@400 {
9461e0caac9e4c jason-ch chen              2023-10-23   138  			device_type = "cpu";
9461e0caac9e4c jason-ch chen              2023-10-23   139  			compatible = "arm,cortex-a55";
9461e0caac9e4c jason-ch chen              2023-10-23   140  			reg = <0x400>;
9461e0caac9e4c jason-ch chen              2023-10-23   141  			enable-method = "psci";
9461e0caac9e4c jason-ch chen              2023-10-23   142  			clock-frequency = <2000000000>;
9461e0caac9e4c jason-ch chen              2023-10-23   143  			capacity-dmips-mhz = <282>;
9461e0caac9e4c jason-ch chen              2023-10-23   144  			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
9461e0caac9e4c jason-ch chen              2023-10-23   145  			i-cache-size = <32768>;
9461e0caac9e4c jason-ch chen              2023-10-23   146  			i-cache-line-size = <64>;
9461e0caac9e4c jason-ch chen              2023-10-23   147  			i-cache-sets = <128>;
9461e0caac9e4c jason-ch chen              2023-10-23   148  			d-cache-size = <32768>;
9461e0caac9e4c jason-ch chen              2023-10-23   149  			d-cache-line-size = <64>;
9461e0caac9e4c jason-ch chen              2023-10-23   150  			d-cache-sets = <128>;
9461e0caac9e4c jason-ch chen              2023-10-23   151  			next-level-cache = <&l2_0>;
3bbae49ea02862 Fei Shao                   2024-09-11   152  			performance-domains = <&performance 0>;
9461e0caac9e4c jason-ch chen              2023-10-23   153  			#cooling-cells = <2>;
9461e0caac9e4c jason-ch chen              2023-10-23   154  		};
9461e0caac9e4c jason-ch chen              2023-10-23   155  
9461e0caac9e4c jason-ch chen              2023-10-23   156  		cpu5: cpu@500 {
9461e0caac9e4c jason-ch chen              2023-10-23   157  			device_type = "cpu";
9461e0caac9e4c jason-ch chen              2023-10-23   158  			compatible = "arm,cortex-a55";
9461e0caac9e4c jason-ch chen              2023-10-23   159  			reg = <0x500>;
9461e0caac9e4c jason-ch chen              2023-10-23   160  			enable-method = "psci";
9461e0caac9e4c jason-ch chen              2023-10-23   161  			clock-frequency = <2000000000>;
9461e0caac9e4c jason-ch chen              2023-10-23   162  			capacity-dmips-mhz = <282>;
9461e0caac9e4c jason-ch chen              2023-10-23   163  			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
9461e0caac9e4c jason-ch chen              2023-10-23   164  			i-cache-size = <32768>;
9461e0caac9e4c jason-ch chen              2023-10-23   165  			i-cache-line-size = <64>;
9461e0caac9e4c jason-ch chen              2023-10-23   166  			i-cache-sets = <128>;
9461e0caac9e4c jason-ch chen              2023-10-23   167  			d-cache-size = <32768>;
9461e0caac9e4c jason-ch chen              2023-10-23   168  			d-cache-line-size = <64>;
9461e0caac9e4c jason-ch chen              2023-10-23   169  			d-cache-sets = <128>;
9461e0caac9e4c jason-ch chen              2023-10-23   170  			next-level-cache = <&l2_0>;
3bbae49ea02862 Fei Shao                   2024-09-11   171  			performance-domains = <&performance 0>;
9461e0caac9e4c jason-ch chen              2023-10-23   172  			#cooling-cells = <2>;
9461e0caac9e4c jason-ch chen              2023-10-23   173  		};
9461e0caac9e4c jason-ch chen              2023-10-23   174  
9461e0caac9e4c jason-ch chen              2023-10-23   175  		cpu6: cpu@600 {
9461e0caac9e4c jason-ch chen              2023-10-23   176  			device_type = "cpu";
9461e0caac9e4c jason-ch chen              2023-10-23   177  			compatible = "arm,cortex-a78";
9461e0caac9e4c jason-ch chen              2023-10-23   178  			reg = <0x600>;
9461e0caac9e4c jason-ch chen              2023-10-23   179  			enable-method = "psci";
9461e0caac9e4c jason-ch chen              2023-10-23   180  			clock-frequency = <2600000000>;
9461e0caac9e4c jason-ch chen              2023-10-23   181  			capacity-dmips-mhz = <1024>;
9461e0caac9e4c jason-ch chen              2023-10-23   182  			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
9461e0caac9e4c jason-ch chen              2023-10-23   183  			i-cache-size = <65536>;
9461e0caac9e4c jason-ch chen              2023-10-23   184  			i-cache-line-size = <64>;
9461e0caac9e4c jason-ch chen              2023-10-23   185  			i-cache-sets = <256>;
9461e0caac9e4c jason-ch chen              2023-10-23   186  			d-cache-size = <65536>;
9461e0caac9e4c jason-ch chen              2023-10-23   187  			d-cache-line-size = <64>;
9461e0caac9e4c jason-ch chen              2023-10-23   188  			d-cache-sets = <256>;
9461e0caac9e4c jason-ch chen              2023-10-23   189  			next-level-cache = <&l2_1>;
3bbae49ea02862 Fei Shao                   2024-09-11   190  			performance-domains = <&performance 1>;
9461e0caac9e4c jason-ch chen              2023-10-23   191  			#cooling-cells = <2>;
9461e0caac9e4c jason-ch chen              2023-10-23   192  		};
9461e0caac9e4c jason-ch chen              2023-10-23   193  
9461e0caac9e4c jason-ch chen              2023-10-23   194  		cpu7: cpu@700 {
9461e0caac9e4c jason-ch chen              2023-10-23   195  			device_type = "cpu";
9461e0caac9e4c jason-ch chen              2023-10-23   196  			compatible = "arm,cortex-a78";
9461e0caac9e4c jason-ch chen              2023-10-23   197  			reg = <0x700>;
9461e0caac9e4c jason-ch chen              2023-10-23   198  			enable-method = "psci";
9461e0caac9e4c jason-ch chen              2023-10-23   199  			clock-frequency = <2600000000>;
9461e0caac9e4c jason-ch chen              2023-10-23   200  			capacity-dmips-mhz = <1024>;
9461e0caac9e4c jason-ch chen              2023-10-23   201  			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
9461e0caac9e4c jason-ch chen              2023-10-23   202  			i-cache-size = <65536>;
9461e0caac9e4c jason-ch chen              2023-10-23   203  			i-cache-line-size = <64>;
9461e0caac9e4c jason-ch chen              2023-10-23   204  			i-cache-sets = <256>;
9461e0caac9e4c jason-ch chen              2023-10-23   205  			d-cache-size = <65536>;
9461e0caac9e4c jason-ch chen              2023-10-23   206  			d-cache-line-size = <64>;
9461e0caac9e4c jason-ch chen              2023-10-23   207  			d-cache-sets = <256>;
9461e0caac9e4c jason-ch chen              2023-10-23   208  			next-level-cache = <&l2_1>;
3bbae49ea02862 Fei Shao                   2024-09-11   209  			performance-domains = <&performance 1>;
9461e0caac9e4c jason-ch chen              2023-10-23   210  			#cooling-cells = <2>;
9461e0caac9e4c jason-ch chen              2023-10-23   211  		};
9461e0caac9e4c jason-ch chen              2023-10-23   212  
9461e0caac9e4c jason-ch chen              2023-10-23   213  		cpu-map {
9461e0caac9e4c jason-ch chen              2023-10-23   214  			cluster0 {
9461e0caac9e4c jason-ch chen              2023-10-23   215  				core0 {
9461e0caac9e4c jason-ch chen              2023-10-23   216  					cpu = <&cpu0>;
9461e0caac9e4c jason-ch chen              2023-10-23   217  				};
9461e0caac9e4c jason-ch chen              2023-10-23   218  
9461e0caac9e4c jason-ch chen              2023-10-23   219  				core1 {
9461e0caac9e4c jason-ch chen              2023-10-23   220  					cpu = <&cpu1>;
9461e0caac9e4c jason-ch chen              2023-10-23   221  				};
9461e0caac9e4c jason-ch chen              2023-10-23   222  
9461e0caac9e4c jason-ch chen              2023-10-23   223  				core2 {
9461e0caac9e4c jason-ch chen              2023-10-23   224  					cpu = <&cpu2>;
9461e0caac9e4c jason-ch chen              2023-10-23   225  				};
9461e0caac9e4c jason-ch chen              2023-10-23   226  
9461e0caac9e4c jason-ch chen              2023-10-23   227  				core3 {
9461e0caac9e4c jason-ch chen              2023-10-23   228  					cpu = <&cpu3>;
9461e0caac9e4c jason-ch chen              2023-10-23   229  				};
9461e0caac9e4c jason-ch chen              2023-10-23   230  
9461e0caac9e4c jason-ch chen              2023-10-23   231  				core4 {
9461e0caac9e4c jason-ch chen              2023-10-23   232  					cpu = <&cpu4>;
9461e0caac9e4c jason-ch chen              2023-10-23   233  				};
9461e0caac9e4c jason-ch chen              2023-10-23   234  
9461e0caac9e4c jason-ch chen              2023-10-23   235  				core5 {
9461e0caac9e4c jason-ch chen              2023-10-23   236  					cpu = <&cpu5>;
9461e0caac9e4c jason-ch chen              2023-10-23   237  				};
9461e0caac9e4c jason-ch chen              2023-10-23   238  
9461e0caac9e4c jason-ch chen              2023-10-23   239  				core6 {
9461e0caac9e4c jason-ch chen              2023-10-23   240  					cpu = <&cpu6>;
9461e0caac9e4c jason-ch chen              2023-10-23   241  				};
9461e0caac9e4c jason-ch chen              2023-10-23   242  
9461e0caac9e4c jason-ch chen              2023-10-23   243  				core7 {
9461e0caac9e4c jason-ch chen              2023-10-23   244  					cpu = <&cpu7>;
9461e0caac9e4c jason-ch chen              2023-10-23   245  				};
9461e0caac9e4c jason-ch chen              2023-10-23   246  			};
9461e0caac9e4c jason-ch chen              2023-10-23   247  		};
9461e0caac9e4c jason-ch chen              2023-10-23   248  
9461e0caac9e4c jason-ch chen              2023-10-23   249  		idle-states {
9461e0caac9e4c jason-ch chen              2023-10-23   250  			entry-method = "psci";
9461e0caac9e4c jason-ch chen              2023-10-23   251  
9461e0caac9e4c jason-ch chen              2023-10-23   252  			cpu_off_l: cpu-off-l {
9461e0caac9e4c jason-ch chen              2023-10-23   253  				compatible = "arm,idle-state";
9461e0caac9e4c jason-ch chen              2023-10-23   254  				arm,psci-suspend-param = <0x00010000>;
9461e0caac9e4c jason-ch chen              2023-10-23   255  				local-timer-stop;
9461e0caac9e4c jason-ch chen              2023-10-23   256  				entry-latency-us = <50>;
9461e0caac9e4c jason-ch chen              2023-10-23   257  				exit-latency-us = <95>;
9461e0caac9e4c jason-ch chen              2023-10-23   258  				min-residency-us = <580>;
9461e0caac9e4c jason-ch chen              2023-10-23   259  			};
9461e0caac9e4c jason-ch chen              2023-10-23   260  
9461e0caac9e4c jason-ch chen              2023-10-23   261  			cpu_off_b: cpu-off-b {
9461e0caac9e4c jason-ch chen              2023-10-23   262  				compatible = "arm,idle-state";
9461e0caac9e4c jason-ch chen              2023-10-23   263  				arm,psci-suspend-param = <0x00010000>;
9461e0caac9e4c jason-ch chen              2023-10-23   264  				local-timer-stop;
9461e0caac9e4c jason-ch chen              2023-10-23   265  				entry-latency-us = <45>;
9461e0caac9e4c jason-ch chen              2023-10-23   266  				exit-latency-us = <140>;
9461e0caac9e4c jason-ch chen              2023-10-23   267  				min-residency-us = <740>;
9461e0caac9e4c jason-ch chen              2023-10-23   268  			};
9461e0caac9e4c jason-ch chen              2023-10-23   269  
9461e0caac9e4c jason-ch chen              2023-10-23   270  			cluster_off_l: cluster-off-l {
9461e0caac9e4c jason-ch chen              2023-10-23   271  				compatible = "arm,idle-state";
9461e0caac9e4c jason-ch chen              2023-10-23   272  				arm,psci-suspend-param = <0x01010010>;
9461e0caac9e4c jason-ch chen              2023-10-23   273  				local-timer-stop;
9461e0caac9e4c jason-ch chen              2023-10-23   274  				entry-latency-us = <55>;
9461e0caac9e4c jason-ch chen              2023-10-23   275  				exit-latency-us = <155>;
9461e0caac9e4c jason-ch chen              2023-10-23   276  				min-residency-us = <840>;
9461e0caac9e4c jason-ch chen              2023-10-23   277  			};
9461e0caac9e4c jason-ch chen              2023-10-23   278  
9461e0caac9e4c jason-ch chen              2023-10-23   279  			cluster_off_b: cluster-off-b {
9461e0caac9e4c jason-ch chen              2023-10-23   280  				compatible = "arm,idle-state";
9461e0caac9e4c jason-ch chen              2023-10-23   281  				arm,psci-suspend-param = <0x01010010>;
9461e0caac9e4c jason-ch chen              2023-10-23   282  				local-timer-stop;
9461e0caac9e4c jason-ch chen              2023-10-23   283  				entry-latency-us = <50>;
9461e0caac9e4c jason-ch chen              2023-10-23   284  				exit-latency-us = <200>;
9461e0caac9e4c jason-ch chen              2023-10-23   285  				min-residency-us = <1000>;
9461e0caac9e4c jason-ch chen              2023-10-23   286  			};
9461e0caac9e4c jason-ch chen              2023-10-23   287  		};
9461e0caac9e4c jason-ch chen              2023-10-23   288  
9461e0caac9e4c jason-ch chen              2023-10-23   289  		l2_0: l2-cache0 {
9461e0caac9e4c jason-ch chen              2023-10-23   290  			compatible = "cache";
9461e0caac9e4c jason-ch chen              2023-10-23   291  			cache-level = <2>;
9461e0caac9e4c jason-ch chen              2023-10-23   292  			cache-size = <131072>;
9461e0caac9e4c jason-ch chen              2023-10-23   293  			cache-line-size = <64>;
9461e0caac9e4c jason-ch chen              2023-10-23   294  			cache-sets = <512>;
9461e0caac9e4c jason-ch chen              2023-10-23   295  			next-level-cache = <&l3_0>;
9461e0caac9e4c jason-ch chen              2023-10-23   296  			cache-unified;
9461e0caac9e4c jason-ch chen              2023-10-23   297  		};
9461e0caac9e4c jason-ch chen              2023-10-23   298  
9461e0caac9e4c jason-ch chen              2023-10-23   299  		l2_1: l2-cache1 {
9461e0caac9e4c jason-ch chen              2023-10-23   300  			compatible = "cache";
9461e0caac9e4c jason-ch chen              2023-10-23   301  			cache-level = <2>;
9461e0caac9e4c jason-ch chen              2023-10-23   302  			cache-size = <262144>;
9461e0caac9e4c jason-ch chen              2023-10-23   303  			cache-line-size = <64>;
9461e0caac9e4c jason-ch chen              2023-10-23   304  			cache-sets = <512>;
9461e0caac9e4c jason-ch chen              2023-10-23   305  			next-level-cache = <&l3_0>;
9461e0caac9e4c jason-ch chen              2023-10-23   306  			cache-unified;
9461e0caac9e4c jason-ch chen              2023-10-23   307  		};
9461e0caac9e4c jason-ch chen              2023-10-23   308  
9461e0caac9e4c jason-ch chen              2023-10-23   309  		l3_0: l3-cache {
9461e0caac9e4c jason-ch chen              2023-10-23   310  			compatible = "cache";
9461e0caac9e4c jason-ch chen              2023-10-23   311  			cache-level = <3>;
9461e0caac9e4c jason-ch chen              2023-10-23   312  			cache-size = <2097152>;
9461e0caac9e4c jason-ch chen              2023-10-23   313  			cache-line-size = <64>;
9461e0caac9e4c jason-ch chen              2023-10-23   314  			cache-sets = <2048>;
9461e0caac9e4c jason-ch chen              2023-10-23   315  			cache-unified;
9461e0caac9e4c jason-ch chen              2023-10-23   316  		};
9461e0caac9e4c jason-ch chen              2023-10-23   317  	};
9461e0caac9e4c jason-ch chen              2023-10-23   318  
9461e0caac9e4c jason-ch chen              2023-10-23   319  	clk13m: oscillator-13m {
9461e0caac9e4c jason-ch chen              2023-10-23   320  		compatible = "fixed-clock";
9461e0caac9e4c jason-ch chen              2023-10-23   321  		#clock-cells = <0>;
9461e0caac9e4c jason-ch chen              2023-10-23   322  		clock-frequency = <13000000>;
9461e0caac9e4c jason-ch chen              2023-10-23   323  		clock-output-names = "clk13m";
9461e0caac9e4c jason-ch chen              2023-10-23   324  	};
9461e0caac9e4c jason-ch chen              2023-10-23   325  
9461e0caac9e4c jason-ch chen              2023-10-23   326  	clk26m: oscillator-26m {
9461e0caac9e4c jason-ch chen              2023-10-23   327  		compatible = "fixed-clock";
9461e0caac9e4c jason-ch chen              2023-10-23   328  		#clock-cells = <0>;
9461e0caac9e4c jason-ch chen              2023-10-23   329  		clock-frequency = <26000000>;
9461e0caac9e4c jason-ch chen              2023-10-23   330  		clock-output-names = "clk26m";
9461e0caac9e4c jason-ch chen              2023-10-23   331  	};
9461e0caac9e4c jason-ch chen              2023-10-23   332  
9461e0caac9e4c jason-ch chen              2023-10-23   333  	clk32k: oscillator-32k {
9461e0caac9e4c jason-ch chen              2023-10-23   334  		compatible = "fixed-clock";
9461e0caac9e4c jason-ch chen              2023-10-23   335  		#clock-cells = <0>;
9461e0caac9e4c jason-ch chen              2023-10-23   336  		clock-frequency = <32768>;
9461e0caac9e4c jason-ch chen              2023-10-23   337  		clock-output-names = "clk32k";
9461e0caac9e4c jason-ch chen              2023-10-23   338  	};
9461e0caac9e4c jason-ch chen              2023-10-23   339  
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   340  	gpu_opp_table: opp-table-gpu {
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   341  		compatible = "operating-points-v2";
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   342  		opp-shared;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   343  
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   344  		opp-390000000 {
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   345  			opp-hz = /bits/ 64 <390000000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   346  			opp-microvolt = <575000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   347  			opp-supported-hw = <0xff>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   348  		};
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   349  		opp-431000000 {
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   350  			opp-hz = /bits/ 64 <431000000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   351  			opp-microvolt = <587500>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   352  			opp-supported-hw = <0xff>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   353  		};
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   354  		opp-473000000 {
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   355  			opp-hz = /bits/ 64 <473000000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   356  			opp-microvolt = <600000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   357  			opp-supported-hw = <0xff>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   358  		};
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   359  		opp-515000000 {
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   360  			opp-hz = /bits/ 64 <515000000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   361  			opp-microvolt = <612500>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   362  			opp-supported-hw = <0xff>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   363  		};
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   364  		opp-556000000 {
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   365  			opp-hz = /bits/ 64 <556000000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   366  			opp-microvolt = <625000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   367  			opp-supported-hw = <0xff>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   368  		};
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   369  		opp-598000000 {
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   370  			opp-hz = /bits/ 64 <598000000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   371  			opp-microvolt = <637500>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   372  			opp-supported-hw = <0xff>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   373  		};
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   374  		opp-640000000 {
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   375  			opp-hz = /bits/ 64 <640000000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   376  			opp-microvolt = <650000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   377  			opp-supported-hw = <0xff>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   378  		};
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   379  		opp-670000000 {
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   380  			opp-hz = /bits/ 64 <670000000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   381  			opp-microvolt = <662500>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   382  			opp-supported-hw = <0xff>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   383  		};
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   384  		opp-700000000 {
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   385  			opp-hz = /bits/ 64 <700000000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   386  			opp-microvolt = <675000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   387  			opp-supported-hw = <0xff>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   388  		};
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   389  		opp-730000000 {
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   390  			opp-hz = /bits/ 64 <730000000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   391  			opp-microvolt = <687500>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   392  			opp-supported-hw = <0xff>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   393  		};
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   394  		opp-760000000 {
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   395  			opp-hz = /bits/ 64 <760000000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   396  			opp-microvolt = <700000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   397  			opp-supported-hw = <0xff>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   398  		};
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   399  		opp-790000000 {
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   400  			opp-hz = /bits/ 64 <790000000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   401  			opp-microvolt = <712500>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   402  			opp-supported-hw = <0xff>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   403  		};
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   404  		opp-835000000 {
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   405  			opp-hz = /bits/ 64 <835000000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   406  			opp-microvolt = <731250>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   407  			opp-supported-hw = <0xff>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   408  		};
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   409  		opp-880000000 {
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   410  			opp-hz = /bits/ 64 <880000000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   411  			opp-microvolt = <750000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   412  			opp-supported-hw = <0xff>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   413  		};
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   414  		opp-915000000 {
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   415  			opp-hz = /bits/ 64 <915000000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   416  			opp-microvolt = <775000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   417  			opp-supported-hw = <0x8f>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   418  		};
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   419  		opp-915000000-5 {
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   420  			opp-hz = /bits/ 64 <915000000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   421  			opp-microvolt = <762500>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   422  			opp-supported-hw = <0x30>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   423  		};
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   424  		opp-915000000-6 {
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   425  			opp-hz = /bits/ 64 <915000000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   426  			opp-microvolt = <750000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   427  			opp-supported-hw = <0x70>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   428  		};
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   429  		opp-950000000 {
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   430  			opp-hz = /bits/ 64 <950000000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   431  			opp-microvolt = <800000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   432  			opp-supported-hw = <0x8f>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   433  		};
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   434  		opp-950000000-5 {
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   435  			opp-hz = /bits/ 64 <950000000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   436  			opp-microvolt = <775000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   437  			opp-supported-hw = <0x30>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   438  		};
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   439  		opp-950000000-6 {
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   440  			opp-hz = /bits/ 64 <950000000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   441  			opp-microvolt = <750000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   442  			opp-supported-hw = <0x70>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   443  		};
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   444  	};
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27   445  
9461e0caac9e4c jason-ch chen              2023-10-23   446  	pmu-a55 {
9461e0caac9e4c jason-ch chen              2023-10-23   447  		compatible = "arm,cortex-a55-pmu";
9461e0caac9e4c jason-ch chen              2023-10-23   448  		interrupt-parent = <&gic>;
9461e0caac9e4c jason-ch chen              2023-10-23   449  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
9461e0caac9e4c jason-ch chen              2023-10-23   450  	};
9461e0caac9e4c jason-ch chen              2023-10-23   451  
9461e0caac9e4c jason-ch chen              2023-10-23   452  	pmu-a78 {
9461e0caac9e4c jason-ch chen              2023-10-23   453  		compatible = "arm,cortex-a78-pmu";
9461e0caac9e4c jason-ch chen              2023-10-23   454  		interrupt-parent = <&gic>;
9461e0caac9e4c jason-ch chen              2023-10-23   455  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
9461e0caac9e4c jason-ch chen              2023-10-23   456  	};
9461e0caac9e4c jason-ch chen              2023-10-23   457  
9461e0caac9e4c jason-ch chen              2023-10-23   458  	psci {
9461e0caac9e4c jason-ch chen              2023-10-23   459  		compatible = "arm,psci-1.0";
9461e0caac9e4c jason-ch chen              2023-10-23   460  		method = "smc";
9461e0caac9e4c jason-ch chen              2023-10-23   461  	};
9461e0caac9e4c jason-ch chen              2023-10-23   462  
bd568ce198b85c Fei Shao                   2024-09-11   463  	sound: sound {
bd568ce198b85c Fei Shao                   2024-09-11   464  		mediatek,platform = <&afe>;
bd568ce198b85c Fei Shao                   2024-09-11   465  		status = "disabled";
bd568ce198b85c Fei Shao                   2024-09-11   466  	};
bd568ce198b85c Fei Shao                   2024-09-11   467  
48456547da153c Nicolas Pitre              2024-06-03   468  	thermal_zones: thermal-zones {
48456547da153c Nicolas Pitre              2024-06-03   469  		cpu-little0-thermal {
48456547da153c Nicolas Pitre              2024-06-03   470  			polling-delay = <1000>;
48456547da153c Nicolas Pitre              2024-06-03   471  			polling-delay-passive = <150>;
48456547da153c Nicolas Pitre              2024-06-03   472  			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU0>;
48456547da153c Nicolas Pitre              2024-06-03   473  
48456547da153c Nicolas Pitre              2024-06-03   474  			trips {
48456547da153c Nicolas Pitre              2024-06-03   475  				cpu_little0_alert0: trip-alert0 {
48456547da153c Nicolas Pitre              2024-06-03   476  					temperature = <85000>;
48456547da153c Nicolas Pitre              2024-06-03   477  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   478  					type = "passive";
48456547da153c Nicolas Pitre              2024-06-03   479  				};
48456547da153c Nicolas Pitre              2024-06-03   480  
48456547da153c Nicolas Pitre              2024-06-03   481  				cpu_little0_alert1: trip-alert1 {
48456547da153c Nicolas Pitre              2024-06-03   482  					temperature = <95000>;
48456547da153c Nicolas Pitre              2024-06-03   483  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   484  					type = "hot";
48456547da153c Nicolas Pitre              2024-06-03   485  				};
48456547da153c Nicolas Pitre              2024-06-03   486  
48456547da153c Nicolas Pitre              2024-06-03   487  				cpu_little0_crit: trip-crit {
48456547da153c Nicolas Pitre              2024-06-03   488  					temperature = <100000>;
48456547da153c Nicolas Pitre              2024-06-03   489  					hysteresis = <0>;
48456547da153c Nicolas Pitre              2024-06-03   490  					type = "critical";
48456547da153c Nicolas Pitre              2024-06-03   491  				};
48456547da153c Nicolas Pitre              2024-06-03   492  			};
48456547da153c Nicolas Pitre              2024-06-03   493  
48456547da153c Nicolas Pitre              2024-06-03   494  			cooling-maps {
48456547da153c Nicolas Pitre              2024-06-03   495  				map0 {
48456547da153c Nicolas Pitre              2024-06-03   496  					trip = <&cpu_little0_alert0>;
48456547da153c Nicolas Pitre              2024-06-03   497  					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
48456547da153c Nicolas Pitre              2024-06-03   498  							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
48456547da153c Nicolas Pitre              2024-06-03   499  							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
48456547da153c Nicolas Pitre              2024-06-03   500  							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
48456547da153c Nicolas Pitre              2024-06-03   501  							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
48456547da153c Nicolas Pitre              2024-06-03   502  							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
48456547da153c Nicolas Pitre              2024-06-03   503  				};
48456547da153c Nicolas Pitre              2024-06-03   504  			};
48456547da153c Nicolas Pitre              2024-06-03   505  		};
48456547da153c Nicolas Pitre              2024-06-03   506  
48456547da153c Nicolas Pitre              2024-06-03   507  		cpu-little1-thermal {
48456547da153c Nicolas Pitre              2024-06-03   508  			polling-delay = <1000>;
48456547da153c Nicolas Pitre              2024-06-03   509  			polling-delay-passive = <150>;
48456547da153c Nicolas Pitre              2024-06-03   510  			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU1>;
48456547da153c Nicolas Pitre              2024-06-03   511  
48456547da153c Nicolas Pitre              2024-06-03   512  			trips {
48456547da153c Nicolas Pitre              2024-06-03   513  				cpu_little1_alert0: trip-alert0 {
48456547da153c Nicolas Pitre              2024-06-03   514  					temperature = <85000>;
48456547da153c Nicolas Pitre              2024-06-03   515  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   516  					type = "passive";
48456547da153c Nicolas Pitre              2024-06-03   517  				};
48456547da153c Nicolas Pitre              2024-06-03   518  
48456547da153c Nicolas Pitre              2024-06-03   519  				cpu_little1_alert1: trip-alert1 {
48456547da153c Nicolas Pitre              2024-06-03   520  					temperature = <95000>;
48456547da153c Nicolas Pitre              2024-06-03   521  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   522  					type = "hot";
48456547da153c Nicolas Pitre              2024-06-03   523  				};
48456547da153c Nicolas Pitre              2024-06-03   524  
48456547da153c Nicolas Pitre              2024-06-03   525  				cpu_little1_crit: trip-crit {
48456547da153c Nicolas Pitre              2024-06-03   526  					temperature = <100000>;
48456547da153c Nicolas Pitre              2024-06-03   527  					hysteresis = <0>;
48456547da153c Nicolas Pitre              2024-06-03   528  					type = "critical";
48456547da153c Nicolas Pitre              2024-06-03   529  				};
48456547da153c Nicolas Pitre              2024-06-03   530  			};
48456547da153c Nicolas Pitre              2024-06-03   531  
48456547da153c Nicolas Pitre              2024-06-03   532  			cooling-maps {
48456547da153c Nicolas Pitre              2024-06-03   533  				map0 {
48456547da153c Nicolas Pitre              2024-06-03   534  					trip = <&cpu_little1_alert0>;
48456547da153c Nicolas Pitre              2024-06-03   535  					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
48456547da153c Nicolas Pitre              2024-06-03   536  							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
48456547da153c Nicolas Pitre              2024-06-03   537  							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
48456547da153c Nicolas Pitre              2024-06-03   538  							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
48456547da153c Nicolas Pitre              2024-06-03   539  							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
48456547da153c Nicolas Pitre              2024-06-03   540  							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
48456547da153c Nicolas Pitre              2024-06-03   541  				};
48456547da153c Nicolas Pitre              2024-06-03   542  			};
48456547da153c Nicolas Pitre              2024-06-03   543  		};
48456547da153c Nicolas Pitre              2024-06-03   544  
48456547da153c Nicolas Pitre              2024-06-03   545  		cpu-little2-thermal {
48456547da153c Nicolas Pitre              2024-06-03   546  			polling-delay = <1000>;
48456547da153c Nicolas Pitre              2024-06-03   547  			polling-delay-passive = <150>;
48456547da153c Nicolas Pitre              2024-06-03   548  			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU2>;
48456547da153c Nicolas Pitre              2024-06-03   549  
48456547da153c Nicolas Pitre              2024-06-03   550  			trips {
48456547da153c Nicolas Pitre              2024-06-03   551  				cpu_little2_alert0: trip-alert0 {
48456547da153c Nicolas Pitre              2024-06-03   552  					temperature = <85000>;
48456547da153c Nicolas Pitre              2024-06-03   553  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   554  					type = "passive";
48456547da153c Nicolas Pitre              2024-06-03   555  				};
48456547da153c Nicolas Pitre              2024-06-03   556  
48456547da153c Nicolas Pitre              2024-06-03   557  				cpu_little2_alert1: trip-alert1 {
48456547da153c Nicolas Pitre              2024-06-03   558  					temperature = <95000>;
48456547da153c Nicolas Pitre              2024-06-03   559  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   560  					type = "hot";
48456547da153c Nicolas Pitre              2024-06-03   561  				};
48456547da153c Nicolas Pitre              2024-06-03   562  
48456547da153c Nicolas Pitre              2024-06-03   563  				cpu_little2_crit: trip-crit {
48456547da153c Nicolas Pitre              2024-06-03   564  					temperature = <100000>;
48456547da153c Nicolas Pitre              2024-06-03   565  					hysteresis = <0>;
48456547da153c Nicolas Pitre              2024-06-03   566  					type = "critical";
48456547da153c Nicolas Pitre              2024-06-03   567  				};
48456547da153c Nicolas Pitre              2024-06-03   568  			};
48456547da153c Nicolas Pitre              2024-06-03   569  
48456547da153c Nicolas Pitre              2024-06-03   570  			cooling-maps {
48456547da153c Nicolas Pitre              2024-06-03   571  				map0 {
48456547da153c Nicolas Pitre              2024-06-03   572  					trip = <&cpu_little2_alert0>;
48456547da153c Nicolas Pitre              2024-06-03   573  					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
48456547da153c Nicolas Pitre              2024-06-03   574  							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
48456547da153c Nicolas Pitre              2024-06-03   575  							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
48456547da153c Nicolas Pitre              2024-06-03   576  							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
48456547da153c Nicolas Pitre              2024-06-03   577  							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
48456547da153c Nicolas Pitre              2024-06-03   578  							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
48456547da153c Nicolas Pitre              2024-06-03   579  				};
48456547da153c Nicolas Pitre              2024-06-03   580  			};
48456547da153c Nicolas Pitre              2024-06-03   581  		};
48456547da153c Nicolas Pitre              2024-06-03   582  
48456547da153c Nicolas Pitre              2024-06-03   583  		cpu-little3-thermal {
48456547da153c Nicolas Pitre              2024-06-03   584  			polling-delay = <1000>;
48456547da153c Nicolas Pitre              2024-06-03   585  			polling-delay-passive = <150>;
48456547da153c Nicolas Pitre              2024-06-03   586  			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU3>;
48456547da153c Nicolas Pitre              2024-06-03   587  
48456547da153c Nicolas Pitre              2024-06-03   588  			trips {
48456547da153c Nicolas Pitre              2024-06-03   589  				cpu_little3_alert0: trip-alert0 {
48456547da153c Nicolas Pitre              2024-06-03   590  					temperature = <85000>;
48456547da153c Nicolas Pitre              2024-06-03   591  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   592  					type = "passive";
48456547da153c Nicolas Pitre              2024-06-03   593  				};
48456547da153c Nicolas Pitre              2024-06-03   594  
48456547da153c Nicolas Pitre              2024-06-03   595  				cpu_little3_alert1: trip-alert1 {
48456547da153c Nicolas Pitre              2024-06-03   596  					temperature = <95000>;
48456547da153c Nicolas Pitre              2024-06-03   597  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   598  					type = "hot";
48456547da153c Nicolas Pitre              2024-06-03   599  				};
48456547da153c Nicolas Pitre              2024-06-03   600  
48456547da153c Nicolas Pitre              2024-06-03   601  				cpu_little3_crit: trip-crit {
48456547da153c Nicolas Pitre              2024-06-03   602  					temperature = <100000>;
48456547da153c Nicolas Pitre              2024-06-03   603  					hysteresis = <0>;
48456547da153c Nicolas Pitre              2024-06-03   604  					type = "critical";
48456547da153c Nicolas Pitre              2024-06-03   605  				};
48456547da153c Nicolas Pitre              2024-06-03   606  			};
48456547da153c Nicolas Pitre              2024-06-03   607  
48456547da153c Nicolas Pitre              2024-06-03   608  			cooling-maps {
48456547da153c Nicolas Pitre              2024-06-03   609  				map0 {
48456547da153c Nicolas Pitre              2024-06-03   610  					trip = <&cpu_little3_alert0>;
48456547da153c Nicolas Pitre              2024-06-03   611  					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
48456547da153c Nicolas Pitre              2024-06-03   612  							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
48456547da153c Nicolas Pitre              2024-06-03   613  							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
48456547da153c Nicolas Pitre              2024-06-03   614  							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
48456547da153c Nicolas Pitre              2024-06-03   615  							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
48456547da153c Nicolas Pitre              2024-06-03   616  							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
48456547da153c Nicolas Pitre              2024-06-03   617  				};
48456547da153c Nicolas Pitre              2024-06-03   618  			};
48456547da153c Nicolas Pitre              2024-06-03   619  		};
48456547da153c Nicolas Pitre              2024-06-03   620  
48456547da153c Nicolas Pitre              2024-06-03   621  		cpu-big0-thermal {
48456547da153c Nicolas Pitre              2024-06-03   622  			polling-delay = <1000>;
48456547da153c Nicolas Pitre              2024-06-03   623  			polling-delay-passive = <100>;
48456547da153c Nicolas Pitre              2024-06-03   624  			thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU0>;
48456547da153c Nicolas Pitre              2024-06-03   625  
48456547da153c Nicolas Pitre              2024-06-03   626  			trips {
48456547da153c Nicolas Pitre              2024-06-03   627  				cpu_big0_alert0: trip-alert0 {
48456547da153c Nicolas Pitre              2024-06-03   628  					temperature = <85000>;
48456547da153c Nicolas Pitre              2024-06-03   629  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   630  					type = "passive";
48456547da153c Nicolas Pitre              2024-06-03   631  				};
48456547da153c Nicolas Pitre              2024-06-03   632  
48456547da153c Nicolas Pitre              2024-06-03   633  				cpu_big0_alert1: trip-alert1 {
48456547da153c Nicolas Pitre              2024-06-03   634  					temperature = <95000>;
48456547da153c Nicolas Pitre              2024-06-03   635  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   636  					type = "hot";
48456547da153c Nicolas Pitre              2024-06-03   637  				};
48456547da153c Nicolas Pitre              2024-06-03   638  
48456547da153c Nicolas Pitre              2024-06-03   639  				cpu_big0_crit: trip-crit {
48456547da153c Nicolas Pitre              2024-06-03   640  					temperature = <100000>;
48456547da153c Nicolas Pitre              2024-06-03   641  					hysteresis = <0>;
48456547da153c Nicolas Pitre              2024-06-03   642  					type = "critical";
48456547da153c Nicolas Pitre              2024-06-03   643  				};
48456547da153c Nicolas Pitre              2024-06-03   644  			};
48456547da153c Nicolas Pitre              2024-06-03   645  
48456547da153c Nicolas Pitre              2024-06-03   646  			cooling-maps {
48456547da153c Nicolas Pitre              2024-06-03   647  				map0 {
48456547da153c Nicolas Pitre              2024-06-03   648  					trip = <&cpu_big0_alert0>;
48456547da153c Nicolas Pitre              2024-06-03   649  					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
48456547da153c Nicolas Pitre              2024-06-03   650  							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
48456547da153c Nicolas Pitre              2024-06-03   651  				};
48456547da153c Nicolas Pitre              2024-06-03   652  			};
48456547da153c Nicolas Pitre              2024-06-03   653  		};
48456547da153c Nicolas Pitre              2024-06-03   654  
48456547da153c Nicolas Pitre              2024-06-03   655  		cpu-big1-thermal {
48456547da153c Nicolas Pitre              2024-06-03   656  			polling-delay = <1000>;
48456547da153c Nicolas Pitre              2024-06-03   657  			polling-delay-passive = <100>;
48456547da153c Nicolas Pitre              2024-06-03   658  			thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU1>;
48456547da153c Nicolas Pitre              2024-06-03   659  
48456547da153c Nicolas Pitre              2024-06-03   660  			trips {
48456547da153c Nicolas Pitre              2024-06-03   661  				cpu_big1_alert0: trip-alert0 {
48456547da153c Nicolas Pitre              2024-06-03   662  					temperature = <85000>;
48456547da153c Nicolas Pitre              2024-06-03   663  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   664  					type = "passive";
48456547da153c Nicolas Pitre              2024-06-03   665  				};
48456547da153c Nicolas Pitre              2024-06-03   666  
48456547da153c Nicolas Pitre              2024-06-03   667  				cpu_big1_alert1: trip-alert1 {
48456547da153c Nicolas Pitre              2024-06-03   668  					temperature = <95000>;
48456547da153c Nicolas Pitre              2024-06-03   669  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   670  					type = "hot";
48456547da153c Nicolas Pitre              2024-06-03   671  				};
48456547da153c Nicolas Pitre              2024-06-03   672  
48456547da153c Nicolas Pitre              2024-06-03   673  				cpu_big1_crit: trip-crit {
48456547da153c Nicolas Pitre              2024-06-03   674  					temperature = <100000>;
48456547da153c Nicolas Pitre              2024-06-03   675  					hysteresis = <0>;
48456547da153c Nicolas Pitre              2024-06-03   676  					type = "critical";
48456547da153c Nicolas Pitre              2024-06-03   677  				};
48456547da153c Nicolas Pitre              2024-06-03   678  			};
48456547da153c Nicolas Pitre              2024-06-03   679  
48456547da153c Nicolas Pitre              2024-06-03   680  			cooling-maps {
48456547da153c Nicolas Pitre              2024-06-03   681  				map0 {
48456547da153c Nicolas Pitre              2024-06-03   682  					trip = <&cpu_big1_alert0>;
48456547da153c Nicolas Pitre              2024-06-03   683  					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
48456547da153c Nicolas Pitre              2024-06-03   684  							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
48456547da153c Nicolas Pitre              2024-06-03   685  				};
48456547da153c Nicolas Pitre              2024-06-03   686  			};
48456547da153c Nicolas Pitre              2024-06-03   687  		};
48456547da153c Nicolas Pitre              2024-06-03   688  
48456547da153c Nicolas Pitre              2024-06-03   689  		apu-thermal {
48456547da153c Nicolas Pitre              2024-06-03   690  			polling-delay = <1000>;
48456547da153c Nicolas Pitre              2024-06-03   691  			polling-delay-passive = <250>;
48456547da153c Nicolas Pitre              2024-06-03   692  			thermal-sensors = <&lvts_ap MT8188_AP_APU>;
48456547da153c Nicolas Pitre              2024-06-03   693  
48456547da153c Nicolas Pitre              2024-06-03   694  			trips {
48456547da153c Nicolas Pitre              2024-06-03   695  				apu_alert0: trip-alert0 {
48456547da153c Nicolas Pitre              2024-06-03   696  					temperature = <85000>;
48456547da153c Nicolas Pitre              2024-06-03   697  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   698  					type = "passive";
48456547da153c Nicolas Pitre              2024-06-03   699  				};
48456547da153c Nicolas Pitre              2024-06-03   700  
48456547da153c Nicolas Pitre              2024-06-03   701  				apu_alert1: trip-alert1 {
48456547da153c Nicolas Pitre              2024-06-03   702  					temperature = <95000>;
48456547da153c Nicolas Pitre              2024-06-03   703  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   704  					type = "hot";
48456547da153c Nicolas Pitre              2024-06-03   705  				};
48456547da153c Nicolas Pitre              2024-06-03   706  
48456547da153c Nicolas Pitre              2024-06-03   707  				apu_crit: trip-crit {
48456547da153c Nicolas Pitre              2024-06-03   708  					temperature = <100000>;
48456547da153c Nicolas Pitre              2024-06-03   709  					hysteresis = <0>;
48456547da153c Nicolas Pitre              2024-06-03   710  					type = "critical";
48456547da153c Nicolas Pitre              2024-06-03   711  				};
48456547da153c Nicolas Pitre              2024-06-03   712  			};
48456547da153c Nicolas Pitre              2024-06-03   713  		};
48456547da153c Nicolas Pitre              2024-06-03   714  
48456547da153c Nicolas Pitre              2024-06-03   715  		gpu-thermal {
48456547da153c Nicolas Pitre              2024-06-03   716  			polling-delay = <1000>;
48456547da153c Nicolas Pitre              2024-06-03   717  			polling-delay-passive = <250>;
48456547da153c Nicolas Pitre              2024-06-03   718  			thermal-sensors = <&lvts_ap MT8188_AP_GPU0>;
48456547da153c Nicolas Pitre              2024-06-03   719  
48456547da153c Nicolas Pitre              2024-06-03   720  			trips {
48456547da153c Nicolas Pitre              2024-06-03   721  				gpu_alert0: trip-alert0 {
48456547da153c Nicolas Pitre              2024-06-03   722  					temperature = <85000>;
48456547da153c Nicolas Pitre              2024-06-03   723  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   724  					type = "passive";
48456547da153c Nicolas Pitre              2024-06-03   725  				};
48456547da153c Nicolas Pitre              2024-06-03   726  
48456547da153c Nicolas Pitre              2024-06-03   727  				gpu_alert1: trip-alert1 {
48456547da153c Nicolas Pitre              2024-06-03   728  					temperature = <95000>;
48456547da153c Nicolas Pitre              2024-06-03   729  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   730  					type = "hot";
48456547da153c Nicolas Pitre              2024-06-03   731  				};
48456547da153c Nicolas Pitre              2024-06-03   732  
48456547da153c Nicolas Pitre              2024-06-03   733  				gpu_crit: trip-crit {
48456547da153c Nicolas Pitre              2024-06-03   734  					temperature = <100000>;
48456547da153c Nicolas Pitre              2024-06-03   735  					hysteresis = <0>;
48456547da153c Nicolas Pitre              2024-06-03   736  					type = "critical";
48456547da153c Nicolas Pitre              2024-06-03   737  				};
48456547da153c Nicolas Pitre              2024-06-03   738  			};
48456547da153c Nicolas Pitre              2024-06-03   739  
48456547da153c Nicolas Pitre              2024-06-03   740  			cooling-maps {
48456547da153c Nicolas Pitre              2024-06-03   741  				map0 {
48456547da153c Nicolas Pitre              2024-06-03   742  					trip = <&gpu_alert0>;
48456547da153c Nicolas Pitre              2024-06-03   743  					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
48456547da153c Nicolas Pitre              2024-06-03   744  				};
48456547da153c Nicolas Pitre              2024-06-03   745  			};
48456547da153c Nicolas Pitre              2024-06-03   746  		};
48456547da153c Nicolas Pitre              2024-06-03   747  
48456547da153c Nicolas Pitre              2024-06-03   748  		gpu1-thermal {
48456547da153c Nicolas Pitre              2024-06-03   749  			polling-delay = <1000>;
48456547da153c Nicolas Pitre              2024-06-03   750  			polling-delay-passive = <250>;
48456547da153c Nicolas Pitre              2024-06-03   751  			thermal-sensors = <&lvts_ap MT8188_AP_GPU1>;
48456547da153c Nicolas Pitre              2024-06-03   752  
48456547da153c Nicolas Pitre              2024-06-03   753  			trips {
48456547da153c Nicolas Pitre              2024-06-03   754  				gpu1_alert0: trip-alert0 {
48456547da153c Nicolas Pitre              2024-06-03   755  					temperature = <85000>;
48456547da153c Nicolas Pitre              2024-06-03   756  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   757  					type = "passive";
48456547da153c Nicolas Pitre              2024-06-03   758  				};
48456547da153c Nicolas Pitre              2024-06-03   759  
48456547da153c Nicolas Pitre              2024-06-03   760  				gpu1_alert1: trip-alert1 {
48456547da153c Nicolas Pitre              2024-06-03   761  					temperature = <95000>;
48456547da153c Nicolas Pitre              2024-06-03   762  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   763  					type = "hot";
48456547da153c Nicolas Pitre              2024-06-03   764  				};
48456547da153c Nicolas Pitre              2024-06-03   765  
48456547da153c Nicolas Pitre              2024-06-03   766  				gpu1_crit: trip-crit {
48456547da153c Nicolas Pitre              2024-06-03   767  					temperature = <100000>;
48456547da153c Nicolas Pitre              2024-06-03   768  					hysteresis = <0>;
48456547da153c Nicolas Pitre              2024-06-03   769  					type = "critical";
48456547da153c Nicolas Pitre              2024-06-03   770  				};
48456547da153c Nicolas Pitre              2024-06-03   771  			};
48456547da153c Nicolas Pitre              2024-06-03   772  
48456547da153c Nicolas Pitre              2024-06-03   773  			cooling-maps {
48456547da153c Nicolas Pitre              2024-06-03   774  				map0 {
48456547da153c Nicolas Pitre              2024-06-03   775  					trip = <&gpu1_alert0>;
48456547da153c Nicolas Pitre              2024-06-03   776  					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
48456547da153c Nicolas Pitre              2024-06-03   777  				};
48456547da153c Nicolas Pitre              2024-06-03   778  			};
48456547da153c Nicolas Pitre              2024-06-03   779  		};
48456547da153c Nicolas Pitre              2024-06-03   780  
48456547da153c Nicolas Pitre              2024-06-03   781  		adsp-thermal {
48456547da153c Nicolas Pitre              2024-06-03   782  			polling-delay = <1000>;
48456547da153c Nicolas Pitre              2024-06-03   783  			polling-delay-passive = <250>;
48456547da153c Nicolas Pitre              2024-06-03   784  			thermal-sensors = <&lvts_ap MT8188_AP_ADSP>;
48456547da153c Nicolas Pitre              2024-06-03   785  
48456547da153c Nicolas Pitre              2024-06-03   786  			trips {
48456547da153c Nicolas Pitre              2024-06-03   787  				soc_alert0: trip-alert0 {
48456547da153c Nicolas Pitre              2024-06-03   788  					temperature = <85000>;
48456547da153c Nicolas Pitre              2024-06-03   789  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   790  					type = "passive";
48456547da153c Nicolas Pitre              2024-06-03   791  				};
48456547da153c Nicolas Pitre              2024-06-03   792  
48456547da153c Nicolas Pitre              2024-06-03   793  				soc_alert1: trip-alert1 {
48456547da153c Nicolas Pitre              2024-06-03   794  					temperature = <95000>;
48456547da153c Nicolas Pitre              2024-06-03   795  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   796  					type = "hot";
48456547da153c Nicolas Pitre              2024-06-03   797  				};
48456547da153c Nicolas Pitre              2024-06-03   798  
48456547da153c Nicolas Pitre              2024-06-03   799  				soc_crit: trip-crit {
48456547da153c Nicolas Pitre              2024-06-03   800  					temperature = <100000>;
48456547da153c Nicolas Pitre              2024-06-03   801  					hysteresis = <0>;
48456547da153c Nicolas Pitre              2024-06-03   802  					type = "critical";
48456547da153c Nicolas Pitre              2024-06-03   803  				};
48456547da153c Nicolas Pitre              2024-06-03   804  			};
48456547da153c Nicolas Pitre              2024-06-03   805  		};
48456547da153c Nicolas Pitre              2024-06-03   806  
48456547da153c Nicolas Pitre              2024-06-03   807  		vdo-thermal {
48456547da153c Nicolas Pitre              2024-06-03   808  			polling-delay = <1000>;
48456547da153c Nicolas Pitre              2024-06-03   809  			polling-delay-passive = <250>;
48456547da153c Nicolas Pitre              2024-06-03   810  			thermal-sensors = <&lvts_ap MT8188_AP_VDO>;
48456547da153c Nicolas Pitre              2024-06-03   811  
48456547da153c Nicolas Pitre              2024-06-03   812  			trips {
48456547da153c Nicolas Pitre              2024-06-03   813  				soc1_alert0: trip-alert0 {
48456547da153c Nicolas Pitre              2024-06-03   814  					temperature = <85000>;
48456547da153c Nicolas Pitre              2024-06-03   815  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   816  					type = "passive";
48456547da153c Nicolas Pitre              2024-06-03   817  				};
48456547da153c Nicolas Pitre              2024-06-03   818  
48456547da153c Nicolas Pitre              2024-06-03   819  				soc1_alert1: trip-alert1 {
48456547da153c Nicolas Pitre              2024-06-03   820  					temperature = <95000>;
48456547da153c Nicolas Pitre              2024-06-03   821  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   822  					type = "hot";
48456547da153c Nicolas Pitre              2024-06-03   823  				};
48456547da153c Nicolas Pitre              2024-06-03   824  
48456547da153c Nicolas Pitre              2024-06-03   825  				soc1_crit: trip-crit {
48456547da153c Nicolas Pitre              2024-06-03   826  					temperature = <100000>;
48456547da153c Nicolas Pitre              2024-06-03   827  					hysteresis = <0>;
48456547da153c Nicolas Pitre              2024-06-03   828  					type = "critical";
48456547da153c Nicolas Pitre              2024-06-03   829  				};
48456547da153c Nicolas Pitre              2024-06-03   830  			};
48456547da153c Nicolas Pitre              2024-06-03   831  		};
48456547da153c Nicolas Pitre              2024-06-03   832  
48456547da153c Nicolas Pitre              2024-06-03   833  		infra-thermal {
48456547da153c Nicolas Pitre              2024-06-03   834  			polling-delay = <1000>;
48456547da153c Nicolas Pitre              2024-06-03   835  			polling-delay-passive = <250>;
48456547da153c Nicolas Pitre              2024-06-03   836  			thermal-sensors = <&lvts_ap MT8188_AP_INFRA>;
48456547da153c Nicolas Pitre              2024-06-03   837  
48456547da153c Nicolas Pitre              2024-06-03   838  			trips {
48456547da153c Nicolas Pitre              2024-06-03   839  				soc2_alert0: trip-alert0 {
48456547da153c Nicolas Pitre              2024-06-03   840  					temperature = <85000>;
48456547da153c Nicolas Pitre              2024-06-03   841  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   842  					type = "passive";
48456547da153c Nicolas Pitre              2024-06-03   843  				};
48456547da153c Nicolas Pitre              2024-06-03   844  
48456547da153c Nicolas Pitre              2024-06-03   845  				soc2_alert1: trip-alert1 {
48456547da153c Nicolas Pitre              2024-06-03   846  					temperature = <95000>;
48456547da153c Nicolas Pitre              2024-06-03   847  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   848  					type = "hot";
48456547da153c Nicolas Pitre              2024-06-03   849  				};
48456547da153c Nicolas Pitre              2024-06-03   850  
48456547da153c Nicolas Pitre              2024-06-03   851  				soc2_crit: trip-crit {
48456547da153c Nicolas Pitre              2024-06-03   852  					temperature = <100000>;
48456547da153c Nicolas Pitre              2024-06-03   853  					hysteresis = <0>;
48456547da153c Nicolas Pitre              2024-06-03   854  					type = "critical";
48456547da153c Nicolas Pitre              2024-06-03   855  				};
48456547da153c Nicolas Pitre              2024-06-03   856  			};
48456547da153c Nicolas Pitre              2024-06-03   857  		};
48456547da153c Nicolas Pitre              2024-06-03   858  
48456547da153c Nicolas Pitre              2024-06-03   859  		cam1-thermal {
48456547da153c Nicolas Pitre              2024-06-03   860  			polling-delay = <1000>;
48456547da153c Nicolas Pitre              2024-06-03   861  			polling-delay-passive = <250>;
48456547da153c Nicolas Pitre              2024-06-03   862  			thermal-sensors = <&lvts_ap MT8188_AP_CAM1>;
48456547da153c Nicolas Pitre              2024-06-03   863  
48456547da153c Nicolas Pitre              2024-06-03   864  			trips {
48456547da153c Nicolas Pitre              2024-06-03   865  				cam1_alert0: trip-alert0 {
48456547da153c Nicolas Pitre              2024-06-03   866  					temperature = <85000>;
48456547da153c Nicolas Pitre              2024-06-03   867  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   868  					type = "passive";
48456547da153c Nicolas Pitre              2024-06-03   869  				};
48456547da153c Nicolas Pitre              2024-06-03   870  
48456547da153c Nicolas Pitre              2024-06-03   871  				cam1_alert1: trip-alert1 {
48456547da153c Nicolas Pitre              2024-06-03   872  					temperature = <95000>;
48456547da153c Nicolas Pitre              2024-06-03   873  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   874  					type = "hot";
48456547da153c Nicolas Pitre              2024-06-03   875  				};
48456547da153c Nicolas Pitre              2024-06-03   876  
48456547da153c Nicolas Pitre              2024-06-03   877  				cam1_crit: trip-crit {
48456547da153c Nicolas Pitre              2024-06-03   878  					temperature = <100000>;
48456547da153c Nicolas Pitre              2024-06-03   879  					hysteresis = <0>;
48456547da153c Nicolas Pitre              2024-06-03   880  					type = "critical";
48456547da153c Nicolas Pitre              2024-06-03   881  				};
48456547da153c Nicolas Pitre              2024-06-03   882  			};
48456547da153c Nicolas Pitre              2024-06-03   883  		};
48456547da153c Nicolas Pitre              2024-06-03   884  
48456547da153c Nicolas Pitre              2024-06-03   885  		cam2-thermal {
48456547da153c Nicolas Pitre              2024-06-03   886  			polling-delay = <1000>;
48456547da153c Nicolas Pitre              2024-06-03   887  			polling-delay-passive = <250>;
48456547da153c Nicolas Pitre              2024-06-03   888  			thermal-sensors = <&lvts_ap MT8188_AP_CAM2>;
48456547da153c Nicolas Pitre              2024-06-03   889  
48456547da153c Nicolas Pitre              2024-06-03   890  			trips {
48456547da153c Nicolas Pitre              2024-06-03   891  				cam2_alert0: trip-alert0 {
48456547da153c Nicolas Pitre              2024-06-03   892  					temperature = <85000>;
48456547da153c Nicolas Pitre              2024-06-03   893  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   894  					type = "passive";
48456547da153c Nicolas Pitre              2024-06-03   895  				};
48456547da153c Nicolas Pitre              2024-06-03   896  
48456547da153c Nicolas Pitre              2024-06-03   897  				cam2_alert1: trip-alert1 {
48456547da153c Nicolas Pitre              2024-06-03   898  					temperature = <95000>;
48456547da153c Nicolas Pitre              2024-06-03   899  					hysteresis = <2000>;
48456547da153c Nicolas Pitre              2024-06-03   900  					type = "hot";
48456547da153c Nicolas Pitre              2024-06-03   901  				};
48456547da153c Nicolas Pitre              2024-06-03   902  
48456547da153c Nicolas Pitre              2024-06-03   903  				cam2_crit: trip-crit {
48456547da153c Nicolas Pitre              2024-06-03   904  					temperature = <100000>;
48456547da153c Nicolas Pitre              2024-06-03   905  					hysteresis = <0>;
48456547da153c Nicolas Pitre              2024-06-03   906  					type = "critical";
48456547da153c Nicolas Pitre              2024-06-03   907  				};
48456547da153c Nicolas Pitre              2024-06-03   908  			};
48456547da153c Nicolas Pitre              2024-06-03   909  		};
48456547da153c Nicolas Pitre              2024-06-03   910  	};
48456547da153c Nicolas Pitre              2024-06-03   911  
9461e0caac9e4c jason-ch chen              2023-10-23   912  	timer: timer {
9461e0caac9e4c jason-ch chen              2023-10-23   913  		compatible = "arm,armv8-timer";
9461e0caac9e4c jason-ch chen              2023-10-23   914  		interrupt-parent = <&gic>;
9461e0caac9e4c jason-ch chen              2023-10-23   915  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
9461e0caac9e4c jason-ch chen              2023-10-23   916  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
9461e0caac9e4c jason-ch chen              2023-10-23   917  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
9461e0caac9e4c jason-ch chen              2023-10-23   918  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23   919  		clock-frequency = <13000000>;
9461e0caac9e4c jason-ch chen              2023-10-23   920  	};
9461e0caac9e4c jason-ch chen              2023-10-23   921  
9461e0caac9e4c jason-ch chen              2023-10-23   922  	soc {
9461e0caac9e4c jason-ch chen              2023-10-23   923  		#address-cells = <2>;
9461e0caac9e4c jason-ch chen              2023-10-23   924  		#size-cells = <2>;
9461e0caac9e4c jason-ch chen              2023-10-23   925  		compatible = "simple-bus";
ad9d9e158ba0a1 Fei Shao                   2024-10-01   926  		dma-ranges = <0x0 0x0 0x0 0x0 0x4 0x0>;
9461e0caac9e4c jason-ch chen              2023-10-23   927  		ranges;
9461e0caac9e4c jason-ch chen              2023-10-23   928  
3bbae49ea02862 Fei Shao                   2024-09-11   929  		performance: performance-controller@11bc10 {
3bbae49ea02862 Fei Shao                   2024-09-11   930  			compatible = "mediatek,cpufreq-hw";
3bbae49ea02862 Fei Shao                   2024-09-11   931  			reg = <0 0x0011bc10 0 0x120>, <0 0x0011bd30 0 0x120>;
3bbae49ea02862 Fei Shao                   2024-09-11   932  			#performance-domain-cells = <1>;
3bbae49ea02862 Fei Shao                   2024-09-11   933  		};
3bbae49ea02862 Fei Shao                   2024-09-11   934  
9461e0caac9e4c jason-ch chen              2023-10-23   935  		gic: interrupt-controller@c000000 {
9461e0caac9e4c jason-ch chen              2023-10-23   936  			compatible = "arm,gic-v3";
9461e0caac9e4c jason-ch chen              2023-10-23   937  			#interrupt-cells = <4>;
9461e0caac9e4c jason-ch chen              2023-10-23   938  			#redistributor-regions = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23   939  			interrupt-parent = <&gic>;
9461e0caac9e4c jason-ch chen              2023-10-23   940  			interrupt-controller;
9461e0caac9e4c jason-ch chen              2023-10-23   941  			reg = <0 0x0c000000 0 0x40000>,
9461e0caac9e4c jason-ch chen              2023-10-23   942  			      <0 0x0c040000 0 0x200000>;
9461e0caac9e4c jason-ch chen              2023-10-23   943  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23   944  
9461e0caac9e4c jason-ch chen              2023-10-23   945  			ppi-partitions {
9461e0caac9e4c jason-ch chen              2023-10-23   946  				ppi_cluster0: interrupt-partition-0 {
9461e0caac9e4c jason-ch chen              2023-10-23   947  					affinity = <&cpu0 &cpu1 &cpu2 &cpu3 &cpu4 &cpu5>;
9461e0caac9e4c jason-ch chen              2023-10-23   948  				};
9461e0caac9e4c jason-ch chen              2023-10-23   949  
9461e0caac9e4c jason-ch chen              2023-10-23   950  				ppi_cluster1: interrupt-partition-1 {
9461e0caac9e4c jason-ch chen              2023-10-23   951  					affinity = <&cpu6 &cpu7>;
9461e0caac9e4c jason-ch chen              2023-10-23   952  				};
9461e0caac9e4c jason-ch chen              2023-10-23   953  			};
9461e0caac9e4c jason-ch chen              2023-10-23   954  		};
9461e0caac9e4c jason-ch chen              2023-10-23   955  
9461e0caac9e4c jason-ch chen              2023-10-23   956  		topckgen: syscon@10000000 {
9461e0caac9e4c jason-ch chen              2023-10-23   957  			compatible = "mediatek,mt8188-topckgen", "syscon";
9461e0caac9e4c jason-ch chen              2023-10-23   958  			reg = <0 0x10000000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23   959  			#clock-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23   960  		};
9461e0caac9e4c jason-ch chen              2023-10-23   961  
9461e0caac9e4c jason-ch chen              2023-10-23   962  		infracfg_ao: syscon@10001000 {
9461e0caac9e4c jason-ch chen              2023-10-23   963  			compatible = "mediatek,mt8188-infracfg-ao", "syscon";
9461e0caac9e4c jason-ch chen              2023-10-23   964  			reg = <0 0x10001000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23   965  			#clock-cells = <1>;
d39aacd1021a3f Nicolas Pitre              2024-06-03   966  			#reset-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23   967  		};
9461e0caac9e4c jason-ch chen              2023-10-23   968  
9461e0caac9e4c jason-ch chen              2023-10-23   969  		pericfg: syscon@10003000 {
9461e0caac9e4c jason-ch chen              2023-10-23   970  			compatible = "mediatek,mt8188-pericfg", "syscon";
9461e0caac9e4c jason-ch chen              2023-10-23   971  			reg = <0 0x10003000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23   972  			#clock-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23   973  		};
9461e0caac9e4c jason-ch chen              2023-10-23   974  
9461e0caac9e4c jason-ch chen              2023-10-23   975  		pio: pinctrl@10005000 {
9461e0caac9e4c jason-ch chen              2023-10-23   976  			compatible = "mediatek,mt8188-pinctrl";
9461e0caac9e4c jason-ch chen              2023-10-23   977  			reg = <0 0x10005000 0 0x1000>,
9461e0caac9e4c jason-ch chen              2023-10-23   978  			      <0 0x11c00000 0 0x1000>,
9461e0caac9e4c jason-ch chen              2023-10-23   979  			      <0 0x11e10000 0 0x1000>,
9461e0caac9e4c jason-ch chen              2023-10-23   980  			      <0 0x11e20000 0 0x1000>,
9461e0caac9e4c jason-ch chen              2023-10-23   981  			      <0 0x11ea0000 0 0x1000>,
9461e0caac9e4c jason-ch chen              2023-10-23   982  			      <0 0x1000b000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23   983  			reg-names = "iocfg0", "iocfg_rm", "iocfg_lt",
9461e0caac9e4c jason-ch chen              2023-10-23   984  				    "iocfg_lm", "iocfg_rt", "eint";
9461e0caac9e4c jason-ch chen              2023-10-23   985  			gpio-controller;
9461e0caac9e4c jason-ch chen              2023-10-23   986  			#gpio-cells = <2>;
9461e0caac9e4c jason-ch chen              2023-10-23   987  			gpio-ranges = <&pio 0 0 176>;
9461e0caac9e4c jason-ch chen              2023-10-23   988  			interrupt-controller;
9461e0caac9e4c jason-ch chen              2023-10-23   989  			interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23   990  			#interrupt-cells = <2>;
9461e0caac9e4c jason-ch chen              2023-10-23   991  		};
9461e0caac9e4c jason-ch chen              2023-10-23   992  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27   993  		scpsys: syscon@10006000 {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27   994  			compatible = "mediatek,mt8188-scpsys", "syscon", "simple-mfd";
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27   995  			reg = <0 0x10006000 0 0x1000>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27   996  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27   997  			/* System Power Manager */
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27   998  			spm: power-controller {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27   999  				compatible = "mediatek,mt8188-power-controller";
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1000  				#address-cells = <1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1001  				#size-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1002  				#power-domain-cells = <1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1003  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1004  				/* power domain of the SoC */
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1005  				mfg0: power-domain@MT8188_POWER_DOMAIN_MFG0 {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1006  					reg = <MT8188_POWER_DOMAIN_MFG0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1007  					#address-cells = <1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1008  					#size-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1009  					#power-domain-cells = <1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1010  
4007651c25553b Pablo Sun                  2024-10-02  1011  					mfg1: power-domain@MT8188_POWER_DOMAIN_MFG1 {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1012  						reg = <MT8188_POWER_DOMAIN_MFG1>;
4007651c25553b Pablo Sun                  2024-10-02  1013  						clocks = <&apmixedsys CLK_APMIXED_MFGPLL>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1014  							 <&topckgen CLK_TOP_MFG_CORE_TMP>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1015  						clock-names = "mfg", "alt";
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1016  						mediatek,infracfg = <&infracfg_ao>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1017  						#address-cells = <1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1018  						#size-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1019  						#power-domain-cells = <1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1020  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1021  						power-domain@MT8188_POWER_DOMAIN_MFG2 {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1022  							reg = <MT8188_POWER_DOMAIN_MFG2>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1023  							#power-domain-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1024  						};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1025  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1026  						power-domain@MT8188_POWER_DOMAIN_MFG3 {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1027  							reg = <MT8188_POWER_DOMAIN_MFG3>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1028  							#power-domain-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1029  						};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1030  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1031  						power-domain@MT8188_POWER_DOMAIN_MFG4 {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1032  							reg = <MT8188_POWER_DOMAIN_MFG4>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1033  							#power-domain-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1034  						};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1035  					};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1036  				};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1037  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1038  				power-domain@MT8188_POWER_DOMAIN_VPPSYS0 {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1039  					reg = <MT8188_POWER_DOMAIN_VPPSYS0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1040  					clocks = <&topckgen CLK_TOP_VPP>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1041  						 <&topckgen CLK_TOP_CAM>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1042  						 <&topckgen CLK_TOP_CCU>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1043  						 <&topckgen CLK_TOP_IMG>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1044  						 <&topckgen CLK_TOP_VENC>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1045  						 <&topckgen CLK_TOP_VDEC>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1046  						 <&topckgen CLK_TOP_WPE_VPP>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1047  						 <&topckgen CLK_TOP_CFGREG_CLOCK_EN_VPP0>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1048  						 <&topckgen CLK_TOP_CFGREG_F26M_VPP0>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1049  						 <&vppsys0 CLK_VPP0_SMI_COMMON_MMSRAM>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1050  						 <&vppsys0 CLK_VPP0_GALS_VDO0_LARB0_MMSRAM>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1051  						 <&vppsys0 CLK_VPP0_GALS_VDO0_LARB1_MMSRAM>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1052  						 <&vppsys0 CLK_VPP0_GALS_VENCSYS_MMSRAM>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1053  						 <&vppsys0 CLK_VPP0_GALS_VENCSYS_CORE1_MMSRAM>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1054  						 <&vppsys0 CLK_VPP0_GALS_INFRA_MMSRAM>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1055  						 <&vppsys0 CLK_VPP0_GALS_CAMSYS_MMSRAM>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1056  						 <&vppsys0 CLK_VPP0_GALS_VPP1_LARB5_MMSRAM>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1057  						 <&vppsys0 CLK_VPP0_GALS_VPP1_LARB6_MMSRAM>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1058  						 <&vppsys0 CLK_VPP0_SMI_REORDER_MMSRAM>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1059  						 <&vppsys0 CLK_VPP0_SMI_IOMMU>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1060  						 <&vppsys0 CLK_VPP0_GALS_IMGSYS_CAMSYS>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1061  						 <&vppsys0 CLK_VPP0_GALS_EMI0_EMI1>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1062  						 <&vppsys0 CLK_VPP0_SMI_SUB_COMMON_REORDER>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1063  						 <&vppsys0 CLK_VPP0_SMI_RSI>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1064  						 <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1065  						 <&vppsys0 CLK_VPP0_GALS_VDEC_VDEC_CORE1>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1066  						 <&vppsys0 CLK_VPP0_GALS_VPP1_WPESYS>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1067  						 <&vppsys0 CLK_VPP0_GALS_VDO0_VDO1_VENCSYS_CORE1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1068  					clock-names = "top", "cam", "ccu", "img", "venc",
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1069  						      "vdec", "wpe", "cfgck", "cfgxo",
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1070  						      "ss-sram-cmn", "ss-sram-v0l0", "ss-sram-v0l1",
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1071  						      "ss-sram-ve0", "ss-sram-ve1", "ss-sram-ifa",
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1072  						      "ss-sram-cam", "ss-sram-v1l5", "ss-sram-v1l6",
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1073  						      "ss-sram-rdr", "ss-iommu", "ss-imgcam",
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1074  						      "ss-emi", "ss-subcmn-rdr", "ss-rsi",
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1075  						      "ss-cmn-l4", "ss-vdec1", "ss-wpe",
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1076  						      "ss-cvdo-ve1";
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1077  					mediatek,infracfg = <&infracfg_ao>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1078  					#address-cells = <1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1079  					#size-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1080  					#power-domain-cells = <1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1081  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1082  					power-domain@MT8188_POWER_DOMAIN_VDOSYS0 {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1083  						reg = <MT8188_POWER_DOMAIN_VDOSYS0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1084  						clocks = <&topckgen CLK_TOP_CFGREG_CLOCK_EN_VDO0>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1085  							 <&topckgen CLK_TOP_CFGREG_F26M_VDO0>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1086  							 <&vdosys0 CLK_VDO0_SMI_GALS>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1087  							 <&vdosys0 CLK_VDO0_SMI_COMMON>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1088  							 <&vdosys0 CLK_VDO0_SMI_EMI>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1089  							 <&vdosys0 CLK_VDO0_SMI_IOMMU>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1090  							 <&vdosys0 CLK_VDO0_SMI_LARB>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1091  							 <&vdosys0 CLK_VDO0_SMI_RSI>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1092  							 <&vdosys0 CLK_VDO0_APB_BUS>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1093  						clock-names = "cfgck", "cfgxo", "ss-gals",
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1094  							      "ss-cmn", "ss-emi", "ss-iommu",
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1095  							      "ss-larb", "ss-rsi", "ss-bus";
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1096  						mediatek,infracfg = <&infracfg_ao>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1097  						#address-cells = <1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1098  						#size-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1099  						#power-domain-cells = <1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1100  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1101  						power-domain@MT8188_POWER_DOMAIN_VPPSYS1 {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1102  							reg = <MT8188_POWER_DOMAIN_VPPSYS1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1103  							clocks = <&topckgen CLK_TOP_CFGREG_CLOCK_EN_VPP1>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1104  								 <&topckgen CLK_TOP_CFGREG_F26M_VPP1>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1105  								 <&vppsys1 CLK_VPP1_GALS5>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1106  								 <&vppsys1 CLK_VPP1_GALS6>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1107  								 <&vppsys1 CLK_VPP1_LARB5>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1108  								 <&vppsys1 CLK_VPP1_LARB6>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1109  							clock-names = "cfgck", "cfgxo",
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1110  								      "ss-vpp1-g5", "ss-vpp1-g6",
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1111  								      "ss-vpp1-l5", "ss-vpp1-l6";
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1112  							mediatek,infracfg = <&infracfg_ao>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1113  							#power-domain-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1114  						};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1115  
66c466dae8a620 Fei Shao                   2024-10-01  1116  						power-domain@MT8188_POWER_DOMAIN_VDEC0 {
66c466dae8a620 Fei Shao                   2024-10-01  1117  							reg = <MT8188_POWER_DOMAIN_VDEC0>;
66c466dae8a620 Fei Shao                   2024-10-01  1118  							clocks = <&vdecsys_soc CLK_VDEC1_SOC_LARB1>;
66c466dae8a620 Fei Shao                   2024-10-01  1119  							clock-names = "ss-vdec1-soc-l1";
66c466dae8a620 Fei Shao                   2024-10-01  1120  							mediatek,infracfg = <&infracfg_ao>;
66c466dae8a620 Fei Shao                   2024-10-01  1121  							#address-cells = <1>;
66c466dae8a620 Fei Shao                   2024-10-01  1122  							#size-cells = <0>;
66c466dae8a620 Fei Shao                   2024-10-01  1123  							#power-domain-cells = <1>;
66c466dae8a620 Fei Shao                   2024-10-01  1124  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1125  							power-domain@MT8188_POWER_DOMAIN_VDEC1 {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1126  								reg = <MT8188_POWER_DOMAIN_VDEC1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1127  								clocks = <&vdecsys CLK_VDEC2_LARB1>;
66c466dae8a620 Fei Shao                   2024-10-01  1128  								clock-names = "ss-vdec2-l1";
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1129  								mediatek,infracfg = <&infracfg_ao>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1130  								#power-domain-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1131  							};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1132  						};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1133  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1134  						cam_vcore: power-domain@MT8188_POWER_DOMAIN_CAM_VCORE {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1135  							reg = <MT8188_POWER_DOMAIN_CAM_VCORE>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1136  							clocks = <&topckgen CLK_TOP_CAM>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1137  								 <&topckgen CLK_TOP_CCU>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1138  								 <&topckgen CLK_TOP_CCU_AHB>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1139  								 <&topckgen CLK_TOP_CFGREG_CLOCK_ISP_AXI_GALS>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1140  							clock-names = "cam", "ccu", "bus", "cfgck";
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1141  							mediatek,infracfg = <&infracfg_ao>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1142  							#address-cells = <1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1143  							#size-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1144  							#power-domain-cells = <1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1145  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1146  							power-domain@MT8188_POWER_DOMAIN_CAM_MAIN {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1147  								reg = <MT8188_POWER_DOMAIN_CAM_MAIN>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1148  								clocks = <&camsys CLK_CAM_MAIN_LARB13>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1149  									 <&camsys CLK_CAM_MAIN_LARB14>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1150  									 <&camsys CLK_CAM_MAIN_CAM2MM0_GALS>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1151  									 <&camsys CLK_CAM_MAIN_CAM2MM1_GALS>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1152  									 <&camsys CLK_CAM_MAIN_CAM2SYS_GALS>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1153  								clock-names= "ss-cam-l13", "ss-cam-l14",
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1154  									     "ss-cam-mm0", "ss-cam-mm1",
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1155  									     "ss-camsys";
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1156  								mediatek,infracfg = <&infracfg_ao>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1157  								#address-cells = <1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1158  								#size-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1159  								#power-domain-cells = <1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1160  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1161  								power-domain@MT8188_POWER_DOMAIN_CAM_SUBB {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1162  									reg = <MT8188_POWER_DOMAIN_CAM_SUBB>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1163  									clocks = <&camsys CLK_CAM_MAIN_CAM_SUBB>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1164  										 <&camsys_rawb CLK_CAM_RAWB_LARBX>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1165  										 <&camsys_yuvb CLK_CAM_YUVB_LARBX>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1166  									clock-names = "ss-camb-sub",
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1167  										      "ss-camb-raw",
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1168  										      "ss-camb-yuv";
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1169  									#power-domain-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1170  								};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1171  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1172  								power-domain@MT8188_POWER_DOMAIN_CAM_SUBA {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1173  									reg =<MT8188_POWER_DOMAIN_CAM_SUBA>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1174  									clocks = <&camsys CLK_CAM_MAIN_CAM_SUBA>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1175  										 <&camsys_rawa CLK_CAM_RAWA_LARBX>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1176  										 <&camsys_yuva CLK_CAM_YUVA_LARBX>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1177  									clock-names = "ss-cama-sub",
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1178  										      "ss-cama-raw",
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1179  										      "ss-cama-yuv";
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1180  									#power-domain-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1181  								};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1182  							};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1183  						};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1184  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1185  						power-domain@MT8188_POWER_DOMAIN_VDOSYS1 {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1186  							reg = <MT8188_POWER_DOMAIN_VDOSYS1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1187  							clocks = <&topckgen CLK_TOP_CFGREG_CLOCK_EN_VDO1>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1188  								 <&topckgen CLK_TOP_CFGREG_F26M_VDO1>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1189  								 <&vdosys1 CLK_VDO1_SMI_LARB2>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1190  								 <&vdosys1 CLK_VDO1_SMI_LARB3>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1191  								 <&vdosys1 CLK_VDO1_GALS>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1192  							clock-names = "cfgck", "cfgxo", "ss-larb2",
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1193  								      "ss-larb3", "ss-gals";
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1194  							mediatek,infracfg = <&infracfg_ao>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1195  							#address-cells = <1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1196  							#size-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1197  							#power-domain-cells = <1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1198  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1199  							power-domain@MT8188_POWER_DOMAIN_HDMI_TX {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1200  								reg = <MT8188_POWER_DOMAIN_HDMI_TX>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1201  								clocks = <&topckgen CLK_TOP_HDMI_APB>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1202  									 <&topckgen CLK_TOP_HDCP_24M>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1203  								clock-names = "bus", "hdcp";
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1204  								mediatek,infracfg = <&infracfg_ao>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1205  								#power-domain-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1206  							};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1207  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1208  							power-domain@MT8188_POWER_DOMAIN_DP_TX {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1209  								reg = <MT8188_POWER_DOMAIN_DP_TX>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1210  								mediatek,infracfg = <&infracfg_ao>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1211  								#power-domain-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1212  							};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1213  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1214  							power-domain@MT8188_POWER_DOMAIN_EDP_TX {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1215  								reg = <MT8188_POWER_DOMAIN_EDP_TX>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1216  								mediatek,infracfg = <&infracfg_ao>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1217  								#power-domain-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1218  							};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1219  						};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1220  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1221  						power-domain@MT8188_POWER_DOMAIN_VENC {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1222  							reg = <MT8188_POWER_DOMAIN_VENC>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1223  							clocks = <&vencsys CLK_VENC1_LARB>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1224  								 <&vencsys CLK_VENC1_VENC>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1225  								 <&vencsys CLK_VENC1_GALS>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1226  								 <&vencsys CLK_VENC1_GALS_SRAM>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1227  							clock-names = "ss-ve1-larb", "ss-ve1-core",
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1228  								      "ss-ve1-gals", "ss-ve1-sram";
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1229  							mediatek,infracfg = <&infracfg_ao>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1230  							#power-domain-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1231  						};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1232  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1233  						power-domain@MT8188_POWER_DOMAIN_WPE {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1234  							reg = <MT8188_POWER_DOMAIN_WPE>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1235  							clocks = <&wpesys CLK_WPE_TOP_SMI_LARB7>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1236  								 <&wpesys CLK_WPE_TOP_SMI_LARB7_PCLK_EN>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1237  							clock-names = "ss-wpe-l7", "ss-wpe-l7pce";
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1238  							mediatek,infracfg = <&infracfg_ao>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1239  							#power-domain-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1240  						};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1241  					};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1242  				};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1243  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1244  				power-domain@MT8188_POWER_DOMAIN_PEXTP_MAC_P0 {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1245  					reg = <MT8188_POWER_DOMAIN_PEXTP_MAC_P0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1246  					mediatek,infracfg = <&infracfg_ao>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1247  					clocks = <&pericfg_ao CLK_PERI_AO_PCIE_P0_FMEM>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1248  					clock-names = "ss-pextp-fmem";
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1249  					#power-domain-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1250  				};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1251  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1252  				power-domain@MT8188_POWER_DOMAIN_CSIRX_TOP {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1253  					reg = <MT8188_POWER_DOMAIN_CSIRX_TOP>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1254  					clocks = <&topckgen CLK_TOP_SENINF>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1255  						 <&topckgen CLK_TOP_SENINF1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1256  					clock-names = "seninf0", "seninf1";
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1257  					#power-domain-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1258  				};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1259  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1260  				power-domain@MT8188_POWER_DOMAIN_PEXTP_PHY_TOP {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1261  					reg = <MT8188_POWER_DOMAIN_PEXTP_PHY_TOP>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1262  					#power-domain-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1263  				};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1264  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1265  				power-domain@MT8188_POWER_DOMAIN_ADSP_AO {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1266  					reg = <MT8188_POWER_DOMAIN_ADSP_AO>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1267  					clocks = <&topckgen CLK_TOP_AUDIO_LOCAL_BUS>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1268  						 <&topckgen CLK_TOP_ADSP>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1269  					clock-names = "bus", "main";
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1270  					mediatek,infracfg = <&infracfg_ao>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1271  					#address-cells = <1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1272  					#size-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1273  					#power-domain-cells = <1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1274  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1275  					power-domain@MT8188_POWER_DOMAIN_ADSP_INFRA {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1276  						reg = <MT8188_POWER_DOMAIN_ADSP_INFRA>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1277  						mediatek,infracfg = <&infracfg_ao>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1278  						#address-cells = <1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1279  						#size-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1280  						#power-domain-cells = <1>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1281  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1282  						power-domain@MT8188_POWER_DOMAIN_AUDIO_ASRC {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1283  							reg = <MT8188_POWER_DOMAIN_AUDIO_ASRC>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1284  							clocks = <&topckgen CLK_TOP_ASM_H>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1285  							clock-names = "asm";
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1286  							mediatek,infracfg = <&infracfg_ao>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1287  							#power-domain-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1288  						};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1289  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1290  						power-domain@MT8188_POWER_DOMAIN_AUDIO {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1291  							reg = <MT8188_POWER_DOMAIN_AUDIO>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1292  							clocks = <&topckgen CLK_TOP_A1SYS_HP>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1293  								 <&topckgen CLK_TOP_AUD_INTBUS>,
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1294  								 <&adsp_audio26m CLK_AUDIODSP_AUDIO26M>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1295  							clock-names = "a1sys", "intbus", "adspck";
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1296  							mediatek,infracfg = <&infracfg_ao>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1297  							#power-domain-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1298  						};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1299  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1300  						power-domain@MT8188_POWER_DOMAIN_ADSP {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1301  							reg = <MT8188_POWER_DOMAIN_ADSP>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1302  							mediatek,infracfg = <&infracfg_ao>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1303  							#power-domain-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1304  						};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1305  					};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1306  				};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1307  
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1308  				power-domain@MT8188_POWER_DOMAIN_ETHER {
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1309  					reg = <MT8188_POWER_DOMAIN_ETHER>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1310  					clocks = <&pericfg_ao CLK_PERI_AO_ETHERNET_MAC>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1311  					clock-names = "ethermac";
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1312  					mediatek,infracfg = <&infracfg_ao>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1313  					#power-domain-cells = <0>;
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1314  				};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1315  			};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1316  		};
eaf73e4224a348 AngeloGioacchino Del Regno 2024-05-27  1317  
9461e0caac9e4c jason-ch chen              2023-10-23  1318  		watchdog: watchdog@10007000 {
9461e0caac9e4c jason-ch chen              2023-10-23  1319  			compatible = "mediatek,mt8188-wdt";
9461e0caac9e4c jason-ch chen              2023-10-23  1320  			reg = <0 0x10007000 0 0x100>;
9461e0caac9e4c jason-ch chen              2023-10-23  1321  			mediatek,disable-extrst;
9461e0caac9e4c jason-ch chen              2023-10-23  1322  			#reset-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  1323  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1324  
9461e0caac9e4c jason-ch chen              2023-10-23  1325  		apmixedsys: syscon@1000c000 {
9461e0caac9e4c jason-ch chen              2023-10-23  1326  			compatible = "mediatek,mt8188-apmixedsys", "syscon";
9461e0caac9e4c jason-ch chen              2023-10-23  1327  			reg = <0 0x1000c000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  1328  			#clock-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  1329  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1330  
9461e0caac9e4c jason-ch chen              2023-10-23  1331  		systimer: timer@10017000 {
9461e0caac9e4c jason-ch chen              2023-10-23  1332  			compatible = "mediatek,mt8188-timer", "mediatek,mt6765-timer";
9461e0caac9e4c jason-ch chen              2023-10-23  1333  			reg = <0 0x10017000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  1334  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1335  			clocks = <&clk13m>;
9461e0caac9e4c jason-ch chen              2023-10-23  1336  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1337  
9461e0caac9e4c jason-ch chen              2023-10-23  1338  		pwrap: pwrap@10024000 {
9461e0caac9e4c jason-ch chen              2023-10-23  1339  			compatible = "mediatek,mt8188-pwrap", "mediatek,mt8195-pwrap", "syscon";
9461e0caac9e4c jason-ch chen              2023-10-23  1340  			reg = <0 0x10024000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  1341  			reg-names = "pwrap";
9461e0caac9e4c jason-ch chen              2023-10-23  1342  			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1343  			clocks = <&infracfg_ao CLK_INFRA_AO_PMIC_AP>,
9461e0caac9e4c jason-ch chen              2023-10-23  1344  				 <&infracfg_ao CLK_INFRA_AO_PMIC_TMR>;
9461e0caac9e4c jason-ch chen              2023-10-23  1345  			clock-names = "spi", "wrap";
9461e0caac9e4c jason-ch chen              2023-10-23  1346  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1347  
86bc9aefaef719 Fei Shao                   2024-09-11  1348  		spmi: spmi@10027000 {
86bc9aefaef719 Fei Shao                   2024-09-11  1349  			compatible = "mediatek,mt8188-spmi", "mediatek,mt8195-spmi";
86bc9aefaef719 Fei Shao                   2024-09-11  1350  			reg = <0 0x10027000 0 0xe00>, <0 0x10029000 0 0x100>;
86bc9aefaef719 Fei Shao                   2024-09-11  1351  			reg-names = "pmif", "spmimst";
86bc9aefaef719 Fei Shao                   2024-09-11  1352  			assigned-clocks = <&topckgen CLK_TOP_SPMI_M_MST>;
86bc9aefaef719 Fei Shao                   2024-09-11  1353  			assigned-clock-parents = <&topckgen CLK_TOP_ULPOSC1_D10>;
86bc9aefaef719 Fei Shao                   2024-09-11  1354  			clocks = <&infracfg_ao CLK_INFRA_AO_PMIC_AP>,
86bc9aefaef719 Fei Shao                   2024-09-11  1355  				 <&infracfg_ao CLK_INFRA_AO_PMIC_TMR>,
86bc9aefaef719 Fei Shao                   2024-09-11  1356  				 <&topckgen CLK_TOP_SPMI_M_MST>;
86bc9aefaef719 Fei Shao                   2024-09-11  1357  			clock-names = "pmif_sys_ck", "pmif_tmr_ck", "spmimst_clk_mux";
86bc9aefaef719 Fei Shao                   2024-09-11  1358  		};
86bc9aefaef719 Fei Shao                   2024-09-11  1359  
43fc1bd08e5bc5 Fei Shao                   2024-09-11  1360  		infra_iommu: iommu@10315000 {
43fc1bd08e5bc5 Fei Shao                   2024-09-11  1361  			compatible = "mediatek,mt8188-iommu-infra";
43fc1bd08e5bc5 Fei Shao                   2024-09-11  1362  			reg = <0 0x10315000 0 0x1000>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  1363  			interrupts = <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH 0>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  1364  			#iommu-cells = <1>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  1365  		};
43fc1bd08e5bc5 Fei Shao                   2024-09-11  1366  
45682a4fffdd9a AngeloGioacchino Del Regno 2024-05-27  1367  		gce0: mailbox@10320000 {
45682a4fffdd9a AngeloGioacchino Del Regno 2024-05-27  1368  			compatible = "mediatek,mt8188-gce";
45682a4fffdd9a AngeloGioacchino Del Regno 2024-05-27  1369  			reg = <0 0x10320000 0 0x4000>;
45682a4fffdd9a AngeloGioacchino Del Regno 2024-05-27  1370  			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH 0>;
45682a4fffdd9a AngeloGioacchino Del Regno 2024-05-27  1371  			#mbox-cells = <2>;
45682a4fffdd9a AngeloGioacchino Del Regno 2024-05-27  1372  			clocks = <&infracfg_ao CLK_INFRA_AO_GCE>;
45682a4fffdd9a AngeloGioacchino Del Regno 2024-05-27  1373  		};
45682a4fffdd9a AngeloGioacchino Del Regno 2024-05-27  1374  
45682a4fffdd9a AngeloGioacchino Del Regno 2024-05-27  1375  		gce1: mailbox@10330000 {
45682a4fffdd9a AngeloGioacchino Del Regno 2024-05-27  1376  			compatible = "mediatek,mt8188-gce";
45682a4fffdd9a AngeloGioacchino Del Regno 2024-05-27  1377  			reg = <0 0x10330000 0 0x4000>;
45682a4fffdd9a AngeloGioacchino Del Regno 2024-05-27  1378  			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH 0>;
45682a4fffdd9a AngeloGioacchino Del Regno 2024-05-27  1379  			#mbox-cells = <2>;
45682a4fffdd9a AngeloGioacchino Del Regno 2024-05-27  1380  			clocks = <&infracfg_ao CLK_INFRA_AO_GCE2>;
45682a4fffdd9a AngeloGioacchino Del Regno 2024-05-27  1381  		};
45682a4fffdd9a AngeloGioacchino Del Regno 2024-05-27  1382  
9461e0caac9e4c jason-ch chen              2023-10-23  1383  		scp: scp@10500000 {
9461e0caac9e4c jason-ch chen              2023-10-23  1384  			compatible = "mediatek,mt8188-scp";
9461e0caac9e4c jason-ch chen              2023-10-23  1385  			reg = <0 0x10500000 0 0x100000>,
9461e0caac9e4c jason-ch chen              2023-10-23  1386  			      <0 0x10720000 0 0xe0000>;
9461e0caac9e4c jason-ch chen              2023-10-23  1387  			reg-names = "sram", "cfg";
9461e0caac9e4c jason-ch chen              2023-10-23  1388  			interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1389  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1390  
bd568ce198b85c Fei Shao                   2024-09-11  1391  		afe: audio-controller@10b10000 {
bd568ce198b85c Fei Shao                   2024-09-11  1392  			compatible = "mediatek,mt8188-afe";
bd568ce198b85c Fei Shao                   2024-09-11  1393  			reg = <0 0x10b10000 0 0x10000>;
bd568ce198b85c Fei Shao                   2024-09-11  1394  			assigned-clocks = <&topckgen CLK_TOP_A1SYS_HP>;
bd568ce198b85c Fei Shao                   2024-09-11  1395  			assigned-clock-parents =  <&clk26m>;
bd568ce198b85c Fei Shao                   2024-09-11  1396  			clocks = <&clk26m>,
bd568ce198b85c Fei Shao                   2024-09-11  1397  				 <&apmixedsys CLK_APMIXED_APLL1>,
bd568ce198b85c Fei Shao                   2024-09-11  1398  				 <&apmixedsys CLK_APMIXED_APLL2>,
bd568ce198b85c Fei Shao                   2024-09-11  1399  				 <&topckgen CLK_TOP_APLL12_CK_DIV0>,
bd568ce198b85c Fei Shao                   2024-09-11  1400  				 <&topckgen CLK_TOP_APLL12_CK_DIV1>,
bd568ce198b85c Fei Shao                   2024-09-11  1401  				 <&topckgen CLK_TOP_APLL12_CK_DIV2>,
bd568ce198b85c Fei Shao                   2024-09-11  1402  				 <&topckgen CLK_TOP_APLL12_CK_DIV3>,
bd568ce198b85c Fei Shao                   2024-09-11  1403  				 <&topckgen CLK_TOP_APLL12_CK_DIV9>,
bd568ce198b85c Fei Shao                   2024-09-11  1404  				 <&topckgen CLK_TOP_A1SYS_HP>,
bd568ce198b85c Fei Shao                   2024-09-11  1405  				 <&topckgen CLK_TOP_AUD_INTBUS>,
bd568ce198b85c Fei Shao                   2024-09-11  1406  				 <&topckgen CLK_TOP_AUDIO_H>,
bd568ce198b85c Fei Shao                   2024-09-11  1407  				 <&topckgen CLK_TOP_AUDIO_LOCAL_BUS>,
bd568ce198b85c Fei Shao                   2024-09-11  1408  				 <&topckgen CLK_TOP_DPTX>,
bd568ce198b85c Fei Shao                   2024-09-11  1409  				 <&topckgen CLK_TOP_I2SO1>,
bd568ce198b85c Fei Shao                   2024-09-11  1410  				 <&topckgen CLK_TOP_I2SO2>,
bd568ce198b85c Fei Shao                   2024-09-11  1411  				 <&topckgen CLK_TOP_I2SI1>,
bd568ce198b85c Fei Shao                   2024-09-11  1412  				 <&topckgen CLK_TOP_I2SI2>,
bd568ce198b85c Fei Shao                   2024-09-11  1413  				 <&adsp_audio26m CLK_AUDIODSP_AUDIO26M>,
bd568ce198b85c Fei Shao                   2024-09-11  1414  				 <&topckgen CLK_TOP_APLL1_D4>,
bd568ce198b85c Fei Shao                   2024-09-11  1415  				 <&topckgen CLK_TOP_APLL2_D4>,
bd568ce198b85c Fei Shao                   2024-09-11  1416  				 <&topckgen CLK_TOP_APLL12_CK_DIV4>,
bd568ce198b85c Fei Shao                   2024-09-11  1417  				 <&topckgen CLK_TOP_A2SYS>,
bd568ce198b85c Fei Shao                   2024-09-11  1418  				 <&topckgen CLK_TOP_AUD_IEC>;
bd568ce198b85c Fei Shao                   2024-09-11  1419  			clock-names = "clk26m",
bd568ce198b85c Fei Shao                   2024-09-11  1420  				      "apll1",
bd568ce198b85c Fei Shao                   2024-09-11  1421  				      "apll2",
bd568ce198b85c Fei Shao                   2024-09-11  1422  				      "apll12_div0",
bd568ce198b85c Fei Shao                   2024-09-11  1423  				      "apll12_div1",
bd568ce198b85c Fei Shao                   2024-09-11  1424  				      "apll12_div2",
bd568ce198b85c Fei Shao                   2024-09-11  1425  				      "apll12_div3",
bd568ce198b85c Fei Shao                   2024-09-11  1426  				      "apll12_div9",
bd568ce198b85c Fei Shao                   2024-09-11  1427  				      "top_a1sys_hp",
bd568ce198b85c Fei Shao                   2024-09-11  1428  				      "top_aud_intbus",
bd568ce198b85c Fei Shao                   2024-09-11  1429  				      "top_audio_h",
bd568ce198b85c Fei Shao                   2024-09-11  1430  				      "top_audio_local_bus",
bd568ce198b85c Fei Shao                   2024-09-11  1431  				      "top_dptx",
bd568ce198b85c Fei Shao                   2024-09-11  1432  				      "top_i2so1",
bd568ce198b85c Fei Shao                   2024-09-11  1433  				      "top_i2so2",
bd568ce198b85c Fei Shao                   2024-09-11  1434  				      "top_i2si1",
bd568ce198b85c Fei Shao                   2024-09-11  1435  				      "top_i2si2",
bd568ce198b85c Fei Shao                   2024-09-11  1436  				      "adsp_audio_26m",
bd568ce198b85c Fei Shao                   2024-09-11  1437  				      "apll1_d4",
bd568ce198b85c Fei Shao                   2024-09-11  1438  				      "apll2_d4",
bd568ce198b85c Fei Shao                   2024-09-11  1439  				      "apll12_div4",
bd568ce198b85c Fei Shao                   2024-09-11  1440  				      "top_a2sys",
bd568ce198b85c Fei Shao                   2024-09-11  1441  				      "top_aud_iec";
bd568ce198b85c Fei Shao                   2024-09-11  1442  			interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
bd568ce198b85c Fei Shao                   2024-09-11  1443  			power-domains = <&spm MT8188_POWER_DOMAIN_AUDIO>;
bd568ce198b85c Fei Shao                   2024-09-11  1444  			resets = <&watchdog MT8188_TOPRGU_AUDIO_SW_RST>;
bd568ce198b85c Fei Shao                   2024-09-11  1445  			reset-names = "audiosys";
bd568ce198b85c Fei Shao                   2024-09-11  1446  			mediatek,infracfg = <&infracfg_ao>;
bd568ce198b85c Fei Shao                   2024-09-11  1447  			mediatek,topckgen = <&topckgen>;
bd568ce198b85c Fei Shao                   2024-09-11  1448  			status = "disabled";
bd568ce198b85c Fei Shao                   2024-09-11  1449  		};
bd568ce198b85c Fei Shao                   2024-09-11  1450  
bd568ce198b85c Fei Shao                   2024-09-11  1451  		adsp: adsp@10b80000 {
bd568ce198b85c Fei Shao                   2024-09-11  1452  			compatible = "mediatek,mt8188-dsp";
bd568ce198b85c Fei Shao                   2024-09-11  1453  			reg = <0 0x10b80000 0 0x2000>,
bd568ce198b85c Fei Shao                   2024-09-11  1454  			      <0 0x10d00000 0 0x80000>,
bd568ce198b85c Fei Shao                   2024-09-11  1455  			      <0 0x10b8b000 0 0x100>,
bd568ce198b85c Fei Shao                   2024-09-11  1456  			      <0 0x10b8f000 0 0x1000>;
bd568ce198b85c Fei Shao                   2024-09-11  1457  			reg-names = "cfg", "sram", "sec", "bus";
bd568ce198b85c Fei Shao                   2024-09-11  1458  			assigned-clocks = <&topckgen CLK_TOP_ADSP>;
bd568ce198b85c Fei Shao                   2024-09-11  1459  			clocks = <&topckgen CLK_TOP_ADSP>,
bd568ce198b85c Fei Shao                   2024-09-11  1460  				 <&topckgen CLK_TOP_AUDIO_LOCAL_BUS>;
bd568ce198b85c Fei Shao                   2024-09-11  1461  			clock-names = "audiodsp", "adsp_bus";
bd568ce198b85c Fei Shao                   2024-09-11  1462  			mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
bd568ce198b85c Fei Shao                   2024-09-11  1463  			mbox-names = "rx", "tx";
bd568ce198b85c Fei Shao                   2024-09-11  1464  			power-domains = <&spm MT8188_POWER_DOMAIN_ADSP>;
bd568ce198b85c Fei Shao                   2024-09-11  1465  			status = "disabled";
bd568ce198b85c Fei Shao                   2024-09-11  1466  		};
bd568ce198b85c Fei Shao                   2024-09-11  1467  
bd568ce198b85c Fei Shao                   2024-09-11  1468  		adsp_mailbox0: mailbox@10b86100 {
bd568ce198b85c Fei Shao                   2024-09-11  1469  			compatible = "mediatek,mt8188-adsp-mbox", "mediatek,mt8186-adsp-mbox";
bd568ce198b85c Fei Shao                   2024-09-11  1470  			reg = <0 0x10b86100 0 0x1000>;
bd568ce198b85c Fei Shao                   2024-09-11  1471  			interrupts = <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH 0>;
bd568ce198b85c Fei Shao                   2024-09-11  1472  			#mbox-cells = <0>;
bd568ce198b85c Fei Shao                   2024-09-11  1473  		};
bd568ce198b85c Fei Shao                   2024-09-11  1474  
bd568ce198b85c Fei Shao                   2024-09-11  1475  		adsp_mailbox1: mailbox@10b87100 {
bd568ce198b85c Fei Shao                   2024-09-11  1476  			compatible = "mediatek,mt8188-adsp-mbox", "mediatek,mt8186-adsp-mbox";
bd568ce198b85c Fei Shao                   2024-09-11  1477  			reg = <0 0x10b87100 0 0x1000>;
bd568ce198b85c Fei Shao                   2024-09-11  1478  			interrupts = <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH 0>;
bd568ce198b85c Fei Shao                   2024-09-11  1479  			#mbox-cells = <0>;
bd568ce198b85c Fei Shao                   2024-09-11  1480  		};
bd568ce198b85c Fei Shao                   2024-09-11  1481  
9461e0caac9e4c jason-ch chen              2023-10-23  1482  		adsp_audio26m: clock-controller@10b91100 {
9461e0caac9e4c jason-ch chen              2023-10-23  1483  			compatible = "mediatek,mt8188-adsp-audio26m";
9461e0caac9e4c jason-ch chen              2023-10-23  1484  			reg = <0 0x10b91100 0 0x100>;
9461e0caac9e4c jason-ch chen              2023-10-23  1485  			#clock-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  1486  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1487  
9461e0caac9e4c jason-ch chen              2023-10-23  1488  		uart0: serial@11001100 {
9461e0caac9e4c jason-ch chen              2023-10-23  1489  			compatible = "mediatek,mt8188-uart", "mediatek,mt6577-uart";
9461e0caac9e4c jason-ch chen              2023-10-23  1490  			reg = <0 0x11001100 0 0x100>;
9461e0caac9e4c jason-ch chen              2023-10-23  1491  			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1492  			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1493  			clock-names = "baud", "bus";
9461e0caac9e4c jason-ch chen              2023-10-23  1494  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  1495  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1496  
9461e0caac9e4c jason-ch chen              2023-10-23  1497  		uart1: serial@11001200 {
9461e0caac9e4c jason-ch chen              2023-10-23  1498  			compatible = "mediatek,mt8188-uart", "mediatek,mt6577-uart";
9461e0caac9e4c jason-ch chen              2023-10-23  1499  			reg = <0 0x11001200 0 0x100>;
9461e0caac9e4c jason-ch chen              2023-10-23  1500  			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1501  			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART1>;
9461e0caac9e4c jason-ch chen              2023-10-23  1502  			clock-names = "baud", "bus";
9461e0caac9e4c jason-ch chen              2023-10-23  1503  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  1504  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1505  
9461e0caac9e4c jason-ch chen              2023-10-23  1506  		uart2: serial@11001300 {
9461e0caac9e4c jason-ch chen              2023-10-23  1507  			compatible = "mediatek,mt8188-uart", "mediatek,mt6577-uart";
9461e0caac9e4c jason-ch chen              2023-10-23  1508  			reg = <0 0x11001300 0 0x100>;
9461e0caac9e4c jason-ch chen              2023-10-23  1509  			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1510  			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART2>;
9461e0caac9e4c jason-ch chen              2023-10-23  1511  			clock-names = "baud", "bus";
9461e0caac9e4c jason-ch chen              2023-10-23  1512  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  1513  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1514  
9461e0caac9e4c jason-ch chen              2023-10-23  1515  		uart3: serial@11001400 {
9461e0caac9e4c jason-ch chen              2023-10-23  1516  			compatible = "mediatek,mt8188-uart", "mediatek,mt6577-uart";
9461e0caac9e4c jason-ch chen              2023-10-23  1517  			reg = <0 0x11001400 0 0x100>;
9461e0caac9e4c jason-ch chen              2023-10-23  1518  			interrupts = <GIC_SPI 723 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1519  			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART3>;
9461e0caac9e4c jason-ch chen              2023-10-23  1520  			clock-names = "baud", "bus";
9461e0caac9e4c jason-ch chen              2023-10-23  1521  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  1522  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1523  
9461e0caac9e4c jason-ch chen              2023-10-23  1524  		auxadc: adc@11002000 {
9461e0caac9e4c jason-ch chen              2023-10-23  1525  			compatible = "mediatek,mt8188-auxadc", "mediatek,mt8173-auxadc";
9461e0caac9e4c jason-ch chen              2023-10-23  1526  			reg = <0 0x11002000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  1527  			clocks = <&infracfg_ao CLK_INFRA_AO_AUXADC>;
9461e0caac9e4c jason-ch chen              2023-10-23  1528  			clock-names = "main";
9461e0caac9e4c jason-ch chen              2023-10-23  1529  			#io-channel-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  1530  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  1531  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1532  
9461e0caac9e4c jason-ch chen              2023-10-23  1533  		pericfg_ao: syscon@11003000 {
9461e0caac9e4c jason-ch chen              2023-10-23  1534  			compatible = "mediatek,mt8188-pericfg-ao", "syscon";
9461e0caac9e4c jason-ch chen              2023-10-23  1535  			reg = <0 0x11003000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  1536  			#clock-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  1537  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1538  
9461e0caac9e4c jason-ch chen              2023-10-23  1539  		spi0: spi@1100a000 {
9461e0caac9e4c jason-ch chen              2023-10-23  1540  			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
9461e0caac9e4c jason-ch chen              2023-10-23  1541  			#address-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  1542  			#size-cells = <0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1543  			reg = <0 0x1100a000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  1544  			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1545  			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
9461e0caac9e4c jason-ch chen              2023-10-23  1546  				 <&topckgen CLK_TOP_SPI>,
9461e0caac9e4c jason-ch chen              2023-10-23  1547  				 <&infracfg_ao CLK_INFRA_AO_SPI0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1548  			clock-names = "parent-clk", "sel-clk", "spi-clk";
9461e0caac9e4c jason-ch chen              2023-10-23  1549  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  1550  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1551  
d39aacd1021a3f Nicolas Pitre              2024-06-03  1552  		lvts_ap: thermal-sensor@1100b000 {
d39aacd1021a3f Nicolas Pitre              2024-06-03  1553  			compatible = "mediatek,mt8188-lvts-ap";
d39aacd1021a3f Nicolas Pitre              2024-06-03  1554  			reg = <0 0x1100b000 0 0xc00>;
d39aacd1021a3f Nicolas Pitre              2024-06-03  1555  			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH 0>;
d39aacd1021a3f Nicolas Pitre              2024-06-03  1556  			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
d39aacd1021a3f Nicolas Pitre              2024-06-03  1557  			resets = <&infracfg_ao MT8188_INFRA_RST1_THERMAL_CTRL_RST>;
d39aacd1021a3f Nicolas Pitre              2024-06-03  1558  			nvmem-cells = <&lvts_efuse_data1>;
d39aacd1021a3f Nicolas Pitre              2024-06-03  1559  			nvmem-cell-names = "lvts-calib-data-1";
d39aacd1021a3f Nicolas Pitre              2024-06-03  1560  			#thermal-sensor-cells = <1>;
d39aacd1021a3f Nicolas Pitre              2024-06-03  1561  		};
d39aacd1021a3f Nicolas Pitre              2024-06-03  1562  
41eb8f7ad20694 Fei Shao                   2024-09-11  1563  		disp_pwm0: pwm@1100e000 {
41eb8f7ad20694 Fei Shao                   2024-09-11  1564  			compatible = "mediatek,mt8188-disp-pwm", "mediatek,mt8183-disp-pwm";
41eb8f7ad20694 Fei Shao                   2024-09-11  1565  			reg = <0 0x1100e000 0 0x1000>;
41eb8f7ad20694 Fei Shao                   2024-09-11  1566  			clocks = <&topckgen CLK_TOP_DISP_PWM0>,
41eb8f7ad20694 Fei Shao                   2024-09-11  1567  				 <&infracfg_ao CLK_INFRA_AO_DISP_PWM>;
41eb8f7ad20694 Fei Shao                   2024-09-11  1568  			clock-names = "main", "mm";
41eb8f7ad20694 Fei Shao                   2024-09-11  1569  			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH 0>;
41eb8f7ad20694 Fei Shao                   2024-09-11  1570  			#pwm-cells = <2>;
41eb8f7ad20694 Fei Shao                   2024-09-11  1571  			status = "disabled";
41eb8f7ad20694 Fei Shao                   2024-09-11  1572  		};
41eb8f7ad20694 Fei Shao                   2024-09-11  1573  
41eb8f7ad20694 Fei Shao                   2024-09-11  1574  		disp_pwm1: pwm@1100f000 {
41eb8f7ad20694 Fei Shao                   2024-09-11  1575  			compatible = "mediatek,mt8188-disp-pwm", "mediatek,mt8183-disp-pwm";
41eb8f7ad20694 Fei Shao                   2024-09-11  1576  			reg = <0 0x1100f000 0 0x1000>;
41eb8f7ad20694 Fei Shao                   2024-09-11  1577  			clocks = <&topckgen CLK_TOP_DISP_PWM1>,
41eb8f7ad20694 Fei Shao                   2024-09-11  1578  				 <&infracfg_ao CLK_INFRA_AO_DISP_PWM1>;
41eb8f7ad20694 Fei Shao                   2024-09-11  1579  			clock-names = "main", "mm";
41eb8f7ad20694 Fei Shao                   2024-09-11  1580  			interrupts = <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH 0>;
41eb8f7ad20694 Fei Shao                   2024-09-11  1581  			#pwm-cells = <2>;
41eb8f7ad20694 Fei Shao                   2024-09-11  1582  			status = "disabled";
41eb8f7ad20694 Fei Shao                   2024-09-11  1583  		};
41eb8f7ad20694 Fei Shao                   2024-09-11  1584  
9461e0caac9e4c jason-ch chen              2023-10-23  1585  		spi1: spi@11010000 {
9461e0caac9e4c jason-ch chen              2023-10-23  1586  			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
9461e0caac9e4c jason-ch chen              2023-10-23  1587  			#address-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  1588  			#size-cells = <0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1589  			reg = <0 0x11010000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  1590  			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1591  			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
9461e0caac9e4c jason-ch chen              2023-10-23  1592  				 <&topckgen CLK_TOP_SPI>,
9461e0caac9e4c jason-ch chen              2023-10-23  1593  				 <&infracfg_ao CLK_INFRA_AO_SPI1>;
9461e0caac9e4c jason-ch chen              2023-10-23  1594  			clock-names = "parent-clk", "sel-clk", "spi-clk";
9461e0caac9e4c jason-ch chen              2023-10-23  1595  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  1596  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1597  
9461e0caac9e4c jason-ch chen              2023-10-23  1598  		spi2: spi@11012000 {
9461e0caac9e4c jason-ch chen              2023-10-23  1599  			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
9461e0caac9e4c jason-ch chen              2023-10-23  1600  			#address-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  1601  			#size-cells = <0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1602  			reg = <0 0x11012000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  1603  			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1604  			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
9461e0caac9e4c jason-ch chen              2023-10-23  1605  				 <&topckgen CLK_TOP_SPI>,
9461e0caac9e4c jason-ch chen              2023-10-23  1606  				 <&infracfg_ao CLK_INFRA_AO_SPI2>;
9461e0caac9e4c jason-ch chen              2023-10-23  1607  			clock-names = "parent-clk", "sel-clk", "spi-clk";
9461e0caac9e4c jason-ch chen              2023-10-23  1608  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  1609  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1610  
9461e0caac9e4c jason-ch chen              2023-10-23  1611  		spi3: spi@11013000 {
9461e0caac9e4c jason-ch chen              2023-10-23  1612  			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
9461e0caac9e4c jason-ch chen              2023-10-23  1613  			#address-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  1614  			#size-cells = <0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1615  			reg = <0 0x11013000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  1616  			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1617  			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
9461e0caac9e4c jason-ch chen              2023-10-23  1618  				 <&topckgen CLK_TOP_SPI>,
9461e0caac9e4c jason-ch chen              2023-10-23  1619  				 <&infracfg_ao CLK_INFRA_AO_SPI3>;
9461e0caac9e4c jason-ch chen              2023-10-23  1620  			clock-names = "parent-clk", "sel-clk", "spi-clk";
9461e0caac9e4c jason-ch chen              2023-10-23  1621  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  1622  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1623  
9461e0caac9e4c jason-ch chen              2023-10-23  1624  		spi4: spi@11018000 {
9461e0caac9e4c jason-ch chen              2023-10-23  1625  			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
9461e0caac9e4c jason-ch chen              2023-10-23  1626  			#address-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  1627  			#size-cells = <0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1628  			reg = <0 0x11018000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  1629  			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1630  			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
9461e0caac9e4c jason-ch chen              2023-10-23  1631  				 <&topckgen CLK_TOP_SPI>,
9461e0caac9e4c jason-ch chen              2023-10-23  1632  				 <&infracfg_ao CLK_INFRA_AO_SPI4>;
9461e0caac9e4c jason-ch chen              2023-10-23  1633  			clock-names = "parent-clk", "sel-clk", "spi-clk";
9461e0caac9e4c jason-ch chen              2023-10-23  1634  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  1635  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1636  
9461e0caac9e4c jason-ch chen              2023-10-23  1637  		spi5: spi@11019000 {
9461e0caac9e4c jason-ch chen              2023-10-23  1638  			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
9461e0caac9e4c jason-ch chen              2023-10-23  1639  			#address-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  1640  			#size-cells = <0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1641  			reg = <0 0x11019000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  1642  			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1643  			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
9461e0caac9e4c jason-ch chen              2023-10-23  1644  				 <&topckgen CLK_TOP_SPI>,
9461e0caac9e4c jason-ch chen              2023-10-23  1645  				 <&infracfg_ao CLK_INFRA_AO_SPI5>;
9461e0caac9e4c jason-ch chen              2023-10-23  1646  			clock-names = "parent-clk", "sel-clk", "spi-clk";
9461e0caac9e4c jason-ch chen              2023-10-23  1647  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  1648  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1649  
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1650  		eth: ethernet@11021000 {
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1651  			compatible = "mediatek,mt8188-gmac", "mediatek,mt8195-gmac",
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1652  				     "snps,dwmac-5.10a";
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1653  			reg = <0 0x11021000 0 0x4000>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1654  			interrupts = <GIC_SPI 716 IRQ_TYPE_LEVEL_HIGH 0>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1655  			interrupt-names = "macirq";
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1656  			clocks = <&pericfg_ao CLK_PERI_AO_ETHERNET>,
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1657  				 <&pericfg_ao CLK_PERI_AO_ETHERNET_BUS>,
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1658  				 <&topckgen CLK_TOP_SNPS_ETH_250M>,
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1659  				 <&topckgen CLK_TOP_SNPS_ETH_62P4M_PTP>,
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1660  				 <&topckgen CLK_TOP_SNPS_ETH_50M_RMII>,
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1661  				 <&pericfg_ao CLK_PERI_AO_ETHERNET_MAC>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1662  			clock-names = "axi", "apb", "mac_main", "ptp_ref",
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1663  				      "rmii_internal", "mac_cg";
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1664  			assigned-clocks = <&topckgen CLK_TOP_SNPS_ETH_250M>,
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1665  					  <&topckgen CLK_TOP_SNPS_ETH_62P4M_PTP>,
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1666  					  <&topckgen CLK_TOP_SNPS_ETH_50M_RMII>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1667  			assigned-clock-parents = <&topckgen CLK_TOP_ETHPLL_D2>,
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1668  						 <&topckgen CLK_TOP_ETHPLL_D8>,
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1669  						 <&topckgen CLK_TOP_ETHPLL_D10>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1670  			power-domains = <&spm MT8188_POWER_DOMAIN_ETHER>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1671  			mediatek,pericfg = <&infracfg_ao>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1672  			snps,axi-config = <&stmmac_axi_setup>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1673  			snps,mtl-rx-config = <&mtl_rx_setup>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1674  			snps,mtl-tx-config = <&mtl_tx_setup>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1675  			snps,txpbl = <16>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1676  			snps,rxpbl = <16>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1677  			snps,clk-csr = <0>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1678  			status = "disabled";
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1679  
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1680  			eth_mdio: mdio {
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1681  				compatible = "snps,dwmac-mdio";
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1682  				#address-cells = <1>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1683  				#size-cells = <0>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1684  			};
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1685  
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1686  			stmmac_axi_setup: stmmac-axi-config {
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1687  				snps,blen = <0 0 0 0 16 8 4>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1688  				snps,rd_osr_lmt = <0x7>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1689  				snps,wr_osr_lmt = <0x7>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1690  			};
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1691  
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1692  			mtl_rx_setup: rx-queues-config {
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1693  				snps,rx-queues-to-use = <4>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1694  				snps,rx-sched-sp;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1695  
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1696  				queue0 {
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1697  					snps,dcb-algorithm;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1698  					snps,map-to-dma-channel = <0x0>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1699  				};
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1700  
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1701  				queue1 {
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1702  					snps,dcb-algorithm;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1703  					snps,map-to-dma-channel = <0x0>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1704  				};
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1705  
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1706  				queue2 {
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1707  					snps,dcb-algorithm;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1708  					snps,map-to-dma-channel = <0x0>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1709  				};
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1710  
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1711  				queue3 {
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1712  					snps,dcb-algorithm;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1713  					snps,map-to-dma-channel = <0x0>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1714  				};
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1715  			};
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1716  
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1717  			mtl_tx_setup: tx-queues-config {
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1718  				snps,tx-queues-to-use = <4>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1719  				snps,tx-sched-wrr;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1720  
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1721  				queue0 {
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1722  					snps,dcb-algorithm;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1723  					snps,priority = <0x0>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1724  					snps,weight = <0x10>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1725  				};
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1726  
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1727  				queue1 {
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1728  					snps,dcb-algorithm;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1729  					snps,priority = <0x1>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1730  					snps,weight = <0x11>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1731  				};
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1732  
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1733  				queue2 {
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1734  					snps,dcb-algorithm;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1735  					snps,priority = <0x2>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1736  					snps,weight = <0x12>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1737  				};
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1738  
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1739  				queue3 {
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1740  					snps,dcb-algorithm;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1741  					snps,priority = <0x3>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1742  					snps,weight = <0x13>;
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1743  				};
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1744  			};
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1745  		};
b666eb393d7570 Nícolas F. R. A. Prado     2024-10-18  1746  
9461e0caac9e4c jason-ch chen              2023-10-23  1747  		xhci1: usb@11200000 {
9461e0caac9e4c jason-ch chen              2023-10-23  1748  			compatible = "mediatek,mt8188-xhci", "mediatek,mtk-xhci";
9461e0caac9e4c jason-ch chen              2023-10-23  1749  			reg = <0 0x11200000 0 0x1000>,
9461e0caac9e4c jason-ch chen              2023-10-23  1750  			      <0 0x11203e00 0 0x0100>;
9461e0caac9e4c jason-ch chen              2023-10-23  1751  			reg-names = "mac", "ippc";
9461e0caac9e4c jason-ch chen              2023-10-23  1752  			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1753  			phys = <&u2port1 PHY_TYPE_USB2>,
9461e0caac9e4c jason-ch chen              2023-10-23  1754  			       <&u3port1 PHY_TYPE_USB3>;
9461e0caac9e4c jason-ch chen              2023-10-23  1755  			assigned-clocks = <&topckgen CLK_TOP_USB_TOP>,
9461e0caac9e4c jason-ch chen              2023-10-23  1756  					  <&topckgen CLK_TOP_SSUSB_XHCI>;
9461e0caac9e4c jason-ch chen              2023-10-23  1757  			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
9461e0caac9e4c jason-ch chen              2023-10-23  1758  						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
9461e0caac9e4c jason-ch chen              2023-10-23  1759  			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_BUS>,
9461e0caac9e4c jason-ch chen              2023-10-23  1760  				 <&topckgen CLK_TOP_SSUSB_TOP_REF>,
9461e0caac9e4c jason-ch chen              2023-10-23  1761  				 <&pericfg_ao CLK_PERI_AO_SSUSB_XHCI>;
9461e0caac9e4c jason-ch chen              2023-10-23  1762  			clock-names = "sys_ck", "ref_ck", "mcu_ck";
9461e0caac9e4c jason-ch chen              2023-10-23  1763  			mediatek,syscon-wakeup = <&pericfg 0x468 2>;
9461e0caac9e4c jason-ch chen              2023-10-23  1764  			wakeup-source;
9461e0caac9e4c jason-ch chen              2023-10-23  1765  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  1766  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1767  
9461e0caac9e4c jason-ch chen              2023-10-23  1768  		mmc0: mmc@11230000 {
9461e0caac9e4c jason-ch chen              2023-10-23  1769  			compatible = "mediatek,mt8188-mmc", "mediatek,mt8183-mmc";
9461e0caac9e4c jason-ch chen              2023-10-23  1770  			reg = <0 0x11230000 0 0x10000>,
9461e0caac9e4c jason-ch chen              2023-10-23  1771  			      <0 0x11f50000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  1772  			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1773  			clocks = <&topckgen CLK_TOP_MSDC50_0>,
9461e0caac9e4c jason-ch chen              2023-10-23  1774  				 <&infracfg_ao CLK_INFRA_AO_MSDC0>,
9461e0caac9e4c jason-ch chen              2023-10-23  1775  				 <&infracfg_ao CLK_INFRA_AO_MSDC0_SRC>,
9461e0caac9e4c jason-ch chen              2023-10-23  1776  				 <&infracfg_ao CLK_INFRA_AO_RG_AES_MSDCFDE_CK_0P>;
9461e0caac9e4c jason-ch chen              2023-10-23  1777  			clock-names = "source", "hclk", "source_cg", "crypto_clk";
9461e0caac9e4c jason-ch chen              2023-10-23  1778  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  1779  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1780  
9461e0caac9e4c jason-ch chen              2023-10-23  1781  		mmc1: mmc@11240000 {
9461e0caac9e4c jason-ch chen              2023-10-23  1782  			compatible = "mediatek,mt8188-mmc", "mediatek,mt8183-mmc";
9461e0caac9e4c jason-ch chen              2023-10-23  1783  			reg = <0 0x11240000 0 0x1000>,
9461e0caac9e4c jason-ch chen              2023-10-23  1784  			      <0 0x11eb0000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  1785  			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1786  			clocks = <&topckgen CLK_TOP_MSDC30_1>,
9461e0caac9e4c jason-ch chen              2023-10-23  1787  				 <&infracfg_ao CLK_INFRA_AO_MSDC1>,
9461e0caac9e4c jason-ch chen              2023-10-23  1788  				 <&infracfg_ao CLK_INFRA_AO_MSDC1_SRC>;
9461e0caac9e4c jason-ch chen              2023-10-23  1789  			clock-names = "source", "hclk", "source_cg";
9461e0caac9e4c jason-ch chen              2023-10-23  1790  			assigned-clocks = <&topckgen CLK_TOP_MSDC30_1>;
9461e0caac9e4c jason-ch chen              2023-10-23  1791  			assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL_D2>;
9461e0caac9e4c jason-ch chen              2023-10-23  1792  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  1793  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1794  
d39aacd1021a3f Nicolas Pitre              2024-06-03  1795  		lvts_mcu: thermal-sensor@11278000 {
d39aacd1021a3f Nicolas Pitre              2024-06-03  1796  			compatible = "mediatek,mt8188-lvts-mcu";
d39aacd1021a3f Nicolas Pitre              2024-06-03  1797  			reg = <0 0x11278000 0 0x1000>;
d39aacd1021a3f Nicolas Pitre              2024-06-03  1798  			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH 0>;
d39aacd1021a3f Nicolas Pitre              2024-06-03  1799  			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
d39aacd1021a3f Nicolas Pitre              2024-06-03  1800  			resets = <&infracfg_ao MT8188_INFRA_RST1_THERMAL_MCU_RST>;
d39aacd1021a3f Nicolas Pitre              2024-06-03  1801  			nvmem-cells = <&lvts_efuse_data1>;
d39aacd1021a3f Nicolas Pitre              2024-06-03  1802  			nvmem-cell-names = "lvts-calib-data-1";
d39aacd1021a3f Nicolas Pitre              2024-06-03  1803  			#thermal-sensor-cells = <1>;
d39aacd1021a3f Nicolas Pitre              2024-06-03  1804  		};
d39aacd1021a3f Nicolas Pitre              2024-06-03  1805  
9461e0caac9e4c jason-ch chen              2023-10-23  1806  		i2c0: i2c@11280000 {
9461e0caac9e4c jason-ch chen              2023-10-23  1807  			compatible = "mediatek,mt8188-i2c";
9461e0caac9e4c jason-ch chen              2023-10-23  1808  			reg = <0 0x11280000 0 0x1000>,
9461e0caac9e4c jason-ch chen              2023-10-23  1809  			      <0 0x10220080 0 0x80>;
9461e0caac9e4c jason-ch chen              2023-10-23  1810  			interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1811  			clock-div = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  1812  			clocks = <&imp_iic_wrap_c CLK_IMP_IIC_WRAP_C_AP_CLOCK_I2C0>,
9461e0caac9e4c jason-ch chen              2023-10-23  1813  				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
9461e0caac9e4c jason-ch chen              2023-10-23  1814  			clock-names = "main", "dma";
9461e0caac9e4c jason-ch chen              2023-10-23  1815  			#address-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  1816  			#size-cells = <0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1817  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  1818  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1819  
9461e0caac9e4c jason-ch chen              2023-10-23  1820  		i2c2: i2c@11281000 {
9461e0caac9e4c jason-ch chen              2023-10-23  1821  			compatible = "mediatek,mt8188-i2c";
9461e0caac9e4c jason-ch chen              2023-10-23  1822  			reg = <0 0x11281000 0 0x1000>,
9461e0caac9e4c jason-ch chen              2023-10-23  1823  			      <0 0x10220180 0 0x80>;
9461e0caac9e4c jason-ch chen              2023-10-23  1824  			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1825  			clock-div = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  1826  			clocks = <&imp_iic_wrap_c CLK_IMP_IIC_WRAP_C_AP_CLOCK_I2C2>,
9461e0caac9e4c jason-ch chen              2023-10-23  1827  				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
9461e0caac9e4c jason-ch chen              2023-10-23  1828  			clock-names = "main", "dma";
9461e0caac9e4c jason-ch chen              2023-10-23  1829  			#address-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  1830  			#size-cells = <0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1831  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  1832  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1833  
9461e0caac9e4c jason-ch chen              2023-10-23  1834  		i2c3: i2c@11282000 {
9461e0caac9e4c jason-ch chen              2023-10-23  1835  			compatible = "mediatek,mt8188-i2c";
9461e0caac9e4c jason-ch chen              2023-10-23  1836  			reg = <0 0x11282000 0 0x1000>,
9461e0caac9e4c jason-ch chen              2023-10-23  1837  			      <0 0x10220280 0 0x80>;
9461e0caac9e4c jason-ch chen              2023-10-23  1838  			interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1839  			clock-div = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  1840  			clocks = <&imp_iic_wrap_c CLK_IMP_IIC_WRAP_C_AP_CLOCK_I2C3>,
9461e0caac9e4c jason-ch chen              2023-10-23  1841  				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
9461e0caac9e4c jason-ch chen              2023-10-23  1842  			clock-names = "main", "dma";
9461e0caac9e4c jason-ch chen              2023-10-23  1843  			#address-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  1844  			#size-cells = <0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1845  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  1846  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1847  
9461e0caac9e4c jason-ch chen              2023-10-23  1848  		imp_iic_wrap_c: clock-controller@11283000 {
9461e0caac9e4c jason-ch chen              2023-10-23  1849  			compatible = "mediatek,mt8188-imp-iic-wrap-c";
9461e0caac9e4c jason-ch chen              2023-10-23  1850  			reg = <0 0x11283000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  1851  			#clock-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  1852  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1853  
9461e0caac9e4c jason-ch chen              2023-10-23  1854  		xhci2: usb@112a0000 {
9461e0caac9e4c jason-ch chen              2023-10-23  1855  			compatible = "mediatek,mt8188-xhci", "mediatek,mtk-xhci";
9461e0caac9e4c jason-ch chen              2023-10-23  1856  			reg = <0 0x112a0000 0 0x1000>,
9461e0caac9e4c jason-ch chen              2023-10-23  1857  			      <0 0x112a3e00 0 0x0100>;
9461e0caac9e4c jason-ch chen              2023-10-23  1858  			reg-names = "mac", "ippc";
9461e0caac9e4c jason-ch chen              2023-10-23  1859  			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1860  			phys = <&u2port2 PHY_TYPE_USB2>;
9461e0caac9e4c jason-ch chen              2023-10-23  1861  			assigned-clocks = <&topckgen CLK_TOP_SSUSB_XHCI_3P>,
9461e0caac9e4c jason-ch chen              2023-10-23  1862  					  <&topckgen CLK_TOP_USB_TOP_3P>;
9461e0caac9e4c jason-ch chen              2023-10-23  1863  			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
9461e0caac9e4c jason-ch chen              2023-10-23  1864  						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
9461e0caac9e4c jason-ch chen              2023-10-23  1865  			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_3P_BUS>,
9461e0caac9e4c jason-ch chen              2023-10-23  1866  				 <&topckgen CLK_TOP_SSUSB_TOP_P3_REF>,
9461e0caac9e4c jason-ch chen              2023-10-23  1867  				 <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>;
9461e0caac9e4c jason-ch chen              2023-10-23  1868  			clock-names = "sys_ck", "ref_ck", "mcu_ck";
9461e0caac9e4c jason-ch chen              2023-10-23  1869  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  1870  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1871  
9461e0caac9e4c jason-ch chen              2023-10-23  1872  		xhci0: usb@112b0000 {
9461e0caac9e4c jason-ch chen              2023-10-23  1873  			compatible = "mediatek,mt8188-xhci", "mediatek,mtk-xhci";
9461e0caac9e4c jason-ch chen              2023-10-23  1874  			reg = <0 0x112b0000 0 0x1000>,
9461e0caac9e4c jason-ch chen              2023-10-23  1875  			      <0 0x112b3e00 0 0x0100>;
9461e0caac9e4c jason-ch chen              2023-10-23  1876  			reg-names = "mac", "ippc";
9461e0caac9e4c jason-ch chen              2023-10-23  1877  			interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1878  			phys = <&u2port0 PHY_TYPE_USB2>;
9461e0caac9e4c jason-ch chen              2023-10-23  1879  			assigned-clocks = <&topckgen CLK_TOP_SSUSB_XHCI_2P>,
9461e0caac9e4c jason-ch chen              2023-10-23  1880  					  <&topckgen CLK_TOP_USB_TOP_2P>;
9461e0caac9e4c jason-ch chen              2023-10-23  1881  			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
9461e0caac9e4c jason-ch chen              2023-10-23  1882  						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
9461e0caac9e4c jason-ch chen              2023-10-23  1883  			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_2P_BUS>,
9461e0caac9e4c jason-ch chen              2023-10-23  1884  				 <&topckgen CLK_TOP_SSUSB_TOP_P2_REF>,
9461e0caac9e4c jason-ch chen              2023-10-23  1885  				 <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>;
9461e0caac9e4c jason-ch chen              2023-10-23  1886  			clock-names = "sys_ck", "ref_ck", "mcu_ck";
9461e0caac9e4c jason-ch chen              2023-10-23  1887  			mediatek,syscon-wakeup = <&pericfg 0x460 2>;
9461e0caac9e4c jason-ch chen              2023-10-23  1888  			wakeup-source;
9461e0caac9e4c jason-ch chen              2023-10-23  1889  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  1890  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1891  
111f89e2a297a8 Fei Shao                   2024-10-14  1892  		pcie: pcie@112f0000 {
111f89e2a297a8 Fei Shao                   2024-10-14  1893  			compatible = "mediatek,mt8188-pcie", "mediatek,mt8192-pcie";
111f89e2a297a8 Fei Shao                   2024-10-14  1894  			reg = <0 0x112f0000 0 0x2000>;
111f89e2a297a8 Fei Shao                   2024-10-14  1895  			reg-names = "pcie-mac";
111f89e2a297a8 Fei Shao                   2024-10-14  1896  			ranges = <0x82000000 0 0x20000000 0 0x20000000 0 0x4000000>;
111f89e2a297a8 Fei Shao                   2024-10-14  1897  			bus-range = <0 0xff>;
111f89e2a297a8 Fei Shao                   2024-10-14  1898  			device_type = "pci";
111f89e2a297a8 Fei Shao                   2024-10-14  1899  			linux,pci-domain = <0>;
111f89e2a297a8 Fei Shao                   2024-10-14  1900  			#address-cells = <3>;
111f89e2a297a8 Fei Shao                   2024-10-14  1901  			#size-cells = <2>;
111f89e2a297a8 Fei Shao                   2024-10-14  1902  
111f89e2a297a8 Fei Shao                   2024-10-14  1903  			clocks = <&infracfg_ao CLK_INFRA_AO_PCIE_PL_P_250M_P0>,
111f89e2a297a8 Fei Shao                   2024-10-14  1904  				 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_26M>,
111f89e2a297a8 Fei Shao                   2024-10-14  1905  				 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_96M>,
111f89e2a297a8 Fei Shao                   2024-10-14  1906  				 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_32K>,
111f89e2a297a8 Fei Shao                   2024-10-14  1907  				 <&infracfg_ao CLK_INFRA_AO_PCIE_PERI_26M>,
111f89e2a297a8 Fei Shao                   2024-10-14  1908  				 <&pericfg_ao CLK_PERI_AO_PCIE_P0_FMEM>;
111f89e2a297a8 Fei Shao                   2024-10-14  1909  			clock-names = "pl_250m", "tl_26m", "tl_96m", "tl_32k",
111f89e2a297a8 Fei Shao                   2024-10-14  1910  				      "peri_26m", "peri_mem";
111f89e2a297a8 Fei Shao                   2024-10-14  1911  
111f89e2a297a8 Fei Shao                   2024-10-14  1912  			#interrupt-cells = <1>;
111f89e2a297a8 Fei Shao                   2024-10-14  1913  			interrupts = <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH 0>;
111f89e2a297a8 Fei Shao                   2024-10-14  1914  			interrupt-map = <0 0 0 1 &pcie_intc 0>,
111f89e2a297a8 Fei Shao                   2024-10-14  1915  					<0 0 0 2 &pcie_intc 1>,
111f89e2a297a8 Fei Shao                   2024-10-14  1916  					<0 0 0 3 &pcie_intc 2>,
111f89e2a297a8 Fei Shao                   2024-10-14  1917  					<0 0 0 4 &pcie_intc 3>;
111f89e2a297a8 Fei Shao                   2024-10-14  1918  			interrupt-map-mask = <0 0 0 7>;
111f89e2a297a8 Fei Shao                   2024-10-14  1919  
111f89e2a297a8 Fei Shao                   2024-10-14  1920  			iommu-map = <0 &infra_iommu IFR_IOMMU_PORT_PCIE_0 0xffff>;
111f89e2a297a8 Fei Shao                   2024-10-14  1921  			iommu-map-mask = <0>;
111f89e2a297a8 Fei Shao                   2024-10-14  1922  
111f89e2a297a8 Fei Shao                   2024-10-14  1923  			phys = <&pcieport PHY_TYPE_PCIE>;
111f89e2a297a8 Fei Shao                   2024-10-14  1924  			phy-names = "pcie-phy";
111f89e2a297a8 Fei Shao                   2024-10-14  1925  
111f89e2a297a8 Fei Shao                   2024-10-14  1926  			power-domains = <&spm MT8188_POWER_DOMAIN_PEXTP_MAC_P0>;
111f89e2a297a8 Fei Shao                   2024-10-14  1927  
111f89e2a297a8 Fei Shao                   2024-10-14  1928  			resets = <&watchdog MT8188_TOPRGU_PCIE_SW_RST>;
111f89e2a297a8 Fei Shao                   2024-10-14  1929  			reset-names = "mac";
111f89e2a297a8 Fei Shao                   2024-10-14  1930  
111f89e2a297a8 Fei Shao                   2024-10-14  1931  			status = "disabled";
111f89e2a297a8 Fei Shao                   2024-10-14  1932  
111f89e2a297a8 Fei Shao                   2024-10-14  1933  			pcie_intc: interrupt-controller {
111f89e2a297a8 Fei Shao                   2024-10-14  1934  				#address-cells = <0>;
111f89e2a297a8 Fei Shao                   2024-10-14  1935  				#interrupt-cells = <1>;
111f89e2a297a8 Fei Shao                   2024-10-14  1936  				interrupt-controller;
111f89e2a297a8 Fei Shao                   2024-10-14  1937  			};
111f89e2a297a8 Fei Shao                   2024-10-14  1938  		};
111f89e2a297a8 Fei Shao                   2024-10-14  1939  
9461e0caac9e4c jason-ch chen              2023-10-23  1940  		nor_flash: spi@1132c000 {
9461e0caac9e4c jason-ch chen              2023-10-23  1941  			compatible = "mediatek,mt8188-nor", "mediatek,mt8186-nor";
9461e0caac9e4c jason-ch chen              2023-10-23  1942  			reg = <0 0x1132c000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  1943  			clocks = <&topckgen CLK_TOP_SPINOR>,
9461e0caac9e4c jason-ch chen              2023-10-23  1944  				 <&pericfg_ao CLK_PERI_AO_FLASHIFLASHCK>,
9461e0caac9e4c jason-ch chen              2023-10-23  1945  				 <&pericfg_ao CLK_PERI_AO_FLASHIF_BUS>;
9461e0caac9e4c jason-ch chen              2023-10-23  1946  			clock-names = "spi", "sf", "axi";
9461e0caac9e4c jason-ch chen              2023-10-23  1947  			assigned-clocks = <&topckgen CLK_TOP_SPINOR>;
9461e0caac9e4c jason-ch chen              2023-10-23  1948  			interrupts = <GIC_SPI 825 IRQ_TYPE_LEVEL_HIGH 0>;
08ea5de59db820 Fei Shao                   2024-10-01  1949  			#address-cells = <1>;
08ea5de59db820 Fei Shao                   2024-10-01  1950  			#size-cells = <0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1951  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  1952  		};
9461e0caac9e4c jason-ch chen              2023-10-23  1953  
111f89e2a297a8 Fei Shao                   2024-10-14  1954  		pciephy: t-phy@11c20700 {
111f89e2a297a8 Fei Shao                   2024-10-14  1955  			compatible = "mediatek,mt8188-tphy", "mediatek,generic-tphy-v3";
111f89e2a297a8 Fei Shao                   2024-10-14  1956  			ranges = <0 0 0x11c20700 0x700>;
111f89e2a297a8 Fei Shao                   2024-10-14  1957  			#address-cells = <1>;
111f89e2a297a8 Fei Shao                   2024-10-14  1958  			#size-cells = <1>;
111f89e2a297a8 Fei Shao                   2024-10-14  1959  			power-domains = <&spm MT8188_POWER_DOMAIN_PEXTP_PHY_TOP>;
111f89e2a297a8 Fei Shao                   2024-10-14  1960  			status = "disabled";
111f89e2a297a8 Fei Shao                   2024-10-14  1961  
111f89e2a297a8 Fei Shao                   2024-10-14  1962  			pcieport: pcie-phy@0 {
111f89e2a297a8 Fei Shao                   2024-10-14  1963  				reg = <0 0x700>;
111f89e2a297a8 Fei Shao                   2024-10-14  1964  				clocks = <&topckgen CLK_TOP_CFGREG_F_PCIE_PHY_REF>;
111f89e2a297a8 Fei Shao                   2024-10-14  1965  				clock-names = "ref";
111f89e2a297a8 Fei Shao                   2024-10-14  1966  				#phy-cells = <1>;
111f89e2a297a8 Fei Shao                   2024-10-14  1967  			};
111f89e2a297a8 Fei Shao                   2024-10-14  1968  		};
111f89e2a297a8 Fei Shao                   2024-10-14  1969  
1dafffbeb973c2 Fei Shao                   2024-10-14  1970  		mipi_tx_config0: dsi-phy@11c80000 {
1dafffbeb973c2 Fei Shao                   2024-10-14  1971  			compatible = "mediatek,mt8188-mipi-tx", "mediatek,mt8183-mipi-tx";
1dafffbeb973c2 Fei Shao                   2024-10-14  1972  			reg = <0 0x11c80000 0 0x1000>;
1dafffbeb973c2 Fei Shao                   2024-10-14  1973  			clocks = <&clk26m>;
1dafffbeb973c2 Fei Shao                   2024-10-14  1974  			clock-output-names = "mipi_tx0_pll";
1dafffbeb973c2 Fei Shao                   2024-10-14  1975  			#clock-cells = <0>;
1dafffbeb973c2 Fei Shao                   2024-10-14  1976  			#phy-cells = <0>;
1dafffbeb973c2 Fei Shao                   2024-10-14  1977  			status = "disabled";
1dafffbeb973c2 Fei Shao                   2024-10-14  1978  		};
1dafffbeb973c2 Fei Shao                   2024-10-14  1979  
1dafffbeb973c2 Fei Shao                   2024-10-14  1980  		mipi_tx_config1: dsi-phy@11c90000 {
1dafffbeb973c2 Fei Shao                   2024-10-14  1981  			compatible = "mediatek,mt8188-mipi-tx", "mediatek,mt8183-mipi-tx";
1dafffbeb973c2 Fei Shao                   2024-10-14  1982  			reg = <0 0x11c90000 0 0x1000>;
1dafffbeb973c2 Fei Shao                   2024-10-14  1983  			clocks = <&clk26m>;
1dafffbeb973c2 Fei Shao                   2024-10-14  1984  			clock-output-names = "mipi_tx0_pll";
1dafffbeb973c2 Fei Shao                   2024-10-14  1985  			#clock-cells = <0>;
1dafffbeb973c2 Fei Shao                   2024-10-14  1986  			#phy-cells = <0>;
1dafffbeb973c2 Fei Shao                   2024-10-14  1987  			status = "disabled";
1dafffbeb973c2 Fei Shao                   2024-10-14  1988  		};
1dafffbeb973c2 Fei Shao                   2024-10-14  1989  
9461e0caac9e4c jason-ch chen              2023-10-23  1990  		i2c1: i2c@11e00000 {
9461e0caac9e4c jason-ch chen              2023-10-23  1991  			compatible = "mediatek,mt8188-i2c";
9461e0caac9e4c jason-ch chen              2023-10-23  1992  			reg = <0 0x11e00000 0 0x1000>,
9461e0caac9e4c jason-ch chen              2023-10-23  1993  			      <0 0x10220100 0 0x80>;
9461e0caac9e4c jason-ch chen              2023-10-23  1994  			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  1995  			clock-div = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  1996  			clocks = <&imp_iic_wrap_w CLK_IMP_IIC_WRAP_W_AP_CLOCK_I2C1>,
9461e0caac9e4c jason-ch chen              2023-10-23  1997  				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
9461e0caac9e4c jason-ch chen              2023-10-23  1998  			clock-names = "main", "dma";
9461e0caac9e4c jason-ch chen              2023-10-23  1999  			#address-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2000  			#size-cells = <0>;
9461e0caac9e4c jason-ch chen              2023-10-23  2001  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  2002  		};
9461e0caac9e4c jason-ch chen              2023-10-23  2003  
9461e0caac9e4c jason-ch chen              2023-10-23  2004  		i2c4: i2c@11e01000 {
9461e0caac9e4c jason-ch chen              2023-10-23  2005  			compatible = "mediatek,mt8188-i2c";
9461e0caac9e4c jason-ch chen              2023-10-23  2006  			reg = <0 0x11e01000 0 0x1000>,
9461e0caac9e4c jason-ch chen              2023-10-23  2007  			      <0 0x10220380 0 0x80>;
9461e0caac9e4c jason-ch chen              2023-10-23  2008  			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  2009  			clock-div = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2010  			clocks = <&imp_iic_wrap_w CLK_IMP_IIC_WRAP_W_AP_CLOCK_I2C4>,
9461e0caac9e4c jason-ch chen              2023-10-23  2011  				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
9461e0caac9e4c jason-ch chen              2023-10-23  2012  			clock-names = "main", "dma";
9461e0caac9e4c jason-ch chen              2023-10-23  2013  			#address-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2014  			#size-cells = <0>;
9461e0caac9e4c jason-ch chen              2023-10-23  2015  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  2016  		};
9461e0caac9e4c jason-ch chen              2023-10-23  2017  
9461e0caac9e4c jason-ch chen              2023-10-23  2018  		imp_iic_wrap_w: clock-controller@11e02000 {
9461e0caac9e4c jason-ch chen              2023-10-23  2019  			compatible = "mediatek,mt8188-imp-iic-wrap-w";
9461e0caac9e4c jason-ch chen              2023-10-23  2020  			reg = <0 0x11e02000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  2021  			#clock-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2022  		};
9461e0caac9e4c jason-ch chen              2023-10-23  2023  
9461e0caac9e4c jason-ch chen              2023-10-23  2024  		u3phy0: t-phy@11e30000 {
9461e0caac9e4c jason-ch chen              2023-10-23  2025  			compatible = "mediatek,mt8188-tphy", "mediatek,generic-tphy-v3";
9461e0caac9e4c jason-ch chen              2023-10-23  2026  			#address-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2027  			#size-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2028  			ranges = <0x0 0x0 0x11e30000 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  2029  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  2030  
9461e0caac9e4c jason-ch chen              2023-10-23  2031  			u2port0: usb-phy@0 {
9461e0caac9e4c jason-ch chen              2023-10-23  2032  				reg = <0x0 0x700>;
9461e0caac9e4c jason-ch chen              2023-10-23  2033  				clocks = <&topckgen CLK_TOP_SSUSB_PHY_P2_REF>,
9461e0caac9e4c jason-ch chen              2023-10-23  2034  					 <&apmixedsys CLK_APMIXED_PLL_SSUSB26M_EN>;
9461e0caac9e4c jason-ch chen              2023-10-23  2035  				clock-names = "ref", "da_ref";
9461e0caac9e4c jason-ch chen              2023-10-23  2036  				#phy-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2037  			};
9461e0caac9e4c jason-ch chen              2023-10-23  2038  		};
9461e0caac9e4c jason-ch chen              2023-10-23  2039  
9461e0caac9e4c jason-ch chen              2023-10-23  2040  		u3phy1: t-phy@11e40000 {
9461e0caac9e4c jason-ch chen              2023-10-23  2041  			compatible = "mediatek,mt8188-tphy", "mediatek,generic-tphy-v3";
9461e0caac9e4c jason-ch chen              2023-10-23  2042  			#address-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2043  			#size-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2044  			ranges = <0x0 0x0 0x11e40000 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  2045  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  2046  
9461e0caac9e4c jason-ch chen              2023-10-23  2047  			u2port1: usb-phy@0 {
9461e0caac9e4c jason-ch chen              2023-10-23  2048  				reg = <0x0 0x700>;
9461e0caac9e4c jason-ch chen              2023-10-23  2049  				clocks = <&topckgen CLK_TOP_SSUSB_PHY_REF>,
9461e0caac9e4c jason-ch chen              2023-10-23  2050  					 <&apmixedsys CLK_APMIXED_PLL_SSUSB26M_EN>;
9461e0caac9e4c jason-ch chen              2023-10-23  2051  				clock-names = "ref", "da_ref";
9461e0caac9e4c jason-ch chen              2023-10-23  2052  				#phy-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2053  			};
9461e0caac9e4c jason-ch chen              2023-10-23  2054  
9461e0caac9e4c jason-ch chen              2023-10-23  2055  			u3port1: usb-phy@700 {
9461e0caac9e4c jason-ch chen              2023-10-23  2056  				reg = <0x700 0x700>;
9461e0caac9e4c jason-ch chen              2023-10-23  2057  				clocks = <&apmixedsys CLK_APMIXED_PLL_SSUSB26M_EN>,
9461e0caac9e4c jason-ch chen              2023-10-23  2058  					 <&clk26m>;
9461e0caac9e4c jason-ch chen              2023-10-23  2059  				clock-names = "ref", "da_ref";
9461e0caac9e4c jason-ch chen              2023-10-23  2060  				#phy-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2061  			};
9461e0caac9e4c jason-ch chen              2023-10-23  2062  		};
9461e0caac9e4c jason-ch chen              2023-10-23  2063  
9461e0caac9e4c jason-ch chen              2023-10-23  2064  		u3phy2: t-phy@11e80000 {
9461e0caac9e4c jason-ch chen              2023-10-23  2065  			compatible = "mediatek,mt8188-tphy", "mediatek,generic-tphy-v3";
9461e0caac9e4c jason-ch chen              2023-10-23  2066  			#address-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2067  			#size-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2068  			ranges = <0x0 0x0 0x11e80000 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  2069  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  2070  
9461e0caac9e4c jason-ch chen              2023-10-23  2071  			u2port2: usb-phy@0 {
9461e0caac9e4c jason-ch chen              2023-10-23  2072  				reg = <0x0 0x700>;
9461e0caac9e4c jason-ch chen              2023-10-23  2073  				clocks = <&topckgen CLK_TOP_SSUSB_PHY_P3_REF>,
9461e0caac9e4c jason-ch chen              2023-10-23  2074  					 <&apmixedsys CLK_APMIXED_PLL_SSUSB26M_EN>;
9461e0caac9e4c jason-ch chen              2023-10-23  2075  				clock-names = "ref", "da_ref";
9461e0caac9e4c jason-ch chen              2023-10-23  2076  				#phy-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2077  			};
9461e0caac9e4c jason-ch chen              2023-10-23  2078  		};
9461e0caac9e4c jason-ch chen              2023-10-23  2079  
9461e0caac9e4c jason-ch chen              2023-10-23  2080  		i2c5: i2c@11ec0000 {
9461e0caac9e4c jason-ch chen              2023-10-23  2081  			compatible = "mediatek,mt8188-i2c";
9461e0caac9e4c jason-ch chen              2023-10-23  2082  			reg = <0 0x11ec0000 0 0x1000>,
9461e0caac9e4c jason-ch chen              2023-10-23  2083  			      <0 0x10220480 0 0x80>;
9461e0caac9e4c jason-ch chen              2023-10-23  2084  			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  2085  			clock-div = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2086  			clocks = <&imp_iic_wrap_en CLK_IMP_IIC_WRAP_EN_AP_CLOCK_I2C5>,
9461e0caac9e4c jason-ch chen              2023-10-23  2087  				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
9461e0caac9e4c jason-ch chen              2023-10-23  2088  			clock-names = "main", "dma";
9461e0caac9e4c jason-ch chen              2023-10-23  2089  			#address-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2090  			#size-cells = <0>;
9461e0caac9e4c jason-ch chen              2023-10-23  2091  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  2092  		};
9461e0caac9e4c jason-ch chen              2023-10-23  2093  
9461e0caac9e4c jason-ch chen              2023-10-23  2094  		i2c6: i2c@11ec1000 {
9461e0caac9e4c jason-ch chen              2023-10-23  2095  			compatible = "mediatek,mt8188-i2c";
9461e0caac9e4c jason-ch chen              2023-10-23  2096  			reg = <0 0x11ec1000 0 0x1000>,
9461e0caac9e4c jason-ch chen              2023-10-23  2097  			      <0 0x10220600 0 0x80>;
9461e0caac9e4c jason-ch chen              2023-10-23  2098  			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH 0>;
9461e0caac9e4c jason-ch chen              2023-10-23  2099  			clock-div = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2100  			clocks = <&imp_iic_wrap_en CLK_IMP_IIC_WRAP_EN_AP_CLOCK_I2C6>,
9461e0caac9e4c jason-ch chen              2023-10-23  2101  				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
9461e0caac9e4c jason-ch chen              2023-10-23  2102  			clock-names = "main", "dma";
9461e0caac9e4c jason-ch chen              2023-10-23  2103  			#address-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2104  			#size-cells = <0>;
9461e0caac9e4c jason-ch chen              2023-10-23  2105  			status = "disabled";
9461e0caac9e4c jason-ch chen              2023-10-23  2106  		};
9461e0caac9e4c jason-ch chen              2023-10-23  2107  
9461e0caac9e4c jason-ch chen              2023-10-23  2108  		imp_iic_wrap_en: clock-controller@11ec2000 {
9461e0caac9e4c jason-ch chen              2023-10-23  2109  			compatible = "mediatek,mt8188-imp-iic-wrap-en";
9461e0caac9e4c jason-ch chen              2023-10-23  2110  			reg = <0 0x11ec2000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  2111  			#clock-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2112  		};
9461e0caac9e4c jason-ch chen              2023-10-23  2113  
d39aacd1021a3f Nicolas Pitre              2024-06-03  2114  		efuse: efuse@11f20000 {
d39aacd1021a3f Nicolas Pitre              2024-06-03  2115  			compatible = "mediatek,mt8188-efuse", "mediatek,efuse";
d39aacd1021a3f Nicolas Pitre              2024-06-03  2116  			reg = <0 0x11f20000 0 0x1000>;
d39aacd1021a3f Nicolas Pitre              2024-06-03  2117  			#address-cells = <1>;
d39aacd1021a3f Nicolas Pitre              2024-06-03  2118  			#size-cells = <1>;
d39aacd1021a3f Nicolas Pitre              2024-06-03  2119  
d279c73576a7ce Fei Shao                   2024-10-14  2120  			dp_calib_data: dp-calib@1a0 {
d279c73576a7ce Fei Shao                   2024-10-14  2121  				reg = <0x1a0 0xc>;
d279c73576a7ce Fei Shao                   2024-10-14  2122  			};
d279c73576a7ce Fei Shao                   2024-10-14  2123  
d39aacd1021a3f Nicolas Pitre              2024-06-03  2124  			lvts_efuse_data1: lvts1-calib@1ac {
d39aacd1021a3f Nicolas Pitre              2024-06-03  2125  				reg = <0x1ac 0x40>;
d39aacd1021a3f Nicolas Pitre              2024-06-03  2126  			};
85cd59c16cae69 Fei Shao                   2024-09-11  2127  
50e7592cb696b3 Hsin-Te Yuan               2024-12-13  2128  			gpu_speedbin: gpu-speedbin@581 {
50e7592cb696b3 Hsin-Te Yuan               2024-12-13  2129  				reg = <0x581 0x1>;
50e7592cb696b3 Hsin-Te Yuan               2024-12-13  2130  				bits = <0 3>;
50e7592cb696b3 Hsin-Te Yuan               2024-12-13  2131  			};
50e7592cb696b3 Hsin-Te Yuan               2024-12-13  2132  
85cd59c16cae69 Fei Shao                   2024-09-11  2133  			socinfo-data1@7a0 {
85cd59c16cae69 Fei Shao                   2024-09-11  2134  				reg = <0x7a0 0x4>;
85cd59c16cae69 Fei Shao                   2024-09-11  2135  			};
85cd59c16cae69 Fei Shao                   2024-09-11  2136  
85cd59c16cae69 Fei Shao                   2024-09-11  2137  			socinfo-data2@7e0 {
85cd59c16cae69 Fei Shao                   2024-09-11  2138  				reg = <0x7e0 0x4>;
85cd59c16cae69 Fei Shao                   2024-09-11  2139  			};
d39aacd1021a3f Nicolas Pitre              2024-06-03  2140  		};
d39aacd1021a3f Nicolas Pitre              2024-06-03  2141  
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27  2142  		gpu: gpu@13000000 {
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27  2143  			compatible = "mediatek,mt8188-mali", "arm,mali-valhall-jm";
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27  2144  			reg = <0 0x13000000 0 0x4000>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27  2145  
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27  2146  			clocks = <&mfgcfg CLK_MFGCFG_BG3D>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27  2147  			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH 0>,
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27  2148  				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH 0>,
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27  2149  				     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH 0>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27  2150  			interrupt-names = "job", "mmu", "gpu";
50e7592cb696b3 Hsin-Te Yuan               2024-12-13  2151  			nvmem-cells = <&gpu_speedbin>;
50e7592cb696b3 Hsin-Te Yuan               2024-12-13  2152  			nvmem-cell-names = "speed-bin";
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27  2153  			operating-points-v2 = <&gpu_opp_table>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27  2154  			power-domains = <&spm MT8188_POWER_DOMAIN_MFG2>,
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27  2155  					<&spm MT8188_POWER_DOMAIN_MFG3>,
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27  2156  					<&spm MT8188_POWER_DOMAIN_MFG4>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27  2157  			power-domain-names = "core0", "core1", "core2";
48456547da153c Nicolas Pitre              2024-06-03  2158  			#cooling-cells = <2>;
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27  2159  			status = "disabled";
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27  2160  		};
c44589a890ffd6 AngeloGioacchino Del Regno 2024-05-27  2161  
9461e0caac9e4c jason-ch chen              2023-10-23  2162  		mfgcfg: clock-controller@13fbf000 {
9461e0caac9e4c jason-ch chen              2023-10-23  2163  			compatible = "mediatek,mt8188-mfgcfg";
9461e0caac9e4c jason-ch chen              2023-10-23  2164  			reg = <0 0x13fbf000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  2165  			#clock-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2166  		};
9461e0caac9e4c jason-ch chen              2023-10-23  2167  
c1134cbf001082 Fei Shao                   2024-10-01  2168  		vppsys0: syscon@14000000 {
c1134cbf001082 Fei Shao                   2024-10-01  2169  			compatible = "mediatek,mt8188-vppsys0", "syscon";
9461e0caac9e4c jason-ch chen              2023-10-23  2170  			reg = <0 0x14000000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  2171  			#clock-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2172  		};
9461e0caac9e4c jason-ch chen              2023-10-23  2173  
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2174  		vpp_smi_common: smi@14012000 {
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2175  			compatible = "mediatek,mt8188-smi-common-vpp";
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2176  			reg = <0 0x14012000 0 0x1000>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2177  			clocks = <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>,
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2178  				 <&vppsys0 CLK_VPP0_SMI_SUB_COMMON_REORDER>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2179  			clock-names = "apb", "smi";
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2180  			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2181  		};
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2182  
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2183  		larb4: smi@14013000 {
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2184  			compatible = "mediatek,mt8188-smi-larb";
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2185  			reg = <0 0x14013000 0 0x1000>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2186  			clocks = <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>,
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2187  				 <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2188  			clock-names = "apb", "smi";
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2189  			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2190  			mediatek,larb-id = <SMI_L4_ID>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2191  			mediatek,smi = <&vpp_smi_common>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2192  		};
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2193  
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2194  		vpp_iommu: iommu@14018000 {
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2195  			compatible = "mediatek,mt8188-iommu-vpp";
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2196  			reg = <0 0x14018000 0 0x5000>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2197  			clocks = <&vppsys0 CLK_VPP0_SMI_IOMMU>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2198  			clock-names = "bclk";
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2199  			interrupts = <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH 0>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2200  			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2201  			#iommu-cells = <1>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2202  			mediatek,larbs = <&larb1 &larb3 &larb4 &larb6 &larb7 &larb23>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2203  		};
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2204  
9461e0caac9e4c jason-ch chen              2023-10-23  2205  		wpesys: clock-controller@14e00000 {
9461e0caac9e4c jason-ch chen              2023-10-23  2206  			compatible = "mediatek,mt8188-wpesys";
9461e0caac9e4c jason-ch chen              2023-10-23  2207  			reg = <0 0x14e00000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  2208  			#clock-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2209  		};
9461e0caac9e4c jason-ch chen              2023-10-23  2210  
9461e0caac9e4c jason-ch chen              2023-10-23  2211  		wpesys_vpp0: clock-controller@14e02000 {
9461e0caac9e4c jason-ch chen              2023-10-23  2212  			compatible = "mediatek,mt8188-wpesys-vpp0";
9461e0caac9e4c jason-ch chen              2023-10-23  2213  			reg = <0 0x14e02000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  2214  			#clock-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2215  		};
9461e0caac9e4c jason-ch chen              2023-10-23  2216  
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2217  		larb7: smi@14e04000 {
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2218  			compatible = "mediatek,mt8188-smi-larb";
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2219  			reg = <0 0x14e04000 0 0x1000>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2220  			clocks = <&wpesys CLK_WPE_TOP_SMI_LARB7>,
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2221  				 <&wpesys CLK_WPE_TOP_SMI_LARB7>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2222  			clock-names = "apb", "smi";
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2223  			power-domains = <&spm MT8188_POWER_DOMAIN_WPE>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2224  			mediatek,larb-id = <SMI_L7_ID>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2225  			mediatek,smi = <&vpp_smi_common>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2226  		};
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2227  
c1134cbf001082 Fei Shao                   2024-10-01  2228  		vppsys1: syscon@14f00000 {
c1134cbf001082 Fei Shao                   2024-10-01  2229  			compatible = "mediatek,mt8188-vppsys1", "syscon";
9461e0caac9e4c jason-ch chen              2023-10-23  2230  			reg = <0 0x14f00000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  2231  			#clock-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2232  		};
9461e0caac9e4c jason-ch chen              2023-10-23  2233  
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2234  		larb5: smi@14f02000 {
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2235  			compatible = "mediatek,mt8188-smi-larb";
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2236  			reg = <0 0x14f02000 0 0x1000>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2237  			clocks = <&vppsys1 CLK_VPP1_GALS5>,
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2238  				 <&vppsys1 CLK_VPP1_LARB5>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2239  			clock-names = "apb", "smi";
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2240  			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2241  			mediatek,larb-id = <SMI_L5_ID>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2242  			mediatek,smi = <&vdo_smi_common>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2243  		};
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2244  
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2245  		larb6: smi@14f03000 {
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2246  			compatible = "mediatek,mt8188-smi-larb";
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2247  			reg = <0 0x14f03000 0 0x1000>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2248  			clocks = <&vppsys1 CLK_VPP1_GALS6>,
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2249  				 <&vppsys1 CLK_VPP1_LARB6>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2250  			clock-names = "apb", "smi";
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2251  			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2252  			mediatek,larb-id = <SMI_L6_ID>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2253  			mediatek,smi = <&vpp_smi_common>;
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2254  		};
43fc1bd08e5bc5 Fei Shao                   2024-09-11  2255  
9461e0caac9e4c jason-ch chen              2023-10-23  2256  		imgsys: clock-controller@15000000 {
9461e0caac9e4c jason-ch chen              2023-10-23  2257  			compatible = "mediatek,mt8188-imgsys";
9461e0caac9e4c jason-ch chen              2023-10-23  2258  			reg = <0 0x15000000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  2259  			#clock-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2260  		};
9461e0caac9e4c jason-ch chen              2023-10-23  2261  
9461e0caac9e4c jason-ch chen              2023-10-23  2262  		imgsys1_dip_top: clock-controller@15110000 {
9461e0caac9e4c jason-ch chen              2023-10-23  2263  			compatible = "mediatek,mt8188-imgsys1-dip-top";
9461e0caac9e4c jason-ch chen              2023-10-23  2264  			reg = <0 0x15110000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  2265  			#clock-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2266  		};
9461e0caac9e4c jason-ch chen              2023-10-23  2267  
9461e0caac9e4c jason-ch chen              2023-10-23  2268  		imgsys1_dip_nr: clock-controller@15130000 {
9461e0caac9e4c jason-ch chen              2023-10-23  2269  			compatible = "mediatek,mt8188-imgsys1-dip-nr";
9461e0caac9e4c jason-ch chen              2023-10-23  2270  			reg = <0 0x15130000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  2271  			#clock-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2272  		};
9461e0caac9e4c jason-ch chen              2023-10-23  2273  
9461e0caac9e4c jason-ch chen              2023-10-23  2274  		imgsys_wpe1: clock-controller@15220000 {
9461e0caac9e4c jason-ch chen              2023-10-23  2275  			compatible = "mediatek,mt8188-imgsys-wpe1";
9461e0caac9e4c jason-ch chen              2023-10-23  2276  			reg = <0 0x15220000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  2277  			#clock-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2278  		};
9461e0caac9e4c jason-ch chen              2023-10-23  2279  
0faefcca3cb8f8 Bo Kong                    2025-04-03  2280  		aie: aie@15310000 {
0faefcca3cb8f8 Bo Kong                    2025-04-03  2281  			compatible = "mediatek,mt8188-aie";
0faefcca3cb8f8 Bo Kong                    2025-04-03  2282  			reg = <0 0x15310000 0 0x1000>;
0faefcca3cb8f8 Bo Kong                    2025-04-03  2283  			interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>;
0faefcca3cb8f8 Bo Kong                    2025-04-03  2284  			mediatek,larb = <&larb12>;
0faefcca3cb8f8 Bo Kong                    2025-04-03  2285  			iommus = <&vpp_iommu M4U_PORT_L12_FDVT_RDA_0>,
0faefcca3cb8f8 Bo Kong                    2025-04-03  2286  				 <&vpp_iommu M4U_PORT_L12_FDVT_RDB_0>,
0faefcca3cb8f8 Bo Kong                    2025-04-03  2287  				 <&vpp_iommu M4U_PORT_L12_FDVT_WRA_0>,
0faefcca3cb8f8 Bo Kong                    2025-04-03  2288  				 <&vpp_iommu M4U_PORT_L12_FDVT_WRB_0>;
0faefcca3cb8f8 Bo Kong                    2025-04-03  2289  			power-domains = <&spm MT8188_POWER_DOMAIN_IPE>;
0faefcca3cb8f8 Bo Kong                    2025-04-03  2290  			clocks = <&imgsys CLK_IMGSYS_MAIN_IPE>,
0faefcca3cb8f8 Bo Kong                    2025-04-03  2291  				 <&ipesys CLK_IPE_FDVT>,
0faefcca3cb8f8 Bo Kong                    2025-04-03  2292  				 <&ipesys CLK_IPE_SMI_LARB12>,
0faefcca3cb8f8 Bo Kong                    2025-04-03  2293  				 <&ipesys CLK_IPESYS_TOP>;
0faefcca3cb8f8 Bo Kong                    2025-04-03  2294  			clock-names = "img-ipe",
0faefcca3cb8f8 Bo Kong                    2025-04-03  2295  				      "ipe-fdvt",
0faefcca3cb8f8 Bo Kong                    2025-04-03  2296  				      "ipe-smi-larb12",
0faefcca3cb8f8 Bo Kong                    2025-04-03  2297  				      "ipe-top";
0faefcca3cb8f8 Bo Kong                    2025-04-03  2298  		};
0faefcca3cb8f8 Bo Kong                    2025-04-03  2299  
9461e0caac9e4c jason-ch chen              2023-10-23  2300  		ipesys: clock-controller@15330000 {
9461e0caac9e4c jason-ch chen              2023-10-23  2301  			compatible = "mediatek,mt8188-ipesys";
9461e0caac9e4c jason-ch chen              2023-10-23  2302  			reg = <0 0x15330000 0 0x1000>;
9461e0caac9e4c jason-ch chen              2023-10-23  2303  			#clock-cells = <1>;
9461e0caac9e4c jason-ch chen              2023-10-23  2304  		};
9461e0caac9e4c jason-ch chen              2023-10-23  2305  
0faefcca3cb8f8 Bo Kong                    2025-04-03 @2306  		larb12: larb@15340000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
