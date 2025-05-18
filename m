Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EA217BCE
	for <oe-kbuild@lists.linux.dev>; Sun, 18 May 2025 17:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747587739; cv=none; b=Gg5A5TdxFHeMn4rkHpR8OEeKLlixmv+54UPFZ8gH0bb2O/cUK+7XUiQwzAQ08X+M7/OnJNo/Za2rjU9gee16B8JXEvPGIqQ7NjmsZTZc6QdNAOheeGMKLj6+qeJrTB6v+kxsejysT7rL/q6SLMoBHDjc48154xfFF1r7Ura7c50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747587739; c=relaxed/simple;
	bh=VQ2P49EtoATUQGu+22lMV3su/c7KOyq/othMRjOOZ/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HleiRoBLhVDFCRAuzopQoKsPTXkBanRhn6TEOpn2xH5J0ccAPyjCUjwXAaOm8SgSvq/3ljgIoBXADpV0/ny8JOK138oHVpdWV95SC0cCKzlEdcUK4es54W6VlMSCY6qm1+bw9gjT2CuzYDeRTJMfCJOr/vkxM66kIT81lMvM/Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=My3cDvpa; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="My3cDvpa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747587737; x=1779123737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VQ2P49EtoATUQGu+22lMV3su/c7KOyq/othMRjOOZ/A=;
  b=My3cDvpaKN5MFAiY4SEoE8/RyaRq4cvEkp6kse3klmXthCtE66PRQXVs
   hJM8gN/0qoD11LF3VJ79SgGfWy6nIMcQpidhnYKBRt84kSnjTkPmPTsma
   L+O5tL4CBIH4YSIFWwy8bwuo3N7LeL57Rfy7EYxtATaTIzugKgCNqC+81
   33DI6fT4z0ba16FleolbIvs7hSDWBBcPHtRLCWRWvMNS4wMhvHLPbP5kf
   uJtVkVaefPuNlJo+P+lzGkq2O0LIfu4wmLcuzyKw3WzDATZMfGj2vE8jw
   9BujgDYDEXTaEAWUwG2Hh3qBW5dEFB+vqqiFfW/RUSHfn49N2NTgRznWU
   A==;
X-CSE-ConnectionGUID: FPGpIojfSmCfbNP2EWWUYQ==
X-CSE-MsgGUID: GjuyUb/3QoaALfTiaNXi4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="67046777"
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="67046777"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 10:02:16 -0700
X-CSE-ConnectionGUID: AhqC2U4qRumAo/uJt/lFsw==
X-CSE-MsgGUID: WR6LaYmSTjCLFvIkm7CCWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="143154739"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 May 2025 10:02:15 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGhOv-0000jX-01;
	Sun, 18 May 2025 17:02:13 +0000
Date: Mon, 19 May 2025 01:02:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 1474/4329] arch/arm64/boot/dts/airoha/en7581.dtsi:146.37-151.5: Warning
 (simple_bus_reg): /soc/clock-controller@1fa20000: simple-bus unit address
 format error, expected "1fb00000"
Message-ID: <202505190132.uKjtP4A2-lkp@intel.com>
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
TO: Christian Marangi <ansuelsmth@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   9d5f0863e401cb64a69c27af17034edd01e989b3
commit: 08e36ef6fc1ef0d24460933a2e9280fa7c0bc9de [1474/4329] arm64: dts: airoha: en7581: Add Clock Controller node
:::::: branch date: 2 weeks ago
:::::: commit date: 3 months ago
config: arm64-randconfig-2051-20250516 (https://download.01.org/0day-ci/archive/20250519/202505190132.uKjtP4A2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505190132.uKjtP4A2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505190132.uKjtP4A2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/airoha/en7581.dtsi:146.37-151.5: Warning (simple_bus_reg): /soc/clock-controller@1fa20000: simple-bus unit address format error, expected "1fb00000"

vim +/1fb00000 +146 arch/arm64/boot/dts/airoha/en7581.dtsi

ab52c59103002b Daniel Danzberger 2024-03-09    6  
ab52c59103002b Daniel Danzberger 2024-03-09    7  / {
ab52c59103002b Daniel Danzberger 2024-03-09    8  	interrupt-parent = <&gic>;
ab52c59103002b Daniel Danzberger 2024-03-09    9  	#address-cells = <2>;
ab52c59103002b Daniel Danzberger 2024-03-09   10  	#size-cells = <2>;
ab52c59103002b Daniel Danzberger 2024-03-09   11  
ab52c59103002b Daniel Danzberger 2024-03-09   12  	reserved-memory {
ab52c59103002b Daniel Danzberger 2024-03-09   13  		#address-cells = <2>;
ab52c59103002b Daniel Danzberger 2024-03-09   14  		#size-cells = <2>;
ab52c59103002b Daniel Danzberger 2024-03-09   15  		ranges;
ab52c59103002b Daniel Danzberger 2024-03-09   16  
ab52c59103002b Daniel Danzberger 2024-03-09   17  		npu-binary@84000000 {
ab52c59103002b Daniel Danzberger 2024-03-09   18  			no-map;
ab52c59103002b Daniel Danzberger 2024-03-09   19  			reg = <0x0 0x84000000 0x0 0xa00000>;
ab52c59103002b Daniel Danzberger 2024-03-09   20  		};
ab52c59103002b Daniel Danzberger 2024-03-09   21  
ab52c59103002b Daniel Danzberger 2024-03-09   22  		npu-flag@84b0000 {
ab52c59103002b Daniel Danzberger 2024-03-09   23  			no-map;
ab52c59103002b Daniel Danzberger 2024-03-09   24  			reg = <0x0 0x84b00000 0x0 0x100000>;
ab52c59103002b Daniel Danzberger 2024-03-09   25  		};
ab52c59103002b Daniel Danzberger 2024-03-09   26  
ab52c59103002b Daniel Danzberger 2024-03-09   27  		npu-pkt@85000000 {
ab52c59103002b Daniel Danzberger 2024-03-09   28  			no-map;
ab52c59103002b Daniel Danzberger 2024-03-09   29  			reg = <0x0 0x85000000 0x0 0x1a00000>;
ab52c59103002b Daniel Danzberger 2024-03-09   30  		};
ab52c59103002b Daniel Danzberger 2024-03-09   31  
ab52c59103002b Daniel Danzberger 2024-03-09   32  		npu-phyaddr@86b00000 {
ab52c59103002b Daniel Danzberger 2024-03-09   33  			no-map;
ab52c59103002b Daniel Danzberger 2024-03-09   34  			reg = <0x0 0x86b00000 0x0 0x100000>;
ab52c59103002b Daniel Danzberger 2024-03-09   35  		};
ab52c59103002b Daniel Danzberger 2024-03-09   36  
ab52c59103002b Daniel Danzberger 2024-03-09   37  		npu-rxdesc@86d00000 {
ab52c59103002b Daniel Danzberger 2024-03-09   38  			no-map;
ab52c59103002b Daniel Danzberger 2024-03-09   39  			reg = <0x0 0x86d00000 0x0 0x100000>;
ab52c59103002b Daniel Danzberger 2024-03-09   40  		};
ab52c59103002b Daniel Danzberger 2024-03-09   41  	};
ab52c59103002b Daniel Danzberger 2024-03-09   42  
ab52c59103002b Daniel Danzberger 2024-03-09   43  	psci {
ab52c59103002b Daniel Danzberger 2024-03-09   44  		compatible = "arm,psci-1.0";
ab52c59103002b Daniel Danzberger 2024-03-09   45  		method = "smc";
ab52c59103002b Daniel Danzberger 2024-03-09   46  	};
ab52c59103002b Daniel Danzberger 2024-03-09   47  
ab52c59103002b Daniel Danzberger 2024-03-09   48  	cpus {
ab52c59103002b Daniel Danzberger 2024-03-09   49  		#address-cells = <1>;
ab52c59103002b Daniel Danzberger 2024-03-09   50  		#size-cells = <0>;
ab52c59103002b Daniel Danzberger 2024-03-09   51  
ab52c59103002b Daniel Danzberger 2024-03-09   52  		cpu-map {
ab52c59103002b Daniel Danzberger 2024-03-09   53  			cluster0 {
ab52c59103002b Daniel Danzberger 2024-03-09   54  				core0 {
ab52c59103002b Daniel Danzberger 2024-03-09   55  					cpu = <&cpu0>;
ab52c59103002b Daniel Danzberger 2024-03-09   56  				};
ab52c59103002b Daniel Danzberger 2024-03-09   57  
ab52c59103002b Daniel Danzberger 2024-03-09   58  				core1 {
ab52c59103002b Daniel Danzberger 2024-03-09   59  					cpu = <&cpu1>;
ab52c59103002b Daniel Danzberger 2024-03-09   60  				};
ab52c59103002b Daniel Danzberger 2024-03-09   61  
ab52c59103002b Daniel Danzberger 2024-03-09   62  				core2 {
ab52c59103002b Daniel Danzberger 2024-03-09   63  					cpu = <&cpu2>;
ab52c59103002b Daniel Danzberger 2024-03-09   64  				};
ab52c59103002b Daniel Danzberger 2024-03-09   65  
ab52c59103002b Daniel Danzberger 2024-03-09   66  				core3 {
ab52c59103002b Daniel Danzberger 2024-03-09   67  					cpu = <&cpu3>;
ab52c59103002b Daniel Danzberger 2024-03-09   68  				};
ab52c59103002b Daniel Danzberger 2024-03-09   69  			};
ab52c59103002b Daniel Danzberger 2024-03-09   70  		};
ab52c59103002b Daniel Danzberger 2024-03-09   71  
ab52c59103002b Daniel Danzberger 2024-03-09   72  		cpu0: cpu@0 {
ab52c59103002b Daniel Danzberger 2024-03-09   73  			device_type = "cpu";
ab52c59103002b Daniel Danzberger 2024-03-09   74  			compatible = "arm,cortex-a53";
ab52c59103002b Daniel Danzberger 2024-03-09   75  			reg = <0x0>;
ab52c59103002b Daniel Danzberger 2024-03-09   76  			enable-method = "psci";
ab52c59103002b Daniel Danzberger 2024-03-09   77  			clock-frequency = <80000000>;
ab52c59103002b Daniel Danzberger 2024-03-09   78  			next-level-cache = <&l2>;
ab52c59103002b Daniel Danzberger 2024-03-09   79  		};
ab52c59103002b Daniel Danzberger 2024-03-09   80  
ab52c59103002b Daniel Danzberger 2024-03-09   81  		cpu1: cpu@1 {
ab52c59103002b Daniel Danzberger 2024-03-09   82  			device_type = "cpu";
ab52c59103002b Daniel Danzberger 2024-03-09   83  			compatible = "arm,cortex-a53";
ab52c59103002b Daniel Danzberger 2024-03-09   84  			reg = <0x1>;
ab52c59103002b Daniel Danzberger 2024-03-09   85  			enable-method = "psci";
ab52c59103002b Daniel Danzberger 2024-03-09   86  			clock-frequency = <80000000>;
ab52c59103002b Daniel Danzberger 2024-03-09   87  			next-level-cache = <&l2>;
ab52c59103002b Daniel Danzberger 2024-03-09   88  		};
ab52c59103002b Daniel Danzberger 2024-03-09   89  
ab52c59103002b Daniel Danzberger 2024-03-09   90  		cpu2: cpu@2 {
ab52c59103002b Daniel Danzberger 2024-03-09   91  			device_type = "cpu";
ab52c59103002b Daniel Danzberger 2024-03-09   92  			compatible = "arm,cortex-a53";
ab52c59103002b Daniel Danzberger 2024-03-09   93  			reg = <0x2>;
ab52c59103002b Daniel Danzberger 2024-03-09   94  			enable-method = "psci";
ab52c59103002b Daniel Danzberger 2024-03-09   95  			clock-frequency = <80000000>;
ab52c59103002b Daniel Danzberger 2024-03-09   96  			next-level-cache = <&l2>;
ab52c59103002b Daniel Danzberger 2024-03-09   97  		};
ab52c59103002b Daniel Danzberger 2024-03-09   98  
ab52c59103002b Daniel Danzberger 2024-03-09   99  		cpu3: cpu@3 {
ab52c59103002b Daniel Danzberger 2024-03-09  100  			device_type = "cpu";
ab52c59103002b Daniel Danzberger 2024-03-09  101  			compatible = "arm,cortex-a53";
ab52c59103002b Daniel Danzberger 2024-03-09  102  			reg = <0x3>;
ab52c59103002b Daniel Danzberger 2024-03-09  103  			enable-method = "psci";
ab52c59103002b Daniel Danzberger 2024-03-09  104  			clock-frequency = <80000000>;
ab52c59103002b Daniel Danzberger 2024-03-09  105  			next-level-cache = <&l2>;
ab52c59103002b Daniel Danzberger 2024-03-09  106  		};
ab52c59103002b Daniel Danzberger 2024-03-09  107  
ab52c59103002b Daniel Danzberger 2024-03-09  108  		l2: l2-cache {
ab52c59103002b Daniel Danzberger 2024-03-09  109  			compatible = "cache";
ab52c59103002b Daniel Danzberger 2024-03-09  110  			cache-size = <0x80000>;
ab52c59103002b Daniel Danzberger 2024-03-09  111  			cache-line-size = <64>;
ab52c59103002b Daniel Danzberger 2024-03-09  112  			cache-level = <2>;
ab52c59103002b Daniel Danzberger 2024-03-09  113  			cache-unified;
ab52c59103002b Daniel Danzberger 2024-03-09  114  		};
ab52c59103002b Daniel Danzberger 2024-03-09  115  	};
ab52c59103002b Daniel Danzberger 2024-03-09  116  
ab52c59103002b Daniel Danzberger 2024-03-09  117  	timer {
ab52c59103002b Daniel Danzberger 2024-03-09  118  		compatible = "arm,armv8-timer";
ab52c59103002b Daniel Danzberger 2024-03-09  119  		interrupt-parent = <&gic>;
ab52c59103002b Daniel Danzberger 2024-03-09  120  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
ab52c59103002b Daniel Danzberger 2024-03-09  121  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
ab52c59103002b Daniel Danzberger 2024-03-09  122  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
ab52c59103002b Daniel Danzberger 2024-03-09  123  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
ab52c59103002b Daniel Danzberger 2024-03-09  124  	};
ab52c59103002b Daniel Danzberger 2024-03-09  125  
ab52c59103002b Daniel Danzberger 2024-03-09  126  	soc {
ab52c59103002b Daniel Danzberger 2024-03-09  127  		compatible = "simple-bus";
ab52c59103002b Daniel Danzberger 2024-03-09  128  		#address-cells = <2>;
ab52c59103002b Daniel Danzberger 2024-03-09  129  		#size-cells = <2>;
ab52c59103002b Daniel Danzberger 2024-03-09  130  		ranges;
ab52c59103002b Daniel Danzberger 2024-03-09  131  
ab52c59103002b Daniel Danzberger 2024-03-09  132  		gic: interrupt-controller@9000000 {
ab52c59103002b Daniel Danzberger 2024-03-09  133  			compatible = "arm,gic-v3";
ab52c59103002b Daniel Danzberger 2024-03-09  134  			interrupt-controller;
ab52c59103002b Daniel Danzberger 2024-03-09  135  			#interrupt-cells = <3>;
ab52c59103002b Daniel Danzberger 2024-03-09  136  			#address-cells = <1>;
ab52c59103002b Daniel Danzberger 2024-03-09  137  			#size-cells = <1>;
ab52c59103002b Daniel Danzberger 2024-03-09  138  			reg = <0x0 0x09000000 0x0 0x20000>,
ab52c59103002b Daniel Danzberger 2024-03-09  139  			      <0x0 0x09080000 0x0 0x80000>,
ab52c59103002b Daniel Danzberger 2024-03-09  140  			      <0x0 0x09400000 0x0 0x2000>,
ab52c59103002b Daniel Danzberger 2024-03-09  141  			      <0x0 0x09500000 0x0 0x2000>,
ab52c59103002b Daniel Danzberger 2024-03-09  142  			      <0x0 0x09600000 0x0 0x20000>;
ab52c59103002b Daniel Danzberger 2024-03-09  143  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
ab52c59103002b Daniel Danzberger 2024-03-09  144  		};
ab52c59103002b Daniel Danzberger 2024-03-09  145  
08e36ef6fc1ef0 Christian Marangi 2025-01-05 @146  		scuclk: clock-controller@1fa20000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
