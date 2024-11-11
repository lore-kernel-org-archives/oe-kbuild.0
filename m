Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AB320B22
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Nov 2024 08:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731312836; cv=none; b=utSsfooKbKJ4W7znCJ8XSCxcymv5KaT8e0p38Uc6Z6iUy37C+2F4mwhMlZp3GywTIh8z0IMjEsdQC0yd14SJMXSfETvTMPgmaA3LfLYjJjWcPDwe+F5RSWZlgaCg3AQJRea99+HBCZccIEP3tuhQSvG/a5Cepgn1UWu32uxb670=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731312836; c=relaxed/simple;
	bh=BzAqHcVM9GXOdaSWANLneg0ydcBHt/Gg8g7yThbUJHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k0DJ79uG+h7ox364YbTnjqcEak0MONT0gAKuCdelud7syqI09lpGUa2chskdEoTA8pbYk9Q5iaaQm1nqv0q72UXIW6491bJ2GfV/iApJFdNq5AxHRofo+gSyQbdiBHukCbLOxJBlBBjtrsNtIfzw0njoIspf9IL/jwlRILiN8A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AfCQcIzP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AfCQcIzP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731312834; x=1762848834;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BzAqHcVM9GXOdaSWANLneg0ydcBHt/Gg8g7yThbUJHI=;
  b=AfCQcIzP8tvd9IUA2IAYqmOso3FoiR1lJFjiKQJQT68BEl4FsvLaFoII
   iTs+Zp8cE7X57iKefWUOTDJCOgGPD+HWd67CnGbVATg8DjTU9DdMr1wH4
   uOBO4oO7baisH6hlZ/2frf5hpWf+tLItPYvgtuSA+kAZ02JwCxeGyHbsy
   5pRLC1fPTIRUJVrIWmw1IOtF1iBdDoEpi8MxgeghSUzZSEAuQwFL00dHq
   M7DeynrObeu9ZFqP9/9SAK18FrN06rgyR2Xq8W2yinW/0GfhJZjCoEWk8
   lcYmPlPA+7R6YCsG95t3jlYVr3o6Fa4O8BCy49MtbsP5Wo5XJa88vN0h2
   g==;
X-CSE-ConnectionGUID: 9yzEOpJJSLuHxSV/zUhyxw==
X-CSE-MsgGUID: KGI9ELz1S/KsBCVu/PfLrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30879222"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30879222"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:13:54 -0800
X-CSE-ConnectionGUID: q+OTedOsRiKsBLvECp/Pzg==
X-CSE-MsgGUID: VoUjBfxeSROj9FERKDd/8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="117714107"
Received: from lkp-server01.sh.intel.com (HELO dc8184e5aea1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Nov 2024 00:13:52 -0800
Received: from kbuild by dc8184e5aea1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAPYT-00006v-2N;
	Mon, 11 Nov 2024 08:13:49 +0000
Date: Mon, 11 Nov 2024 16:13:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/5] riscv: sophgo: dts: add pcie controllers for SG2042
Message-ID: <202411111536.13Umjjra-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: arch/riscv/boot/dts/sophgo/sg2042.dtsi:198.29-219.5: ERROR (phandle_references): /soc/pcie@7060000000: Reference to non-existent node or label "msi""
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <c8d05d3a4cf620ec4fcbf1050dea7c77f834c87a.1731303328.git.unicorn_wang@outlook.com>
References: <c8d05d3a4cf620ec4fcbf1050dea7c77f834c87a.1731303328.git.unicorn_wang@outlook.com>
TO: Chen Wang <unicornxw@gmail.com>
TO: kw@linux.com
TO: u.kleine-koenig@baylibre.com
TO: aou@eecs.berkeley.edu
TO: arnd@arndb.de
TO: bhelgaas@google.com
TO: unicorn_wang@outlook.com
TO: conor+dt@kernel.org
TO: guoren@kernel.org
TO: inochiama@outlook.com
TO: krzk+dt@kernel.org
TO: lee@kernel.org
TO: lpieralisi@kernel.org
TO: manivannan.sadhasivam@linaro.org
TO: palmer@dabbelt.com
TO: paul.walmsley@sifive.com
TO: pbrobinson@gmail.com
TO: robh@kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-pci@vger.kernel.org
TO: linux-riscv@lists.infradead.org
TO: chao.wei@sophgo.com
TO: xiaoguang.xing@sophgo.com
TO: fengchun.li@sophgo.com

Hi Chen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2d5404caa8c7bb5c4e0435f94b28834ae5456623]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Wang/dt-bindings-pci-Add-Sophgo-SG2042-PCIe-host/20241111-140237
base:   2d5404caa8c7bb5c4e0435f94b28834ae5456623
patch link:    https://lore.kernel.org/r/c8d05d3a4cf620ec4fcbf1050dea7c77f834c87a.1731303328.git.unicorn_wang%40outlook.com
patch subject: [PATCH 4/5] riscv: sophgo: dts: add pcie controllers for SG2042
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: riscv-randconfig-051-20241111 (https://download.01.org/0day-ci/archive/20241111/202411111536.13Umjjra-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.11
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241111/202411111536.13Umjjra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411111536.13Umjjra-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/sophgo/sg2042.dtsi:198.29-219.5: ERROR (phandle_references): /soc/pcie@7060000000: Reference to non-existent node or label "msi"

vim +/msi +198 arch/riscv/boot/dts/sophgo/sg2042.dtsi

967a94a92aaaaf Chen Wang        2023-10-07   14  
967a94a92aaaaf Chen Wang        2023-10-07   15  / {
967a94a92aaaaf Chen Wang        2023-10-07   16  	compatible = "sophgo,sg2042";
967a94a92aaaaf Chen Wang        2023-10-07   17  	#address-cells = <2>;
967a94a92aaaaf Chen Wang        2023-10-07   18  	#size-cells = <2>;
967a94a92aaaaf Chen Wang        2023-10-07   19  	dma-noncoherent;
967a94a92aaaaf Chen Wang        2023-10-07   20  
967a94a92aaaaf Chen Wang        2023-10-07   21  	aliases {
967a94a92aaaaf Chen Wang        2023-10-07   22  		serial0 = &uart0;
967a94a92aaaaf Chen Wang        2023-10-07   23  	};
967a94a92aaaaf Chen Wang        2023-10-07   24  
b1240a39511b92 Chen Wang        2023-11-24   25  	cgi_main: oscillator0 {
b1240a39511b92 Chen Wang        2023-11-24   26  		compatible = "fixed-clock";
b1240a39511b92 Chen Wang        2023-11-24   27  		clock-output-names = "cgi_main";
b1240a39511b92 Chen Wang        2023-11-24   28  		#clock-cells = <0>;
b1240a39511b92 Chen Wang        2023-11-24   29  	};
b1240a39511b92 Chen Wang        2023-11-24   30  
b1240a39511b92 Chen Wang        2023-11-24   31  	cgi_dpll0: oscillator1 {
b1240a39511b92 Chen Wang        2023-11-24   32  		compatible = "fixed-clock";
b1240a39511b92 Chen Wang        2023-11-24   33  		clock-output-names = "cgi_dpll0";
b1240a39511b92 Chen Wang        2023-11-24   34  		#clock-cells = <0>;
b1240a39511b92 Chen Wang        2023-11-24   35  	};
b1240a39511b92 Chen Wang        2023-11-24   36  
b1240a39511b92 Chen Wang        2023-11-24   37  	cgi_dpll1: oscillator2 {
b1240a39511b92 Chen Wang        2023-11-24   38  		compatible = "fixed-clock";
b1240a39511b92 Chen Wang        2023-11-24   39  		clock-output-names = "cgi_dpll1";
b1240a39511b92 Chen Wang        2023-11-24   40  		#clock-cells = <0>;
b1240a39511b92 Chen Wang        2023-11-24   41  	};
b1240a39511b92 Chen Wang        2023-11-24   42  
967a94a92aaaaf Chen Wang        2023-10-07   43  	soc: soc {
967a94a92aaaaf Chen Wang        2023-10-07   44  		compatible = "simple-bus";
967a94a92aaaaf Chen Wang        2023-10-07   45  		#address-cells = <2>;
967a94a92aaaaf Chen Wang        2023-10-07   46  		#size-cells = <2>;
5d9e6bc82bd070 Inochi Amaoto    2024-07-29   47  		interrupt-parent = <&intc>;
967a94a92aaaaf Chen Wang        2023-10-07   48  		ranges;
967a94a92aaaaf Chen Wang        2023-10-07   49  
c8eb04aecdd4df Inochi Amaoto    2024-07-29   50  		i2c0: i2c@7030005000 {
c8eb04aecdd4df Inochi Amaoto    2024-07-29   51  			compatible = "snps,designware-i2c";
c8eb04aecdd4df Inochi Amaoto    2024-07-29   52  			reg = <0x70 0x30005000 0x0 0x1000>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   53  			#address-cells = <1>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   54  			#size-cells = <0>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   55  			clocks = <&clkgen GATE_CLK_APB_I2C>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   56  			clock-names = "ref";
c8eb04aecdd4df Inochi Amaoto    2024-07-29   57  			clock-frequency = <100000>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   58  			interrupts = <101 IRQ_TYPE_LEVEL_HIGH>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   59  			resets = <&rstgen RST_I2C0>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   60  			status = "disabled";
c8eb04aecdd4df Inochi Amaoto    2024-07-29   61  		};
c8eb04aecdd4df Inochi Amaoto    2024-07-29   62  
c8eb04aecdd4df Inochi Amaoto    2024-07-29   63  		i2c1: i2c@7030006000 {
c8eb04aecdd4df Inochi Amaoto    2024-07-29   64  			compatible = "snps,designware-i2c";
c8eb04aecdd4df Inochi Amaoto    2024-07-29   65  			reg = <0x70 0x30006000 0x0 0x1000>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   66  			#address-cells = <1>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   67  			#size-cells = <0>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   68  			clocks = <&clkgen GATE_CLK_APB_I2C>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   69  			clock-names = "ref";
c8eb04aecdd4df Inochi Amaoto    2024-07-29   70  			clock-frequency = <100000>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   71  			interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   72  			resets = <&rstgen RST_I2C1>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   73  			status = "disabled";
c8eb04aecdd4df Inochi Amaoto    2024-07-29   74  		};
c8eb04aecdd4df Inochi Amaoto    2024-07-29   75  
c8eb04aecdd4df Inochi Amaoto    2024-07-29   76  		i2c2: i2c@7030007000 {
c8eb04aecdd4df Inochi Amaoto    2024-07-29   77  			compatible = "snps,designware-i2c";
c8eb04aecdd4df Inochi Amaoto    2024-07-29   78  			reg = <0x70 0x30007000 0x0 0x1000>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   79  			#address-cells = <1>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   80  			#size-cells = <0>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   81  			clocks = <&clkgen GATE_CLK_APB_I2C>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   82  			clock-names = "ref";
c8eb04aecdd4df Inochi Amaoto    2024-07-29   83  			clock-frequency = <100000>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   84  			interrupts = <103 IRQ_TYPE_LEVEL_HIGH>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   85  			resets = <&rstgen RST_I2C2>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   86  			status = "disabled";
c8eb04aecdd4df Inochi Amaoto    2024-07-29   87  		};
c8eb04aecdd4df Inochi Amaoto    2024-07-29   88  
c8eb04aecdd4df Inochi Amaoto    2024-07-29   89  		i2c3: i2c@7030008000 {
c8eb04aecdd4df Inochi Amaoto    2024-07-29   90  			compatible = "snps,designware-i2c";
c8eb04aecdd4df Inochi Amaoto    2024-07-29   91  			reg = <0x70 0x30008000 0x0 0x1000>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   92  			#address-cells = <1>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   93  			#size-cells = <0>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   94  			clocks = <&clkgen GATE_CLK_APB_I2C>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   95  			clock-names = "ref";
c8eb04aecdd4df Inochi Amaoto    2024-07-29   96  			clock-frequency = <100000>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   97  			interrupts = <104 IRQ_TYPE_LEVEL_HIGH>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   98  			resets = <&rstgen RST_I2C3>;
c8eb04aecdd4df Inochi Amaoto    2024-07-29   99  			status = "disabled";
c8eb04aecdd4df Inochi Amaoto    2024-07-29  100  		};
c8eb04aecdd4df Inochi Amaoto    2024-07-29  101  
a508d794f86ea6 Chen Wang        2024-08-19  102  		gpio0: gpio@7030009000 {
a508d794f86ea6 Chen Wang        2024-08-19  103  			compatible = "snps,dw-apb-gpio";
a508d794f86ea6 Chen Wang        2024-08-19  104  			reg = <0x70 0x30009000 0x0 0x400>;
a508d794f86ea6 Chen Wang        2024-08-19  105  			#address-cells = <1>;
a508d794f86ea6 Chen Wang        2024-08-19  106  			#size-cells = <0>;
a508d794f86ea6 Chen Wang        2024-08-19  107  			clocks = <&clkgen GATE_CLK_APB_GPIO>,
a508d794f86ea6 Chen Wang        2024-08-19  108  				 <&clkgen GATE_CLK_GPIO_DB>;
a508d794f86ea6 Chen Wang        2024-08-19  109  			clock-names = "bus", "db";
a508d794f86ea6 Chen Wang        2024-08-19  110  
a508d794f86ea6 Chen Wang        2024-08-19  111  			port0a: gpio-controller@0 {
a508d794f86ea6 Chen Wang        2024-08-19  112  				compatible = "snps,dw-apb-gpio-port";
a508d794f86ea6 Chen Wang        2024-08-19  113  				gpio-controller;
a508d794f86ea6 Chen Wang        2024-08-19  114  				#gpio-cells = <2>;
d99913e1b80b51 Uwe Kleine-König 2024-10-22  115  				ngpios = <32>;
a508d794f86ea6 Chen Wang        2024-08-19  116  				reg = <0>;
a508d794f86ea6 Chen Wang        2024-08-19  117  				interrupt-controller;
a508d794f86ea6 Chen Wang        2024-08-19  118  				#interrupt-cells = <2>;
a508d794f86ea6 Chen Wang        2024-08-19  119  				interrupt-parent = <&intc>;
a508d794f86ea6 Chen Wang        2024-08-19  120  				interrupts = <96 IRQ_TYPE_LEVEL_HIGH>;
a508d794f86ea6 Chen Wang        2024-08-19  121  			};
a508d794f86ea6 Chen Wang        2024-08-19  122  		};
a508d794f86ea6 Chen Wang        2024-08-19  123  
a508d794f86ea6 Chen Wang        2024-08-19  124  		gpio1: gpio@703000a000 {
a508d794f86ea6 Chen Wang        2024-08-19  125  			compatible = "snps,dw-apb-gpio";
a508d794f86ea6 Chen Wang        2024-08-19  126  			reg = <0x70 0x3000a000 0x0 0x400>;
a508d794f86ea6 Chen Wang        2024-08-19  127  			#address-cells = <1>;
a508d794f86ea6 Chen Wang        2024-08-19  128  			#size-cells = <0>;
a508d794f86ea6 Chen Wang        2024-08-19  129  			clocks = <&clkgen GATE_CLK_APB_GPIO>,
a508d794f86ea6 Chen Wang        2024-08-19  130  				 <&clkgen GATE_CLK_GPIO_DB>;
a508d794f86ea6 Chen Wang        2024-08-19  131  			clock-names = "bus", "db";
a508d794f86ea6 Chen Wang        2024-08-19  132  
a508d794f86ea6 Chen Wang        2024-08-19  133  			port1a: gpio-controller@0 {
a508d794f86ea6 Chen Wang        2024-08-19  134  				compatible = "snps,dw-apb-gpio-port";
a508d794f86ea6 Chen Wang        2024-08-19  135  				gpio-controller;
a508d794f86ea6 Chen Wang        2024-08-19  136  				#gpio-cells = <2>;
d99913e1b80b51 Uwe Kleine-König 2024-10-22  137  				ngpios = <32>;
a508d794f86ea6 Chen Wang        2024-08-19  138  				reg = <0>;
a508d794f86ea6 Chen Wang        2024-08-19  139  				interrupt-controller;
a508d794f86ea6 Chen Wang        2024-08-19  140  				#interrupt-cells = <2>;
a508d794f86ea6 Chen Wang        2024-08-19  141  				interrupt-parent = <&intc>;
a508d794f86ea6 Chen Wang        2024-08-19  142  				interrupts = <97 IRQ_TYPE_LEVEL_HIGH>;
a508d794f86ea6 Chen Wang        2024-08-19  143  			};
a508d794f86ea6 Chen Wang        2024-08-19  144  		};
a508d794f86ea6 Chen Wang        2024-08-19  145  
a508d794f86ea6 Chen Wang        2024-08-19  146  		gpio2: gpio@703000b000 {
a508d794f86ea6 Chen Wang        2024-08-19  147  			compatible = "snps,dw-apb-gpio";
a508d794f86ea6 Chen Wang        2024-08-19  148  			reg = <0x70 0x3000b000 0x0 0x400>;
a508d794f86ea6 Chen Wang        2024-08-19  149  			#address-cells = <1>;
a508d794f86ea6 Chen Wang        2024-08-19  150  			#size-cells = <0>;
a508d794f86ea6 Chen Wang        2024-08-19  151  			clocks = <&clkgen GATE_CLK_APB_GPIO>,
a508d794f86ea6 Chen Wang        2024-08-19  152  				 <&clkgen GATE_CLK_GPIO_DB>;
a508d794f86ea6 Chen Wang        2024-08-19  153  			clock-names = "bus", "db";
a508d794f86ea6 Chen Wang        2024-08-19  154  
a508d794f86ea6 Chen Wang        2024-08-19  155  			port2a: gpio-controller@0 {
a508d794f86ea6 Chen Wang        2024-08-19  156  				compatible = "snps,dw-apb-gpio-port";
a508d794f86ea6 Chen Wang        2024-08-19  157  				gpio-controller;
a508d794f86ea6 Chen Wang        2024-08-19  158  				#gpio-cells = <2>;
d99913e1b80b51 Uwe Kleine-König 2024-10-22  159  				ngpios = <32>;
a508d794f86ea6 Chen Wang        2024-08-19  160  				reg = <0>;
a508d794f86ea6 Chen Wang        2024-08-19  161  				interrupt-controller;
a508d794f86ea6 Chen Wang        2024-08-19  162  				#interrupt-cells = <2>;
a508d794f86ea6 Chen Wang        2024-08-19  163  				interrupt-parent = <&intc>;
a508d794f86ea6 Chen Wang        2024-08-19  164  				interrupts = <98 IRQ_TYPE_LEVEL_HIGH>;
a508d794f86ea6 Chen Wang        2024-08-19  165  			};
a508d794f86ea6 Chen Wang        2024-08-19  166  		};
a508d794f86ea6 Chen Wang        2024-08-19  167  
b1240a39511b92 Chen Wang        2023-11-24  168  		pllclk: clock-controller@70300100c0 {
b1240a39511b92 Chen Wang        2023-11-24  169  			compatible = "sophgo,sg2042-pll";
b1240a39511b92 Chen Wang        2023-11-24  170  			reg = <0x70 0x300100c0 0x0 0x40>;
b1240a39511b92 Chen Wang        2023-11-24  171  			clocks = <&cgi_main>, <&cgi_dpll0>, <&cgi_dpll1>;
b1240a39511b92 Chen Wang        2023-11-24  172  			clock-names = "cgi_main", "cgi_dpll0", "cgi_dpll1";
b1240a39511b92 Chen Wang        2023-11-24  173  			#clock-cells = <1>;
b1240a39511b92 Chen Wang        2023-11-24  174  		};
b1240a39511b92 Chen Wang        2023-11-24  175  
b1240a39511b92 Chen Wang        2023-11-24  176  		rpgate: clock-controller@7030010368 {
b1240a39511b92 Chen Wang        2023-11-24  177  			compatible = "sophgo,sg2042-rpgate";
b1240a39511b92 Chen Wang        2023-11-24  178  			reg = <0x70 0x30010368 0x0 0x98>;
b1240a39511b92 Chen Wang        2023-11-24  179  			clocks = <&clkgen GATE_CLK_RP_CPU_NORMAL>;
b1240a39511b92 Chen Wang        2023-11-24  180  			clock-names = "rpgate";
b1240a39511b92 Chen Wang        2023-11-24  181  			#clock-cells = <1>;
b1240a39511b92 Chen Wang        2023-11-24  182  		};
b1240a39511b92 Chen Wang        2023-11-24  183  
b1240a39511b92 Chen Wang        2023-11-24  184  		clkgen: clock-controller@7030012000 {
b1240a39511b92 Chen Wang        2023-11-24  185  			compatible = "sophgo,sg2042-clkgen";
b1240a39511b92 Chen Wang        2023-11-24  186  			reg = <0x70 0x30012000 0x0 0x1000>;
b1240a39511b92 Chen Wang        2023-11-24  187  			clocks = <&pllclk MPLL_CLK>,
b1240a39511b92 Chen Wang        2023-11-24  188  				 <&pllclk FPLL_CLK>,
b1240a39511b92 Chen Wang        2023-11-24  189  				 <&pllclk DPLL0_CLK>,
b1240a39511b92 Chen Wang        2023-11-24  190  				 <&pllclk DPLL1_CLK>;
b1240a39511b92 Chen Wang        2023-11-24  191  			clock-names = "mpll",
b1240a39511b92 Chen Wang        2023-11-24  192  				      "fpll",
b1240a39511b92 Chen Wang        2023-11-24  193  				      "dpll0",
b1240a39511b92 Chen Wang        2023-11-24  194  				      "dpll1";
b1240a39511b92 Chen Wang        2023-11-24  195  			#clock-cells = <1>;
b1240a39511b92 Chen Wang        2023-11-24  196  		};
b1240a39511b92 Chen Wang        2023-11-24  197  
400cd81382c7f9 Chen Wang        2024-11-11 @198  		pcie_rc0: pcie@7060000000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
