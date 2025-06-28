Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74B9221F3E
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Jun 2025 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751126508; cv=none; b=RhV1safhDQvrrbAe5M/cprj1BlukMlo33yz95iNuwcXUWbun1dIyVoXmSLUr//kQBys5WgDPNJMqGLuMLWnYf1LIXI3sEzvMHVQ5daMc1GAU8p8F4hEcoZh5DSpwYSy1iTdjqZ/UZ9l7JNTczutB22Uc/j6hSwMmo2op36rbZb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751126508; c=relaxed/simple;
	bh=YnqcmO3uy9AvxbtKlD8DL8JWI275nGah+YZ8xsvx/Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i1iOiq9aNFN1BVLYnGNIKb3ve1/j49PIfyw+j810qPHoUbU6+tjX5oXU/kTK+dEmtpv3S3w/e2++QxlUieZd7pniCvh5KxWFaAMf/IG08O+OENE9AJ9KYdERbpNtpyDQ4QpVXxrYtusTPGXAcb/iDA4OIt/XuzN1+GxMqgaBTIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PjedXdR9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PjedXdR9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751126504; x=1782662504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YnqcmO3uy9AvxbtKlD8DL8JWI275nGah+YZ8xsvx/Cc=;
  b=PjedXdR9W9MuvC62hoQ1a9pDzja3gUDh031r/4O/ND2ScLMIqg/VlF31
   0ODFgvWLIA1v6v6EmSx+BRnPUvypbSNg/Ph3cH5e+ywreGAOX46GkS69S
   GhMzjtFp96OAxA7KNBe7ghxL3OvuPmNE5LDWASm026AMxys2NqNcu/zJz
   OuugeWcIW6CFmI4bxVodcytLq8t/rn/cxNa+EhfpdOzIl/KFj6r6OoWIR
   DID1LBqfyjghqreS4smvNm679aB58TC9UqI14l9RTUsYUxX09Uhkcbgrl
   hY9FL0/iF886cDJD2XcGo2pePE1auoN+pKuQ/cX9TpYoh7Q3HvbD5pce0
   A==;
X-CSE-ConnectionGUID: Wl9p3awJSQiC5FJjmS9J0w==
X-CSE-MsgGUID: bgMUafegSma4n2VV111shg==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="52530773"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="52530773"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 09:01:40 -0700
X-CSE-ConnectionGUID: Dl36hSNRTae+NzUokGHeYQ==
X-CSE-MsgGUID: btJIiMToQMWJkrT4vRyYrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="153769005"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Jun 2025 09:01:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVXzk-000XAC-19;
	Sat, 28 Jun 2025 16:01:36 +0000
Date: Sun, 29 Jun 2025 00:00:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/6] arm64: dts: exynos7870: add DSI support
Message-ID: <202506282333.BRzalSFW-lkp@intel.com>
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
In-Reply-To: <20250627-exynos7870-drm-dts-v2-3-d4a59207390d@disroot.org>
References: <20250627-exynos7870-drm-dts-v2-3-d4a59207390d@disroot.org>
TO: Kaustabh Chakraborty <kauschluss@disroot.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Alim Akhtar <alim.akhtar@samsung.com>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Kaustabh Chakraborty <kauschluss@disroot.org>

Hi Kaustabh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1b152eeca84a02bdb648f16b82ef3394007a9dcf]

url:    https://github.com/intel-lab-lkp/linux/commits/Kaustabh-Chakraborty/dt-bindings-samsung-exynos-sysreg-add-exynos7870-sysregs/20250627-041741
base:   1b152eeca84a02bdb648f16b82ef3394007a9dcf
patch link:    https://lore.kernel.org/r/20250627-exynos7870-drm-dts-v2-3-d4a59207390d%40disroot.org
patch subject: [PATCH v2 3/6] arm64: dts: exynos7870: add DSI support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-002-20250628 (https://download.01.org/0day-ci/archive/20250628/202506282333.BRzalSFW-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506282333.BRzalSFW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506282333.BRzalSFW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynos7870.dtsi:706.10-717.6: Warning (graph_child_address): /soc@0/dsi@14800000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/exynos/exynos7870.dtsi:739.10-749.6: Warning (graph_child_address): /soc@0/decon@14830000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +706 arch/arm64/boot/dts/exynos/exynos7870.dtsi

d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   11  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   12  / {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   13  	compatible = "samsung,exynos7870";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   14  	#address-cells = <2>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   15  	#size-cells = <1>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   16  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   17  	interrupt-parent = <&gic>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   18  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   19  	aliases {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   20  		pinctrl0 = &pinctrl_alive;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   21  		pinctrl1 = &pinctrl_dispaud;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   22  		pinctrl2 = &pinctrl_ese;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   23  		pinctrl3 = &pinctrl_fsys;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   24  		pinctrl4 = &pinctrl_mif;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   25  		pinctrl5 = &pinctrl_nfc;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   26  		pinctrl6 = &pinctrl_top;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   27  		pinctrl7 = &pinctrl_touch;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   28  	};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   29  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   30  	cpus {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   31  		#address-cells = <1>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   32  		#size-cells = <0>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   33  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   34  		cpu-map {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   35  			cluster0 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   36  				core0 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   37  					cpu = <&cpu0>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   38  				};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   39  				core1 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   40  					cpu = <&cpu1>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   41  				};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   42  				core2 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   43  					cpu = <&cpu2>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   44  				};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   45  				core3 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   46  					cpu = <&cpu3>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   47  				};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   48  			};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   49  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   50  			cluster1 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   51  				core0 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   52  					cpu = <&cpu4>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   53  				};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   54  				core1 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   55  					cpu = <&cpu5>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   56  				};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   57  				core2 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   58  					cpu = <&cpu6>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   59  				};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   60  				core3 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   61  					cpu = <&cpu7>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   62  				};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   63  			};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   64  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   65  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   66  		cpu0: cpu@0 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   67  			device_type = "cpu";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   68  			compatible = "arm,cortex-a53";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   69  			reg = <0x0>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   70  			enable-method = "psci";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   71  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   72  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   73  		cpu1: cpu@1 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   74  			device_type = "cpu";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   75  			compatible = "arm,cortex-a53";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   76  			reg = <0x1>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   77  			enable-method = "psci";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   78  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   79  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   80  		cpu2: cpu@2 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   81  			device_type = "cpu";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   82  			compatible = "arm,cortex-a53";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   83  			reg = <0x2>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   84  			enable-method = "psci";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   85  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   86  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   87  		cpu3: cpu@3 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   88  			device_type = "cpu";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   89  			compatible = "arm,cortex-a53";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   90  			reg = <0x3>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   91  			enable-method = "psci";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   92  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   93  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   94  		cpu4: cpu@100 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   95  			device_type = "cpu";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   96  			compatible = "arm,cortex-a53";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   97  			reg = <0x100>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   98  			enable-method = "psci";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01   99  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  100  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  101  		cpu5: cpu@101 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  102  			device_type = "cpu";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  103  			compatible = "arm,cortex-a53";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  104  			reg = <0x101>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  105  			enable-method = "psci";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  106  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  107  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  108  		cpu6: cpu@102 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  109  			device_type = "cpu";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  110  			compatible = "arm,cortex-a53";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  111  			reg = <0x102>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  112  			enable-method = "psci";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  113  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  114  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  115  		cpu7: cpu@103 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  116  			device_type = "cpu";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  117  			compatible = "arm,cortex-a53";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  118  			reg = <0x103>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  119  			enable-method = "psci";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  120  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  121  	};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  122  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  123  	oscclk: oscclk {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  124  		compatible = "fixed-clock";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  125  		#clock-cells = <0>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  126  	};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  127  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  128  	psci {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  129  		compatible = "arm,psci";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  130  		method = "smc";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  131  		cpu_suspend = <0xc4000001>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  132  		cpu_off = <0x84000002>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  133  		cpu_on = <0xc4000003>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  134  	};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  135  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  136  	soc: soc@0 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  137  		compatible = "simple-bus";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  138  		ranges = <0x0 0x0 0x0 0x20000000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  139  		#address-cells = <1>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  140  		#size-cells = <1>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  141  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  142  		chipid@10100000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  143  			compatible = "samsung,exynos7870-chipid",
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  144  				     "samsung,exynos4210-chipid";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  145  			reg = <0x10100000 0x100>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  146  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  147  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  148  		cmu_peri: clock-controller@101f0000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  149  			compatible = "samsung,exynos7870-cmu-peri";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  150  			reg = <0x101f0000 0x1000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  151  			#clock-cells = <1>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  152  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  153  			clock-names = "oscclk", "bus", "spi0", "spi1", "spi2",
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  154  				      "spi3", "spi4", "uart0", "uart1", "uart2";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  155  			clocks = <&oscclk>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  156  				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_BUS>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  157  				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI0>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  158  				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI1>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  159  				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI2>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  160  				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI3>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  161  				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI4>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  162  				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART0>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  163  				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART1>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  164  				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART2>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  165  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  166  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  167  		cmu_mif: clock-controller@10460000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  168  			compatible = "samsung,exynos7870-cmu-mif";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  169  			reg = <0x10460000 0x1000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  170  			#clock-cells = <1>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  171  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  172  			clock-names = "oscclk";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  173  			clocks = <&oscclk>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  174  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  175  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  176  		pmu_system_controller: system-controller@10480000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  177  			compatible = "samsung,exynos7870-pmu",
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  178  				     "samsung,exynos7-pmu", "syscon";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  179  			reg = <0x10480000 0x10000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  180  
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  181  			mipi_phy: mipi-phy {
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  182  				compatible = "samsung,exynos7870-mipi-video-phy";
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  183  				#phy-cells = <1>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  184  
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  185  				samsung,cam0-sysreg = <&syscon_cam0>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  186  				samsung,disp-sysreg = <&syscon_disp>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  187  			};
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  188  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  189  			reboot-mode {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  190  				compatible = "syscon-reboot-mode";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  191  				offset = <0x080c>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  192  				mode-bootloader = <0x1234567d>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  193  				mode-download = <0x12345671>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  194  				mode-recovery = <0x12345674>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  195  			};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  196  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  197  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  198  		gic: interrupt-controller@104e1000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  199  			compatible = "arm,cortex-a15-gic";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  200  			reg = <0x104e1000 0x1000>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  201  			      <0x104e2000 0x1000>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  202  			      <0x104e4000 0x2000>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  203  			      <0x104e6000 0x2000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  204  			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  205  						 IRQ_TYPE_LEVEL_HIGH)>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  206  			interrupt-controller;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  207  			#address-cells = <0>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  208  			#interrupt-cells = <3>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  209  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  210  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  211  		hsi2c0: i2c@10510000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  212  			compatible = "samsung,exynos7870-hsi2c",
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  213  				     "samsung,exynos7-hsi2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  214  			reg = <0x10510000 0x2000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  215  			interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  216  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  217  			pinctrl-names = "default";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  218  			pinctrl-0 = <&hsi2c0_bus>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  219  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  220  			clock-names = "hsi2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  221  			clocks = <&cmu_mif CLK_GOUT_MIF_HSI2C_IPCLK>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  222  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  223  			status = "disabled";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  224  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  225  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  226  		pinctrl_mif: pinctrl@10530000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  227  			compatible = "samsung,exynos7870-pinctrl";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  228  			reg = <0x10530000 0x1000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  229  			interrupts = <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  230  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  231  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  232  		gpu: gpu@11400000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  233  			compatible = "samsung,exynos7870-mali", "arm,mali-t830";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  234  			reg = <0x11400000 0x5000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  235  			interrupt-names = "job", "mmu", "gpu";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  236  			interrupts = <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  237  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  238  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  239  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  240  			clock-names = "core", "bus";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  241  			clocks = <&cmu_g3d CLK_GOUT_G3D_CLK>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  242  				 <&cmu_g3d CLK_GOUT_G3D_ASYNCS_D0_CLK>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  243  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  244  			status = "disabled";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  245  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  246  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  247  		cmu_g3d: clock-controller@11460000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  248  			compatible = "samsung,exynos7870-cmu-g3d";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  249  			reg = <0x11460000 0x1000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  250  			#clock-cells = <1>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  251  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  252  			clock-names = "oscclk", "switch";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  253  			clocks = <&oscclk>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  254  				 <&cmu_mif CLK_GOUT_MIF_CMU_G3D_SWITCH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  255  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  256  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  257  		cmu_mfcmscl: clock-controller@12cb0000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  258  			compatible = "samsung,exynos7870-cmu-mfcmscl";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  259  			reg = <0x12cb0000 0x1000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  260  			#clock-cells = <1>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  261  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  262  			clock-names = "oscclk", "mfc", "mscl";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  263  			clocks = <&oscclk>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  264  				 <&cmu_mif CLK_GOUT_MIF_CMU_MFCMSCL_MFC>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  265  				 <&cmu_mif CLK_GOUT_MIF_CMU_MFCMSCL_MSCL>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  266  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  267  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  268  		mmc0: mmc@13540000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  269  			compatible = "samsung,exynos7870-dw-mshc-smu";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  270  			reg = <0x13540000 0x2000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  271  			interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  272  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  273  			clock-names = "biu", "ciu";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  274  			clocks = <&cmu_fsys CLK_GOUT_FSYS_MMC0_ACLK>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  275  				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_MMC0>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  276  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  277  			status = "disabled";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  278  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  279  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  280  		mmc1: mmc@13550000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  281  			compatible = "samsung,exynos7870-dw-mshc-smu";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  282  			reg = <0x13550000 0x2000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  283  			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  284  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  285  			clock-names = "biu", "ciu";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  286  			clocks = <&cmu_fsys CLK_GOUT_FSYS_MMC1_ACLK>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  287  				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_MMC1>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  288  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  289  			status = "disabled";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  290  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  291  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  292  		mmc2: mmc@13560000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  293  			compatible = "samsung,exynos7870-dw-mshc-smu";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  294  			reg = <0x13560000 0x2000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  295  			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  296  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  297  			clock-names = "biu", "ciu";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  298  			clocks = <&cmu_fsys CLK_GOUT_FSYS_MMC2_ACLK>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  299  				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_MMC2>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  300  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  301  			status = "disabled";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  302  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  303  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  304  		usbdrd_phy: phy@135c0000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  305  			compatible = "samsung,exynos7870-usbdrd-phy";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  306  			reg = <0x135c0000 0x100>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  307  			#phy-cells = <1>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  308  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  309  			clock-names = "phy", "ref";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  310  			clocks = <&cmu_fsys CLK_GOUT_FSYS_MUX_USB20DRD_PHYCLOCK_USER>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  311  				 <&cmu_fsys CLK_GOUT_FSYS_MUX_USB_PLL>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  312  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  313  			samsung,pmu-syscon = <&pmu_system_controller>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  314  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  315  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  316  		usbdrd: usb@13600000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  317  			compatible = "samsung,exynos7870-dwusb3";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  318  			ranges = <0x0 0x13600000 0x10000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  319  			#address-cells = <1>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  320  			#size-cells = <1>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  321  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  322  			clock-names = "bus_early", "ref", "ctrl";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  323  			clocks = <&cmu_fsys CLK_GOUT_FSYS_USB20DRD_ACLK_HSDRD>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  324  				 <&cmu_fsys CLK_GOUT_FSYS_USB20DRD_HSDRD_REF_CLK>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  325  				 <&cmu_fsys CLK_GOUT_FSYS_USB20DRD_HCLK_USB20_CTRL>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  326  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  327  			status = "disabled";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  328  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  329  			usb@0 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  330  				compatible = "snps,dwc3";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  331  				reg = <0x0 0x10000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  332  				interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  333  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  334  				phy-names = "usb2-phy";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  335  				phys = <&usbdrd_phy 0>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  336  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  337  				usb-role-switch;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  338  			};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  339  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  340  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  341  		cmu_fsys: clock-controller@13730000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  342  			compatible = "samsung,exynos7870-cmu-fsys";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  343  			reg = <0x13730000 0x1000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  344  			#clock-cells = <1>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  345  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  346  			clock-names = "oscclk", "bus", "usb20drd";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  347  			clocks = <&oscclk>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  348  				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_BUS>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  349  				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_USB20DRD_REFCLK>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  350  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  351  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  352  		pinctrl_fsys: pinctrl@13750000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  353  			compatible = "samsung,exynos7870-pinctrl";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  354  			reg = <0x13750000 0x1000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  355  			interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  356  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  357  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  358  		serial0: serial@13800000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  359  			compatible = "samsung,exynos7870-uart",
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  360  				     "samsung,exynos8895-uart";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  361  			reg = <0x13800000 0x100>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  362  			interrupts = <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  363  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  364  			pinctrl-names = "default";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  365  			pinctrl-0 = <&uart0_bus>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  366  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  367  			clock-names = "uart", "clk_uart_baud0";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  368  			clocks = <&cmu_peri CLK_GOUT_PERI_UART0_PCLK>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  369  				 <&cmu_peri CLK_GOUT_PERI_UART0_EXT_UCLK>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  370  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  371  			samsung,uart-fifosize = <16>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  372  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  373  			status = "disabled";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  374  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  375  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  376  		serial1: serial@13810000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  377  			compatible = "samsung,exynos7870-uart",
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  378  				     "samsung,exynos8895-uart";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  379  			reg = <0x13810000 0x100>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  380  			interrupts = <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  381  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  382  			pinctrl-names = "default";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  383  			pinctrl-0 = <&uart1_bus>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  384  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  385  			clock-names = "uart", "clk_uart_baud0";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  386  			clocks = <&cmu_peri CLK_GOUT_PERI_UART1_PCLK>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  387  				 <&cmu_peri CLK_GOUT_PERI_UART1_EXT_UCLK>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  388  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  389  			samsung,uart-fifosize = <256>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  390  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  391  			status = "disabled";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  392  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  393  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  394  		serial2: serial@13820000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  395  			compatible = "samsung,exynos7870-uart",
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  396  				     "samsung,exynos8895-uart";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  397  			reg = <0x13820000 0x100>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  398  			interrupts = <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  399  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  400  			pinctrl-names = "default";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  401  			pinctrl-0 = <&uart2_bus>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  402  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  403  			clock-names = "uart", "clk_uart_baud0";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  404  			clocks = <&cmu_peri CLK_GOUT_PERI_UART2_PCLK>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  405  				 <&cmu_peri CLK_GOUT_PERI_UART2_EXT_UCLK>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  406  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  407  			samsung,uart-fifosize = <256>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  408  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  409  			status = "disabled";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  410  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  411  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  412  		i2c0: i2c@13830000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  413  			compatible = "samsung,exynos7870-i2c",
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  414  				     "samsung,s3c2440-i2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  415  			reg = <0x13830000 0x100>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  416  			interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  417  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  418  			pinctrl-names = "default";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  419  			pinctrl-0 = <&i2c0_bus>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  420  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  421  			clock-names = "i2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  422  			clocks = <&cmu_peri CLK_GOUT_PERI_I2C0_PCLK>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  423  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  424  			status = "disabled";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  425  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  426  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  427  		i2c1: i2c@13840000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  428  			compatible = "samsung,exynos7870-i2c",
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  429  				     "samsung,s3c2440-i2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  430  			reg = <0x13840000 0x100>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  431  			interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  432  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  433  			pinctrl-names = "default";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  434  			pinctrl-0 = <&i2c1_bus>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  435  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  436  			clock-names = "i2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  437  			clocks = <&cmu_peri CLK_GOUT_PERI_I2C1_PCLK>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  438  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  439  			status = "disabled";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  440  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  441  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  442  		i2c2: i2c@13850000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  443  			compatible = "samsung,exynos7870-i2c",
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  444  				     "samsung,s3c2440-i2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  445  			reg = <0x13850000 0x100>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  446  			interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  447  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  448  			pinctrl-names = "default";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  449  			pinctrl-0 = <&i2c2_bus>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  450  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  451  			clock-names = "i2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  452  			clocks = <&cmu_peri CLK_GOUT_PERI_I2C2_PCLK>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  453  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  454  			status = "disabled";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  455  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  456  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  457  		i2c3: i2c@13860000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  458  			compatible = "samsung,exynos7870-i2c",
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  459  				     "samsung,s3c2440-i2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  460  			reg = <0x13860000 0x100>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  461  			interrupts = <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  462  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  463  			pinctrl-names = "default";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  464  			pinctrl-0 = <&i2c3_bus>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  465  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  466  			clock-names = "i2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  467  			clocks = <&cmu_peri CLK_GOUT_PERI_I2C3_PCLK>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  468  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  469  			status = "disabled";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  470  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  471  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  472  		i2c4: i2c@13870000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  473  			compatible = "samsung,exynos7870-i2c",
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  474  				     "samsung,s3c2440-i2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  475  			reg = <0x13870000 0x100>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  476  			interrupts = <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  477  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  478  			pinctrl-names = "default";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  479  			pinctrl-0 = <&i2c4_bus>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  480  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  481  			clock-names = "i2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  482  			clocks = <&cmu_peri CLK_GOUT_PERI_I2C4_PCLK>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  483  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  484  			status = "disabled";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  485  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  486  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  487  		i2c5: i2c@13880000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  488  			compatible = "samsung,exynos7870-i2c",
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  489  				     "samsung,s3c2440-i2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  490  			reg = <0x13880000 0x100>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  491  			interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  492  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  493  			pinctrl-names = "default";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  494  			pinctrl-0 = <&i2c5_bus>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  495  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  496  			clock-names = "i2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  497  			clocks = <&cmu_peri CLK_GOUT_PERI_I2C5_PCLK>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  498  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  499  			status = "disabled";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  500  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  501  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  502  		i2c6: i2c@13890000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  503  			compatible = "samsung,exynos7870-i2c",
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  504  				     "samsung,s3c2440-i2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  505  			reg = <0x13890000 0x100>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  506  			interrupts = <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  507  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  508  			pinctrl-names = "default";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  509  			pinctrl-0 = <&i2c6_bus>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  510  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  511  			clock-names = "i2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  512  			clocks = <&cmu_peri CLK_GOUT_PERI_I2C6_PCLK>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  513  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  514  			status = "disabled";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  515  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  516  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  517  		hsi2c1: i2c@138a0000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  518  			compatible = "samsung,exynos7870-hsi2c",
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  519  				     "samsung,exynos7-hsi2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  520  			reg = <0x138a0000 0x1000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  521  			interrupts = <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  522  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  523  			pinctrl-names = "default";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  524  			pinctrl-0 = <&hsi2c1_bus>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  525  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  526  			clock-names = "hsi2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  527  			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C1_IPCLK>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  528  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  529  			status = "disabled";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  530  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  531  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  532  		hsi2c2: i2c@138b0000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  533  			compatible = "samsung,exynos7870-hsi2c",
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  534  				     "samsung,exynos7-hsi2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  535  			reg = <0x138b0000 0x1000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  536  			interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  537  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  538  			pinctrl-names = "default";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  539  			pinctrl-0 = <&hsi2c2_bus>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  540  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  541  			clock-names = "hsi2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  542  			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C2_IPCLK>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  543  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  544  			status = "disabled";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  545  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  546  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  547  		hsi2c3: i2c@138c0000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  548  			compatible = "samsung,exynos7870-hsi2c",
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  549  				     "samsung,exynos7-hsi2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  550  			reg = <0x138c0000 0x1000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  551  			interrupts = <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  552  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  553  			pinctrl-names = "default";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  554  			pinctrl-0 = <&hsi2c3_bus>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  555  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  556  			clock-names = "hsi2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  557  			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C3_IPCLK>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  558  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  559  			status = "disabled";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  560  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  561  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  562  		i2c7: i2c@138d0000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  563  			compatible = "samsung,exynos7870-i2c",
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  564  				     "samsung,s3c2440-i2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  565  			reg = <0x138d0000 0x100>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  566  			interrupts = <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  567  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  568  			pinctrl-names = "default";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  569  			pinctrl-0 = <&i2c7_bus>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  570  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  571  			clock-names = "i2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  572  			clocks = <&cmu_peri CLK_GOUT_PERI_I2C7_PCLK>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  573  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  574  			status = "disabled";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  575  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  576  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  577  		i2c8: i2c@138e0000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  578  			compatible = "samsung,exynos7870-i2c",
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  579  				     "samsung,s3c2440-i2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  580  			reg = <0x138e0000 0x100>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  581  			interrupts = <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  582  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  583  			pinctrl-names = "default";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  584  			pinctrl-0 = <&i2c8_bus>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  585  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  586  			clock-names = "i2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  587  			clocks = <&cmu_peri CLK_GOUT_PERI_I2C8_PCLK>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  588  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  589  			status = "disabled";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  590  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  591  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  592  		hsi2c4: i2c@138f0000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  593  			compatible = "samsung,exynos7870-hsi2c",
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  594  				     "samsung,exynos7-hsi2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  595  			reg = <0x138f0000 0x1000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  596  			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  597  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  598  			pinctrl-names = "default";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  599  			pinctrl-0 = <&hsi2c4_bus>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  600  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  601  			clock-names = "hsi2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  602  			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C4_IPCLK>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  603  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  604  			status = "disabled";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  605  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  606  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  607  		hsi2c5: i2c@13950000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  608  			compatible = "samsung,exynos7870-hsi2c",
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  609  				     "samsung,exynos7-hsi2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  610  			reg = <0x13950000 0x1000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  611  			interrupts = <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  612  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  613  			pinctrl-names = "default";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  614  			pinctrl-0 = <&hsi2c5_bus>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  615  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  616  			clock-names = "hsi2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  617  			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C5_IPCLK>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  618  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  619  			status = "disabled";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  620  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  621  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  622  		hsi2c6: i2c@13960000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  623  			compatible = "samsung,exynos7870-hsi2c",
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  624  				     "samsung,exynos7-hsi2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  625  			reg = <0x13960000 0x1000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  626  			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  627  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  628  			pinctrl-names = "default";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  629  			pinctrl-0 = <&hsi2c6_bus>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  630  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  631  			clock-names = "hsi2c";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  632  			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C6_IPCLK>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  633  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  634  			status = "disabled";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  635  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  636  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  637  		pinctrl_top: pinctrl@139b0000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  638  			compatible = "samsung,exynos7870-pinctrl";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  639  			reg = <0x139b0000 0x1000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  640  			interrupts = <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  641  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  642  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  643  		pinctrl_nfc: pinctrl@139c0000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  644  			compatible = "samsung,exynos7870-pinctrl";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  645  			reg = <0x139c0000 0x1000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  646  			interrupts = <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  647  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  648  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  649  		pinctrl_touch: pinctrl@139d0000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  650  			compatible = "samsung,exynos7870-pinctrl";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  651  			reg = <0x139d0000 0x1000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  652  			interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  653  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  654  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  655  		pinctrl_ese: pinctrl@139e0000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  656  			compatible = "samsung,exynos7870-pinctrl";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  657  			reg = <0x139e0000 0x1000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  658  			interrupts = <GIC_SPI 441 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  659  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  660  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  661  		pinctrl_alive: pinctrl@139f0000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  662  			compatible = "samsung,exynos7870-pinctrl";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  663  			reg = <0x139f0000 0x1000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  664  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  665  			wakeup-interrupt-controller {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  666  				compatible = "samsung,exynos7870-wakeup-eint",
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  667  					     "samsung,exynos7-wakeup-eint";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  668  				interrupt-parent = <&gic>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  669  				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  670  			};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  671  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  672  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  673  		cmu_isp: clock-controller@144d0000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  674  			compatible = "samsung,exynos7870-cmu-isp";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  675  			reg = <0x144d0000 0x1000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  676  			#clock-cells = <1>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  677  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  678  			clock-names = "oscclk", "cam", "isp", "vra";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  679  			clocks = <&oscclk>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  680  				 <&cmu_mif CLK_GOUT_MIF_CMU_ISP_CAM>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  681  				 <&cmu_mif CLK_GOUT_MIF_CMU_ISP_ISP>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  682  				 <&cmu_mif CLK_GOUT_MIF_CMU_ISP_VRA>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  683  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  684  
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  685  		syscon_cam0: syscon@144f1040 {
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  686  			compatible = "samsung,exynos7870-cam0-sysreg", "syscon";
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  687  			reg = <0x144f1040 0x04>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  688  		};
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  689  
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  690  		dsi: dsi@14800000 {
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  691  			compatible = "samsung,exynos7870-mipi-dsi";
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  692  			reg = <0x14800000 0x100>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  693  			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  694  
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  695  			clock-names = "bus", "pll", "byte", "esc";
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  696  			clocks = <&cmu_dispaud CLK_GOUT_DISPAUD_BUS_DISP>,
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  697  				 <&cmu_dispaud CLK_GOUT_DISPAUD_APB_DISP>,
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  698  				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_MIPIPHY_TXBYTECLKHS_USER>,
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  699  				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_MIPIPHY_RXCLKESC0_USER>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  700  
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  701  			phy-names = "dsim";
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  702  			phys = <&mipi_phy 1>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  703  
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  704  			status = "disabled";
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  705  
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27 @706  			ports {
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  707  				#address-cells = <1>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  708  				#size-cells = <0>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  709  
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  710  				port@0 {
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  711  					reg = <0>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  712  
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  713  					dsi_to_decon: endpoint {
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  714  						remote-endpoint = <&decon_to_dsi>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  715  					};
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  716  				};
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  717  			};
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  718  		};
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  719  
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  720  		decon: decon@14830000 {
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  721  			compatible = "samsung,exynos7870-decon";
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  722  			reg = <0x14830000 0x8000>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  723  			interrupt-names = "fifo", "vsync", "lcd_sys";
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  724  			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  725  				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  726  				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  727  
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  728  			clock-names = "pclk_decon0", "aclk_decon0",
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  729  				      "decon0_eclk", "decon0_vclk";
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  730  			clocks = <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_PLL>,
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  731  				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_BUS_USER>,
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  732  				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_DECON_ECLK>,
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  733  				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_DECON_VCLK>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  734  
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  735  			iommus = <&sysmmu_decon>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  736  
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  737  			status = "disabled";
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  738  
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27 @739  			ports {
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  740  				#address-cells = <1>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  741  				#size-cells = <0>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  742  
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  743  				port@0 {
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  744  					reg = <0>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  745  					decon_to_dsi: endpoint {
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  746  						remote-endpoint = <&dsi_to_decon>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  747  					};
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  748  				};
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  749  			};
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  750  		};
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  751  
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  752  		sysmmu_decon: sysmmu@14860000 {
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  753  			compatible = "samsung,exynos-sysmmu";
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  754  			reg = <0x14860000 0x1000>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  755  			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  756  			#iommu-cells = <0>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  757  
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  758  			clock-names = "sysmmu";
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  759  			clocks = <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_BUS_USER>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  760  		};
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  761  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  762  		pinctrl_dispaud: pinctrl@148c0000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  763  			compatible = "samsung,exynos7870-pinctrl";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  764  			reg = <0x148c0000 0x1000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  765  			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  766  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  767  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  768  		cmu_dispaud: clock-controller@148d0000 {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  769  			compatible = "samsung,exynos7870-cmu-dispaud";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  770  			reg = <0x148d0000 0x1000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  771  			#clock-cells = <1>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  772  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  773  			clock-names = "oscclk", "bus", "decon_eclk", "decon_vclk";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  774  			clocks = <&oscclk>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  775  				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_BUS>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  776  				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_DECON_ECLK>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  777  				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_DECON_VCLK>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  778  		};
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  779  
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  780  		syscon_disp: syscon@148f100c {
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  781  			compatible = "samsung,exynos7870-disp-sysreg", "syscon";
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  782  			reg = <0x148f100c 0x04>;
df7fecfe0a3c5a Kaustabh Chakraborty 2025-06-27  783  		};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  784  	};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  785  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  786  	timer {
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  787  		compatible = "arm,armv8-timer";
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  788  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  789  			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  790  			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  791  			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  792  
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  793  		/*
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  794  		 * Non-updatable, broken stock Samsung bootloader does not
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  795  		 * configure CNTFRQ_EL0
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  796  		 */
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  797  		clock-frequency = <26000000>;
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  798  	};
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  799  };
d6f3a7f91fdb84 Kaustabh Chakraborty 2025-05-01  800  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
