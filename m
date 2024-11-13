Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66171482EB
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Nov 2024 05:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731474147; cv=none; b=A4ufz7bRQK658ZmicpW6fUFxav/9TOH/0Y+YPjUvZWRgT/w1dghfYUlyQzcFOKNlpatUscs0vjqh89rRgSY6zaaOW4q2p6sj61k8PlgK/O6NKWMk1kDX/P/UbzB1w9w+Jryg1quo2VYw3wAkJrFN/AQtyqJCShMcG+1m/Ijj9Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731474147; c=relaxed/simple;
	bh=RZF2AqVVTQwCPTiVyh0j6l0Z9W3gjDg9yKmsJq/SLfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mml0PStr9RiYED+9k2GnHQ+xg8b0F/ufVLnmH9g9yCXbGgXrLKeZVcFeRLtUr4I6UtikzNXFTgjVcYb9iUr5/TntdjoKdWvZmHvlVZ+4RXOBbIkVQcJT4OQApz7olrG0ZUQVtzMBsxbe7hP+eLEGwrURBMztY6dp5v9aCAfv/bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOh2a5lz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOh2a5lz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731474145; x=1763010145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RZF2AqVVTQwCPTiVyh0j6l0Z9W3gjDg9yKmsJq/SLfQ=;
  b=WOh2a5lzoHs7vo2Cj+cUr0o+TIg+nxLB0jIzIBy8f6yVtmdpplPgTQjw
   loSsQD/J2Uc2L7x3Ud/XzlKyACWMrP1M9id9vkL//sAi8pAjXCBI44Ko0
   KQq8rrvh46SC9tUtfFIhcPu2UPct/HSlS3J/I94E+ndIpoYnwcKKz6uHG
   7KgNaJlazE4hxN4GOCyoMCahv9rWq1NrIQ0B4A+qJOB16O7pugYLTo1/3
   9MPlCtBkPLjsJo6YZJ+XPvG9ZXMiBEovGhAEoNa1ldK6ks1hbFDoGDiWA
   q0+8T9OrUi/v5euNwWieEeixyocB/V42LmJ0B1bFpsevpDjL/FkYALtWO
   Q==;
X-CSE-ConnectionGUID: GYv0cA20SY6ueqJbfwgsIg==
X-CSE-MsgGUID: iU6n4rcMSPy5O5563n1uXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53897056"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53897056"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 21:02:24 -0800
X-CSE-ConnectionGUID: rTlykc7YQvWZtXVbf4bzjw==
X-CSE-MsgGUID: m0xbHB8aSVqYFy76PMGpHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="118698639"
Received: from lkp-server01.sh.intel.com (HELO c782e932e0d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Nov 2024 21:02:22 -0800
Received: from kbuild by c782e932e0d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB5WG-00005p-1J;
	Wed, 13 Nov 2024 05:02:20 +0000
Date: Wed, 13 Nov 2024 13:01:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:th1520 48/48]
 arch/riscv/boot/dts/thead/th1520.dtsi:241.18-248.5: Warning
 (simple_bus_reg): /soc/cpurst: missing or empty reg/ranges property
Message-ID: <202411131206.Hz07BKNz-lkp@intel.com>
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
TO: Han Gao <gaohan@iscas.ac.cn>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>

tree:   https://github.com/esmil/linux th1520
head:   b0b9c5dfe5239c799b6da7dadef7586860b61313
commit: b0b9c5dfe5239c799b6da7dadef7586860b61313 [48/48] [NOT-FOR-UPSTREAM] riscv: dts: thead: Add TH1520 CPU reset node
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: riscv-randconfig-052-20241113 (https://download.01.org/0day-ci/archive/20241113/202411131206.Hz07BKNz-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.11
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411131206.Hz07BKNz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411131206.Hz07BKNz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/thead/th1520.dtsi:241.18-248.5: Warning (simple_bus_reg): /soc/cpurst: missing or empty reg/ranges property
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: soc: cpurst: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/cpurst: failed to match any schema with compatible: ['thead,reset-sample']
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: pinctrl@ffe7f3c000: 'resets' does not match any of the regexes: '-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/thead,th1520-pinctrl.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: pinctrl@ffec007000: 'resets' does not match any of the regexes: '-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/thead,th1520-pinctrl.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: pwm@ffec01c000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/thead,th1520-pwm.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/misc_sysreg@ffec02c000: failed to match any schema with compatible: ['thead,th1520-misc-sysreg', 'syscon']
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'clock-names' is a required property
--
>> arch/riscv/boot/dts/thead/th1520.dtsi:241.18-248.5: Warning (simple_bus_reg): /soc/cpurst: missing or empty reg/ranges property
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: soc: cpurst: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/cpurst: failed to match any schema with compatible: ['thead,reset-sample']
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: pinctrl@ffe7f3c000: 'resets' does not match any of the regexes: '-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/thead,th1520-pinctrl.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: pinctrl@ffec007000: 'resets' does not match any of the regexes: '-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/thead,th1520-pinctrl.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: pwm@ffec01c000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/thead,th1520-pwm.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/misc_sysreg@ffec02c000: failed to match any schema with compatible: ['thead,th1520-misc-sysreg', 'syscon']
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: usb@ffec03f000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: usb@ffec03f000: 'clock-names' is a required property

vim +241 arch/riscv/boot/dts/thead/th1520.dtsi

8e396880a864b8 Jisheng Zhang        2023-06-18   10  
8e396880a864b8 Jisheng Zhang        2023-06-18   11  / {
8e396880a864b8 Jisheng Zhang        2023-06-18   12  	compatible = "thead,th1520";
8e396880a864b8 Jisheng Zhang        2023-06-18   13  	#address-cells = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18   14  	#size-cells = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18   15  
8e396880a864b8 Jisheng Zhang        2023-06-18   16  	cpus: cpus {
8e396880a864b8 Jisheng Zhang        2023-06-18   17  		#address-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18   18  		#size-cells = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18   19  		timebase-frequency = <3000000>;
8e396880a864b8 Jisheng Zhang        2023-06-18   20  
8e396880a864b8 Jisheng Zhang        2023-06-18   21  		c910_0: cpu@0 {
8e396880a864b8 Jisheng Zhang        2023-06-18   22  			compatible = "thead,c910", "riscv";
8e396880a864b8 Jisheng Zhang        2023-06-18   23  			device_type = "cpu";
8e396880a864b8 Jisheng Zhang        2023-06-18   24  			riscv,isa = "rv64imafdc";
0804f3bec9e9a3 Conor Dooley         2023-10-22   25  			riscv,isa-base = "rv64i";
0804f3bec9e9a3 Conor Dooley         2023-10-22   26  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
0804f3bec9e9a3 Conor Dooley         2023-10-22   27  					       "zifencei", "zihpm";
8e396880a864b8 Jisheng Zhang        2023-06-18   28  			reg = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18   29  			i-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18   30  			i-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18   31  			i-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18   32  			d-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18   33  			d-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18   34  			d-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18   35  			next-level-cache = <&l2_cache>;
8e396880a864b8 Jisheng Zhang        2023-06-18   36  			mmu-type = "riscv,sv39";
8e396880a864b8 Jisheng Zhang        2023-06-18   37  
8e396880a864b8 Jisheng Zhang        2023-06-18   38  			cpu0_intc: interrupt-controller {
8e396880a864b8 Jisheng Zhang        2023-06-18   39  				compatible = "riscv,cpu-intc";
8e396880a864b8 Jisheng Zhang        2023-06-18   40  				interrupt-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18   41  				#interrupt-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18   42  			};
8e396880a864b8 Jisheng Zhang        2023-06-18   43  		};
8e396880a864b8 Jisheng Zhang        2023-06-18   44  
8e396880a864b8 Jisheng Zhang        2023-06-18   45  		c910_1: cpu@1 {
8e396880a864b8 Jisheng Zhang        2023-06-18   46  			compatible = "thead,c910", "riscv";
8e396880a864b8 Jisheng Zhang        2023-06-18   47  			device_type = "cpu";
8e396880a864b8 Jisheng Zhang        2023-06-18   48  			riscv,isa = "rv64imafdc";
0804f3bec9e9a3 Conor Dooley         2023-10-22   49  			riscv,isa-base = "rv64i";
0804f3bec9e9a3 Conor Dooley         2023-10-22   50  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
0804f3bec9e9a3 Conor Dooley         2023-10-22   51  					       "zifencei", "zihpm";
8e396880a864b8 Jisheng Zhang        2023-06-18   52  			reg = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18   53  			i-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18   54  			i-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18   55  			i-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18   56  			d-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18   57  			d-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18   58  			d-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18   59  			next-level-cache = <&l2_cache>;
8e396880a864b8 Jisheng Zhang        2023-06-18   60  			mmu-type = "riscv,sv39";
8e396880a864b8 Jisheng Zhang        2023-06-18   61  
8e396880a864b8 Jisheng Zhang        2023-06-18   62  			cpu1_intc: interrupt-controller {
8e396880a864b8 Jisheng Zhang        2023-06-18   63  				compatible = "riscv,cpu-intc";
8e396880a864b8 Jisheng Zhang        2023-06-18   64  				interrupt-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18   65  				#interrupt-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18   66  			};
8e396880a864b8 Jisheng Zhang        2023-06-18   67  		};
8e396880a864b8 Jisheng Zhang        2023-06-18   68  
8e396880a864b8 Jisheng Zhang        2023-06-18   69  		c910_2: cpu@2 {
8e396880a864b8 Jisheng Zhang        2023-06-18   70  			compatible = "thead,c910", "riscv";
8e396880a864b8 Jisheng Zhang        2023-06-18   71  			device_type = "cpu";
8e396880a864b8 Jisheng Zhang        2023-06-18   72  			riscv,isa = "rv64imafdc";
0804f3bec9e9a3 Conor Dooley         2023-10-22   73  			riscv,isa-base = "rv64i";
0804f3bec9e9a3 Conor Dooley         2023-10-22   74  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
0804f3bec9e9a3 Conor Dooley         2023-10-22   75  					       "zifencei", "zihpm";
8e396880a864b8 Jisheng Zhang        2023-06-18   76  			reg = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18   77  			i-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18   78  			i-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18   79  			i-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18   80  			d-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18   81  			d-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18   82  			d-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18   83  			next-level-cache = <&l2_cache>;
8e396880a864b8 Jisheng Zhang        2023-06-18   84  			mmu-type = "riscv,sv39";
8e396880a864b8 Jisheng Zhang        2023-06-18   85  
8e396880a864b8 Jisheng Zhang        2023-06-18   86  			cpu2_intc: interrupt-controller {
8e396880a864b8 Jisheng Zhang        2023-06-18   87  				compatible = "riscv,cpu-intc";
8e396880a864b8 Jisheng Zhang        2023-06-18   88  				interrupt-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18   89  				#interrupt-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18   90  			};
8e396880a864b8 Jisheng Zhang        2023-06-18   91  		};
8e396880a864b8 Jisheng Zhang        2023-06-18   92  
8e396880a864b8 Jisheng Zhang        2023-06-18   93  		c910_3: cpu@3 {
8e396880a864b8 Jisheng Zhang        2023-06-18   94  			compatible = "thead,c910", "riscv";
8e396880a864b8 Jisheng Zhang        2023-06-18   95  			device_type = "cpu";
8e396880a864b8 Jisheng Zhang        2023-06-18   96  			riscv,isa = "rv64imafdc";
0804f3bec9e9a3 Conor Dooley         2023-10-22   97  			riscv,isa-base = "rv64i";
0804f3bec9e9a3 Conor Dooley         2023-10-22   98  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
0804f3bec9e9a3 Conor Dooley         2023-10-22   99  					       "zifencei", "zihpm";
8e396880a864b8 Jisheng Zhang        2023-06-18  100  			reg = <3>;
8e396880a864b8 Jisheng Zhang        2023-06-18  101  			i-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18  102  			i-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18  103  			i-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18  104  			d-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18  105  			d-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18  106  			d-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18  107  			next-level-cache = <&l2_cache>;
8e396880a864b8 Jisheng Zhang        2023-06-18  108  			mmu-type = "riscv,sv39";
8e396880a864b8 Jisheng Zhang        2023-06-18  109  
8e396880a864b8 Jisheng Zhang        2023-06-18  110  			cpu3_intc: interrupt-controller {
8e396880a864b8 Jisheng Zhang        2023-06-18  111  				compatible = "riscv,cpu-intc";
8e396880a864b8 Jisheng Zhang        2023-06-18  112  				interrupt-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18  113  				#interrupt-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18  114  			};
8e396880a864b8 Jisheng Zhang        2023-06-18  115  		};
8e396880a864b8 Jisheng Zhang        2023-06-18  116  
8e396880a864b8 Jisheng Zhang        2023-06-18  117  		l2_cache: l2-cache {
8e396880a864b8 Jisheng Zhang        2023-06-18  118  			compatible = "cache";
8e396880a864b8 Jisheng Zhang        2023-06-18  119  			cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18  120  			cache-level = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18  121  			cache-size = <1048576>;
8e396880a864b8 Jisheng Zhang        2023-06-18  122  			cache-sets = <1024>;
8e396880a864b8 Jisheng Zhang        2023-06-18  123  			cache-unified;
8e396880a864b8 Jisheng Zhang        2023-06-18  124  		};
8e396880a864b8 Jisheng Zhang        2023-06-18  125  	};
8e396880a864b8 Jisheng Zhang        2023-06-18  126  
c61fea676bcb5f Inochi Amaoto        2024-05-30  127  	pmu {
c61fea676bcb5f Inochi Amaoto        2024-05-30  128  		compatible = "riscv,pmu";
c61fea676bcb5f Inochi Amaoto        2024-05-30  129  		riscv,event-to-mhpmcounters =
c61fea676bcb5f Inochi Amaoto        2024-05-30  130  			<0x00003 0x00003 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  131  			<0x00004 0x00004 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  132  			<0x00005 0x00005 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  133  			<0x00006 0x00006 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  134  			<0x00007 0x00007 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  135  			<0x00008 0x00008 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  136  			<0x00009 0x00009 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  137  			<0x0000a 0x0000a 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  138  			<0x10000 0x10000 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  139  			<0x10001 0x10001 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  140  			<0x10002 0x10002 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  141  			<0x10003 0x10003 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  142  			<0x10010 0x10010 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  143  			<0x10011 0x10011 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  144  			<0x10012 0x10012 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  145  			<0x10013 0x10013 0x0007fff8>;
c61fea676bcb5f Inochi Amaoto        2024-05-30  146  		riscv,event-to-mhpmevent =
c61fea676bcb5f Inochi Amaoto        2024-05-30  147  			<0x00003 0x00000000 0x00000001>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  148  			<0x00004 0x00000000 0x00000002>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  149  			<0x00006 0x00000000 0x00000006>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  150  			<0x00005 0x00000000 0x00000007>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  151  			<0x00007 0x00000000 0x00000008>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  152  			<0x00008 0x00000000 0x00000009>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  153  			<0x00009 0x00000000 0x0000000a>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  154  			<0x0000a 0x00000000 0x0000000b>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  155  			<0x10000 0x00000000 0x0000000c>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  156  			<0x10001 0x00000000 0x0000000d>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  157  			<0x10002 0x00000000 0x0000000e>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  158  			<0x10003 0x00000000 0x0000000f>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  159  			<0x10010 0x00000000 0x00000010>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  160  			<0x10011 0x00000000 0x00000011>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  161  			<0x10012 0x00000000 0x00000012>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  162  			<0x10013 0x00000000 0x00000013>;
c61fea676bcb5f Inochi Amaoto        2024-05-30  163  		riscv,raw-event-to-mhpmcounters =
c61fea676bcb5f Inochi Amaoto        2024-05-30  164  			<0x00000000 0x00000001 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  165  			<0x00000000 0x00000002 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  166  			<0x00000000 0x00000003 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  167  			<0x00000000 0x00000004 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  168  			<0x00000000 0x00000005 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  169  			<0x00000000 0x00000006 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  170  			<0x00000000 0x00000007 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  171  			<0x00000000 0x00000008 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  172  			<0x00000000 0x00000009 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  173  			<0x00000000 0x0000000a 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  174  			<0x00000000 0x0000000b 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  175  			<0x00000000 0x0000000c 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  176  			<0x00000000 0x0000000d 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  177  			<0x00000000 0x0000000e 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  178  			<0x00000000 0x0000000f 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  179  			<0x00000000 0x00000010 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  180  			<0x00000000 0x00000011 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  181  			<0x00000000 0x00000012 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  182  			<0x00000000 0x00000013 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  183  			<0x00000000 0x00000014 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  184  			<0x00000000 0x00000015 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  185  			<0x00000000 0x00000016 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  186  			<0x00000000 0x00000017 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  187  			<0x00000000 0x00000018 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  188  			<0x00000000 0x00000019 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  189  			<0x00000000 0x0000001a 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  190  			<0x00000000 0x0000001b 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  191  			<0x00000000 0x0000001c 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  192  			<0x00000000 0x0000001d 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  193  			<0x00000000 0x0000001e 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  194  			<0x00000000 0x0000001f 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  195  			<0x00000000 0x00000020 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  196  			<0x00000000 0x00000021 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  197  			<0x00000000 0x00000022 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  198  			<0x00000000 0x00000023 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  199  			<0x00000000 0x00000024 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  200  			<0x00000000 0x00000025 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  201  			<0x00000000 0x00000026 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  202  			<0x00000000 0x00000027 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  203  			<0x00000000 0x00000028 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  204  			<0x00000000 0x00000029 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  205  			<0x00000000 0x0000002a 0xffffffff 0xffffffff 0x0007fff8>;
c61fea676bcb5f Inochi Amaoto        2024-05-30  206  	};
c61fea676bcb5f Inochi Amaoto        2024-05-30  207  
8e396880a864b8 Jisheng Zhang        2023-06-18  208  	osc: oscillator {
8e396880a864b8 Jisheng Zhang        2023-06-18  209  		compatible = "fixed-clock";
8e396880a864b8 Jisheng Zhang        2023-06-18  210  		clock-output-names = "osc_24m";
8e396880a864b8 Jisheng Zhang        2023-06-18  211  		#clock-cells = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18  212  	};
8e396880a864b8 Jisheng Zhang        2023-06-18  213  
8e396880a864b8 Jisheng Zhang        2023-06-18  214  	osc_32k: 32k-oscillator {
8e396880a864b8 Jisheng Zhang        2023-06-18  215  		compatible = "fixed-clock";
8e396880a864b8 Jisheng Zhang        2023-06-18  216  		clock-output-names = "osc_32k";
8e396880a864b8 Jisheng Zhang        2023-06-18  217  		#clock-cells = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18  218  	};
8e396880a864b8 Jisheng Zhang        2023-06-18  219  
6229addc284804 Emil Renner Berthing 2024-10-14  220  	aonsys_clk: clock-73728000 {
6229addc284804 Emil Renner Berthing 2024-10-14  221  		compatible = "fixed-clock";
6229addc284804 Emil Renner Berthing 2024-10-14  222  		clock-frequency = <73728000>;
6229addc284804 Emil Renner Berthing 2024-10-14  223  		clock-output-names = "aonsys_clk";
6229addc284804 Emil Renner Berthing 2024-10-14  224  		#clock-cells = <0>;
6229addc284804 Emil Renner Berthing 2024-10-14  225  	};
6229addc284804 Emil Renner Berthing 2024-10-14  226  
7de7f914af0c29 Emil Renner Berthing 2024-10-20  227  	stmmac_axi_config: stmmac-axi-config {
7de7f914af0c29 Emil Renner Berthing 2024-10-20  228  		snps,wr_osr_lmt = <15>;
7de7f914af0c29 Emil Renner Berthing 2024-10-20  229  		snps,rd_osr_lmt = <15>;
7de7f914af0c29 Emil Renner Berthing 2024-10-20  230  		snps,blen = <0 0 64 32 0 0 0>;
7de7f914af0c29 Emil Renner Berthing 2024-10-20  231  	};
7de7f914af0c29 Emil Renner Berthing 2024-10-20  232  
8e396880a864b8 Jisheng Zhang        2023-06-18  233  	soc {
8e396880a864b8 Jisheng Zhang        2023-06-18  234  		compatible = "simple-bus";
8e396880a864b8 Jisheng Zhang        2023-06-18  235  		interrupt-parent = <&plic>;
8e396880a864b8 Jisheng Zhang        2023-06-18  236  		#address-cells = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18  237  		#size-cells = <2>;
759426c758c705 Jisheng Zhang        2023-09-12  238  		dma-noncoherent;
8e396880a864b8 Jisheng Zhang        2023-06-18  239  		ranges;
8e396880a864b8 Jisheng Zhang        2023-06-18  240  
b0b9c5dfe5239c Han Gao              2023-09-21 @241  		cpurst: cpurst {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
