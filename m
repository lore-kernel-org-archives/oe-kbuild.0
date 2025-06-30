Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056BA5695
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Jun 2025 17:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751305277; cv=none; b=le1V/12xRAsRX+2u6iEgeEoGyWYHKN+SCY1bmD0teBHx4mojIVrDV7Nz+7S8Lvdvk6ZOkpGUinyKePAVzGLhp4KEq/5v7hfuBvFk+g4IceE6FIfwIg/QbEGvcRG7YgUuVZGuVue0+G/kPbKYC5TCTopNF+cqsM97SNkNJKkNrKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751305277; c=relaxed/simple;
	bh=FrDT8XyBOhwi8qplJ2X1bo0D19lSY/Y31vNR+QY4Lsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EqczKJ9DdP1rVZGrhdmKUB7BM3Y7KxBGD/wxtyZmGHB+UkrUY6lv063xF486vB8O3DSIaVeQEc4Ys96znQYgHAuPcnm/XrSHzL8YXFdb13gNvPjNECdIlZt68LEBoVH+TNTl1buAZdRupFpIm4KZ3zqKWBmoAVMEXOZgGATt2pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f8Ym/Lb5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f8Ym/Lb5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751305263; x=1782841263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FrDT8XyBOhwi8qplJ2X1bo0D19lSY/Y31vNR+QY4Lsw=;
  b=f8Ym/Lb5HsEwl5OtUu7gCmQg8JWSo80V2VSEf9i4Ls517+FHgGjuexsA
   KT6L9aohA4pzb1JFxXa4AmhHflbbotz2Mb2BbwE+lmO5NdeZoAv24b+rK
   mfE4xLPAvtxWumwECI04uDpNJS7P24r97rqkvGobTsKzTJWS1bPhzyhSe
   m9L3wKYtlK7gNnembJ4dW6u4JX07RPCVbXoFinaVsPHhmMINy2oS7s6lN
   DBHby3MeVsphQOw5jU6n0X+mmn6To5OGSBEjrtSkbKxVkwFAao3YgU94a
   CkT+UKZ0k2dLsd1NzyZeFVdP5wcNqBIR9wCO7kwag5nbNFNDEBmQq35lp
   g==;
X-CSE-ConnectionGUID: bSRgGlJfSCq6cnLA6WK2uQ==
X-CSE-MsgGUID: ttb2ijSoT9W0pV2Pv/6euw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="70974163"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="70974163"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 10:41:03 -0700
X-CSE-ConnectionGUID: 5U2WtzTBTTOA6Y3/k6LOBg==
X-CSE-MsgGUID: 4UuWe+zeS2SdnEBVE/DRwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="153156637"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jun 2025 10:41:00 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWIV0-000ZEo-1X;
	Mon, 30 Jun 2025 17:40:58 +0000
Date: Tue, 1 Jul 2025 01:40:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 10/10] arm64: dts: fsd: Add PCIe support for Tesla FSD
 SoC
Message-ID: <202507010119.OmogGoEh-lkp@intel.com>
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
In-Reply-To: <20250625165229.3458-11-shradha.t@samsung.com>
References: <20250625165229.3458-11-shradha.t@samsung.com>
TO: Shradha Todi <shradha.t@samsung.com>
TO: linux-pci@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-samsung-soc@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-phy@lists.infradead.org
TO: linux-fsd@tesla.com
CC: manivannan.sadhasivam@linaro.org
CC: lpieralisi@kernel.org
CC: kw@linux.com
CC: robh@kernel.org
CC: bhelgaas@google.com
CC: jingoohan1@gmail.com
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: alim.akhtar@samsung.com
CC: vkoul@kernel.org
CC: kishon@kernel.org
CC: arnd@arndb.de
CC: m.szyprowski@samsung.com
CC: jh80.chung@samsung.com
CC: pankaj.dubey@samsung.com
CC: Shradha Todi <shradha.t@samsung.com>

Hi Shradha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus robh/for-next krzk/for-next linus/master v6.16-rc4 next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shradha-Todi/PCI-exynos-Remove-unused-MACROs-in-exynos-PCI-file/20250626-104154
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250625165229.3458-11-shradha.t%40samsung.com
patch subject: [PATCH v2 10/10] arm64: dts: fsd: Add PCIe support for Tesla FSD SoC
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250701/202507010119.OmogGoEh-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507010119.OmogGoEh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507010119.OmogGoEh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/tesla/fsd.dtsi:1096.29-1112.5: Warning (simple_bus_reg): /soc@0/pcie-ep@15400000: simple-bus unit address format error, expected "15090000"
>> arch/arm64/boot/dts/tesla/fsd.dtsi:1149.29-1165.5: Warning (simple_bus_reg): /soc@0/pcie-ep@16a00000: simple-bus unit address format error, expected "168b0000"
>> arch/arm64/boot/dts/tesla/fsd.dtsi:1190.29-1206.5: Warning (simple_bus_reg): /soc@0/pcie-ep@16b00000: simple-bus unit address format error, expected "168c0000"

vim +/15090000 +1096 arch/arm64/boot/dts/tesla/fsd.dtsi

18b1db6a162c296 Alim Akhtar           2022-01-24    13  
18b1db6a162c296 Alim Akhtar           2022-01-24    14  / {
18b1db6a162c296 Alim Akhtar           2022-01-24    15  	compatible = "tesla,fsd";
18b1db6a162c296 Alim Akhtar           2022-01-24    16  	interrupt-parent = <&gic>;
18b1db6a162c296 Alim Akhtar           2022-01-24    17  	#address-cells = <2>;
18b1db6a162c296 Alim Akhtar           2022-01-24    18  	#size-cells = <2>;
18b1db6a162c296 Alim Akhtar           2022-01-24    19  
18b1db6a162c296 Alim Akhtar           2022-01-24    20  	aliases {
18b1db6a162c296 Alim Akhtar           2022-01-24    21  		i2c0 = &hsi2c_0;
18b1db6a162c296 Alim Akhtar           2022-01-24    22  		i2c1 = &hsi2c_1;
18b1db6a162c296 Alim Akhtar           2022-01-24    23  		i2c2 = &hsi2c_2;
18b1db6a162c296 Alim Akhtar           2022-01-24    24  		i2c3 = &hsi2c_3;
18b1db6a162c296 Alim Akhtar           2022-01-24    25  		i2c4 = &hsi2c_4;
18b1db6a162c296 Alim Akhtar           2022-01-24    26  		i2c5 = &hsi2c_5;
18b1db6a162c296 Alim Akhtar           2022-01-24    27  		i2c6 = &hsi2c_6;
18b1db6a162c296 Alim Akhtar           2022-01-24    28  		i2c7 = &hsi2c_7;
684dac402f212d8 Alim Akhtar           2022-01-24    29  		pinctrl0 = &pinctrl_fsys0;
684dac402f212d8 Alim Akhtar           2022-01-24    30  		pinctrl1 = &pinctrl_peric;
684dac402f212d8 Alim Akhtar           2022-01-24    31  		pinctrl2 = &pinctrl_pmu;
bd1e3696a052b9b Aswani Reddy          2022-01-25    32  		spi0 = &spi_0;
bd1e3696a052b9b Aswani Reddy          2022-01-25    33  		spi1 = &spi_1;
bd1e3696a052b9b Aswani Reddy          2022-01-25    34  		spi2 = &spi_2;
18b1db6a162c296 Alim Akhtar           2022-01-24    35  	};
18b1db6a162c296 Alim Akhtar           2022-01-24    36  
18b1db6a162c296 Alim Akhtar           2022-01-24    37  	cpus {
18b1db6a162c296 Alim Akhtar           2022-01-24    38  		#address-cells = <2>;
18b1db6a162c296 Alim Akhtar           2022-01-24    39  		#size-cells = <0>;
18b1db6a162c296 Alim Akhtar           2022-01-24    40  
18b1db6a162c296 Alim Akhtar           2022-01-24    41  		cpu-map {
18b1db6a162c296 Alim Akhtar           2022-01-24    42  			cluster0 {
18b1db6a162c296 Alim Akhtar           2022-01-24    43  				core0 {
18b1db6a162c296 Alim Akhtar           2022-01-24    44  					cpu = <&cpucl0_0>;
18b1db6a162c296 Alim Akhtar           2022-01-24    45  				};
18b1db6a162c296 Alim Akhtar           2022-01-24    46  				core1 {
18b1db6a162c296 Alim Akhtar           2022-01-24    47  					cpu = <&cpucl0_1>;
18b1db6a162c296 Alim Akhtar           2022-01-24    48  				};
18b1db6a162c296 Alim Akhtar           2022-01-24    49  				core2 {
18b1db6a162c296 Alim Akhtar           2022-01-24    50  					cpu = <&cpucl0_2>;
18b1db6a162c296 Alim Akhtar           2022-01-24    51  				};
18b1db6a162c296 Alim Akhtar           2022-01-24    52  				core3 {
18b1db6a162c296 Alim Akhtar           2022-01-24    53  					cpu = <&cpucl0_3>;
18b1db6a162c296 Alim Akhtar           2022-01-24    54  				};
18b1db6a162c296 Alim Akhtar           2022-01-24    55  			};
18b1db6a162c296 Alim Akhtar           2022-01-24    56  
18b1db6a162c296 Alim Akhtar           2022-01-24    57  			cluster1 {
18b1db6a162c296 Alim Akhtar           2022-01-24    58  				core0 {
18b1db6a162c296 Alim Akhtar           2022-01-24    59  					cpu = <&cpucl1_0>;
18b1db6a162c296 Alim Akhtar           2022-01-24    60  				};
18b1db6a162c296 Alim Akhtar           2022-01-24    61  				core1 {
18b1db6a162c296 Alim Akhtar           2022-01-24    62  					cpu = <&cpucl1_1>;
18b1db6a162c296 Alim Akhtar           2022-01-24    63  				};
18b1db6a162c296 Alim Akhtar           2022-01-24    64  				core2 {
18b1db6a162c296 Alim Akhtar           2022-01-24    65  					cpu = <&cpucl1_2>;
18b1db6a162c296 Alim Akhtar           2022-01-24    66  				};
18b1db6a162c296 Alim Akhtar           2022-01-24    67  				core3 {
18b1db6a162c296 Alim Akhtar           2022-01-24    68  					cpu = <&cpucl1_3>;
18b1db6a162c296 Alim Akhtar           2022-01-24    69  				};
18b1db6a162c296 Alim Akhtar           2022-01-24    70  			};
18b1db6a162c296 Alim Akhtar           2022-01-24    71  
18b1db6a162c296 Alim Akhtar           2022-01-24    72  			cluster2 {
18b1db6a162c296 Alim Akhtar           2022-01-24    73  				core0 {
18b1db6a162c296 Alim Akhtar           2022-01-24    74  					cpu = <&cpucl2_0>;
18b1db6a162c296 Alim Akhtar           2022-01-24    75  				};
18b1db6a162c296 Alim Akhtar           2022-01-24    76  				core1 {
18b1db6a162c296 Alim Akhtar           2022-01-24    77  					cpu = <&cpucl2_1>;
18b1db6a162c296 Alim Akhtar           2022-01-24    78  				};
18b1db6a162c296 Alim Akhtar           2022-01-24    79  				core2 {
18b1db6a162c296 Alim Akhtar           2022-01-24    80  					cpu = <&cpucl2_2>;
18b1db6a162c296 Alim Akhtar           2022-01-24    81  				};
18b1db6a162c296 Alim Akhtar           2022-01-24    82  				core3 {
18b1db6a162c296 Alim Akhtar           2022-01-24    83  					cpu = <&cpucl2_3>;
18b1db6a162c296 Alim Akhtar           2022-01-24    84  				};
18b1db6a162c296 Alim Akhtar           2022-01-24    85  			};
18b1db6a162c296 Alim Akhtar           2022-01-24    86  		};
18b1db6a162c296 Alim Akhtar           2022-01-24    87  
18b1db6a162c296 Alim Akhtar           2022-01-24    88  		/* Cluster 0 */
18b1db6a162c296 Alim Akhtar           2022-01-24    89  		cpucl0_0: cpu@0 {
18b1db6a162c296 Alim Akhtar           2022-01-24    90  				device_type = "cpu";
18b1db6a162c296 Alim Akhtar           2022-01-24    91  				compatible = "arm,cortex-a72";
18b1db6a162c296 Alim Akhtar           2022-01-24    92  				reg = <0x0 0x000>;
18b1db6a162c296 Alim Akhtar           2022-01-24    93  				enable-method = "psci";
18b1db6a162c296 Alim Akhtar           2022-01-24    94  				clock-frequency = <2400000000>;
056106b030b73c7 Krzysztof Kozlowski   2025-02-19    95  				cpu-idle-states = <&cpu_sleep>;
5355559555b98cd Alim Akhtar           2022-05-18    96  				i-cache-size = <0xc000>;
5355559555b98cd Alim Akhtar           2022-05-18    97  				i-cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18    98  				i-cache-sets = <256>;
5355559555b98cd Alim Akhtar           2022-05-18    99  				d-cache-size = <0x8000>;
5355559555b98cd Alim Akhtar           2022-05-18   100  				d-cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18   101  				d-cache-sets = <256>;
5355559555b98cd Alim Akhtar           2022-05-18   102  				next-level-cache = <&cpucl_l2>;
18b1db6a162c296 Alim Akhtar           2022-01-24   103  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   104  
18b1db6a162c296 Alim Akhtar           2022-01-24   105  		cpucl0_1: cpu@1 {
18b1db6a162c296 Alim Akhtar           2022-01-24   106  				device_type = "cpu";
18b1db6a162c296 Alim Akhtar           2022-01-24   107  				compatible = "arm,cortex-a72";
18b1db6a162c296 Alim Akhtar           2022-01-24   108  				reg = <0x0 0x001>;
18b1db6a162c296 Alim Akhtar           2022-01-24   109  				enable-method = "psci";
18b1db6a162c296 Alim Akhtar           2022-01-24   110  				clock-frequency = <2400000000>;
056106b030b73c7 Krzysztof Kozlowski   2025-02-19   111  				cpu-idle-states = <&cpu_sleep>;
5355559555b98cd Alim Akhtar           2022-05-18   112  				i-cache-size = <0xc000>;
5355559555b98cd Alim Akhtar           2022-05-18   113  				i-cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18   114  				i-cache-sets = <256>;
5355559555b98cd Alim Akhtar           2022-05-18   115  				d-cache-size = <0x8000>;
5355559555b98cd Alim Akhtar           2022-05-18   116  				d-cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18   117  				d-cache-sets = <256>;
5355559555b98cd Alim Akhtar           2022-05-18   118  				next-level-cache = <&cpucl_l2>;
18b1db6a162c296 Alim Akhtar           2022-01-24   119  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   120  
18b1db6a162c296 Alim Akhtar           2022-01-24   121  		cpucl0_2: cpu@2 {
18b1db6a162c296 Alim Akhtar           2022-01-24   122  				device_type = "cpu";
18b1db6a162c296 Alim Akhtar           2022-01-24   123  				compatible = "arm,cortex-a72";
18b1db6a162c296 Alim Akhtar           2022-01-24   124  				reg = <0x0 0x002>;
18b1db6a162c296 Alim Akhtar           2022-01-24   125  				enable-method = "psci";
18b1db6a162c296 Alim Akhtar           2022-01-24   126  				clock-frequency = <2400000000>;
056106b030b73c7 Krzysztof Kozlowski   2025-02-19   127  				cpu-idle-states = <&cpu_sleep>;
5355559555b98cd Alim Akhtar           2022-05-18   128  				i-cache-size = <0xc000>;
5355559555b98cd Alim Akhtar           2022-05-18   129  				i-cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18   130  				i-cache-sets = <256>;
5355559555b98cd Alim Akhtar           2022-05-18   131  				d-cache-size = <0x8000>;
5355559555b98cd Alim Akhtar           2022-05-18   132  				d-cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18   133  				d-cache-sets = <256>;
5355559555b98cd Alim Akhtar           2022-05-18   134  				next-level-cache = <&cpucl_l2>;
18b1db6a162c296 Alim Akhtar           2022-01-24   135  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   136  
18b1db6a162c296 Alim Akhtar           2022-01-24   137  		cpucl0_3: cpu@3 {
18b1db6a162c296 Alim Akhtar           2022-01-24   138  				device_type = "cpu";
18b1db6a162c296 Alim Akhtar           2022-01-24   139  				compatible = "arm,cortex-a72";
18b1db6a162c296 Alim Akhtar           2022-01-24   140  				reg = <0x0 0x003>;
18b1db6a162c296 Alim Akhtar           2022-01-24   141  				enable-method = "psci";
056106b030b73c7 Krzysztof Kozlowski   2025-02-19   142  				cpu-idle-states = <&cpu_sleep>;
5355559555b98cd Alim Akhtar           2022-05-18   143  				i-cache-size = <0xc000>;
5355559555b98cd Alim Akhtar           2022-05-18   144  				i-cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18   145  				i-cache-sets = <256>;
5355559555b98cd Alim Akhtar           2022-05-18   146  				d-cache-size = <0x8000>;
5355559555b98cd Alim Akhtar           2022-05-18   147  				d-cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18   148  				d-cache-sets = <256>;
5355559555b98cd Alim Akhtar           2022-05-18   149  				next-level-cache = <&cpucl_l2>;
18b1db6a162c296 Alim Akhtar           2022-01-24   150  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   151  
18b1db6a162c296 Alim Akhtar           2022-01-24   152  		/* Cluster 1 */
18b1db6a162c296 Alim Akhtar           2022-01-24   153  		cpucl1_0: cpu@100 {
18b1db6a162c296 Alim Akhtar           2022-01-24   154  				device_type = "cpu";
18b1db6a162c296 Alim Akhtar           2022-01-24   155  				compatible = "arm,cortex-a72";
18b1db6a162c296 Alim Akhtar           2022-01-24   156  				reg = <0x0 0x100>;
18b1db6a162c296 Alim Akhtar           2022-01-24   157  				enable-method = "psci";
18b1db6a162c296 Alim Akhtar           2022-01-24   158  				clock-frequency = <2400000000>;
056106b030b73c7 Krzysztof Kozlowski   2025-02-19   159  				cpu-idle-states = <&cpu_sleep>;
5355559555b98cd Alim Akhtar           2022-05-18   160  				i-cache-size = <0xc000>;
5355559555b98cd Alim Akhtar           2022-05-18   161  				i-cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18   162  				i-cache-sets = <256>;
5355559555b98cd Alim Akhtar           2022-05-18   163  				d-cache-size = <0x8000>;
5355559555b98cd Alim Akhtar           2022-05-18   164  				d-cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18   165  				d-cache-sets = <256>;
5355559555b98cd Alim Akhtar           2022-05-18   166  				next-level-cache = <&cpucl_l2>;
18b1db6a162c296 Alim Akhtar           2022-01-24   167  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   168  
18b1db6a162c296 Alim Akhtar           2022-01-24   169  		cpucl1_1: cpu@101 {
18b1db6a162c296 Alim Akhtar           2022-01-24   170  				device_type = "cpu";
18b1db6a162c296 Alim Akhtar           2022-01-24   171  				compatible = "arm,cortex-a72";
18b1db6a162c296 Alim Akhtar           2022-01-24   172  				reg = <0x0 0x101>;
18b1db6a162c296 Alim Akhtar           2022-01-24   173  				enable-method = "psci";
18b1db6a162c296 Alim Akhtar           2022-01-24   174  				clock-frequency = <2400000000>;
056106b030b73c7 Krzysztof Kozlowski   2025-02-19   175  				cpu-idle-states = <&cpu_sleep>;
5355559555b98cd Alim Akhtar           2022-05-18   176  				i-cache-size = <0xc000>;
5355559555b98cd Alim Akhtar           2022-05-18   177  				i-cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18   178  				i-cache-sets = <256>;
5355559555b98cd Alim Akhtar           2022-05-18   179  				d-cache-size = <0x8000>;
5355559555b98cd Alim Akhtar           2022-05-18   180  				d-cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18   181  				d-cache-sets = <256>;
5355559555b98cd Alim Akhtar           2022-05-18   182  				next-level-cache = <&cpucl_l2>;
18b1db6a162c296 Alim Akhtar           2022-01-24   183  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   184  
18b1db6a162c296 Alim Akhtar           2022-01-24   185  		cpucl1_2: cpu@102 {
18b1db6a162c296 Alim Akhtar           2022-01-24   186  				device_type = "cpu";
18b1db6a162c296 Alim Akhtar           2022-01-24   187  				compatible = "arm,cortex-a72";
18b1db6a162c296 Alim Akhtar           2022-01-24   188  				reg = <0x0 0x102>;
18b1db6a162c296 Alim Akhtar           2022-01-24   189  				enable-method = "psci";
18b1db6a162c296 Alim Akhtar           2022-01-24   190  				clock-frequency = <2400000000>;
056106b030b73c7 Krzysztof Kozlowski   2025-02-19   191  				cpu-idle-states = <&cpu_sleep>;
5355559555b98cd Alim Akhtar           2022-05-18   192  				i-cache-size = <0xc000>;
5355559555b98cd Alim Akhtar           2022-05-18   193  				i-cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18   194  				i-cache-sets = <256>;
5355559555b98cd Alim Akhtar           2022-05-18   195  				d-cache-size = <0x8000>;
5355559555b98cd Alim Akhtar           2022-05-18   196  				d-cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18   197  				d-cache-sets = <256>;
5355559555b98cd Alim Akhtar           2022-05-18   198  				next-level-cache = <&cpucl_l2>;
18b1db6a162c296 Alim Akhtar           2022-01-24   199  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   200  
18b1db6a162c296 Alim Akhtar           2022-01-24   201  		cpucl1_3: cpu@103 {
18b1db6a162c296 Alim Akhtar           2022-01-24   202  				device_type = "cpu";
18b1db6a162c296 Alim Akhtar           2022-01-24   203  				compatible = "arm,cortex-a72";
18b1db6a162c296 Alim Akhtar           2022-01-24   204  				reg = <0x0 0x103>;
18b1db6a162c296 Alim Akhtar           2022-01-24   205  				enable-method = "psci";
18b1db6a162c296 Alim Akhtar           2022-01-24   206  				clock-frequency = <2400000000>;
056106b030b73c7 Krzysztof Kozlowski   2025-02-19   207  				cpu-idle-states = <&cpu_sleep>;
5355559555b98cd Alim Akhtar           2022-05-18   208  				i-cache-size = <0xc000>;
5355559555b98cd Alim Akhtar           2022-05-18   209  				i-cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18   210  				i-cache-sets = <256>;
5355559555b98cd Alim Akhtar           2022-05-18   211  				d-cache-size = <0x8000>;
5355559555b98cd Alim Akhtar           2022-05-18   212  				d-cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18   213  				d-cache-sets = <256>;
5355559555b98cd Alim Akhtar           2022-05-18   214  				next-level-cache = <&cpucl_l2>;
18b1db6a162c296 Alim Akhtar           2022-01-24   215  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   216  
18b1db6a162c296 Alim Akhtar           2022-01-24   217  		/* Cluster 2 */
18b1db6a162c296 Alim Akhtar           2022-01-24   218  		cpucl2_0: cpu@200 {
18b1db6a162c296 Alim Akhtar           2022-01-24   219  				device_type = "cpu";
18b1db6a162c296 Alim Akhtar           2022-01-24   220  				compatible = "arm,cortex-a72";
18b1db6a162c296 Alim Akhtar           2022-01-24   221  				reg = <0x0 0x200>;
18b1db6a162c296 Alim Akhtar           2022-01-24   222  				enable-method = "psci";
18b1db6a162c296 Alim Akhtar           2022-01-24   223  				clock-frequency = <2400000000>;
056106b030b73c7 Krzysztof Kozlowski   2025-02-19   224  				cpu-idle-states = <&cpu_sleep>;
5355559555b98cd Alim Akhtar           2022-05-18   225  				i-cache-size = <0xc000>;
5355559555b98cd Alim Akhtar           2022-05-18   226  				i-cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18   227  				i-cache-sets = <256>;
5355559555b98cd Alim Akhtar           2022-05-18   228  				d-cache-size = <0x8000>;
5355559555b98cd Alim Akhtar           2022-05-18   229  				d-cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18   230  				d-cache-sets = <256>;
5355559555b98cd Alim Akhtar           2022-05-18   231  				next-level-cache = <&cpucl_l2>;
18b1db6a162c296 Alim Akhtar           2022-01-24   232  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   233  
18b1db6a162c296 Alim Akhtar           2022-01-24   234  		cpucl2_1: cpu@201 {
18b1db6a162c296 Alim Akhtar           2022-01-24   235  				device_type = "cpu";
18b1db6a162c296 Alim Akhtar           2022-01-24   236  				compatible = "arm,cortex-a72";
18b1db6a162c296 Alim Akhtar           2022-01-24   237  				reg = <0x0 0x201>;
18b1db6a162c296 Alim Akhtar           2022-01-24   238  				enable-method = "psci";
18b1db6a162c296 Alim Akhtar           2022-01-24   239  				clock-frequency = <2400000000>;
056106b030b73c7 Krzysztof Kozlowski   2025-02-19   240  				cpu-idle-states = <&cpu_sleep>;
5355559555b98cd Alim Akhtar           2022-05-18   241  				i-cache-size = <0xc000>;
5355559555b98cd Alim Akhtar           2022-05-18   242  				i-cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18   243  				i-cache-sets = <256>;
5355559555b98cd Alim Akhtar           2022-05-18   244  				d-cache-size = <0x8000>;
5355559555b98cd Alim Akhtar           2022-05-18   245  				d-cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18   246  				d-cache-sets = <256>;
5355559555b98cd Alim Akhtar           2022-05-18   247  				next-level-cache = <&cpucl_l2>;
18b1db6a162c296 Alim Akhtar           2022-01-24   248  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   249  
18b1db6a162c296 Alim Akhtar           2022-01-24   250  		cpucl2_2: cpu@202 {
18b1db6a162c296 Alim Akhtar           2022-01-24   251  				device_type = "cpu";
18b1db6a162c296 Alim Akhtar           2022-01-24   252  				compatible = "arm,cortex-a72";
18b1db6a162c296 Alim Akhtar           2022-01-24   253  				reg = <0x0 0x202>;
18b1db6a162c296 Alim Akhtar           2022-01-24   254  				enable-method = "psci";
18b1db6a162c296 Alim Akhtar           2022-01-24   255  				clock-frequency = <2400000000>;
056106b030b73c7 Krzysztof Kozlowski   2025-02-19   256  				cpu-idle-states = <&cpu_sleep>;
5355559555b98cd Alim Akhtar           2022-05-18   257  				i-cache-size = <0xc000>;
5355559555b98cd Alim Akhtar           2022-05-18   258  				i-cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18   259  				i-cache-sets = <256>;
5355559555b98cd Alim Akhtar           2022-05-18   260  				d-cache-size = <0x8000>;
5355559555b98cd Alim Akhtar           2022-05-18   261  				d-cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18   262  				d-cache-sets = <256>;
5355559555b98cd Alim Akhtar           2022-05-18   263  				next-level-cache = <&cpucl_l2>;
18b1db6a162c296 Alim Akhtar           2022-01-24   264  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   265  
18b1db6a162c296 Alim Akhtar           2022-01-24   266  		cpucl2_3: cpu@203 {
18b1db6a162c296 Alim Akhtar           2022-01-24   267  				device_type = "cpu";
18b1db6a162c296 Alim Akhtar           2022-01-24   268  				compatible = "arm,cortex-a72";
18b1db6a162c296 Alim Akhtar           2022-01-24   269  				reg = <0x0 0x203>;
18b1db6a162c296 Alim Akhtar           2022-01-24   270  				enable-method = "psci";
18b1db6a162c296 Alim Akhtar           2022-01-24   271  				clock-frequency = <2400000000>;
056106b030b73c7 Krzysztof Kozlowski   2025-02-19   272  				cpu-idle-states = <&cpu_sleep>;
5355559555b98cd Alim Akhtar           2022-05-18   273  				i-cache-size = <0xc000>;
5355559555b98cd Alim Akhtar           2022-05-18   274  				i-cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18   275  				i-cache-sets = <256>;
5355559555b98cd Alim Akhtar           2022-05-18   276  				d-cache-size = <0x8000>;
5355559555b98cd Alim Akhtar           2022-05-18   277  				d-cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18   278  				d-cache-sets = <256>;
5355559555b98cd Alim Akhtar           2022-05-18   279  				next-level-cache = <&cpucl_l2>;
5355559555b98cd Alim Akhtar           2022-05-18   280  		};
5355559555b98cd Alim Akhtar           2022-05-18   281  
5355559555b98cd Alim Akhtar           2022-05-18   282  		cpucl_l2: l2-cache0 {
5355559555b98cd Alim Akhtar           2022-05-18   283  			compatible = "cache";
493dedfe2977504 Pierre Gondois        2022-11-23   284  			cache-level = <2>;
493dedfe2977504 Pierre Gondois        2022-11-23   285  			cache-unified;
5355559555b98cd Alim Akhtar           2022-05-18   286  			cache-size = <0x400000>;
5355559555b98cd Alim Akhtar           2022-05-18   287  			cache-line-size = <64>;
5355559555b98cd Alim Akhtar           2022-05-18   288  			cache-sets = <4096>;
18b1db6a162c296 Alim Akhtar           2022-01-24   289  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   290  
18b1db6a162c296 Alim Akhtar           2022-01-24   291  		idle-states {
18b1db6a162c296 Alim Akhtar           2022-01-24   292  			entry-method = "psci";
18b1db6a162c296 Alim Akhtar           2022-01-24   293  
056106b030b73c7 Krzysztof Kozlowski   2025-02-19   294  			cpu_sleep: cpu-sleep {
18b1db6a162c296 Alim Akhtar           2022-01-24   295  				idle-state-name = "c2";
18b1db6a162c296 Alim Akhtar           2022-01-24   296  				compatible = "arm,idle-state";
18b1db6a162c296 Alim Akhtar           2022-01-24   297  				local-timer-stop;
18b1db6a162c296 Alim Akhtar           2022-01-24   298  				arm,psci-suspend-param = <0x0010000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   299  				entry-latency-us = <30>;
18b1db6a162c296 Alim Akhtar           2022-01-24   300  				exit-latency-us = <75>;
18b1db6a162c296 Alim Akhtar           2022-01-24   301  				min-residency-us = <300>;
18b1db6a162c296 Alim Akhtar           2022-01-24   302  			};
18b1db6a162c296 Alim Akhtar           2022-01-24   303  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   304  	};
18b1db6a162c296 Alim Akhtar           2022-01-24   305  
18b1db6a162c296 Alim Akhtar           2022-01-24   306  	arm-pmu {
8b40a46966d294b Rob Herring           2024-04-17   307  		compatible = "arm,cortex-a72-pmu";
18b1db6a162c296 Alim Akhtar           2022-01-24   308  		interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>,
18b1db6a162c296 Alim Akhtar           2022-01-24   309  			     <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
18b1db6a162c296 Alim Akhtar           2022-01-24   310  			     <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
18b1db6a162c296 Alim Akhtar           2022-01-24   311  			     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
18b1db6a162c296 Alim Akhtar           2022-01-24   312  			     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
18b1db6a162c296 Alim Akhtar           2022-01-24   313  			     <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
18b1db6a162c296 Alim Akhtar           2022-01-24   314  			     <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
18b1db6a162c296 Alim Akhtar           2022-01-24   315  			     <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>,
18b1db6a162c296 Alim Akhtar           2022-01-24   316  			     <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
18b1db6a162c296 Alim Akhtar           2022-01-24   317  			     <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
18b1db6a162c296 Alim Akhtar           2022-01-24   318  			     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
18b1db6a162c296 Alim Akhtar           2022-01-24   319  			     <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>;
18b1db6a162c296 Alim Akhtar           2022-01-24   320  		interrupt-affinity = <&cpucl0_0>, <&cpucl0_1>, <&cpucl0_2>,
18b1db6a162c296 Alim Akhtar           2022-01-24   321  				     <&cpucl0_3>, <&cpucl1_0>, <&cpucl1_1>,
18b1db6a162c296 Alim Akhtar           2022-01-24   322  				     <&cpucl1_2>, <&cpucl1_3>, <&cpucl2_0>,
18b1db6a162c296 Alim Akhtar           2022-01-24   323  				     <&cpucl2_1>, <&cpucl2_2>, <&cpucl2_3>;
18b1db6a162c296 Alim Akhtar           2022-01-24   324  	};
18b1db6a162c296 Alim Akhtar           2022-01-24   325  
18b1db6a162c296 Alim Akhtar           2022-01-24   326  	psci {
18b1db6a162c296 Alim Akhtar           2022-01-24   327  		compatible = "arm,psci-1.0";
18b1db6a162c296 Alim Akhtar           2022-01-24   328  		method = "smc";
18b1db6a162c296 Alim Akhtar           2022-01-24   329  	};
18b1db6a162c296 Alim Akhtar           2022-01-24   330  
18b1db6a162c296 Alim Akhtar           2022-01-24   331  	timer {
18b1db6a162c296 Alim Akhtar           2022-01-24   332  		compatible = "arm,armv8-timer";
18b1db6a162c296 Alim Akhtar           2022-01-24   333  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
18b1db6a162c296 Alim Akhtar           2022-01-24   334  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
18b1db6a162c296 Alim Akhtar           2022-01-24   335  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
18b1db6a162c296 Alim Akhtar           2022-01-24   336  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
18b1db6a162c296 Alim Akhtar           2022-01-24   337  	};
18b1db6a162c296 Alim Akhtar           2022-01-24   338  
18b1db6a162c296 Alim Akhtar           2022-01-24   339  	fin_pll: clock {
18b1db6a162c296 Alim Akhtar           2022-01-24   340  		compatible = "fixed-clock";
18b1db6a162c296 Alim Akhtar           2022-01-24   341  		clock-output-names = "fin_pll";
18b1db6a162c296 Alim Akhtar           2022-01-24   342  		#clock-cells = <0>;
18b1db6a162c296 Alim Akhtar           2022-01-24   343  	};
18b1db6a162c296 Alim Akhtar           2022-01-24   344  
a41d9b3287b1d2d Aakarsh Jain          2023-12-06   345  	reserved-memory {
a41d9b3287b1d2d Aakarsh Jain          2023-12-06   346  		#address-cells = <2>;
a41d9b3287b1d2d Aakarsh Jain          2023-12-06   347  		#size-cells = <2>;
a41d9b3287b1d2d Aakarsh Jain          2023-12-06   348  		ranges;
a41d9b3287b1d2d Aakarsh Jain          2023-12-06   349  
a41d9b3287b1d2d Aakarsh Jain          2023-12-06   350  		mfc_left: region@84000000 {
a41d9b3287b1d2d Aakarsh Jain          2023-12-06   351  			compatible = "shared-dma-pool";
a41d9b3287b1d2d Aakarsh Jain          2023-12-06   352  			no-map;
a41d9b3287b1d2d Aakarsh Jain          2023-12-06   353  			reg = <0 0x84000000 0 0x8000000>;
a41d9b3287b1d2d Aakarsh Jain          2023-12-06   354  		};
a41d9b3287b1d2d Aakarsh Jain          2023-12-06   355  	};
a41d9b3287b1d2d Aakarsh Jain          2023-12-06   356  
18b1db6a162c296 Alim Akhtar           2022-01-24   357  	soc: soc@0 {
18b1db6a162c296 Alim Akhtar           2022-01-24   358  		compatible = "simple-bus";
18b1db6a162c296 Alim Akhtar           2022-01-24   359  		#address-cells = <2>;
18b1db6a162c296 Alim Akhtar           2022-01-24   360  		#size-cells = <2>;
18b1db6a162c296 Alim Akhtar           2022-01-24   361  		ranges = <0x0 0x0 0x0 0x0 0x0 0x18000000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   362  		dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
18b1db6a162c296 Alim Akhtar           2022-01-24   363  
18b1db6a162c296 Alim Akhtar           2022-01-24   364  		gic: interrupt-controller@10400000 {
18b1db6a162c296 Alim Akhtar           2022-01-24   365  			compatible = "arm,gic-v3";
18b1db6a162c296 Alim Akhtar           2022-01-24   366  			#interrupt-cells = <3>;
18b1db6a162c296 Alim Akhtar           2022-01-24   367  			interrupt-controller;
18b1db6a162c296 Alim Akhtar           2022-01-24   368  			reg = <0x0 0x10400000 0x0 0x10000>, /* GICD */
18b1db6a162c296 Alim Akhtar           2022-01-24   369  			      <0x0 0x10600000 0x0 0x200000>; /* GICR_RD+GICR_SGI */
18b1db6a162c296 Alim Akhtar           2022-01-24   370  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
18b1db6a162c296 Alim Akhtar           2022-01-24   371  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   372  
18b1db6a162c296 Alim Akhtar           2022-01-24   373  		smmu_imem: iommu@10200000 {
18b1db6a162c296 Alim Akhtar           2022-01-24   374  			compatible = "arm,mmu-500";
18b1db6a162c296 Alim Akhtar           2022-01-24   375  			reg = <0x0 0x10200000 0x0 0x10000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   376  			#iommu-cells = <2>;
18b1db6a162c296 Alim Akhtar           2022-01-24   377  			#global-interrupts = <7>;
18b1db6a162c296 Alim Akhtar           2022-01-24   378  			interrupts = <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>, /* Global secure fault */
18b1db6a162c296 Alim Akhtar           2022-01-24   379  				     <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>, /* Global non-secure fault */
18b1db6a162c296 Alim Akhtar           2022-01-24   380  				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>, /* Combined secure interrupt */
18b1db6a162c296 Alim Akhtar           2022-01-24   381  				     <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>, /* Combined non-secure interrupt */
18b1db6a162c296 Alim Akhtar           2022-01-24   382  				     /* Performance counter interrupts */
18b1db6a162c296 Alim Akhtar           2022-01-24   383  				     <GIC_SPI 441 IRQ_TYPE_LEVEL_HIGH>, /* for FSYS1_0 */
18b1db6a162c296 Alim Akhtar           2022-01-24   384  				     <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>, /* for FSYS1_1 */
18b1db6a162c296 Alim Akhtar           2022-01-24   385  				     <GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>, /* for IMEM_0  */
18b1db6a162c296 Alim Akhtar           2022-01-24   386  				     /* Per context non-secure context interrupts, 0-3 interrupts */
18b1db6a162c296 Alim Akhtar           2022-01-24   387  				     <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>, /* for CONTEXT_0 */
18b1db6a162c296 Alim Akhtar           2022-01-24   388  				     <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>, /* for CONTEXT_1 */
18b1db6a162c296 Alim Akhtar           2022-01-24   389  				     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>, /* for CONTEXT_2 */
18b1db6a162c296 Alim Akhtar           2022-01-24   390  				     <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>; /* for CONTEXT_3 */
18b1db6a162c296 Alim Akhtar           2022-01-24   391  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   392  
18b1db6a162c296 Alim Akhtar           2022-01-24   393  		smmu_isp: iommu@12100000 {
18b1db6a162c296 Alim Akhtar           2022-01-24   394  			compatible = "arm,mmu-500";
18b1db6a162c296 Alim Akhtar           2022-01-24   395  			reg = <0x0 0x12100000 0x0 0x10000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   396  			#iommu-cells = <2>;
18b1db6a162c296 Alim Akhtar           2022-01-24   397  			#global-interrupts = <11>;
18b1db6a162c296 Alim Akhtar           2022-01-24   398  			interrupts = <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>, /* Global secure fault */
18b1db6a162c296 Alim Akhtar           2022-01-24   399  				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>, /* Global non-secure fault */
18b1db6a162c296 Alim Akhtar           2022-01-24   400  				     <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>, /* Combined secure interrupt */
18b1db6a162c296 Alim Akhtar           2022-01-24   401  				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>, /* Combined non-secure interrupt */
18b1db6a162c296 Alim Akhtar           2022-01-24   402  				     /* Performance counter interrupts */
18b1db6a162c296 Alim Akhtar           2022-01-24   403  				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>, /* for CAM_CSI   */
18b1db6a162c296 Alim Akhtar           2022-01-24   404  				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>, /* for CAM_DP_0  */
18b1db6a162c296 Alim Akhtar           2022-01-24   405  				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>, /* for CAM_DP_1  */
18b1db6a162c296 Alim Akhtar           2022-01-24   406  				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>, /* for CAM_ISP_0 */
18b1db6a162c296 Alim Akhtar           2022-01-24   407  				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>, /* for CAM_ISP_1 */
18b1db6a162c296 Alim Akhtar           2022-01-24   408  				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>, /* for CAM_MFC_0 */
18b1db6a162c296 Alim Akhtar           2022-01-24   409  				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>, /* for CAM_MFC_1 */
18b1db6a162c296 Alim Akhtar           2022-01-24   410  				     /* Per context non-secure context interrupts, 0-7 interrupts */
18b1db6a162c296 Alim Akhtar           2022-01-24   411  				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>, /* for CONTEXT_0 */
18b1db6a162c296 Alim Akhtar           2022-01-24   412  				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>, /* for CONTEXT_1 */
18b1db6a162c296 Alim Akhtar           2022-01-24   413  				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>, /* for CONTEXT_2 */
18b1db6a162c296 Alim Akhtar           2022-01-24   414  				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>, /* for CONTEXT_3 */
18b1db6a162c296 Alim Akhtar           2022-01-24   415  				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>, /* for CONTEXT_4 */
18b1db6a162c296 Alim Akhtar           2022-01-24   416  				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>, /* for CONTEXT_5 */
18b1db6a162c296 Alim Akhtar           2022-01-24   417  				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>, /* for CONTEXT_6 */
18b1db6a162c296 Alim Akhtar           2022-01-24   418  				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>; /* for CONTEXT_7 */
18b1db6a162c296 Alim Akhtar           2022-01-24   419  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   420  
18b1db6a162c296 Alim Akhtar           2022-01-24   421  		smmu_peric: iommu@14900000 {
18b1db6a162c296 Alim Akhtar           2022-01-24   422  			compatible = "arm,mmu-500";
18b1db6a162c296 Alim Akhtar           2022-01-24   423  			reg = <0x0 0x14900000 0x0 0x10000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   424  			#iommu-cells = <2>;
18b1db6a162c296 Alim Akhtar           2022-01-24   425  			#global-interrupts = <5>;
18b1db6a162c296 Alim Akhtar           2022-01-24   426  			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>, /* Global secure fault */
18b1db6a162c296 Alim Akhtar           2022-01-24   427  				     <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>, /* Global non-secure fault */
18b1db6a162c296 Alim Akhtar           2022-01-24   428  				     <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>, /* Combined secure interrupt */
18b1db6a162c296 Alim Akhtar           2022-01-24   429  				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>, /* Combined non-secure interrupt */
18b1db6a162c296 Alim Akhtar           2022-01-24   430  				     /* Performance counter interrupts */
18b1db6a162c296 Alim Akhtar           2022-01-24   431  				     <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>, /* for PERIC */
18b1db6a162c296 Alim Akhtar           2022-01-24   432  				     /* Per context non-secure context interrupts, 0-1 interrupts */
18b1db6a162c296 Alim Akhtar           2022-01-24   433  				     <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>, /* for CONTEXT_0 */
18b1db6a162c296 Alim Akhtar           2022-01-24   434  				     <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>; /* for CONTEXT_1 */
18b1db6a162c296 Alim Akhtar           2022-01-24   435  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   436  
18b1db6a162c296 Alim Akhtar           2022-01-24   437  		smmu_fsys0: iommu@15450000 {
18b1db6a162c296 Alim Akhtar           2022-01-24   438  			compatible = "arm,mmu-500";
18b1db6a162c296 Alim Akhtar           2022-01-24   439  			reg = <0x0 0x15450000 0x0 0x10000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   440  			#iommu-cells = <2>;
18b1db6a162c296 Alim Akhtar           2022-01-24   441  			#global-interrupts = <5>;
18b1db6a162c296 Alim Akhtar           2022-01-24   442  			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>, /* Global secure fault */
18b1db6a162c296 Alim Akhtar           2022-01-24   443  				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>, /* Global non-secure fault */
18b1db6a162c296 Alim Akhtar           2022-01-24   444  				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>, /* Combined secure interrupt */
18b1db6a162c296 Alim Akhtar           2022-01-24   445  				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>, /* Combined non-secure interrupt */
18b1db6a162c296 Alim Akhtar           2022-01-24   446  				     /* Performance counter interrupts */
18b1db6a162c296 Alim Akhtar           2022-01-24   447  				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>, /* for FSYS0   */
18b1db6a162c296 Alim Akhtar           2022-01-24   448  				     /* Per context non-secure context interrupts, 0-1 interrupts */
18b1db6a162c296 Alim Akhtar           2022-01-24   449  				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>, /* for CONTEXT_0 */
18b1db6a162c296 Alim Akhtar           2022-01-24   450  				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>; /* for CONTEXT_1 */
18b1db6a162c296 Alim Akhtar           2022-01-24   451  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   452  
18b1db6a162c296 Alim Akhtar           2022-01-24   453  		clock_imem: clock-controller@10010000 {
18b1db6a162c296 Alim Akhtar           2022-01-24   454  			compatible = "tesla,fsd-clock-imem";
18b1db6a162c296 Alim Akhtar           2022-01-24   455  			reg = <0x0 0x10010000 0x0 0x3000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   456  			#clock-cells = <1>;
18b1db6a162c296 Alim Akhtar           2022-01-24   457  			clocks = <&fin_pll>,
18b1db6a162c296 Alim Akhtar           2022-01-24   458  				<&clock_cmu DOUT_CMU_IMEM_TCUCLK>,
18b1db6a162c296 Alim Akhtar           2022-01-24   459  				<&clock_cmu DOUT_CMU_IMEM_ACLK>,
18b1db6a162c296 Alim Akhtar           2022-01-24   460  				<&clock_cmu DOUT_CMU_IMEM_DMACLK>;
18b1db6a162c296 Alim Akhtar           2022-01-24   461  			clock-names = "fin_pll",
18b1db6a162c296 Alim Akhtar           2022-01-24   462  				"dout_cmu_imem_tcuclk",
18b1db6a162c296 Alim Akhtar           2022-01-24   463  				"dout_cmu_imem_aclk",
18b1db6a162c296 Alim Akhtar           2022-01-24   464  				"dout_cmu_imem_dmaclk";
18b1db6a162c296 Alim Akhtar           2022-01-24   465  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   466  
18b1db6a162c296 Alim Akhtar           2022-01-24   467  		clock_cmu: clock-controller@11c10000 {
18b1db6a162c296 Alim Akhtar           2022-01-24   468  			compatible = "tesla,fsd-clock-cmu";
18b1db6a162c296 Alim Akhtar           2022-01-24   469  			reg = <0x0 0x11c10000 0x0 0x3000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   470  			#clock-cells = <1>;
18b1db6a162c296 Alim Akhtar           2022-01-24   471  			clocks = <&fin_pll>;
18b1db6a162c296 Alim Akhtar           2022-01-24   472  			clock-names = "fin_pll";
18b1db6a162c296 Alim Akhtar           2022-01-24   473  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   474  
18b1db6a162c296 Alim Akhtar           2022-01-24   475  		clock_csi: clock-controller@12610000 {
18b1db6a162c296 Alim Akhtar           2022-01-24   476  			compatible = "tesla,fsd-clock-cam_csi";
18b1db6a162c296 Alim Akhtar           2022-01-24   477  			reg = <0x0 0x12610000 0x0 0x3000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   478  			#clock-cells = <1>;
18b1db6a162c296 Alim Akhtar           2022-01-24   479  			clocks = <&fin_pll>;
18b1db6a162c296 Alim Akhtar           2022-01-24   480  			clock-names = "fin_pll";
18b1db6a162c296 Alim Akhtar           2022-01-24   481  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   482  
beaf55952d46fb1 Sriranjani P          2022-11-29   483  		sysreg_cam: system-controller@12630000 {
beaf55952d46fb1 Sriranjani P          2022-11-29   484  			compatible = "tesla,fsd-cam-sysreg", "syscon";
beaf55952d46fb1 Sriranjani P          2022-11-29   485  			reg = <0x0 0x12630000 0x0 0x500>;
beaf55952d46fb1 Sriranjani P          2022-11-29   486  		};
beaf55952d46fb1 Sriranjani P          2022-11-29   487  
18b1db6a162c296 Alim Akhtar           2022-01-24   488  		clock_mfc: clock-controller@12810000 {
18b1db6a162c296 Alim Akhtar           2022-01-24   489  			compatible = "tesla,fsd-clock-mfc";
18b1db6a162c296 Alim Akhtar           2022-01-24   490  			reg = <0x0 0x12810000 0x0 0x3000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   491  			#clock-cells = <1>;
18b1db6a162c296 Alim Akhtar           2022-01-24   492  			clocks = <&fin_pll>;
18b1db6a162c296 Alim Akhtar           2022-01-24   493  			clock-names = "fin_pll";
18b1db6a162c296 Alim Akhtar           2022-01-24   494  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   495  
18b1db6a162c296 Alim Akhtar           2022-01-24   496  		clock_peric: clock-controller@14010000 {
18b1db6a162c296 Alim Akhtar           2022-01-24   497  			compatible = "tesla,fsd-clock-peric";
18b1db6a162c296 Alim Akhtar           2022-01-24   498  			reg = <0x0 0x14010000 0x0 0x3000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   499  			#clock-cells = <1>;
18b1db6a162c296 Alim Akhtar           2022-01-24   500  			clocks = <&fin_pll>,
18b1db6a162c296 Alim Akhtar           2022-01-24   501  				<&clock_cmu DOUT_CMU_PLL_SHARED0_DIV4>,
18b1db6a162c296 Alim Akhtar           2022-01-24   502  				<&clock_cmu DOUT_CMU_PERIC_SHARED1DIV36>,
18b1db6a162c296 Alim Akhtar           2022-01-24   503  				<&clock_cmu DOUT_CMU_PERIC_SHARED0DIV3_TBUCLK>,
18b1db6a162c296 Alim Akhtar           2022-01-24   504  				<&clock_cmu DOUT_CMU_PERIC_SHARED0DIV20>,
18b1db6a162c296 Alim Akhtar           2022-01-24   505  				<&clock_cmu DOUT_CMU_PERIC_SHARED1DIV4_DMACLK>;
18b1db6a162c296 Alim Akhtar           2022-01-24   506  			clock-names = "fin_pll",
18b1db6a162c296 Alim Akhtar           2022-01-24   507  				"dout_cmu_pll_shared0_div4",
18b1db6a162c296 Alim Akhtar           2022-01-24   508  				"dout_cmu_peric_shared1div36",
18b1db6a162c296 Alim Akhtar           2022-01-24   509  				"dout_cmu_peric_shared0div3_tbuclk",
18b1db6a162c296 Alim Akhtar           2022-01-24   510  				"dout_cmu_peric_shared0div20",
18b1db6a162c296 Alim Akhtar           2022-01-24   511  				"dout_cmu_peric_shared1div4_dmaclk";
18b1db6a162c296 Alim Akhtar           2022-01-24   512  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   513  
beaf55952d46fb1 Sriranjani P          2022-11-29   514  		sysreg_peric: system-controller@14030000 {
beaf55952d46fb1 Sriranjani P          2022-11-29   515  			compatible = "tesla,fsd-peric-sysreg", "syscon";
beaf55952d46fb1 Sriranjani P          2022-11-29   516  			reg = <0x0 0x14030000 0x0 0x1000>;
beaf55952d46fb1 Sriranjani P          2022-11-29   517  		};
beaf55952d46fb1 Sriranjani P          2022-11-29   518  
18b1db6a162c296 Alim Akhtar           2022-01-24   519  		clock_fsys0: clock-controller@15010000 {
18b1db6a162c296 Alim Akhtar           2022-01-24   520  			compatible = "tesla,fsd-clock-fsys0";
18b1db6a162c296 Alim Akhtar           2022-01-24   521  			reg = <0x0 0x15010000 0x0 0x3000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   522  			#clock-cells = <1>;
18b1db6a162c296 Alim Akhtar           2022-01-24   523  			clocks = <&fin_pll>,
18b1db6a162c296 Alim Akhtar           2022-01-24   524  				<&clock_cmu DOUT_CMU_PLL_SHARED0_DIV6>,
18b1db6a162c296 Alim Akhtar           2022-01-24   525  				<&clock_cmu DOUT_CMU_FSYS0_SHARED1DIV4>,
18b1db6a162c296 Alim Akhtar           2022-01-24   526  				<&clock_cmu DOUT_CMU_FSYS0_SHARED0DIV4>;
18b1db6a162c296 Alim Akhtar           2022-01-24   527  			clock-names = "fin_pll",
18b1db6a162c296 Alim Akhtar           2022-01-24   528  				"dout_cmu_pll_shared0_div6",
18b1db6a162c296 Alim Akhtar           2022-01-24   529  				"dout_cmu_fsys0_shared1div4",
18b1db6a162c296 Alim Akhtar           2022-01-24   530  				"dout_cmu_fsys0_shared0div4";
18b1db6a162c296 Alim Akhtar           2022-01-24   531  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   532  
beaf55952d46fb1 Sriranjani P          2022-11-29   533  		sysreg_fsys0: system-controller@15030000 {
beaf55952d46fb1 Sriranjani P          2022-11-29   534  			compatible = "tesla,fsd-fsys0-sysreg", "syscon";
beaf55952d46fb1 Sriranjani P          2022-11-29   535  			reg = <0x0 0x15030000 0x0 0x1000>;
beaf55952d46fb1 Sriranjani P          2022-11-29   536  		};
beaf55952d46fb1 Sriranjani P          2022-11-29   537  
18b1db6a162c296 Alim Akhtar           2022-01-24   538  		clock_fsys1: clock-controller@16810000 {
18b1db6a162c296 Alim Akhtar           2022-01-24   539  			compatible = "tesla,fsd-clock-fsys1";
18b1db6a162c296 Alim Akhtar           2022-01-24   540  			reg = <0x0 0x16810000 0x0 0x3000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   541  			#clock-cells = <1>;
18b1db6a162c296 Alim Akhtar           2022-01-24   542  			clocks = <&fin_pll>,
18b1db6a162c296 Alim Akhtar           2022-01-24   543  				<&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV8>,
18b1db6a162c296 Alim Akhtar           2022-01-24   544  				<&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV4>;
18b1db6a162c296 Alim Akhtar           2022-01-24   545  			clock-names = "fin_pll",
18b1db6a162c296 Alim Akhtar           2022-01-24   546  				"dout_cmu_fsys1_shared0div8",
18b1db6a162c296 Alim Akhtar           2022-01-24   547  				"dout_cmu_fsys1_shared0div4";
18b1db6a162c296 Alim Akhtar           2022-01-24   548  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   549  
beaf55952d46fb1 Sriranjani P          2022-11-29   550  		sysreg_fsys1: system-controller@16830000 {
beaf55952d46fb1 Sriranjani P          2022-11-29   551  			compatible = "tesla,fsd-fsys1-sysreg", "syscon";
beaf55952d46fb1 Sriranjani P          2022-11-29   552  			reg = <0x0 0x16830000 0x0 0x1000>;
beaf55952d46fb1 Sriranjani P          2022-11-29   553  		};
beaf55952d46fb1 Sriranjani P          2022-11-29   554  
18b1db6a162c296 Alim Akhtar           2022-01-24   555  		mdma0: dma-controller@10100000 {
18b1db6a162c296 Alim Akhtar           2022-01-24   556  			compatible = "arm,pl330", "arm,primecell";
18b1db6a162c296 Alim Akhtar           2022-01-24   557  			reg = <0x0 0x10100000 0x0 0x1000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   558  			interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
18b1db6a162c296 Alim Akhtar           2022-01-24   559  			#dma-cells = <1>;
18b1db6a162c296 Alim Akhtar           2022-01-24   560  			clocks = <&clock_imem IMEM_DMA0_IPCLKPORT_ACLK>;
18b1db6a162c296 Alim Akhtar           2022-01-24   561  			clock-names = "apb_pclk";
18b1db6a162c296 Alim Akhtar           2022-01-24   562  			iommus = <&smmu_imem 0x800 0x0>;
18b1db6a162c296 Alim Akhtar           2022-01-24   563  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   564  
18b1db6a162c296 Alim Akhtar           2022-01-24   565  		mdma1: dma-controller@10110000 {
18b1db6a162c296 Alim Akhtar           2022-01-24   566  			compatible = "arm,pl330", "arm,primecell";
18b1db6a162c296 Alim Akhtar           2022-01-24   567  			reg = <0x0 0x10110000 0x0 0x1000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   568  			interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
18b1db6a162c296 Alim Akhtar           2022-01-24   569  			#dma-cells = <1>;
18b1db6a162c296 Alim Akhtar           2022-01-24   570  			clocks = <&clock_imem IMEM_DMA1_IPCLKPORT_ACLK>;
18b1db6a162c296 Alim Akhtar           2022-01-24   571  			clock-names = "apb_pclk";
18b1db6a162c296 Alim Akhtar           2022-01-24   572  			iommus = <&smmu_imem 0x801 0x0>;
18b1db6a162c296 Alim Akhtar           2022-01-24   573  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   574  
18b1db6a162c296 Alim Akhtar           2022-01-24   575  		pdma0: dma-controller@14280000 {
18b1db6a162c296 Alim Akhtar           2022-01-24   576  			compatible = "arm,pl330", "arm,primecell";
18b1db6a162c296 Alim Akhtar           2022-01-24   577  			reg = <0x0 0x14280000 0x0 0x1000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   578  			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
18b1db6a162c296 Alim Akhtar           2022-01-24   579  			#dma-cells = <1>;
18b1db6a162c296 Alim Akhtar           2022-01-24   580  			clocks = <&clock_peric PERIC_DMA0_IPCLKPORT_ACLK>;
18b1db6a162c296 Alim Akhtar           2022-01-24   581  			clock-names = "apb_pclk";
18b1db6a162c296 Alim Akhtar           2022-01-24   582  			iommus = <&smmu_peric 0x2 0x0>;
18b1db6a162c296 Alim Akhtar           2022-01-24   583  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   584  
18b1db6a162c296 Alim Akhtar           2022-01-24   585  		pdma1: dma-controller@14290000 {
18b1db6a162c296 Alim Akhtar           2022-01-24   586  			compatible = "arm,pl330", "arm,primecell";
18b1db6a162c296 Alim Akhtar           2022-01-24   587  			reg = <0x0 0x14290000 0x0 0x1000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   588  			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
18b1db6a162c296 Alim Akhtar           2022-01-24   589  			#dma-cells = <1>;
18b1db6a162c296 Alim Akhtar           2022-01-24   590  			clocks = <&clock_peric PERIC_DMA1_IPCLKPORT_ACLK>;
18b1db6a162c296 Alim Akhtar           2022-01-24   591  			clock-names = "apb_pclk";
18b1db6a162c296 Alim Akhtar           2022-01-24   592  			iommus = <&smmu_peric 0x1 0x0>;
18b1db6a162c296 Alim Akhtar           2022-01-24   593  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   594  
18b1db6a162c296 Alim Akhtar           2022-01-24   595  		serial_0: serial@14180000 {
5f257922c5948c5 Krzysztof Kozlowski   2023-12-05   596  			compatible = "tesla,fsd-uart", "samsung,exynos4210-uart";
18b1db6a162c296 Alim Akhtar           2022-01-24   597  			reg = <0x0 0x14180000 0x0 0x100>;
18b1db6a162c296 Alim Akhtar           2022-01-24   598  			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
18b1db6a162c296 Alim Akhtar           2022-01-24   599  			dmas = <&pdma1 1>, <&pdma1 0>;
18b1db6a162c296 Alim Akhtar           2022-01-24   600  			dma-names = "rx", "tx";
18b1db6a162c296 Alim Akhtar           2022-01-24   601  			clocks = <&clock_peric PERIC_PCLK_UART0>,
18b1db6a162c296 Alim Akhtar           2022-01-24   602  				 <&clock_peric PERIC_SCLK_UART0>;
18b1db6a162c296 Alim Akhtar           2022-01-24   603  			clock-names = "uart", "clk_uart_baud0";
0791f541ff42f0b Tamseel Shams         2024-02-05   604  			samsung,uart-fifosize = <64>;
18b1db6a162c296 Alim Akhtar           2022-01-24   605  			status = "disabled";
18b1db6a162c296 Alim Akhtar           2022-01-24   606  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   607  
18b1db6a162c296 Alim Akhtar           2022-01-24   608  		serial_1: serial@14190000 {
5f257922c5948c5 Krzysztof Kozlowski   2023-12-05   609  			compatible = "tesla,fsd-uart", "samsung,exynos4210-uart";
18b1db6a162c296 Alim Akhtar           2022-01-24   610  			reg = <0x0 0x14190000 0x0 0x100>;
18b1db6a162c296 Alim Akhtar           2022-01-24   611  			interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
18b1db6a162c296 Alim Akhtar           2022-01-24   612  			dmas = <&pdma1 3>, <&pdma1 2>;
18b1db6a162c296 Alim Akhtar           2022-01-24   613  			dma-names = "rx", "tx";
18b1db6a162c296 Alim Akhtar           2022-01-24   614  			clocks = <&clock_peric PERIC_PCLK_UART1>,
18b1db6a162c296 Alim Akhtar           2022-01-24   615  				 <&clock_peric PERIC_SCLK_UART1>;
18b1db6a162c296 Alim Akhtar           2022-01-24   616  			clock-names = "uart", "clk_uart_baud0";
0791f541ff42f0b Tamseel Shams         2024-02-05   617  			samsung,uart-fifosize = <64>;
18b1db6a162c296 Alim Akhtar           2022-01-24   618  			status = "disabled";
18b1db6a162c296 Alim Akhtar           2022-01-24   619  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   620  
18b1db6a162c296 Alim Akhtar           2022-01-24   621  		pmu_system_controller: system-controller@11400000 {
5f257922c5948c5 Krzysztof Kozlowski   2023-12-05   622  			compatible = "tesla,fsd-pmu", "samsung,exynos7-pmu", "syscon";
18b1db6a162c296 Alim Akhtar           2022-01-24   623  			reg = <0x0 0x11400000 0x0 0x5000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   624  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   625  
18b1db6a162c296 Alim Akhtar           2022-01-24   626  		watchdog_0: watchdog@100a0000 {
5f257922c5948c5 Krzysztof Kozlowski   2023-12-05   627  			compatible = "tesla,fsd-wdt", "samsung,exynos7-wdt";
18b1db6a162c296 Alim Akhtar           2022-01-24   628  			reg = <0x0 0x100a0000 0x0 0x100>;
18b1db6a162c296 Alim Akhtar           2022-01-24   629  			interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>;
18b1db6a162c296 Alim Akhtar           2022-01-24   630  			samsung,syscon-phandle = <&pmu_system_controller>;
18b1db6a162c296 Alim Akhtar           2022-01-24   631  			clocks = <&fin_pll>;
18b1db6a162c296 Alim Akhtar           2022-01-24   632  			clock-names = "watchdog";
18b1db6a162c296 Alim Akhtar           2022-01-24   633  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   634  
18b1db6a162c296 Alim Akhtar           2022-01-24   635  		watchdog_1: watchdog@100b0000 {
5f257922c5948c5 Krzysztof Kozlowski   2023-12-05   636  			compatible = "tesla,fsd-wdt", "samsung,exynos7-wdt";
18b1db6a162c296 Alim Akhtar           2022-01-24   637  			reg = <0x0 0x100b0000 0x0 0x100>;
18b1db6a162c296 Alim Akhtar           2022-01-24   638  			interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
18b1db6a162c296 Alim Akhtar           2022-01-24   639  			samsung,syscon-phandle = <&pmu_system_controller>;
18b1db6a162c296 Alim Akhtar           2022-01-24   640  			clocks = <&fin_pll>;
18b1db6a162c296 Alim Akhtar           2022-01-24   641  			clock-names = "watchdog";
18b1db6a162c296 Alim Akhtar           2022-01-24   642  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   643  
18b1db6a162c296 Alim Akhtar           2022-01-24   644  		watchdog_2: watchdog@100c0000 {
5f257922c5948c5 Krzysztof Kozlowski   2023-12-05   645  			compatible = "tesla,fsd-wdt", "samsung,exynos7-wdt";
18b1db6a162c296 Alim Akhtar           2022-01-24   646  			reg = <0x0 0x100c0000 0x0 0x100>;
18b1db6a162c296 Alim Akhtar           2022-01-24   647  			interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>;
18b1db6a162c296 Alim Akhtar           2022-01-24   648  			samsung,syscon-phandle = <&pmu_system_controller>;
18b1db6a162c296 Alim Akhtar           2022-01-24   649  			clocks = <&fin_pll>;
18b1db6a162c296 Alim Akhtar           2022-01-24   650  			clock-names = "watchdog";
18b1db6a162c296 Alim Akhtar           2022-01-24   651  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   652  
18b1db6a162c296 Alim Akhtar           2022-01-24   653  		pwm_0: pwm@14100000 {
5f257922c5948c5 Krzysztof Kozlowski   2023-12-05   654  			compatible = "tesla,fsd-pwm", "samsung,exynos4210-pwm";
18b1db6a162c296 Alim Akhtar           2022-01-24   655  			reg = <0x0 0x14100000 0x0 0x100>;
18b1db6a162c296 Alim Akhtar           2022-01-24   656  			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
18b1db6a162c296 Alim Akhtar           2022-01-24   657  			#pwm-cells = <3>;
18b1db6a162c296 Alim Akhtar           2022-01-24   658  			clocks = <&clock_peric PERIC_PWM0_IPCLKPORT_I_PCLK_S0>;
18b1db6a162c296 Alim Akhtar           2022-01-24   659  			clock-names = "timers";
18b1db6a162c296 Alim Akhtar           2022-01-24   660  			status = "disabled";
18b1db6a162c296 Alim Akhtar           2022-01-24   661  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   662  
18b1db6a162c296 Alim Akhtar           2022-01-24   663  		pwm_1: pwm@14110000 {
5f257922c5948c5 Krzysztof Kozlowski   2023-12-05   664  			compatible = "tesla,fsd-pwm", "samsung,exynos4210-pwm";
18b1db6a162c296 Alim Akhtar           2022-01-24   665  			reg = <0x0 0x14110000 0x0 0x100>;
18b1db6a162c296 Alim Akhtar           2022-01-24   666  			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
18b1db6a162c296 Alim Akhtar           2022-01-24   667  			#pwm-cells = <3>;
18b1db6a162c296 Alim Akhtar           2022-01-24   668  			clocks = <&clock_peric PERIC_PWM1_IPCLKPORT_I_PCLK_S0>;
18b1db6a162c296 Alim Akhtar           2022-01-24   669  			clock-names = "timers";
18b1db6a162c296 Alim Akhtar           2022-01-24   670  			status = "disabled";
18b1db6a162c296 Alim Akhtar           2022-01-24   671  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   672  
18b1db6a162c296 Alim Akhtar           2022-01-24   673  		hsi2c_0: i2c@14200000 {
5f257922c5948c5 Krzysztof Kozlowski   2023-12-05   674  			compatible = "tesla,fsd-hsi2c", "samsung,exynos7-hsi2c";
18b1db6a162c296 Alim Akhtar           2022-01-24   675  			reg = <0x0 0x14200000 0x0 0x1000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   676  			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
18b1db6a162c296 Alim Akhtar           2022-01-24   677  			#address-cells = <1>;
18b1db6a162c296 Alim Akhtar           2022-01-24   678  			#size-cells = <0>;
18b1db6a162c296 Alim Akhtar           2022-01-24   679  			pinctrl-names = "default";
18b1db6a162c296 Alim Akhtar           2022-01-24   680  			pinctrl-0 = <&hs_i2c0_bus>;
18b1db6a162c296 Alim Akhtar           2022-01-24   681  			clocks = <&clock_peric PERIC_PCLK_HSI2C0>;
18b1db6a162c296 Alim Akhtar           2022-01-24   682  			clock-names = "hsi2c";
18b1db6a162c296 Alim Akhtar           2022-01-24   683  			status = "disabled";
18b1db6a162c296 Alim Akhtar           2022-01-24   684  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   685  
18b1db6a162c296 Alim Akhtar           2022-01-24   686  		hsi2c_1: i2c@14210000 {
5f257922c5948c5 Krzysztof Kozlowski   2023-12-05   687  			compatible = "tesla,fsd-hsi2c", "samsung,exynos7-hsi2c";
18b1db6a162c296 Alim Akhtar           2022-01-24   688  			reg = <0x0 0x14210000 0x0 0x1000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   689  			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
18b1db6a162c296 Alim Akhtar           2022-01-24   690  			#address-cells = <1>;
18b1db6a162c296 Alim Akhtar           2022-01-24   691  			#size-cells = <0>;
18b1db6a162c296 Alim Akhtar           2022-01-24   692  			pinctrl-names = "default";
18b1db6a162c296 Alim Akhtar           2022-01-24   693  			pinctrl-0 = <&hs_i2c1_bus>;
18b1db6a162c296 Alim Akhtar           2022-01-24   694  			clocks = <&clock_peric PERIC_PCLK_HSI2C1>;
18b1db6a162c296 Alim Akhtar           2022-01-24   695  			clock-names = "hsi2c";
18b1db6a162c296 Alim Akhtar           2022-01-24   696  			status = "disabled";
18b1db6a162c296 Alim Akhtar           2022-01-24   697  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   698  
18b1db6a162c296 Alim Akhtar           2022-01-24   699  		hsi2c_2: i2c@14220000 {
5f257922c5948c5 Krzysztof Kozlowski   2023-12-05   700  			compatible = "tesla,fsd-hsi2c", "samsung,exynos7-hsi2c";
18b1db6a162c296 Alim Akhtar           2022-01-24   701  			reg = <0x0 0x14220000 0x0 0x1000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   702  			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
18b1db6a162c296 Alim Akhtar           2022-01-24   703  			#address-cells = <1>;
18b1db6a162c296 Alim Akhtar           2022-01-24   704  			#size-cells = <0>;
18b1db6a162c296 Alim Akhtar           2022-01-24   705  			pinctrl-names = "default";
18b1db6a162c296 Alim Akhtar           2022-01-24   706  			pinctrl-0 = <&hs_i2c2_bus>;
18b1db6a162c296 Alim Akhtar           2022-01-24   707  			clocks = <&clock_peric PERIC_PCLK_HSI2C2>;
18b1db6a162c296 Alim Akhtar           2022-01-24   708  			clock-names = "hsi2c";
18b1db6a162c296 Alim Akhtar           2022-01-24   709  			status = "disabled";
18b1db6a162c296 Alim Akhtar           2022-01-24   710  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   711  
18b1db6a162c296 Alim Akhtar           2022-01-24   712  		hsi2c_3: i2c@14230000 {
5f257922c5948c5 Krzysztof Kozlowski   2023-12-05   713  			compatible = "tesla,fsd-hsi2c", "samsung,exynos7-hsi2c";
18b1db6a162c296 Alim Akhtar           2022-01-24   714  			reg = <0x0 0x14230000 0x0 0x1000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   715  			interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
18b1db6a162c296 Alim Akhtar           2022-01-24   716  			#address-cells = <1>;
18b1db6a162c296 Alim Akhtar           2022-01-24   717  			#size-cells = <0>;
18b1db6a162c296 Alim Akhtar           2022-01-24   718  			pinctrl-names = "default";
18b1db6a162c296 Alim Akhtar           2022-01-24   719  			pinctrl-0 = <&hs_i2c3_bus>;
18b1db6a162c296 Alim Akhtar           2022-01-24   720  			clocks = <&clock_peric PERIC_PCLK_HSI2C3>;
18b1db6a162c296 Alim Akhtar           2022-01-24   721  			clock-names = "hsi2c";
18b1db6a162c296 Alim Akhtar           2022-01-24   722  			status = "disabled";
18b1db6a162c296 Alim Akhtar           2022-01-24   723  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   724  
18b1db6a162c296 Alim Akhtar           2022-01-24   725  		hsi2c_4: i2c@14240000 {
5f257922c5948c5 Krzysztof Kozlowski   2023-12-05   726  			compatible = "tesla,fsd-hsi2c", "samsung,exynos7-hsi2c";
18b1db6a162c296 Alim Akhtar           2022-01-24   727  			reg = <0x0 0x14240000 0x0 0x1000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   728  			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
18b1db6a162c296 Alim Akhtar           2022-01-24   729  			#address-cells = <1>;
18b1db6a162c296 Alim Akhtar           2022-01-24   730  			#size-cells = <0>;
18b1db6a162c296 Alim Akhtar           2022-01-24   731  			pinctrl-names = "default";
18b1db6a162c296 Alim Akhtar           2022-01-24   732  			pinctrl-0 = <&hs_i2c4_bus>;
18b1db6a162c296 Alim Akhtar           2022-01-24   733  			clocks = <&clock_peric PERIC_PCLK_HSI2C4>;
18b1db6a162c296 Alim Akhtar           2022-01-24   734  			clock-names = "hsi2c";
18b1db6a162c296 Alim Akhtar           2022-01-24   735  			status = "disabled";
18b1db6a162c296 Alim Akhtar           2022-01-24   736  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   737  
18b1db6a162c296 Alim Akhtar           2022-01-24   738  		hsi2c_5: i2c@14250000 {
5f257922c5948c5 Krzysztof Kozlowski   2023-12-05   739  			compatible = "tesla,fsd-hsi2c", "samsung,exynos7-hsi2c";
18b1db6a162c296 Alim Akhtar           2022-01-24   740  			reg = <0x0 0x14250000 0x0 0x1000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   741  			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
18b1db6a162c296 Alim Akhtar           2022-01-24   742  			#address-cells = <1>;
18b1db6a162c296 Alim Akhtar           2022-01-24   743  			#size-cells = <0>;
18b1db6a162c296 Alim Akhtar           2022-01-24   744  			pinctrl-names = "default";
18b1db6a162c296 Alim Akhtar           2022-01-24   745  			pinctrl-0 = <&hs_i2c5_bus>;
18b1db6a162c296 Alim Akhtar           2022-01-24   746  			clocks = <&clock_peric PERIC_PCLK_HSI2C5>;
18b1db6a162c296 Alim Akhtar           2022-01-24   747  			clock-names = "hsi2c";
18b1db6a162c296 Alim Akhtar           2022-01-24   748  			status = "disabled";
18b1db6a162c296 Alim Akhtar           2022-01-24   749  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   750  
18b1db6a162c296 Alim Akhtar           2022-01-24   751  		hsi2c_6: i2c@14260000 {
5f257922c5948c5 Krzysztof Kozlowski   2023-12-05   752  			compatible = "tesla,fsd-hsi2c", "samsung,exynos7-hsi2c";
18b1db6a162c296 Alim Akhtar           2022-01-24   753  			reg = <0x0 0x14260000 0x0 0x1000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   754  			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
18b1db6a162c296 Alim Akhtar           2022-01-24   755  			#address-cells = <1>;
18b1db6a162c296 Alim Akhtar           2022-01-24   756  			#size-cells = <0>;
18b1db6a162c296 Alim Akhtar           2022-01-24   757  			pinctrl-names = "default";
18b1db6a162c296 Alim Akhtar           2022-01-24   758  			pinctrl-0 = <&hs_i2c6_bus>;
18b1db6a162c296 Alim Akhtar           2022-01-24   759  			clocks = <&clock_peric PERIC_PCLK_HSI2C6>;
18b1db6a162c296 Alim Akhtar           2022-01-24   760  			clock-names = "hsi2c";
18b1db6a162c296 Alim Akhtar           2022-01-24   761  			status = "disabled";
18b1db6a162c296 Alim Akhtar           2022-01-24   762  		};
18b1db6a162c296 Alim Akhtar           2022-01-24   763  
18b1db6a162c296 Alim Akhtar           2022-01-24   764  		hsi2c_7: i2c@14270000 {
5f257922c5948c5 Krzysztof Kozlowski   2023-12-05   765  			compatible = "tesla,fsd-hsi2c", "samsung,exynos7-hsi2c";
18b1db6a162c296 Alim Akhtar           2022-01-24   766  			reg = <0x0 0x14270000 0x0 0x1000>;
18b1db6a162c296 Alim Akhtar           2022-01-24   767  			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
18b1db6a162c296 Alim Akhtar           2022-01-24   768  			#address-cells = <1>;
18b1db6a162c296 Alim Akhtar           2022-01-24   769  			#size-cells = <0>;
18b1db6a162c296 Alim Akhtar           2022-01-24   770  			pinctrl-names = "default";
18b1db6a162c296 Alim Akhtar           2022-01-24   771  			pinctrl-0 = <&hs_i2c7_bus>;
18b1db6a162c296 Alim Akhtar           2022-01-24   772  			clocks = <&clock_peric PERIC_PCLK_HSI2C7>;
18b1db6a162c296 Alim Akhtar           2022-01-24   773  			clock-names = "hsi2c";
18b1db6a162c296 Alim Akhtar           2022-01-24   774  			status = "disabled";
18b1db6a162c296 Alim Akhtar           2022-01-24   775  		};
684dac402f212d8 Alim Akhtar           2022-01-24   776  
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   777  		i2s_0: i2s@140e0000 {
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   778  			compatible = "tesla,fsd-i2s";
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   779  			reg = <0x0 0x140e0000 0x0 0x100>;
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   780  			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   781  			dmas = <&pdma1 14>, <&pdma1 13>, <&pdma1 12>;
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   782  			dma-names = "tx", "rx", "tx-sec";
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   783  			#clock-cells = <1>;
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   784  			clocks = <&clock_peric PERIC_PCLK_TDM0>,
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   785  				 <&clock_peric PERIC_HCLK_TDM0>,
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   786  				 <&clock_peric PERIC_HCLK_TDM0>;
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   787  			clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   788  			pinctrl-names = "default";
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   789  			pinctrl-0 = <&i2s0_bus>;
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   790  			#sound-dai-cells = <1>;
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   791  			status = "disabled";
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   792  		};
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   793  
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   794  		i2s_1: i2s@140f0000 {
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   795  			compatible = "tesla,fsd-i2s";
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   796  			reg = <0x0 0x140f0000 0x0 0x100>;
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   797  			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   798  			dmas = <&pdma1 17>, <&pdma1 16>, <&pdma1 15>;
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   799  			dma-names = "tx", "rx", "tx-sec";
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   800  			#clock-cells = <1>;
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   801  			clocks = <&clock_peric PERIC_PCLK_TDM1>,
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   802  				 <&clock_peric PERIC_HCLK_TDM1>,
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   803  				 <&clock_peric PERIC_HCLK_TDM1>;
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   804  			clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   805  			pinctrl-names = "default";
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   806  			pinctrl-0 = <&i2s1_bus>;
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   807  			#sound-dai-cells = <1>;
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   808  			status = "disabled";
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   809  		};
7f62af80dc62b82 Padmanabhan Rajanbabu 2023-01-16   810  
684dac402f212d8 Alim Akhtar           2022-01-24   811  		pinctrl_pmu: pinctrl@114f0000 {
684dac402f212d8 Alim Akhtar           2022-01-24   812  			compatible = "tesla,fsd-pinctrl";
684dac402f212d8 Alim Akhtar           2022-01-24   813  			reg = <0x0 0x114f0000 0x0 0x1000>;
684dac402f212d8 Alim Akhtar           2022-01-24   814  		};
684dac402f212d8 Alim Akhtar           2022-01-24   815  
684dac402f212d8 Alim Akhtar           2022-01-24   816  		pinctrl_peric: pinctrl@141f0000 {
684dac402f212d8 Alim Akhtar           2022-01-24   817  			compatible = "tesla,fsd-pinctrl";
684dac402f212d8 Alim Akhtar           2022-01-24   818  			reg = <0x0 0x141f0000 0x0 0x1000>;
684dac402f212d8 Alim Akhtar           2022-01-24   819  			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
18b1db6a162c296 Alim Akhtar           2022-01-24   820  		};
684dac402f212d8 Alim Akhtar           2022-01-24   821  
684dac402f212d8 Alim Akhtar           2022-01-24   822  		pinctrl_fsys0: pinctrl@15020000 {
684dac402f212d8 Alim Akhtar           2022-01-24   823  			compatible = "tesla,fsd-pinctrl";
684dac402f212d8 Alim Akhtar           2022-01-24   824  			reg = <0x0 0x15020000 0x0 0x1000>;
684dac402f212d8 Alim Akhtar           2022-01-24   825  			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
18b1db6a162c296 Alim Akhtar           2022-01-24   826  		};
bd1e3696a052b9b Aswani Reddy          2022-01-25   827  
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   828  		m_can0: can@14088000 {
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   829  			compatible = "bosch,m_can";
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   830  			reg = <0x0 0x14088000 0x0 0x0200>,
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   831  			      <0x0 0x14080000 0x0 0x8000>;
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   832  			reg-names = "m_can", "message_ram";
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   833  			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   834  				     <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   835  			interrupt-names = "int0", "int1";
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   836  			pinctrl-names = "default";
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   837  			pinctrl-0 = <&m_can0_bus>;
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   838  			clocks = <&clock_peric PERIC_MCAN0_IPCLKPORT_PCLK>,
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   839  				 <&clock_peric PERIC_MCAN0_IPCLKPORT_CCLK>;
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   840  			clock-names = "hclk", "cclk";
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   841  			bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   842  			status = "disabled";
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   843  		};
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   844  
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   845  		m_can1: can@14098000 {
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   846  			compatible = "bosch,m_can";
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   847  			reg = <0x0 0x14098000 0x0 0x0200>,
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   848  			      <0x0 0x14090000 0x0 0x8000>;
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   849  			reg-names = "m_can", "message_ram";
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   850  			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   851  				     <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   852  			interrupt-names = "int0", "int1";
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   853  			pinctrl-names = "default";
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   854  			pinctrl-0 = <&m_can1_bus>;
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   855  			clocks = <&clock_peric PERIC_MCAN1_IPCLKPORT_PCLK>,
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   856  				 <&clock_peric PERIC_MCAN1_IPCLKPORT_CCLK>;
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   857  			clock-names = "hclk", "cclk";
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   858  			bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   859  			status = "disabled";
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   860  		};
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   861  
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   862  		m_can2: can@140a8000 {
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   863  			compatible = "bosch,m_can";
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   864  			reg = <0x0 0x140a8000 0x0 0x0200>,
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   865  			      <0x0 0x140a0000 0x0 0x8000>;
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   866  			reg-names = "m_can", "message_ram";
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   867  			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   868  				     <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   869  			interrupt-names = "int0", "int1";
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   870  			pinctrl-names = "default";
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   871  			pinctrl-0 = <&m_can2_bus>;
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   872  			clocks = <&clock_peric PERIC_MCAN2_IPCLKPORT_PCLK>,
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   873  				 <&clock_peric PERIC_MCAN2_IPCLKPORT_CCLK>;
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   874  			clock-names = "hclk", "cclk";
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   875  			bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   876  			status = "disabled";
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   877  		};
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   878  
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   879  		m_can3: can@140b8000 {
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   880  			compatible = "bosch,m_can";
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   881  			reg = <0x0 0x140b8000 0x0 0x0200>,
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   882  			      <0x0 0x140b0000 0x0 0x8000>;
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   883  			reg-names = "m_can", "message_ram";
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   884  			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   885  				     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   886  			interrupt-names = "int0", "int1";
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   887  			pinctrl-names = "default";
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   888  			pinctrl-0 = <&m_can3_bus>;
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   889  			clocks = <&clock_peric PERIC_MCAN3_IPCLKPORT_PCLK>,
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   890  				 <&clock_peric PERIC_MCAN3_IPCLKPORT_CCLK>;
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   891  			clock-names = "hclk", "cclk";
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   892  			bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   893  			status = "disabled";
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   894  		};
3bcb0c7a4d7e329 Vivek Yadav           2022-12-07   895  
bd1e3696a052b9b Aswani Reddy          2022-01-25   896  		spi_0: spi@14140000 {
bd1e3696a052b9b Aswani Reddy          2022-01-25   897  			compatible = "tesla,fsd-spi";
bd1e3696a052b9b Aswani Reddy          2022-01-25   898  			reg = <0x0 0x14140000 0x0 0x100>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   899  			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   900  			dmas = <&pdma1 4>, <&pdma1 5>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   901  			dma-names = "tx", "rx";
bd1e3696a052b9b Aswani Reddy          2022-01-25   902  			#address-cells = <1>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   903  			#size-cells = <0>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   904  			clocks = <&clock_peric PERIC_PCLK_SPI0>,
bd1e3696a052b9b Aswani Reddy          2022-01-25   905  				<&clock_peric PERIC_SCLK_SPI0>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   906  			clock-names = "spi", "spi_busclk0";
bd1e3696a052b9b Aswani Reddy          2022-01-25   907  			samsung,spi-src-clk = <0>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   908  			pinctrl-names = "default";
bd1e3696a052b9b Aswani Reddy          2022-01-25   909  			pinctrl-0 = <&spi0_bus>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   910  			num-cs = <1>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   911  			status = "disabled";
bd1e3696a052b9b Aswani Reddy          2022-01-25   912  		};
bd1e3696a052b9b Aswani Reddy          2022-01-25   913  
bd1e3696a052b9b Aswani Reddy          2022-01-25   914  		spi_1: spi@14150000 {
bd1e3696a052b9b Aswani Reddy          2022-01-25   915  			compatible = "tesla,fsd-spi";
bd1e3696a052b9b Aswani Reddy          2022-01-25   916  			reg = <0x0 0x14150000 0x0 0x100>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   917  			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   918  			dmas = <&pdma1 6>, <&pdma1 7>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   919  			dma-names = "tx", "rx";
bd1e3696a052b9b Aswani Reddy          2022-01-25   920  			#address-cells = <1>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   921  			#size-cells = <0>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   922  			clocks = <&clock_peric PERIC_PCLK_SPI1>,
bd1e3696a052b9b Aswani Reddy          2022-01-25   923  				<&clock_peric PERIC_SCLK_SPI1>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   924  			clock-names = "spi", "spi_busclk0";
bd1e3696a052b9b Aswani Reddy          2022-01-25   925  			samsung,spi-src-clk = <0>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   926  			pinctrl-names = "default";
bd1e3696a052b9b Aswani Reddy          2022-01-25   927  			pinctrl-0 = <&spi1_bus>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   928  			num-cs = <1>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   929  			status = "disabled";
bd1e3696a052b9b Aswani Reddy          2022-01-25   930  		};
bd1e3696a052b9b Aswani Reddy          2022-01-25   931  
bd1e3696a052b9b Aswani Reddy          2022-01-25   932  		spi_2: spi@14160000 {
bd1e3696a052b9b Aswani Reddy          2022-01-25   933  			compatible = "tesla,fsd-spi";
bd1e3696a052b9b Aswani Reddy          2022-01-25   934  			reg = <0x0 0x14160000 0x0 0x100>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   935  			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   936  			dmas = <&pdma1 8>, <&pdma1 9>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   937  			dma-names = "tx", "rx";
bd1e3696a052b9b Aswani Reddy          2022-01-25   938  			#address-cells = <1>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   939  			#size-cells = <0>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   940  			clocks = <&clock_peric PERIC_PCLK_SPI2>,
bd1e3696a052b9b Aswani Reddy          2022-01-25   941  				<&clock_peric PERIC_SCLK_SPI2>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   942  			clock-names = "spi", "spi_busclk0";
bd1e3696a052b9b Aswani Reddy          2022-01-25   943  			samsung,spi-src-clk = <0>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   944  			pinctrl-names = "default";
bd1e3696a052b9b Aswani Reddy          2022-01-25   945  			pinctrl-0 = <&spi2_bus>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   946  			num-cs = <1>;
bd1e3696a052b9b Aswani Reddy          2022-01-25   947  			status = "disabled";
bd1e3696a052b9b Aswani Reddy          2022-01-25   948  		};
bfb60ede2c3e5ce Alim Akhtar           2022-03-16   949  
bfb60ede2c3e5ce Alim Akhtar           2022-03-16   950  		timer@10040000 {
22cbcb8f4a17c19 Krzysztof Kozlowski   2022-04-04   951  			compatible = "tesla,fsd-mct", "samsung,exynos4210-mct";
bfb60ede2c3e5ce Alim Akhtar           2022-03-16   952  			reg = <0x0 0x10040000 0x0 0x800>;
bfb60ede2c3e5ce Alim Akhtar           2022-03-16   953  			interrupts = <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
bfb60ede2c3e5ce Alim Akhtar           2022-03-16   954  				<GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
bfb60ede2c3e5ce Alim Akhtar           2022-03-16   955  				<GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
bfb60ede2c3e5ce Alim Akhtar           2022-03-16   956  				<GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
bfb60ede2c3e5ce Alim Akhtar           2022-03-16   957  				<GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
bfb60ede2c3e5ce Alim Akhtar           2022-03-16   958  				<GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
bfb60ede2c3e5ce Alim Akhtar           2022-03-16   959  				<GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
bfb60ede2c3e5ce Alim Akhtar           2022-03-16   960  				<GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
bfb60ede2c3e5ce Alim Akhtar           2022-03-16   961  				<GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
bfb60ede2c3e5ce Alim Akhtar           2022-03-16   962  				<GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
bfb60ede2c3e5ce Alim Akhtar           2022-03-16   963  				<GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
bfb60ede2c3e5ce Alim Akhtar           2022-03-16   964  				<GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
bfb60ede2c3e5ce Alim Akhtar           2022-03-16   965  				<GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
bfb60ede2c3e5ce Alim Akhtar           2022-03-16   966  				<GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
bfb60ede2c3e5ce Alim Akhtar           2022-03-16   967  				<GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
bfb60ede2c3e5ce Alim Akhtar           2022-03-16   968  				<GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
bfb60ede2c3e5ce Alim Akhtar           2022-03-16   969  			clocks = <&fin_pll>, <&clock_imem IMEM_MCT_PCLK>;
bfb60ede2c3e5ce Alim Akhtar           2022-03-16   970  			clock-names = "fin_pll", "mct";
bfb60ede2c3e5ce Alim Akhtar           2022-03-16   971  		};
c75f5c9e11cf71e Alim Akhtar           2022-06-03   972  
a41d9b3287b1d2d Aakarsh Jain          2023-12-06   973  		mfc: mfc@12880000 {
a41d9b3287b1d2d Aakarsh Jain          2023-12-06   974  			compatible = "tesla,fsd-mfc";
a41d9b3287b1d2d Aakarsh Jain          2023-12-06   975  			reg = <0x0 0x12880000 0x0 0x10000>;
a41d9b3287b1d2d Aakarsh Jain          2023-12-06   976  			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
a41d9b3287b1d2d Aakarsh Jain          2023-12-06   977  			clock-names = "mfc";
a41d9b3287b1d2d Aakarsh Jain          2023-12-06   978  			clocks = <&clock_mfc MFC_MFC_IPCLKPORT_ACLK>;
a41d9b3287b1d2d Aakarsh Jain          2023-12-06   979  			memory-region = <&mfc_left>;
a41d9b3287b1d2d Aakarsh Jain          2023-12-06   980  		};
a41d9b3287b1d2d Aakarsh Jain          2023-12-06   981  
ebeab0be707ddcf Swathi K S            2025-03-07   982  		ethernet1: ethernet@14300000 {
ebeab0be707ddcf Swathi K S            2025-03-07   983  			compatible = "tesla,fsd-ethqos";
ebeab0be707ddcf Swathi K S            2025-03-07   984  			reg = <0x0 0x14300000 0x0 0x10000>;
ebeab0be707ddcf Swathi K S            2025-03-07   985  			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
ebeab0be707ddcf Swathi K S            2025-03-07   986  			interrupt-names = "macirq";
ebeab0be707ddcf Swathi K S            2025-03-07   987  			clocks = <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_CLK_PTP_REF_I>,
ebeab0be707ddcf Swathi K S            2025-03-07   988  				 <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_ACLK_I>,
ebeab0be707ddcf Swathi K S            2025-03-07   989  				 <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_HCLK_I>,
ebeab0be707ddcf Swathi K S            2025-03-07   990  				 <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_RGMII_CLK_I>,
ebeab0be707ddcf Swathi K S            2025-03-07   991  				 <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_CLK_RX_I>,
ebeab0be707ddcf Swathi K S            2025-03-07   992  				 <&clock_peric PERIC_BUS_D_PERIC_IPCLKPORT_EQOSCLK>,
ebeab0be707ddcf Swathi K S            2025-03-07   993  				 <&clock_peric PERIC_BUS_P_PERIC_IPCLKPORT_EQOSCLK>,
ebeab0be707ddcf Swathi K S            2025-03-07   994  				 <&clock_peric PERIC_EQOS_PHYRXCLK_MUX>,
ebeab0be707ddcf Swathi K S            2025-03-07   995  				 <&clock_peric PERIC_EQOS_PHYRXCLK>,
ebeab0be707ddcf Swathi K S            2025-03-07   996  				 <&clock_peric PERIC_DOUT_RGMII_CLK>;
ebeab0be707ddcf Swathi K S            2025-03-07   997  			clock-names = "ptp_ref", "master_bus", "slave_bus", "tx", "rx",
ebeab0be707ddcf Swathi K S            2025-03-07   998  				      "master2_bus", "slave2_bus", "eqos_rxclk_mux",
ebeab0be707ddcf Swathi K S            2025-03-07   999  				      "eqos_phyrxclk", "dout_peric_rgmii_clk";
ebeab0be707ddcf Swathi K S            2025-03-07  1000  			assigned-clocks = <&clock_peric PERIC_EQOS_PHYRXCLK_MUX>,
ebeab0be707ddcf Swathi K S            2025-03-07  1001  					  <&clock_peric PERIC_EQOS_PHYRXCLK>;
ebeab0be707ddcf Swathi K S            2025-03-07  1002  			assigned-clock-parents = <&clock_peric PERIC_EQOS_PHYRXCLK>;
ebeab0be707ddcf Swathi K S            2025-03-07  1003  			pinctrl-names = "default";
ebeab0be707ddcf Swathi K S            2025-03-07  1004  			pinctrl-0 = <&eth1_tx_clk>, <&eth1_tx_data>, <&eth1_tx_ctrl>,
ebeab0be707ddcf Swathi K S            2025-03-07  1005  				    <&eth1_phy_intr>, <&eth1_rx_clk>, <&eth1_rx_data>,
ebeab0be707ddcf Swathi K S            2025-03-07  1006  				    <&eth1_rx_ctrl>, <&eth1_mdio>;
ebeab0be707ddcf Swathi K S            2025-03-07  1007  			local-mac-address = [00 00 00 00 00 00];
ebeab0be707ddcf Swathi K S            2025-03-07  1008  			iommus = <&smmu_peric 0x0 0x1>;
ebeab0be707ddcf Swathi K S            2025-03-07  1009  			status = "disabled";
ebeab0be707ddcf Swathi K S            2025-03-07  1010  		};
ebeab0be707ddcf Swathi K S            2025-03-07  1011  
dc1f40572499952 Shradha Todi          2025-06-25  1012  		pciephy0: pcie-phy@15080000 {
dc1f40572499952 Shradha Todi          2025-06-25  1013  			compatible = "tesla,fsd-pcie-phy";
dc1f40572499952 Shradha Todi          2025-06-25  1014  			#phy-cells = <0>;
dc1f40572499952 Shradha Todi          2025-06-25  1015  			reg = <0x0 0x15080000 0x0 0x2000>,
dc1f40572499952 Shradha Todi          2025-06-25  1016  			      <0x0 0x150a0000 0x0 0x1000>;
dc1f40572499952 Shradha Todi          2025-06-25  1017  			samsung,pmu-syscon = <&pmu_system_controller>;
dc1f40572499952 Shradha Todi          2025-06-25  1018  			samsung,fsys-sysreg = <&sysreg_fsys0>;
dc1f40572499952 Shradha Todi          2025-06-25  1019  			status = "disabled";
dc1f40572499952 Shradha Todi          2025-06-25  1020  		};
dc1f40572499952 Shradha Todi          2025-06-25  1021  
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1022  		ufs: ufs@15120000 {
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1023  			compatible = "tesla,fsd-ufs";
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1024  			reg = <0x0 0x15120000 0x0 0x200>,  /* 0: HCI standard */
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1025  			      <0x0 0x15121100 0x0 0x200>,  /* 1: Vendor specified */
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1026  			      <0x0 0x15110000 0x0 0x8000>,  /* 2: UNIPRO */
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1027  			      <0x0 0x15130000 0x0 0x100>;  /* 3: UFS protector */
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1028  			reg-names = "hci", "vs_hci", "unipro", "ufsp";
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1029  			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1030  			clocks = <&clock_fsys0 UFS0_TOP0_HCLK_BUS>,
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1031  				 <&clock_fsys0 UFS0_TOP0_CLK_UNIPRO>;
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1032  			clock-names = "core_clk", "sclk_unipro_main";
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1033  			freq-table-hz = <0 0>, <0 0>;
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1034  			pinctrl-names = "default";
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1035  			pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1036  			phys = <&ufs_phy>;
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1037  			phy-names = "ufs-phy";
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1038  			status = "disabled";
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1039  		};
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1040  
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1041  		ufs_phy: ufs-phy@15124000 {
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1042  			compatible = "tesla,fsd-ufs-phy";
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1043  			reg = <0x0 0x15124000 0x0 0x800>;
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1044  			reg-names = "phy-pma";
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1045  			samsung,pmu-syscon = <&pmu_system_controller>;
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1046  			#phy-cells = <0>;
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1047  			clocks = <&clock_fsys0 UFS0_MPHY_REFCLK_IXTAL26>;
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1048  			clock-names = "ref_clk";
c75f5c9e11cf71e Alim Akhtar           2022-06-03  1049  		};
1d62af229b18bff Swathi K S            2025-03-07  1050  
1d62af229b18bff Swathi K S            2025-03-07  1051  		ethernet0: ethernet@15300000 {
1d62af229b18bff Swathi K S            2025-03-07  1052  			compatible = "tesla,fsd-ethqos";
1d62af229b18bff Swathi K S            2025-03-07  1053  			reg = <0x0 0x15300000 0x0 0x10000>;
1d62af229b18bff Swathi K S            2025-03-07  1054  			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
1d62af229b18bff Swathi K S            2025-03-07  1055  			interrupt-names = "macirq";
1d62af229b18bff Swathi K S            2025-03-07  1056  			clocks = <&clock_fsys0 FSYS0_EQOS_TOP0_IPCLKPORT_CLK_PTP_REF_I>,
1d62af229b18bff Swathi K S            2025-03-07  1057  				 <&clock_fsys0 FSYS0_EQOS_TOP0_IPCLKPORT_ACLK_I>,
1d62af229b18bff Swathi K S            2025-03-07  1058  				 <&clock_fsys0 FSYS0_EQOS_TOP0_IPCLKPORT_HCLK_I>,
1d62af229b18bff Swathi K S            2025-03-07  1059  				 <&clock_fsys0 FSYS0_EQOS_TOP0_IPCLKPORT_RGMII_CLK_I>,
1d62af229b18bff Swathi K S            2025-03-07  1060  				 <&clock_fsys0 FSYS0_EQOS_TOP0_IPCLKPORT_CLK_RX_I>;
1d62af229b18bff Swathi K S            2025-03-07  1061  			clock-names = "ptp_ref", "master_bus", "slave_bus", "tx", "rx";
1d62af229b18bff Swathi K S            2025-03-07  1062  			pinctrl-names = "default";
1d62af229b18bff Swathi K S            2025-03-07  1063  			pinctrl-0 = <&eth0_tx_clk>, <&eth0_tx_data>, <&eth0_tx_ctrl>,
1d62af229b18bff Swathi K S            2025-03-07  1064  				    <&eth0_phy_intr>, <&eth0_rx_clk>, <&eth0_rx_data>,
1d62af229b18bff Swathi K S            2025-03-07  1065  				    <&eth0_rx_ctrl>, <&eth0_mdio>;
1d62af229b18bff Swathi K S            2025-03-07  1066  			local-mac-address = [00 00 00 00 00 00];
1d62af229b18bff Swathi K S            2025-03-07  1067  			iommus = <&smmu_fsys0 0x0 0x1>;
1d62af229b18bff Swathi K S            2025-03-07  1068  			status = "disabled";
1d62af229b18bff Swathi K S            2025-03-07  1069  		};
dc1f40572499952 Shradha Todi          2025-06-25  1070  
dc1f40572499952 Shradha Todi          2025-06-25  1071  		pcierc2: pcie@15400000 {
dc1f40572499952 Shradha Todi          2025-06-25  1072  			compatible = "tesla,fsd-pcie";
dc1f40572499952 Shradha Todi          2025-06-25  1073  			reg = <0x0 0x15400000 0x0 0x2000>,
dc1f40572499952 Shradha Todi          2025-06-25  1074  			      <0x0 0x15090000 0x0 0x1000>,
dc1f40572499952 Shradha Todi          2025-06-25  1075  			      <0x0 0x15800000 0x0 0x1000>;
dc1f40572499952 Shradha Todi          2025-06-25  1076  			reg-names = "dbi", "elbi", "config";
dc1f40572499952 Shradha Todi          2025-06-25  1077  			ranges =  <0x82000000 0 0x15801000 0 0x15801000 0 0xffefff>;
dc1f40572499952 Shradha Todi          2025-06-25  1078  			clocks = <&clock_fsys0 PCIE_SUBCTRL_INST0_AUX_CLK_SOC>,
dc1f40572499952 Shradha Todi          2025-06-25  1079  				 <&clock_fsys0 PCIE_SUBCTRL_INST0_DBI_ACLK_SOC>,
dc1f40572499952 Shradha Todi          2025-06-25  1080  				 <&clock_fsys0 PCIE_SUBCTRL_INST0_MSTR_ACLK_SOC>,
dc1f40572499952 Shradha Todi          2025-06-25  1081  				 <&clock_fsys0 PCIE_SUBCTRL_INST0_SLV_ACLK_SOC>;
dc1f40572499952 Shradha Todi          2025-06-25  1082  			clock-names = "aux", "dbi", "mstr", "slv";
dc1f40572499952 Shradha Todi          2025-06-25  1083  			#address-cells = <3>;
dc1f40572499952 Shradha Todi          2025-06-25  1084  			#size-cells = <2>;
dc1f40572499952 Shradha Todi          2025-06-25  1085  			dma-coherent;
dc1f40572499952 Shradha Todi          2025-06-25  1086  			device_type = "pci";
dc1f40572499952 Shradha Todi          2025-06-25  1087  			interrupts = <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
dc1f40572499952 Shradha Todi          2025-06-25  1088  			num-lanes = <4>;
dc1f40572499952 Shradha Todi          2025-06-25  1089  			samsung,syscon-pcie = <&sysreg_fsys0 0x434>;
dc1f40572499952 Shradha Todi          2025-06-25  1090  			phys = <&pciephy0>;
dc1f40572499952 Shradha Todi          2025-06-25  1091  			iommu-map = <0x0 &smmu_fsys0 0x4 0x10000>;
dc1f40572499952 Shradha Todi          2025-06-25  1092  			iommu-map-mask = <0x0>;
dc1f40572499952 Shradha Todi          2025-06-25  1093  			status = "disabled";
dc1f40572499952 Shradha Todi          2025-06-25  1094  		};
dc1f40572499952 Shradha Todi          2025-06-25  1095  
dc1f40572499952 Shradha Todi          2025-06-25 @1096  		pcieep2: pcie-ep@15400000 {
dc1f40572499952 Shradha Todi          2025-06-25  1097  			compatible = "tesla,fsd-pcie-ep";
dc1f40572499952 Shradha Todi          2025-06-25  1098  			reg = <0x0 0x15090000 0x0 0x1000>,
dc1f40572499952 Shradha Todi          2025-06-25  1099  			      <0x0 0x15400000 0x0 0x2000>,
dc1f40572499952 Shradha Todi          2025-06-25  1100  			      <0x0 0x15402000 0x0 0x80>,
dc1f40572499952 Shradha Todi          2025-06-25  1101  			      <0x0 0x15800000 0x0 0xff0000>;
dc1f40572499952 Shradha Todi          2025-06-25  1102  			reg-names = "elbi", "dbi", "dbi2", "addr_space";
dc1f40572499952 Shradha Todi          2025-06-25  1103  			clocks = <&clock_fsys0 PCIE_SUBCTRL_INST0_AUX_CLK_SOC>,
dc1f40572499952 Shradha Todi          2025-06-25  1104  				 <&clock_fsys0 PCIE_SUBCTRL_INST0_DBI_ACLK_SOC>,
dc1f40572499952 Shradha Todi          2025-06-25  1105  				 <&clock_fsys0 PCIE_SUBCTRL_INST0_MSTR_ACLK_SOC>,
dc1f40572499952 Shradha Todi          2025-06-25  1106  				 <&clock_fsys0 PCIE_SUBCTRL_INST0_SLV_ACLK_SOC>;
dc1f40572499952 Shradha Todi          2025-06-25  1107  			clock-names = "aux", "dbi", "mstr", "slv";
dc1f40572499952 Shradha Todi          2025-06-25  1108  			num-lanes = <4>;
dc1f40572499952 Shradha Todi          2025-06-25  1109  			samsung,syscon-pcie = <&sysreg_fsys0 0x434>;
dc1f40572499952 Shradha Todi          2025-06-25  1110  			phys = <&pciephy0>;
dc1f40572499952 Shradha Todi          2025-06-25  1111  			status = "disabled";
dc1f40572499952 Shradha Todi          2025-06-25  1112  		};
dc1f40572499952 Shradha Todi          2025-06-25  1113  
dc1f40572499952 Shradha Todi          2025-06-25  1114  		pciephy1: pcie-phy@16880000 {
dc1f40572499952 Shradha Todi          2025-06-25  1115  			compatible = "tesla,fsd-pcie-phy";
dc1f40572499952 Shradha Todi          2025-06-25  1116  			#phy-cells = <0>;
dc1f40572499952 Shradha Todi          2025-06-25  1117  			reg = <0x0 0x16880000 0x0 0x2000>,
dc1f40572499952 Shradha Todi          2025-06-25  1118  			      <0x0 0x16860000 0x0 0x1000>;
dc1f40572499952 Shradha Todi          2025-06-25  1119  			samsung,pmu-syscon = <&pmu_system_controller>;
dc1f40572499952 Shradha Todi          2025-06-25  1120  			samsung,fsys-sysreg = <&sysreg_fsys1>;
dc1f40572499952 Shradha Todi          2025-06-25  1121  			status = "disabled";
dc1f40572499952 Shradha Todi          2025-06-25  1122  		};
dc1f40572499952 Shradha Todi          2025-06-25  1123  
dc1f40572499952 Shradha Todi          2025-06-25  1124  		pcierc0: pcie@16a00000 {
dc1f40572499952 Shradha Todi          2025-06-25  1125  			compatible = "tesla,fsd-pcie";
dc1f40572499952 Shradha Todi          2025-06-25  1126  			reg = <0x0 0x16a00000 0x0 0x2000>,
dc1f40572499952 Shradha Todi          2025-06-25  1127  			      <0x0 0x168b0000 0x0 0x1000>,
dc1f40572499952 Shradha Todi          2025-06-25  1128  			      <0x0 0x17000000 0x0 0x1000>;
dc1f40572499952 Shradha Todi          2025-06-25  1129  			reg-names = "dbi", "elbi", "config";
dc1f40572499952 Shradha Todi          2025-06-25  1130  			ranges =  <0x82000000 0 0x17001000 0 0x17001000 0 0xffefff>;
dc1f40572499952 Shradha Todi          2025-06-25  1131  			clocks = <&clock_fsys1 PCIE_LINK0_IPCLKPORT_AUX_ACLK>,
dc1f40572499952 Shradha Todi          2025-06-25  1132  				 <&clock_fsys1 PCIE_LINK0_IPCLKPORT_DBI_ACLK>,
dc1f40572499952 Shradha Todi          2025-06-25  1133  				 <&clock_fsys1 PCIE_LINK0_IPCLKPORT_MSTR_ACLK>,
dc1f40572499952 Shradha Todi          2025-06-25  1134  				 <&clock_fsys1 PCIE_LINK0_IPCLKPORT_SLV_ACLK>;
dc1f40572499952 Shradha Todi          2025-06-25  1135  			clock-names = "aux", "dbi", "mstr", "slv";
dc1f40572499952 Shradha Todi          2025-06-25  1136  			#address-cells = <3>;
dc1f40572499952 Shradha Todi          2025-06-25  1137  			#size-cells = <2>;
dc1f40572499952 Shradha Todi          2025-06-25  1138  			dma-coherent;
dc1f40572499952 Shradha Todi          2025-06-25  1139  			device_type = "pci";
dc1f40572499952 Shradha Todi          2025-06-25  1140  			interrupts = <GIC_SPI 115 IRQ_TYPE_EDGE_RISING>;
dc1f40572499952 Shradha Todi          2025-06-25  1141  			num-lanes = <4>;
dc1f40572499952 Shradha Todi          2025-06-25  1142  			samsung,syscon-pcie = <&sysreg_fsys1 0x50c>;
dc1f40572499952 Shradha Todi          2025-06-25  1143  			phys = <&pciephy1>;
dc1f40572499952 Shradha Todi          2025-06-25  1144  			iommu-map = <0x0 &smmu_imem 0x0 0x10000>;
dc1f40572499952 Shradha Todi          2025-06-25  1145  			iommu-map-mask = <0x0>;
dc1f40572499952 Shradha Todi          2025-06-25  1146  			status = "disabled";
dc1f40572499952 Shradha Todi          2025-06-25  1147  		};
dc1f40572499952 Shradha Todi          2025-06-25  1148  
dc1f40572499952 Shradha Todi          2025-06-25 @1149  		pcieep0: pcie-ep@16a00000 {
dc1f40572499952 Shradha Todi          2025-06-25  1150  			compatible = "tesla,fsd-pcie-ep";
dc1f40572499952 Shradha Todi          2025-06-25  1151  			reg = <0x0 0x168b0000 0x0 0x1000>,
dc1f40572499952 Shradha Todi          2025-06-25  1152  			      <0x0 0x16a00000 0x0 0x2000>,
dc1f40572499952 Shradha Todi          2025-06-25  1153  			      <0x0 0x16a02000 0x0 0x80>,
dc1f40572499952 Shradha Todi          2025-06-25  1154  			      <0x0 0x17000000 0x0 0xff0000>;
dc1f40572499952 Shradha Todi          2025-06-25  1155  			reg-names = "elbi", "dbi", "dbi2", "addr_space";
dc1f40572499952 Shradha Todi          2025-06-25  1156  			clocks = <&clock_fsys1 PCIE_LINK0_IPCLKPORT_AUX_ACLK>,
dc1f40572499952 Shradha Todi          2025-06-25  1157  				 <&clock_fsys1 PCIE_LINK0_IPCLKPORT_DBI_ACLK>,
dc1f40572499952 Shradha Todi          2025-06-25  1158  				 <&clock_fsys1 PCIE_LINK0_IPCLKPORT_MSTR_ACLK>,
dc1f40572499952 Shradha Todi          2025-06-25  1159  				 <&clock_fsys1 PCIE_LINK0_IPCLKPORT_SLV_ACLK>;
dc1f40572499952 Shradha Todi          2025-06-25  1160  			clock-names = "aux", "dbi", "mstr", "slv";
dc1f40572499952 Shradha Todi          2025-06-25  1161  			num-lanes = <4>;
dc1f40572499952 Shradha Todi          2025-06-25  1162  			samsung,syscon-pcie = <&sysreg_fsys1 0x50c>;
dc1f40572499952 Shradha Todi          2025-06-25  1163  			phys = <&pciephy1>;
dc1f40572499952 Shradha Todi          2025-06-25  1164  			status = "disabled";
dc1f40572499952 Shradha Todi          2025-06-25  1165  		};
dc1f40572499952 Shradha Todi          2025-06-25  1166  
dc1f40572499952 Shradha Todi          2025-06-25  1167  		pcierc1: pcie@16b00000 {
dc1f40572499952 Shradha Todi          2025-06-25  1168  			compatible = "tesla,fsd-pcie";
dc1f40572499952 Shradha Todi          2025-06-25  1169  			reg = <0x0 0x16b00000 0x0 0x2000>,
dc1f40572499952 Shradha Todi          2025-06-25  1170  			      <0x0 0x168c0000 0x0 0x1000>,
dc1f40572499952 Shradha Todi          2025-06-25  1171  			      <0x0 0x18000000 0x0 0x1000>;
dc1f40572499952 Shradha Todi          2025-06-25  1172  			reg-names = "dbi", "elbi", "config";
dc1f40572499952 Shradha Todi          2025-06-25  1173  			ranges =  <0x82000000 0 0x18001000 0 0x18001000 0 0xffefff>;
dc1f40572499952 Shradha Todi          2025-06-25  1174  			clocks = <&clock_fsys1 PCIE_LINK1_IPCLKPORT_AUX_ACLK>,
dc1f40572499952 Shradha Todi          2025-06-25  1175  				 <&clock_fsys1 PCIE_LINK1_IPCLKPORT_DBI_ACLK>,
dc1f40572499952 Shradha Todi          2025-06-25  1176  				 <&clock_fsys1 PCIE_LINK1_IPCLKPORT_MSTR_ACLK>,
dc1f40572499952 Shradha Todi          2025-06-25  1177  				 <&clock_fsys1 PCIE_LINK1_IPCLKPORT_SLV_ACLK>;
dc1f40572499952 Shradha Todi          2025-06-25  1178  			clock-names = "aux", "dbi", "mstr", "slv";
dc1f40572499952 Shradha Todi          2025-06-25  1179  			#address-cells = <3>;
dc1f40572499952 Shradha Todi          2025-06-25  1180  			#size-cells = <2>;
dc1f40572499952 Shradha Todi          2025-06-25  1181  			dma-coherent;
dc1f40572499952 Shradha Todi          2025-06-25  1182  			device_type = "pci";
dc1f40572499952 Shradha Todi          2025-06-25  1183  			interrupts = <GIC_SPI 117 IRQ_TYPE_EDGE_RISING>;
dc1f40572499952 Shradha Todi          2025-06-25  1184  			num-lanes = <4>;
dc1f40572499952 Shradha Todi          2025-06-25  1185  			samsung,syscon-pcie = <&sysreg_fsys1 0x510>;
dc1f40572499952 Shradha Todi          2025-06-25  1186  			phys = <&pciephy1>;
dc1f40572499952 Shradha Todi          2025-06-25  1187  			status = "disabled";
dc1f40572499952 Shradha Todi          2025-06-25  1188  		};
dc1f40572499952 Shradha Todi          2025-06-25  1189  
dc1f40572499952 Shradha Todi          2025-06-25 @1190  		pcieep1: pcie-ep@16b00000 {
dc1f40572499952 Shradha Todi          2025-06-25  1191  			compatible = "tesla,fsd-pcie-ep";
dc1f40572499952 Shradha Todi          2025-06-25  1192  			reg = <0x0 0x168c0000 0x0 0x1000>,
dc1f40572499952 Shradha Todi          2025-06-25  1193  			      <0x0 0x16b00000 0x0 0x2000>,
dc1f40572499952 Shradha Todi          2025-06-25  1194  			      <0x0 0x16b02000 0x0 0x80>,
dc1f40572499952 Shradha Todi          2025-06-25  1195  			      <0x0 0x18000000 0x0 0xff0000>;
dc1f40572499952 Shradha Todi          2025-06-25  1196  			reg-names = "elbi", "dbi", "dbi2", "addr_space";
dc1f40572499952 Shradha Todi          2025-06-25  1197  			clocks = <&clock_fsys1 PCIE_LINK1_IPCLKPORT_AUX_ACLK>,
dc1f40572499952 Shradha Todi          2025-06-25  1198  				 <&clock_fsys1 PCIE_LINK1_IPCLKPORT_DBI_ACLK>,
dc1f40572499952 Shradha Todi          2025-06-25  1199  				 <&clock_fsys1 PCIE_LINK1_IPCLKPORT_MSTR_ACLK>,
dc1f40572499952 Shradha Todi          2025-06-25  1200  				 <&clock_fsys1 PCIE_LINK1_IPCLKPORT_SLV_ACLK>;
dc1f40572499952 Shradha Todi          2025-06-25  1201  			clock-names = "aux", "dbi", "mstr", "slv";
dc1f40572499952 Shradha Todi          2025-06-25  1202  			num-lanes = <4>;
dc1f40572499952 Shradha Todi          2025-06-25  1203  			samsung,syscon-pcie = <&sysreg_fsys1 0x510>;
dc1f40572499952 Shradha Todi          2025-06-25  1204  			phys = <&pciephy1>;
dc1f40572499952 Shradha Todi          2025-06-25  1205  			status = "disabled";
dc1f40572499952 Shradha Todi          2025-06-25  1206  		};
684dac402f212d8 Alim Akhtar           2022-01-24  1207  	};
684dac402f212d8 Alim Akhtar           2022-01-24  1208  };
684dac402f212d8 Alim Akhtar           2022-01-24  1209  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
