Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C325D23918B
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Dec 2024 23:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733354210; cv=none; b=ZZINRIMA1VJOOnGa0QHXjmnaV3p7bSiEkb2A0LQwlcd4fMTNrsyRDop/6jNMln7ZCPXzvEEJox8EmhoR/4vmv8aBorLoaAkEXQOOvS8wDjtsKJZIPgtKW8v/x4iBeGhmxkpDDZvEqYUxBtFZ71Kp1YpZIRTT7EPdv3TYWL2DBLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733354210; c=relaxed/simple;
	bh=nTjdJAd5IrUVv7MZOVJnA8KQ7vLjF8oMosh/LIpakDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iJXtm3HlVMcvXGFaWfsEdt+OjsYIryROS3RJqY9t5bE9ZKge2kHJ21q7MU6cf5Mr4zaM5L1vXwTBaR5E/jjpn9lPB0pu1DFSX1x93BluhYaIv8BHjJl+FrkCb0UFNJAaXwqAHjC1KG1ApxbvFPrT2GxtqLEFdmoitsdljTXi1Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NT80IqwU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NT80IqwU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733354208; x=1764890208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nTjdJAd5IrUVv7MZOVJnA8KQ7vLjF8oMosh/LIpakDs=;
  b=NT80IqwUS4uhbaZRb9j+EtBaLUFH2EPvkzTq75dXvlN0I+iL7h7q7I5A
   RZZdDhc9Ose3rx8C9ggiW5ydI/DozfKpyoFQQzdywJDwi+EpV4vlx9ynS
   x43LEhbiu7lMh391r888hZJkbsbfuNvhzTuyBn7O62QPUKjeJJ9qoxYLy
   EhoSWu3LR0/GEK6HxoiXRlvI3P3Tb9fhtitDN5gy5YQAhF1T27ojbiMTk
   fcNi1sJBJkm2rZuSDSnrf97v/VEnamuNoJQNJiF68u+7fpmlgBBntl39o
   0d+00QLW7i/5NKg0nnItwcdnvwnf5Q+hgw+XHbofiNgtrIGGF0lQqx+IU
   g==;
X-CSE-ConnectionGUID: fhcykCiKRXqqt8f6a32Cdw==
X-CSE-MsgGUID: MNB5XlqLSxKPRGrfzFsH3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33001647"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="33001647"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 15:16:47 -0800
X-CSE-ConnectionGUID: 3GUje2doRxW0WQhWd7jiBw==
X-CSE-MsgGUID: fsb2SBfJRM+YA1CRJoqEMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="124831997"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 04 Dec 2024 15:16:45 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIybr-0003aD-0h;
	Wed, 04 Dec 2024 23:16:43 +0000
Date: Thu, 5 Dec 2024 07:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: exynosautov920: add DMA nodes
Message-ID: <202412050611.lNHO6ooa-lkp@intel.com>
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
In-Reply-To: <20241204122335.1578-1-faraz.ata@samsung.com>
References: <20241204122335.1578-1-faraz.ata@samsung.com>
TO: Faraz Ata <faraz.ata@samsung.com>
TO: devicetree@vger.kernel.org
TO: linux-samsung-soc@vger.kernel.org
TO: krzk+dt@kernel.org
TO: robh@kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: alim.akhtar@samsung.com
CC: rosa.pila@samsung.com
CC: Faraz Ata <faraz.ata@samsung.com>

Hi Faraz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on linus/master v6.13-rc1 next-20241204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Faraz-Ata/arm64-dts-exynosautov920-add-DMA-nodes/20241204-202606
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20241204122335.1578-1-faraz.ata%40samsung.com
patch subject: [PATCH] arm64: dts: exynosautov920: add DMA nodes
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arm64-randconfig-051-20241205 (https://download.01.org/0day-ci/archive/20241205/202412050611.lNHO6ooa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050611.lNHO6ooa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412050611.lNHO6ooa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynosautov920.dtsi:214.34-221.5: Warning (simple_bus_reg): /soc@0/dma-controller@101A0000: simple-bus unit address format error, expected "101a0000"
>> arch/arm64/boot/dts/exynos/exynosautov920.dtsi:223.34-230.5: Warning (simple_bus_reg): /soc@0/dma-controller@101B0000: simple-bus unit address format error, expected "101b0000"
>> arch/arm64/boot/dts/exynos/exynosautov920.dtsi:232.34-239.5: Warning (simple_bus_reg): /soc@0/dma-controller@101C0000: simple-bus unit address format error, expected "101c0000"
>> arch/arm64/boot/dts/exynos/exynosautov920.dtsi:241.34-248.5: Warning (simple_bus_reg): /soc@0/dma-controller@101D0000: simple-bus unit address format error, expected "101d0000"
>> arch/arm64/boot/dts/exynos/exynosautov920.dtsi:250.34-257.5: Warning (simple_bus_reg): /soc@0/dma-controller@101E0000: simple-bus unit address format error, expected "101e0000"
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: soc@0: dma-controller@101E0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: soc@0: dma-controller@101A0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: soc@0: dma-controller@101C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: soc@0: dma-controller@101B0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: soc@0: dma-controller@101D0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#

vim +/101a0000 +214 arch/arm64/boot/dts/exynos/exynosautov920.dtsi

c96dab1993d247 Jaewon Kim   2023-12-08   12  
c96dab1993d247 Jaewon Kim   2023-12-08   13  / {
c96dab1993d247 Jaewon Kim   2023-12-08   14  	compatible = "samsung,exynosautov920";
c96dab1993d247 Jaewon Kim   2023-12-08   15  	#address-cells = <2>;
c96dab1993d247 Jaewon Kim   2023-12-08   16  	#size-cells = <1>;
c96dab1993d247 Jaewon Kim   2023-12-08   17  
c96dab1993d247 Jaewon Kim   2023-12-08   18  	interrupt-parent = <&gic>;
c96dab1993d247 Jaewon Kim   2023-12-08   19  
c96dab1993d247 Jaewon Kim   2023-12-08   20  	aliases {
c96dab1993d247 Jaewon Kim   2023-12-08   21  		pinctrl0 = &pinctrl_alive;
c96dab1993d247 Jaewon Kim   2023-12-08   22  		pinctrl1 = &pinctrl_aud;
c96dab1993d247 Jaewon Kim   2023-12-08   23  		pinctrl2 = &pinctrl_hsi0;
c96dab1993d247 Jaewon Kim   2023-12-08   24  		pinctrl3 = &pinctrl_hsi1;
c96dab1993d247 Jaewon Kim   2023-12-08   25  		pinctrl4 = &pinctrl_hsi2;
c96dab1993d247 Jaewon Kim   2023-12-08   26  		pinctrl5 = &pinctrl_hsi2ufs;
c96dab1993d247 Jaewon Kim   2023-12-08   27  		pinctrl6 = &pinctrl_peric0;
c96dab1993d247 Jaewon Kim   2023-12-08   28  		pinctrl7 = &pinctrl_peric1;
c96dab1993d247 Jaewon Kim   2023-12-08   29  	};
c96dab1993d247 Jaewon Kim   2023-12-08   30  
c96dab1993d247 Jaewon Kim   2023-12-08   31  	arm-pmu {
c96dab1993d247 Jaewon Kim   2023-12-08   32  		compatible = "arm,cortex-a78-pmu";
c96dab1993d247 Jaewon Kim   2023-12-08   33  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
c96dab1993d247 Jaewon Kim   2023-12-08   34  	};
c96dab1993d247 Jaewon Kim   2023-12-08   35  
c96dab1993d247 Jaewon Kim   2023-12-08   36  	xtcxo: clock {
c96dab1993d247 Jaewon Kim   2023-12-08   37  		compatible = "fixed-clock";
c96dab1993d247 Jaewon Kim   2023-12-08   38  		#clock-cells = <0>;
c96dab1993d247 Jaewon Kim   2023-12-08   39  		clock-output-names = "oscclk";
c96dab1993d247 Jaewon Kim   2023-12-08   40  	};
c96dab1993d247 Jaewon Kim   2023-12-08   41  
c96dab1993d247 Jaewon Kim   2023-12-08   42  	cpus: cpus {
c96dab1993d247 Jaewon Kim   2023-12-08   43  		#address-cells = <2>;
c96dab1993d247 Jaewon Kim   2023-12-08   44  		#size-cells = <0>;
c96dab1993d247 Jaewon Kim   2023-12-08   45  
c96dab1993d247 Jaewon Kim   2023-12-08   46  		cpu-map {
c96dab1993d247 Jaewon Kim   2023-12-08   47  			cluster0 {
c96dab1993d247 Jaewon Kim   2023-12-08   48  				core0 {
c96dab1993d247 Jaewon Kim   2023-12-08   49  					cpu = <&cpu0>;
c96dab1993d247 Jaewon Kim   2023-12-08   50  				};
c96dab1993d247 Jaewon Kim   2023-12-08   51  				core1 {
c96dab1993d247 Jaewon Kim   2023-12-08   52  					cpu = <&cpu1>;
c96dab1993d247 Jaewon Kim   2023-12-08   53  				};
c96dab1993d247 Jaewon Kim   2023-12-08   54  				core2 {
c96dab1993d247 Jaewon Kim   2023-12-08   55  					cpu = <&cpu2>;
c96dab1993d247 Jaewon Kim   2023-12-08   56  				};
c96dab1993d247 Jaewon Kim   2023-12-08   57  				core3 {
c96dab1993d247 Jaewon Kim   2023-12-08   58  					cpu = <&cpu3>;
c96dab1993d247 Jaewon Kim   2023-12-08   59  				};
c96dab1993d247 Jaewon Kim   2023-12-08   60  			};
c96dab1993d247 Jaewon Kim   2023-12-08   61  
c96dab1993d247 Jaewon Kim   2023-12-08   62  			cluster1 {
c96dab1993d247 Jaewon Kim   2023-12-08   63  				core0 {
c96dab1993d247 Jaewon Kim   2023-12-08   64  					cpu = <&cpu4>;
c96dab1993d247 Jaewon Kim   2023-12-08   65  				};
c96dab1993d247 Jaewon Kim   2023-12-08   66  				core1 {
c96dab1993d247 Jaewon Kim   2023-12-08   67  					cpu = <&cpu5>;
c96dab1993d247 Jaewon Kim   2023-12-08   68  				};
c96dab1993d247 Jaewon Kim   2023-12-08   69  				core2 {
c96dab1993d247 Jaewon Kim   2023-12-08   70  					cpu = <&cpu6>;
c96dab1993d247 Jaewon Kim   2023-12-08   71  				};
c96dab1993d247 Jaewon Kim   2023-12-08   72  				core3 {
c96dab1993d247 Jaewon Kim   2023-12-08   73  					cpu = <&cpu7>;
c96dab1993d247 Jaewon Kim   2023-12-08   74  				};
c96dab1993d247 Jaewon Kim   2023-12-08   75  			};
c96dab1993d247 Jaewon Kim   2023-12-08   76  
c96dab1993d247 Jaewon Kim   2023-12-08   77  			cluster2 {
c96dab1993d247 Jaewon Kim   2023-12-08   78  				core0 {
c96dab1993d247 Jaewon Kim   2023-12-08   79  					cpu = <&cpu8>;
c96dab1993d247 Jaewon Kim   2023-12-08   80  				};
c96dab1993d247 Jaewon Kim   2023-12-08   81  				core1 {
c96dab1993d247 Jaewon Kim   2023-12-08   82  					cpu = <&cpu9>;
c96dab1993d247 Jaewon Kim   2023-12-08   83  				};
c96dab1993d247 Jaewon Kim   2023-12-08   84  			};
c96dab1993d247 Jaewon Kim   2023-12-08   85  		};
c96dab1993d247 Jaewon Kim   2023-12-08   86  
c96dab1993d247 Jaewon Kim   2023-12-08   87  		cpu0: cpu@0 {
c96dab1993d247 Jaewon Kim   2023-12-08   88  			device_type = "cpu";
c96dab1993d247 Jaewon Kim   2023-12-08   89  			compatible = "arm,cortex-a78ae";
c96dab1993d247 Jaewon Kim   2023-12-08   90  			reg = <0x0 0x0>;
c96dab1993d247 Jaewon Kim   2023-12-08   91  			enable-method = "psci";
c96dab1993d247 Jaewon Kim   2023-12-08   92  		};
c96dab1993d247 Jaewon Kim   2023-12-08   93  
c96dab1993d247 Jaewon Kim   2023-12-08   94  		cpu1: cpu@100 {
c96dab1993d247 Jaewon Kim   2023-12-08   95  			device_type = "cpu";
c96dab1993d247 Jaewon Kim   2023-12-08   96  			compatible = "arm,cortex-a78ae";
c96dab1993d247 Jaewon Kim   2023-12-08   97  			reg = <0x0 0x100>;
c96dab1993d247 Jaewon Kim   2023-12-08   98  			enable-method = "psci";
c96dab1993d247 Jaewon Kim   2023-12-08   99  		};
c96dab1993d247 Jaewon Kim   2023-12-08  100  
c96dab1993d247 Jaewon Kim   2023-12-08  101  		cpu2: cpu@200 {
c96dab1993d247 Jaewon Kim   2023-12-08  102  			device_type = "cpu";
c96dab1993d247 Jaewon Kim   2023-12-08  103  			compatible = "arm,cortex-a78ae";
c96dab1993d247 Jaewon Kim   2023-12-08  104  			reg = <0x0 0x200>;
c96dab1993d247 Jaewon Kim   2023-12-08  105  			enable-method = "psci";
c96dab1993d247 Jaewon Kim   2023-12-08  106  		};
c96dab1993d247 Jaewon Kim   2023-12-08  107  
c96dab1993d247 Jaewon Kim   2023-12-08  108  		cpu3: cpu@300 {
c96dab1993d247 Jaewon Kim   2023-12-08  109  			device_type = "cpu";
c96dab1993d247 Jaewon Kim   2023-12-08  110  			compatible = "arm,cortex-a78ae";
c96dab1993d247 Jaewon Kim   2023-12-08  111  			reg = <0x0 0x300>;
c96dab1993d247 Jaewon Kim   2023-12-08  112  			enable-method = "psci";
c96dab1993d247 Jaewon Kim   2023-12-08  113  		};
c96dab1993d247 Jaewon Kim   2023-12-08  114  
c96dab1993d247 Jaewon Kim   2023-12-08  115  		cpu4: cpu@10000 {
c96dab1993d247 Jaewon Kim   2023-12-08  116  			device_type = "cpu";
c96dab1993d247 Jaewon Kim   2023-12-08  117  			compatible = "arm,cortex-a78ae";
c96dab1993d247 Jaewon Kim   2023-12-08  118  			reg = <0x0 0x10000>;
c96dab1993d247 Jaewon Kim   2023-12-08  119  			enable-method = "psci";
c96dab1993d247 Jaewon Kim   2023-12-08  120  		};
c96dab1993d247 Jaewon Kim   2023-12-08  121  
c96dab1993d247 Jaewon Kim   2023-12-08  122  		cpu5: cpu@10100 {
c96dab1993d247 Jaewon Kim   2023-12-08  123  			device_type = "cpu";
c96dab1993d247 Jaewon Kim   2023-12-08  124  			compatible = "arm,cortex-a78ae";
c96dab1993d247 Jaewon Kim   2023-12-08  125  			reg = <0x0 0x10100>;
c96dab1993d247 Jaewon Kim   2023-12-08  126  			enable-method = "psci";
c96dab1993d247 Jaewon Kim   2023-12-08  127  		};
c96dab1993d247 Jaewon Kim   2023-12-08  128  
c96dab1993d247 Jaewon Kim   2023-12-08  129  		cpu6: cpu@10200 {
c96dab1993d247 Jaewon Kim   2023-12-08  130  			device_type = "cpu";
c96dab1993d247 Jaewon Kim   2023-12-08  131  			compatible = "arm,cortex-a78ae";
c96dab1993d247 Jaewon Kim   2023-12-08  132  			reg = <0x0 0x10200>;
c96dab1993d247 Jaewon Kim   2023-12-08  133  			enable-method = "psci";
c96dab1993d247 Jaewon Kim   2023-12-08  134  		};
c96dab1993d247 Jaewon Kim   2023-12-08  135  
c96dab1993d247 Jaewon Kim   2023-12-08  136  		cpu7: cpu@10300 {
c96dab1993d247 Jaewon Kim   2023-12-08  137  			device_type = "cpu";
c96dab1993d247 Jaewon Kim   2023-12-08  138  			compatible = "arm,cortex-a78ae";
c96dab1993d247 Jaewon Kim   2023-12-08  139  			reg = <0x0 0x10300>;
c96dab1993d247 Jaewon Kim   2023-12-08  140  			enable-method = "psci";
c96dab1993d247 Jaewon Kim   2023-12-08  141  		};
c96dab1993d247 Jaewon Kim   2023-12-08  142  
c96dab1993d247 Jaewon Kim   2023-12-08  143  		cpu8: cpu@20000 {
c96dab1993d247 Jaewon Kim   2023-12-08  144  			device_type = "cpu";
c96dab1993d247 Jaewon Kim   2023-12-08  145  			compatible = "arm,cortex-a78ae";
c96dab1993d247 Jaewon Kim   2023-12-08  146  			reg = <0x0 0x20000>;
c96dab1993d247 Jaewon Kim   2023-12-08  147  			enable-method = "psci";
c96dab1993d247 Jaewon Kim   2023-12-08  148  		};
c96dab1993d247 Jaewon Kim   2023-12-08  149  
c96dab1993d247 Jaewon Kim   2023-12-08  150  		cpu9: cpu@20100 {
c96dab1993d247 Jaewon Kim   2023-12-08  151  			device_type = "cpu";
c96dab1993d247 Jaewon Kim   2023-12-08  152  			compatible = "arm,cortex-a78ae";
c96dab1993d247 Jaewon Kim   2023-12-08  153  			reg = <0x0 0x20100>;
c96dab1993d247 Jaewon Kim   2023-12-08  154  			enable-method = "psci";
c96dab1993d247 Jaewon Kim   2023-12-08  155  		};
c96dab1993d247 Jaewon Kim   2023-12-08  156  	};
c96dab1993d247 Jaewon Kim   2023-12-08  157  
c96dab1993d247 Jaewon Kim   2023-12-08  158  	psci {
c96dab1993d247 Jaewon Kim   2023-12-08  159  		compatible = "arm,psci-1.0";
c96dab1993d247 Jaewon Kim   2023-12-08  160  		method = "smc";
c96dab1993d247 Jaewon Kim   2023-12-08  161  	};
c96dab1993d247 Jaewon Kim   2023-12-08  162  
c96dab1993d247 Jaewon Kim   2023-12-08  163  	soc: soc@0 {
c96dab1993d247 Jaewon Kim   2023-12-08  164  		compatible = "simple-bus";
c96dab1993d247 Jaewon Kim   2023-12-08  165  		#address-cells = <1>;
c96dab1993d247 Jaewon Kim   2023-12-08  166  		#size-cells = <1>;
c96dab1993d247 Jaewon Kim   2023-12-08  167  		ranges = <0x0 0x0 0x0 0x20000000>;
c96dab1993d247 Jaewon Kim   2023-12-08  168  
c96dab1993d247 Jaewon Kim   2023-12-08  169  		chipid@10000000 {
c96dab1993d247 Jaewon Kim   2023-12-08  170  			compatible = "samsung,exynosautov920-chipid",
c96dab1993d247 Jaewon Kim   2023-12-08  171  				     "samsung,exynos850-chipid";
c96dab1993d247 Jaewon Kim   2023-12-08  172  			reg = <0x10000000 0x24>;
c96dab1993d247 Jaewon Kim   2023-12-08  173  		};
c96dab1993d247 Jaewon Kim   2023-12-08  174  
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  175  		cmu_misc: clock-controller@10020000 {
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  176  			compatible = "samsung,exynosautov920-cmu-misc";
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  177  			reg = <0x10020000 0x8000>;
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  178  			#clock-cells = <1>;
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  179  
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  180  			clocks = <&xtcxo>,
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  181  				 <&cmu_top DOUT_CLKCMU_MISC_NOC>;
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  182  			clock-names = "oscclk",
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  183  				      "noc";
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  184  		};
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  185  
c96dab1993d247 Jaewon Kim   2023-12-08  186  		gic: interrupt-controller@10400000 {
c96dab1993d247 Jaewon Kim   2023-12-08  187  			compatible = "arm,gic-v3";
c96dab1993d247 Jaewon Kim   2023-12-08  188  			#interrupt-cells = <3>;
c96dab1993d247 Jaewon Kim   2023-12-08  189  			#address-cells = <0>;
c96dab1993d247 Jaewon Kim   2023-12-08  190  			interrupt-controller;
c96dab1993d247 Jaewon Kim   2023-12-08  191  			reg = <0x10400000 0x10000>,
c96dab1993d247 Jaewon Kim   2023-12-08  192  			      <0x10460000 0x140000>;
c96dab1993d247 Jaewon Kim   2023-12-08  193  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
c96dab1993d247 Jaewon Kim   2023-12-08  194  		};
c96dab1993d247 Jaewon Kim   2023-12-08  195  
7fe0872ece0d27 Faraz Ata    2024-12-04  196  		spdma0: dma-controller@10180000 {
7fe0872ece0d27 Faraz Ata    2024-12-04  197  			compatible = "arm,pl330", "arm,primecell";
7fe0872ece0d27 Faraz Ata    2024-12-04  198  			reg = <0x10180000 0x1000>;
7fe0872ece0d27 Faraz Ata    2024-12-04  199  			interrupts = <GIC_SPI 918 IRQ_TYPE_LEVEL_HIGH>;
7fe0872ece0d27 Faraz Ata    2024-12-04  200  			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
7fe0872ece0d27 Faraz Ata    2024-12-04  201  			clock-names = "apb_pclk";
7fe0872ece0d27 Faraz Ata    2024-12-04  202  			#dma-cells = <1>;
7fe0872ece0d27 Faraz Ata    2024-12-04  203  		};
7fe0872ece0d27 Faraz Ata    2024-12-04  204  
7fe0872ece0d27 Faraz Ata    2024-12-04  205  		spdma1: dma-controller@10190000 {
7fe0872ece0d27 Faraz Ata    2024-12-04  206  			compatible = "arm,pl330", "arm,primecell";
7fe0872ece0d27 Faraz Ata    2024-12-04  207  			reg = <0x10190000 0x1000>;
7fe0872ece0d27 Faraz Ata    2024-12-04  208  			interrupts = <GIC_SPI 917 IRQ_TYPE_LEVEL_HIGH>;
7fe0872ece0d27 Faraz Ata    2024-12-04  209  			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
7fe0872ece0d27 Faraz Ata    2024-12-04  210  			clock-names = "apb_pclk";
7fe0872ece0d27 Faraz Ata    2024-12-04  211  			#dma-cells = <1>;
7fe0872ece0d27 Faraz Ata    2024-12-04  212  		};
7fe0872ece0d27 Faraz Ata    2024-12-04  213  
7fe0872ece0d27 Faraz Ata    2024-12-04 @214  		pdma0: dma-controller@101A0000 {
7fe0872ece0d27 Faraz Ata    2024-12-04  215  			compatible = "arm,pl330", "arm,primecell";
7fe0872ece0d27 Faraz Ata    2024-12-04  216  			reg = <0x101A0000 0x1000>;
7fe0872ece0d27 Faraz Ata    2024-12-04  217  			interrupts = <GIC_SPI 916 IRQ_TYPE_LEVEL_HIGH>;
7fe0872ece0d27 Faraz Ata    2024-12-04  218  			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
7fe0872ece0d27 Faraz Ata    2024-12-04  219  			clock-names = "apb_pclk";
7fe0872ece0d27 Faraz Ata    2024-12-04  220  			#dma-cells = <1>;
7fe0872ece0d27 Faraz Ata    2024-12-04  221  		};
7fe0872ece0d27 Faraz Ata    2024-12-04  222  
7fe0872ece0d27 Faraz Ata    2024-12-04 @223  		pdma1: dma-controller@101B0000 {
7fe0872ece0d27 Faraz Ata    2024-12-04  224  			compatible = "arm,pl330", "arm,primecell";
7fe0872ece0d27 Faraz Ata    2024-12-04  225  			reg = <0x101B0000 0x1000>;
7fe0872ece0d27 Faraz Ata    2024-12-04  226  			interrupts = <GIC_SPI 915 IRQ_TYPE_LEVEL_HIGH>;
7fe0872ece0d27 Faraz Ata    2024-12-04  227  			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
7fe0872ece0d27 Faraz Ata    2024-12-04  228  			clock-names = "apb_pclk";
7fe0872ece0d27 Faraz Ata    2024-12-04  229  			#dma-cells = <1>;
7fe0872ece0d27 Faraz Ata    2024-12-04  230  		};
7fe0872ece0d27 Faraz Ata    2024-12-04  231  
7fe0872ece0d27 Faraz Ata    2024-12-04 @232  		pdma2: dma-controller@101C0000 {
7fe0872ece0d27 Faraz Ata    2024-12-04  233  			compatible = "arm,pl330", "arm,primecell";
7fe0872ece0d27 Faraz Ata    2024-12-04  234  			reg = <0x101C0000 0x1000>;
7fe0872ece0d27 Faraz Ata    2024-12-04  235  			interrupts = <GIC_SPI 914 IRQ_TYPE_LEVEL_HIGH>;
7fe0872ece0d27 Faraz Ata    2024-12-04  236  			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
7fe0872ece0d27 Faraz Ata    2024-12-04  237  			clock-names = "apb_pclk";
7fe0872ece0d27 Faraz Ata    2024-12-04  238  			#dma-cells = <1>;
7fe0872ece0d27 Faraz Ata    2024-12-04  239  		};
7fe0872ece0d27 Faraz Ata    2024-12-04  240  
7fe0872ece0d27 Faraz Ata    2024-12-04 @241  		pdma3: dma-controller@101D0000 {
7fe0872ece0d27 Faraz Ata    2024-12-04  242  			compatible = "arm,pl330", "arm,primecell";
7fe0872ece0d27 Faraz Ata    2024-12-04  243  			reg = <0x101D0000 0x1000>;
7fe0872ece0d27 Faraz Ata    2024-12-04  244  			interrupts = <GIC_SPI 913 IRQ_TYPE_LEVEL_HIGH>;
7fe0872ece0d27 Faraz Ata    2024-12-04  245  			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
7fe0872ece0d27 Faraz Ata    2024-12-04  246  			clock-names = "apb_pclk";
7fe0872ece0d27 Faraz Ata    2024-12-04  247  			#dma-cells = <1>;
7fe0872ece0d27 Faraz Ata    2024-12-04  248  		};
7fe0872ece0d27 Faraz Ata    2024-12-04  249  
7fe0872ece0d27 Faraz Ata    2024-12-04 @250  		pdma4: dma-controller@101E0000 {
7fe0872ece0d27 Faraz Ata    2024-12-04  251  			compatible = "arm,pl330", "arm,primecell";
7fe0872ece0d27 Faraz Ata    2024-12-04  252  			reg = <0x101E0000 0x1000>;
7fe0872ece0d27 Faraz Ata    2024-12-04  253  			interrupts = <GIC_SPI 912 IRQ_TYPE_LEVEL_HIGH>;
7fe0872ece0d27 Faraz Ata    2024-12-04  254  			clocks = <&cmu_misc CLK_MOUT_MISC_NOC_USER>;
7fe0872ece0d27 Faraz Ata    2024-12-04  255  			clock-names = "apb_pclk";
7fe0872ece0d27 Faraz Ata    2024-12-04  256  			#dma-cells = <1>;
7fe0872ece0d27 Faraz Ata    2024-12-04  257  		};
7fe0872ece0d27 Faraz Ata    2024-12-04  258  
4d06000979cda2 Sunyeal Hong 2024-08-22  259  		cmu_peric0: clock-controller@10800000 {
4d06000979cda2 Sunyeal Hong 2024-08-22  260  			compatible = "samsung,exynosautov920-cmu-peric0";
4d06000979cda2 Sunyeal Hong 2024-08-22  261  			reg = <0x10800000 0x8000>;
4d06000979cda2 Sunyeal Hong 2024-08-22  262  			#clock-cells = <1>;
4d06000979cda2 Sunyeal Hong 2024-08-22  263  
4d06000979cda2 Sunyeal Hong 2024-08-22  264  			clocks = <&xtcxo>,
4d06000979cda2 Sunyeal Hong 2024-08-22  265  				 <&cmu_top DOUT_CLKCMU_PERIC0_NOC>,
4d06000979cda2 Sunyeal Hong 2024-08-22  266  				 <&cmu_top DOUT_CLKCMU_PERIC0_IP>;
4d06000979cda2 Sunyeal Hong 2024-08-22  267  			clock-names = "oscclk",
4d06000979cda2 Sunyeal Hong 2024-08-22  268  				      "noc",
4d06000979cda2 Sunyeal Hong 2024-08-22  269  				      "ip";
4d06000979cda2 Sunyeal Hong 2024-08-22  270  		};
4d06000979cda2 Sunyeal Hong 2024-08-22  271  
c96dab1993d247 Jaewon Kim   2023-12-08  272  		syscon_peric0: syscon@10820000 {
c96dab1993d247 Jaewon Kim   2023-12-08  273  			compatible = "samsung,exynosautov920-peric0-sysreg",
c96dab1993d247 Jaewon Kim   2023-12-08  274  				     "syscon";
c96dab1993d247 Jaewon Kim   2023-12-08  275  			reg = <0x10820000 0x2000>;
c96dab1993d247 Jaewon Kim   2023-12-08  276  		};
c96dab1993d247 Jaewon Kim   2023-12-08  277  
c96dab1993d247 Jaewon Kim   2023-12-08  278  		pinctrl_peric0: pinctrl@10830000 {
c96dab1993d247 Jaewon Kim   2023-12-08  279  			compatible = "samsung,exynosautov920-pinctrl";
c96dab1993d247 Jaewon Kim   2023-12-08  280  			reg = <0x10830000 0x10000>;
c96dab1993d247 Jaewon Kim   2023-12-08  281  			interrupts = <GIC_SPI 753 IRQ_TYPE_LEVEL_HIGH>;
c96dab1993d247 Jaewon Kim   2023-12-08  282  		};
c96dab1993d247 Jaewon Kim   2023-12-08  283  
c96dab1993d247 Jaewon Kim   2023-12-08  284  		usi_0: usi@108800c0 {
c96dab1993d247 Jaewon Kim   2023-12-08  285  			compatible = "samsung,exynosautov920-usi",
c96dab1993d247 Jaewon Kim   2023-12-08  286  				     "samsung,exynos850-usi";
c96dab1993d247 Jaewon Kim   2023-12-08  287  			reg = <0x108800c0 0x20>;
c96dab1993d247 Jaewon Kim   2023-12-08  288  			samsung,sysreg = <&syscon_peric0 0x1000>;
c96dab1993d247 Jaewon Kim   2023-12-08  289  			samsung,mode = <USI_V2_UART>;
c96dab1993d247 Jaewon Kim   2023-12-08  290  			#address-cells = <1>;
c96dab1993d247 Jaewon Kim   2023-12-08  291  			#size-cells = <1>;
c96dab1993d247 Jaewon Kim   2023-12-08  292  			ranges;
4d06000979cda2 Sunyeal Hong 2024-08-22  293  			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
4d06000979cda2 Sunyeal Hong 2024-08-22  294  				 <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>;
c96dab1993d247 Jaewon Kim   2023-12-08  295  			clock-names = "pclk", "ipclk";
c96dab1993d247 Jaewon Kim   2023-12-08  296  			status = "disabled";
c96dab1993d247 Jaewon Kim   2023-12-08  297  
c96dab1993d247 Jaewon Kim   2023-12-08  298  			serial_0: serial@10880000 {
c96dab1993d247 Jaewon Kim   2023-12-08  299  				compatible = "samsung,exynosautov920-uart",
c96dab1993d247 Jaewon Kim   2023-12-08  300  					     "samsung,exynos850-uart";
c96dab1993d247 Jaewon Kim   2023-12-08  301  				reg = <0x10880000 0xc0>;
c96dab1993d247 Jaewon Kim   2023-12-08  302  				interrupts = <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
c96dab1993d247 Jaewon Kim   2023-12-08  303  				pinctrl-names = "default";
c96dab1993d247 Jaewon Kim   2023-12-08  304  				pinctrl-0 = <&uart0_bus>;
4d06000979cda2 Sunyeal Hong 2024-08-22  305  				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
4d06000979cda2 Sunyeal Hong 2024-08-22  306  					 <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>;
c96dab1993d247 Jaewon Kim   2023-12-08  307  				clock-names = "uart", "clk_uart_baud0";
c96dab1993d247 Jaewon Kim   2023-12-08  308  				samsung,uart-fifosize = <256>;
c96dab1993d247 Jaewon Kim   2023-12-08  309  				status = "disabled";
c96dab1993d247 Jaewon Kim   2023-12-08  310  			};
c96dab1993d247 Jaewon Kim   2023-12-08  311  		};
c96dab1993d247 Jaewon Kim   2023-12-08  312  
c96dab1993d247 Jaewon Kim   2023-12-08  313  		pwm: pwm@109b0000 {
c96dab1993d247 Jaewon Kim   2023-12-08  314  			compatible = "samsung,exynosautov920-pwm",
c96dab1993d247 Jaewon Kim   2023-12-08  315  				     "samsung,exynos4210-pwm";
c96dab1993d247 Jaewon Kim   2023-12-08  316  			reg = <0x109b0000 0x100>;
c96dab1993d247 Jaewon Kim   2023-12-08  317  			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
c96dab1993d247 Jaewon Kim   2023-12-08  318  			#pwm-cells = <3>;
c96dab1993d247 Jaewon Kim   2023-12-08  319  			clocks = <&xtcxo>;
c96dab1993d247 Jaewon Kim   2023-12-08  320  			clock-names = "timers";
c96dab1993d247 Jaewon Kim   2023-12-08  321  			status = "disabled";
c96dab1993d247 Jaewon Kim   2023-12-08  322  		};
c96dab1993d247 Jaewon Kim   2023-12-08  323  
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  324  		cmu_peric1: clock-controller@10c00000 {
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  325  			compatible = "samsung,exynosautov920-cmu-peric1";
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  326  			reg = <0x10c00000 0x8000>;
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  327  			#clock-cells = <1>;
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  328  
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  329  			clocks = <&xtcxo>,
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  330  				 <&cmu_top DOUT_CLKCMU_PERIC1_NOC>,
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  331  				 <&cmu_top DOUT_CLKCMU_PERIC1_IP>;
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  332  			clock-names = "oscclk",
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  333  				      "noc",
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  334  				      "ip";
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  335  		};
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  336  
c96dab1993d247 Jaewon Kim   2023-12-08  337  		syscon_peric1: syscon@10c20000 {
c96dab1993d247 Jaewon Kim   2023-12-08  338  			compatible = "samsung,exynosautov920-peric1-sysreg",
c96dab1993d247 Jaewon Kim   2023-12-08  339  				     "syscon";
c96dab1993d247 Jaewon Kim   2023-12-08  340  			reg = <0x10c20000 0x2000>;
c96dab1993d247 Jaewon Kim   2023-12-08  341  		};
c96dab1993d247 Jaewon Kim   2023-12-08  342  
c96dab1993d247 Jaewon Kim   2023-12-08  343  		pinctrl_peric1: pinctrl@10c30000 {
c96dab1993d247 Jaewon Kim   2023-12-08  344  			compatible = "samsung,exynosautov920-pinctrl";
c96dab1993d247 Jaewon Kim   2023-12-08  345  			reg = <0x10c30000 0x10000>;
c96dab1993d247 Jaewon Kim   2023-12-08  346  			interrupts = <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
c96dab1993d247 Jaewon Kim   2023-12-08  347  		};
c96dab1993d247 Jaewon Kim   2023-12-08  348  
4d06000979cda2 Sunyeal Hong 2024-08-22  349  		cmu_top: clock-controller@11000000 {
4d06000979cda2 Sunyeal Hong 2024-08-22  350  			compatible = "samsung,exynosautov920-cmu-top";
4d06000979cda2 Sunyeal Hong 2024-08-22  351  			reg = <0x11000000 0x8000>;
4d06000979cda2 Sunyeal Hong 2024-08-22  352  			#clock-cells = <1>;
4d06000979cda2 Sunyeal Hong 2024-08-22  353  
4d06000979cda2 Sunyeal Hong 2024-08-22  354  			clocks = <&xtcxo>;
4d06000979cda2 Sunyeal Hong 2024-08-22  355  			clock-names = "oscclk";
4d06000979cda2 Sunyeal Hong 2024-08-22  356  		};
4d06000979cda2 Sunyeal Hong 2024-08-22  357  
c96dab1993d247 Jaewon Kim   2023-12-08  358  		pinctrl_alive: pinctrl@11850000 {
c96dab1993d247 Jaewon Kim   2023-12-08  359  			compatible = "samsung,exynosautov920-pinctrl";
c96dab1993d247 Jaewon Kim   2023-12-08  360  			reg = <0x11850000 0x10000>;
c96dab1993d247 Jaewon Kim   2023-12-08  361  
c96dab1993d247 Jaewon Kim   2023-12-08  362  			wakeup-interrupt-controller {
c96dab1993d247 Jaewon Kim   2023-12-08  363  				compatible = "samsung,exynosautov920-wakeup-eint";
c96dab1993d247 Jaewon Kim   2023-12-08  364  			};
c96dab1993d247 Jaewon Kim   2023-12-08  365  		};
c96dab1993d247 Jaewon Kim   2023-12-08  366  
c96dab1993d247 Jaewon Kim   2023-12-08  367  		pmu_system_controller: system-controller@11860000 {
c96dab1993d247 Jaewon Kim   2023-12-08  368  			compatible = "samsung,exynosautov920-pmu",
c96dab1993d247 Jaewon Kim   2023-12-08  369  				     "samsung,exynos7-pmu","syscon";
c96dab1993d247 Jaewon Kim   2023-12-08  370  			reg = <0x11860000 0x10000>;
c96dab1993d247 Jaewon Kim   2023-12-08  371  		};
c96dab1993d247 Jaewon Kim   2023-12-08  372  
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  373  		cmu_hsi0: clock-controller@16000000 {
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  374  			compatible = "samsung,exynosautov920-cmu-hsi0";
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  375  			reg = <0x16000000 0x8000>;
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  376  			#clock-cells = <1>;
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  377  
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  378  			clocks = <&xtcxo>,
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  379  				 <&cmu_top DOUT_CLKCMU_HSI0_NOC>;
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  380  			clock-names = "oscclk",
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  381  				      "noc";
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  382  		};
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  383  
c96dab1993d247 Jaewon Kim   2023-12-08  384  		pinctrl_hsi0: pinctrl@16040000 {
c96dab1993d247 Jaewon Kim   2023-12-08  385  			compatible = "samsung,exynosautov920-pinctrl";
c96dab1993d247 Jaewon Kim   2023-12-08  386  			reg = <0x16040000 0x10000>;
c96dab1993d247 Jaewon Kim   2023-12-08  387  			interrupts = <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>;
c96dab1993d247 Jaewon Kim   2023-12-08  388  		};
c96dab1993d247 Jaewon Kim   2023-12-08  389  
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  390  		cmu_hsi1: clock-controller@16400000 {
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  391  			compatible = "samsung,exynosautov920-cmu-hsi1";
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  392  			reg = <0x16400000 0x8000>;
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  393  			#clock-cells = <1>;
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  394  
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  395  			clocks = <&xtcxo>,
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  396  				 <&cmu_top DOUT_CLKCMU_HSI1_NOC>,
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  397  				 <&cmu_top DOUT_CLKCMU_HSI1_USBDRD>,
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  398  				 <&cmu_top DOUT_CLKCMU_HSI1_MMC_CARD>;
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  399  			clock-names = "oscclk",
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  400  				      "noc",
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  401  				      "usbdrd",
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  402  				      "mmc_card";
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  403  		};
ef1c2a54cbc7d9 Sunyeal Hong 2024-10-09  404  
c96dab1993d247 Jaewon Kim   2023-12-08  405  		pinctrl_hsi1: pinctrl@16450000 {
c96dab1993d247 Jaewon Kim   2023-12-08  406  			compatible = "samsung,exynosautov920-pinctrl";
c96dab1993d247 Jaewon Kim   2023-12-08  407  			reg = <0x16450000 0x10000>;
c96dab1993d247 Jaewon Kim   2023-12-08  408  			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
c96dab1993d247 Jaewon Kim   2023-12-08  409  		};
c96dab1993d247 Jaewon Kim   2023-12-08  410  
c96dab1993d247 Jaewon Kim   2023-12-08  411  		pinctrl_hsi2: pinctrl@16c10000 {
c96dab1993d247 Jaewon Kim   2023-12-08  412  			compatible = "samsung,exynosautov920-pinctrl";
c96dab1993d247 Jaewon Kim   2023-12-08  413  			reg = <0x16c10000 0x10000>;
c96dab1993d247 Jaewon Kim   2023-12-08  414  			interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
c96dab1993d247 Jaewon Kim   2023-12-08  415  		};
c96dab1993d247 Jaewon Kim   2023-12-08  416  
c96dab1993d247 Jaewon Kim   2023-12-08  417  		pinctrl_hsi2ufs: pinctrl@16d20000 {
c96dab1993d247 Jaewon Kim   2023-12-08  418  			compatible = "samsung,exynosautov920-pinctrl";
c96dab1993d247 Jaewon Kim   2023-12-08  419  			reg = <0x16d20000 0x10000>;
c96dab1993d247 Jaewon Kim   2023-12-08  420  			interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
c96dab1993d247 Jaewon Kim   2023-12-08  421  		};
c96dab1993d247 Jaewon Kim   2023-12-08  422  
c96dab1993d247 Jaewon Kim   2023-12-08  423  		pinctrl_aud: pinctrl@1a460000 {
c96dab1993d247 Jaewon Kim   2023-12-08  424  			compatible = "samsung,exynosautov920-pinctrl";
c96dab1993d247 Jaewon Kim   2023-12-08  425  			reg = <0x1a460000 0x10000>;
c96dab1993d247 Jaewon Kim   2023-12-08  426  		};
c96dab1993d247 Jaewon Kim   2023-12-08  427  	};
c96dab1993d247 Jaewon Kim   2023-12-08  428  
c96dab1993d247 Jaewon Kim   2023-12-08  429  	timer {
c96dab1993d247 Jaewon Kim   2023-12-08  430  		compatible = "arm,armv8-timer";
c96dab1993d247 Jaewon Kim   2023-12-08  431  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
c96dab1993d247 Jaewon Kim   2023-12-08  432  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
c96dab1993d247 Jaewon Kim   2023-12-08  433  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
c96dab1993d247 Jaewon Kim   2023-12-08  434  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
c96dab1993d247 Jaewon Kim   2023-12-08  435  			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
c96dab1993d247 Jaewon Kim   2023-12-08  436  	};
c96dab1993d247 Jaewon Kim   2023-12-08  437  };
c96dab1993d247 Jaewon Kim   2023-12-08  438  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
