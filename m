Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD69E19149F
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Jan 2025 22:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736117584; cv=none; b=r8JxLjmJyaystj1DQSEXBG6gXM+6ksGIiq5Br9nylQxCcPYu+pWIlYGatt+IavEGwDDqOzz6RRkGkk3/0sVtfjBiUF68tiP+DgFeli+IOH7K8lxE0Js7ArJuvDu+YhozLqC8mGyMyNsRC+XRsRiCV0oWa3xoW2CqFo6ov79PF0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736117584; c=relaxed/simple;
	bh=Tq70NRr7Nu3iFK6f2ay+kWxOyQIOOR2eumZm9FuJ4a8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QzioD7XrhJND40sqbXWGmNoo8wQHsOcpNrPoUORtGMAN0jnLMgpSxIMFd8Cj8hxKc7SaS8wVgo18War20vyxfsdKdVSfWjk4B1Hcp7T2xGERz7pWhP62V8WeLSWvExxrtAOZANveVrRdo478qwzyIZM6aIQF7nMhctEKfRJEkwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EjWikJFV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EjWikJFV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736117583; x=1767653583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tq70NRr7Nu3iFK6f2ay+kWxOyQIOOR2eumZm9FuJ4a8=;
  b=EjWikJFVzmovPFDtwLu6X+0R9n8bKPBcxoIKcon3VFOrjgMZGOvrP0ZM
   oFchagexSbe40yRe8olPgBcksfC/YvvDDbmuF/WGhvuO3EUmbl43duHEg
   NPeQng2B1YQxEQEn/F9/CVbTReBZA9hN6tH+RKPZ7gGhWIdGZOatOOQ4F
   OBHMHN7e/WqhvK3xjaaA4D7wcX99AxHc9Pjn+oDNB59s2IrVvp/sbfJeL
   L2Wi8zMKLLHfACOQm8k17Ls11ZXYx1B+gux5jlbcoCeOw2kNBvHUadxTU
   tzLpv7ghSUsmAobaXB7e25/2gkgmr/Wu8BYE5vgq5/n+4ffGhJrlCvp5a
   Q==;
X-CSE-ConnectionGUID: 3gO2K9BhRMyge132osK4Iw==
X-CSE-MsgGUID: JmwW2S9BTUyh1WJcpKYe5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="46844297"
X-IronPort-AV: E=Sophos;i="6.12,291,1728975600"; 
   d="scan'208";a="46844297"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 14:53:02 -0800
X-CSE-ConnectionGUID: h+ycV8dLTxmzyksouZcPKA==
X-CSE-MsgGUID: ZcmZ4SfGQX2sH9yqbKajfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102146666"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Jan 2025 14:53:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUZUQ-000C25-2m;
	Sun, 05 Jan 2025 22:52:58 +0000
Date: Mon, 6 Jan 2025 06:52:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/3] arm64: dts: airoha: en7581: Add Clock Controller node
Message-ID: <202501060646.9wHKDIFT-lkp@intel.com>
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
In-Reply-To: <20250105150328.15172-1-ansuelsmth@gmail.com>
References: <20250105150328.15172-1-ansuelsmth@gmail.com>
TO: Christian Marangi <ansuelsmth@gmail.com>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Christian Marangi <ansuelsmth@gmail.com>
TO: Daniel Danzberger <dd@embedd.com>
TO: Lorenzo Bianconi <lorenzo@kernel.org>
TO: linux-arm-kernel@lists.infradead.org
TO: linux-mediatek@lists.infradead.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: upstream@airoha.com

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/arm64-dts-airoha-en7581-Add-SNAND-node/20250105-231127
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250105150328.15172-1-ansuelsmth%40gmail.com
patch subject: [PATCH 1/3] arm64: dts: airoha: en7581: Add Clock Controller node
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: arm64-randconfig-004-20250105 (https://download.01.org/0day-ci/archive/20250106/202501060646.9wHKDIFT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501060646.9wHKDIFT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501060646.9wHKDIFT-lkp@intel.com/

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
0bda2a6bd971aa Christian Marangi 2025-01-05 @146  		scuclk: clock-controller@1fa20000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
