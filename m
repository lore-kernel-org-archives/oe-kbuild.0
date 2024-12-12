Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60F51EB39
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Dec 2024 01:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733967108; cv=none; b=CCYXgVLDZ/1gno/Si+N7RBEB35OjODtNdIUdiE232qkUIDdjLqlztWmRz2y9UHZV6JjwsqXf78VUQFF8EqC1nV8MStmOW7q5ec0JS9bWVvezRC0A/iAwH7BkK5Qoc7lMZudXnYIWw/DaA/1GceNryJNb2hMirjgHv+R7qbieiUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733967108; c=relaxed/simple;
	bh=2dVPmhWZN1dZh2/JHLfQ8AT5WfzWL9+XevgEgdxDd4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hiDtdlJw7e52UOLlL5Ox7wLszJprceVUHZ+icWjQKoCiUeb6LcNAJKl9lKrOUlQpjUH9tLNpmlrTVOFmEq7IktBoR3zHM3GCtkdfZyKBxUHpfrivXQv/aWReI+R6npVGi4dx8uDyN5rg7EqjdXCS6bPp/do1pK6ZZNEAuxt6ZJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQD7j8db; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQD7j8db"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733967107; x=1765503107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2dVPmhWZN1dZh2/JHLfQ8AT5WfzWL9+XevgEgdxDd4g=;
  b=hQD7j8dbU8qQPRlkNom9PIEG/NPHEvrLgDs+A1nAXXKjhvPsZxAYxY2Z
   fNeEecY+VbZCLyUADhof+gmRn4CHvzqdS1cw0IUGuogy9qnCdLTKGKdHR
   erntXrepzzus6fJKV7Yu5Rec31shjFgzh9X5a8aHOA1lfPku/sE0xzKCs
   YXHLNPNlh8/aRsOFy+yrcbrtnjAzWdIYvo0zAR2dmdbSvwBvyhcIOiqd5
   e3KoUbaFJ8FbEYFhOv0HVeC5ffZlLwRYbQPQIS64ttIEmkYNzoLMnRIAp
   s9B+iqgUED4wL9T+Iw8Ne52IZPUIHUXHB+4vWdOBCj9uDbztNUZW504YB
   A==;
X-CSE-ConnectionGUID: PwzpLuMFRWS2SeGDCYRqNg==
X-CSE-MsgGUID: IXr0SImdTQeYIZkVTbG0RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="38055994"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="38055994"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 17:31:44 -0800
X-CSE-ConnectionGUID: 06DbA1LcQo2vPYF7AfIqFg==
X-CSE-MsgGUID: gAo8ci6GSKqnBKgy/guldQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="95906852"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Dec 2024 17:31:42 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLY3H-0007ID-2F;
	Thu, 12 Dec 2024 01:31:39 +0000
Date: Thu, 12 Dec 2024 09:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC 3/3] arm64: dts: amlogic: a4: add pinctrl node
Message-ID: <202412120919.4brJ7pEm-lkp@intel.com>
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
In-Reply-To: <20241211-amlogic-pinctrl-v1-3-410727335119@amlogic.com>
References: <20241211-amlogic-pinctrl-v1-3-410727335119@amlogic.com>
TO: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>

Hi Xianwei,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 171aa289a6fe65faffeb92a1fda283c055435a62]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-pinctrl-Add-support-for-Amlogic-SoCs/20241211-144931
base:   171aa289a6fe65faffeb92a1fda283c055435a62
patch link:    https://lore.kernel.org/r/20241211-amlogic-pinctrl-v1-3-410727335119%40amlogic.com
patch subject: [PATCH RFC 3/3] arm64: dts: amlogic: a4: add pinctrl node
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241212/202412120919.4brJ7pEm-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 2dc22615fd46ab2566d0f26d5ba234ab12dc4bf8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120919.4brJ7pEm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412120919.4brJ7pEm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi:54.32-165.4: Warning (avoid_unnecessary_addr_size): /soc/bus@fe000000/pinctrl@4000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi:167.31-195.4: Warning (avoid_unnecessary_addr_size): /soc/bus@fe000000/pinctrl@8e700: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +54 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi

e842bf689ac7022 Xianwei Zhao 2024-12-11   52  
e842bf689ac7022 Xianwei Zhao 2024-12-11   53  &apb {
e842bf689ac7022 Xianwei Zhao 2024-12-11  @54  	periphs_pinctrl: pinctrl@4000 {
e842bf689ac7022 Xianwei Zhao 2024-12-11   55  		compatible = "amlogic,pinctrl";
e842bf689ac7022 Xianwei Zhao 2024-12-11   56  		reg = <0x0 0x4000 0x0 0x0050>,
e842bf689ac7022 Xianwei Zhao 2024-12-11   57  		      <0x0 0x40c0 0x0 0x0220>;
e842bf689ac7022 Xianwei Zhao 2024-12-11   58  		reg-names = "mux", "gpio";
e842bf689ac7022 Xianwei Zhao 2024-12-11   59  		#address-cells = <2>;
e842bf689ac7022 Xianwei Zhao 2024-12-11   60  		#size-cells = <2>;
e842bf689ac7022 Xianwei Zhao 2024-12-11   61  
e842bf689ac7022 Xianwei Zhao 2024-12-11   62  		gpiob: gpiob {
e842bf689ac7022 Xianwei Zhao 2024-12-11   63  			gpio-controller;
e842bf689ac7022 Xianwei Zhao 2024-12-11   64  			#gpio-cells = <2>;
e842bf689ac7022 Xianwei Zhao 2024-12-11   65  			npins = <14>;
e842bf689ac7022 Xianwei Zhao 2024-12-11   66  			bank-index = <AMLOGIC_GPIO_B>;
e842bf689ac7022 Xianwei Zhao 2024-12-11   67  			reg-mux-offset = <0>;
e842bf689ac7022 Xianwei Zhao 2024-12-11   68  			reg-gpio-offset = <0x60>;
e842bf689ac7022 Xianwei Zhao 2024-12-11   69  			bank-name = "GPIOB";
e842bf689ac7022 Xianwei Zhao 2024-12-11   70  		};
e842bf689ac7022 Xianwei Zhao 2024-12-11   71  
e842bf689ac7022 Xianwei Zhao 2024-12-11   72  		gpiod: gpiod {
e842bf689ac7022 Xianwei Zhao 2024-12-11   73  			gpio-controller;
e842bf689ac7022 Xianwei Zhao 2024-12-11   74  			#gpio-cells = <2>;
e842bf689ac7022 Xianwei Zhao 2024-12-11   75  			npins = <16>;
e842bf689ac7022 Xianwei Zhao 2024-12-11   76  			bank-index = <AMLOGIC_GPIO_D>;
e842bf689ac7022 Xianwei Zhao 2024-12-11   77  			reg-mux-offset = <0x10>;
e842bf689ac7022 Xianwei Zhao 2024-12-11   78  			reg-gpio-offset = <0x30>;
e842bf689ac7022 Xianwei Zhao 2024-12-11   79  			bank-name = "GPIOD";
e842bf689ac7022 Xianwei Zhao 2024-12-11   80  		};
e842bf689ac7022 Xianwei Zhao 2024-12-11   81  
e842bf689ac7022 Xianwei Zhao 2024-12-11   82  		gpioe: gpioe {
e842bf689ac7022 Xianwei Zhao 2024-12-11   83  			gpio-controller;
e842bf689ac7022 Xianwei Zhao 2024-12-11   84  			#gpio-cells = <2>;
e842bf689ac7022 Xianwei Zhao 2024-12-11   85  			npins = <2>;
e842bf689ac7022 Xianwei Zhao 2024-12-11   86  			bank-index = <AMLOGIC_GPIO_E>;
e842bf689ac7022 Xianwei Zhao 2024-12-11   87  			reg-mux-offset = <0x12>;
e842bf689ac7022 Xianwei Zhao 2024-12-11   88  			reg-gpio-offset = <0x40>;
e842bf689ac7022 Xianwei Zhao 2024-12-11   89  			bank-name = "GPIOE";
e842bf689ac7022 Xianwei Zhao 2024-12-11   90  		};
e842bf689ac7022 Xianwei Zhao 2024-12-11   91  
e842bf689ac7022 Xianwei Zhao 2024-12-11   92  		gpiot: gpiot {
e842bf689ac7022 Xianwei Zhao 2024-12-11   93  			gpio-controller;
e842bf689ac7022 Xianwei Zhao 2024-12-11   94  			#gpio-cells = <2>;
e842bf689ac7022 Xianwei Zhao 2024-12-11   95  			npins = <23>;
e842bf689ac7022 Xianwei Zhao 2024-12-11   96  			bank-index = <AMLOGIC_GPIO_T>;
e842bf689ac7022 Xianwei Zhao 2024-12-11   97  			reg-mux-offset = <0xb>;
e842bf689ac7022 Xianwei Zhao 2024-12-11   98  			reg-gpio-offset = <0x20>;
e842bf689ac7022 Xianwei Zhao 2024-12-11   99  			bank-name = "GPIOT";
e842bf689ac7022 Xianwei Zhao 2024-12-11  100  		};
e842bf689ac7022 Xianwei Zhao 2024-12-11  101  
e842bf689ac7022 Xianwei Zhao 2024-12-11  102  		gpiox: gpiox {
e842bf689ac7022 Xianwei Zhao 2024-12-11  103  			gpio-controller;
e842bf689ac7022 Xianwei Zhao 2024-12-11  104  			#gpio-cells = <2>;
e842bf689ac7022 Xianwei Zhao 2024-12-11  105  			npins = <18>;
e842bf689ac7022 Xianwei Zhao 2024-12-11  106  			bank-index = <AMLOGIC_GPIO_X>;
e842bf689ac7022 Xianwei Zhao 2024-12-11  107  			reg-mux-offset = <0x3>;
e842bf689ac7022 Xianwei Zhao 2024-12-11  108  			reg-gpio-offset = <0x10>;
e842bf689ac7022 Xianwei Zhao 2024-12-11  109  			bank-name = "GPIOX";
e842bf689ac7022 Xianwei Zhao 2024-12-11  110  		};
e842bf689ac7022 Xianwei Zhao 2024-12-11  111  
e842bf689ac7022 Xianwei Zhao 2024-12-11  112  		func-uart-a {
e842bf689ac7022 Xianwei Zhao 2024-12-11  113  			uart_a_default: uart-a-pins1{
e842bf689ac7022 Xianwei Zhao 2024-12-11  114  				pinmux= <AML_PINMUX(AMLOGIC_GPIO_X, 11, AF1)>,
e842bf689ac7022 Xianwei Zhao 2024-12-11  115  					<AML_PINMUX(AMLOGIC_GPIO_X, 12, AF1)>,
e842bf689ac7022 Xianwei Zhao 2024-12-11  116  					<AML_PINMUX(AMLOGIC_GPIO_X, 13, AF1)>,
e842bf689ac7022 Xianwei Zhao 2024-12-11  117  					<AML_PINMUX(AMLOGIC_GPIO_X, 13, AF1)>;
e842bf689ac7022 Xianwei Zhao 2024-12-11  118  			};
e842bf689ac7022 Xianwei Zhao 2024-12-11  119  
e842bf689ac7022 Xianwei Zhao 2024-12-11  120  			uart-a-pins2{
e842bf689ac7022 Xianwei Zhao 2024-12-11  121  				pinmux= <AML_PINMUX(AMLOGIC_GPIO_D, 2, AF3)>,
e842bf689ac7022 Xianwei Zhao 2024-12-11  122  					<AML_PINMUX(AMLOGIC_GPIO_D, 3, AF3)>;
e842bf689ac7022 Xianwei Zhao 2024-12-11  123  				bias-pull-up;
e842bf689ac7022 Xianwei Zhao 2024-12-11  124  				drive-strength-microamp = <4000>;
e842bf689ac7022 Xianwei Zhao 2024-12-11  125  			};
e842bf689ac7022 Xianwei Zhao 2024-12-11  126  		};
e842bf689ac7022 Xianwei Zhao 2024-12-11  127  
e842bf689ac7022 Xianwei Zhao 2024-12-11  128  		func-uart-b {
e842bf689ac7022 Xianwei Zhao 2024-12-11  129  			uart_b_default: uart-b-default{
e842bf689ac7022 Xianwei Zhao 2024-12-11  130  				pinmux= <AML_PINMUX(AMLOGIC_GPIO_E, 0, AF3)>,
e842bf689ac7022 Xianwei Zhao 2024-12-11  131  					<AML_PINMUX(AMLOGIC_GPIO_E, 1, AF3)>;
e842bf689ac7022 Xianwei Zhao 2024-12-11  132  				bias-pull-up;
e842bf689ac7022 Xianwei Zhao 2024-12-11  133  				drive-strength-microamp = <4000>;
e842bf689ac7022 Xianwei Zhao 2024-12-11  134  			};
e842bf689ac7022 Xianwei Zhao 2024-12-11  135  		};
e842bf689ac7022 Xianwei Zhao 2024-12-11  136  
e842bf689ac7022 Xianwei Zhao 2024-12-11  137  		func-uart-d {
e842bf689ac7022 Xianwei Zhao 2024-12-11  138  			uart_d_default: uart-d-pins1{
e842bf689ac7022 Xianwei Zhao 2024-12-11  139  				pinmux= <AML_PINMUX(AMLOGIC_GPIO_T, 18, AF4)>,
e842bf689ac7022 Xianwei Zhao 2024-12-11  140  					<AML_PINMUX(AMLOGIC_GPIO_T, 19, AF4)>;
e842bf689ac7022 Xianwei Zhao 2024-12-11  141  				bias-pull-up;
e842bf689ac7022 Xianwei Zhao 2024-12-11  142  				drive-strength-microamp = <4000>;
e842bf689ac7022 Xianwei Zhao 2024-12-11  143  			};
e842bf689ac7022 Xianwei Zhao 2024-12-11  144  
e842bf689ac7022 Xianwei Zhao 2024-12-11  145  			uart-d-pins2{
e842bf689ac7022 Xianwei Zhao 2024-12-11  146  				pinmux= <AML_PINMUX(AMLOGIC_GPIO_T, 7, AF2)>,
e842bf689ac7022 Xianwei Zhao 2024-12-11  147  					<AML_PINMUX(AMLOGIC_GPIO_T, 8, AF2)>,
e842bf689ac7022 Xianwei Zhao 2024-12-11  148  					<AML_PINMUX(AMLOGIC_GPIO_T, 9, AF2)>,
e842bf689ac7022 Xianwei Zhao 2024-12-11  149  					<AML_PINMUX(AMLOGIC_GPIO_T, 10, AF2)>;
e842bf689ac7022 Xianwei Zhao 2024-12-11  150  				bias-pull-up;
e842bf689ac7022 Xianwei Zhao 2024-12-11  151  				drive-strength-microamp = <4000>;
e842bf689ac7022 Xianwei Zhao 2024-12-11  152  			};
e842bf689ac7022 Xianwei Zhao 2024-12-11  153  		};
e842bf689ac7022 Xianwei Zhao 2024-12-11  154  
e842bf689ac7022 Xianwei Zhao 2024-12-11  155  		func-uart-e {
e842bf689ac7022 Xianwei Zhao 2024-12-11  156  			uart_e_default: uart-e-pins{
e842bf689ac7022 Xianwei Zhao 2024-12-11  157  				pinmux= <AML_PINMUX(AMLOGIC_GPIO_T, 14, AF3)>,
e842bf689ac7022 Xianwei Zhao 2024-12-11  158  					<AML_PINMUX(AMLOGIC_GPIO_T, 15, AF3)>,
e842bf689ac7022 Xianwei Zhao 2024-12-11  159  					<AML_PINMUX(AMLOGIC_GPIO_T, 16, AF3)>,
e842bf689ac7022 Xianwei Zhao 2024-12-11  160  					<AML_PINMUX(AMLOGIC_GPIO_T, 17, AF3)>;
e842bf689ac7022 Xianwei Zhao 2024-12-11  161  				bias-pull-up;
e842bf689ac7022 Xianwei Zhao 2024-12-11  162  				drive-strength-microamp = <4000>;
e842bf689ac7022 Xianwei Zhao 2024-12-11  163  			};
e842bf689ac7022 Xianwei Zhao 2024-12-11  164  		};
e842bf689ac7022 Xianwei Zhao 2024-12-11  165  	};
e842bf689ac7022 Xianwei Zhao 2024-12-11  166  
e842bf689ac7022 Xianwei Zhao 2024-12-11 @167  	aobus_pinctrl: pinctrl@8e700 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
