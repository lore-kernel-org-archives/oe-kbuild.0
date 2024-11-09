Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D7E3FB8B
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Nov 2024 01:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731117575; cv=none; b=ZvPtdql9NnZyYmA1xdyxPA5a7RnuLL98Gm8P1gqZPGO0BFmKekit1+7hDoEQn1c3blxHLM/J9J+0C8xp4O4hss9kpaVyVqAn2BBWcnLmJHOxtwzFdSGq0ByRL6AubJpaNbr+GVxeMhAMRsuV2Fz4T2grUUj0fbwVml5Z/kv5/Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731117575; c=relaxed/simple;
	bh=vcTv9FtiqCgkRcZjxu8P4ZJPmXGhZS85p6xW/O8phY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HMWenDhPngbbm7/HT5iIQrSrS5dAsG7+HymXU/57Pf3MHGpv4+JcAa+whKsWNDQA2VT/P1lkR2bd4C78d47GTyrdhroQn2AZRVhY+e5I8/nWF3Vi0WqMVkDL0mrRZOC5nC2mxa+/jPUS7DqQlzFaX7MXVdmsSbOpSdUbMMTqeJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RD+mL15q; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RD+mL15q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731117571; x=1762653571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vcTv9FtiqCgkRcZjxu8P4ZJPmXGhZS85p6xW/O8phY0=;
  b=RD+mL15qFs+ll7cCG2ZDFvn7TAc+C1Va/LnPhla1E9oL1GUD1NBlG6es
   AiZ3vnSVayxOxRuMf7AvsYic0SosuHL5oSNPbNWK5xaOZgSAgQser5RwX
   cl2p7RlqcIByyIzUIpfgUDjP74UCcxPDEXwwOPEuXZ9tFk9m6PRzPoV/J
   ISGYGIcn3PauLyFao4edVbhhdC0k9rid6B2IIPi/x+BvjdLnxIZks1l1D
   gD8qmvsJwIr6O7Yh+8zSDualdMjHaDIawURA1KpFClxzNCjHmZVeM7UEx
   6zW2YwerQDCAMt9zW/IkuAmqs1Qjuk7MEn7ll8l/ysSihwuTjngcZLNsB
   Q==;
X-CSE-ConnectionGUID: d5XbfWHpRluA78su1BOHFw==
X-CSE-MsgGUID: 8/bIGenJSB2bYtlpmWKDPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34700442"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34700442"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 17:59:29 -0800
X-CSE-ConnectionGUID: bvZeRRJQQMSa9rWcURyA7w==
X-CSE-MsgGUID: Z5ch78wxSo2DIL+BpJQ74w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="85821689"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Nov 2024 17:59:28 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9al4-000ryl-0C;
	Sat, 09 Nov 2024 01:59:26 +0000
Date: Sat, 9 Nov 2024 09:59:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v10 20/22] arm64: dts: amlogic: s4: add crypto node
Message-ID: <202411090920.1iTEPpVV-lkp@intel.com>
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
In-Reply-To: <20241108102907.1788584-21-avromanov@salutedevices.com>
References: <20241108102907.1788584-21-avromanov@salutedevices.com>
TO: Alexey Romanov <avromanov@salutedevices.com>
TO: neil.armstrong@linaro.org
TO: clabbe@baylibre.com
TO: herbert@gondor.apana.org.au
TO: davem@davemloft.net
TO: robh+dt@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: khilman@baylibre.com
TO: jbrunet@baylibre.com
TO: martin.blumenstingl@googlemail.com
TO: vadim.fedorenko@linux.dev
CC: linux-crypto@vger.kernel.org
CC: linux-amlogic@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: kernel@salutedevices.com
CC: Alexey Romanov <avromanov@salutedevices.com>

Hi Alexey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on next-20241108]
[cannot apply to herbert-crypto-2.6/master robh/for-next linus/master v6.12-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Romanov/crypto-amlogic-Don-t-hardcode-IRQ-count/20241108-183503
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20241108102907.1788584-21-avromanov%40salutedevices.com
patch subject: [PATCH v10 20/22] arm64: dts: amlogic: s4: add crypto node
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm64-randconfig-003-20241109 (https://download.01.org/0day-ci/archive/20241109/202411090920.1iTEPpVV-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411090920.1iTEPpVV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411090920.1iTEPpVV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-s4.dtsi:149.34-593.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-s4.dtsi:98.16-102.5: Warning (simple_bus_reg): /soc/clk81: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-s4.dtsi:149.34-593.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges property

vim +98 arch/arm64/boot/dts/amlogic/meson-s4.dtsi

ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  14  
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  15  / {
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  16  	cpus {
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  17  		#address-cells = <2>;
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  18  		#size-cells = <0>;
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  19  
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  20  		cpu0: cpu@0 {
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  21  			device_type = "cpu";
9af9c58a099b57 Xianwei Zhao   2022-04-08  22  			compatible = "arm,cortex-a35";
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  23  			reg = <0x0 0x0>;
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  24  			enable-method = "psci";
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  25  		};
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  26  
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  27  		cpu1: cpu@1 {
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  28  			device_type = "cpu";
9af9c58a099b57 Xianwei Zhao   2022-04-08  29  			compatible = "arm,cortex-a35";
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  30  			reg = <0x0 0x1>;
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  31  			enable-method = "psci";
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  32  		};
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  33  
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  34  		cpu2: cpu@2 {
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  35  			device_type = "cpu";
9af9c58a099b57 Xianwei Zhao   2022-04-08  36  			compatible = "arm,cortex-a35";
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  37  			reg = <0x0 0x2>;
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  38  			enable-method = "psci";
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  39  		};
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  40  
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  41  		cpu3: cpu@3 {
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  42  			device_type = "cpu";
9af9c58a099b57 Xianwei Zhao   2022-04-08  43  			compatible = "arm,cortex-a35";
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  44  			reg = <0x0 0x3>;
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  45  			enable-method = "psci";
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  46  		};
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  47  	};
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  48  
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  49  	timer {
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  50  		compatible = "arm,armv8-timer";
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  51  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  52  			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  53  			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  54  			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  55  	};
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  56  
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  57  	psci {
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  58  		compatible = "arm,psci-1.0";
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  59  		method = "smc";
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  60  	};
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  61  
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  62  	xtal: xtal-clk {
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  63  		compatible = "fixed-clock";
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  64  		clock-frequency = <24000000>;
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  65  		clock-output-names = "xtal";
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  66  		#clock-cells = <0>;
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  67  	};
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  68  
72907de9051dc2 Xianwei Zhao   2024-04-12  69  	firmware {
72907de9051dc2 Xianwei Zhao   2024-04-12  70  		sm: secure-monitor {
72907de9051dc2 Xianwei Zhao   2024-04-12  71  			compatible = "amlogic,meson-gxbb-sm";
72907de9051dc2 Xianwei Zhao   2024-04-12  72  
085f7a298a14ed Shunzhou Jiang 2022-04-01  73  			pwrc: power-controller {
085f7a298a14ed Shunzhou Jiang 2022-04-01  74  				compatible = "amlogic,meson-s4-pwrc";
085f7a298a14ed Shunzhou Jiang 2022-04-01  75  				#power-domain-cells = <1>;
72907de9051dc2 Xianwei Zhao   2024-04-12  76  			};
72907de9051dc2 Xianwei Zhao   2024-04-12  77  		};
085f7a298a14ed Shunzhou Jiang 2022-04-01  78  	};
085f7a298a14ed Shunzhou Jiang 2022-04-01  79  
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  80  	soc {
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  81  		compatible = "simple-bus";
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  82  		#address-cells = <2>;
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  83  		#size-cells = <2>;
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  84  		ranges;
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  85  
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  86  		gic: interrupt-controller@fff01000 {
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  87  			compatible = "arm,gic-400";
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  88  			#interrupt-cells = <3>;
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  89  			#address-cells = <0>;
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  90  			interrupt-controller;
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  91  			reg = <0x0 0xfff01000 0 0x1000>,
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  92  			      <0x0 0xfff02000 0 0x2000>,
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  93  			      <0x0 0xfff04000 0 0x2000>,
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  94  			      <0x0 0xfff06000 0 0x2000>;
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  95  			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  96  		};
ac4dfd0d1d3504 Xianwei Zhao   2022-01-06  97  
874c38993f528c Alexey Romanov 2024-11-08 @98  		clk81: clk81 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
