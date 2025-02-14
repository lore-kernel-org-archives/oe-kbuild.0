Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC76B196C7C
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Feb 2025 19:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739561535; cv=none; b=MFJME+geeQwJl2NQELehfQ/pUNo0HshgrOpso0DeE3SGr+Bwc7CCq49gpV3R1wNe6SJCjTxOZC2qOtxQo2OoijLwNrxofYuXJHsEp+pt8NaLVegGedOXaDilK+lB9AePDWI9TZ7pU/aBO+wTEvr38MCtnegRDqatukYvAfCNJu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739561535; c=relaxed/simple;
	bh=1SHuqroRSLNkBYwEe78RkxVc56eZXLnkzObx23yGsVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sGgrwl21PdQ022ctyu7z9Kwwt6Qn7mNttca8IY1qu2bRXEZBD9XaLcnqXzxwZGzUMJj1WSZwqRocVBeoa1NweJoQgqDkcisLgGnijrSKpz4o94V4BIXzuUqmmkkRIFu6xycmj/7DOHETnOdauVADjG0zqisDESxm36GkAWmf/IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IsA5oRGC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IsA5oRGC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739561526; x=1771097526;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1SHuqroRSLNkBYwEe78RkxVc56eZXLnkzObx23yGsVI=;
  b=IsA5oRGCqYsC+p5nVYHmEivqy8aneqs/3+vN81MGrlrWuhQ6LI+xBUCz
   0WQXv+XCgHKky96GtERKjcW5b4gLTGVF/yTIDC0EfqwFHWjKy0OnKM0jF
   4w3/28y1Z9J3/GXc9inz4nHqTGzNLYPt8RBlE3jER6ei5SaI2R4muaq/f
   9rnUpGLTI8os6/0xx1x/W3zjwQsqDSIg13DYuhfPPgj9fwuv+zVM3TnSb
   W25xpNF9zg3v7X9bgVCiViIIc6HM35qd4aCBcMdKGtEaCFiUlPIN2+cuP
   csK7AKIpHeeRZQRIPK4VHQuEYWYkdfXEeHsPZdf9agDzVKD5NjpB9/6rT
   w==;
X-CSE-ConnectionGUID: NtT6fbIiRSaCcpoaARxogQ==
X-CSE-MsgGUID: ANjj53jRSUS+YvlF12cI6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="44086668"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="44086668"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 11:32:05 -0800
X-CSE-ConnectionGUID: GvY7EzHkRoCoVK/M61kvJA==
X-CSE-MsgGUID: gx0H+1WaQyuqK4pM98pklQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="118570830"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Feb 2025 11:32:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj1Ps-001A5D-2z;
	Fri, 14 Feb 2025 19:32:00 +0000
Date: Sat, 15 Feb 2025 03:31:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 3/3] arm64: dts: mediatek: mt8395-nio-12l:
 Preconfigure DSI0 pipeline
Message-ID: <202502150340.aJVkIlU3-lkp@intel.com>
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
In-Reply-To: <20250213112008.56394-4-angelogioacchino.delregno@collabora.com>
References: <20250213112008.56394-4-angelogioacchino.delregno@collabora.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: matthias.bgg@gmail.com
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: angelogioacchino.delregno@collabora.com
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: kernel@collabora.com
CC: pablo.sun@mediatek.com

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.14-rc2 next-20250214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/arm64-dts-mediatek-mt8195-Add-base-display-controller-graph/20250213-192515
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250213112008.56394-4-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v1 3/3] arm64: dts: mediatek: mt8395-nio-12l: Preconfigure DSI0 pipeline
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm64-randconfig-r072-20250214 (https://download.01.org/0day-ci/archive/20250215/202502150340.aJVkIlU3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502150340.aJVkIlU3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3013.17-3070.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3087.17-3123.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8195.dtsi:3331.22-3343.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1c008000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +3331 arch/arm64/boot/dts/mediatek/mt8195.dtsi

37f2582883be72 Tinghan Shen               2022-04-11    19  
37f2582883be72 Tinghan Shen               2022-04-11    20  / {
37f2582883be72 Tinghan Shen               2022-04-11    21  	compatible = "mediatek,mt8195";
37f2582883be72 Tinghan Shen               2022-04-11    22  	interrupt-parent = <&gic>;
37f2582883be72 Tinghan Shen               2022-04-11    23  	#address-cells = <2>;
37f2582883be72 Tinghan Shen               2022-04-11    24  	#size-cells = <2>;
37f2582883be72 Tinghan Shen               2022-04-11    25  
329239a154bc73 Jason-JH.Lin               2022-08-11    26  	aliases {
f8fdf9ed5bfc4e AngeloGioacchino Del Regno 2023-04-24    27  		dp-intf0 = &dp_intf0;
f8fdf9ed5bfc4e AngeloGioacchino Del Regno 2023-04-24    28  		dp-intf1 = &dp_intf1;
329239a154bc73 Jason-JH.Lin               2022-08-11    29  		gce0 = &gce0;
329239a154bc73 Jason-JH.Lin               2022-08-11    30  		gce1 = &gce1;
92d2c23dc26998 Nancy.Lin                  2023-03-23    31  		ethdr0 = &ethdr0;
92d2c23dc26998 Nancy.Lin                  2023-03-23    32  		mutex0 = &mutex;
92d2c23dc26998 Nancy.Lin                  2023-03-23    33  		mutex1 = &mutex1;
92d2c23dc26998 Nancy.Lin                  2023-03-23    34  		merge1 = &merge1;
92d2c23dc26998 Nancy.Lin                  2023-03-23    35  		merge2 = &merge2;
92d2c23dc26998 Nancy.Lin                  2023-03-23    36  		merge3 = &merge3;
92d2c23dc26998 Nancy.Lin                  2023-03-23    37  		merge4 = &merge4;
92d2c23dc26998 Nancy.Lin                  2023-03-23    38  		merge5 = &merge5;
92d2c23dc26998 Nancy.Lin                  2023-03-23    39  		vdo1-rdma0 = &vdo1_rdma0;
92d2c23dc26998 Nancy.Lin                  2023-03-23    40  		vdo1-rdma1 = &vdo1_rdma1;
92d2c23dc26998 Nancy.Lin                  2023-03-23    41  		vdo1-rdma2 = &vdo1_rdma2;
92d2c23dc26998 Nancy.Lin                  2023-03-23    42  		vdo1-rdma3 = &vdo1_rdma3;
92d2c23dc26998 Nancy.Lin                  2023-03-23    43  		vdo1-rdma4 = &vdo1_rdma4;
92d2c23dc26998 Nancy.Lin                  2023-03-23    44  		vdo1-rdma5 = &vdo1_rdma5;
92d2c23dc26998 Nancy.Lin                  2023-03-23    45  		vdo1-rdma6 = &vdo1_rdma6;
92d2c23dc26998 Nancy.Lin                  2023-03-23    46  		vdo1-rdma7 = &vdo1_rdma7;
329239a154bc73 Jason-JH.Lin               2022-08-11    47  	};
329239a154bc73 Jason-JH.Lin               2022-08-11    48  
37f2582883be72 Tinghan Shen               2022-04-11    49  	cpus {
37f2582883be72 Tinghan Shen               2022-04-11    50  		#address-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11    51  		#size-cells = <0>;
37f2582883be72 Tinghan Shen               2022-04-11    52  
37f2582883be72 Tinghan Shen               2022-04-11    53  		cpu0: cpu@0 {
37f2582883be72 Tinghan Shen               2022-04-11    54  			device_type = "cpu";
37f2582883be72 Tinghan Shen               2022-04-11    55  			compatible = "arm,cortex-a55";
37f2582883be72 Tinghan Shen               2022-04-11    56  			reg = <0x000>;
37f2582883be72 Tinghan Shen               2022-04-11    57  			enable-method = "psci";
e39e72cffea328 YT Lee                     2022-08-11    58  			performance-domains = <&performance 0>;
37f2582883be72 Tinghan Shen               2022-04-11    59  			clock-frequency = <1701000000>;
513c43328b1898 AngeloGioacchino Del Regno 2022-10-05    60  			capacity-dmips-mhz = <308>;
66fe2431faa227 AngeloGioacchino Del Regno 2023-01-26    61  			cpu-idle-states = <&cpu_ret_l &cpu_off_l>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06    62  			i-cache-size = <32768>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06    63  			i-cache-line-size = <64>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06    64  			i-cache-sets = <128>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06    65  			d-cache-size = <32768>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06    66  			d-cache-line-size = <64>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06    67  			d-cache-sets = <128>;
37f2582883be72 Tinghan Shen               2022-04-11    68  			next-level-cache = <&l2_0>;
37f2582883be72 Tinghan Shen               2022-04-11    69  			#cooling-cells = <2>;
37f2582883be72 Tinghan Shen               2022-04-11    70  		};
37f2582883be72 Tinghan Shen               2022-04-11    71  
37f2582883be72 Tinghan Shen               2022-04-11    72  		cpu1: cpu@100 {
37f2582883be72 Tinghan Shen               2022-04-11    73  			device_type = "cpu";
37f2582883be72 Tinghan Shen               2022-04-11    74  			compatible = "arm,cortex-a55";
37f2582883be72 Tinghan Shen               2022-04-11    75  			reg = <0x100>;
37f2582883be72 Tinghan Shen               2022-04-11    76  			enable-method = "psci";
e39e72cffea328 YT Lee                     2022-08-11    77  			performance-domains = <&performance 0>;
37f2582883be72 Tinghan Shen               2022-04-11    78  			clock-frequency = <1701000000>;
513c43328b1898 AngeloGioacchino Del Regno 2022-10-05    79  			capacity-dmips-mhz = <308>;
66fe2431faa227 AngeloGioacchino Del Regno 2023-01-26    80  			cpu-idle-states = <&cpu_ret_l &cpu_off_l>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06    81  			i-cache-size = <32768>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06    82  			i-cache-line-size = <64>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06    83  			i-cache-sets = <128>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06    84  			d-cache-size = <32768>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06    85  			d-cache-line-size = <64>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06    86  			d-cache-sets = <128>;
37f2582883be72 Tinghan Shen               2022-04-11    87  			next-level-cache = <&l2_0>;
37f2582883be72 Tinghan Shen               2022-04-11    88  			#cooling-cells = <2>;
37f2582883be72 Tinghan Shen               2022-04-11    89  		};
37f2582883be72 Tinghan Shen               2022-04-11    90  
37f2582883be72 Tinghan Shen               2022-04-11    91  		cpu2: cpu@200 {
37f2582883be72 Tinghan Shen               2022-04-11    92  			device_type = "cpu";
37f2582883be72 Tinghan Shen               2022-04-11    93  			compatible = "arm,cortex-a55";
37f2582883be72 Tinghan Shen               2022-04-11    94  			reg = <0x200>;
37f2582883be72 Tinghan Shen               2022-04-11    95  			enable-method = "psci";
e39e72cffea328 YT Lee                     2022-08-11    96  			performance-domains = <&performance 0>;
37f2582883be72 Tinghan Shen               2022-04-11    97  			clock-frequency = <1701000000>;
513c43328b1898 AngeloGioacchino Del Regno 2022-10-05    98  			capacity-dmips-mhz = <308>;
66fe2431faa227 AngeloGioacchino Del Regno 2023-01-26    99  			cpu-idle-states = <&cpu_ret_l &cpu_off_l>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   100  			i-cache-size = <32768>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   101  			i-cache-line-size = <64>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   102  			i-cache-sets = <128>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   103  			d-cache-size = <32768>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   104  			d-cache-line-size = <64>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   105  			d-cache-sets = <128>;
37f2582883be72 Tinghan Shen               2022-04-11   106  			next-level-cache = <&l2_0>;
37f2582883be72 Tinghan Shen               2022-04-11   107  			#cooling-cells = <2>;
37f2582883be72 Tinghan Shen               2022-04-11   108  		};
37f2582883be72 Tinghan Shen               2022-04-11   109  
37f2582883be72 Tinghan Shen               2022-04-11   110  		cpu3: cpu@300 {
37f2582883be72 Tinghan Shen               2022-04-11   111  			device_type = "cpu";
37f2582883be72 Tinghan Shen               2022-04-11   112  			compatible = "arm,cortex-a55";
37f2582883be72 Tinghan Shen               2022-04-11   113  			reg = <0x300>;
37f2582883be72 Tinghan Shen               2022-04-11   114  			enable-method = "psci";
e39e72cffea328 YT Lee                     2022-08-11   115  			performance-domains = <&performance 0>;
37f2582883be72 Tinghan Shen               2022-04-11   116  			clock-frequency = <1701000000>;
513c43328b1898 AngeloGioacchino Del Regno 2022-10-05   117  			capacity-dmips-mhz = <308>;
66fe2431faa227 AngeloGioacchino Del Regno 2023-01-26   118  			cpu-idle-states = <&cpu_ret_l &cpu_off_l>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   119  			i-cache-size = <32768>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   120  			i-cache-line-size = <64>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   121  			i-cache-sets = <128>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   122  			d-cache-size = <32768>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   123  			d-cache-line-size = <64>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   124  			d-cache-sets = <128>;
37f2582883be72 Tinghan Shen               2022-04-11   125  			next-level-cache = <&l2_0>;
37f2582883be72 Tinghan Shen               2022-04-11   126  			#cooling-cells = <2>;
37f2582883be72 Tinghan Shen               2022-04-11   127  		};
37f2582883be72 Tinghan Shen               2022-04-11   128  
37f2582883be72 Tinghan Shen               2022-04-11   129  		cpu4: cpu@400 {
37f2582883be72 Tinghan Shen               2022-04-11   130  			device_type = "cpu";
37f2582883be72 Tinghan Shen               2022-04-11   131  			compatible = "arm,cortex-a78";
37f2582883be72 Tinghan Shen               2022-04-11   132  			reg = <0x400>;
37f2582883be72 Tinghan Shen               2022-04-11   133  			enable-method = "psci";
e39e72cffea328 YT Lee                     2022-08-11   134  			performance-domains = <&performance 1>;
37f2582883be72 Tinghan Shen               2022-04-11   135  			clock-frequency = <2171000000>;
37f2582883be72 Tinghan Shen               2022-04-11   136  			capacity-dmips-mhz = <1024>;
66fe2431faa227 AngeloGioacchino Del Regno 2023-01-26   137  			cpu-idle-states = <&cpu_ret_b &cpu_off_b>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   138  			i-cache-size = <65536>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   139  			i-cache-line-size = <64>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   140  			i-cache-sets = <256>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   141  			d-cache-size = <65536>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   142  			d-cache-line-size = <64>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   143  			d-cache-sets = <256>;
37f2582883be72 Tinghan Shen               2022-04-11   144  			next-level-cache = <&l2_1>;
37f2582883be72 Tinghan Shen               2022-04-11   145  			#cooling-cells = <2>;
37f2582883be72 Tinghan Shen               2022-04-11   146  		};
37f2582883be72 Tinghan Shen               2022-04-11   147  
37f2582883be72 Tinghan Shen               2022-04-11   148  		cpu5: cpu@500 {
37f2582883be72 Tinghan Shen               2022-04-11   149  			device_type = "cpu";
37f2582883be72 Tinghan Shen               2022-04-11   150  			compatible = "arm,cortex-a78";
37f2582883be72 Tinghan Shen               2022-04-11   151  			reg = <0x500>;
37f2582883be72 Tinghan Shen               2022-04-11   152  			enable-method = "psci";
e39e72cffea328 YT Lee                     2022-08-11   153  			performance-domains = <&performance 1>;
37f2582883be72 Tinghan Shen               2022-04-11   154  			clock-frequency = <2171000000>;
37f2582883be72 Tinghan Shen               2022-04-11   155  			capacity-dmips-mhz = <1024>;
66fe2431faa227 AngeloGioacchino Del Regno 2023-01-26   156  			cpu-idle-states = <&cpu_ret_b &cpu_off_b>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   157  			i-cache-size = <65536>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   158  			i-cache-line-size = <64>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   159  			i-cache-sets = <256>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   160  			d-cache-size = <65536>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   161  			d-cache-line-size = <64>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   162  			d-cache-sets = <256>;
37f2582883be72 Tinghan Shen               2022-04-11   163  			next-level-cache = <&l2_1>;
37f2582883be72 Tinghan Shen               2022-04-11   164  			#cooling-cells = <2>;
37f2582883be72 Tinghan Shen               2022-04-11   165  		};
37f2582883be72 Tinghan Shen               2022-04-11   166  
37f2582883be72 Tinghan Shen               2022-04-11   167  		cpu6: cpu@600 {
37f2582883be72 Tinghan Shen               2022-04-11   168  			device_type = "cpu";
37f2582883be72 Tinghan Shen               2022-04-11   169  			compatible = "arm,cortex-a78";
37f2582883be72 Tinghan Shen               2022-04-11   170  			reg = <0x600>;
37f2582883be72 Tinghan Shen               2022-04-11   171  			enable-method = "psci";
e39e72cffea328 YT Lee                     2022-08-11   172  			performance-domains = <&performance 1>;
37f2582883be72 Tinghan Shen               2022-04-11   173  			clock-frequency = <2171000000>;
37f2582883be72 Tinghan Shen               2022-04-11   174  			capacity-dmips-mhz = <1024>;
66fe2431faa227 AngeloGioacchino Del Regno 2023-01-26   175  			cpu-idle-states = <&cpu_ret_b &cpu_off_b>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   176  			i-cache-size = <65536>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   177  			i-cache-line-size = <64>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   178  			i-cache-sets = <256>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   179  			d-cache-size = <65536>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   180  			d-cache-line-size = <64>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   181  			d-cache-sets = <256>;
37f2582883be72 Tinghan Shen               2022-04-11   182  			next-level-cache = <&l2_1>;
37f2582883be72 Tinghan Shen               2022-04-11   183  			#cooling-cells = <2>;
37f2582883be72 Tinghan Shen               2022-04-11   184  		};
37f2582883be72 Tinghan Shen               2022-04-11   185  
37f2582883be72 Tinghan Shen               2022-04-11   186  		cpu7: cpu@700 {
37f2582883be72 Tinghan Shen               2022-04-11   187  			device_type = "cpu";
37f2582883be72 Tinghan Shen               2022-04-11   188  			compatible = "arm,cortex-a78";
37f2582883be72 Tinghan Shen               2022-04-11   189  			reg = <0x700>;
37f2582883be72 Tinghan Shen               2022-04-11   190  			enable-method = "psci";
e39e72cffea328 YT Lee                     2022-08-11   191  			performance-domains = <&performance 1>;
37f2582883be72 Tinghan Shen               2022-04-11   192  			clock-frequency = <2171000000>;
37f2582883be72 Tinghan Shen               2022-04-11   193  			capacity-dmips-mhz = <1024>;
66fe2431faa227 AngeloGioacchino Del Regno 2023-01-26   194  			cpu-idle-states = <&cpu_ret_b &cpu_off_b>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   195  			i-cache-size = <65536>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   196  			i-cache-line-size = <64>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   197  			i-cache-sets = <256>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   198  			d-cache-size = <65536>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   199  			d-cache-line-size = <64>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   200  			d-cache-sets = <256>;
37f2582883be72 Tinghan Shen               2022-04-11   201  			next-level-cache = <&l2_1>;
37f2582883be72 Tinghan Shen               2022-04-11   202  			#cooling-cells = <2>;
37f2582883be72 Tinghan Shen               2022-04-11   203  		};
37f2582883be72 Tinghan Shen               2022-04-11   204  
37f2582883be72 Tinghan Shen               2022-04-11   205  		cpu-map {
37f2582883be72 Tinghan Shen               2022-04-11   206  			cluster0 {
37f2582883be72 Tinghan Shen               2022-04-11   207  				core0 {
37f2582883be72 Tinghan Shen               2022-04-11   208  					cpu = <&cpu0>;
37f2582883be72 Tinghan Shen               2022-04-11   209  				};
37f2582883be72 Tinghan Shen               2022-04-11   210  
37f2582883be72 Tinghan Shen               2022-04-11   211  				core1 {
37f2582883be72 Tinghan Shen               2022-04-11   212  					cpu = <&cpu1>;
37f2582883be72 Tinghan Shen               2022-04-11   213  				};
37f2582883be72 Tinghan Shen               2022-04-11   214  
37f2582883be72 Tinghan Shen               2022-04-11   215  				core2 {
37f2582883be72 Tinghan Shen               2022-04-11   216  					cpu = <&cpu2>;
37f2582883be72 Tinghan Shen               2022-04-11   217  				};
37f2582883be72 Tinghan Shen               2022-04-11   218  
37f2582883be72 Tinghan Shen               2022-04-11   219  				core3 {
37f2582883be72 Tinghan Shen               2022-04-11   220  					cpu = <&cpu3>;
37f2582883be72 Tinghan Shen               2022-04-11   221  				};
37f2582883be72 Tinghan Shen               2022-04-11   222  
cc4f0b13a887b4 AngeloGioacchino Del Regno 2023-01-26   223  				core4 {
37f2582883be72 Tinghan Shen               2022-04-11   224  					cpu = <&cpu4>;
37f2582883be72 Tinghan Shen               2022-04-11   225  				};
37f2582883be72 Tinghan Shen               2022-04-11   226  
cc4f0b13a887b4 AngeloGioacchino Del Regno 2023-01-26   227  				core5 {
37f2582883be72 Tinghan Shen               2022-04-11   228  					cpu = <&cpu5>;
37f2582883be72 Tinghan Shen               2022-04-11   229  				};
37f2582883be72 Tinghan Shen               2022-04-11   230  
cc4f0b13a887b4 AngeloGioacchino Del Regno 2023-01-26   231  				core6 {
37f2582883be72 Tinghan Shen               2022-04-11   232  					cpu = <&cpu6>;
37f2582883be72 Tinghan Shen               2022-04-11   233  				};
37f2582883be72 Tinghan Shen               2022-04-11   234  
cc4f0b13a887b4 AngeloGioacchino Del Regno 2023-01-26   235  				core7 {
37f2582883be72 Tinghan Shen               2022-04-11   236  					cpu = <&cpu7>;
37f2582883be72 Tinghan Shen               2022-04-11   237  				};
37f2582883be72 Tinghan Shen               2022-04-11   238  			};
37f2582883be72 Tinghan Shen               2022-04-11   239  		};
37f2582883be72 Tinghan Shen               2022-04-11   240  
37f2582883be72 Tinghan Shen               2022-04-11   241  		idle-states {
37f2582883be72 Tinghan Shen               2022-04-11   242  			entry-method = "psci";
37f2582883be72 Tinghan Shen               2022-04-11   243  
66fe2431faa227 AngeloGioacchino Del Regno 2023-01-26   244  			cpu_ret_l: cpu-retention-l {
37f2582883be72 Tinghan Shen               2022-04-11   245  				compatible = "arm,idle-state";
37f2582883be72 Tinghan Shen               2022-04-11   246  				arm,psci-suspend-param = <0x00010001>;
37f2582883be72 Tinghan Shen               2022-04-11   247  				local-timer-stop;
37f2582883be72 Tinghan Shen               2022-04-11   248  				entry-latency-us = <50>;
37f2582883be72 Tinghan Shen               2022-04-11   249  				exit-latency-us = <95>;
37f2582883be72 Tinghan Shen               2022-04-11   250  				min-residency-us = <580>;
37f2582883be72 Tinghan Shen               2022-04-11   251  			};
37f2582883be72 Tinghan Shen               2022-04-11   252  
66fe2431faa227 AngeloGioacchino Del Regno 2023-01-26   253  			cpu_ret_b: cpu-retention-b {
37f2582883be72 Tinghan Shen               2022-04-11   254  				compatible = "arm,idle-state";
37f2582883be72 Tinghan Shen               2022-04-11   255  				arm,psci-suspend-param = <0x00010001>;
37f2582883be72 Tinghan Shen               2022-04-11   256  				local-timer-stop;
37f2582883be72 Tinghan Shen               2022-04-11   257  				entry-latency-us = <45>;
37f2582883be72 Tinghan Shen               2022-04-11   258  				exit-latency-us = <140>;
37f2582883be72 Tinghan Shen               2022-04-11   259  				min-residency-us = <740>;
37f2582883be72 Tinghan Shen               2022-04-11   260  			};
37f2582883be72 Tinghan Shen               2022-04-11   261  
66fe2431faa227 AngeloGioacchino Del Regno 2023-01-26   262  			cpu_off_l: cpu-off-l {
37f2582883be72 Tinghan Shen               2022-04-11   263  				compatible = "arm,idle-state";
37f2582883be72 Tinghan Shen               2022-04-11   264  				arm,psci-suspend-param = <0x01010002>;
37f2582883be72 Tinghan Shen               2022-04-11   265  				local-timer-stop;
37f2582883be72 Tinghan Shen               2022-04-11   266  				entry-latency-us = <55>;
37f2582883be72 Tinghan Shen               2022-04-11   267  				exit-latency-us = <155>;
37f2582883be72 Tinghan Shen               2022-04-11   268  				min-residency-us = <840>;
37f2582883be72 Tinghan Shen               2022-04-11   269  			};
37f2582883be72 Tinghan Shen               2022-04-11   270  
66fe2431faa227 AngeloGioacchino Del Regno 2023-01-26   271  			cpu_off_b: cpu-off-b {
37f2582883be72 Tinghan Shen               2022-04-11   272  				compatible = "arm,idle-state";
37f2582883be72 Tinghan Shen               2022-04-11   273  				arm,psci-suspend-param = <0x01010002>;
37f2582883be72 Tinghan Shen               2022-04-11   274  				local-timer-stop;
37f2582883be72 Tinghan Shen               2022-04-11   275  				entry-latency-us = <50>;
37f2582883be72 Tinghan Shen               2022-04-11   276  				exit-latency-us = <200>;
37f2582883be72 Tinghan Shen               2022-04-11   277  				min-residency-us = <1000>;
37f2582883be72 Tinghan Shen               2022-04-11   278  			};
37f2582883be72 Tinghan Shen               2022-04-11   279  		};
37f2582883be72 Tinghan Shen               2022-04-11   280  
37f2582883be72 Tinghan Shen               2022-04-11   281  		l2_0: l2-cache0 {
37f2582883be72 Tinghan Shen               2022-04-11   282  			compatible = "cache";
ce459b1da752cf Pierre Gondois             2022-11-07   283  			cache-level = <2>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   284  			cache-size = <131072>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   285  			cache-line-size = <64>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   286  			cache-sets = <512>;
37f2582883be72 Tinghan Shen               2022-04-11   287  			next-level-cache = <&l3_0>;
492061bfc045d8 Krzysztof Kozlowski        2023-04-22   288  			cache-unified;
37f2582883be72 Tinghan Shen               2022-04-11   289  		};
37f2582883be72 Tinghan Shen               2022-04-11   290  
37f2582883be72 Tinghan Shen               2022-04-11   291  		l2_1: l2-cache1 {
37f2582883be72 Tinghan Shen               2022-04-11   292  			compatible = "cache";
ce459b1da752cf Pierre Gondois             2022-11-07   293  			cache-level = <2>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   294  			cache-size = <262144>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   295  			cache-line-size = <64>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   296  			cache-sets = <512>;
37f2582883be72 Tinghan Shen               2022-04-11   297  			next-level-cache = <&l3_0>;
492061bfc045d8 Krzysztof Kozlowski        2023-04-22   298  			cache-unified;
37f2582883be72 Tinghan Shen               2022-04-11   299  		};
37f2582883be72 Tinghan Shen               2022-04-11   300  
37f2582883be72 Tinghan Shen               2022-04-11   301  		l3_0: l3-cache {
37f2582883be72 Tinghan Shen               2022-04-11   302  			compatible = "cache";
ce459b1da752cf Pierre Gondois             2022-11-07   303  			cache-level = <3>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   304  			cache-size = <2097152>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   305  			cache-line-size = <64>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   306  			cache-sets = <2048>;
b68188a70ee9e5 AngeloGioacchino Del Regno 2022-12-06   307  			cache-unified;
37f2582883be72 Tinghan Shen               2022-04-11   308  		};
37f2582883be72 Tinghan Shen               2022-04-11   309  	};
37f2582883be72 Tinghan Shen               2022-04-11   310  
37f2582883be72 Tinghan Shen               2022-04-11   311  	dsu-pmu {
37f2582883be72 Tinghan Shen               2022-04-11   312  		compatible = "arm,dsu-pmu";
37f2582883be72 Tinghan Shen               2022-04-11   313  		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11   314  		cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
37f2582883be72 Tinghan Shen               2022-04-11   315  		       <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
d192615c307ec9 Nícolas F. R. A. Prado     2023-10-03   316  		status = "fail";
37f2582883be72 Tinghan Shen               2022-04-11   317  	};
37f2582883be72 Tinghan Shen               2022-04-11   318  
8903821c8ef9fe Tinghan Shen               2022-08-11   319  	dmic_codec: dmic-codec {
8903821c8ef9fe Tinghan Shen               2022-08-11   320  		compatible = "dmic-codec";
8903821c8ef9fe Tinghan Shen               2022-08-11   321  		num-channels = <2>;
8903821c8ef9fe Tinghan Shen               2022-08-11   322  		wakeup-delay-ms = <50>;
8903821c8ef9fe Tinghan Shen               2022-08-11   323  	};
8903821c8ef9fe Tinghan Shen               2022-08-11   324  
8903821c8ef9fe Tinghan Shen               2022-08-11   325  	sound: mt8195-sound {
8903821c8ef9fe Tinghan Shen               2022-08-11   326  		mediatek,platform = <&afe>;
8903821c8ef9fe Tinghan Shen               2022-08-11   327  		status = "disabled";
8903821c8ef9fe Tinghan Shen               2022-08-11   328  	};
8903821c8ef9fe Tinghan Shen               2022-08-11   329  
0f1c806b65d136 Chen-Yu Tsai               2022-12-01   330  	clk13m: fixed-factor-clock-13m {
0f1c806b65d136 Chen-Yu Tsai               2022-12-01   331  		compatible = "fixed-factor-clock";
0f1c806b65d136 Chen-Yu Tsai               2022-12-01   332  		#clock-cells = <0>;
0f1c806b65d136 Chen-Yu Tsai               2022-12-01   333  		clocks = <&clk26m>;
0f1c806b65d136 Chen-Yu Tsai               2022-12-01   334  		clock-div = <2>;
0f1c806b65d136 Chen-Yu Tsai               2022-12-01   335  		clock-mult = <1>;
0f1c806b65d136 Chen-Yu Tsai               2022-12-01   336  		clock-output-names = "clk13m";
0f1c806b65d136 Chen-Yu Tsai               2022-12-01   337  	};
0f1c806b65d136 Chen-Yu Tsai               2022-12-01   338  
37f2582883be72 Tinghan Shen               2022-04-11   339  	clk26m: oscillator-26m {
37f2582883be72 Tinghan Shen               2022-04-11   340  		compatible = "fixed-clock";
37f2582883be72 Tinghan Shen               2022-04-11   341  		#clock-cells = <0>;
37f2582883be72 Tinghan Shen               2022-04-11   342  		clock-frequency = <26000000>;
37f2582883be72 Tinghan Shen               2022-04-11   343  		clock-output-names = "clk26m";
37f2582883be72 Tinghan Shen               2022-04-11   344  	};
37f2582883be72 Tinghan Shen               2022-04-11   345  
37f2582883be72 Tinghan Shen               2022-04-11   346  	clk32k: oscillator-32k {
37f2582883be72 Tinghan Shen               2022-04-11   347  		compatible = "fixed-clock";
37f2582883be72 Tinghan Shen               2022-04-11   348  		#clock-cells = <0>;
37f2582883be72 Tinghan Shen               2022-04-11   349  		clock-frequency = <32768>;
37f2582883be72 Tinghan Shen               2022-04-11   350  		clock-output-names = "clk32k";
37f2582883be72 Tinghan Shen               2022-04-11   351  	};
37f2582883be72 Tinghan Shen               2022-04-11   352  
e39e72cffea328 YT Lee                     2022-08-11   353  	performance: performance-controller@11bc10 {
e39e72cffea328 YT Lee                     2022-08-11   354  		compatible = "mediatek,cpufreq-hw";
e39e72cffea328 YT Lee                     2022-08-11   355  		reg = <0 0x0011bc10 0 0x120>, <0 0x0011bd30 0 0x120>;
e39e72cffea328 YT Lee                     2022-08-11   356  		#performance-domain-cells = <1>;
e39e72cffea328 YT Lee                     2022-08-11   357  	};
e39e72cffea328 YT Lee                     2022-08-11   358  
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   359  	gpu_opp_table: opp-table-gpu {
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   360  		compatible = "operating-points-v2";
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   361  		opp-shared;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   362  
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   363  		opp-390000000 {
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   364  			opp-hz = /bits/ 64 <390000000>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   365  			opp-microvolt = <625000>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   366  		};
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   367  		opp-410000000 {
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   368  			opp-hz = /bits/ 64 <410000000>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   369  			opp-microvolt = <631250>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   370  		};
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   371  		opp-431000000 {
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   372  			opp-hz = /bits/ 64 <431000000>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   373  			opp-microvolt = <631250>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   374  		};
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   375  		opp-473000000 {
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   376  			opp-hz = /bits/ 64 <473000000>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   377  			opp-microvolt = <637500>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   378  		};
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   379  		opp-515000000 {
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   380  			opp-hz = /bits/ 64 <515000000>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   381  			opp-microvolt = <637500>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   382  		};
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   383  		opp-556000000 {
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   384  			opp-hz = /bits/ 64 <556000000>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   385  			opp-microvolt = <643750>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   386  		};
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   387  		opp-598000000 {
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   388  			opp-hz = /bits/ 64 <598000000>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   389  			opp-microvolt = <650000>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   390  		};
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   391  		opp-640000000 {
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   392  			opp-hz = /bits/ 64 <640000000>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   393  			opp-microvolt = <650000>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   394  		};
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   395  		opp-670000000 {
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   396  			opp-hz = /bits/ 64 <670000000>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   397  			opp-microvolt = <662500>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   398  		};
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   399  		opp-700000000 {
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   400  			opp-hz = /bits/ 64 <700000000>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   401  			opp-microvolt = <675000>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   402  		};
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   403  		opp-730000000 {
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   404  			opp-hz = /bits/ 64 <730000000>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   405  			opp-microvolt = <687500>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   406  		};
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   407  		opp-760000000 {
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   408  			opp-hz = /bits/ 64 <760000000>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   409  			opp-microvolt = <700000>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   410  		};
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   411  		opp-790000000 {
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   412  			opp-hz = /bits/ 64 <790000000>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   413  			opp-microvolt = <712500>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   414  		};
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   415  		opp-820000000 {
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   416  			opp-hz = /bits/ 64 <820000000>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   417  			opp-microvolt = <725000>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   418  		};
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   419  		opp-850000000 {
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   420  			opp-hz = /bits/ 64 <850000000>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   421  			opp-microvolt = <737500>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   422  		};
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   423  		opp-880000000 {
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   424  			opp-hz = /bits/ 64 <880000000>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   425  			opp-microvolt = <750000>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   426  		};
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   427  	};
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01   428  
37f2582883be72 Tinghan Shen               2022-04-11   429  	pmu-a55 {
37f2582883be72 Tinghan Shen               2022-04-11   430  		compatible = "arm,cortex-a55-pmu";
37f2582883be72 Tinghan Shen               2022-04-11   431  		interrupt-parent = <&gic>;
37f2582883be72 Tinghan Shen               2022-04-11   432  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
37f2582883be72 Tinghan Shen               2022-04-11   433  	};
37f2582883be72 Tinghan Shen               2022-04-11   434  
37f2582883be72 Tinghan Shen               2022-04-11   435  	pmu-a78 {
37f2582883be72 Tinghan Shen               2022-04-11   436  		compatible = "arm,cortex-a78-pmu";
37f2582883be72 Tinghan Shen               2022-04-11   437  		interrupt-parent = <&gic>;
37f2582883be72 Tinghan Shen               2022-04-11   438  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
37f2582883be72 Tinghan Shen               2022-04-11   439  	};
37f2582883be72 Tinghan Shen               2022-04-11   440  
37f2582883be72 Tinghan Shen               2022-04-11   441  	psci {
37f2582883be72 Tinghan Shen               2022-04-11   442  		compatible = "arm,psci-1.0";
37f2582883be72 Tinghan Shen               2022-04-11   443  		method = "smc";
37f2582883be72 Tinghan Shen               2022-04-11   444  	};
37f2582883be72 Tinghan Shen               2022-04-11   445  
37f2582883be72 Tinghan Shen               2022-04-11   446  	timer: timer {
37f2582883be72 Tinghan Shen               2022-04-11   447  		compatible = "arm,armv8-timer";
37f2582883be72 Tinghan Shen               2022-04-11   448  		interrupt-parent = <&gic>;
37f2582883be72 Tinghan Shen               2022-04-11   449  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
37f2582883be72 Tinghan Shen               2022-04-11   450  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
37f2582883be72 Tinghan Shen               2022-04-11   451  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
37f2582883be72 Tinghan Shen               2022-04-11   452  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11   453  	};
37f2582883be72 Tinghan Shen               2022-04-11   454  
37f2582883be72 Tinghan Shen               2022-04-11   455  	soc {
37f2582883be72 Tinghan Shen               2022-04-11   456  		#address-cells = <2>;
37f2582883be72 Tinghan Shen               2022-04-11   457  		#size-cells = <2>;
37f2582883be72 Tinghan Shen               2022-04-11   458  		compatible = "simple-bus";
37f2582883be72 Tinghan Shen               2022-04-11   459  		ranges;
88c531b42a986c Yong Wu                    2023-04-11   460  		dma-ranges = <0x0 0x0 0x0 0x0 0x4 0x0>;
37f2582883be72 Tinghan Shen               2022-04-11   461  
37f2582883be72 Tinghan Shen               2022-04-11   462  		gic: interrupt-controller@c000000 {
37f2582883be72 Tinghan Shen               2022-04-11   463  			compatible = "arm,gic-v3";
37f2582883be72 Tinghan Shen               2022-04-11   464  			#interrupt-cells = <4>;
37f2582883be72 Tinghan Shen               2022-04-11   465  			#redistributor-regions = <1>;
37f2582883be72 Tinghan Shen               2022-04-11   466  			interrupt-parent = <&gic>;
37f2582883be72 Tinghan Shen               2022-04-11   467  			interrupt-controller;
37f2582883be72 Tinghan Shen               2022-04-11   468  			reg = <0 0x0c000000 0 0x40000>,
37f2582883be72 Tinghan Shen               2022-04-11   469  			      <0 0x0c040000 0 0x200000>;
37f2582883be72 Tinghan Shen               2022-04-11   470  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11   471  
37f2582883be72 Tinghan Shen               2022-04-11   472  			ppi-partitions {
37f2582883be72 Tinghan Shen               2022-04-11   473  				ppi_cluster0: interrupt-partition-0 {
37f2582883be72 Tinghan Shen               2022-04-11   474  					affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
37f2582883be72 Tinghan Shen               2022-04-11   475  				};
37f2582883be72 Tinghan Shen               2022-04-11   476  
37f2582883be72 Tinghan Shen               2022-04-11   477  				ppi_cluster1: interrupt-partition-1 {
37f2582883be72 Tinghan Shen               2022-04-11   478  					affinity = <&cpu4 &cpu5 &cpu6 &cpu7>;
37f2582883be72 Tinghan Shen               2022-04-11   479  				};
37f2582883be72 Tinghan Shen               2022-04-11   480  			};
37f2582883be72 Tinghan Shen               2022-04-11   481  		};
37f2582883be72 Tinghan Shen               2022-04-11   482  
37f2582883be72 Tinghan Shen               2022-04-11   483  		topckgen: syscon@10000000 {
37f2582883be72 Tinghan Shen               2022-04-11   484  			compatible = "mediatek,mt8195-topckgen", "syscon";
37f2582883be72 Tinghan Shen               2022-04-11   485  			reg = <0 0x10000000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11   486  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11   487  		};
37f2582883be72 Tinghan Shen               2022-04-11   488  
37f2582883be72 Tinghan Shen               2022-04-11   489  		infracfg_ao: syscon@10001000 {
c14ab45f5d4580 Macpaul Lin                2024-10-02   490  			compatible = "mediatek,mt8195-infracfg_ao", "syscon";
37f2582883be72 Tinghan Shen               2022-04-11   491  			reg = <0 0x10001000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11   492  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11   493  			#reset-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11   494  		};
37f2582883be72 Tinghan Shen               2022-04-11   495  
37f2582883be72 Tinghan Shen               2022-04-11   496  		pericfg: syscon@10003000 {
37f2582883be72 Tinghan Shen               2022-04-11   497  			compatible = "mediatek,mt8195-pericfg", "syscon";
37f2582883be72 Tinghan Shen               2022-04-11   498  			reg = <0 0x10003000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11   499  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11   500  		};
37f2582883be72 Tinghan Shen               2022-04-11   501  
37f2582883be72 Tinghan Shen               2022-04-11   502  		pio: pinctrl@10005000 {
37f2582883be72 Tinghan Shen               2022-04-11   503  			compatible = "mediatek,mt8195-pinctrl";
37f2582883be72 Tinghan Shen               2022-04-11   504  			reg = <0 0x10005000 0 0x1000>,
37f2582883be72 Tinghan Shen               2022-04-11   505  			      <0 0x11d10000 0 0x1000>,
37f2582883be72 Tinghan Shen               2022-04-11   506  			      <0 0x11d30000 0 0x1000>,
37f2582883be72 Tinghan Shen               2022-04-11   507  			      <0 0x11d40000 0 0x1000>,
37f2582883be72 Tinghan Shen               2022-04-11   508  			      <0 0x11e20000 0 0x1000>,
37f2582883be72 Tinghan Shen               2022-04-11   509  			      <0 0x11eb0000 0 0x1000>,
37f2582883be72 Tinghan Shen               2022-04-11   510  			      <0 0x11f40000 0 0x1000>,
37f2582883be72 Tinghan Shen               2022-04-11   511  			      <0 0x1000b000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11   512  			reg-names = "iocfg0", "iocfg_bm", "iocfg_bl",
37f2582883be72 Tinghan Shen               2022-04-11   513  				    "iocfg_br", "iocfg_lm", "iocfg_rb",
37f2582883be72 Tinghan Shen               2022-04-11   514  				    "iocfg_tl", "eint";
37f2582883be72 Tinghan Shen               2022-04-11   515  			gpio-controller;
37f2582883be72 Tinghan Shen               2022-04-11   516  			#gpio-cells = <2>;
37f2582883be72 Tinghan Shen               2022-04-11   517  			gpio-ranges = <&pio 0 0 144>;
37f2582883be72 Tinghan Shen               2022-04-11   518  			interrupt-controller;
37f2582883be72 Tinghan Shen               2022-04-11   519  			interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11   520  			#interrupt-cells = <2>;
37f2582883be72 Tinghan Shen               2022-04-11   521  		};
37f2582883be72 Tinghan Shen               2022-04-11   522  
2b515194bf0cb8 Tinghan Shen               2022-08-11   523  		scpsys: syscon@10006000 {
2b515194bf0cb8 Tinghan Shen               2022-08-11   524  			compatible = "mediatek,mt8195-scpsys", "syscon", "simple-mfd";
2b515194bf0cb8 Tinghan Shen               2022-08-11   525  			reg = <0 0x10006000 0 0x1000>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   526  
2b515194bf0cb8 Tinghan Shen               2022-08-11   527  			/* System Power Manager */
2b515194bf0cb8 Tinghan Shen               2022-08-11   528  			spm: power-controller {
2b515194bf0cb8 Tinghan Shen               2022-08-11   529  				compatible = "mediatek,mt8195-power-controller";
2b515194bf0cb8 Tinghan Shen               2022-08-11   530  				#address-cells = <1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   531  				#size-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   532  				#power-domain-cells = <1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   533  
2b515194bf0cb8 Tinghan Shen               2022-08-11   534  				/* power domain of the SoC */
2b515194bf0cb8 Tinghan Shen               2022-08-11   535  				mfg0: power-domain@MT8195_POWER_DOMAIN_MFG0 {
2b515194bf0cb8 Tinghan Shen               2022-08-11   536  					reg = <MT8195_POWER_DOMAIN_MFG0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   537  					#address-cells = <1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   538  					#size-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   539  					#power-domain-cells = <1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   540  
3106b14c1cb4b7 AngeloGioacchino Del Regno 2023-10-30   541  					mfg1: power-domain@MT8195_POWER_DOMAIN_MFG1 {
2b515194bf0cb8 Tinghan Shen               2022-08-11   542  						reg = <MT8195_POWER_DOMAIN_MFG1>;
d434abbb560aae AngeloGioacchino Del Regno 2023-03-01   543  						clocks = <&apmixedsys CLK_APMIXED_MFGPLL>,
d434abbb560aae AngeloGioacchino Del Regno 2023-03-01   544  							 <&topckgen CLK_TOP_MFG_CORE_TMP>;
d434abbb560aae AngeloGioacchino Del Regno 2023-03-01   545  						clock-names = "mfg", "alt";
2b515194bf0cb8 Tinghan Shen               2022-08-11   546  						mediatek,infracfg = <&infracfg_ao>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   547  						#address-cells = <1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   548  						#size-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   549  						#power-domain-cells = <1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   550  
2b515194bf0cb8 Tinghan Shen               2022-08-11   551  						power-domain@MT8195_POWER_DOMAIN_MFG2 {
2b515194bf0cb8 Tinghan Shen               2022-08-11   552  							reg = <MT8195_POWER_DOMAIN_MFG2>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   553  							#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   554  						};
2b515194bf0cb8 Tinghan Shen               2022-08-11   555  
2b515194bf0cb8 Tinghan Shen               2022-08-11   556  						power-domain@MT8195_POWER_DOMAIN_MFG3 {
2b515194bf0cb8 Tinghan Shen               2022-08-11   557  							reg = <MT8195_POWER_DOMAIN_MFG3>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   558  							#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   559  						};
2b515194bf0cb8 Tinghan Shen               2022-08-11   560  
2b515194bf0cb8 Tinghan Shen               2022-08-11   561  						power-domain@MT8195_POWER_DOMAIN_MFG4 {
2b515194bf0cb8 Tinghan Shen               2022-08-11   562  							reg = <MT8195_POWER_DOMAIN_MFG4>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   563  							#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   564  						};
2b515194bf0cb8 Tinghan Shen               2022-08-11   565  
2b515194bf0cb8 Tinghan Shen               2022-08-11   566  						power-domain@MT8195_POWER_DOMAIN_MFG5 {
2b515194bf0cb8 Tinghan Shen               2022-08-11   567  							reg = <MT8195_POWER_DOMAIN_MFG5>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   568  							#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   569  						};
2b515194bf0cb8 Tinghan Shen               2022-08-11   570  
2b515194bf0cb8 Tinghan Shen               2022-08-11   571  						power-domain@MT8195_POWER_DOMAIN_MFG6 {
2b515194bf0cb8 Tinghan Shen               2022-08-11   572  							reg = <MT8195_POWER_DOMAIN_MFG6>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   573  							#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   574  						};
2b515194bf0cb8 Tinghan Shen               2022-08-11   575  					};
2b515194bf0cb8 Tinghan Shen               2022-08-11   576  				};
2b515194bf0cb8 Tinghan Shen               2022-08-11   577  
2b515194bf0cb8 Tinghan Shen               2022-08-11   578  				power-domain@MT8195_POWER_DOMAIN_VPPSYS0 {
2b515194bf0cb8 Tinghan Shen               2022-08-11   579  					reg = <MT8195_POWER_DOMAIN_VPPSYS0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   580  					clocks = <&topckgen CLK_TOP_VPP>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   581  						 <&topckgen CLK_TOP_CAM>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   582  						 <&topckgen CLK_TOP_CCU>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   583  						 <&topckgen CLK_TOP_IMG>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   584  						 <&topckgen CLK_TOP_VENC>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   585  						 <&topckgen CLK_TOP_VDEC>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   586  						 <&topckgen CLK_TOP_WPE_VPP>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   587  						 <&topckgen CLK_TOP_CFG_VPP0>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   588  						 <&vppsys0 CLK_VPP0_SMI_COMMON>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   589  						 <&vppsys0 CLK_VPP0_GALS_VDO0_LARB0>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   590  						 <&vppsys0 CLK_VPP0_GALS_VDO0_LARB1>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   591  						 <&vppsys0 CLK_VPP0_GALS_VENCSYS>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   592  						 <&vppsys0 CLK_VPP0_GALS_VENCSYS_CORE1>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   593  						 <&vppsys0 CLK_VPP0_GALS_INFRA>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   594  						 <&vppsys0 CLK_VPP0_GALS_CAMSYS>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   595  						 <&vppsys0 CLK_VPP0_GALS_VPP1_LARB5>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   596  						 <&vppsys0 CLK_VPP0_GALS_VPP1_LARB6>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   597  						 <&vppsys0 CLK_VPP0_SMI_REORDER>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   598  						 <&vppsys0 CLK_VPP0_SMI_IOMMU>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   599  						 <&vppsys0 CLK_VPP0_GALS_IMGSYS_CAMSYS>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   600  						 <&vppsys0 CLK_VPP0_GALS_EMI0_EMI1>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   601  						 <&vppsys0 CLK_VPP0_SMI_SUB_COMMON_REORDER>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   602  						 <&vppsys0 CLK_VPP0_SMI_RSI>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   603  						 <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   604  						 <&vppsys0 CLK_VPP0_GALS_VDEC_VDEC_CORE1>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   605  						 <&vppsys0 CLK_VPP0_GALS_VPP1_WPE>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   606  						 <&vppsys0 CLK_VPP0_GALS_VDO0_VDO1_VENCSYS_CORE1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   607  					clock-names = "vppsys", "vppsys1", "vppsys2", "vppsys3",
2b515194bf0cb8 Tinghan Shen               2022-08-11   608  						      "vppsys4", "vppsys5", "vppsys6", "vppsys7",
2b515194bf0cb8 Tinghan Shen               2022-08-11   609  						      "vppsys0-0", "vppsys0-1", "vppsys0-2", "vppsys0-3",
2b515194bf0cb8 Tinghan Shen               2022-08-11   610  						      "vppsys0-4", "vppsys0-5", "vppsys0-6", "vppsys0-7",
2b515194bf0cb8 Tinghan Shen               2022-08-11   611  						      "vppsys0-8", "vppsys0-9", "vppsys0-10", "vppsys0-11",
2b515194bf0cb8 Tinghan Shen               2022-08-11   612  						      "vppsys0-12", "vppsys0-13", "vppsys0-14",
2b515194bf0cb8 Tinghan Shen               2022-08-11   613  						      "vppsys0-15", "vppsys0-16", "vppsys0-17",
2b515194bf0cb8 Tinghan Shen               2022-08-11   614  						      "vppsys0-18";
2b515194bf0cb8 Tinghan Shen               2022-08-11   615  					mediatek,infracfg = <&infracfg_ao>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   616  					#address-cells = <1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   617  					#size-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   618  					#power-domain-cells = <1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   619  
2b515194bf0cb8 Tinghan Shen               2022-08-11   620  					power-domain@MT8195_POWER_DOMAIN_VDEC1 {
2b515194bf0cb8 Tinghan Shen               2022-08-11   621  						reg = <MT8195_POWER_DOMAIN_VDEC1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   622  						clocks = <&vdecsys CLK_VDEC_LARB1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   623  						clock-names = "vdec1-0";
2b515194bf0cb8 Tinghan Shen               2022-08-11   624  						mediatek,infracfg = <&infracfg_ao>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   625  						#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   626  					};
2b515194bf0cb8 Tinghan Shen               2022-08-11   627  
2b515194bf0cb8 Tinghan Shen               2022-08-11   628  					power-domain@MT8195_POWER_DOMAIN_VENC_CORE1 {
2b515194bf0cb8 Tinghan Shen               2022-08-11   629  						reg = <MT8195_POWER_DOMAIN_VENC_CORE1>;
61b94d54421a1f AngeloGioacchino Del Regno 2023-07-06   630  						clocks = <&vencsys_core1 CLK_VENC_CORE1_LARB>;
61b94d54421a1f AngeloGioacchino Del Regno 2023-07-06   631  						clock-names = "venc1-larb";
2b515194bf0cb8 Tinghan Shen               2022-08-11   632  						mediatek,infracfg = <&infracfg_ao>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   633  						#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   634  					};
2b515194bf0cb8 Tinghan Shen               2022-08-11   635  
2b515194bf0cb8 Tinghan Shen               2022-08-11   636  					power-domain@MT8195_POWER_DOMAIN_VDOSYS0 {
2b515194bf0cb8 Tinghan Shen               2022-08-11   637  						reg = <MT8195_POWER_DOMAIN_VDOSYS0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   638  						clocks = <&topckgen CLK_TOP_CFG_VDO0>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   639  							 <&vdosys0 CLK_VDO0_SMI_GALS>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   640  							 <&vdosys0 CLK_VDO0_SMI_COMMON>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   641  							 <&vdosys0 CLK_VDO0_SMI_EMI>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   642  							 <&vdosys0 CLK_VDO0_SMI_IOMMU>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   643  							 <&vdosys0 CLK_VDO0_SMI_LARB>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   644  							 <&vdosys0 CLK_VDO0_SMI_RSI>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   645  						clock-names = "vdosys0", "vdosys0-0", "vdosys0-1",
2b515194bf0cb8 Tinghan Shen               2022-08-11   646  							      "vdosys0-2", "vdosys0-3",
2b515194bf0cb8 Tinghan Shen               2022-08-11   647  							      "vdosys0-4", "vdosys0-5";
2b515194bf0cb8 Tinghan Shen               2022-08-11   648  						mediatek,infracfg = <&infracfg_ao>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   649  						#address-cells = <1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   650  						#size-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   651  						#power-domain-cells = <1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   652  
2b515194bf0cb8 Tinghan Shen               2022-08-11   653  						power-domain@MT8195_POWER_DOMAIN_VPPSYS1 {
2b515194bf0cb8 Tinghan Shen               2022-08-11   654  							reg = <MT8195_POWER_DOMAIN_VPPSYS1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   655  							clocks = <&topckgen CLK_TOP_CFG_VPP1>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   656  								 <&vppsys1 CLK_VPP1_VPPSYS1_GALS>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   657  								 <&vppsys1 CLK_VPP1_VPPSYS1_LARB>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   658  							clock-names = "vppsys1", "vppsys1-0",
2b515194bf0cb8 Tinghan Shen               2022-08-11   659  								      "vppsys1-1";
2b515194bf0cb8 Tinghan Shen               2022-08-11   660  							mediatek,infracfg = <&infracfg_ao>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   661  							#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   662  						};
2b515194bf0cb8 Tinghan Shen               2022-08-11   663  
2b515194bf0cb8 Tinghan Shen               2022-08-11   664  						power-domain@MT8195_POWER_DOMAIN_WPESYS {
2b515194bf0cb8 Tinghan Shen               2022-08-11   665  							reg = <MT8195_POWER_DOMAIN_WPESYS>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   666  							clocks = <&wpesys CLK_WPE_SMI_LARB7>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   667  								 <&wpesys CLK_WPE_SMI_LARB8>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   668  								 <&wpesys CLK_WPE_SMI_LARB7_P>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   669  								 <&wpesys CLK_WPE_SMI_LARB8_P>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   670  							clock-names = "wepsys-0", "wepsys-1", "wepsys-2",
2b515194bf0cb8 Tinghan Shen               2022-08-11   671  								      "wepsys-3";
2b515194bf0cb8 Tinghan Shen               2022-08-11   672  							mediatek,infracfg = <&infracfg_ao>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   673  							#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   674  						};
2b515194bf0cb8 Tinghan Shen               2022-08-11   675  
2b515194bf0cb8 Tinghan Shen               2022-08-11   676  						power-domain@MT8195_POWER_DOMAIN_VDEC0 {
2b515194bf0cb8 Tinghan Shen               2022-08-11   677  							reg = <MT8195_POWER_DOMAIN_VDEC0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   678  							clocks = <&vdecsys_soc CLK_VDEC_SOC_LARB1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   679  							clock-names = "vdec0-0";
2b515194bf0cb8 Tinghan Shen               2022-08-11   680  							mediatek,infracfg = <&infracfg_ao>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   681  							#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   682  						};
2b515194bf0cb8 Tinghan Shen               2022-08-11   683  
2b515194bf0cb8 Tinghan Shen               2022-08-11   684  						power-domain@MT8195_POWER_DOMAIN_VDEC2 {
2b515194bf0cb8 Tinghan Shen               2022-08-11   685  							reg = <MT8195_POWER_DOMAIN_VDEC2>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   686  							clocks = <&vdecsys_core1 CLK_VDEC_CORE1_LARB1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   687  							clock-names = "vdec2-0";
2b515194bf0cb8 Tinghan Shen               2022-08-11   688  							mediatek,infracfg = <&infracfg_ao>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   689  							#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   690  						};
2b515194bf0cb8 Tinghan Shen               2022-08-11   691  
2b515194bf0cb8 Tinghan Shen               2022-08-11   692  						power-domain@MT8195_POWER_DOMAIN_VENC {
2b515194bf0cb8 Tinghan Shen               2022-08-11   693  							reg = <MT8195_POWER_DOMAIN_VENC>;
61b94d54421a1f AngeloGioacchino Del Regno 2023-07-06   694  							clocks = <&vencsys CLK_VENC_LARB>;
61b94d54421a1f AngeloGioacchino Del Regno 2023-07-06   695  							clock-names = "venc0-larb";
2b515194bf0cb8 Tinghan Shen               2022-08-11   696  							mediatek,infracfg = <&infracfg_ao>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   697  							#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   698  						};
2b515194bf0cb8 Tinghan Shen               2022-08-11   699  
2b515194bf0cb8 Tinghan Shen               2022-08-11   700  						power-domain@MT8195_POWER_DOMAIN_VDOSYS1 {
2b515194bf0cb8 Tinghan Shen               2022-08-11   701  							reg = <MT8195_POWER_DOMAIN_VDOSYS1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   702  							clocks = <&topckgen CLK_TOP_CFG_VDO1>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   703  								 <&vdosys1 CLK_VDO1_SMI_LARB2>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   704  								 <&vdosys1 CLK_VDO1_SMI_LARB3>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   705  								 <&vdosys1 CLK_VDO1_GALS>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   706  							clock-names = "vdosys1", "vdosys1-0",
2b515194bf0cb8 Tinghan Shen               2022-08-11   707  								      "vdosys1-1", "vdosys1-2";
2b515194bf0cb8 Tinghan Shen               2022-08-11   708  							mediatek,infracfg = <&infracfg_ao>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   709  							#address-cells = <1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   710  							#size-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   711  							#power-domain-cells = <1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   712  
2b515194bf0cb8 Tinghan Shen               2022-08-11   713  							power-domain@MT8195_POWER_DOMAIN_DP_TX {
2b515194bf0cb8 Tinghan Shen               2022-08-11   714  								reg = <MT8195_POWER_DOMAIN_DP_TX>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   715  								mediatek,infracfg = <&infracfg_ao>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   716  								#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   717  							};
2b515194bf0cb8 Tinghan Shen               2022-08-11   718  
2b515194bf0cb8 Tinghan Shen               2022-08-11   719  							power-domain@MT8195_POWER_DOMAIN_EPD_TX {
2b515194bf0cb8 Tinghan Shen               2022-08-11   720  								reg = <MT8195_POWER_DOMAIN_EPD_TX>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   721  								mediatek,infracfg = <&infracfg_ao>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   722  								#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   723  							};
2b515194bf0cb8 Tinghan Shen               2022-08-11   724  
2b515194bf0cb8 Tinghan Shen               2022-08-11   725  							power-domain@MT8195_POWER_DOMAIN_HDMI_TX {
2b515194bf0cb8 Tinghan Shen               2022-08-11   726  								reg = <MT8195_POWER_DOMAIN_HDMI_TX>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   727  								clocks = <&topckgen CLK_TOP_HDMI_APB>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   728  								clock-names = "hdmi_tx";
2b515194bf0cb8 Tinghan Shen               2022-08-11   729  								#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   730  							};
2b515194bf0cb8 Tinghan Shen               2022-08-11   731  						};
2b515194bf0cb8 Tinghan Shen               2022-08-11   732  
2b515194bf0cb8 Tinghan Shen               2022-08-11   733  						power-domain@MT8195_POWER_DOMAIN_IMG {
2b515194bf0cb8 Tinghan Shen               2022-08-11   734  							reg = <MT8195_POWER_DOMAIN_IMG>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   735  							clocks = <&imgsys CLK_IMG_LARB9>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   736  								 <&imgsys CLK_IMG_GALS>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   737  							clock-names = "img-0", "img-1";
2b515194bf0cb8 Tinghan Shen               2022-08-11   738  							mediatek,infracfg = <&infracfg_ao>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   739  							#address-cells = <1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   740  							#size-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   741  							#power-domain-cells = <1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   742  
2b515194bf0cb8 Tinghan Shen               2022-08-11   743  							power-domain@MT8195_POWER_DOMAIN_DIP {
2b515194bf0cb8 Tinghan Shen               2022-08-11   744  								reg = <MT8195_POWER_DOMAIN_DIP>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   745  								#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   746  							};
2b515194bf0cb8 Tinghan Shen               2022-08-11   747  
2b515194bf0cb8 Tinghan Shen               2022-08-11   748  							power-domain@MT8195_POWER_DOMAIN_IPE {
2b515194bf0cb8 Tinghan Shen               2022-08-11   749  								reg = <MT8195_POWER_DOMAIN_IPE>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   750  								clocks = <&topckgen CLK_TOP_IPE>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   751  									 <&imgsys CLK_IMG_IPE>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   752  									 <&ipesys CLK_IPE_SMI_LARB12>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   753  								clock-names = "ipe", "ipe-0", "ipe-1";
2b515194bf0cb8 Tinghan Shen               2022-08-11   754  								mediatek,infracfg = <&infracfg_ao>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   755  								#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   756  							};
2b515194bf0cb8 Tinghan Shen               2022-08-11   757  						};
2b515194bf0cb8 Tinghan Shen               2022-08-11   758  
2b515194bf0cb8 Tinghan Shen               2022-08-11   759  						power-domain@MT8195_POWER_DOMAIN_CAM {
2b515194bf0cb8 Tinghan Shen               2022-08-11   760  							reg = <MT8195_POWER_DOMAIN_CAM>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   761  							clocks = <&camsys CLK_CAM_LARB13>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   762  								 <&camsys CLK_CAM_LARB14>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   763  								 <&camsys CLK_CAM_CAM2MM0_GALS>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   764  								 <&camsys CLK_CAM_CAM2MM1_GALS>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   765  								 <&camsys CLK_CAM_CAM2SYS_GALS>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   766  							clock-names = "cam-0", "cam-1", "cam-2", "cam-3",
2b515194bf0cb8 Tinghan Shen               2022-08-11   767  								      "cam-4";
2b515194bf0cb8 Tinghan Shen               2022-08-11   768  							mediatek,infracfg = <&infracfg_ao>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   769  							#address-cells = <1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   770  							#size-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   771  							#power-domain-cells = <1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   772  
2b515194bf0cb8 Tinghan Shen               2022-08-11   773  							power-domain@MT8195_POWER_DOMAIN_CAM_RAWA {
2b515194bf0cb8 Tinghan Shen               2022-08-11   774  								reg = <MT8195_POWER_DOMAIN_CAM_RAWA>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   775  								#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   776  							};
2b515194bf0cb8 Tinghan Shen               2022-08-11   777  
2b515194bf0cb8 Tinghan Shen               2022-08-11   778  							power-domain@MT8195_POWER_DOMAIN_CAM_RAWB {
2b515194bf0cb8 Tinghan Shen               2022-08-11   779  								reg = <MT8195_POWER_DOMAIN_CAM_RAWB>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   780  								#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   781  							};
2b515194bf0cb8 Tinghan Shen               2022-08-11   782  
2b515194bf0cb8 Tinghan Shen               2022-08-11   783  							power-domain@MT8195_POWER_DOMAIN_CAM_MRAW {
2b515194bf0cb8 Tinghan Shen               2022-08-11   784  								reg = <MT8195_POWER_DOMAIN_CAM_MRAW>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   785  								#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   786  							};
2b515194bf0cb8 Tinghan Shen               2022-08-11   787  						};
2b515194bf0cb8 Tinghan Shen               2022-08-11   788  					};
2b515194bf0cb8 Tinghan Shen               2022-08-11   789  				};
2b515194bf0cb8 Tinghan Shen               2022-08-11   790  
2b515194bf0cb8 Tinghan Shen               2022-08-11   791  				power-domain@MT8195_POWER_DOMAIN_PCIE_MAC_P0 {
2b515194bf0cb8 Tinghan Shen               2022-08-11   792  					reg = <MT8195_POWER_DOMAIN_PCIE_MAC_P0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   793  					mediatek,infracfg = <&infracfg_ao>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   794  					#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   795  				};
2b515194bf0cb8 Tinghan Shen               2022-08-11   796  
2b515194bf0cb8 Tinghan Shen               2022-08-11   797  				power-domain@MT8195_POWER_DOMAIN_PCIE_MAC_P1 {
2b515194bf0cb8 Tinghan Shen               2022-08-11   798  					reg = <MT8195_POWER_DOMAIN_PCIE_MAC_P1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   799  					mediatek,infracfg = <&infracfg_ao>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   800  					#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   801  				};
2b515194bf0cb8 Tinghan Shen               2022-08-11   802  
2b515194bf0cb8 Tinghan Shen               2022-08-11   803  				power-domain@MT8195_POWER_DOMAIN_PCIE_PHY {
2b515194bf0cb8 Tinghan Shen               2022-08-11   804  					reg = <MT8195_POWER_DOMAIN_PCIE_PHY>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   805  					#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   806  				};
2b515194bf0cb8 Tinghan Shen               2022-08-11   807  
2b515194bf0cb8 Tinghan Shen               2022-08-11   808  				power-domain@MT8195_POWER_DOMAIN_SSUSB_PCIE_PHY {
2b515194bf0cb8 Tinghan Shen               2022-08-11   809  					reg = <MT8195_POWER_DOMAIN_SSUSB_PCIE_PHY>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   810  					#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   811  				};
2b515194bf0cb8 Tinghan Shen               2022-08-11   812  
2b515194bf0cb8 Tinghan Shen               2022-08-11   813  				power-domain@MT8195_POWER_DOMAIN_CSI_RX_TOP {
2b515194bf0cb8 Tinghan Shen               2022-08-11   814  					reg = <MT8195_POWER_DOMAIN_CSI_RX_TOP>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   815  					clocks = <&topckgen CLK_TOP_SENINF>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   816  						 <&topckgen CLK_TOP_SENINF2>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   817  					clock-names = "csi_rx_top", "csi_rx_top1";
2b515194bf0cb8 Tinghan Shen               2022-08-11   818  					#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   819  				};
2b515194bf0cb8 Tinghan Shen               2022-08-11   820  
2b515194bf0cb8 Tinghan Shen               2022-08-11   821  				power-domain@MT8195_POWER_DOMAIN_ETHER {
2b515194bf0cb8 Tinghan Shen               2022-08-11   822  					reg = <MT8195_POWER_DOMAIN_ETHER>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   823  					clocks = <&pericfg_ao CLK_PERI_AO_ETHERNET_MAC>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   824  					clock-names = "ether";
2b515194bf0cb8 Tinghan Shen               2022-08-11   825  					#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   826  				};
2b515194bf0cb8 Tinghan Shen               2022-08-11   827  
2b515194bf0cb8 Tinghan Shen               2022-08-11   828  				power-domain@MT8195_POWER_DOMAIN_ADSP {
2b515194bf0cb8 Tinghan Shen               2022-08-11   829  					reg = <MT8195_POWER_DOMAIN_ADSP>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   830  					clocks = <&topckgen CLK_TOP_ADSP>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   831  						 <&topckgen CLK_TOP_AUDIO_LOCAL_BUS>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   832  					clock-names = "adsp", "adsp1";
2b515194bf0cb8 Tinghan Shen               2022-08-11   833  					#address-cells = <1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   834  					#size-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   835  					mediatek,infracfg = <&infracfg_ao>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   836  					#power-domain-cells = <1>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   837  
2b515194bf0cb8 Tinghan Shen               2022-08-11   838  					power-domain@MT8195_POWER_DOMAIN_AUDIO {
2b515194bf0cb8 Tinghan Shen               2022-08-11   839  						reg = <MT8195_POWER_DOMAIN_AUDIO>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   840  						clocks = <&topckgen CLK_TOP_A1SYS_HP>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   841  							 <&topckgen CLK_TOP_AUD_INTBUS>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   842  							 <&topckgen CLK_TOP_AUDIO_LOCAL_BUS>,
2b515194bf0cb8 Tinghan Shen               2022-08-11   843  							 <&infracfg_ao CLK_INFRA_AO_AUDIO_26M_B>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   844  						clock-names = "audio", "audio1", "audio2",
2b515194bf0cb8 Tinghan Shen               2022-08-11   845  							      "audio3";
2b515194bf0cb8 Tinghan Shen               2022-08-11   846  						mediatek,infracfg = <&infracfg_ao>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   847  						#power-domain-cells = <0>;
2b515194bf0cb8 Tinghan Shen               2022-08-11   848  					};
2b515194bf0cb8 Tinghan Shen               2022-08-11   849  				};
2b515194bf0cb8 Tinghan Shen               2022-08-11   850  			};
2b515194bf0cb8 Tinghan Shen               2022-08-11   851  		};
2b515194bf0cb8 Tinghan Shen               2022-08-11   852  
37f2582883be72 Tinghan Shen               2022-04-11   853  		watchdog: watchdog@10007000 {
02938f460cde0d AngeloGioacchino Del Regno 2022-11-08   854  			compatible = "mediatek,mt8195-wdt";
a376a9a6491431 Tinghan Shen               2022-08-11   855  			mediatek,disable-extrst;
37f2582883be72 Tinghan Shen               2022-04-11   856  			reg = <0 0x10007000 0 0x100>;
04cd978316c992 Trevor Wu                  2022-08-11   857  			#reset-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11   858  		};
37f2582883be72 Tinghan Shen               2022-04-11   859  
37f2582883be72 Tinghan Shen               2022-04-11   860  		apmixedsys: syscon@1000c000 {
37f2582883be72 Tinghan Shen               2022-04-11   861  			compatible = "mediatek,mt8195-apmixedsys", "syscon";
37f2582883be72 Tinghan Shen               2022-04-11   862  			reg = <0 0x1000c000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11   863  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11   864  		};
37f2582883be72 Tinghan Shen               2022-04-11   865  
37f2582883be72 Tinghan Shen               2022-04-11   866  		systimer: timer@10017000 {
37f2582883be72 Tinghan Shen               2022-04-11   867  			compatible = "mediatek,mt8195-timer",
37f2582883be72 Tinghan Shen               2022-04-11   868  				     "mediatek,mt6765-timer";
37f2582883be72 Tinghan Shen               2022-04-11   869  			reg = <0 0x10017000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11   870  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
0f1c806b65d136 Chen-Yu Tsai               2022-12-01   871  			clocks = <&clk13m>;
37f2582883be72 Tinghan Shen               2022-04-11   872  		};
37f2582883be72 Tinghan Shen               2022-04-11   873  
37f2582883be72 Tinghan Shen               2022-04-11   874  		pwrap: pwrap@10024000 {
37f2582883be72 Tinghan Shen               2022-04-11   875  			compatible = "mediatek,mt8195-pwrap", "syscon";
37f2582883be72 Tinghan Shen               2022-04-11   876  			reg = <0 0x10024000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11   877  			reg-names = "pwrap";
37f2582883be72 Tinghan Shen               2022-04-11   878  			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11   879  			clocks = <&infracfg_ao CLK_INFRA_AO_PMIC_AP>,
37f2582883be72 Tinghan Shen               2022-04-11   880  				 <&infracfg_ao CLK_INFRA_AO_PMIC_TMR>;
37f2582883be72 Tinghan Shen               2022-04-11   881  			clock-names = "spi", "wrap";
37f2582883be72 Tinghan Shen               2022-04-11   882  			assigned-clocks = <&topckgen CLK_TOP_PWRAP_ULPOSC>;
37f2582883be72 Tinghan Shen               2022-04-11   883  			assigned-clock-parents = <&topckgen CLK_TOP_ULPOSC1_D10>;
37f2582883be72 Tinghan Shen               2022-04-11   884  		};
37f2582883be72 Tinghan Shen               2022-04-11   885  
385e0eedb7ab80 Tinghan Shen               2022-08-11   886  		spmi: spmi@10027000 {
385e0eedb7ab80 Tinghan Shen               2022-08-11   887  			compatible = "mediatek,mt8195-spmi";
385e0eedb7ab80 Tinghan Shen               2022-08-11   888  			reg = <0 0x10027000 0 0x000e00>,
385e0eedb7ab80 Tinghan Shen               2022-08-11   889  			      <0 0x10029000 0 0x000100>;
385e0eedb7ab80 Tinghan Shen               2022-08-11   890  			reg-names = "pmif", "spmimst";
385e0eedb7ab80 Tinghan Shen               2022-08-11   891  			clocks = <&infracfg_ao CLK_INFRA_AO_PMIC_AP>,
385e0eedb7ab80 Tinghan Shen               2022-08-11   892  				 <&infracfg_ao CLK_INFRA_AO_PMIC_TMR>,
385e0eedb7ab80 Tinghan Shen               2022-08-11   893  				 <&topckgen CLK_TOP_SPMI_M_MST>;
385e0eedb7ab80 Tinghan Shen               2022-08-11   894  			clock-names = "pmif_sys_ck",
385e0eedb7ab80 Tinghan Shen               2022-08-11   895  				      "pmif_tmr_ck",
385e0eedb7ab80 Tinghan Shen               2022-08-11   896  				      "spmimst_clk_mux";
385e0eedb7ab80 Tinghan Shen               2022-08-11   897  			assigned-clocks = <&topckgen CLK_TOP_PWRAP_ULPOSC>;
385e0eedb7ab80 Tinghan Shen               2022-08-11   898  			assigned-clock-parents = <&topckgen CLK_TOP_ULPOSC1_D10>;
385e0eedb7ab80 Tinghan Shen               2022-08-11   899  		};
385e0eedb7ab80 Tinghan Shen               2022-08-11   900  
3b5838d1d82e38 Tinghan Shen               2022-08-11   901  		iommu_infra: infra-iommu@10315000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11   902  			compatible = "mediatek,mt8195-iommu-infra";
3b5838d1d82e38 Tinghan Shen               2022-08-11   903  			reg = <0 0x10315000 0 0x5000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11   904  			interrupts = <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH 0>,
3b5838d1d82e38 Tinghan Shen               2022-08-11   905  				     <GIC_SPI 796 IRQ_TYPE_LEVEL_HIGH 0>,
3b5838d1d82e38 Tinghan Shen               2022-08-11   906  				     <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH 0>,
3b5838d1d82e38 Tinghan Shen               2022-08-11   907  				     <GIC_SPI 798 IRQ_TYPE_LEVEL_HIGH 0>,
3b5838d1d82e38 Tinghan Shen               2022-08-11   908  				     <GIC_SPI 799 IRQ_TYPE_LEVEL_HIGH 0>;
3b5838d1d82e38 Tinghan Shen               2022-08-11   909  			#iommu-cells = <1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11   910  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11   911  
329239a154bc73 Jason-JH.Lin               2022-08-11   912  		gce0: mailbox@10320000 {
329239a154bc73 Jason-JH.Lin               2022-08-11   913  			compatible = "mediatek,mt8195-gce";
329239a154bc73 Jason-JH.Lin               2022-08-11   914  			reg = <0 0x10320000 0 0x4000>;
329239a154bc73 Jason-JH.Lin               2022-08-11   915  			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH 0>;
329239a154bc73 Jason-JH.Lin               2022-08-11   916  			#mbox-cells = <2>;
329239a154bc73 Jason-JH.Lin               2022-08-11   917  			clocks = <&infracfg_ao CLK_INFRA_AO_GCE>;
329239a154bc73 Jason-JH.Lin               2022-08-11   918  		};
329239a154bc73 Jason-JH.Lin               2022-08-11   919  
329239a154bc73 Jason-JH.Lin               2022-08-11   920  		gce1: mailbox@10330000 {
329239a154bc73 Jason-JH.Lin               2022-08-11   921  			compatible = "mediatek,mt8195-gce";
329239a154bc73 Jason-JH.Lin               2022-08-11   922  			reg = <0 0x10330000 0 0x4000>;
329239a154bc73 Jason-JH.Lin               2022-08-11   923  			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH 0>;
329239a154bc73 Jason-JH.Lin               2022-08-11   924  			#mbox-cells = <2>;
329239a154bc73 Jason-JH.Lin               2022-08-11   925  			clocks = <&infracfg_ao CLK_INFRA_AO_GCE2>;
329239a154bc73 Jason-JH.Lin               2022-08-11   926  		};
329239a154bc73 Jason-JH.Lin               2022-08-11   927  
867477a5d39fc6 Tinghan Shen               2022-08-11   928  		scp: scp@10500000 {
867477a5d39fc6 Tinghan Shen               2022-08-11   929  			compatible = "mediatek,mt8195-scp";
867477a5d39fc6 Tinghan Shen               2022-08-11   930  			reg = <0 0x10500000 0 0x100000>,
867477a5d39fc6 Tinghan Shen               2022-08-11   931  			      <0 0x10720000 0 0xe0000>,
867477a5d39fc6 Tinghan Shen               2022-08-11   932  			      <0 0x10700000 0 0x8000>;
867477a5d39fc6 Tinghan Shen               2022-08-11   933  			reg-names = "sram", "cfg", "l1tcm";
867477a5d39fc6 Tinghan Shen               2022-08-11   934  			interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
867477a5d39fc6 Tinghan Shen               2022-08-11   935  			status = "disabled";
867477a5d39fc6 Tinghan Shen               2022-08-11   936  		};
867477a5d39fc6 Tinghan Shen               2022-08-11   937  
37f2582883be72 Tinghan Shen               2022-04-11   938  		scp_adsp: clock-controller@10720000 {
37f2582883be72 Tinghan Shen               2022-04-11   939  			compatible = "mediatek,mt8195-scp_adsp";
37f2582883be72 Tinghan Shen               2022-04-11   940  			reg = <0 0x10720000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11   941  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11   942  		};
37f2582883be72 Tinghan Shen               2022-04-11   943  
7dd5bc578974a9 YC Hung                    2022-08-11   944  		adsp: dsp@10803000 {
7dd5bc578974a9 YC Hung                    2022-08-11   945  			compatible = "mediatek,mt8195-dsp";
7dd5bc578974a9 YC Hung                    2022-08-11   946  			reg = <0 0x10803000 0 0x1000>,
7dd5bc578974a9 YC Hung                    2022-08-11   947  			      <0 0x10840000 0 0x40000>;
7dd5bc578974a9 YC Hung                    2022-08-11   948  			reg-names = "cfg", "sram";
7dd5bc578974a9 YC Hung                    2022-08-11   949  			clocks = <&topckgen CLK_TOP_ADSP>,
7dd5bc578974a9 YC Hung                    2022-08-11   950  				 <&clk26m>,
7dd5bc578974a9 YC Hung                    2022-08-11   951  				 <&topckgen CLK_TOP_AUDIO_LOCAL_BUS>,
7dd5bc578974a9 YC Hung                    2022-08-11   952  				 <&topckgen CLK_TOP_MAINPLL_D7_D2>,
7dd5bc578974a9 YC Hung                    2022-08-11   953  				 <&scp_adsp CLK_SCP_ADSP_AUDIODSP>,
7dd5bc578974a9 YC Hung                    2022-08-11   954  				 <&topckgen CLK_TOP_AUDIO_H>;
7dd5bc578974a9 YC Hung                    2022-08-11   955  			clock-names = "adsp_sel",
7dd5bc578974a9 YC Hung                    2022-08-11   956  				 "clk26m_ck",
7dd5bc578974a9 YC Hung                    2022-08-11   957  				 "audio_local_bus",
7dd5bc578974a9 YC Hung                    2022-08-11   958  				 "mainpll_d7_d2",
7dd5bc578974a9 YC Hung                    2022-08-11   959  				 "scp_adsp_audiodsp",
7dd5bc578974a9 YC Hung                    2022-08-11   960  				 "audio_h";
7dd5bc578974a9 YC Hung                    2022-08-11   961  			power-domains = <&spm MT8195_POWER_DOMAIN_ADSP>;
7dd5bc578974a9 YC Hung                    2022-08-11   962  			mbox-names = "rx", "tx";
7dd5bc578974a9 YC Hung                    2022-08-11   963  			mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
7dd5bc578974a9 YC Hung                    2022-08-11   964  			status = "disabled";
7dd5bc578974a9 YC Hung                    2022-08-11   965  		};
7dd5bc578974a9 YC Hung                    2022-08-11   966  
7dd5bc578974a9 YC Hung                    2022-08-11   967  		adsp_mailbox0: mailbox@10816000 {
7dd5bc578974a9 YC Hung                    2022-08-11   968  			compatible = "mediatek,mt8195-adsp-mbox";
7dd5bc578974a9 YC Hung                    2022-08-11   969  			#mbox-cells = <0>;
7dd5bc578974a9 YC Hung                    2022-08-11   970  			reg = <0 0x10816000 0 0x1000>;
7dd5bc578974a9 YC Hung                    2022-08-11   971  			interrupts = <GIC_SPI 702 IRQ_TYPE_LEVEL_HIGH 0>;
7dd5bc578974a9 YC Hung                    2022-08-11   972  		};
7dd5bc578974a9 YC Hung                    2022-08-11   973  
7dd5bc578974a9 YC Hung                    2022-08-11   974  		adsp_mailbox1: mailbox@10817000 {
7dd5bc578974a9 YC Hung                    2022-08-11   975  			compatible = "mediatek,mt8195-adsp-mbox";
7dd5bc578974a9 YC Hung                    2022-08-11   976  			#mbox-cells = <0>;
7dd5bc578974a9 YC Hung                    2022-08-11   977  			reg = <0 0x10817000 0 0x1000>;
7dd5bc578974a9 YC Hung                    2022-08-11   978  			interrupts = <GIC_SPI 703 IRQ_TYPE_LEVEL_HIGH 0>;
7dd5bc578974a9 YC Hung                    2022-08-11   979  		};
7dd5bc578974a9 YC Hung                    2022-08-11   980  
8903821c8ef9fe Tinghan Shen               2022-08-11   981  		afe: mt8195-afe-pcm@10890000 {
8903821c8ef9fe Tinghan Shen               2022-08-11   982  			compatible = "mediatek,mt8195-audio";
8903821c8ef9fe Tinghan Shen               2022-08-11   983  			reg = <0 0x10890000 0 0x10000>;
8903821c8ef9fe Tinghan Shen               2022-08-11   984  			mediatek,topckgen = <&topckgen>;
8903821c8ef9fe Tinghan Shen               2022-08-11   985  			power-domains = <&spm MT8195_POWER_DOMAIN_AUDIO>;
8903821c8ef9fe Tinghan Shen               2022-08-11   986  			interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
04cd978316c992 Trevor Wu                  2022-08-11   987  			resets = <&watchdog 14>;
04cd978316c992 Trevor Wu                  2022-08-11   988  			reset-names = "audiosys";
8903821c8ef9fe Tinghan Shen               2022-08-11   989  			clocks = <&clk26m>,
8903821c8ef9fe Tinghan Shen               2022-08-11   990  				<&apmixedsys CLK_APMIXED_APLL1>,
8903821c8ef9fe Tinghan Shen               2022-08-11   991  				<&apmixedsys CLK_APMIXED_APLL2>,
8903821c8ef9fe Tinghan Shen               2022-08-11   992  				<&topckgen CLK_TOP_APLL12_DIV0>,
8903821c8ef9fe Tinghan Shen               2022-08-11   993  				<&topckgen CLK_TOP_APLL12_DIV1>,
8903821c8ef9fe Tinghan Shen               2022-08-11   994  				<&topckgen CLK_TOP_APLL12_DIV2>,
8903821c8ef9fe Tinghan Shen               2022-08-11   995  				<&topckgen CLK_TOP_APLL12_DIV3>,
8903821c8ef9fe Tinghan Shen               2022-08-11   996  				<&topckgen CLK_TOP_APLL12_DIV9>,
8903821c8ef9fe Tinghan Shen               2022-08-11   997  				<&topckgen CLK_TOP_A1SYS_HP>,
8903821c8ef9fe Tinghan Shen               2022-08-11   998  				<&topckgen CLK_TOP_AUD_INTBUS>,
8903821c8ef9fe Tinghan Shen               2022-08-11   999  				<&topckgen CLK_TOP_AUDIO_H>,
8903821c8ef9fe Tinghan Shen               2022-08-11  1000  				<&topckgen CLK_TOP_AUDIO_LOCAL_BUS>,
8903821c8ef9fe Tinghan Shen               2022-08-11  1001  				<&topckgen CLK_TOP_DPTX_MCK>,
8903821c8ef9fe Tinghan Shen               2022-08-11  1002  				<&topckgen CLK_TOP_I2SO1_MCK>,
8903821c8ef9fe Tinghan Shen               2022-08-11  1003  				<&topckgen CLK_TOP_I2SO2_MCK>,
8903821c8ef9fe Tinghan Shen               2022-08-11  1004  				<&topckgen CLK_TOP_I2SI1_MCK>,
8903821c8ef9fe Tinghan Shen               2022-08-11  1005  				<&topckgen CLK_TOP_I2SI2_MCK>,
8903821c8ef9fe Tinghan Shen               2022-08-11  1006  				<&infracfg_ao CLK_INFRA_AO_AUDIO_26M_B>,
8903821c8ef9fe Tinghan Shen               2022-08-11  1007  				<&scp_adsp CLK_SCP_ADSP_AUDIODSP>;
8903821c8ef9fe Tinghan Shen               2022-08-11  1008  			clock-names = "clk26m",
8903821c8ef9fe Tinghan Shen               2022-08-11  1009  				"apll1_ck",
8903821c8ef9fe Tinghan Shen               2022-08-11  1010  				"apll2_ck",
8903821c8ef9fe Tinghan Shen               2022-08-11  1011  				"apll12_div0",
8903821c8ef9fe Tinghan Shen               2022-08-11  1012  				"apll12_div1",
8903821c8ef9fe Tinghan Shen               2022-08-11  1013  				"apll12_div2",
8903821c8ef9fe Tinghan Shen               2022-08-11  1014  				"apll12_div3",
8903821c8ef9fe Tinghan Shen               2022-08-11  1015  				"apll12_div9",
8903821c8ef9fe Tinghan Shen               2022-08-11  1016  				"a1sys_hp_sel",
8903821c8ef9fe Tinghan Shen               2022-08-11  1017  				"aud_intbus_sel",
8903821c8ef9fe Tinghan Shen               2022-08-11  1018  				"audio_h_sel",
8903821c8ef9fe Tinghan Shen               2022-08-11  1019  				"audio_local_bus_sel",
8903821c8ef9fe Tinghan Shen               2022-08-11  1020  				"dptx_m_sel",
8903821c8ef9fe Tinghan Shen               2022-08-11  1021  				"i2so1_m_sel",
8903821c8ef9fe Tinghan Shen               2022-08-11  1022  				"i2so2_m_sel",
8903821c8ef9fe Tinghan Shen               2022-08-11  1023  				"i2si1_m_sel",
8903821c8ef9fe Tinghan Shen               2022-08-11  1024  				"i2si2_m_sel",
8903821c8ef9fe Tinghan Shen               2022-08-11  1025  				"infra_ao_audio_26m_b",
8903821c8ef9fe Tinghan Shen               2022-08-11  1026  				"scp_adsp_audiodsp";
8903821c8ef9fe Tinghan Shen               2022-08-11  1027  			status = "disabled";
8903821c8ef9fe Tinghan Shen               2022-08-11  1028  		};
8903821c8ef9fe Tinghan Shen               2022-08-11  1029  
37f2582883be72 Tinghan Shen               2022-04-11  1030  		uart0: serial@11001100 {
37f2582883be72 Tinghan Shen               2022-04-11  1031  			compatible = "mediatek,mt8195-uart",
37f2582883be72 Tinghan Shen               2022-04-11  1032  				     "mediatek,mt6577-uart";
37f2582883be72 Tinghan Shen               2022-04-11  1033  			reg = <0 0x11001100 0 0x100>;
37f2582883be72 Tinghan Shen               2022-04-11  1034  			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1035  			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART0>;
37f2582883be72 Tinghan Shen               2022-04-11  1036  			clock-names = "baud", "bus";
37f2582883be72 Tinghan Shen               2022-04-11  1037  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1038  		};
37f2582883be72 Tinghan Shen               2022-04-11  1039  
37f2582883be72 Tinghan Shen               2022-04-11  1040  		uart1: serial@11001200 {
37f2582883be72 Tinghan Shen               2022-04-11  1041  			compatible = "mediatek,mt8195-uart",
37f2582883be72 Tinghan Shen               2022-04-11  1042  				     "mediatek,mt6577-uart";
37f2582883be72 Tinghan Shen               2022-04-11  1043  			reg = <0 0x11001200 0 0x100>;
37f2582883be72 Tinghan Shen               2022-04-11  1044  			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1045  			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART1>;
37f2582883be72 Tinghan Shen               2022-04-11  1046  			clock-names = "baud", "bus";
37f2582883be72 Tinghan Shen               2022-04-11  1047  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1048  		};
37f2582883be72 Tinghan Shen               2022-04-11  1049  
37f2582883be72 Tinghan Shen               2022-04-11  1050  		uart2: serial@11001300 {
37f2582883be72 Tinghan Shen               2022-04-11  1051  			compatible = "mediatek,mt8195-uart",
37f2582883be72 Tinghan Shen               2022-04-11  1052  				     "mediatek,mt6577-uart";
37f2582883be72 Tinghan Shen               2022-04-11  1053  			reg = <0 0x11001300 0 0x100>;
37f2582883be72 Tinghan Shen               2022-04-11  1054  			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1055  			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART2>;
37f2582883be72 Tinghan Shen               2022-04-11  1056  			clock-names = "baud", "bus";
37f2582883be72 Tinghan Shen               2022-04-11  1057  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1058  		};
37f2582883be72 Tinghan Shen               2022-04-11  1059  
37f2582883be72 Tinghan Shen               2022-04-11  1060  		uart3: serial@11001400 {
37f2582883be72 Tinghan Shen               2022-04-11  1061  			compatible = "mediatek,mt8195-uart",
37f2582883be72 Tinghan Shen               2022-04-11  1062  				     "mediatek,mt6577-uart";
37f2582883be72 Tinghan Shen               2022-04-11  1063  			reg = <0 0x11001400 0 0x100>;
37f2582883be72 Tinghan Shen               2022-04-11  1064  			interrupts = <GIC_SPI 723 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1065  			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART3>;
37f2582883be72 Tinghan Shen               2022-04-11  1066  			clock-names = "baud", "bus";
37f2582883be72 Tinghan Shen               2022-04-11  1067  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1068  		};
37f2582883be72 Tinghan Shen               2022-04-11  1069  
37f2582883be72 Tinghan Shen               2022-04-11  1070  		uart4: serial@11001500 {
37f2582883be72 Tinghan Shen               2022-04-11  1071  			compatible = "mediatek,mt8195-uart",
37f2582883be72 Tinghan Shen               2022-04-11  1072  				     "mediatek,mt6577-uart";
37f2582883be72 Tinghan Shen               2022-04-11  1073  			reg = <0 0x11001500 0 0x100>;
37f2582883be72 Tinghan Shen               2022-04-11  1074  			interrupts = <GIC_SPI 724 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1075  			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART4>;
37f2582883be72 Tinghan Shen               2022-04-11  1076  			clock-names = "baud", "bus";
37f2582883be72 Tinghan Shen               2022-04-11  1077  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1078  		};
37f2582883be72 Tinghan Shen               2022-04-11  1079  
37f2582883be72 Tinghan Shen               2022-04-11  1080  		uart5: serial@11001600 {
37f2582883be72 Tinghan Shen               2022-04-11  1081  			compatible = "mediatek,mt8195-uart",
37f2582883be72 Tinghan Shen               2022-04-11  1082  				     "mediatek,mt6577-uart";
37f2582883be72 Tinghan Shen               2022-04-11  1083  			reg = <0 0x11001600 0 0x100>;
37f2582883be72 Tinghan Shen               2022-04-11  1084  			interrupts = <GIC_SPI 725 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1085  			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART5>;
37f2582883be72 Tinghan Shen               2022-04-11  1086  			clock-names = "baud", "bus";
37f2582883be72 Tinghan Shen               2022-04-11  1087  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1088  		};
37f2582883be72 Tinghan Shen               2022-04-11  1089  
37f2582883be72 Tinghan Shen               2022-04-11  1090  		auxadc: auxadc@11002000 {
37f2582883be72 Tinghan Shen               2022-04-11  1091  			compatible = "mediatek,mt8195-auxadc",
37f2582883be72 Tinghan Shen               2022-04-11  1092  				     "mediatek,mt8173-auxadc";
37f2582883be72 Tinghan Shen               2022-04-11  1093  			reg = <0 0x11002000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  1094  			clocks = <&infracfg_ao CLK_INFRA_AO_AUXADC>;
37f2582883be72 Tinghan Shen               2022-04-11  1095  			clock-names = "main";
37f2582883be72 Tinghan Shen               2022-04-11  1096  			#io-channel-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1097  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1098  		};
37f2582883be72 Tinghan Shen               2022-04-11  1099  
37f2582883be72 Tinghan Shen               2022-04-11  1100  		pericfg_ao: syscon@11003000 {
37f2582883be72 Tinghan Shen               2022-04-11  1101  			compatible = "mediatek,mt8195-pericfg_ao", "syscon";
37f2582883be72 Tinghan Shen               2022-04-11  1102  			reg = <0 0x11003000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  1103  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1104  		};
37f2582883be72 Tinghan Shen               2022-04-11  1105  
37f2582883be72 Tinghan Shen               2022-04-11  1106  		spi0: spi@1100a000 {
37f2582883be72 Tinghan Shen               2022-04-11  1107  			compatible = "mediatek,mt8195-spi",
37f2582883be72 Tinghan Shen               2022-04-11  1108  				     "mediatek,mt6765-spi";
37f2582883be72 Tinghan Shen               2022-04-11  1109  			#address-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1110  			#size-cells = <0>;
37f2582883be72 Tinghan Shen               2022-04-11  1111  			reg = <0 0x1100a000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  1112  			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1113  			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
37f2582883be72 Tinghan Shen               2022-04-11  1114  				 <&topckgen CLK_TOP_SPI>,
37f2582883be72 Tinghan Shen               2022-04-11  1115  				 <&infracfg_ao CLK_INFRA_AO_SPI0>;
37f2582883be72 Tinghan Shen               2022-04-11  1116  			clock-names = "parent-clk", "sel-clk", "spi-clk";
37f2582883be72 Tinghan Shen               2022-04-11  1117  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1118  		};
37f2582883be72 Tinghan Shen               2022-04-11  1119  
fd1c6f13cfc3db Balsam CHIHI               2023-02-09  1120  		lvts_ap: thermal-sensor@1100b000 {
fd1c6f13cfc3db Balsam CHIHI               2023-02-09  1121  			compatible = "mediatek,mt8195-lvts-ap";
f4747b91dbc6a3 AngeloGioacchino Del Regno 2023-11-21  1122  			reg = <0 0x1100b000 0 0xc00>;
fd1c6f13cfc3db Balsam CHIHI               2023-02-09  1123  			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>;
fd1c6f13cfc3db Balsam CHIHI               2023-02-09  1124  			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
fd1c6f13cfc3db Balsam CHIHI               2023-02-09  1125  			resets = <&infracfg_ao MT8195_INFRA_RST0_THERM_CTRL_SWRST>;
fd1c6f13cfc3db Balsam CHIHI               2023-02-09  1126  			nvmem-cells = <&lvts_efuse_data1 &lvts_efuse_data2>;
fd1c6f13cfc3db Balsam CHIHI               2023-02-09  1127  			nvmem-cell-names = "lvts-calib-data-1", "lvts-calib-data-2";
fd1c6f13cfc3db Balsam CHIHI               2023-02-09  1128  			#thermal-sensor-cells = <1>;
fd1c6f13cfc3db Balsam CHIHI               2023-02-09  1129  		};
fd1c6f13cfc3db Balsam CHIHI               2023-02-09  1130  
f4747b91dbc6a3 AngeloGioacchino Del Regno 2023-11-21  1131  		svs: svs@1100bc00 {
f4747b91dbc6a3 AngeloGioacchino Del Regno 2023-11-21  1132  			compatible = "mediatek,mt8195-svs";
f4747b91dbc6a3 AngeloGioacchino Del Regno 2023-11-21  1133  			reg = <0 0x1100bc00 0 0x400>;
f4747b91dbc6a3 AngeloGioacchino Del Regno 2023-11-21  1134  			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH 0>;
f4747b91dbc6a3 AngeloGioacchino Del Regno 2023-11-21  1135  			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
f4747b91dbc6a3 AngeloGioacchino Del Regno 2023-11-21  1136  			clock-names = "main";
f4747b91dbc6a3 AngeloGioacchino Del Regno 2023-11-21  1137  			nvmem-cells = <&svs_calib_data &lvts_efuse_data1>;
f4747b91dbc6a3 AngeloGioacchino Del Regno 2023-11-21  1138  			nvmem-cell-names = "svs-calibration-data", "t-calibration-data";
f4747b91dbc6a3 AngeloGioacchino Del Regno 2023-11-21  1139  			resets = <&infracfg_ao MT8195_INFRA_RST3_THERM_CTRL_PTP_SWRST>;
f4747b91dbc6a3 AngeloGioacchino Del Regno 2023-11-21  1140  			reset-names = "svs_rst";
f4747b91dbc6a3 AngeloGioacchino Del Regno 2023-11-21  1141  		};
f4747b91dbc6a3 AngeloGioacchino Del Regno 2023-11-21  1142  
b86b9464467de6 AngeloGioacchino Del Regno 2023-02-23  1143  		disp_pwm0: pwm@1100e000 {
b86b9464467de6 AngeloGioacchino Del Regno 2023-02-23  1144  			compatible = "mediatek,mt8195-disp-pwm", "mediatek,mt8183-disp-pwm";
b86b9464467de6 AngeloGioacchino Del Regno 2023-02-23  1145  			reg = <0 0x1100e000 0 0x1000>;
b86b9464467de6 AngeloGioacchino Del Regno 2023-02-23  1146  			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_LOW 0>;
b86b9464467de6 AngeloGioacchino Del Regno 2023-02-23  1147  			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
b86b9464467de6 AngeloGioacchino Del Regno 2023-02-23  1148  			#pwm-cells = <2>;
b86b9464467de6 AngeloGioacchino Del Regno 2023-02-23  1149  			clocks = <&topckgen CLK_TOP_DISP_PWM0>,
b86b9464467de6 AngeloGioacchino Del Regno 2023-02-23  1150  				 <&infracfg_ao CLK_INFRA_AO_DISP_PWM>;
b86b9464467de6 AngeloGioacchino Del Regno 2023-02-23  1151  			clock-names = "main", "mm";
b86b9464467de6 AngeloGioacchino Del Regno 2023-02-23  1152  			status = "disabled";
b86b9464467de6 AngeloGioacchino Del Regno 2023-02-23  1153  		};
b86b9464467de6 AngeloGioacchino Del Regno 2023-02-23  1154  
b86b9464467de6 AngeloGioacchino Del Regno 2023-02-23  1155  		disp_pwm1: pwm@1100f000 {
b86b9464467de6 AngeloGioacchino Del Regno 2023-02-23  1156  			compatible = "mediatek,mt8195-disp-pwm", "mediatek,mt8183-disp-pwm";
b86b9464467de6 AngeloGioacchino Del Regno 2023-02-23  1157  			reg = <0 0x1100f000 0 0x1000>;
b86b9464467de6 AngeloGioacchino Del Regno 2023-02-23  1158  			interrupts = <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH 0>;
b86b9464467de6 AngeloGioacchino Del Regno 2023-02-23  1159  			#pwm-cells = <2>;
b86b9464467de6 AngeloGioacchino Del Regno 2023-02-23  1160  			clocks = <&topckgen CLK_TOP_DISP_PWM1>,
b86b9464467de6 AngeloGioacchino Del Regno 2023-02-23  1161  				 <&infracfg_ao CLK_INFRA_AO_DISP_PWM1>;
b86b9464467de6 AngeloGioacchino Del Regno 2023-02-23  1162  			clock-names = "main", "mm";
b86b9464467de6 AngeloGioacchino Del Regno 2023-02-23  1163  			status = "disabled";
b86b9464467de6 AngeloGioacchino Del Regno 2023-02-23  1164  		};
b86b9464467de6 AngeloGioacchino Del Regno 2023-02-23  1165  
37f2582883be72 Tinghan Shen               2022-04-11  1166  		spi1: spi@11010000 {
37f2582883be72 Tinghan Shen               2022-04-11  1167  			compatible = "mediatek,mt8195-spi",
37f2582883be72 Tinghan Shen               2022-04-11  1168  				     "mediatek,mt6765-spi";
37f2582883be72 Tinghan Shen               2022-04-11  1169  			#address-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1170  			#size-cells = <0>;
37f2582883be72 Tinghan Shen               2022-04-11  1171  			reg = <0 0x11010000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  1172  			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1173  			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
37f2582883be72 Tinghan Shen               2022-04-11  1174  				 <&topckgen CLK_TOP_SPI>,
37f2582883be72 Tinghan Shen               2022-04-11  1175  				 <&infracfg_ao CLK_INFRA_AO_SPI1>;
37f2582883be72 Tinghan Shen               2022-04-11  1176  			clock-names = "parent-clk", "sel-clk", "spi-clk";
37f2582883be72 Tinghan Shen               2022-04-11  1177  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1178  		};
37f2582883be72 Tinghan Shen               2022-04-11  1179  
37f2582883be72 Tinghan Shen               2022-04-11  1180  		spi2: spi@11012000 {
37f2582883be72 Tinghan Shen               2022-04-11  1181  			compatible = "mediatek,mt8195-spi",
37f2582883be72 Tinghan Shen               2022-04-11  1182  				     "mediatek,mt6765-spi";
37f2582883be72 Tinghan Shen               2022-04-11  1183  			#address-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1184  			#size-cells = <0>;
37f2582883be72 Tinghan Shen               2022-04-11  1185  			reg = <0 0x11012000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  1186  			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1187  			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
37f2582883be72 Tinghan Shen               2022-04-11  1188  				 <&topckgen CLK_TOP_SPI>,
37f2582883be72 Tinghan Shen               2022-04-11  1189  				 <&infracfg_ao CLK_INFRA_AO_SPI2>;
37f2582883be72 Tinghan Shen               2022-04-11  1190  			clock-names = "parent-clk", "sel-clk", "spi-clk";
37f2582883be72 Tinghan Shen               2022-04-11  1191  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1192  		};
37f2582883be72 Tinghan Shen               2022-04-11  1193  
37f2582883be72 Tinghan Shen               2022-04-11  1194  		spi3: spi@11013000 {
37f2582883be72 Tinghan Shen               2022-04-11  1195  			compatible = "mediatek,mt8195-spi",
37f2582883be72 Tinghan Shen               2022-04-11  1196  				     "mediatek,mt6765-spi";
37f2582883be72 Tinghan Shen               2022-04-11  1197  			#address-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1198  			#size-cells = <0>;
37f2582883be72 Tinghan Shen               2022-04-11  1199  			reg = <0 0x11013000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  1200  			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1201  			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
37f2582883be72 Tinghan Shen               2022-04-11  1202  				 <&topckgen CLK_TOP_SPI>,
37f2582883be72 Tinghan Shen               2022-04-11  1203  				 <&infracfg_ao CLK_INFRA_AO_SPI3>;
37f2582883be72 Tinghan Shen               2022-04-11  1204  			clock-names = "parent-clk", "sel-clk", "spi-clk";
37f2582883be72 Tinghan Shen               2022-04-11  1205  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1206  		};
37f2582883be72 Tinghan Shen               2022-04-11  1207  
37f2582883be72 Tinghan Shen               2022-04-11  1208  		spi4: spi@11018000 {
37f2582883be72 Tinghan Shen               2022-04-11  1209  			compatible = "mediatek,mt8195-spi",
37f2582883be72 Tinghan Shen               2022-04-11  1210  				     "mediatek,mt6765-spi";
37f2582883be72 Tinghan Shen               2022-04-11  1211  			#address-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1212  			#size-cells = <0>;
37f2582883be72 Tinghan Shen               2022-04-11  1213  			reg = <0 0x11018000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  1214  			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1215  			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
37f2582883be72 Tinghan Shen               2022-04-11  1216  				 <&topckgen CLK_TOP_SPI>,
37f2582883be72 Tinghan Shen               2022-04-11  1217  				 <&infracfg_ao CLK_INFRA_AO_SPI4>;
37f2582883be72 Tinghan Shen               2022-04-11  1218  			clock-names = "parent-clk", "sel-clk", "spi-clk";
37f2582883be72 Tinghan Shen               2022-04-11  1219  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1220  		};
37f2582883be72 Tinghan Shen               2022-04-11  1221  
37f2582883be72 Tinghan Shen               2022-04-11  1222  		spi5: spi@11019000 {
37f2582883be72 Tinghan Shen               2022-04-11  1223  			compatible = "mediatek,mt8195-spi",
37f2582883be72 Tinghan Shen               2022-04-11  1224  				     "mediatek,mt6765-spi";
37f2582883be72 Tinghan Shen               2022-04-11  1225  			#address-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1226  			#size-cells = <0>;
37f2582883be72 Tinghan Shen               2022-04-11  1227  			reg = <0 0x11019000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  1228  			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1229  			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
37f2582883be72 Tinghan Shen               2022-04-11  1230  				 <&topckgen CLK_TOP_SPI>,
37f2582883be72 Tinghan Shen               2022-04-11  1231  				 <&infracfg_ao CLK_INFRA_AO_SPI5>;
37f2582883be72 Tinghan Shen               2022-04-11  1232  			clock-names = "parent-clk", "sel-clk", "spi-clk";
37f2582883be72 Tinghan Shen               2022-04-11  1233  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1234  		};
37f2582883be72 Tinghan Shen               2022-04-11  1235  
37f2582883be72 Tinghan Shen               2022-04-11  1236  		spis0: spi@1101d000 {
37f2582883be72 Tinghan Shen               2022-04-11  1237  			compatible = "mediatek,mt8195-spi-slave";
37f2582883be72 Tinghan Shen               2022-04-11  1238  			reg = <0 0x1101d000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  1239  			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1240  			clocks = <&infracfg_ao CLK_INFRA_AO_SPIS0>;
37f2582883be72 Tinghan Shen               2022-04-11  1241  			clock-names = "spi";
37f2582883be72 Tinghan Shen               2022-04-11  1242  			assigned-clocks = <&topckgen CLK_TOP_SPIS>;
37f2582883be72 Tinghan Shen               2022-04-11  1243  			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D6>;
37f2582883be72 Tinghan Shen               2022-04-11  1244  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1245  		};
37f2582883be72 Tinghan Shen               2022-04-11  1246  
37f2582883be72 Tinghan Shen               2022-04-11  1247  		spis1: spi@1101e000 {
37f2582883be72 Tinghan Shen               2022-04-11  1248  			compatible = "mediatek,mt8195-spi-slave";
37f2582883be72 Tinghan Shen               2022-04-11  1249  			reg = <0 0x1101e000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  1250  			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1251  			clocks = <&infracfg_ao CLK_INFRA_AO_SPIS1>;
37f2582883be72 Tinghan Shen               2022-04-11  1252  			clock-names = "spi";
37f2582883be72 Tinghan Shen               2022-04-11  1253  			assigned-clocks = <&topckgen CLK_TOP_SPIS>;
37f2582883be72 Tinghan Shen               2022-04-11  1254  			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D6>;
37f2582883be72 Tinghan Shen               2022-04-11  1255  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1256  		};
37f2582883be72 Tinghan Shen               2022-04-11  1257  
c5fe37e8528ffb Biao Huang                 2023-01-05  1258  		eth: ethernet@11021000 {
c5fe37e8528ffb Biao Huang                 2023-01-05  1259  			compatible = "mediatek,mt8195-gmac", "snps,dwmac-5.10a";
c5fe37e8528ffb Biao Huang                 2023-01-05  1260  			reg = <0 0x11021000 0 0x4000>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1261  			interrupts = <GIC_SPI 716 IRQ_TYPE_LEVEL_HIGH 0>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1262  			interrupt-names = "macirq";
c5fe37e8528ffb Biao Huang                 2023-01-05  1263  			clock-names = "axi",
c5fe37e8528ffb Biao Huang                 2023-01-05  1264  				      "apb",
c5fe37e8528ffb Biao Huang                 2023-01-05  1265  				      "mac_main",
c5fe37e8528ffb Biao Huang                 2023-01-05  1266  				      "ptp_ref",
c5fe37e8528ffb Biao Huang                 2023-01-05  1267  				      "rmii_internal",
c5fe37e8528ffb Biao Huang                 2023-01-05  1268  				      "mac_cg";
c5fe37e8528ffb Biao Huang                 2023-01-05  1269  			clocks = <&pericfg_ao CLK_PERI_AO_ETHERNET>,
c5fe37e8528ffb Biao Huang                 2023-01-05  1270  				 <&pericfg_ao CLK_PERI_AO_ETHERNET_BUS>,
c5fe37e8528ffb Biao Huang                 2023-01-05  1271  				 <&topckgen CLK_TOP_SNPS_ETH_250M>,
c5fe37e8528ffb Biao Huang                 2023-01-05  1272  				 <&topckgen CLK_TOP_SNPS_ETH_62P4M_PTP>,
c5fe37e8528ffb Biao Huang                 2023-01-05  1273  				 <&topckgen CLK_TOP_SNPS_ETH_50M_RMII>,
c5fe37e8528ffb Biao Huang                 2023-01-05  1274  				 <&pericfg_ao CLK_PERI_AO_ETHERNET_MAC>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1275  			assigned-clocks = <&topckgen CLK_TOP_SNPS_ETH_250M>,
c5fe37e8528ffb Biao Huang                 2023-01-05  1276  					  <&topckgen CLK_TOP_SNPS_ETH_62P4M_PTP>,
c5fe37e8528ffb Biao Huang                 2023-01-05  1277  					  <&topckgen CLK_TOP_SNPS_ETH_50M_RMII>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1278  			assigned-clock-parents = <&topckgen CLK_TOP_ETHPLL_D2>,
c5fe37e8528ffb Biao Huang                 2023-01-05  1279  						 <&topckgen CLK_TOP_ETHPLL_D8>,
c5fe37e8528ffb Biao Huang                 2023-01-05  1280  						 <&topckgen CLK_TOP_ETHPLL_D10>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1281  			power-domains = <&spm MT8195_POWER_DOMAIN_ETHER>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1282  			mediatek,pericfg = <&infracfg_ao>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1283  			snps,axi-config = <&stmmac_axi_setup>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1284  			snps,mtl-rx-config = <&mtl_rx_setup>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1285  			snps,mtl-tx-config = <&mtl_tx_setup>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1286  			snps,txpbl = <16>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1287  			snps,rxpbl = <16>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1288  			snps,clk-csr = <0>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1289  			status = "disabled";
c5fe37e8528ffb Biao Huang                 2023-01-05  1290  
c5fe37e8528ffb Biao Huang                 2023-01-05  1291  			mdio {
c5fe37e8528ffb Biao Huang                 2023-01-05  1292  				compatible = "snps,dwmac-mdio";
c5fe37e8528ffb Biao Huang                 2023-01-05  1293  				#address-cells = <1>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1294  				#size-cells = <0>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1295  			};
c5fe37e8528ffb Biao Huang                 2023-01-05  1296  
c5fe37e8528ffb Biao Huang                 2023-01-05  1297  			stmmac_axi_setup: stmmac-axi-config {
c5fe37e8528ffb Biao Huang                 2023-01-05  1298  				snps,wr_osr_lmt = <0x7>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1299  				snps,rd_osr_lmt = <0x7>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1300  				snps,blen = <0 0 0 0 16 8 4>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1301  			};
c5fe37e8528ffb Biao Huang                 2023-01-05  1302  
c5fe37e8528ffb Biao Huang                 2023-01-05  1303  			mtl_rx_setup: rx-queues-config {
c5fe37e8528ffb Biao Huang                 2023-01-05  1304  				snps,rx-queues-to-use = <4>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1305  				snps,rx-sched-sp;
c5fe37e8528ffb Biao Huang                 2023-01-05  1306  				queue0 {
c5fe37e8528ffb Biao Huang                 2023-01-05  1307  					snps,dcb-algorithm;
c5fe37e8528ffb Biao Huang                 2023-01-05  1308  					snps,map-to-dma-channel = <0x0>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1309  				};
c5fe37e8528ffb Biao Huang                 2023-01-05  1310  				queue1 {
c5fe37e8528ffb Biao Huang                 2023-01-05  1311  					snps,dcb-algorithm;
c5fe37e8528ffb Biao Huang                 2023-01-05  1312  					snps,map-to-dma-channel = <0x0>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1313  				};
c5fe37e8528ffb Biao Huang                 2023-01-05  1314  				queue2 {
c5fe37e8528ffb Biao Huang                 2023-01-05  1315  					snps,dcb-algorithm;
c5fe37e8528ffb Biao Huang                 2023-01-05  1316  					snps,map-to-dma-channel = <0x0>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1317  				};
c5fe37e8528ffb Biao Huang                 2023-01-05  1318  				queue3 {
c5fe37e8528ffb Biao Huang                 2023-01-05  1319  					snps,dcb-algorithm;
c5fe37e8528ffb Biao Huang                 2023-01-05  1320  					snps,map-to-dma-channel = <0x0>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1321  				};
c5fe37e8528ffb Biao Huang                 2023-01-05  1322  			};
c5fe37e8528ffb Biao Huang                 2023-01-05  1323  
c5fe37e8528ffb Biao Huang                 2023-01-05  1324  			mtl_tx_setup: tx-queues-config {
c5fe37e8528ffb Biao Huang                 2023-01-05  1325  				snps,tx-queues-to-use = <4>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1326  				snps,tx-sched-wrr;
c5fe37e8528ffb Biao Huang                 2023-01-05  1327  				queue0 {
c5fe37e8528ffb Biao Huang                 2023-01-05  1328  					snps,weight = <0x10>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1329  					snps,dcb-algorithm;
c5fe37e8528ffb Biao Huang                 2023-01-05  1330  					snps,priority = <0x0>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1331  				};
c5fe37e8528ffb Biao Huang                 2023-01-05  1332  				queue1 {
c5fe37e8528ffb Biao Huang                 2023-01-05  1333  					snps,weight = <0x11>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1334  					snps,dcb-algorithm;
c5fe37e8528ffb Biao Huang                 2023-01-05  1335  					snps,priority = <0x1>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1336  				};
c5fe37e8528ffb Biao Huang                 2023-01-05  1337  				queue2 {
c5fe37e8528ffb Biao Huang                 2023-01-05  1338  					snps,weight = <0x12>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1339  					snps,dcb-algorithm;
c5fe37e8528ffb Biao Huang                 2023-01-05  1340  					snps,priority = <0x2>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1341  				};
c5fe37e8528ffb Biao Huang                 2023-01-05  1342  				queue3 {
c5fe37e8528ffb Biao Huang                 2023-01-05  1343  					snps,weight = <0x13>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1344  					snps,dcb-algorithm;
c5fe37e8528ffb Biao Huang                 2023-01-05  1345  					snps,priority = <0x3>;
c5fe37e8528ffb Biao Huang                 2023-01-05  1346  				};
c5fe37e8528ffb Biao Huang                 2023-01-05  1347  			};
c5fe37e8528ffb Biao Huang                 2023-01-05  1348  		};
c5fe37e8528ffb Biao Huang                 2023-01-05  1349  
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1350  		ssusb0: usb@11201000 {
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1351  			compatible = "mediatek,mt8195-mtu3", "mediatek,mtu3";
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1352  			reg = <0 0x11201000 0 0x2dff>, <0 0x11203e00 0 0x0100>;
37f2582883be72 Tinghan Shen               2022-04-11  1353  			reg-names = "mac", "ippc";
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1354  			ranges = <0 0 0 0x11200000 0 0x3f00>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1355  			#address-cells = <2>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1356  			#size-cells = <2>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1357  			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH 0>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1358  			clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB>,
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1359  				 <&topckgen CLK_TOP_SSUSB_REF>,
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1360  				 <&infracfg_ao CLK_INFRA_AO_SSUSB_XHCI>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1361  			clock-names = "sys_ck", "ref_ck", "mcu_ck";
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1362  			phys = <&u2port0 PHY_TYPE_USB2>, <&u3port0 PHY_TYPE_USB3>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1363  			wakeup-source;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1364  			mediatek,syscon-wakeup = <&pericfg 0x400 103>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1365  			status = "disabled";
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1366  
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1367  			xhci0: usb@0 {
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1368  				compatible = "mediatek,mt8195-xhci", "mediatek,mtk-xhci";
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1369  				reg = <0 0 0 0x1000>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1370  				reg-names = "mac";
37f2582883be72 Tinghan Shen               2022-04-11  1371  				interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1372  				assigned-clocks = <&topckgen CLK_TOP_USB_TOP>,
37f2582883be72 Tinghan Shen               2022-04-11  1373  						  <&topckgen CLK_TOP_SSUSB_XHCI>;
37f2582883be72 Tinghan Shen               2022-04-11  1374  				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
37f2582883be72 Tinghan Shen               2022-04-11  1375  							 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
37f2582883be72 Tinghan Shen               2022-04-11  1376  				clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB>,
37f2582883be72 Tinghan Shen               2022-04-11  1377  					 <&topckgen CLK_TOP_SSUSB_REF>,
37f2582883be72 Tinghan Shen               2022-04-11  1378  					 <&apmixedsys CLK_APMIXED_USB1PLL>,
6210fc2e4ca255 Nícolas F. R. A. Prado     2022-07-08  1379  					 <&clk26m>,
37f2582883be72 Tinghan Shen               2022-04-11  1380  					 <&infracfg_ao CLK_INFRA_AO_SSUSB_XHCI>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1381  				clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
37f2582883be72 Tinghan Shen               2022-04-11  1382  				status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1383  			};
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1384  		};
37f2582883be72 Tinghan Shen               2022-04-11  1385  
37f2582883be72 Tinghan Shen               2022-04-11  1386  		mmc0: mmc@11230000 {
37f2582883be72 Tinghan Shen               2022-04-11  1387  			compatible = "mediatek,mt8195-mmc",
37f2582883be72 Tinghan Shen               2022-04-11  1388  				     "mediatek,mt8183-mmc";
37f2582883be72 Tinghan Shen               2022-04-11  1389  			reg = <0 0x11230000 0 0x10000>,
37f2582883be72 Tinghan Shen               2022-04-11  1390  			      <0 0x11f50000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  1391  			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1392  			clocks = <&topckgen CLK_TOP_MSDC50_0>,
37f2582883be72 Tinghan Shen               2022-04-11  1393  				 <&infracfg_ao CLK_INFRA_AO_MSDC0>,
37f2582883be72 Tinghan Shen               2022-04-11  1394  				 <&infracfg_ao CLK_INFRA_AO_MSDC0_SRC>;
37f2582883be72 Tinghan Shen               2022-04-11  1395  			clock-names = "source", "hclk", "source_cg";
37f2582883be72 Tinghan Shen               2022-04-11  1396  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1397  		};
37f2582883be72 Tinghan Shen               2022-04-11  1398  
37f2582883be72 Tinghan Shen               2022-04-11  1399  		mmc1: mmc@11240000 {
37f2582883be72 Tinghan Shen               2022-04-11  1400  			compatible = "mediatek,mt8195-mmc",
37f2582883be72 Tinghan Shen               2022-04-11  1401  				     "mediatek,mt8183-mmc";
37f2582883be72 Tinghan Shen               2022-04-11  1402  			reg = <0 0x11240000 0 0x1000>,
37f2582883be72 Tinghan Shen               2022-04-11  1403  			      <0 0x11c70000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  1404  			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1405  			clocks = <&topckgen CLK_TOP_MSDC30_1>,
37f2582883be72 Tinghan Shen               2022-04-11  1406  				 <&infracfg_ao CLK_INFRA_AO_MSDC1>,
37f2582883be72 Tinghan Shen               2022-04-11  1407  				 <&infracfg_ao CLK_INFRA_AO_MSDC1_SRC>;
37f2582883be72 Tinghan Shen               2022-04-11  1408  			clock-names = "source", "hclk", "source_cg";
37f2582883be72 Tinghan Shen               2022-04-11  1409  			assigned-clocks = <&topckgen CLK_TOP_MSDC30_1>;
37f2582883be72 Tinghan Shen               2022-04-11  1410  			assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL_D2>;
37f2582883be72 Tinghan Shen               2022-04-11  1411  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1412  		};
37f2582883be72 Tinghan Shen               2022-04-11  1413  
37f2582883be72 Tinghan Shen               2022-04-11  1414  		mmc2: mmc@11250000 {
37f2582883be72 Tinghan Shen               2022-04-11  1415  			compatible = "mediatek,mt8195-mmc",
37f2582883be72 Tinghan Shen               2022-04-11  1416  				     "mediatek,mt8183-mmc";
37f2582883be72 Tinghan Shen               2022-04-11  1417  			reg = <0 0x11250000 0 0x1000>,
37f2582883be72 Tinghan Shen               2022-04-11  1418  			      <0 0x11e60000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  1419  			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1420  			clocks = <&topckgen CLK_TOP_MSDC30_2>,
37f2582883be72 Tinghan Shen               2022-04-11  1421  				 <&infracfg_ao CLK_INFRA_AO_CG1_MSDC2>,
37f2582883be72 Tinghan Shen               2022-04-11  1422  				 <&infracfg_ao CLK_INFRA_AO_CG3_MSDC2>;
37f2582883be72 Tinghan Shen               2022-04-11  1423  			clock-names = "source", "hclk", "source_cg";
37f2582883be72 Tinghan Shen               2022-04-11  1424  			assigned-clocks = <&topckgen CLK_TOP_MSDC30_2>;
37f2582883be72 Tinghan Shen               2022-04-11  1425  			assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL_D2>;
37f2582883be72 Tinghan Shen               2022-04-11  1426  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1427  		};
37f2582883be72 Tinghan Shen               2022-04-11  1428  
fd1c6f13cfc3db Balsam CHIHI               2023-02-09  1429  		lvts_mcu: thermal-sensor@11278000 {
fd1c6f13cfc3db Balsam CHIHI               2023-02-09  1430  			compatible = "mediatek,mt8195-lvts-mcu";
fd1c6f13cfc3db Balsam CHIHI               2023-02-09  1431  			reg = <0 0x11278000 0 0x1000>;
fd1c6f13cfc3db Balsam CHIHI               2023-02-09  1432  			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
fd1c6f13cfc3db Balsam CHIHI               2023-02-09  1433  			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
fd1c6f13cfc3db Balsam CHIHI               2023-02-09  1434  			resets = <&infracfg_ao MT8195_INFRA_RST4_THERM_CTRL_MCU_SWRST>;
fd1c6f13cfc3db Balsam CHIHI               2023-02-09  1435  			nvmem-cells = <&lvts_efuse_data1 &lvts_efuse_data2>;
fd1c6f13cfc3db Balsam CHIHI               2023-02-09  1436  			nvmem-cell-names = "lvts-calib-data-1", "lvts-calib-data-2";
fd1c6f13cfc3db Balsam CHIHI               2023-02-09  1437  			#thermal-sensor-cells = <1>;
fd1c6f13cfc3db Balsam CHIHI               2023-02-09  1438  		};
fd1c6f13cfc3db Balsam CHIHI               2023-02-09  1439  
37f2582883be72 Tinghan Shen               2022-04-11  1440  		xhci1: usb@11290000 {
37f2582883be72 Tinghan Shen               2022-04-11  1441  			compatible = "mediatek,mt8195-xhci",
37f2582883be72 Tinghan Shen               2022-04-11  1442  				     "mediatek,mtk-xhci";
37f2582883be72 Tinghan Shen               2022-04-11  1443  			reg = <0 0x11290000 0 0x1000>,
37f2582883be72 Tinghan Shen               2022-04-11  1444  			      <0 0x11293e00 0 0x0100>;
37f2582883be72 Tinghan Shen               2022-04-11  1445  			reg-names = "mac", "ippc";
37f2582883be72 Tinghan Shen               2022-04-11  1446  			interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH 0>;
fe035fa6f56c5b Chen-Yu Tsai               2024-07-31  1447  			phys = <&u2port1 PHY_TYPE_USB2>, <&u3port1 PHY_TYPE_USB3>;
37f2582883be72 Tinghan Shen               2022-04-11  1448  			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_1P>,
37f2582883be72 Tinghan Shen               2022-04-11  1449  					  <&topckgen CLK_TOP_SSUSB_XHCI_1P>;
37f2582883be72 Tinghan Shen               2022-04-11  1450  			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
37f2582883be72 Tinghan Shen               2022-04-11  1451  						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
37f2582883be72 Tinghan Shen               2022-04-11  1452  			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_1P_BUS>,
37f2582883be72 Tinghan Shen               2022-04-11  1453  				 <&topckgen CLK_TOP_SSUSB_P1_REF>,
37f2582883be72 Tinghan Shen               2022-04-11  1454  				 <&apmixedsys CLK_APMIXED_USB1PLL>,
6210fc2e4ca255 Nícolas F. R. A. Prado     2022-07-08  1455  				 <&clk26m>,
37f2582883be72 Tinghan Shen               2022-04-11  1456  				 <&pericfg_ao CLK_PERI_AO_SSUSB_1P_XHCI>;
6210fc2e4ca255 Nícolas F. R. A. Prado     2022-07-08  1457  			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck",
6210fc2e4ca255 Nícolas F. R. A. Prado     2022-07-08  1458  				      "xhci_ck";
77d30613087c71 Chunfeng Yun               2022-06-17  1459  			mediatek,syscon-wakeup = <&pericfg 0x400 104>;
77d30613087c71 Chunfeng Yun               2022-06-17  1460  			wakeup-source;
37f2582883be72 Tinghan Shen               2022-04-11  1461  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1462  		};
37f2582883be72 Tinghan Shen               2022-04-11  1463  
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1464  		ssusb2: usb@112a1000 {
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1465  			compatible = "mediatek,mt8195-mtu3", "mediatek,mtu3";
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1466  			reg = <0 0x112a1000 0 0x2dff>, <0 0x112a3e00 0 0x0100>;
37f2582883be72 Tinghan Shen               2022-04-11  1467  			reg-names = "mac", "ippc";
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1468  			ranges = <0 0 0 0x112a0000 0 0x3f00>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1469  			#address-cells = <2>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1470  			#size-cells = <2>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1471  			interrupts = <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH 0>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1472  			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_2P>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1473  			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
37f2582883be72 Tinghan Shen               2022-04-11  1474  			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_2P_BUS>,
37f2582883be72 Tinghan Shen               2022-04-11  1475  				 <&topckgen CLK_TOP_SSUSB_P2_REF>,
37f2582883be72 Tinghan Shen               2022-04-11  1476  				 <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1477  			clock-names = "sys_ck", "ref_ck", "mcu_ck";
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1478  			phys = <&u2port2 PHY_TYPE_USB2>;
77d30613087c71 Chunfeng Yun               2022-06-17  1479  			wakeup-source;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1480  			mediatek,syscon-wakeup = <&pericfg 0x400 105>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1481  			status = "disabled";
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1482  
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1483  			xhci2: usb@0 {
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1484  				compatible = "mediatek,mt8195-xhci", "mediatek,mtk-xhci";
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1485  				reg = <0 0 0 0x1000>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1486  				reg-names = "mac";
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1487  				interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH 0>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1488  				assigned-clocks = <&topckgen CLK_TOP_SSUSB_XHCI_2P>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1489  				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1490  				clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1491  				clock-names = "sys_ck";
37f2582883be72 Tinghan Shen               2022-04-11  1492  				status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1493  			};
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1494  		};
37f2582883be72 Tinghan Shen               2022-04-11  1495  
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1496  		ssusb3: usb@112b1000 {
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1497  			compatible = "mediatek,mt8195-mtu3", "mediatek,mtu3";
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1498  			reg = <0 0x112b1000 0 0x2dff>, <0 0x112b3e00 0 0x0100>;
37f2582883be72 Tinghan Shen               2022-04-11  1499  			reg-names = "mac", "ippc";
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1500  			ranges = <0 0 0 0x112b0000 0 0x3f00>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1501  			#address-cells = <2>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1502  			#size-cells = <2>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1503  			interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH 0>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1504  			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_3P>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1505  			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
37f2582883be72 Tinghan Shen               2022-04-11  1506  			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_3P_BUS>,
37f2582883be72 Tinghan Shen               2022-04-11  1507  				 <&topckgen CLK_TOP_SSUSB_P3_REF>,
37f2582883be72 Tinghan Shen               2022-04-11  1508  				 <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1509  			clock-names = "sys_ck", "ref_ck", "mcu_ck";
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1510  			phys = <&u2port3 PHY_TYPE_USB2>;
77d30613087c71 Chunfeng Yun               2022-06-17  1511  			wakeup-source;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1512  			mediatek,syscon-wakeup = <&pericfg 0x400 106>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1513  			status = "disabled";
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1514  
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1515  			xhci3: usb@0 {
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1516  				compatible = "mediatek,mt8195-xhci", "mediatek,mtk-xhci";
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1517  				reg = <0 0 0 0x1000>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1518  				reg-names = "mac";
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1519  				interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1520  				assigned-clocks = <&topckgen CLK_TOP_SSUSB_XHCI_3P>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1521  				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1522  				clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>;
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1523  				clock-names = "sys_ck";
37f2582883be72 Tinghan Shen               2022-04-11  1524  				status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1525  			};
795d5f0c8468fb AngeloGioacchino Del Regno 2024-01-15  1526  		};
37f2582883be72 Tinghan Shen               2022-04-11  1527  
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1528  		pcie0: pcie@112f0000 {
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1529  			compatible = "mediatek,mt8195-pcie",
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1530  				     "mediatek,mt8192-pcie";
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1531  			device_type = "pci";
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1532  			#address-cells = <3>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1533  			#size-cells = <2>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1534  			reg = <0 0x112f0000 0 0x4000>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1535  			reg-names = "pcie-mac";
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1536  			interrupts = <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH 0>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1537  			bus-range = <0x00 0xff>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1538  			ranges = <0x81000000 0 0x20000000
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1539  				  0x0 0x20000000 0 0x200000>,
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1540  				 <0x82000000 0 0x20200000
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1541  				  0x0 0x20200000 0 0x3e00000>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1542  
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1543  			iommu-map = <0 &iommu_infra IOMMU_PORT_INFRA_PCIE0 0x2>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1544  			iommu-map-mask = <0x0>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1545  
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1546  			clocks = <&infracfg_ao CLK_INFRA_AO_PCIE_PL_P_250M_P0>,
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1547  				 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_26M>,
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1548  				 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_96M>,
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1549  				 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_32K>,
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1550  				 <&infracfg_ao CLK_INFRA_AO_PCIE_PERI_26M>,
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1551  				 <&pericfg_ao CLK_PERI_AO_PCIE_P0_MEM>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1552  			clock-names = "pl_250m", "tl_26m", "tl_96m",
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1553  				      "tl_32k", "peri_26m", "peri_mem";
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1554  			assigned-clocks = <&topckgen CLK_TOP_TL>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1555  			assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4_D4>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1556  
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1557  			phys = <&pciephy>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1558  			phy-names = "pcie-phy";
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1559  
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1560  			power-domains = <&spm MT8195_POWER_DOMAIN_PCIE_MAC_P0>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1561  
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1562  			resets = <&infracfg_ao MT8195_INFRA_RST2_PCIE_P0_SWRST>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1563  			reset-names = "mac";
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1564  
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1565  			#interrupt-cells = <1>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1566  			interrupt-map-mask = <0 0 0 7>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1567  			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1568  					<0 0 0 2 &pcie_intc0 1>,
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1569  					<0 0 0 3 &pcie_intc0 2>,
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1570  					<0 0 0 4 &pcie_intc0 3>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1571  			status = "disabled";
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1572  
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1573  			pcie_intc0: interrupt-controller {
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1574  				interrupt-controller;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1575  				#address-cells = <0>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1576  				#interrupt-cells = <1>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1577  			};
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1578  		};
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1579  
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1580  		pcie1: pcie@112f8000 {
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1581  			compatible = "mediatek,mt8195-pcie",
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1582  				     "mediatek,mt8192-pcie";
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1583  			device_type = "pci";
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1584  			#address-cells = <3>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1585  			#size-cells = <2>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1586  			reg = <0 0x112f8000 0 0x4000>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1587  			reg-names = "pcie-mac";
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1588  			interrupts = <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH 0>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1589  			bus-range = <0x00 0xff>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1590  			ranges = <0x81000000 0 0x24000000
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1591  				  0x0 0x24000000 0 0x200000>,
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1592  				 <0x82000000 0 0x24200000
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1593  				  0x0 0x24200000 0 0x3e00000>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1594  
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1595  			iommu-map = <0 &iommu_infra IOMMU_PORT_INFRA_PCIE1 0x2>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1596  			iommu-map-mask = <0x0>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1597  
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1598  			clocks = <&infracfg_ao CLK_INFRA_AO_PCIE_PL_P_250M_P1>,
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1599  				 <&clk26m>,
1bd1d10d1c0cbb AngeloGioacchino Del Regno 2022-12-14  1600  				 <&infracfg_ao CLK_INFRA_AO_PCIE_P1_TL_96M>,
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1601  				 <&clk26m>,
1bd1d10d1c0cbb AngeloGioacchino Del Regno 2022-12-14  1602  				 <&infracfg_ao CLK_INFRA_AO_PCIE_P1_PERI_26M>,
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1603  				 /* Designer has connect pcie1 with peri_mem_p0 clock */
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1604  				 <&pericfg_ao CLK_PERI_AO_PCIE_P0_MEM>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1605  			clock-names = "pl_250m", "tl_26m", "tl_96m",
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1606  				      "tl_32k", "peri_26m", "peri_mem";
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1607  			assigned-clocks = <&topckgen CLK_TOP_TL_P1>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1608  			assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4_D4>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1609  
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1610  			phys = <&u3port1 PHY_TYPE_PCIE>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1611  			phy-names = "pcie-phy";
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1612  			power-domains = <&spm MT8195_POWER_DOMAIN_PCIE_MAC_P1>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1613  
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1614  			#interrupt-cells = <1>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1615  			interrupt-map-mask = <0 0 0 7>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1616  			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1617  					<0 0 0 2 &pcie_intc1 1>,
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1618  					<0 0 0 3 &pcie_intc1 2>,
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1619  					<0 0 0 4 &pcie_intc1 3>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1620  			status = "disabled";
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1621  
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1622  			pcie_intc1: interrupt-controller {
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1623  				interrupt-controller;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1624  				#address-cells = <0>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1625  				#interrupt-cells = <1>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1626  			};
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1627  		};
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1628  
37f2582883be72 Tinghan Shen               2022-04-11  1629  		nor_flash: spi@1132c000 {
37f2582883be72 Tinghan Shen               2022-04-11  1630  			compatible = "mediatek,mt8195-nor",
37f2582883be72 Tinghan Shen               2022-04-11  1631  				     "mediatek,mt8173-nor";
37f2582883be72 Tinghan Shen               2022-04-11  1632  			reg = <0 0x1132c000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  1633  			interrupts = <GIC_SPI 825 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1634  			clocks = <&topckgen CLK_TOP_SPINOR>,
37f2582883be72 Tinghan Shen               2022-04-11  1635  				 <&pericfg_ao CLK_PERI_AO_FLASHIF_FLASH>,
37f2582883be72 Tinghan Shen               2022-04-11  1636  				 <&pericfg_ao CLK_PERI_AO_FLASHIF_BUS>;
37f2582883be72 Tinghan Shen               2022-04-11  1637  			clock-names = "spi", "sf", "axi";
37f2582883be72 Tinghan Shen               2022-04-11  1638  			#address-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1639  			#size-cells = <0>;
37f2582883be72 Tinghan Shen               2022-04-11  1640  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1641  		};
37f2582883be72 Tinghan Shen               2022-04-11  1642  
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1643  		efuse: efuse@11c10000 {
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1644  			compatible = "mediatek,mt8195-efuse", "mediatek,efuse";
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1645  			reg = <0 0x11c10000 0 0x1000>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1646  			#address-cells = <1>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1647  			#size-cells = <1>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1648  			u3_tx_imp_p0: usb3-tx-imp@184,1 {
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1649  				reg = <0x184 0x1>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1650  				bits = <0 5>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1651  			};
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1652  			u3_rx_imp_p0: usb3-rx-imp@184,2 {
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1653  				reg = <0x184 0x2>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1654  				bits = <5 5>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1655  			};
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1656  			u3_intr_p0: usb3-intr@185 {
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1657  				reg = <0x185 0x1>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1658  				bits = <2 6>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1659  			};
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1660  			comb_tx_imp_p1: usb3-tx-imp@186,1 {
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1661  				reg = <0x186 0x1>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1662  				bits = <0 5>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1663  			};
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1664  			comb_rx_imp_p1: usb3-rx-imp@186,2 {
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1665  				reg = <0x186 0x2>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1666  				bits = <5 5>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1667  			};
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1668  			comb_intr_p1: usb3-intr@187 {
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1669  				reg = <0x187 0x1>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1670  				bits = <2 6>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1671  			};
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1672  			u2_intr_p0: usb2-intr-p0@188,1 {
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1673  				reg = <0x188 0x1>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1674  				bits = <0 5>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1675  			};
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1676  			u2_intr_p1: usb2-intr-p1@188,2 {
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1677  				reg = <0x188 0x2>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1678  				bits = <5 5>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1679  			};
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1680  			u2_intr_p2: usb2-intr-p2@189,1 {
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1681  				reg = <0x189 0x1>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1682  				bits = <2 5>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1683  			};
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1684  			u2_intr_p3: usb2-intr-p3@189,2 {
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1685  				reg = <0x189 0x2>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1686  				bits = <7 5>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1687  			};
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1688  			pciephy_rx_ln1: pciephy-rx-ln1@190,1 {
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1689  				reg = <0x190 0x1>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1690  				bits = <0 4>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1691  			};
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1692  			pciephy_tx_ln1_nmos: pciephy-tx-ln1-nmos@190,2 {
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1693  				reg = <0x190 0x1>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1694  				bits = <4 4>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1695  			};
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1696  			pciephy_tx_ln1_pmos: pciephy-tx-ln1-pmos@191,1 {
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1697  				reg = <0x191 0x1>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1698  				bits = <0 4>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1699  			};
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1700  			pciephy_rx_ln0: pciephy-rx-ln0@191,2 {
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1701  				reg = <0x191 0x1>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1702  				bits = <4 4>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1703  			};
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1704  			pciephy_tx_ln0_nmos: pciephy-tx-ln0-nmos@192,1 {
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1705  				reg = <0x192 0x1>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1706  				bits = <0 4>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1707  			};
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1708  			pciephy_tx_ln0_pmos: pciephy-tx-ln0-pmos@192,2 {
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1709  				reg = <0x192 0x1>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1710  				bits = <4 4>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1711  			};
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1712  			pciephy_glb_intr: pciephy-glb-intr@193 {
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1713  				reg = <0x193 0x1>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1714  				bits = <0 4>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1715  			};
64196979f91832 Bo-Chen Chen               2022-11-10  1716  			dp_calibration: dp-data@1ac {
64196979f91832 Bo-Chen Chen               2022-11-10  1717  				reg = <0x1ac 0x10>;
64196979f91832 Bo-Chen Chen               2022-11-10  1718  			};
89b045d3c2cdff Balsam CHIHI               2023-01-24  1719  			lvts_efuse_data1: lvts1-calib@1bc {
89b045d3c2cdff Balsam CHIHI               2023-01-24  1720  				reg = <0x1bc 0x14>;
89b045d3c2cdff Balsam CHIHI               2023-01-24  1721  			};
89b045d3c2cdff Balsam CHIHI               2023-01-24  1722  			lvts_efuse_data2: lvts2-calib@1d0 {
89b045d3c2cdff Balsam CHIHI               2023-01-24  1723  				reg = <0x1d0 0x38>;
89b045d3c2cdff Balsam CHIHI               2023-01-24  1724  			};
f4747b91dbc6a3 AngeloGioacchino Del Regno 2023-11-21  1725  			svs_calib_data: svs-calib@580 {
f4747b91dbc6a3 AngeloGioacchino Del Regno 2023-11-21  1726  				reg = <0x580 0x64>;
f4747b91dbc6a3 AngeloGioacchino Del Regno 2023-11-21  1727  			};
94e4dd09581b2b William-tw Lin             2023-12-22  1728  			socinfo-data1@7a0 {
94e4dd09581b2b William-tw Lin             2023-12-22  1729  				reg = <0x7a0 0x4>;
94e4dd09581b2b William-tw Lin             2023-12-22  1730  			};
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1731  		};
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1732  
37f2582883be72 Tinghan Shen               2022-04-11  1733  		u3phy2: t-phy@11c40000 {
37f2582883be72 Tinghan Shen               2022-04-11  1734  			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v3";
37f2582883be72 Tinghan Shen               2022-04-11  1735  			#address-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1736  			#size-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1737  			ranges = <0 0 0x11c40000 0x700>;
37f2582883be72 Tinghan Shen               2022-04-11  1738  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1739  
37f2582883be72 Tinghan Shen               2022-04-11  1740  			u2port2: usb-phy@0 {
37f2582883be72 Tinghan Shen               2022-04-11  1741  				reg = <0x0 0x700>;
37f2582883be72 Tinghan Shen               2022-04-11  1742  				clocks = <&topckgen CLK_TOP_SSUSB_PHY_P2_REF>;
37f2582883be72 Tinghan Shen               2022-04-11  1743  				clock-names = "ref";
37f2582883be72 Tinghan Shen               2022-04-11  1744  				#phy-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1745  			};
37f2582883be72 Tinghan Shen               2022-04-11  1746  		};
37f2582883be72 Tinghan Shen               2022-04-11  1747  
37f2582883be72 Tinghan Shen               2022-04-11  1748  		u3phy3: t-phy@11c50000 {
37f2582883be72 Tinghan Shen               2022-04-11  1749  			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v3";
37f2582883be72 Tinghan Shen               2022-04-11  1750  			#address-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1751  			#size-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1752  			ranges = <0 0 0x11c50000 0x700>;
37f2582883be72 Tinghan Shen               2022-04-11  1753  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1754  
37f2582883be72 Tinghan Shen               2022-04-11  1755  			u2port3: usb-phy@0 {
37f2582883be72 Tinghan Shen               2022-04-11  1756  				reg = <0x0 0x700>;
37f2582883be72 Tinghan Shen               2022-04-11  1757  				clocks = <&topckgen CLK_TOP_SSUSB_PHY_P3_REF>;
37f2582883be72 Tinghan Shen               2022-04-11  1758  				clock-names = "ref";
37f2582883be72 Tinghan Shen               2022-04-11  1759  				#phy-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1760  			};
37f2582883be72 Tinghan Shen               2022-04-11  1761  		};
37f2582883be72 Tinghan Shen               2022-04-11  1762  
b7f638d6bab947 Michael Walle              2023-11-23  1763  		mipi_tx0: dsi-phy@11c80000 {
b7f638d6bab947 Michael Walle              2023-11-23  1764  			compatible = "mediatek,mt8195-mipi-tx", "mediatek,mt8183-mipi-tx";
b7f638d6bab947 Michael Walle              2023-11-23  1765  			reg = <0 0x11c80000 0 0x1000>;
b7f638d6bab947 Michael Walle              2023-11-23  1766  			clocks = <&clk26m>;
b7f638d6bab947 Michael Walle              2023-11-23  1767  			clock-output-names = "mipi_tx0_pll";
b7f638d6bab947 Michael Walle              2023-11-23  1768  			#clock-cells = <0>;
b7f638d6bab947 Michael Walle              2023-11-23  1769  			#phy-cells = <0>;
b7f638d6bab947 Michael Walle              2023-11-23  1770  			status = "disabled";
b7f638d6bab947 Michael Walle              2023-11-23  1771  		};
b7f638d6bab947 Michael Walle              2023-11-23  1772  
b7f638d6bab947 Michael Walle              2023-11-23  1773  		mipi_tx1: dsi-phy@11c90000 {
b7f638d6bab947 Michael Walle              2023-11-23  1774  			compatible = "mediatek,mt8195-mipi-tx", "mediatek,mt8183-mipi-tx";
b7f638d6bab947 Michael Walle              2023-11-23  1775  			reg = <0 0x11c90000 0 0x1000>;
b7f638d6bab947 Michael Walle              2023-11-23  1776  			clocks = <&clk26m>;
b7f638d6bab947 Michael Walle              2023-11-23  1777  			clock-output-names = "mipi_tx1_pll";
b7f638d6bab947 Michael Walle              2023-11-23  1778  			#clock-cells = <0>;
b7f638d6bab947 Michael Walle              2023-11-23  1779  			#phy-cells = <0>;
b7f638d6bab947 Michael Walle              2023-11-23  1780  			status = "disabled";
b7f638d6bab947 Michael Walle              2023-11-23  1781  		};
b7f638d6bab947 Michael Walle              2023-11-23  1782  
37f2582883be72 Tinghan Shen               2022-04-11  1783  		i2c5: i2c@11d00000 {
37f2582883be72 Tinghan Shen               2022-04-11  1784  			compatible = "mediatek,mt8195-i2c",
37f2582883be72 Tinghan Shen               2022-04-11  1785  				     "mediatek,mt8192-i2c";
37f2582883be72 Tinghan Shen               2022-04-11  1786  			reg = <0 0x11d00000 0 0x1000>,
37f2582883be72 Tinghan Shen               2022-04-11  1787  			      <0 0x10220580 0 0x80>;
37f2582883be72 Tinghan Shen               2022-04-11  1788  			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1789  			clock-div = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1790  			clocks = <&imp_iic_wrap_s CLK_IMP_IIC_WRAP_S_I2C5>,
37f2582883be72 Tinghan Shen               2022-04-11  1791  				 <&infracfg_ao CLK_INFRA_AO_APDMA_B>;
37f2582883be72 Tinghan Shen               2022-04-11  1792  			clock-names = "main", "dma";
37f2582883be72 Tinghan Shen               2022-04-11  1793  			#address-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1794  			#size-cells = <0>;
37f2582883be72 Tinghan Shen               2022-04-11  1795  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1796  		};
37f2582883be72 Tinghan Shen               2022-04-11  1797  
37f2582883be72 Tinghan Shen               2022-04-11  1798  		i2c6: i2c@11d01000 {
37f2582883be72 Tinghan Shen               2022-04-11  1799  			compatible = "mediatek,mt8195-i2c",
37f2582883be72 Tinghan Shen               2022-04-11  1800  				     "mediatek,mt8192-i2c";
37f2582883be72 Tinghan Shen               2022-04-11  1801  			reg = <0 0x11d01000 0 0x1000>,
37f2582883be72 Tinghan Shen               2022-04-11  1802  			      <0 0x10220600 0 0x80>;
37f2582883be72 Tinghan Shen               2022-04-11  1803  			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1804  			clock-div = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1805  			clocks = <&imp_iic_wrap_s CLK_IMP_IIC_WRAP_S_I2C6>,
37f2582883be72 Tinghan Shen               2022-04-11  1806  				 <&infracfg_ao CLK_INFRA_AO_APDMA_B>;
37f2582883be72 Tinghan Shen               2022-04-11  1807  			clock-names = "main", "dma";
37f2582883be72 Tinghan Shen               2022-04-11  1808  			#address-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1809  			#size-cells = <0>;
37f2582883be72 Tinghan Shen               2022-04-11  1810  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1811  		};
37f2582883be72 Tinghan Shen               2022-04-11  1812  
37f2582883be72 Tinghan Shen               2022-04-11  1813  		i2c7: i2c@11d02000 {
37f2582883be72 Tinghan Shen               2022-04-11  1814  			compatible = "mediatek,mt8195-i2c",
37f2582883be72 Tinghan Shen               2022-04-11  1815  				     "mediatek,mt8192-i2c";
37f2582883be72 Tinghan Shen               2022-04-11  1816  			reg = <0 0x11d02000 0 0x1000>,
37f2582883be72 Tinghan Shen               2022-04-11  1817  			      <0 0x10220680 0 0x80>;
37f2582883be72 Tinghan Shen               2022-04-11  1818  			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1819  			clock-div = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1820  			clocks = <&imp_iic_wrap_s CLK_IMP_IIC_WRAP_S_I2C7>,
37f2582883be72 Tinghan Shen               2022-04-11  1821  				 <&infracfg_ao CLK_INFRA_AO_APDMA_B>;
37f2582883be72 Tinghan Shen               2022-04-11  1822  			clock-names = "main", "dma";
37f2582883be72 Tinghan Shen               2022-04-11  1823  			#address-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1824  			#size-cells = <0>;
37f2582883be72 Tinghan Shen               2022-04-11  1825  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1826  		};
37f2582883be72 Tinghan Shen               2022-04-11  1827  
37f2582883be72 Tinghan Shen               2022-04-11  1828  		imp_iic_wrap_s: clock-controller@11d03000 {
37f2582883be72 Tinghan Shen               2022-04-11  1829  			compatible = "mediatek,mt8195-imp_iic_wrap_s";
37f2582883be72 Tinghan Shen               2022-04-11  1830  			reg = <0 0x11d03000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  1831  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1832  		};
37f2582883be72 Tinghan Shen               2022-04-11  1833  
37f2582883be72 Tinghan Shen               2022-04-11  1834  		i2c0: i2c@11e00000 {
37f2582883be72 Tinghan Shen               2022-04-11  1835  			compatible = "mediatek,mt8195-i2c",
37f2582883be72 Tinghan Shen               2022-04-11  1836  				     "mediatek,mt8192-i2c";
37f2582883be72 Tinghan Shen               2022-04-11  1837  			reg = <0 0x11e00000 0 0x1000>,
37f2582883be72 Tinghan Shen               2022-04-11  1838  			      <0 0x10220080 0 0x80>;
37f2582883be72 Tinghan Shen               2022-04-11  1839  			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1840  			clock-div = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1841  			clocks = <&imp_iic_wrap_w CLK_IMP_IIC_WRAP_W_I2C0>,
37f2582883be72 Tinghan Shen               2022-04-11  1842  				 <&infracfg_ao CLK_INFRA_AO_APDMA_B>;
37f2582883be72 Tinghan Shen               2022-04-11  1843  			clock-names = "main", "dma";
37f2582883be72 Tinghan Shen               2022-04-11  1844  			#address-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1845  			#size-cells = <0>;
a93f071a753a2f Tzung-Bi Shih              2022-08-11  1846  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1847  		};
37f2582883be72 Tinghan Shen               2022-04-11  1848  
37f2582883be72 Tinghan Shen               2022-04-11  1849  		i2c1: i2c@11e01000 {
37f2582883be72 Tinghan Shen               2022-04-11  1850  			compatible = "mediatek,mt8195-i2c",
37f2582883be72 Tinghan Shen               2022-04-11  1851  				     "mediatek,mt8192-i2c";
37f2582883be72 Tinghan Shen               2022-04-11  1852  			reg = <0 0x11e01000 0 0x1000>,
37f2582883be72 Tinghan Shen               2022-04-11  1853  			      <0 0x10220200 0 0x80>;
37f2582883be72 Tinghan Shen               2022-04-11  1854  			interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1855  			clock-div = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1856  			clocks = <&imp_iic_wrap_w CLK_IMP_IIC_WRAP_W_I2C1>,
37f2582883be72 Tinghan Shen               2022-04-11  1857  				 <&infracfg_ao CLK_INFRA_AO_APDMA_B>;
37f2582883be72 Tinghan Shen               2022-04-11  1858  			clock-names = "main", "dma";
37f2582883be72 Tinghan Shen               2022-04-11  1859  			#address-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1860  			#size-cells = <0>;
37f2582883be72 Tinghan Shen               2022-04-11  1861  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1862  		};
37f2582883be72 Tinghan Shen               2022-04-11  1863  
37f2582883be72 Tinghan Shen               2022-04-11  1864  		i2c2: i2c@11e02000 {
37f2582883be72 Tinghan Shen               2022-04-11  1865  			compatible = "mediatek,mt8195-i2c",
37f2582883be72 Tinghan Shen               2022-04-11  1866  				     "mediatek,mt8192-i2c";
37f2582883be72 Tinghan Shen               2022-04-11  1867  			reg = <0 0x11e02000 0 0x1000>,
37f2582883be72 Tinghan Shen               2022-04-11  1868  			      <0 0x10220380 0 0x80>;
37f2582883be72 Tinghan Shen               2022-04-11  1869  			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1870  			clock-div = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1871  			clocks = <&imp_iic_wrap_w CLK_IMP_IIC_WRAP_W_I2C2>,
37f2582883be72 Tinghan Shen               2022-04-11  1872  				 <&infracfg_ao CLK_INFRA_AO_APDMA_B>;
37f2582883be72 Tinghan Shen               2022-04-11  1873  			clock-names = "main", "dma";
37f2582883be72 Tinghan Shen               2022-04-11  1874  			#address-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1875  			#size-cells = <0>;
37f2582883be72 Tinghan Shen               2022-04-11  1876  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1877  		};
37f2582883be72 Tinghan Shen               2022-04-11  1878  
37f2582883be72 Tinghan Shen               2022-04-11  1879  		i2c3: i2c@11e03000 {
37f2582883be72 Tinghan Shen               2022-04-11  1880  			compatible = "mediatek,mt8195-i2c",
37f2582883be72 Tinghan Shen               2022-04-11  1881  				     "mediatek,mt8192-i2c";
37f2582883be72 Tinghan Shen               2022-04-11  1882  			reg = <0 0x11e03000 0 0x1000>,
37f2582883be72 Tinghan Shen               2022-04-11  1883  			      <0 0x10220480 0 0x80>;
37f2582883be72 Tinghan Shen               2022-04-11  1884  			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1885  			clock-div = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1886  			clocks = <&imp_iic_wrap_w CLK_IMP_IIC_WRAP_W_I2C3>,
37f2582883be72 Tinghan Shen               2022-04-11  1887  				 <&infracfg_ao CLK_INFRA_AO_APDMA_B>;
37f2582883be72 Tinghan Shen               2022-04-11  1888  			clock-names = "main", "dma";
37f2582883be72 Tinghan Shen               2022-04-11  1889  			#address-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1890  			#size-cells = <0>;
37f2582883be72 Tinghan Shen               2022-04-11  1891  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1892  		};
37f2582883be72 Tinghan Shen               2022-04-11  1893  
37f2582883be72 Tinghan Shen               2022-04-11  1894  		i2c4: i2c@11e04000 {
37f2582883be72 Tinghan Shen               2022-04-11  1895  			compatible = "mediatek,mt8195-i2c",
37f2582883be72 Tinghan Shen               2022-04-11  1896  				     "mediatek,mt8192-i2c";
37f2582883be72 Tinghan Shen               2022-04-11  1897  			reg = <0 0x11e04000 0 0x1000>,
37f2582883be72 Tinghan Shen               2022-04-11  1898  			      <0 0x10220500 0 0x80>;
37f2582883be72 Tinghan Shen               2022-04-11  1899  			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH 0>;
37f2582883be72 Tinghan Shen               2022-04-11  1900  			clock-div = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1901  			clocks = <&imp_iic_wrap_w CLK_IMP_IIC_WRAP_W_I2C4>,
37f2582883be72 Tinghan Shen               2022-04-11  1902  				 <&infracfg_ao CLK_INFRA_AO_APDMA_B>;
37f2582883be72 Tinghan Shen               2022-04-11  1903  			clock-names = "main", "dma";
37f2582883be72 Tinghan Shen               2022-04-11  1904  			#address-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1905  			#size-cells = <0>;
37f2582883be72 Tinghan Shen               2022-04-11  1906  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1907  		};
37f2582883be72 Tinghan Shen               2022-04-11  1908  
37f2582883be72 Tinghan Shen               2022-04-11  1909  		imp_iic_wrap_w: clock-controller@11e05000 {
37f2582883be72 Tinghan Shen               2022-04-11  1910  			compatible = "mediatek,mt8195-imp_iic_wrap_w";
37f2582883be72 Tinghan Shen               2022-04-11  1911  			reg = <0 0x11e05000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  1912  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1913  		};
37f2582883be72 Tinghan Shen               2022-04-11  1914  
37f2582883be72 Tinghan Shen               2022-04-11  1915  		u3phy1: t-phy@11e30000 {
37f2582883be72 Tinghan Shen               2022-04-11  1916  			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v3";
37f2582883be72 Tinghan Shen               2022-04-11  1917  			#address-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1918  			#size-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1919  			ranges = <0 0 0x11e30000 0xe00>;
a9f6721a3c9276 AngeloGioacchino Del Regno 2022-12-14  1920  			power-domains = <&spm MT8195_POWER_DOMAIN_SSUSB_PCIE_PHY>;
37f2582883be72 Tinghan Shen               2022-04-11  1921  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1922  
37f2582883be72 Tinghan Shen               2022-04-11  1923  			u2port1: usb-phy@0 {
37f2582883be72 Tinghan Shen               2022-04-11  1924  				reg = <0x0 0x700>;
37f2582883be72 Tinghan Shen               2022-04-11  1925  				clocks = <&topckgen CLK_TOP_SSUSB_PHY_P1_REF>,
37f2582883be72 Tinghan Shen               2022-04-11  1926  					 <&clk26m>;
37f2582883be72 Tinghan Shen               2022-04-11  1927  				clock-names = "ref", "da_ref";
37f2582883be72 Tinghan Shen               2022-04-11  1928  				#phy-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1929  			};
37f2582883be72 Tinghan Shen               2022-04-11  1930  
37f2582883be72 Tinghan Shen               2022-04-11  1931  			u3port1: usb-phy@700 {
37f2582883be72 Tinghan Shen               2022-04-11  1932  				reg = <0x700 0x700>;
37f2582883be72 Tinghan Shen               2022-04-11  1933  				clocks = <&apmixedsys CLK_APMIXED_PLL_SSUSB26M>,
37f2582883be72 Tinghan Shen               2022-04-11  1934  					 <&topckgen CLK_TOP_SSUSB_PHY_P1_REF>;
37f2582883be72 Tinghan Shen               2022-04-11  1935  				clock-names = "ref", "da_ref";
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1936  				nvmem-cells = <&comb_intr_p1>,
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1937  					      <&comb_rx_imp_p1>,
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1938  					      <&comb_tx_imp_p1>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1939  				nvmem-cell-names = "intr", "rx_imp", "tx_imp";
37f2582883be72 Tinghan Shen               2022-04-11  1940  				#phy-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1941  			};
37f2582883be72 Tinghan Shen               2022-04-11  1942  		};
37f2582883be72 Tinghan Shen               2022-04-11  1943  
37f2582883be72 Tinghan Shen               2022-04-11  1944  		u3phy0: t-phy@11e40000 {
37f2582883be72 Tinghan Shen               2022-04-11  1945  			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v3";
37f2582883be72 Tinghan Shen               2022-04-11  1946  			#address-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1947  			#size-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1948  			ranges = <0 0 0x11e40000 0xe00>;
37f2582883be72 Tinghan Shen               2022-04-11  1949  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  1950  
37f2582883be72 Tinghan Shen               2022-04-11  1951  			u2port0: usb-phy@0 {
37f2582883be72 Tinghan Shen               2022-04-11  1952  				reg = <0x0 0x700>;
37f2582883be72 Tinghan Shen               2022-04-11  1953  				clocks = <&topckgen CLK_TOP_SSUSB_PHY_REF>,
37f2582883be72 Tinghan Shen               2022-04-11  1954  					 <&clk26m>;
37f2582883be72 Tinghan Shen               2022-04-11  1955  				clock-names = "ref", "da_ref";
37f2582883be72 Tinghan Shen               2022-04-11  1956  				#phy-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1957  			};
37f2582883be72 Tinghan Shen               2022-04-11  1958  
37f2582883be72 Tinghan Shen               2022-04-11  1959  			u3port0: usb-phy@700 {
37f2582883be72 Tinghan Shen               2022-04-11  1960  				reg = <0x700 0x700>;
37f2582883be72 Tinghan Shen               2022-04-11  1961  				clocks = <&apmixedsys CLK_APMIXED_PLL_SSUSB26M>,
37f2582883be72 Tinghan Shen               2022-04-11  1962  					 <&topckgen CLK_TOP_SSUSB_PHY_REF>;
37f2582883be72 Tinghan Shen               2022-04-11  1963  				clock-names = "ref", "da_ref";
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1964  				nvmem-cells = <&u3_intr_p0>,
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1965  					      <&u3_rx_imp_p0>,
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1966  					      <&u3_tx_imp_p0>;
ab43a84c9863b6 Chunfeng Yun               2022-06-17  1967  				nvmem-cell-names = "intr", "rx_imp", "tx_imp";
37f2582883be72 Tinghan Shen               2022-04-11  1968  				#phy-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  1969  			};
37f2582883be72 Tinghan Shen               2022-04-11  1970  		};
37f2582883be72 Tinghan Shen               2022-04-11  1971  
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1972  		pciephy: phy@11e80000 {
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1973  			compatible = "mediatek,mt8195-pcie-phy";
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1974  			reg = <0 0x11e80000 0 0x10000>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1975  			reg-names = "sif";
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1976  			nvmem-cells = <&pciephy_glb_intr>, <&pciephy_tx_ln0_pmos>,
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1977  				      <&pciephy_tx_ln0_nmos>, <&pciephy_rx_ln0>,
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1978  				      <&pciephy_tx_ln1_pmos>, <&pciephy_tx_ln1_nmos>,
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1979  				      <&pciephy_rx_ln1>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1980  			nvmem-cell-names = "glb_intr", "tx_ln0_pmos",
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1981  					   "tx_ln0_nmos", "rx_ln0",
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1982  					   "tx_ln1_pmos", "tx_ln1_nmos",
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1983  					   "rx_ln1";
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1984  			power-domains = <&spm MT8195_POWER_DOMAIN_PCIE_PHY>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1985  			#phy-cells = <0>;
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1986  			status = "disabled";
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1987  		};
ecc0af6a3fe6ae Tinghan Shen               2022-11-03  1988  
37f2582883be72 Tinghan Shen               2022-04-11  1989  		ufsphy: ufs-phy@11fa0000 {
37f2582883be72 Tinghan Shen               2022-04-11  1990  			compatible = "mediatek,mt8195-ufsphy", "mediatek,mt8183-ufsphy";
37f2582883be72 Tinghan Shen               2022-04-11  1991  			reg = <0 0x11fa0000 0 0xc000>;
37f2582883be72 Tinghan Shen               2022-04-11  1992  			clocks = <&clk26m>, <&clk26m>;
37f2582883be72 Tinghan Shen               2022-04-11  1993  			clock-names = "unipro", "mp";
37f2582883be72 Tinghan Shen               2022-04-11  1994  			#phy-cells = <0>;
37f2582883be72 Tinghan Shen               2022-04-11  1995  			status = "disabled";
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01  1996  		};
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01  1997  
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01  1998  		gpu: gpu@13000000 {
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01  1999  			compatible = "mediatek,mt8195-mali", "mediatek,mt8192-mali",
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01  2000  				     "arm,mali-valhall-jm";
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01  2001  			reg = <0 0x13000000 0 0x4000>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01  2002  
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01  2003  			clocks = <&mfgcfg CLK_MFG_BG3D>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01  2004  			interrupts = <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH 0>,
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01  2005  				     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH 0>,
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01  2006  				     <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH 0>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01  2007  			interrupt-names = "job", "mmu", "gpu";
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01  2008  			operating-points-v2 = <&gpu_opp_table>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01  2009  			power-domains = <&spm MT8195_POWER_DOMAIN_MFG2>,
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01  2010  					<&spm MT8195_POWER_DOMAIN_MFG3>,
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01  2011  					<&spm MT8195_POWER_DOMAIN_MFG4>,
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01  2012  					<&spm MT8195_POWER_DOMAIN_MFG5>,
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01  2013  					<&spm MT8195_POWER_DOMAIN_MFG6>;
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01  2014  			power-domain-names = "core0", "core1", "core2", "core3", "core4";
9a512b4d7a7b26 AngeloGioacchino Del Regno 2023-03-01  2015  			status = "disabled";
37f2582883be72 Tinghan Shen               2022-04-11  2016  		};
37f2582883be72 Tinghan Shen               2022-04-11  2017  
37f2582883be72 Tinghan Shen               2022-04-11  2018  		mfgcfg: clock-controller@13fbf000 {
37f2582883be72 Tinghan Shen               2022-04-11  2019  			compatible = "mediatek,mt8195-mfgcfg";
37f2582883be72 Tinghan Shen               2022-04-11  2020  			reg = <0 0x13fbf000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  2021  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  2022  		};
37f2582883be72 Tinghan Shen               2022-04-11  2023  
981f808e641c62 Roy-CW.Yeh                 2023-02-06  2024  		vppsys0: syscon@14000000 {
981f808e641c62 Roy-CW.Yeh                 2023-02-06  2025  			compatible = "mediatek,mt8195-vppsys0", "syscon";
6aa5b46d1755a2 Tinghan Shen               2022-08-11  2026  			reg = <0 0x14000000 0 0x1000>;
6aa5b46d1755a2 Tinghan Shen               2022-08-11  2027  			#clock-cells = <1>;
96b0c1528ef41f Nícolas F. R. A. Prado     2024-02-29  2028  			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0 0x1000>;
6aa5b46d1755a2 Tinghan Shen               2022-08-11  2029  		};
6aa5b46d1755a2 Tinghan Shen               2022-08-11  2030  
5710462a116c70 Moudy Ho                   2023-10-30  2031  		dma-controller@14001000 {
5710462a116c70 Moudy Ho                   2023-10-30  2032  			compatible = "mediatek,mt8195-mdp3-rdma";
5710462a116c70 Moudy Ho                   2023-10-30  2033  			reg = <0 0x14001000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2034  			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x1000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2035  			mediatek,gce-events = <CMDQ_EVENT_VPP0_MDP_RDMA_SOF>,
5710462a116c70 Moudy Ho                   2023-10-30  2036  					      <CMDQ_EVENT_VPP0_MDP_RDMA_FRAME_DONE>;
587c945c933364 Nícolas F. R. A. Prado     2024-06-06  2037  			mediatek,scp = <&scp>;
5710462a116c70 Moudy Ho                   2023-10-30  2038  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
5710462a116c70 Moudy Ho                   2023-10-30  2039  			iommus = <&iommu_vpp M4U_PORT_L4_MDP_RDMA>;
5710462a116c70 Moudy Ho                   2023-10-30  2040  			clocks = <&vppsys0 CLK_VPP0_MDP_RDMA>;
5710462a116c70 Moudy Ho                   2023-10-30  2041  			mboxes = <&gce1 12 CMDQ_THR_PRIO_1>,
5710462a116c70 Moudy Ho                   2023-10-30  2042  				 <&gce1 13 CMDQ_THR_PRIO_1>,
5710462a116c70 Moudy Ho                   2023-10-30  2043  				 <&gce1 14 CMDQ_THR_PRIO_1>,
5710462a116c70 Moudy Ho                   2023-10-30  2044  				 <&gce1 21 CMDQ_THR_PRIO_1>,
5710462a116c70 Moudy Ho                   2023-10-30  2045  				 <&gce1 22 CMDQ_THR_PRIO_1>;
5710462a116c70 Moudy Ho                   2023-10-30  2046  			#dma-cells = <1>;
5710462a116c70 Moudy Ho                   2023-10-30  2047  		};
5710462a116c70 Moudy Ho                   2023-10-30  2048  
5710462a116c70 Moudy Ho                   2023-10-30  2049  		display@14002000 {
5710462a116c70 Moudy Ho                   2023-10-30  2050  			compatible = "mediatek,mt8195-mdp3-fg";
5710462a116c70 Moudy Ho                   2023-10-30  2051  			reg = <0 0x14002000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2052  			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x2000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2053  			clocks = <&vppsys0 CLK_VPP0_MDP_FG>;
5710462a116c70 Moudy Ho                   2023-10-30  2054  		};
5710462a116c70 Moudy Ho                   2023-10-30  2055  
5710462a116c70 Moudy Ho                   2023-10-30  2056  		display@14003000 {
5710462a116c70 Moudy Ho                   2023-10-30  2057  			compatible = "mediatek,mt8195-mdp3-stitch";
5710462a116c70 Moudy Ho                   2023-10-30  2058  			reg = <0 0x14003000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2059  			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x3000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2060  			clocks = <&vppsys0 CLK_VPP0_STITCH>;
5710462a116c70 Moudy Ho                   2023-10-30  2061  		};
5710462a116c70 Moudy Ho                   2023-10-30  2062  
5710462a116c70 Moudy Ho                   2023-10-30  2063  		display@14004000 {
5710462a116c70 Moudy Ho                   2023-10-30  2064  			compatible = "mediatek,mt8195-mdp3-hdr";
5710462a116c70 Moudy Ho                   2023-10-30  2065  			reg = <0 0x14004000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2066  			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x4000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2067  			clocks = <&vppsys0 CLK_VPP0_MDP_HDR>;
5710462a116c70 Moudy Ho                   2023-10-30  2068  		};
5710462a116c70 Moudy Ho                   2023-10-30  2069  
5710462a116c70 Moudy Ho                   2023-10-30  2070  		display@14005000 {
5710462a116c70 Moudy Ho                   2023-10-30  2071  			compatible = "mediatek,mt8195-mdp3-aal";
5710462a116c70 Moudy Ho                   2023-10-30  2072  			reg = <0 0x14005000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2073  			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH 0>;
5710462a116c70 Moudy Ho                   2023-10-30  2074  			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x5000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2075  			clocks = <&vppsys0 CLK_VPP0_MDP_AAL>;
5710462a116c70 Moudy Ho                   2023-10-30  2076  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
5710462a116c70 Moudy Ho                   2023-10-30  2077  		};
5710462a116c70 Moudy Ho                   2023-10-30  2078  
5710462a116c70 Moudy Ho                   2023-10-30  2079  		display@14006000 {
5710462a116c70 Moudy Ho                   2023-10-30  2080  			compatible = "mediatek,mt8195-mdp3-rsz", "mediatek,mt8183-mdp3-rsz";
5710462a116c70 Moudy Ho                   2023-10-30  2081  			reg = <0 0x14006000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2082  			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x6000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2083  			mediatek,gce-events = <CMDQ_EVENT_VPP0_MDP_RSZ_IN_RSZ_SOF>,
5710462a116c70 Moudy Ho                   2023-10-30  2084  					      <CMDQ_EVENT_VPP0_MDP_RSZ_FRAME_DONE>;
5710462a116c70 Moudy Ho                   2023-10-30  2085  			clocks = <&vppsys0 CLK_VPP0_MDP_RSZ>;
5710462a116c70 Moudy Ho                   2023-10-30  2086  		};
5710462a116c70 Moudy Ho                   2023-10-30  2087  
5710462a116c70 Moudy Ho                   2023-10-30  2088  		display@14007000 {
5710462a116c70 Moudy Ho                   2023-10-30  2089  			compatible = "mediatek,mt8195-mdp3-tdshp";
5710462a116c70 Moudy Ho                   2023-10-30  2090  			reg = <0 0x14007000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2091  			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x7000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2092  			clocks = <&vppsys0 CLK_VPP0_MDP_TDSHP>;
5710462a116c70 Moudy Ho                   2023-10-30  2093  		};
5710462a116c70 Moudy Ho                   2023-10-30  2094  
5710462a116c70 Moudy Ho                   2023-10-30  2095  		display@14008000 {
5710462a116c70 Moudy Ho                   2023-10-30  2096  			compatible = "mediatek,mt8195-mdp3-color";
5710462a116c70 Moudy Ho                   2023-10-30  2097  			reg = <0 0x14008000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2098  			interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH 0>;
5710462a116c70 Moudy Ho                   2023-10-30  2099  			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x8000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2100  			clocks = <&vppsys0 CLK_VPP0_MDP_COLOR>;
5710462a116c70 Moudy Ho                   2023-10-30  2101  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
5710462a116c70 Moudy Ho                   2023-10-30  2102  		};
5710462a116c70 Moudy Ho                   2023-10-30  2103  
5710462a116c70 Moudy Ho                   2023-10-30  2104  		display@14009000 {
5710462a116c70 Moudy Ho                   2023-10-30  2105  			compatible = "mediatek,mt8195-mdp3-ovl";
5710462a116c70 Moudy Ho                   2023-10-30  2106  			reg = <0 0x14009000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2107  			interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH 0>;
5710462a116c70 Moudy Ho                   2023-10-30  2108  			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x9000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2109  			clocks = <&vppsys0 CLK_VPP0_MDP_OVL>;
5710462a116c70 Moudy Ho                   2023-10-30  2110  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
5710462a116c70 Moudy Ho                   2023-10-30  2111  			iommus = <&iommu_vpp M4U_PORT_L4_MDP_OVL>;
5710462a116c70 Moudy Ho                   2023-10-30  2112  		};
5710462a116c70 Moudy Ho                   2023-10-30  2113  
5710462a116c70 Moudy Ho                   2023-10-30  2114  		display@1400a000 {
5710462a116c70 Moudy Ho                   2023-10-30  2115  			compatible = "mediatek,mt8195-mdp3-padding";
5710462a116c70 Moudy Ho                   2023-10-30  2116  			reg = <0 0x1400a000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2117  			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xa000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2118  			clocks = <&vppsys0 CLK_VPP0_PADDING>;
5710462a116c70 Moudy Ho                   2023-10-30  2119  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
5710462a116c70 Moudy Ho                   2023-10-30  2120  		};
5710462a116c70 Moudy Ho                   2023-10-30  2121  
5710462a116c70 Moudy Ho                   2023-10-30  2122  		display@1400b000 {
5710462a116c70 Moudy Ho                   2023-10-30  2123  			compatible = "mediatek,mt8195-mdp3-tcc";
5710462a116c70 Moudy Ho                   2023-10-30  2124  			reg = <0 0x1400b000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2125  			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xb000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2126  			clocks = <&vppsys0 CLK_VPP0_MDP_TCC>;
5710462a116c70 Moudy Ho                   2023-10-30  2127  		};
5710462a116c70 Moudy Ho                   2023-10-30  2128  
5710462a116c70 Moudy Ho                   2023-10-30  2129  		dma-controller@1400c000 {
5710462a116c70 Moudy Ho                   2023-10-30  2130  			compatible = "mediatek,mt8195-mdp3-wrot", "mediatek,mt8183-mdp3-wrot";
5710462a116c70 Moudy Ho                   2023-10-30  2131  			reg = <0 0x1400c000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2132  			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xc000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2133  			mediatek,gce-events = <CMDQ_EVENT_VPP0_MDP_WROT_SOF>,
5710462a116c70 Moudy Ho                   2023-10-30  2134  					      <CMDQ_EVENT_VPP0_MDP_WROT_VIDO_WDONE>;
5710462a116c70 Moudy Ho                   2023-10-30  2135  			clocks = <&vppsys0 CLK_VPP0_MDP_WROT>;
5710462a116c70 Moudy Ho                   2023-10-30  2136  			iommus = <&iommu_vpp M4U_PORT_L4_MDP_WROT>;
5710462a116c70 Moudy Ho                   2023-10-30  2137  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
5710462a116c70 Moudy Ho                   2023-10-30  2138  			#dma-cells = <1>;
5710462a116c70 Moudy Ho                   2023-10-30  2139  		};
5710462a116c70 Moudy Ho                   2023-10-30  2140  
018f1d4fa457af Moudy Ho                   2023-02-06  2141  		mutex@1400f000 {
018f1d4fa457af Moudy Ho                   2023-02-06  2142  			compatible = "mediatek,mt8195-vpp-mutex";
018f1d4fa457af Moudy Ho                   2023-02-06  2143  			reg = <0 0x1400f000 0 0x1000>;
018f1d4fa457af Moudy Ho                   2023-02-06  2144  			interrupts = <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH 0>;
018f1d4fa457af Moudy Ho                   2023-02-06  2145  			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xf000 0x1000>;
018f1d4fa457af Moudy Ho                   2023-02-06  2146  			clocks = <&vppsys0 CLK_VPP0_MUTEX>;
018f1d4fa457af Moudy Ho                   2023-02-06  2147  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
018f1d4fa457af Moudy Ho                   2023-02-06  2148  		};
018f1d4fa457af Moudy Ho                   2023-02-06  2149  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2150  		smi_sub_common_vpp0_vpp1_2x1: smi@14010000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2151  			compatible = "mediatek,mt8195-smi-sub-common";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2152  			reg = <0 0x14010000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2153  			clocks = <&vppsys0 CLK_VPP0_GALS_VPP1_WPE>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2154  			       <&vppsys0 CLK_VPP0_GALS_VPP1_WPE>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2155  			       <&vppsys0 CLK_VPP0_GALS_VPP1_WPE>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2156  			clock-names = "apb", "smi", "gals0";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2157  			mediatek,smi = <&smi_common_vpp>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2158  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2159  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2160  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2161  		smi_sub_common_vdec_vpp0_2x1: smi@14011000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2162  			compatible = "mediatek,mt8195-smi-sub-common";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2163  			reg = <0 0x14011000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2164  			clocks = <&vppsys0 CLK_VPP0_GALS_VDEC_VDEC_CORE1>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2165  				 <&vppsys0 CLK_VPP0_GALS_VDEC_VDEC_CORE1>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2166  				 <&vppsys0 CLK_VPP0_GALS_VDEC_VDEC_CORE1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2167  			clock-names = "apb", "smi", "gals0";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2168  			mediatek,smi = <&smi_common_vpp>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2169  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2170  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2171  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2172  		smi_common_vpp: smi@14012000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2173  			compatible = "mediatek,mt8195-smi-common-vpp";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2174  			reg = <0 0x14012000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2175  			clocks = <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2176  			       <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2177  			       <&vppsys0 CLK_VPP0_SMI_RSI>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2178  			       <&vppsys0 CLK_VPP0_SMI_RSI>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2179  			clock-names = "apb", "smi", "gals0", "gals1";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2180  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2181  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2182  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2183  		larb4: larb@14013000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2184  			compatible = "mediatek,mt8195-smi-larb";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2185  			reg = <0 0x14013000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2186  			mediatek,larb-id = <4>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2187  			mediatek,smi = <&smi_sub_common_vpp0_vpp1_2x1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2188  			clocks = <&vppsys0 CLK_VPP0_GALS_VPP1_WPE>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2189  			       <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2190  			clock-names = "apb", "smi";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2191  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2192  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2193  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2194  		iommu_vpp: iommu@14018000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2195  			compatible = "mediatek,mt8195-iommu-vpp";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2196  			reg = <0 0x14018000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2197  			mediatek,larbs = <&larb1 &larb3 &larb4 &larb6 &larb8
3b5838d1d82e38 Tinghan Shen               2022-08-11  2198  					  &larb12 &larb14 &larb16 &larb18
3b5838d1d82e38 Tinghan Shen               2022-08-11  2199  					  &larb20 &larb22 &larb23 &larb26
3b5838d1d82e38 Tinghan Shen               2022-08-11  2200  					  &larb27>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2201  			interrupts = <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH 0>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2202  			clocks = <&vppsys0 CLK_VPP0_SMI_IOMMU>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2203  			clock-names = "bclk";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2204  			#iommu-cells = <1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2205  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2206  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2207  
37f2582883be72 Tinghan Shen               2022-04-11  2208  		wpesys: clock-controller@14e00000 {
37f2582883be72 Tinghan Shen               2022-04-11  2209  			compatible = "mediatek,mt8195-wpesys";
37f2582883be72 Tinghan Shen               2022-04-11  2210  			reg = <0 0x14e00000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  2211  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  2212  		};
37f2582883be72 Tinghan Shen               2022-04-11  2213  
37f2582883be72 Tinghan Shen               2022-04-11  2214  		wpesys_vpp0: clock-controller@14e02000 {
37f2582883be72 Tinghan Shen               2022-04-11  2215  			compatible = "mediatek,mt8195-wpesys_vpp0";
37f2582883be72 Tinghan Shen               2022-04-11  2216  			reg = <0 0x14e02000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  2217  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  2218  		};
37f2582883be72 Tinghan Shen               2022-04-11  2219  
37f2582883be72 Tinghan Shen               2022-04-11  2220  		wpesys_vpp1: clock-controller@14e03000 {
37f2582883be72 Tinghan Shen               2022-04-11  2221  			compatible = "mediatek,mt8195-wpesys_vpp1";
37f2582883be72 Tinghan Shen               2022-04-11  2222  			reg = <0 0x14e03000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  2223  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  2224  		};
37f2582883be72 Tinghan Shen               2022-04-11  2225  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2226  		larb7: larb@14e04000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2227  			compatible = "mediatek,mt8195-smi-larb";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2228  			reg = <0 0x14e04000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2229  			mediatek,larb-id = <7>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2230  			mediatek,smi = <&smi_common_vdo>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2231  			clocks = <&wpesys CLK_WPE_SMI_LARB7>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2232  				 <&wpesys CLK_WPE_SMI_LARB7>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2233  			clock-names = "apb", "smi";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2234  			power-domains = <&spm MT8195_POWER_DOMAIN_WPESYS>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2235  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2236  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2237  		larb8: larb@14e05000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2238  			compatible = "mediatek,mt8195-smi-larb";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2239  			reg = <0 0x14e05000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2240  			mediatek,larb-id = <8>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2241  			mediatek,smi = <&smi_common_vpp>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2242  			clocks = <&wpesys CLK_WPE_SMI_LARB8>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2243  			       <&wpesys CLK_WPE_SMI_LARB8>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2244  			       <&vppsys0 CLK_VPP0_GALS_VPP1_WPE>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2245  			clock-names = "apb", "smi", "gals";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2246  			power-domains = <&spm MT8195_POWER_DOMAIN_WPESYS>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2247  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2248  
981f808e641c62 Roy-CW.Yeh                 2023-02-06  2249  		vppsys1: syscon@14f00000 {
981f808e641c62 Roy-CW.Yeh                 2023-02-06  2250  			compatible = "mediatek,mt8195-vppsys1", "syscon";
6aa5b46d1755a2 Tinghan Shen               2022-08-11  2251  			reg = <0 0x14f00000 0 0x1000>;
6aa5b46d1755a2 Tinghan Shen               2022-08-11  2252  			#clock-cells = <1>;
96b0c1528ef41f Nícolas F. R. A. Prado     2024-02-29  2253  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0 0x1000>;
6aa5b46d1755a2 Tinghan Shen               2022-08-11  2254  		};
6aa5b46d1755a2 Tinghan Shen               2022-08-11  2255  
018f1d4fa457af Moudy Ho                   2023-02-06  2256  		mutex@14f01000 {
018f1d4fa457af Moudy Ho                   2023-02-06  2257  			compatible = "mediatek,mt8195-vpp-mutex";
018f1d4fa457af Moudy Ho                   2023-02-06  2258  			reg = <0 0x14f01000 0 0x1000>;
018f1d4fa457af Moudy Ho                   2023-02-06  2259  			interrupts = <GIC_SPI 635 IRQ_TYPE_LEVEL_HIGH 0>;
018f1d4fa457af Moudy Ho                   2023-02-06  2260  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0x1000 0x1000>;
018f1d4fa457af Moudy Ho                   2023-02-06  2261  			clocks = <&vppsys1 CLK_VPP1_DISP_MUTEX>;
018f1d4fa457af Moudy Ho                   2023-02-06  2262  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
018f1d4fa457af Moudy Ho                   2023-02-06  2263  		};
018f1d4fa457af Moudy Ho                   2023-02-06  2264  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2265  		larb5: larb@14f02000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2266  			compatible = "mediatek,mt8195-smi-larb";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2267  			reg = <0 0x14f02000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2268  			mediatek,larb-id = <5>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2269  			mediatek,smi = <&smi_common_vdo>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2270  			clocks = <&vppsys1 CLK_VPP1_VPPSYS1_LARB>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2271  			       <&vppsys1 CLK_VPP1_VPPSYS1_GALS>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2272  			       <&vppsys0 CLK_VPP0_GALS_VPP1_LARB5>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2273  			clock-names = "apb", "smi", "gals";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2274  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2275  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2276  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2277  		larb6: larb@14f03000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2278  			compatible = "mediatek,mt8195-smi-larb";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2279  			reg = <0 0x14f03000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2280  			mediatek,larb-id = <6>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2281  			mediatek,smi = <&smi_sub_common_vpp0_vpp1_2x1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2282  			clocks = <&vppsys1 CLK_VPP1_VPPSYS1_LARB>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2283  			       <&vppsys1 CLK_VPP1_VPPSYS1_GALS>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2284  			       <&vppsys0 CLK_VPP0_GALS_VPP1_LARB6>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2285  			clock-names = "apb", "smi", "gals";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2286  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2287  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2288  
5710462a116c70 Moudy Ho                   2023-10-30  2289  		display@14f06000 {
5710462a116c70 Moudy Ho                   2023-10-30  2290  			compatible = "mediatek,mt8195-mdp3-split";
5710462a116c70 Moudy Ho                   2023-10-30  2291  			reg = <0 0x14f06000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2292  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0x6000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2293  			clocks = <&vppsys1 CLK_VPP1_VPP_SPLIT>,
5710462a116c70 Moudy Ho                   2023-10-30  2294  				 <&vppsys1 CLK_VPP1_HDMI_META>,
5710462a116c70 Moudy Ho                   2023-10-30  2295  				 <&vppsys1 CLK_VPP1_VPP_SPLIT_HDMI>;
5710462a116c70 Moudy Ho                   2023-10-30  2296  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
5710462a116c70 Moudy Ho                   2023-10-30  2297  		};
5710462a116c70 Moudy Ho                   2023-10-30  2298  
5710462a116c70 Moudy Ho                   2023-10-30  2299  		display@14f07000 {
5710462a116c70 Moudy Ho                   2023-10-30  2300  			compatible = "mediatek,mt8195-mdp3-tcc";
5710462a116c70 Moudy Ho                   2023-10-30  2301  			reg = <0 0x14f07000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2302  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0x7000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2303  			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_TCC>;
5710462a116c70 Moudy Ho                   2023-10-30  2304  		};
5710462a116c70 Moudy Ho                   2023-10-30  2305  
5710462a116c70 Moudy Ho                   2023-10-30  2306  		dma-controller@14f08000 {
5710462a116c70 Moudy Ho                   2023-10-30  2307  			compatible = "mediatek,mt8195-mdp3-rdma";
5710462a116c70 Moudy Ho                   2023-10-30  2308  			reg = <0 0x14f08000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2309  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0x8000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2310  			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP1_MDP_RDMA_SOF>,
5710462a116c70 Moudy Ho                   2023-10-30  2311  					      <CMDQ_EVENT_VPP1_SVPP1_MDP_RDMA_FRAME_DONE>;
5710462a116c70 Moudy Ho                   2023-10-30  2312  			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_RDMA>;
5710462a116c70 Moudy Ho                   2023-10-30  2313  			iommus = <&iommu_vdo M4U_PORT_L5_SVPP1_MDP_RDMA>;
5710462a116c70 Moudy Ho                   2023-10-30  2314  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
5710462a116c70 Moudy Ho                   2023-10-30  2315  			#dma-cells = <1>;
5710462a116c70 Moudy Ho                   2023-10-30  2316  		};
5710462a116c70 Moudy Ho                   2023-10-30  2317  
5710462a116c70 Moudy Ho                   2023-10-30  2318  		dma-controller@14f09000 {
5710462a116c70 Moudy Ho                   2023-10-30  2319  			compatible = "mediatek,mt8195-mdp3-rdma";
5710462a116c70 Moudy Ho                   2023-10-30  2320  			reg = <0 0x14f09000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2321  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0x9000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2322  			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP2_MDP_RDMA_SOF>,
5710462a116c70 Moudy Ho                   2023-10-30  2323  					      <CMDQ_EVENT_VPP1_SVPP2_MDP_RDMA_FRAME_DONE>;
5710462a116c70 Moudy Ho                   2023-10-30  2324  			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_RDMA>;
5710462a116c70 Moudy Ho                   2023-10-30  2325  			iommus = <&iommu_vdo M4U_PORT_L5_SVPP2_MDP_RDMA>;
5710462a116c70 Moudy Ho                   2023-10-30  2326  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
5710462a116c70 Moudy Ho                   2023-10-30  2327  			#dma-cells = <1>;
5710462a116c70 Moudy Ho                   2023-10-30  2328  		};
5710462a116c70 Moudy Ho                   2023-10-30  2329  
5710462a116c70 Moudy Ho                   2023-10-30  2330  		dma-controller@14f0a000 {
5710462a116c70 Moudy Ho                   2023-10-30  2331  			compatible = "mediatek,mt8195-mdp3-rdma";
5710462a116c70 Moudy Ho                   2023-10-30  2332  			reg = <0 0x14f0a000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2333  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xa000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2334  			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP3_MDP_RDMA_SOF>,
5710462a116c70 Moudy Ho                   2023-10-30  2335  					      <CMDQ_EVENT_VPP1_SVPP3_MDP_RDMA_FRAME_DONE>;
5710462a116c70 Moudy Ho                   2023-10-30  2336  			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_RDMA>;
5710462a116c70 Moudy Ho                   2023-10-30  2337  			iommus = <&iommu_vpp M4U_PORT_L6_SVPP3_MDP_RDMA>;
5710462a116c70 Moudy Ho                   2023-10-30  2338  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
5710462a116c70 Moudy Ho                   2023-10-30  2339  			#dma-cells = <1>;
5710462a116c70 Moudy Ho                   2023-10-30  2340  		};
5710462a116c70 Moudy Ho                   2023-10-30  2341  
5710462a116c70 Moudy Ho                   2023-10-30  2342  		display@14f0b000 {
5710462a116c70 Moudy Ho                   2023-10-30  2343  			compatible = "mediatek,mt8195-mdp3-fg";
5710462a116c70 Moudy Ho                   2023-10-30  2344  			reg = <0 0x14f0b000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2345  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xb000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2346  			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_FG>;
5710462a116c70 Moudy Ho                   2023-10-30  2347  		};
5710462a116c70 Moudy Ho                   2023-10-30  2348  
5710462a116c70 Moudy Ho                   2023-10-30  2349  		display@14f0c000 {
5710462a116c70 Moudy Ho                   2023-10-30  2350  			compatible = "mediatek,mt8195-mdp3-fg";
5710462a116c70 Moudy Ho                   2023-10-30  2351  			reg = <0 0x14f0c000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2352  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xc000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2353  			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_FG>;
5710462a116c70 Moudy Ho                   2023-10-30  2354  		};
5710462a116c70 Moudy Ho                   2023-10-30  2355  
5710462a116c70 Moudy Ho                   2023-10-30  2356  		display@14f0d000 {
5710462a116c70 Moudy Ho                   2023-10-30  2357  			compatible = "mediatek,mt8195-mdp3-fg";
5710462a116c70 Moudy Ho                   2023-10-30  2358  			reg = <0 0x14f0d000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2359  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xd000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2360  			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_FG>;
5710462a116c70 Moudy Ho                   2023-10-30  2361  		};
5710462a116c70 Moudy Ho                   2023-10-30  2362  
5710462a116c70 Moudy Ho                   2023-10-30  2363  		display@14f0e000 {
5710462a116c70 Moudy Ho                   2023-10-30  2364  			compatible = "mediatek,mt8195-mdp3-hdr";
5710462a116c70 Moudy Ho                   2023-10-30  2365  			reg = <0 0x14f0e000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2366  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xe000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2367  			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_HDR>;
5710462a116c70 Moudy Ho                   2023-10-30  2368  		};
5710462a116c70 Moudy Ho                   2023-10-30  2369  
5710462a116c70 Moudy Ho                   2023-10-30  2370  		display@14f0f000 {
5710462a116c70 Moudy Ho                   2023-10-30  2371  			compatible = "mediatek,mt8195-mdp3-hdr";
5710462a116c70 Moudy Ho                   2023-10-30  2372  			reg = <0 0x14f0f000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2373  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xf000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2374  			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_HDR>;
5710462a116c70 Moudy Ho                   2023-10-30  2375  		};
5710462a116c70 Moudy Ho                   2023-10-30  2376  
5710462a116c70 Moudy Ho                   2023-10-30  2377  		display@14f10000 {
5710462a116c70 Moudy Ho                   2023-10-30  2378  			compatible = "mediatek,mt8195-mdp3-hdr";
5710462a116c70 Moudy Ho                   2023-10-30  2379  			reg = <0 0x14f10000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2380  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2381  			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_HDR>;
5710462a116c70 Moudy Ho                   2023-10-30  2382  		};
5710462a116c70 Moudy Ho                   2023-10-30  2383  
5710462a116c70 Moudy Ho                   2023-10-30  2384  		display@14f11000 {
5710462a116c70 Moudy Ho                   2023-10-30  2385  			compatible = "mediatek,mt8195-mdp3-aal";
5710462a116c70 Moudy Ho                   2023-10-30  2386  			reg = <0 0x14f11000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2387  			interrupts = <GIC_SPI 617 IRQ_TYPE_LEVEL_HIGH 0>;
5710462a116c70 Moudy Ho                   2023-10-30  2388  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x1000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2389  			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_AAL>;
5710462a116c70 Moudy Ho                   2023-10-30  2390  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
5710462a116c70 Moudy Ho                   2023-10-30  2391  		};
5710462a116c70 Moudy Ho                   2023-10-30  2392  
5710462a116c70 Moudy Ho                   2023-10-30  2393  		display@14f12000 {
5710462a116c70 Moudy Ho                   2023-10-30  2394  			compatible = "mediatek,mt8195-mdp3-aal";
5710462a116c70 Moudy Ho                   2023-10-30  2395  			reg = <0 0x14f12000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2396  			interrupts = <GIC_SPI 618 IRQ_TYPE_LEVEL_HIGH 0>;
5710462a116c70 Moudy Ho                   2023-10-30  2397  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x2000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2398  			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_AAL>;
5710462a116c70 Moudy Ho                   2023-10-30  2399  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
5710462a116c70 Moudy Ho                   2023-10-30  2400  		};
5710462a116c70 Moudy Ho                   2023-10-30  2401  
5710462a116c70 Moudy Ho                   2023-10-30  2402  		display@14f13000 {
5710462a116c70 Moudy Ho                   2023-10-30  2403  			compatible = "mediatek,mt8195-mdp3-aal";
5710462a116c70 Moudy Ho                   2023-10-30  2404  			reg = <0 0x14f13000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2405  			interrupts = <GIC_SPI 619 IRQ_TYPE_LEVEL_HIGH 0>;
5710462a116c70 Moudy Ho                   2023-10-30  2406  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x3000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2407  			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_AAL>;
5710462a116c70 Moudy Ho                   2023-10-30  2408  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
5710462a116c70 Moudy Ho                   2023-10-30  2409  		};
5710462a116c70 Moudy Ho                   2023-10-30  2410  
5710462a116c70 Moudy Ho                   2023-10-30  2411  		display@14f14000 {
5710462a116c70 Moudy Ho                   2023-10-30  2412  			compatible = "mediatek,mt8195-mdp3-rsz", "mediatek,mt8183-mdp3-rsz";
5710462a116c70 Moudy Ho                   2023-10-30  2413  			reg = <0 0x14f14000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2414  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x4000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2415  			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP1_MDP_RSZ_SOF>,
5710462a116c70 Moudy Ho                   2023-10-30  2416  					      <CMDQ_EVENT_VPP1_SVPP1_MDP_RSZ_FRAME_DONE>;
5710462a116c70 Moudy Ho                   2023-10-30  2417  			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_RSZ>;
5710462a116c70 Moudy Ho                   2023-10-30  2418  		};
5710462a116c70 Moudy Ho                   2023-10-30  2419  
5710462a116c70 Moudy Ho                   2023-10-30  2420  		display@14f15000 {
5710462a116c70 Moudy Ho                   2023-10-30  2421  			compatible = "mediatek,mt8195-mdp3-rsz", "mediatek,mt8183-mdp3-rsz";
5710462a116c70 Moudy Ho                   2023-10-30  2422  			reg = <0 0x14f15000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2423  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x5000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2424  			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP2_MDP_RSZ_SOF>,
5710462a116c70 Moudy Ho                   2023-10-30  2425  					      <CMDQ_EVENT_VPP1_SVPP2_MDP_RSZ_FRAME_DONE>;
5710462a116c70 Moudy Ho                   2023-10-30  2426  			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_RSZ>;
5710462a116c70 Moudy Ho                   2023-10-30  2427  		};
5710462a116c70 Moudy Ho                   2023-10-30  2428  
5710462a116c70 Moudy Ho                   2023-10-30  2429  		display@14f16000 {
5710462a116c70 Moudy Ho                   2023-10-30  2430  			compatible = "mediatek,mt8195-mdp3-rsz", "mediatek,mt8183-mdp3-rsz";
5710462a116c70 Moudy Ho                   2023-10-30  2431  			reg = <0 0x14f16000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2432  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x6000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2433  			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP3_MDP_RSZ_SOF>,
5710462a116c70 Moudy Ho                   2023-10-30  2434  					      <CMDQ_EVENT_VPP1_SVPP3_MDP_RSZ_FRAME_DONE>;
5710462a116c70 Moudy Ho                   2023-10-30  2435  			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_RSZ>;
5710462a116c70 Moudy Ho                   2023-10-30  2436  		};
5710462a116c70 Moudy Ho                   2023-10-30  2437  
5710462a116c70 Moudy Ho                   2023-10-30  2438  		display@14f17000 {
5710462a116c70 Moudy Ho                   2023-10-30  2439  			compatible = "mediatek,mt8195-mdp3-tdshp";
5710462a116c70 Moudy Ho                   2023-10-30  2440  			reg = <0 0x14f17000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2441  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x7000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2442  			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_TDSHP>;
5710462a116c70 Moudy Ho                   2023-10-30  2443  		};
5710462a116c70 Moudy Ho                   2023-10-30  2444  
5710462a116c70 Moudy Ho                   2023-10-30  2445  		display@14f18000 {
5710462a116c70 Moudy Ho                   2023-10-30  2446  			compatible = "mediatek,mt8195-mdp3-tdshp";
5710462a116c70 Moudy Ho                   2023-10-30  2447  			reg = <0 0x14f18000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2448  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x8000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2449  			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_TDSHP>;
5710462a116c70 Moudy Ho                   2023-10-30  2450  		};
5710462a116c70 Moudy Ho                   2023-10-30  2451  
5710462a116c70 Moudy Ho                   2023-10-30  2452  		display@14f19000 {
5710462a116c70 Moudy Ho                   2023-10-30  2453  			compatible = "mediatek,mt8195-mdp3-tdshp";
5710462a116c70 Moudy Ho                   2023-10-30  2454  			reg = <0 0x14f19000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2455  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x9000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2456  			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_TDSHP>;
5710462a116c70 Moudy Ho                   2023-10-30  2457  		};
5710462a116c70 Moudy Ho                   2023-10-30  2458  
5710462a116c70 Moudy Ho                   2023-10-30  2459  		display@14f1a000 {
5710462a116c70 Moudy Ho                   2023-10-30  2460  			compatible = "mediatek,mt8195-mdp3-merge";
5710462a116c70 Moudy Ho                   2023-10-30  2461  			reg = <0 0x14f1a000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2462  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xa000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2463  			clocks = <&vppsys1 CLK_VPP1_SVPP2_VPP_MERGE>;
5710462a116c70 Moudy Ho                   2023-10-30  2464  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
5710462a116c70 Moudy Ho                   2023-10-30  2465  		};
5710462a116c70 Moudy Ho                   2023-10-30  2466  
5710462a116c70 Moudy Ho                   2023-10-30  2467  		display@14f1b000 {
5710462a116c70 Moudy Ho                   2023-10-30  2468  			compatible = "mediatek,mt8195-mdp3-merge";
5710462a116c70 Moudy Ho                   2023-10-30  2469  			reg = <0 0x14f1b000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2470  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xb000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2471  			clocks = <&vppsys1 CLK_VPP1_SVPP3_VPP_MERGE>;
5710462a116c70 Moudy Ho                   2023-10-30  2472  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
5710462a116c70 Moudy Ho                   2023-10-30  2473  		};
5710462a116c70 Moudy Ho                   2023-10-30  2474  
5710462a116c70 Moudy Ho                   2023-10-30  2475  		display@14f1c000 {
5710462a116c70 Moudy Ho                   2023-10-30  2476  			compatible = "mediatek,mt8195-mdp3-color";
5710462a116c70 Moudy Ho                   2023-10-30  2477  			reg = <0 0x14f1c000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2478  			interrupts = <GIC_SPI 628 IRQ_TYPE_LEVEL_HIGH 0>;
5710462a116c70 Moudy Ho                   2023-10-30  2479  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xc000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2480  			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_COLOR>;
5710462a116c70 Moudy Ho                   2023-10-30  2481  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
5710462a116c70 Moudy Ho                   2023-10-30  2482  		};
5710462a116c70 Moudy Ho                   2023-10-30  2483  
5710462a116c70 Moudy Ho                   2023-10-30  2484  		display@14f1d000 {
5710462a116c70 Moudy Ho                   2023-10-30  2485  			compatible = "mediatek,mt8195-mdp3-color";
5710462a116c70 Moudy Ho                   2023-10-30  2486  			reg = <0 0x14f1d000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2487  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xd000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2488  			interrupts = <GIC_SPI 629 IRQ_TYPE_LEVEL_HIGH 0>;
5710462a116c70 Moudy Ho                   2023-10-30  2489  			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_COLOR>;
5710462a116c70 Moudy Ho                   2023-10-30  2490  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
5710462a116c70 Moudy Ho                   2023-10-30  2491  		};
5710462a116c70 Moudy Ho                   2023-10-30  2492  
5710462a116c70 Moudy Ho                   2023-10-30  2493  		display@14f1e000 {
5710462a116c70 Moudy Ho                   2023-10-30  2494  			compatible = "mediatek,mt8195-mdp3-color";
5710462a116c70 Moudy Ho                   2023-10-30  2495  			reg = <0 0x14f1e000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2496  			interrupts = <GIC_SPI 630 IRQ_TYPE_LEVEL_HIGH 0>;
5710462a116c70 Moudy Ho                   2023-10-30  2497  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xe000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2498  			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_COLOR>;
5710462a116c70 Moudy Ho                   2023-10-30  2499  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
5710462a116c70 Moudy Ho                   2023-10-30  2500  		};
5710462a116c70 Moudy Ho                   2023-10-30  2501  
5710462a116c70 Moudy Ho                   2023-10-30  2502  		display@14f1f000 {
5710462a116c70 Moudy Ho                   2023-10-30  2503  			compatible = "mediatek,mt8195-mdp3-ovl";
5710462a116c70 Moudy Ho                   2023-10-30  2504  			reg = <0 0x14f1f000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2505  			interrupts = <GIC_SPI 631 IRQ_TYPE_LEVEL_HIGH 0>;
5710462a116c70 Moudy Ho                   2023-10-30  2506  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xf000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2507  			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_OVL>;
5710462a116c70 Moudy Ho                   2023-10-30  2508  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
5710462a116c70 Moudy Ho                   2023-10-30  2509  			iommus = <&iommu_vdo M4U_PORT_L5_SVPP1_MDP_OVL>;
5710462a116c70 Moudy Ho                   2023-10-30  2510  		};
5710462a116c70 Moudy Ho                   2023-10-30  2511  
5710462a116c70 Moudy Ho                   2023-10-30  2512  		display@14f20000 {
5710462a116c70 Moudy Ho                   2023-10-30  2513  			compatible = "mediatek,mt8195-mdp3-padding";
5710462a116c70 Moudy Ho                   2023-10-30  2514  			reg = <0 0x14f20000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2515  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2516  			clocks = <&vppsys1 CLK_VPP1_SVPP1_VPP_PAD>;
5710462a116c70 Moudy Ho                   2023-10-30  2517  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
5710462a116c70 Moudy Ho                   2023-10-30  2518  		};
5710462a116c70 Moudy Ho                   2023-10-30  2519  
5710462a116c70 Moudy Ho                   2023-10-30  2520  		display@14f21000 {
5710462a116c70 Moudy Ho                   2023-10-30  2521  			compatible = "mediatek,mt8195-mdp3-padding";
5710462a116c70 Moudy Ho                   2023-10-30  2522  			reg = <0 0x14f21000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2523  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x1000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2524  			clocks = <&vppsys1 CLK_VPP1_SVPP2_VPP_PAD>;
5710462a116c70 Moudy Ho                   2023-10-30  2525  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
5710462a116c70 Moudy Ho                   2023-10-30  2526  		};
5710462a116c70 Moudy Ho                   2023-10-30  2527  
5710462a116c70 Moudy Ho                   2023-10-30  2528  		display@14f22000 {
5710462a116c70 Moudy Ho                   2023-10-30  2529  			compatible = "mediatek,mt8195-mdp3-padding";
5710462a116c70 Moudy Ho                   2023-10-30  2530  			reg = <0 0x14f22000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2531  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x2000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2532  			clocks = <&vppsys1 CLK_VPP1_SVPP3_VPP_PAD>;
5710462a116c70 Moudy Ho                   2023-10-30  2533  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
5710462a116c70 Moudy Ho                   2023-10-30  2534  		};
5710462a116c70 Moudy Ho                   2023-10-30  2535  
5710462a116c70 Moudy Ho                   2023-10-30  2536  		dma-controller@14f23000 {
5710462a116c70 Moudy Ho                   2023-10-30  2537  			compatible = "mediatek,mt8195-mdp3-wrot", "mediatek,mt8183-mdp3-wrot";
5710462a116c70 Moudy Ho                   2023-10-30  2538  			reg = <0 0x14f23000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2539  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x3000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2540  			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP1_MDP_WROT_SOF>,
5710462a116c70 Moudy Ho                   2023-10-30  2541  					      <CMDQ_EVENT_VPP1_SVPP1_MDP_WROT_FRAME_DONE>;
5710462a116c70 Moudy Ho                   2023-10-30  2542  			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_WROT>;
5710462a116c70 Moudy Ho                   2023-10-30  2543  			iommus = <&iommu_vdo M4U_PORT_L5_SVPP1_MDP_WROT>;
5710462a116c70 Moudy Ho                   2023-10-30  2544  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
5710462a116c70 Moudy Ho                   2023-10-30  2545  			#dma-cells = <1>;
5710462a116c70 Moudy Ho                   2023-10-30  2546  		};
5710462a116c70 Moudy Ho                   2023-10-30  2547  
5710462a116c70 Moudy Ho                   2023-10-30  2548  		dma-controller@14f24000 {
5710462a116c70 Moudy Ho                   2023-10-30  2549  			compatible = "mediatek,mt8195-mdp3-wrot", "mediatek,mt8183-mdp3-wrot";
5710462a116c70 Moudy Ho                   2023-10-30  2550  			reg = <0 0x14f24000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2551  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x4000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2552  			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP2_MDP_WROT_SOF>,
5710462a116c70 Moudy Ho                   2023-10-30  2553  					<CMDQ_EVENT_VPP1_SVPP2_MDP_WROT_FRAME_DONE>;
5710462a116c70 Moudy Ho                   2023-10-30  2554  			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_WROT>;
5710462a116c70 Moudy Ho                   2023-10-30  2555  			iommus = <&iommu_vdo M4U_PORT_L5_SVPP2_MDP_WROT>;
5710462a116c70 Moudy Ho                   2023-10-30  2556  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
5710462a116c70 Moudy Ho                   2023-10-30  2557  			#dma-cells = <1>;
5710462a116c70 Moudy Ho                   2023-10-30  2558  		};
5710462a116c70 Moudy Ho                   2023-10-30  2559  
5710462a116c70 Moudy Ho                   2023-10-30  2560  		dma-controller@14f25000 {
5710462a116c70 Moudy Ho                   2023-10-30  2561  			compatible = "mediatek,mt8195-mdp3-wrot", "mediatek,mt8183-mdp3-wrot";
5710462a116c70 Moudy Ho                   2023-10-30  2562  			reg = <0 0x14f25000 0 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2563  			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x5000 0x1000>;
5710462a116c70 Moudy Ho                   2023-10-30  2564  			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP3_MDP_WROT_SOF>,
5710462a116c70 Moudy Ho                   2023-10-30  2565  					<CMDQ_EVENT_VPP1_SVPP3_MDP_WROT_FRAME_DONE>;
5710462a116c70 Moudy Ho                   2023-10-30  2566  			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_WROT>;
5710462a116c70 Moudy Ho                   2023-10-30  2567  			iommus = <&iommu_vpp M4U_PORT_L6_SVPP3_MDP_WROT>;
5710462a116c70 Moudy Ho                   2023-10-30  2568  			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
5710462a116c70 Moudy Ho                   2023-10-30  2569  			#dma-cells = <1>;
5710462a116c70 Moudy Ho                   2023-10-30  2570  		};
5710462a116c70 Moudy Ho                   2023-10-30  2571  
37f2582883be72 Tinghan Shen               2022-04-11  2572  		imgsys: clock-controller@15000000 {
37f2582883be72 Tinghan Shen               2022-04-11  2573  			compatible = "mediatek,mt8195-imgsys";
37f2582883be72 Tinghan Shen               2022-04-11  2574  			reg = <0 0x15000000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  2575  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  2576  		};
37f2582883be72 Tinghan Shen               2022-04-11  2577  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2578  		larb9: larb@15001000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2579  			compatible = "mediatek,mt8195-smi-larb";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2580  			reg = <0 0x15001000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2581  			mediatek,larb-id = <9>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2582  			mediatek,smi = <&smi_sub_common_img1_3x1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2583  			clocks = <&imgsys CLK_IMG_LARB9>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2584  				 <&imgsys CLK_IMG_LARB9>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2585  				 <&imgsys CLK_IMG_GALS>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2586  			clock-names = "apb", "smi", "gals";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2587  			power-domains = <&spm MT8195_POWER_DOMAIN_IMG>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2588  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2589  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2590  		smi_sub_common_img0_3x1: smi@15002000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2591  			compatible = "mediatek,mt8195-smi-sub-common";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2592  			reg = <0 0x15002000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2593  			clocks = <&imgsys CLK_IMG_IPE>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2594  				 <&imgsys CLK_IMG_IPE>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2595  				 <&vppsys0 CLK_VPP0_GALS_IMGSYS_CAMSYS>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2596  			clock-names = "apb", "smi", "gals0";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2597  			mediatek,smi = <&smi_common_vpp>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2598  			power-domains = <&spm MT8195_POWER_DOMAIN_IMG>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2599  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2600  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2601  		smi_sub_common_img1_3x1: smi@15003000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2602  			compatible = "mediatek,mt8195-smi-sub-common";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2603  			reg = <0 0x15003000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2604  			clocks = <&imgsys CLK_IMG_LARB9>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2605  				 <&imgsys CLK_IMG_LARB9>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2606  				 <&imgsys CLK_IMG_GALS>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2607  			clock-names = "apb", "smi", "gals0";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2608  			mediatek,smi = <&smi_common_vdo>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2609  			power-domains = <&spm MT8195_POWER_DOMAIN_IMG>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2610  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2611  
37f2582883be72 Tinghan Shen               2022-04-11  2612  		imgsys1_dip_top: clock-controller@15110000 {
37f2582883be72 Tinghan Shen               2022-04-11  2613  			compatible = "mediatek,mt8195-imgsys1_dip_top";
37f2582883be72 Tinghan Shen               2022-04-11  2614  			reg = <0 0x15110000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  2615  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  2616  		};
37f2582883be72 Tinghan Shen               2022-04-11  2617  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2618  		larb10: larb@15120000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2619  			compatible = "mediatek,mt8195-smi-larb";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2620  			reg = <0 0x15120000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2621  			mediatek,larb-id = <10>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2622  			mediatek,smi = <&smi_sub_common_img1_3x1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2623  			clocks = <&imgsys CLK_IMG_DIP0>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2624  			       <&imgsys1_dip_top CLK_IMG1_DIP_TOP_LARB10>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2625  			clock-names = "apb", "smi";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2626  			power-domains = <&spm MT8195_POWER_DOMAIN_DIP>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2627  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2628  
37f2582883be72 Tinghan Shen               2022-04-11  2629  		imgsys1_dip_nr: clock-controller@15130000 {
37f2582883be72 Tinghan Shen               2022-04-11  2630  			compatible = "mediatek,mt8195-imgsys1_dip_nr";
37f2582883be72 Tinghan Shen               2022-04-11  2631  			reg = <0 0x15130000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  2632  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  2633  		};
37f2582883be72 Tinghan Shen               2022-04-11  2634  
37f2582883be72 Tinghan Shen               2022-04-11  2635  		imgsys1_wpe: clock-controller@15220000 {
37f2582883be72 Tinghan Shen               2022-04-11  2636  			compatible = "mediatek,mt8195-imgsys1_wpe";
37f2582883be72 Tinghan Shen               2022-04-11  2637  			reg = <0 0x15220000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  2638  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  2639  		};
37f2582883be72 Tinghan Shen               2022-04-11  2640  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2641  		larb11: larb@15230000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2642  			compatible = "mediatek,mt8195-smi-larb";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2643  			reg = <0 0x15230000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2644  			mediatek,larb-id = <11>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2645  			mediatek,smi = <&smi_sub_common_img1_3x1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2646  			clocks = <&imgsys CLK_IMG_WPE0>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2647  			       <&imgsys1_wpe CLK_IMG1_WPE_LARB11>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2648  			clock-names = "apb", "smi";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2649  			power-domains = <&spm MT8195_POWER_DOMAIN_DIP>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2650  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2651  
37f2582883be72 Tinghan Shen               2022-04-11  2652  		ipesys: clock-controller@15330000 {
37f2582883be72 Tinghan Shen               2022-04-11  2653  			compatible = "mediatek,mt8195-ipesys";
37f2582883be72 Tinghan Shen               2022-04-11  2654  			reg = <0 0x15330000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  2655  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  2656  		};
37f2582883be72 Tinghan Shen               2022-04-11  2657  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2658  		larb12: larb@15340000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2659  			compatible = "mediatek,mt8195-smi-larb";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2660  			reg = <0 0x15340000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2661  			mediatek,larb-id = <12>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2662  			mediatek,smi = <&smi_sub_common_img0_3x1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2663  			clocks = <&ipesys CLK_IPE_SMI_LARB12>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2664  				 <&ipesys CLK_IPE_SMI_LARB12>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2665  			clock-names = "apb", "smi";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2666  			power-domains = <&spm MT8195_POWER_DOMAIN_IPE>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2667  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2668  
37f2582883be72 Tinghan Shen               2022-04-11  2669  		camsys: clock-controller@16000000 {
37f2582883be72 Tinghan Shen               2022-04-11  2670  			compatible = "mediatek,mt8195-camsys";
37f2582883be72 Tinghan Shen               2022-04-11  2671  			reg = <0 0x16000000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  2672  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  2673  		};
37f2582883be72 Tinghan Shen               2022-04-11  2674  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2675  		larb13: larb@16001000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2676  			compatible = "mediatek,mt8195-smi-larb";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2677  			reg = <0 0x16001000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2678  			mediatek,larb-id = <13>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2679  			mediatek,smi = <&smi_sub_common_cam_4x1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2680  			clocks = <&camsys CLK_CAM_LARB13>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2681  			       <&camsys CLK_CAM_LARB13>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2682  			       <&camsys CLK_CAM_CAM2MM0_GALS>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2683  			clock-names = "apb", "smi", "gals";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2684  			power-domains = <&spm MT8195_POWER_DOMAIN_CAM>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2685  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2686  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2687  		larb14: larb@16002000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2688  			compatible = "mediatek,mt8195-smi-larb";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2689  			reg = <0 0x16002000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2690  			mediatek,larb-id = <14>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2691  			mediatek,smi = <&smi_sub_common_cam_7x1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2692  			clocks = <&camsys CLK_CAM_LARB14>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2693  				 <&camsys CLK_CAM_LARB14>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2694  			clock-names = "apb", "smi";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2695  			power-domains = <&spm MT8195_POWER_DOMAIN_CAM>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2696  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2697  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2698  		smi_sub_common_cam_4x1: smi@16004000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2699  			compatible = "mediatek,mt8195-smi-sub-common";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2700  			reg = <0 0x16004000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2701  			clocks = <&camsys CLK_CAM_LARB13>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2702  				 <&camsys CLK_CAM_LARB13>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2703  				 <&camsys CLK_CAM_CAM2MM0_GALS>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2704  			clock-names = "apb", "smi", "gals0";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2705  			mediatek,smi = <&smi_common_vdo>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2706  			power-domains = <&spm MT8195_POWER_DOMAIN_CAM>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2707  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2708  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2709  		smi_sub_common_cam_7x1: smi@16005000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2710  			compatible = "mediatek,mt8195-smi-sub-common";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2711  			reg = <0 0x16005000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2712  			clocks = <&camsys CLK_CAM_LARB14>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2713  				 <&camsys CLK_CAM_CAM2MM1_GALS>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2714  				 <&vppsys0 CLK_VPP0_GALS_IMGSYS_CAMSYS>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2715  			clock-names = "apb", "smi", "gals0";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2716  			mediatek,smi = <&smi_common_vpp>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2717  			power-domains = <&spm MT8195_POWER_DOMAIN_CAM>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2718  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2719  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2720  		larb16: larb@16012000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2721  			compatible = "mediatek,mt8195-smi-larb";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2722  			reg = <0 0x16012000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2723  			mediatek,larb-id = <16>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2724  			mediatek,smi = <&smi_sub_common_cam_7x1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2725  			clocks = <&camsys_rawa CLK_CAM_RAWA_LARBX>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2726  				 <&camsys_rawa CLK_CAM_RAWA_LARBX>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2727  			clock-names = "apb", "smi";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2728  			power-domains = <&spm MT8195_POWER_DOMAIN_CAM_RAWA>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2729  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2730  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2731  		larb17: larb@16013000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2732  			compatible = "mediatek,mt8195-smi-larb";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2733  			reg = <0 0x16013000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2734  			mediatek,larb-id = <17>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2735  			mediatek,smi = <&smi_sub_common_cam_4x1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2736  			clocks = <&camsys_yuva CLK_CAM_YUVA_LARBX>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2737  				 <&camsys_yuva CLK_CAM_YUVA_LARBX>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2738  			clock-names = "apb", "smi";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2739  			power-domains = <&spm MT8195_POWER_DOMAIN_CAM_RAWA>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2740  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2741  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2742  		larb27: larb@16014000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2743  			compatible = "mediatek,mt8195-smi-larb";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2744  			reg = <0 0x16014000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2745  			mediatek,larb-id = <27>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2746  			mediatek,smi = <&smi_sub_common_cam_7x1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2747  			clocks = <&camsys_rawb CLK_CAM_RAWB_LARBX>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2748  				 <&camsys_rawb CLK_CAM_RAWB_LARBX>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2749  			clock-names = "apb", "smi";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2750  			power-domains = <&spm MT8195_POWER_DOMAIN_CAM_RAWB>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2751  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2752  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2753  		larb28: larb@16015000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2754  			compatible = "mediatek,mt8195-smi-larb";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2755  			reg = <0 0x16015000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2756  			mediatek,larb-id = <28>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2757  			mediatek,smi = <&smi_sub_common_cam_4x1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2758  			clocks = <&camsys_yuvb CLK_CAM_YUVB_LARBX>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2759  				 <&camsys_yuvb CLK_CAM_YUVB_LARBX>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2760  			clock-names = "apb", "smi";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2761  			power-domains = <&spm MT8195_POWER_DOMAIN_CAM_RAWB>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2762  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2763  
37f2582883be72 Tinghan Shen               2022-04-11  2764  		camsys_rawa: clock-controller@1604f000 {
37f2582883be72 Tinghan Shen               2022-04-11  2765  			compatible = "mediatek,mt8195-camsys_rawa";
37f2582883be72 Tinghan Shen               2022-04-11  2766  			reg = <0 0x1604f000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  2767  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  2768  		};
37f2582883be72 Tinghan Shen               2022-04-11  2769  
37f2582883be72 Tinghan Shen               2022-04-11  2770  		camsys_yuva: clock-controller@1606f000 {
37f2582883be72 Tinghan Shen               2022-04-11  2771  			compatible = "mediatek,mt8195-camsys_yuva";
37f2582883be72 Tinghan Shen               2022-04-11  2772  			reg = <0 0x1606f000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  2773  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  2774  		};
37f2582883be72 Tinghan Shen               2022-04-11  2775  
37f2582883be72 Tinghan Shen               2022-04-11  2776  		camsys_rawb: clock-controller@1608f000 {
37f2582883be72 Tinghan Shen               2022-04-11  2777  			compatible = "mediatek,mt8195-camsys_rawb";
37f2582883be72 Tinghan Shen               2022-04-11  2778  			reg = <0 0x1608f000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  2779  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  2780  		};
37f2582883be72 Tinghan Shen               2022-04-11  2781  
37f2582883be72 Tinghan Shen               2022-04-11  2782  		camsys_yuvb: clock-controller@160af000 {
37f2582883be72 Tinghan Shen               2022-04-11  2783  			compatible = "mediatek,mt8195-camsys_yuvb";
37f2582883be72 Tinghan Shen               2022-04-11  2784  			reg = <0 0x160af000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  2785  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  2786  		};
37f2582883be72 Tinghan Shen               2022-04-11  2787  
37f2582883be72 Tinghan Shen               2022-04-11  2788  		camsys_mraw: clock-controller@16140000 {
37f2582883be72 Tinghan Shen               2022-04-11  2789  			compatible = "mediatek,mt8195-camsys_mraw";
37f2582883be72 Tinghan Shen               2022-04-11  2790  			reg = <0 0x16140000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  2791  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  2792  		};
37f2582883be72 Tinghan Shen               2022-04-11  2793  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2794  		larb25: larb@16141000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2795  			compatible = "mediatek,mt8195-smi-larb";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2796  			reg = <0 0x16141000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2797  			mediatek,larb-id = <25>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2798  			mediatek,smi = <&smi_sub_common_cam_4x1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2799  			clocks = <&camsys CLK_CAM_LARB13>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2800  				 <&camsys_mraw CLK_CAM_MRAW_LARBX>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2801  				 <&camsys CLK_CAM_CAM2MM0_GALS>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2802  			clock-names = "apb", "smi", "gals";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2803  			power-domains = <&spm MT8195_POWER_DOMAIN_CAM_MRAW>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2804  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2805  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2806  		larb26: larb@16142000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2807  			compatible = "mediatek,mt8195-smi-larb";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2808  			reg = <0 0x16142000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2809  			mediatek,larb-id = <26>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2810  			mediatek,smi = <&smi_sub_common_cam_7x1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2811  			clocks = <&camsys_mraw CLK_CAM_MRAW_LARBX>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2812  				 <&camsys_mraw CLK_CAM_MRAW_LARBX>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2813  			clock-names = "apb", "smi";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2814  			power-domains = <&spm MT8195_POWER_DOMAIN_CAM_MRAW>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2815  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2816  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2817  
37f2582883be72 Tinghan Shen               2022-04-11  2818  		ccusys: clock-controller@17200000 {
37f2582883be72 Tinghan Shen               2022-04-11  2819  			compatible = "mediatek,mt8195-ccusys";
37f2582883be72 Tinghan Shen               2022-04-11  2820  			reg = <0 0x17200000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  2821  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  2822  		};
37f2582883be72 Tinghan Shen               2022-04-11  2823  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2824  		larb18: larb@17201000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2825  			compatible = "mediatek,mt8195-smi-larb";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2826  			reg = <0 0x17201000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2827  			mediatek,larb-id = <18>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2828  			mediatek,smi = <&smi_sub_common_cam_7x1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2829  			clocks = <&ccusys CLK_CCU_LARB18>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2830  				 <&ccusys CLK_CCU_LARB18>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2831  			clock-names = "apb", "smi";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2832  			power-domains = <&spm MT8195_POWER_DOMAIN_CAM>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2833  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2834  
64bceed383fbce Yunfei Dong                2023-03-03  2835  		video-codec@18000000 {
64bceed383fbce Yunfei Dong                2023-03-03  2836  			compatible = "mediatek,mt8195-vcodec-dec";
64bceed383fbce Yunfei Dong                2023-03-03  2837  			mediatek,scp = <&scp>;
64bceed383fbce Yunfei Dong                2023-03-03  2838  			iommus = <&iommu_vdo M4U_PORT_L21_VDEC_MC_EXT>;
64bceed383fbce Yunfei Dong                2023-03-03  2839  			#address-cells = <2>;
64bceed383fbce Yunfei Dong                2023-03-03  2840  			#size-cells = <2>;
64bceed383fbce Yunfei Dong                2023-03-03  2841  			reg = <0 0x18000000 0 0x1000>,
64bceed383fbce Yunfei Dong                2023-03-03  2842  			      <0 0x18004000 0 0x1000>;
64bceed383fbce Yunfei Dong                2023-03-03  2843  			ranges = <0 0 0 0x18000000 0 0x26000>;
64bceed383fbce Yunfei Dong                2023-03-03  2844  
64bceed383fbce Yunfei Dong                2023-03-03  2845  			video-codec@2000 {
64bceed383fbce Yunfei Dong                2023-03-03  2846  				compatible = "mediatek,mtk-vcodec-lat-soc";
64bceed383fbce Yunfei Dong                2023-03-03  2847  				reg = <0 0x2000 0 0x800>;
64bceed383fbce Yunfei Dong                2023-03-03  2848  				iommus = <&iommu_vpp M4U_PORT_L23_VDEC_UFO_ENC_EXT>,
64bceed383fbce Yunfei Dong                2023-03-03  2849  					 <&iommu_vpp M4U_PORT_L23_VDEC_RDMA_EXT>;
64bceed383fbce Yunfei Dong                2023-03-03  2850  				clocks = <&topckgen CLK_TOP_VDEC>,
64bceed383fbce Yunfei Dong                2023-03-03  2851  					 <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
64bceed383fbce Yunfei Dong                2023-03-03  2852  					 <&vdecsys_soc CLK_VDEC_SOC_LAT>,
64bceed383fbce Yunfei Dong                2023-03-03  2853  					 <&topckgen CLK_TOP_UNIVPLL_D4>;
64bceed383fbce Yunfei Dong                2023-03-03  2854  				clock-names = "sel", "vdec", "lat", "top";
64bceed383fbce Yunfei Dong                2023-03-03  2855  				assigned-clocks = <&topckgen CLK_TOP_VDEC>;
64bceed383fbce Yunfei Dong                2023-03-03  2856  				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4>;
64bceed383fbce Yunfei Dong                2023-03-03  2857  				power-domains = <&spm MT8195_POWER_DOMAIN_VDEC0>;
64bceed383fbce Yunfei Dong                2023-03-03  2858  			};
64bceed383fbce Yunfei Dong                2023-03-03  2859  
64bceed383fbce Yunfei Dong                2023-03-03  2860  			video-codec@10000 {
64bceed383fbce Yunfei Dong                2023-03-03  2861  				compatible = "mediatek,mtk-vcodec-lat";
64bceed383fbce Yunfei Dong                2023-03-03  2862  				reg = <0 0x10000 0 0x800>;
64bceed383fbce Yunfei Dong                2023-03-03  2863  				interrupts = <GIC_SPI 708 IRQ_TYPE_LEVEL_HIGH 0>;
64bceed383fbce Yunfei Dong                2023-03-03  2864  				iommus = <&iommu_vdo M4U_PORT_L24_VDEC_LAT0_VLD_EXT>,
64bceed383fbce Yunfei Dong                2023-03-03  2865  					 <&iommu_vdo M4U_PORT_L24_VDEC_LAT0_VLD2_EXT>,
64bceed383fbce Yunfei Dong                2023-03-03  2866  					 <&iommu_vdo M4U_PORT_L24_VDEC_LAT0_AVC_MC_EXT>,
64bceed383fbce Yunfei Dong                2023-03-03  2867  					 <&iommu_vdo M4U_PORT_L24_VDEC_LAT0_PRED_RD_EXT>,
64bceed383fbce Yunfei Dong                2023-03-03  2868  					 <&iommu_vdo M4U_PORT_L24_VDEC_LAT0_TILE_EXT>,
64bceed383fbce Yunfei Dong                2023-03-03  2869  					 <&iommu_vdo M4U_PORT_L24_VDEC_LAT0_WDMA_EXT>;
64bceed383fbce Yunfei Dong                2023-03-03  2870  				clocks = <&topckgen CLK_TOP_VDEC>,
64bceed383fbce Yunfei Dong                2023-03-03  2871  					 <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
64bceed383fbce Yunfei Dong                2023-03-03  2872  					 <&vdecsys_soc CLK_VDEC_SOC_LAT>,
64bceed383fbce Yunfei Dong                2023-03-03  2873  					 <&topckgen CLK_TOP_UNIVPLL_D4>;
64bceed383fbce Yunfei Dong                2023-03-03  2874  				clock-names = "sel", "vdec", "lat", "top";
64bceed383fbce Yunfei Dong                2023-03-03  2875  				assigned-clocks = <&topckgen CLK_TOP_VDEC>;
64bceed383fbce Yunfei Dong                2023-03-03  2876  				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4>;
64bceed383fbce Yunfei Dong                2023-03-03  2877  				power-domains = <&spm MT8195_POWER_DOMAIN_VDEC0>;
64bceed383fbce Yunfei Dong                2023-03-03  2878  			};
64bceed383fbce Yunfei Dong                2023-03-03  2879  
64bceed383fbce Yunfei Dong                2023-03-03  2880  			video-codec@25000 {
64bceed383fbce Yunfei Dong                2023-03-03  2881  				compatible = "mediatek,mtk-vcodec-core";
64bceed383fbce Yunfei Dong                2023-03-03  2882  				reg = <0 0x25000 0 0x1000>;		/* VDEC_CORE_MISC */
64bceed383fbce Yunfei Dong                2023-03-03  2883  				interrupts = <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH 0>;
64bceed383fbce Yunfei Dong                2023-03-03  2884  				iommus = <&iommu_vdo M4U_PORT_L21_VDEC_MC_EXT>,
64bceed383fbce Yunfei Dong                2023-03-03  2885  					 <&iommu_vdo M4U_PORT_L21_VDEC_UFO_EXT>,
64bceed383fbce Yunfei Dong                2023-03-03  2886  					 <&iommu_vdo M4U_PORT_L21_VDEC_PP_EXT>,
64bceed383fbce Yunfei Dong                2023-03-03  2887  					 <&iommu_vdo M4U_PORT_L21_VDEC_PRED_RD_EXT>,
64bceed383fbce Yunfei Dong                2023-03-03  2888  					 <&iommu_vdo M4U_PORT_L21_VDEC_PRED_WR_EXT>,
64bceed383fbce Yunfei Dong                2023-03-03  2889  					 <&iommu_vdo M4U_PORT_L21_VDEC_PPWRAP_EXT>,
64bceed383fbce Yunfei Dong                2023-03-03  2890  					 <&iommu_vdo M4U_PORT_L21_VDEC_TILE_EXT>,
64bceed383fbce Yunfei Dong                2023-03-03  2891  					 <&iommu_vdo M4U_PORT_L21_VDEC_VLD_EXT>,
64bceed383fbce Yunfei Dong                2023-03-03  2892  					 <&iommu_vdo M4U_PORT_L21_VDEC_VLD2_EXT>,
64bceed383fbce Yunfei Dong                2023-03-03  2893  					 <&iommu_vdo M4U_PORT_L21_VDEC_AVC_MV_EXT>;
64bceed383fbce Yunfei Dong                2023-03-03  2894  				clocks = <&topckgen CLK_TOP_VDEC>,
64bceed383fbce Yunfei Dong                2023-03-03  2895  					 <&vdecsys CLK_VDEC_VDEC>,
64bceed383fbce Yunfei Dong                2023-03-03  2896  					 <&vdecsys CLK_VDEC_LAT>,
64bceed383fbce Yunfei Dong                2023-03-03  2897  					 <&topckgen CLK_TOP_UNIVPLL_D4>;
64bceed383fbce Yunfei Dong                2023-03-03  2898  				clock-names = "sel", "vdec", "lat", "top";
64bceed383fbce Yunfei Dong                2023-03-03  2899  				assigned-clocks = <&topckgen CLK_TOP_VDEC>;
64bceed383fbce Yunfei Dong                2023-03-03  2900  				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4>;
64bceed383fbce Yunfei Dong                2023-03-03  2901  				power-domains = <&spm MT8195_POWER_DOMAIN_VDEC1>;
64bceed383fbce Yunfei Dong                2023-03-03  2902  			};
64bceed383fbce Yunfei Dong                2023-03-03  2903  		};
64bceed383fbce Yunfei Dong                2023-03-03  2904  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2905  		larb24: larb@1800d000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2906  			compatible = "mediatek,mt8195-smi-larb";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2907  			reg = <0 0x1800d000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2908  			mediatek,larb-id = <24>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2909  			mediatek,smi = <&smi_common_vdo>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2910  			clocks = <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2911  				 <&vdecsys_soc CLK_VDEC_SOC_LARB1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2912  			clock-names = "apb", "smi";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2913  			power-domains = <&spm MT8195_POWER_DOMAIN_VDEC0>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2914  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2915  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2916  		larb23: larb@1800e000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2917  			compatible = "mediatek,mt8195-smi-larb";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2918  			reg = <0 0x1800e000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2919  			mediatek,larb-id = <23>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2920  			mediatek,smi = <&smi_sub_common_vdec_vpp0_2x1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2921  			clocks = <&vppsys0 CLK_VPP0_GALS_VDEC_VDEC_CORE1>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2922  				 <&vdecsys_soc CLK_VDEC_SOC_LARB1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2923  			clock-names = "apb", "smi";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2924  			power-domains = <&spm MT8195_POWER_DOMAIN_VDEC0>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2925  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2926  
37f2582883be72 Tinghan Shen               2022-04-11  2927  		vdecsys_soc: clock-controller@1800f000 {
37f2582883be72 Tinghan Shen               2022-04-11  2928  			compatible = "mediatek,mt8195-vdecsys_soc";
37f2582883be72 Tinghan Shen               2022-04-11  2929  			reg = <0 0x1800f000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  2930  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  2931  		};
37f2582883be72 Tinghan Shen               2022-04-11  2932  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2933  		larb21: larb@1802e000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2934  			compatible = "mediatek,mt8195-smi-larb";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2935  			reg = <0 0x1802e000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2936  			mediatek,larb-id = <21>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2937  			mediatek,smi = <&smi_common_vdo>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2938  			clocks = <&vdecsys CLK_VDEC_LARB1>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2939  				 <&vdecsys CLK_VDEC_LARB1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2940  			clock-names = "apb", "smi";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2941  			power-domains = <&spm MT8195_POWER_DOMAIN_VDEC1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2942  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2943  
37f2582883be72 Tinghan Shen               2022-04-11  2944  		vdecsys: clock-controller@1802f000 {
37f2582883be72 Tinghan Shen               2022-04-11  2945  			compatible = "mediatek,mt8195-vdecsys";
37f2582883be72 Tinghan Shen               2022-04-11  2946  			reg = <0 0x1802f000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  2947  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  2948  		};
37f2582883be72 Tinghan Shen               2022-04-11  2949  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2950  		larb22: larb@1803e000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2951  			compatible = "mediatek,mt8195-smi-larb";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2952  			reg = <0 0x1803e000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2953  			mediatek,larb-id = <22>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2954  			mediatek,smi = <&smi_sub_common_vdec_vpp0_2x1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2955  			clocks = <&vppsys0 CLK_VPP0_GALS_VDEC_VDEC_CORE1>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2956  				 <&vdecsys_core1 CLK_VDEC_CORE1_LARB1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2957  			clock-names = "apb", "smi";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2958  			power-domains = <&spm MT8195_POWER_DOMAIN_VDEC2>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2959  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2960  
37f2582883be72 Tinghan Shen               2022-04-11  2961  		vdecsys_core1: clock-controller@1803f000 {
37f2582883be72 Tinghan Shen               2022-04-11  2962  			compatible = "mediatek,mt8195-vdecsys_core1";
37f2582883be72 Tinghan Shen               2022-04-11  2963  			reg = <0 0x1803f000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  2964  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  2965  		};
37f2582883be72 Tinghan Shen               2022-04-11  2966  
37f2582883be72 Tinghan Shen               2022-04-11  2967  		apusys_pll: clock-controller@190f3000 {
37f2582883be72 Tinghan Shen               2022-04-11  2968  			compatible = "mediatek,mt8195-apusys_pll";
37f2582883be72 Tinghan Shen               2022-04-11  2969  			reg = <0 0x190f3000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  2970  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  2971  		};
37f2582883be72 Tinghan Shen               2022-04-11  2972  
37f2582883be72 Tinghan Shen               2022-04-11  2973  		vencsys: clock-controller@1a000000 {
37f2582883be72 Tinghan Shen               2022-04-11  2974  			compatible = "mediatek,mt8195-vencsys";
37f2582883be72 Tinghan Shen               2022-04-11  2975  			reg = <0 0x1a000000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  2976  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  2977  		};
37f2582883be72 Tinghan Shen               2022-04-11  2978  
3b5838d1d82e38 Tinghan Shen               2022-08-11  2979  		larb19: larb@1a010000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  2980  			compatible = "mediatek,mt8195-smi-larb";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2981  			reg = <0 0x1a010000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2982  			mediatek,larb-id = <19>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2983  			mediatek,smi = <&smi_common_vdo>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2984  			clocks = <&vencsys CLK_VENC_VENC>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  2985  				 <&vencsys CLK_VENC_GALS>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2986  			clock-names = "apb", "smi";
3b5838d1d82e38 Tinghan Shen               2022-08-11  2987  			power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  2988  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  2989  
ee3f54cf6ea8f7 Tinghan Shen               2022-11-03  2990  		venc: video-codec@1a020000 {
ee3f54cf6ea8f7 Tinghan Shen               2022-11-03  2991  			compatible = "mediatek,mt8195-vcodec-enc";
ee3f54cf6ea8f7 Tinghan Shen               2022-11-03  2992  			reg = <0 0x1a020000 0 0x10000>;
ee3f54cf6ea8f7 Tinghan Shen               2022-11-03  2993  			iommus = <&iommu_vdo M4U_PORT_L19_VENC_RCPU>,
ee3f54cf6ea8f7 Tinghan Shen               2022-11-03  2994  				 <&iommu_vdo M4U_PORT_L19_VENC_REC>,
ee3f54cf6ea8f7 Tinghan Shen               2022-11-03  2995  				 <&iommu_vdo M4U_PORT_L19_VENC_BSDMA>,
ee3f54cf6ea8f7 Tinghan Shen               2022-11-03  2996  				 <&iommu_vdo M4U_PORT_L19_VENC_SV_COMV>,
ee3f54cf6ea8f7 Tinghan Shen               2022-11-03  2997  				 <&iommu_vdo M4U_PORT_L19_VENC_RD_COMV>,
ee3f54cf6ea8f7 Tinghan Shen               2022-11-03  2998  				 <&iommu_vdo M4U_PORT_L19_VENC_CUR_LUMA>,
ee3f54cf6ea8f7 Tinghan Shen               2022-11-03  2999  				 <&iommu_vdo M4U_PORT_L19_VENC_CUR_CHROMA>,
ee3f54cf6ea8f7 Tinghan Shen               2022-11-03  3000  				 <&iommu_vdo M4U_PORT_L19_VENC_REF_LUMA>,
ee3f54cf6ea8f7 Tinghan Shen               2022-11-03  3001  				 <&iommu_vdo M4U_PORT_L19_VENC_REF_CHROMA>;
ee3f54cf6ea8f7 Tinghan Shen               2022-11-03  3002  			interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
ee3f54cf6ea8f7 Tinghan Shen               2022-11-03  3003  			mediatek,scp = <&scp>;
ee3f54cf6ea8f7 Tinghan Shen               2022-11-03  3004  			clocks = <&vencsys CLK_VENC_VENC>;
ee3f54cf6ea8f7 Tinghan Shen               2022-11-03  3005  			clock-names = "venc_sel";
ee3f54cf6ea8f7 Tinghan Shen               2022-11-03  3006  			assigned-clocks = <&topckgen CLK_TOP_VENC>;
ee3f54cf6ea8f7 Tinghan Shen               2022-11-03  3007  			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4>;
ee3f54cf6ea8f7 Tinghan Shen               2022-11-03  3008  			power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
ee3f54cf6ea8f7 Tinghan Shen               2022-11-03  3009  			#address-cells = <2>;
ee3f54cf6ea8f7 Tinghan Shen               2022-11-03  3010  			#size-cells = <2>;
ee3f54cf6ea8f7 Tinghan Shen               2022-11-03  3011  		};
ee3f54cf6ea8f7 Tinghan Shen               2022-11-03  3012  
936f9741a5f85a kyrie wu                   2023-01-12  3013  		jpgdec-master {
936f9741a5f85a kyrie wu                   2023-01-12  3014  			compatible = "mediatek,mt8195-jpgdec";
936f9741a5f85a kyrie wu                   2023-01-12  3015  			power-domains = <&spm MT8195_POWER_DOMAIN_VDEC1>;
936f9741a5f85a kyrie wu                   2023-01-12  3016  			iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
936f9741a5f85a kyrie wu                   2023-01-12  3017  				 <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
936f9741a5f85a kyrie wu                   2023-01-12  3018  				 <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
936f9741a5f85a kyrie wu                   2023-01-12  3019  				 <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA1>,
936f9741a5f85a kyrie wu                   2023-01-12  3020  				 <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET1>,
936f9741a5f85a kyrie wu                   2023-01-12  3021  				 <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
936f9741a5f85a kyrie wu                   2023-01-12  3022  			#address-cells = <2>;
936f9741a5f85a kyrie wu                   2023-01-12  3023  			#size-cells = <2>;
936f9741a5f85a kyrie wu                   2023-01-12  3024  			ranges;
936f9741a5f85a kyrie wu                   2023-01-12  3025  
936f9741a5f85a kyrie wu                   2023-01-12  3026  			jpgdec@1a040000 {
936f9741a5f85a kyrie wu                   2023-01-12  3027  				compatible = "mediatek,mt8195-jpgdec-hw";
936f9741a5f85a kyrie wu                   2023-01-12  3028  				reg = <0 0x1a040000 0 0x10000>;/* JPGDEC_C0 */
936f9741a5f85a kyrie wu                   2023-01-12  3029  				iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
936f9741a5f85a kyrie wu                   2023-01-12  3030  					 <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
936f9741a5f85a kyrie wu                   2023-01-12  3031  					 <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
936f9741a5f85a kyrie wu                   2023-01-12  3032  					 <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA1>,
936f9741a5f85a kyrie wu                   2023-01-12  3033  					 <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET1>,
936f9741a5f85a kyrie wu                   2023-01-12  3034  					 <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
936f9741a5f85a kyrie wu                   2023-01-12  3035  				interrupts = <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH 0>;
936f9741a5f85a kyrie wu                   2023-01-12  3036  				clocks = <&vencsys CLK_VENC_JPGDEC>;
936f9741a5f85a kyrie wu                   2023-01-12  3037  				clock-names = "jpgdec";
936f9741a5f85a kyrie wu                   2023-01-12  3038  				power-domains = <&spm MT8195_POWER_DOMAIN_VDEC0>;
936f9741a5f85a kyrie wu                   2023-01-12  3039  			};
936f9741a5f85a kyrie wu                   2023-01-12  3040  
936f9741a5f85a kyrie wu                   2023-01-12  3041  			jpgdec@1a050000 {
936f9741a5f85a kyrie wu                   2023-01-12  3042  				compatible = "mediatek,mt8195-jpgdec-hw";
936f9741a5f85a kyrie wu                   2023-01-12  3043  				reg = <0 0x1a050000 0 0x10000>;/* JPGDEC_C1 */
936f9741a5f85a kyrie wu                   2023-01-12  3044  				iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
936f9741a5f85a kyrie wu                   2023-01-12  3045  					 <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
936f9741a5f85a kyrie wu                   2023-01-12  3046  					 <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
936f9741a5f85a kyrie wu                   2023-01-12  3047  					 <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA1>,
936f9741a5f85a kyrie wu                   2023-01-12  3048  					 <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET1>,
936f9741a5f85a kyrie wu                   2023-01-12  3049  					 <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
936f9741a5f85a kyrie wu                   2023-01-12  3050  				interrupts = <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH 0>;
936f9741a5f85a kyrie wu                   2023-01-12  3051  				clocks = <&vencsys CLK_VENC_JPGDEC_C1>;
936f9741a5f85a kyrie wu                   2023-01-12  3052  				clock-names = "jpgdec";
936f9741a5f85a kyrie wu                   2023-01-12  3053  				power-domains = <&spm MT8195_POWER_DOMAIN_VDEC1>;
936f9741a5f85a kyrie wu                   2023-01-12  3054  			};
936f9741a5f85a kyrie wu                   2023-01-12  3055  
936f9741a5f85a kyrie wu                   2023-01-12  3056  			jpgdec@1b040000 {
936f9741a5f85a kyrie wu                   2023-01-12  3057  				compatible = "mediatek,mt8195-jpgdec-hw";
936f9741a5f85a kyrie wu                   2023-01-12  3058  				reg = <0 0x1b040000 0 0x10000>;/* JPGDEC_C2 */
936f9741a5f85a kyrie wu                   2023-01-12  3059  				iommus = <&iommu_vpp M4U_PORT_L20_JPGDEC_WDMA0>,
936f9741a5f85a kyrie wu                   2023-01-12  3060  					 <&iommu_vpp M4U_PORT_L20_JPGDEC_BSDMA0>,
936f9741a5f85a kyrie wu                   2023-01-12  3061  					 <&iommu_vpp M4U_PORT_L20_JPGDEC_WDMA1>,
936f9741a5f85a kyrie wu                   2023-01-12  3062  					 <&iommu_vpp M4U_PORT_L20_JPGDEC_BSDMA1>,
936f9741a5f85a kyrie wu                   2023-01-12  3063  					 <&iommu_vpp M4U_PORT_L20_JPGDEC_BUFF_OFFSET1>,
936f9741a5f85a kyrie wu                   2023-01-12  3064  					 <&iommu_vpp M4U_PORT_L20_JPGDEC_BUFF_OFFSET0>;
936f9741a5f85a kyrie wu                   2023-01-12  3065  				interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH 0>;
936f9741a5f85a kyrie wu                   2023-01-12  3066  				clocks = <&vencsys_core1 CLK_VENC_CORE1_JPGDEC>;
936f9741a5f85a kyrie wu                   2023-01-12  3067  				clock-names = "jpgdec";
936f9741a5f85a kyrie wu                   2023-01-12  3068  				power-domains = <&spm MT8195_POWER_DOMAIN_VDEC2>;
936f9741a5f85a kyrie wu                   2023-01-12  3069  			};
936f9741a5f85a kyrie wu                   2023-01-12  3070  		};
936f9741a5f85a kyrie wu                   2023-01-12  3071  
37f2582883be72 Tinghan Shen               2022-04-11  3072  		vencsys_core1: clock-controller@1b000000 {
37f2582883be72 Tinghan Shen               2022-04-11  3073  			compatible = "mediatek,mt8195-vencsys_core1";
37f2582883be72 Tinghan Shen               2022-04-11  3074  			reg = <0 0x1b000000 0 0x1000>;
37f2582883be72 Tinghan Shen               2022-04-11  3075  			#clock-cells = <1>;
37f2582883be72 Tinghan Shen               2022-04-11  3076  		};
6aa5b46d1755a2 Tinghan Shen               2022-08-11  3077  
6aa5b46d1755a2 Tinghan Shen               2022-08-11  3078  		vdosys0: syscon@1c01a000 {
97801cfcf95652 Chen-Yu Tsai               2023-02-02  3079  			compatible = "mediatek,mt8195-vdosys0", "mediatek,mt8195-mmsys", "syscon";
6aa5b46d1755a2 Tinghan Shen               2022-08-11  3080  			reg = <0 0x1c01a000 0 0x1000>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3081  			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>;
6aa5b46d1755a2 Tinghan Shen               2022-08-11  3082  			#clock-cells = <1>;
96b0c1528ef41f Nícolas F. R. A. Prado     2024-02-29  3083  			mediatek,gce-client-reg = <&gce0 SUBSYS_1c01XXXX 0xa000 0x1000>;
6aa5b46d1755a2 Tinghan Shen               2022-08-11  3084  		};
6aa5b46d1755a2 Tinghan Shen               2022-08-11  3085  
a32a371f907d66 kyrie wu                   2023-01-12  3086  
a32a371f907d66 kyrie wu                   2023-01-12  3087  		jpgenc-master {
a32a371f907d66 kyrie wu                   2023-01-12  3088  			compatible = "mediatek,mt8195-jpgenc";
a32a371f907d66 kyrie wu                   2023-01-12  3089  			power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
a32a371f907d66 kyrie wu                   2023-01-12  3090  			iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
a32a371f907d66 kyrie wu                   2023-01-12  3091  					<&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
a32a371f907d66 kyrie wu                   2023-01-12  3092  					<&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,
a32a371f907d66 kyrie wu                   2023-01-12  3093  					<&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
a32a371f907d66 kyrie wu                   2023-01-12  3094  			#address-cells = <2>;
a32a371f907d66 kyrie wu                   2023-01-12  3095  			#size-cells = <2>;
a32a371f907d66 kyrie wu                   2023-01-12  3096  			ranges;
a32a371f907d66 kyrie wu                   2023-01-12  3097  
a32a371f907d66 kyrie wu                   2023-01-12  3098  			jpgenc@1a030000 {
a32a371f907d66 kyrie wu                   2023-01-12  3099  				compatible = "mediatek,mt8195-jpgenc-hw";
a32a371f907d66 kyrie wu                   2023-01-12  3100  				reg = <0 0x1a030000 0 0x10000>;
a32a371f907d66 kyrie wu                   2023-01-12  3101  				iommus = <&iommu_vdo M4U_PORT_L19_JPGENC_Y_RDMA>,
a32a371f907d66 kyrie wu                   2023-01-12  3102  						<&iommu_vdo M4U_PORT_L19_JPGENC_C_RDMA>,
a32a371f907d66 kyrie wu                   2023-01-12  3103  						<&iommu_vdo M4U_PORT_L19_JPGENC_Q_TABLE>,
a32a371f907d66 kyrie wu                   2023-01-12  3104  						<&iommu_vdo M4U_PORT_L19_JPGENC_BSDMA>;
a32a371f907d66 kyrie wu                   2023-01-12  3105  				interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH 0>;
a32a371f907d66 kyrie wu                   2023-01-12  3106  				clocks = <&vencsys CLK_VENC_JPGENC>;
a32a371f907d66 kyrie wu                   2023-01-12  3107  				clock-names = "jpgenc";
a32a371f907d66 kyrie wu                   2023-01-12  3108  				power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
a32a371f907d66 kyrie wu                   2023-01-12  3109  			};
a32a371f907d66 kyrie wu                   2023-01-12  3110  
a32a371f907d66 kyrie wu                   2023-01-12  3111  			jpgenc@1b030000 {
a32a371f907d66 kyrie wu                   2023-01-12  3112  				compatible = "mediatek,mt8195-jpgenc-hw";
a32a371f907d66 kyrie wu                   2023-01-12  3113  				reg = <0 0x1b030000 0 0x10000>;
a32a371f907d66 kyrie wu                   2023-01-12  3114  				iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
a32a371f907d66 kyrie wu                   2023-01-12  3115  						<&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
a32a371f907d66 kyrie wu                   2023-01-12  3116  						<&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,
a32a371f907d66 kyrie wu                   2023-01-12  3117  						<&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
a32a371f907d66 kyrie wu                   2023-01-12  3118  				interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH 0>;
a32a371f907d66 kyrie wu                   2023-01-12  3119  				clocks = <&vencsys_core1 CLK_VENC_CORE1_JPGENC>;
a32a371f907d66 kyrie wu                   2023-01-12  3120  				clock-names = "jpgenc";
a32a371f907d66 kyrie wu                   2023-01-12  3121  				power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
a32a371f907d66 kyrie wu                   2023-01-12  3122  			};
a32a371f907d66 kyrie wu                   2023-01-12  3123  		};
a32a371f907d66 kyrie wu                   2023-01-12  3124  
3b5838d1d82e38 Tinghan Shen               2022-08-11  3125  		larb20: larb@1b010000 {
3b5838d1d82e38 Tinghan Shen               2022-08-11  3126  			compatible = "mediatek,mt8195-smi-larb";
3b5838d1d82e38 Tinghan Shen               2022-08-11  3127  			reg = <0 0x1b010000 0 0x1000>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  3128  			mediatek,larb-id = <20>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  3129  			mediatek,smi = <&smi_common_vpp>;
61b94d54421a1f AngeloGioacchino Del Regno 2023-07-06  3130  			clocks = <&vencsys_core1 CLK_VENC_CORE1_VENC>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  3131  				 <&vencsys_core1 CLK_VENC_CORE1_GALS>,
3b5838d1d82e38 Tinghan Shen               2022-08-11  3132  				 <&vppsys0 CLK_VPP0_GALS_VDO0_VDO1_VENCSYS_CORE1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  3133  			clock-names = "apb", "smi", "gals";
3b5838d1d82e38 Tinghan Shen               2022-08-11  3134  			power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
3b5838d1d82e38 Tinghan Shen               2022-08-11  3135  		};
3b5838d1d82e38 Tinghan Shen               2022-08-11  3136  
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3137  		ovl0: ovl@1c000000 {
ce3dbc46d7e30a Jason-JH.Lin               2024-12-20  3138  			compatible = "mediatek,mt8195-disp-ovl";
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3139  			reg = <0 0x1c000000 0 0x1000>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3140  			interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3141  			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3142  			clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3143  			iommus = <&iommu_vdo M4U_PORT_L0_DISP_OVL0_RDMA0>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3144  			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x0000 0x1000>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3145  
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3146  			ports {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3147  				#address-cells = <1>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3148  				#size-cells = <0>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3149  
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3150  				port@0 {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3151  					reg = <0>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3152  					ovl0_in: endpoint { };
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3153  				};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3154  
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3155  				port@1 {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3156  					reg = <1>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3157  					ovl0_out: endpoint {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3158  						remote-endpoint = <&rdma0_in>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3159  					};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3160  				};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3161  			};
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3162  		};
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3163  
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3164  		rdma0: rdma@1c002000 {
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3165  			compatible = "mediatek,mt8195-disp-rdma";
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3166  			reg = <0 0x1c002000 0 0x1000>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3167  			interrupts = <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH 0>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3168  			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3169  			clocks = <&vdosys0 CLK_VDO0_DISP_RDMA0>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3170  			iommus = <&iommu_vdo M4U_PORT_L0_DISP_RDMA0>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3171  			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x2000 0x1000>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3172  
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3173  			ports {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3174  				#address-cells = <1>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3175  				#size-cells = <0>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3176  
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3177  				port@0 {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3178  					reg = <0>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3179  					rdma0_in: endpoint {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3180  						remote-endpoint = <&ovl0_out>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3181  					};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3182  				};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3183  
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3184  				port@1 {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3185  					reg = <1>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3186  					rdma0_out: endpoint {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3187  						remote-endpoint = <&color0_in>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3188  					};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3189  				};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3190  			};
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3191  		};
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3192  
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3193  		color0: color@1c003000 {
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3194  			compatible = "mediatek,mt8195-disp-color", "mediatek,mt8173-disp-color";
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3195  			reg = <0 0x1c003000 0 0x1000>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3196  			interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH 0>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3197  			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3198  			clocks = <&vdosys0 CLK_VDO0_DISP_COLOR0>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3199  			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x3000 0x1000>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3200  
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3201  			ports {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3202  				#address-cells = <1>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3203  				#size-cells = <0>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3204  
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3205  				port@0 {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3206  					reg = <0>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3207  					color0_in: endpoint {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3208  						remote-endpoint = <&rdma0_out>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3209  					};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3210  				};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3211  
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3212  				port@1 {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3213  					reg = <1>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3214  					color0_out: endpoint {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3215  						remote-endpoint = <&ccorr0_in>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3216  					};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3217  				};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3218  			};
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3219  		};
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3220  
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3221  		ccorr0: ccorr@1c004000 {
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3222  			compatible = "mediatek,mt8195-disp-ccorr", "mediatek,mt8192-disp-ccorr";
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3223  			reg = <0 0x1c004000 0 0x1000>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3224  			interrupts = <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH 0>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3225  			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3226  			clocks = <&vdosys0 CLK_VDO0_DISP_CCORR0>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3227  			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x4000 0x1000>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3228  
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3229  			ports {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3230  				#address-cells = <1>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3231  				#size-cells = <0>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3232  
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3233  				port@0 {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3234  					reg = <0>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3235  					ccorr0_in: endpoint {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3236  						remote-endpoint = <&color0_out>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3237  					};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3238  				};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3239  
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3240  				port@1 {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3241  					reg = <1>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3242  					ccorr0_out: endpoint {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3243  						remote-endpoint = <&aal0_in>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3244  					};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3245  				};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3246  			};
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3247  		};
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3248  
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3249  		aal0: aal@1c005000 {
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3250  			compatible = "mediatek,mt8195-disp-aal", "mediatek,mt8183-disp-aal";
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3251  			reg = <0 0x1c005000 0 0x1000>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3252  			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3253  			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3254  			clocks = <&vdosys0 CLK_VDO0_DISP_AAL0>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3255  			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x5000 0x1000>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3256  
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3257  			ports {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3258  				#address-cells = <1>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3259  				#size-cells = <0>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3260  
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3261  				port@0 {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3262  					reg = <0>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3263  					aal0_in: endpoint {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3264  						remote-endpoint = <&ccorr0_out>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3265  					};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3266  				};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3267  
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3268  				port@1 {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3269  					reg = <1>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3270  					aal0_out: endpoint {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3271  						remote-endpoint = <&gamma0_in>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3272  					};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3273  				};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3274  			};
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3275  		};
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3276  
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3277  		gamma0: gamma@1c006000 {
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3278  			compatible = "mediatek,mt8195-disp-gamma", "mediatek,mt8183-disp-gamma";
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3279  			reg = <0 0x1c006000 0 0x1000>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3280  			interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3281  			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3282  			clocks = <&vdosys0 CLK_VDO0_DISP_GAMMA0>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3283  			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x6000 0x1000>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3284  
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3285  			ports {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3286  				#address-cells = <1>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3287  				#size-cells = <0>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3288  
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3289  				port@0 {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3290  					reg = <0>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3291  					gamma0_in: endpoint {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3292  						remote-endpoint = <&aal0_out>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3293  					};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3294  				};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3295  
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3296  				port@1 {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3297  					reg = <1>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3298  					gamma0_out: endpoint {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3299  						remote-endpoint = <&dither0_in>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3300  					};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3301  				};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3302  			};
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3303  		};
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3304  
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3305  		dither0: dither@1c007000 {
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3306  			compatible = "mediatek,mt8195-disp-dither", "mediatek,mt8183-disp-dither";
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3307  			reg = <0 0x1c007000 0 0x1000>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3308  			interrupts = <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH 0>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3309  			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3310  			clocks = <&vdosys0 CLK_VDO0_DISP_DITHER0>;
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3311  			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x7000 0x1000>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3312  
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3313  			ports {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3314  				#address-cells = <1>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3315  				#size-cells = <0>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3316  
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3317  				port@0 {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3318  					reg = <0>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3319  					dither0_in: endpoint {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3320  						remote-endpoint = <&gamma0_out>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3321  					};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3322  				};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3323  
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3324  				port@1 {
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3325  					reg = <1>;
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3326  					dither0_out: endpoint { };
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3327  				};
fe1ad8edeb1023 AngeloGioacchino Del Regno 2025-02-13  3328  			};
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3329  		};
b852ee68fd7222 Jason-JH.Lin               2022-08-11  3330  
b7f638d6bab947 Michael Walle              2023-11-23 @3331  		dsi0: dsi@1c008000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
