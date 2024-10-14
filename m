Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EBD4B5AE
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Oct 2024 17:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728925981; cv=none; b=n+Gp+NEo8yOMT3pxWseJiAZVDYGivACmrA7nEGoibHPJ85m4O9si7+Wbs4XgAyTgvtox5sPsXlFR4Fam2+w+5I86jGV01FlGVYs64x5WhmOUAs6SQIeXAtqgx5DWu2jcZji0o6oz2v2wpLjbMZQnzUznL/pC6jtljP2nuvT+Hd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728925981; c=relaxed/simple;
	bh=JcTOuYzxq1zrKT+DOX5wLmFcgABxzLY9F+J9Bq00iME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CaFbZgDqXg+/wv0aUvu12Vl0HQh0AsSkec/ASD1d0GSX2seNf63nyHv9qHgDJvlk0IbeiqrogV1vziGpmbdx9RKi4qDiHG57rP0YYvkfovkWSkz6vEyj6TMcu9nXz/bIia7wNeH1FebKSfqA2u3o4XG8SRZF9YdWv3xUODQMscQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nwvpICU3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nwvpICU3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728925977; x=1760461977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JcTOuYzxq1zrKT+DOX5wLmFcgABxzLY9F+J9Bq00iME=;
  b=nwvpICU3hSVjGrmfnWqe17u0wFpUGteOepJR5rNSQWaanuEysRf8tSNF
   q3sc6fT4BGMwGMsRH2VXQN6tZo+9Gu4jIb9+CukFTeu0I9N1GTsJUvRUl
   kz28T1gd0BILGUSTnLz/arnLaHz+QVNd2l/43O2dkFKnJCI21JtwS4V+H
   lAAz62rsoGcWDVM1udcggf5aI3J8UxuV4TsZF/oER8MKkiJFTx2MRVu5K
   ik+kVhtNZCUth+02bljcZ3ey497NDpA4wgdvqO7D5e5jLKYIvqtZnVVgg
   2rvchGmxAZLL1gMbP8b8xISVNzMzu+rOidAVzcMHMNRYkNIusO0z+aJ7q
   g==;
X-CSE-ConnectionGUID: wuGIHyIgRMGnR5sz2j0/EQ==
X-CSE-MsgGUID: cdvecDqBS8+YZpoqdzjCpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39411383"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39411383"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 10:12:57 -0700
X-CSE-ConnectionGUID: WT3Wp4SVRgKhd6bD5wJ0mA==
X-CSE-MsgGUID: AfFxJnZeQUynb6+L+Eg67g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="115084261"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Oct 2024 10:12:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0Ocn-000GvB-0A;
	Mon, 14 Oct 2024 17:12:53 +0000
Date: Tue, 15 Oct 2024 01:12:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 1/69]
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi:1048.25-1088.4: Warning
 (unique_unit_address): /bus@100000/pcie@2900000: duplicate unit-address
 (also used in node /bus@100000/pcie-ep@2900000)
Message-ID: <202410150103.O68dEXEj-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com
TO: Matt Ranostay <mranostay@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>
CC: Achal Verma <a-verma1@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   451df8c0a2a3bcf0656b2f6fdc49d6fb4d05f186
commit: b8ef2e6c5f6071e7bda38c6508c93bb62a959ac6 [1/69] arm64: dts: ti: k3-j784s4: Add initial PCIe/SerDes support for J784S4
:::::: branch date: 6 days ago
:::::: commit date: 1 year, 5 months ago
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241015/202410150103.O68dEXEj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410150103.O68dEXEj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410150103.O68dEXEj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi:1048.25-1088.4: Warning (unique_unit_address): /bus@100000/pcie@2900000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2900000)
   arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi:1111.25-1151.4: Warning (unique_unit_address): /bus@100000/pcie@2910000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2910000)
--
>> arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi:1048.25-1088.4: Warning (unique_unit_address): /bus@100000/pcie@2900000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2900000)
   arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi:1111.25-1151.4: Warning (unique_unit_address): /bus@100000/pcie@2910000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2910000)

vim +1048 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi

acd1e6c9aeb877 Siddharth Vadapalli 2023-04-25    19  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    20  &cbass_main {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    21  	msmc_ram: sram@70000000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    22  		compatible = "mmio-sram";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    23  		reg = <0x00 0x70000000 0x00 0x800000>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    24  		#address-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    25  		#size-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    26  		ranges = <0x00 0x00 0x70000000 0x800000>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    27  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    28  		atf-sram@0 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    29  			reg = <0x00 0x20000>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    30  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    31  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    32  		tifs-sram@1f0000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    33  			reg = <0x1f0000 0x10000>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    34  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    35  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    36  		l3cache-sram@200000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    37  			reg = <0x200000 0x200000>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    38  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    39  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    40  
acd1e6c9aeb877 Siddharth Vadapalli 2023-04-25    41  	scm_conf: syscon@100000 {
acd1e6c9aeb877 Siddharth Vadapalli 2023-04-25    42  		compatible = "ti,j721e-system-controller", "syscon", "simple-mfd";
acd1e6c9aeb877 Siddharth Vadapalli 2023-04-25    43  		reg = <0x00 0x00100000 0x00 0x1c000>;
acd1e6c9aeb877 Siddharth Vadapalli 2023-04-25    44  		#address-cells = <1>;
acd1e6c9aeb877 Siddharth Vadapalli 2023-04-25    45  		#size-cells = <1>;
acd1e6c9aeb877 Siddharth Vadapalli 2023-04-25    46  		ranges = <0x00 0x00 0x00100000 0x1c000>;
acd1e6c9aeb877 Siddharth Vadapalli 2023-04-25    47  
576b37b7c97f13 Siddharth Vadapalli 2023-04-25    48  		cpsw1_phy_gmii_sel: phy@4034 {
576b37b7c97f13 Siddharth Vadapalli 2023-04-25    49  			compatible = "ti,am654-phy-gmii-sel";
576b37b7c97f13 Siddharth Vadapalli 2023-04-25    50  			reg = <0x4034 0x4>;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25    51  			#phy-cells = <1>;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25    52  		};
576b37b7c97f13 Siddharth Vadapalli 2023-04-25    53  
acd1e6c9aeb877 Siddharth Vadapalli 2023-04-25    54  		serdes_ln_ctrl: mux-controller@4080 {
acd1e6c9aeb877 Siddharth Vadapalli 2023-04-25    55  			compatible = "mmio-mux";
acd1e6c9aeb877 Siddharth Vadapalli 2023-04-25    56  			reg = <0x00004080 0x30>;
acd1e6c9aeb877 Siddharth Vadapalli 2023-04-25    57  			#mux-control-cells = <1>;
acd1e6c9aeb877 Siddharth Vadapalli 2023-04-25    58  			mux-reg-masks = <0x4080 0x3>, <0x4084 0x3>, /* SERDES0 lane0/1 select */
acd1e6c9aeb877 Siddharth Vadapalli 2023-04-25    59  					<0x4088 0x3>, <0x408c 0x3>, /* SERDES0 lane2/3 select */
acd1e6c9aeb877 Siddharth Vadapalli 2023-04-25    60  					<0x4090 0x3>, <0x4094 0x3>, /* SERDES1 lane0/1 select */
acd1e6c9aeb877 Siddharth Vadapalli 2023-04-25    61  					<0x4098 0x3>, <0x409c 0x3>, /* SERDES1 lane2/3 select */
acd1e6c9aeb877 Siddharth Vadapalli 2023-04-25    62  					<0x40a0 0x3>, <0x40a4 0x3>, /* SERDES2 lane0/1 select */
acd1e6c9aeb877 Siddharth Vadapalli 2023-04-25    63  					<0x40a8 0x3>, <0x40ac 0x3>; /* SERDES2 lane2/3 select */
acd1e6c9aeb877 Siddharth Vadapalli 2023-04-25    64  		};
acd1e6c9aeb877 Siddharth Vadapalli 2023-04-25    65  	};
acd1e6c9aeb877 Siddharth Vadapalli 2023-04-25    66  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    67  	gic500: interrupt-controller@1800000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    68  		compatible = "arm,gic-v3";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    69  		#address-cells = <2>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    70  		#size-cells = <2>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    71  		ranges;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    72  		#interrupt-cells = <3>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    73  		interrupt-controller;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    74  		reg = <0x00 0x01800000 0x00 0x200000>, /* GICD */
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    75  		      <0x00 0x01900000 0x00 0x100000>, /* GICR */
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    76  		      <0x00 0x6f000000 0x00 0x2000>,   /* GICC */
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    77  		      <0x00 0x6f010000 0x00 0x1000>,   /* GICH */
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    78  		      <0x00 0x6f020000 0x00 0x2000>;   /* GICV */
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    79  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    80  		/* vcpumntirq: virtual CPU interface maintenance interrupt */
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    81  		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    82  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    83  		gic_its: msi-controller@1820000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    84  			compatible = "arm,gic-v3-its";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    85  			reg = <0x00 0x01820000 0x00 0x10000>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    86  			socionext,synquacer-pre-its = <0x1000000 0x400000>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    87  			msi-controller;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    88  			#msi-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    89  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    90  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    91  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    92  	main_gpio_intr: interrupt-controller@a00000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    93  		compatible = "ti,sci-intr";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    94  		reg = <0x00 0x00a00000 0x00 0x800>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    95  		ti,intr-trigger-type = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    96  		interrupt-controller;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    97  		interrupt-parent = <&gic500>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    98  		#interrupt-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14    99  		ti,sci = <&sms>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   100  		ti,sci-dev-id = <10>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   101  		ti,interrupt-ranges = <8 360 56>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   102  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   103  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   104  	main_pmx0: pinctrl@11c000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   105  		compatible = "pinctrl-single";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   106  		/* Proxy 0 addressing */
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   107  		reg = <0x00 0x11c000 0x00 0x120>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   108  		#pinctrl-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   109  		pinctrl-single,register-width = <32>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   110  		pinctrl-single,function-mask = <0xffffffff>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   111  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   112  
4a7426e3368bc1 Jayesh Choudhary    2023-04-14   113  	main_crypto: crypto@4e00000 {
4a7426e3368bc1 Jayesh Choudhary    2023-04-14   114  		compatible = "ti,j721e-sa2ul";
4a7426e3368bc1 Jayesh Choudhary    2023-04-14   115  		reg = <0x00 0x4e00000 0x00 0x1200>;
4a7426e3368bc1 Jayesh Choudhary    2023-04-14   116  		power-domains = <&k3_pds 369 TI_SCI_PD_EXCLUSIVE>;
4a7426e3368bc1 Jayesh Choudhary    2023-04-14   117  		#address-cells = <2>;
4a7426e3368bc1 Jayesh Choudhary    2023-04-14   118  		#size-cells = <2>;
4a7426e3368bc1 Jayesh Choudhary    2023-04-14   119  		ranges = <0x00 0x04e00000 0x00 0x04e00000 0x00 0x30000>;
4a7426e3368bc1 Jayesh Choudhary    2023-04-14   120  
4a7426e3368bc1 Jayesh Choudhary    2023-04-14   121  		dmas = <&main_udmap 0xca40>, <&main_udmap 0x4a40>,
4a7426e3368bc1 Jayesh Choudhary    2023-04-14   122  				<&main_udmap 0x4a41>;
4a7426e3368bc1 Jayesh Choudhary    2023-04-14   123  		dma-names = "tx", "rx1", "rx2";
4a7426e3368bc1 Jayesh Choudhary    2023-04-14   124  
4a7426e3368bc1 Jayesh Choudhary    2023-04-14   125  		rng: rng@4e10000 {
4a7426e3368bc1 Jayesh Choudhary    2023-04-14   126  			compatible = "inside-secure,safexcel-eip76";
4a7426e3368bc1 Jayesh Choudhary    2023-04-14   127  			reg = <0x00 0x4e10000 0x00 0x7d>;
4a7426e3368bc1 Jayesh Choudhary    2023-04-14   128  			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
4a7426e3368bc1 Jayesh Choudhary    2023-04-14   129  		};
4a7426e3368bc1 Jayesh Choudhary    2023-04-14   130  	};
4a7426e3368bc1 Jayesh Choudhary    2023-04-14   131  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   132  	main_uart0: serial@2800000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   133  		compatible = "ti,j721e-uart", "ti,am654-uart";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   134  		reg = <0x00 0x02800000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   135  		interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   136  		current-speed = <115200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   137  		clocks = <&k3_clks 146 0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   138  		clock-names = "fclk";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   139  		power-domains = <&k3_pds 146 TI_SCI_PD_EXCLUSIVE>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   140  		status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   141  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   142  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   143  	main_uart1: serial@2810000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   144  		compatible = "ti,j721e-uart", "ti,am654-uart";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   145  		reg = <0x00 0x02810000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   146  		interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   147  		current-speed = <115200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   148  		clocks = <&k3_clks 388 0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   149  		clock-names = "fclk";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   150  		power-domains = <&k3_pds 388 TI_SCI_PD_EXCLUSIVE>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   151  		status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   152  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   153  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   154  	main_uart2: serial@2820000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   155  		compatible = "ti,j721e-uart", "ti,am654-uart";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   156  		reg = <0x00 0x02820000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   157  		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   158  		current-speed = <115200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   159  		clocks = <&k3_clks 389 0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   160  		clock-names = "fclk";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   161  		power-domains = <&k3_pds 389 TI_SCI_PD_EXCLUSIVE>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   162  		status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   163  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   164  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   165  	main_uart3: serial@2830000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   166  		compatible = "ti,j721e-uart", "ti,am654-uart";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   167  		reg = <0x00 0x02830000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   168  		interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   169  		current-speed = <115200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   170  		clocks = <&k3_clks 390 0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   171  		clock-names = "fclk";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   172  		power-domains = <&k3_pds 390 TI_SCI_PD_EXCLUSIVE>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   173  		status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   174  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   175  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   176  	main_uart4: serial@2840000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   177  		compatible = "ti,j721e-uart", "ti,am654-uart";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   178  		reg = <0x00 0x02840000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   179  		interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   180  		current-speed = <115200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   181  		clocks = <&k3_clks 391 0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   182  		clock-names = "fclk";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   183  		power-domains = <&k3_pds 391 TI_SCI_PD_EXCLUSIVE>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   184  		status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   185  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   186  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   187  	main_uart5: serial@2850000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   188  		compatible = "ti,j721e-uart", "ti,am654-uart";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   189  		reg = <0x00 0x02850000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   190  		interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   191  		current-speed = <115200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   192  		clocks = <&k3_clks 392 0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   193  		clock-names = "fclk";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   194  		power-domains = <&k3_pds 392 TI_SCI_PD_EXCLUSIVE>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   195  		status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   196  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   197  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   198  	main_uart6: serial@2860000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   199  		compatible = "ti,j721e-uart", "ti,am654-uart";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   200  		reg = <0x00 0x02860000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   201  		interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   202  		current-speed = <115200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   203  		clocks = <&k3_clks 393 0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   204  		clock-names = "fclk";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   205  		power-domains = <&k3_pds 393 TI_SCI_PD_EXCLUSIVE>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   206  		status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   207  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   208  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   209  	main_uart7: serial@2870000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   210  		compatible = "ti,j721e-uart", "ti,am654-uart";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   211  		reg = <0x00 0x02870000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   212  		interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   213  		current-speed = <115200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   214  		clocks = <&k3_clks 394 0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   215  		clock-names = "fclk";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   216  		power-domains = <&k3_pds 394 TI_SCI_PD_EXCLUSIVE>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   217  		status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   218  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   219  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   220  	main_uart8: serial@2880000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   221  		compatible = "ti,j721e-uart", "ti,am654-uart";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   222  		reg = <0x00 0x02880000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   223  		interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   224  		current-speed = <115200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   225  		clocks = <&k3_clks 395 0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   226  		clock-names = "fclk";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   227  		power-domains = <&k3_pds 395 TI_SCI_PD_EXCLUSIVE>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   228  		status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   229  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   230  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   231  	main_uart9: serial@2890000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   232  		compatible = "ti,j721e-uart", "ti,am654-uart";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   233  		reg = <0x00 0x02890000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   234  		interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   235  		current-speed = <115200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   236  		clocks = <&k3_clks 396 0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   237  		clock-names = "fclk";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   238  		power-domains = <&k3_pds 396 TI_SCI_PD_EXCLUSIVE>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   239  		status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   240  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   241  
d07dd70854aca7 Randolph Sapp       2023-04-17   242  	gpu: gpu@4e20000000 {
d07dd70854aca7 Randolph Sapp       2023-04-17   243  		compatible = "ti,j721s2-pvr", "img,pvr-bxs64";
d07dd70854aca7 Randolph Sapp       2023-04-17   244  		reg = <0x4e 0x20000000 0x00 0x80000>;
d07dd70854aca7 Randolph Sapp       2023-04-17   245  		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
a3575de2019b4e Randolph Sapp       2023-05-04   246  		power-domains = <&k3_pds 182 TI_SCI_PD_EXCLUSIVE>;
d07dd70854aca7 Randolph Sapp       2023-04-17   247  		clocks = <&k3_clks 181 1>;
d07dd70854aca7 Randolph Sapp       2023-04-17   248  	};
d07dd70854aca7 Randolph Sapp       2023-04-17   249  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   250  	main_gpio0: gpio@600000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   251  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   252  		reg = <0x00 0x00600000 0x00 0x100>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   253  		gpio-controller;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   254  		#gpio-cells = <2>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   255  		interrupt-parent = <&main_gpio_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   256  		interrupts = <145>, <146>, <147>, <148>, <149>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   257  		interrupt-controller;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   258  		#interrupt-cells = <2>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   259  		ti,ngpio = <66>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   260  		ti,davinci-gpio-unbanked = <0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   261  		power-domains = <&k3_pds 163 TI_SCI_PD_EXCLUSIVE>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   262  		clocks = <&k3_clks 163 0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   263  		clock-names = "gpio";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   264  		status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   265  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   266  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   267  	main_gpio2: gpio@610000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   268  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   269  		reg = <0x00 0x00610000 0x00 0x100>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   270  		gpio-controller;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   271  		#gpio-cells = <2>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   272  		interrupt-parent = <&main_gpio_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   273  		interrupts = <154>, <155>, <156>, <157>, <158>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   274  		interrupt-controller;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   275  		#interrupt-cells = <2>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   276  		ti,ngpio = <66>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   277  		ti,davinci-gpio-unbanked = <0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   278  		power-domains = <&k3_pds 164 TI_SCI_PD_EXCLUSIVE>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   279  		clocks = <&k3_clks 164 0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   280  		clock-names = "gpio";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   281  		status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   282  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   283  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   284  	main_gpio4: gpio@620000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   285  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   286  		reg = <0x00 0x00620000 0x00 0x100>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   287  		gpio-controller;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   288  		#gpio-cells = <2>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   289  		interrupt-parent = <&main_gpio_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   290  		interrupts = <163>, <164>, <165>, <166>, <167>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   291  		interrupt-controller;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   292  		#interrupt-cells = <2>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   293  		ti,ngpio = <66>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   294  		ti,davinci-gpio-unbanked = <0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   295  		power-domains = <&k3_pds 165 TI_SCI_PD_EXCLUSIVE>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   296  		clocks = <&k3_clks 165 0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   297  		clock-names = "gpio";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   298  		status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   299  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   300  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   301  	main_gpio6: gpio@630000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   302  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   303  		reg = <0x00 0x00630000 0x00 0x100>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   304  		gpio-controller;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   305  		#gpio-cells = <2>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   306  		interrupt-parent = <&main_gpio_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   307  		interrupts = <172>, <173>, <174>, <175>, <176>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   308  		interrupt-controller;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   309  		#interrupt-cells = <2>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   310  		ti,ngpio = <66>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   311  		ti,davinci-gpio-unbanked = <0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   312  		power-domains = <&k3_pds 166 TI_SCI_PD_EXCLUSIVE>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   313  		clocks = <&k3_clks 166 0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   314  		clock-names = "gpio";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   315  		status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   316  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   317  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   318  	main_i2c0: i2c@2000000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   319  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   320  		reg = <0x00 0x02000000 0x00 0x100>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   321  		interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   322  		#address-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   323  		#size-cells = <0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   324  		clocks = <&k3_clks 270 2>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   325  		clock-names = "fck";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   326  		power-domains = <&k3_pds 270 TI_SCI_PD_EXCLUSIVE>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   327  		status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   328  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   329  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   330  	main_i2c1: i2c@2010000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   331  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   332  		reg = <0x00 0x02010000 0x00 0x100>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   333  		interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   334  		#address-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   335  		#size-cells = <0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   336  		clocks = <&k3_clks 271 2>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   337  		clock-names = "fck";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   338  		power-domains = <&k3_pds 271 TI_SCI_PD_EXCLUSIVE>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   339  		status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   340  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   341  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   342  	main_i2c2: i2c@2020000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   343  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   344  		reg = <0x00 0x02020000 0x00 0x100>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   345  		interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   346  		#address-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   347  		#size-cells = <0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   348  		clocks = <&k3_clks 272 2>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   349  		clock-names = "fck";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   350  		power-domains = <&k3_pds 272 TI_SCI_PD_EXCLUSIVE>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   351  		status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   352  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   353  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   354  	main_i2c3: i2c@2030000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   355  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   356  		reg = <0x00 0x02030000 0x00 0x100>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   357  		interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   358  		#address-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   359  		#size-cells = <0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   360  		clocks = <&k3_clks 273 2>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   361  		clock-names = "fck";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   362  		power-domains = <&k3_pds 273 TI_SCI_PD_EXCLUSIVE>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   363  		status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   364  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   365  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   366  	main_i2c4: i2c@2040000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   367  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   368  		reg = <0x00 0x02040000 0x00 0x100>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   369  		interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   370  		#address-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   371  		#size-cells = <0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   372  		clocks = <&k3_clks 274 2>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   373  		clock-names = "fck";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   374  		power-domains = <&k3_pds 274 TI_SCI_PD_EXCLUSIVE>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   375  		status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   376  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   377  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   378  	main_i2c5: i2c@2050000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   379  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   380  		reg = <0x00 0x02050000 0x00 0x100>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   381  		interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   382  		#address-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   383  		#size-cells = <0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   384  		clocks = <&k3_clks 275 2>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   385  		clock-names = "fck";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   386  		power-domains = <&k3_pds 275 TI_SCI_PD_EXCLUSIVE>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   387  		status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   388  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   389  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   390  	main_i2c6: i2c@2060000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   391  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   392  		reg = <0x00 0x02060000 0x00 0x100>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   393  		interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   394  		#address-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   395  		#size-cells = <0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   396  		clocks = <&k3_clks 276 2>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   397  		clock-names = "fck";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   398  		power-domains = <&k3_pds 276 TI_SCI_PD_EXCLUSIVE>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   399  		status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   400  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   401  
01985debd0a89b Brandon Brnich      2023-05-09   402      vpu0: video-codec@4210000 {
01985debd0a89b Brandon Brnich      2023-05-09   403  		compatible = "cnm,cm521c-vpu";
01985debd0a89b Brandon Brnich      2023-05-09   404  		reg = <0x00 0x4210000 0x00 0x10000>;
01985debd0a89b Brandon Brnich      2023-05-09   405  		interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
01985debd0a89b Brandon Brnich      2023-05-09   406  		clocks = <&k3_clks 241 2>;
01985debd0a89b Brandon Brnich      2023-05-09   407  		clock-names = "vcodec";
01985debd0a89b Brandon Brnich      2023-05-09   408  		power-domains = <&k3_pds 241 TI_SCI_PD_EXCLUSIVE>;
01985debd0a89b Brandon Brnich      2023-05-09   409  		sram=<&msmc_ram>;
01985debd0a89b Brandon Brnich      2023-05-09   410  	};
01985debd0a89b Brandon Brnich      2023-05-09   411  
01985debd0a89b Brandon Brnich      2023-05-09   412      vpu1: video-codec@4220000 {
01985debd0a89b Brandon Brnich      2023-05-09   413  		compatible = "cnm,cm521c-vpu";
01985debd0a89b Brandon Brnich      2023-05-09   414  		reg = <0x00 0x4220000 0x00 0x10000>;
01985debd0a89b Brandon Brnich      2023-05-09   415  		interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
01985debd0a89b Brandon Brnich      2023-05-09   416  		clocks = <&k3_clks 242 2>;
01985debd0a89b Brandon Brnich      2023-05-09   417  		clock-names = "vcodec";
01985debd0a89b Brandon Brnich      2023-05-09   418  		power-domains = <&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
01985debd0a89b Brandon Brnich      2023-05-09   419  		sram=<&msmc_ram>;
01985debd0a89b Brandon Brnich      2023-05-09   420  	};
01985debd0a89b Brandon Brnich      2023-05-09   421  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   422  	main_sdhci0: mmc@4f80000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   423  		compatible = "ti,j721e-sdhci-8bit";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   424  		reg = <0x00 0x04f80000 0x00 0x1000>,
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   425  		      <0x00 0x04f88000 0x00 0x400>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   426  		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   427  		power-domains = <&k3_pds 140 TI_SCI_PD_EXCLUSIVE>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   428  		clocks = <&k3_clks 140 1>, <&k3_clks 140 2>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   429  		clock-names =  "clk_ahb", "clk_xin";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   430  		assigned-clocks = <&k3_clks 140 2>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   431  		assigned-clock-parents = <&k3_clks 140 3>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   432  		bus-width = <8>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   433  		ti,otap-del-sel-legacy = <0x0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   434  		ti,otap-del-sel-mmc-hs = <0x0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   435  		ti,otap-del-sel-ddr52 = <0x6>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   436  		ti,otap-del-sel-hs200 = <0x8>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   437  		ti,otap-del-sel-hs400 = <0x5>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   438  		ti,itap-del-sel-legacy = <0x10>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   439  		ti,itap-del-sel-mmc-hs = <0xa>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   440  		ti,strobe-sel = <0x77>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   441  		ti,clkbuf-sel = <0x7>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   442  		ti,trm-icp = <0x8>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   443  		mmc-ddr-1_8v;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   444  		mmc-hs200-1_8v;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   445  		mmc-hs400-1_8v;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   446  		dma-coherent;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   447  		no-1-8-v;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   448  		status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   449  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   450  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   451  	main_sdhci1: mmc@4fb0000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   452  		compatible = "ti,j721e-sdhci-4bit";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   453  		reg = <0x00 0x04fb0000 0x00 0x1000>,
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   454  		      <0x00 0x04fb8000 0x00 0x400>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   455  		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   456  		power-domains = <&k3_pds 141 TI_SCI_PD_EXCLUSIVE>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   457  		clocks = <&k3_clks 141 3>, <&k3_clks 141 4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   458  		clock-names =  "clk_ahb", "clk_xin";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   459  		assigned-clocks = <&k3_clks 141 4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   460  		assigned-clock-parents = <&k3_clks 141 5>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   461  		bus-width = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   462  		ti,otap-del-sel-legacy = <0x0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   463  		ti,otap-del-sel-sd-hs = <0x0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   464  		ti,otap-del-sel-sdr12 = <0xf>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   465  		ti,otap-del-sel-sdr25 = <0xf>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   466  		ti,otap-del-sel-sdr50 = <0xc>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   467  		ti,otap-del-sel-sdr104 = <0x5>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   468  		ti,otap-del-sel-ddr50 = <0xc>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   469  		ti,itap-del-sel-legacy = <0x0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   470  		ti,itap-del-sel-sd-hs = <0x0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   471  		ti,itap-del-sel-sdr12 = <0x0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   472  		ti,itap-del-sel-sdr25 = <0x0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   473  		ti,clkbuf-sel = <0x7>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   474  		ti,trm-icp = <0x8>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   475  		dma-coherent;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   476  		sdhci-caps-mask = <0x00000003 0x00000000>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   477  		no-1-8-v;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   478  		status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   479  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   480  
dffe83406dc135 Siddharth Vadapalli 2023-04-25   481  	serdes_wiz0: wiz@5060000 {
dffe83406dc135 Siddharth Vadapalli 2023-04-25   482  		compatible = "ti,j784s4-wiz-10g";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   483  		#address-cells = <1>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   484  		#size-cells = <1>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   485  		power-domains = <&k3_pds 404 TI_SCI_PD_EXCLUSIVE>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   486  		clocks = <&k3_clks 404 2>, <&k3_clks 404 6>, <&serdes_refclk>, <&k3_clks 404 5>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   487  		clock-names = "fck", "core_ref_clk", "ext_ref_clk", "core_ref1_clk";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   488  		assigned-clocks = <&k3_clks 404 6>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   489  		assigned-clock-parents = <&k3_clks 404 10>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   490  		num-lanes = <4>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   491  		#reset-cells = <1>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   492  		#clock-cells = <1>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   493  		ranges = <0x5060000 0x00 0x5060000 0x10000>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   494  
dffe83406dc135 Siddharth Vadapalli 2023-04-25   495  		status = "disabled";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   496  
dffe83406dc135 Siddharth Vadapalli 2023-04-25   497  		serdes0: serdes@5060000 {
dffe83406dc135 Siddharth Vadapalli 2023-04-25   498  			compatible = "ti,j721e-serdes-10g";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   499  			reg = <0x05060000 0x010000>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   500  			reg-names = "torrent_phy";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   501  			resets = <&serdes_wiz0 0>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   502  			reset-names = "torrent_reset";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   503  			clocks = <&serdes_wiz0 TI_WIZ_PLL0_REFCLK>,
dffe83406dc135 Siddharth Vadapalli 2023-04-25   504  				 <&serdes_wiz0 TI_WIZ_PHY_EN_REFCLK>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   505  			clock-names = "refclk", "phy_en_refclk";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   506  			assigned-clocks = <&serdes_wiz0 TI_WIZ_PLL0_REFCLK>,
dffe83406dc135 Siddharth Vadapalli 2023-04-25   507  					  <&serdes_wiz0 TI_WIZ_PLL1_REFCLK>,
dffe83406dc135 Siddharth Vadapalli 2023-04-25   508  					  <&serdes_wiz0 TI_WIZ_REFCLK_DIG>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   509  			assigned-clock-parents = <&k3_clks 404 6>,
dffe83406dc135 Siddharth Vadapalli 2023-04-25   510  						 <&k3_clks 404 6>,
dffe83406dc135 Siddharth Vadapalli 2023-04-25   511  						 <&k3_clks 404 6>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   512  			#address-cells = <1>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   513  			#size-cells = <0>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   514  			#clock-cells = <1>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   515  
dffe83406dc135 Siddharth Vadapalli 2023-04-25   516  			status = "disabled";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   517  		};
dffe83406dc135 Siddharth Vadapalli 2023-04-25   518  	};
dffe83406dc135 Siddharth Vadapalli 2023-04-25   519  
dffe83406dc135 Siddharth Vadapalli 2023-04-25   520  	serdes_wiz1: wiz@5070000 {
dffe83406dc135 Siddharth Vadapalli 2023-04-25   521  		compatible = "ti,j784s4-wiz-10g";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   522  		#address-cells = <1>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   523  		#size-cells = <1>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   524  		power-domains = <&k3_pds 405 TI_SCI_PD_EXCLUSIVE>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   525  		clocks = <&k3_clks 405 2>, <&k3_clks 405 6>, <&serdes_refclk>, <&k3_clks 405 5>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   526  		clock-names = "fck", "core_ref_clk", "ext_ref_clk", "core_ref1_clk";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   527  		assigned-clocks = <&k3_clks 405 6>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   528  		assigned-clock-parents = <&k3_clks 405 10>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   529  		num-lanes = <4>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   530  		#reset-cells = <1>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   531  		#clock-cells = <1>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   532  		ranges = <0x05070000 0x00 0x05070000 0x10000>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   533  
dffe83406dc135 Siddharth Vadapalli 2023-04-25   534  		status = "disabled";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   535  
dffe83406dc135 Siddharth Vadapalli 2023-04-25   536  		serdes1: serdes@5070000 {
dffe83406dc135 Siddharth Vadapalli 2023-04-25   537  			compatible = "ti,j721e-serdes-10g";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   538  			reg = <0x05070000 0x010000>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   539  			reg-names = "torrent_phy";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   540  			resets = <&serdes_wiz1 0>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   541  			reset-names = "torrent_reset";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   542  			clocks = <&serdes_wiz1 TI_WIZ_PLL0_REFCLK>,
dffe83406dc135 Siddharth Vadapalli 2023-04-25   543  				 <&serdes_wiz1 TI_WIZ_PHY_EN_REFCLK>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   544  			clock-names = "refclk", "phy_en_refclk";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   545  			assigned-clocks = <&serdes_wiz1 TI_WIZ_PLL0_REFCLK>,
dffe83406dc135 Siddharth Vadapalli 2023-04-25   546  					  <&serdes_wiz1 TI_WIZ_PLL1_REFCLK>,
dffe83406dc135 Siddharth Vadapalli 2023-04-25   547  					  <&serdes_wiz1 TI_WIZ_REFCLK_DIG>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   548  			assigned-clock-parents = <&k3_clks 405 6>,
dffe83406dc135 Siddharth Vadapalli 2023-04-25   549  						 <&k3_clks 405 6>,
dffe83406dc135 Siddharth Vadapalli 2023-04-25   550  						 <&k3_clks 405 6>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   551  			#address-cells = <1>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   552  			#size-cells = <0>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   553  			#clock-cells = <1>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   554  
dffe83406dc135 Siddharth Vadapalli 2023-04-25   555  			status = "disabled";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   556  		};
dffe83406dc135 Siddharth Vadapalli 2023-04-25   557  	};
dffe83406dc135 Siddharth Vadapalli 2023-04-25   558  
dffe83406dc135 Siddharth Vadapalli 2023-04-25   559  	serdes_wiz2: wiz@5020000 {
dffe83406dc135 Siddharth Vadapalli 2023-04-25   560  		compatible = "ti,j784s4-wiz-10g";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   561  		#address-cells = <1>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   562  		#size-cells = <1>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   563  		power-domains = <&k3_pds 406 TI_SCI_PD_EXCLUSIVE>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   564  		clocks = <&k3_clks 406 2>, <&k3_clks 406 6>, <&serdes_refclk>, <&k3_clks 406 5>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   565  		clock-names = "fck", "core_ref_clk", "ext_ref_clk", "core_ref1_clk";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   566  		assigned-clocks = <&k3_clks 406 6>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   567  		assigned-clock-parents = <&k3_clks 406 10>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   568  		num-lanes = <4>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   569  		#reset-cells = <1>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   570  		#clock-cells = <1>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   571  		ranges = <0x05020000 0x00 0x05020000 0x10000>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   572  
dffe83406dc135 Siddharth Vadapalli 2023-04-25   573  		status = "disabled";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   574  
dffe83406dc135 Siddharth Vadapalli 2023-04-25   575  		serdes2: serdes@5020000 {
dffe83406dc135 Siddharth Vadapalli 2023-04-25   576  			compatible = "ti,j721e-serdes-10g";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   577  			reg = <0x05020000 0x010000>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   578  			reg-names = "torrent_phy";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   579  			resets = <&serdes_wiz2 0>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   580  			reset-names = "torrent_reset";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   581  			clocks = <&serdes_wiz2 TI_WIZ_PLL0_REFCLK>,
dffe83406dc135 Siddharth Vadapalli 2023-04-25   582  				 <&serdes_wiz2 TI_WIZ_PHY_EN_REFCLK>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   583  			clock-names = "refclk", "phy_en_refclk";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   584  			assigned-clocks = <&serdes_wiz2 TI_WIZ_PLL0_REFCLK>,
dffe83406dc135 Siddharth Vadapalli 2023-04-25   585  					  <&serdes_wiz2 TI_WIZ_PLL1_REFCLK>,
dffe83406dc135 Siddharth Vadapalli 2023-04-25   586  					  <&serdes_wiz2 TI_WIZ_REFCLK_DIG>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   587  			assigned-clock-parents = <&k3_clks 406 6>,
dffe83406dc135 Siddharth Vadapalli 2023-04-25   588  						 <&k3_clks 406 6>,
dffe83406dc135 Siddharth Vadapalli 2023-04-25   589  						 <&k3_clks 406 6>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   590  			#address-cells = <1>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   591  			#size-cells = <0>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   592  			#clock-cells = <1>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   593  
dffe83406dc135 Siddharth Vadapalli 2023-04-25   594  			status = "disabled";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   595  		};
dffe83406dc135 Siddharth Vadapalli 2023-04-25   596  	};
dffe83406dc135 Siddharth Vadapalli 2023-04-25   597  
dffe83406dc135 Siddharth Vadapalli 2023-04-25   598  	serdes_wiz4: wiz@5050000 {
dffe83406dc135 Siddharth Vadapalli 2023-04-25   599  		compatible = "ti,j784s4-wiz-10g";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   600  		#address-cells = <1>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   601  		#size-cells = <1>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   602  		power-domains = <&k3_pds 407 TI_SCI_PD_EXCLUSIVE>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   603  		clocks = <&k3_clks 407 2>, <&k3_clks 407 6>, <&serdes_refclk>, <&k3_clks 407 5>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   604  		clock-names = "fck", "core_ref_clk", "ext_ref_clk", "core_ref1_clk";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   605  		assigned-clocks = <&k3_clks 407 6>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   606  		assigned-clock-parents = <&k3_clks 407 10>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   607  		num-lanes = <4>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   608  		#reset-cells = <1>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   609  		#clock-cells = <1>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   610  		ranges = <0x05050000 0x00 0x05050000 0x10000>,
dffe83406dc135 Siddharth Vadapalli 2023-04-25   611  			 <0xa030a00 0x00 0xa030a00 0x40>; /* DPTX PHY */
dffe83406dc135 Siddharth Vadapalli 2023-04-25   612  
dffe83406dc135 Siddharth Vadapalli 2023-04-25   613  		status = "disabled";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   614  
dffe83406dc135 Siddharth Vadapalli 2023-04-25   615  		serdes4: serdes@5050000 {
dffe83406dc135 Siddharth Vadapalli 2023-04-25   616  			/*
dffe83406dc135 Siddharth Vadapalli 2023-04-25   617  			 * Note: we also map DPTX PHY registers as the Torrent
dffe83406dc135 Siddharth Vadapalli 2023-04-25   618  			 * needs to manage those.
dffe83406dc135 Siddharth Vadapalli 2023-04-25   619  			 */
dffe83406dc135 Siddharth Vadapalli 2023-04-25   620  			compatible = "ti,j721e-serdes-10g";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   621  			reg = <0x05050000 0x010000>,
dffe83406dc135 Siddharth Vadapalli 2023-04-25   622  			      <0x0a030a00 0x40>; /* DPTX PHY */
dffe83406dc135 Siddharth Vadapalli 2023-04-25   623  			reg-names = "torrent_phy";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   624  			resets = <&serdes_wiz4 0>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   625  			reset-names = "torrent_reset";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   626  			clocks = <&serdes_wiz4 TI_WIZ_PLL0_REFCLK>,
dffe83406dc135 Siddharth Vadapalli 2023-04-25   627  				 <&serdes_wiz4 TI_WIZ_PHY_EN_REFCLK>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   628  			clock-names = "refclk", "phy_en_refclk";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   629  			assigned-clocks = <&serdes_wiz4 TI_WIZ_PLL0_REFCLK>,
dffe83406dc135 Siddharth Vadapalli 2023-04-25   630  					  <&serdes_wiz4 TI_WIZ_PLL1_REFCLK>,
dffe83406dc135 Siddharth Vadapalli 2023-04-25   631  					  <&serdes_wiz4 TI_WIZ_REFCLK_DIG>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   632  			assigned-clock-parents = <&k3_clks 407 6>,
dffe83406dc135 Siddharth Vadapalli 2023-04-25   633  						 <&k3_clks 407 6>,
dffe83406dc135 Siddharth Vadapalli 2023-04-25   634  						 <&k3_clks 407 6>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   635  			#address-cells = <1>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   636  			#size-cells = <0>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   637  			#clock-cells = <1>;
dffe83406dc135 Siddharth Vadapalli 2023-04-25   638  
dffe83406dc135 Siddharth Vadapalli 2023-04-25   639  			status = "disabled";
dffe83406dc135 Siddharth Vadapalli 2023-04-25   640  		};
dffe83406dc135 Siddharth Vadapalli 2023-04-25   641  	};
dffe83406dc135 Siddharth Vadapalli 2023-04-25   642  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   643  	main_navss: bus@30000000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   644  		compatible = "simple-bus";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   645  		#address-cells = <2>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   646  		#size-cells = <2>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   647  		ranges = <0x00 0x30000000 0x00 0x30000000 0x00 0x0c400000>;
22b0e9d4f8b63b Jayesh Choudhary    2023-03-14   648  		ti,sci-dev-id = <280>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   649  		dma-coherent;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   650  		dma-ranges;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   651  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   652  		main_navss_intr: interrupt-controller@310e0000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   653  			compatible = "ti,sci-intr";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   654  			reg = <0x00 0x310e0000 0x00 0x4000>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   655  			ti,intr-trigger-type = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   656  			interrupt-controller;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   657  			interrupt-parent = <&gic500>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   658  			#interrupt-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   659  			ti,sci = <&sms>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   660  			ti,sci-dev-id = <283>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   661  			ti,interrupt-ranges = <0 64 64>,
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   662  					      <64 448 64>,
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   663  					      <128 672 64>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   664  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   665  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   666  		main_udmass_inta: msi-controller@33d00000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   667  			compatible = "ti,sci-inta";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   668  			reg = <0x00 0x33d00000 0x00 0x100000>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   669  			interrupt-controller;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   670  			#interrupt-cells = <0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   671  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   672  			msi-controller;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   673  			ti,sci = <&sms>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   674  			ti,sci-dev-id = <321>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   675  			ti,interrupt-ranges = <0 0 256>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   676  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   677  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   678  		secure_proxy_main: mailbox@32c00000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   679  			compatible = "ti,am654-secure-proxy";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   680  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   681  			reg-names = "target_data", "rt", "scfg";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   682  			reg = <0x00 0x32c00000 0x00 0x100000>,
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   683  			      <0x00 0x32400000 0x00 0x100000>,
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   684  			      <0x00 0x32800000 0x00 0x100000>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   685  			interrupt-names = "rx_011";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   686  			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   687  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   688  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   689  		hwspinlock: hwlock@30e00000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   690  			compatible = "ti,am654-hwspinlock";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   691  			reg = <0x00 0x30e00000 0x00 0x1000>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   692  			#hwlock-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   693  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   694  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   695  		mailbox0_cluster0: mailbox@31f80000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   696  			compatible = "ti,am654-mailbox";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   697  			reg = <0x00 0x31f80000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   698  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   699  			ti,mbox-num-users = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   700  			ti,mbox-num-fifos = <16>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   701  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   702  			status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   703  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   704  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   705  		mailbox0_cluster1: mailbox@31f81000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   706  			compatible = "ti,am654-mailbox";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   707  			reg = <0x00 0x31f81000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   708  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   709  			ti,mbox-num-users = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   710  			ti,mbox-num-fifos = <16>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   711  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   712  			status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   713  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   714  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   715  		mailbox0_cluster2: mailbox@31f82000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   716  			compatible = "ti,am654-mailbox";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   717  			reg = <0x00 0x31f82000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   718  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   719  			ti,mbox-num-users = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   720  			ti,mbox-num-fifos = <16>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   721  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   722  			status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   723  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   724  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   725  		mailbox0_cluster3: mailbox@31f83000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   726  			compatible = "ti,am654-mailbox";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   727  			reg = <0x00 0x31f83000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   728  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   729  			ti,mbox-num-users = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   730  			ti,mbox-num-fifos = <16>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   731  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   732  			status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   733  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   734  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   735  		mailbox0_cluster4: mailbox@31f84000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   736  			compatible = "ti,am654-mailbox";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   737  			reg = <0x00 0x31f84000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   738  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   739  			ti,mbox-num-users = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   740  			ti,mbox-num-fifos = <16>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   741  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   742  			status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   743  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   744  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   745  		mailbox0_cluster5: mailbox@31f85000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   746  			compatible = "ti,am654-mailbox";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   747  			reg = <0x00 0x31f85000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   748  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   749  			ti,mbox-num-users = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   750  			ti,mbox-num-fifos = <16>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   751  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   752  			status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   753  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   754  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   755  		mailbox0_cluster6: mailbox@31f86000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   756  			compatible = "ti,am654-mailbox";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   757  			reg = <0x00 0x31f86000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   758  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   759  			ti,mbox-num-users = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   760  			ti,mbox-num-fifos = <16>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   761  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   762  			status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   763  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   764  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   765  		mailbox0_cluster7: mailbox@31f87000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   766  			compatible = "ti,am654-mailbox";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   767  			reg = <0x00 0x31f87000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   768  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   769  			ti,mbox-num-users = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   770  			ti,mbox-num-fifos = <16>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   771  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   772  			status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   773  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   774  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   775  		mailbox0_cluster8: mailbox@31f88000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   776  			compatible = "ti,am654-mailbox";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   777  			reg = <0x00 0x31f88000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   778  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   779  			ti,mbox-num-users = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   780  			ti,mbox-num-fifos = <16>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   781  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   782  			status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   783  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   784  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   785  		mailbox0_cluster9: mailbox@31f89000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   786  			compatible = "ti,am654-mailbox";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   787  			reg = <0x00 0x31f89000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   788  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   789  			ti,mbox-num-users = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   790  			ti,mbox-num-fifos = <16>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   791  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   792  			status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   793  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   794  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   795  		mailbox0_cluster10: mailbox@31f8a000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   796  			compatible = "ti,am654-mailbox";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   797  			reg = <0x00 0x31f8a000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   798  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   799  			ti,mbox-num-users = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   800  			ti,mbox-num-fifos = <16>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   801  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   802  			status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   803  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   804  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   805  		mailbox0_cluster11: mailbox@31f8b000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   806  			compatible = "ti,am654-mailbox";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   807  			reg = <0x00 0x31f8b000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   808  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   809  			ti,mbox-num-users = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   810  			ti,mbox-num-fifos = <16>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   811  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   812  			status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   813  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   814  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   815  		mailbox1_cluster0: mailbox@31f90000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   816  			compatible = "ti,am654-mailbox";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   817  			reg = <0x00 0x31f90000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   818  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   819  			ti,mbox-num-users = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   820  			ti,mbox-num-fifos = <16>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   821  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   822  			status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   823  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   824  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   825  		mailbox1_cluster1: mailbox@31f91000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   826  			compatible = "ti,am654-mailbox";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   827  			reg = <0x00 0x31f91000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   828  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   829  			ti,mbox-num-users = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   830  			ti,mbox-num-fifos = <16>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   831  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   832  			status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   833  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   834  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   835  		mailbox1_cluster2: mailbox@31f92000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   836  			compatible = "ti,am654-mailbox";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   837  			reg = <0x00 0x31f92000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   838  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   839  			ti,mbox-num-users = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   840  			ti,mbox-num-fifos = <16>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   841  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   842  			status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   843  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   844  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   845  		mailbox1_cluster3: mailbox@31f93000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   846  			compatible = "ti,am654-mailbox";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   847  			reg = <0x00 0x31f93000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   848  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   849  			ti,mbox-num-users = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   850  			ti,mbox-num-fifos = <16>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   851  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   852  			status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   853  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   854  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   855  		mailbox1_cluster4: mailbox@31f94000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   856  			compatible = "ti,am654-mailbox";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   857  			reg = <0x00 0x31f94000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   858  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   859  			ti,mbox-num-users = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   860  			ti,mbox-num-fifos = <16>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   861  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   862  			status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   863  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   864  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   865  		mailbox1_cluster5: mailbox@31f95000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   866  			compatible = "ti,am654-mailbox";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   867  			reg = <0x00 0x31f95000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   868  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   869  			ti,mbox-num-users = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   870  			ti,mbox-num-fifos = <16>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   871  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   872  			status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   873  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   874  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   875  		mailbox1_cluster6: mailbox@31f96000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   876  			compatible = "ti,am654-mailbox";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   877  			reg = <0x00 0x31f96000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   878  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   879  			ti,mbox-num-users = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   880  			ti,mbox-num-fifos = <16>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   881  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   882  			status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   883  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   884  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   885  		mailbox1_cluster7: mailbox@31f97000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   886  			compatible = "ti,am654-mailbox";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   887  			reg = <0x00 0x31f97000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   888  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   889  			ti,mbox-num-users = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   890  			ti,mbox-num-fifos = <16>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   891  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   892  			status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   893  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   894  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   895  		mailbox1_cluster8: mailbox@31f98000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   896  			compatible = "ti,am654-mailbox";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   897  			reg = <0x00 0x31f98000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   898  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   899  			ti,mbox-num-users = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   900  			ti,mbox-num-fifos = <16>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   901  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   902  			status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   903  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   904  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   905  		mailbox1_cluster9: mailbox@31f99000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   906  			compatible = "ti,am654-mailbox";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   907  			reg = <0x00 0x31f99000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   908  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   909  			ti,mbox-num-users = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   910  			ti,mbox-num-fifos = <16>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   911  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   912  			status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   913  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   914  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   915  		mailbox1_cluster10: mailbox@31f9a000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   916  			compatible = "ti,am654-mailbox";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   917  			reg = <0x00 0x31f9a000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   918  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   919  			ti,mbox-num-users = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   920  			ti,mbox-num-fifos = <16>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   921  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   922  			status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   923  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   924  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   925  		mailbox1_cluster11: mailbox@31f9b000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   926  			compatible = "ti,am654-mailbox";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   927  			reg = <0x00 0x31f9b000 0x00 0x200>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   928  			#mbox-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   929  			ti,mbox-num-users = <4>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   930  			ti,mbox-num-fifos = <16>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   931  			interrupt-parent = <&main_navss_intr>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   932  			status = "disabled";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   933  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   934  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   935  		main_ringacc: ringacc@3c000000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   936  			compatible = "ti,am654-navss-ringacc";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   937  			reg = <0x00 0x3c000000 0x00 0x400000>,
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   938  			      <0x00 0x38000000 0x00 0x400000>,
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   939  			      <0x00 0x31120000 0x00 0x100>,
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   940  			      <0x00 0x33000000 0x00 0x40000>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   941  			reg-names = "rt", "fifos", "proxy_gcfg", "proxy_target";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   942  			ti,num-rings = <1024>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   943  			ti,sci-rm-range-gp-rings = <0x1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   944  			ti,sci = <&sms>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   945  			ti,sci-dev-id = <315>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   946  			msi-parent = <&main_udmass_inta>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   947  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   948  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   949  		main_udmap: dma-controller@31150000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   950  			compatible = "ti,j721e-navss-main-udmap";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   951  			reg = <0x00 0x31150000 0x00 0x100>,
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   952  			      <0x00 0x34000000 0x00 0x80000>,
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   953  			      <0x00 0x35000000 0x00 0x200000>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   954  			reg-names = "gcfg", "rchanrt", "tchanrt";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   955  			msi-parent = <&main_udmass_inta>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   956  			#dma-cells = <1>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   957  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   958  			ti,sci = <&sms>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   959  			ti,sci-dev-id = <319>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   960  			ti,ringacc = <&main_ringacc>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   961  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   962  			ti,sci-rm-range-tchan = <0x0d>, /* TX_CHAN */
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   963  						<0x0f>, /* TX_HCHAN */
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   964  						<0x10>; /* TX_UHCHAN */
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   965  			ti,sci-rm-range-rchan = <0x0a>, /* RX_CHAN */
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   966  						<0x0b>, /* RX_HCHAN */
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   967  						<0x0c>; /* RX_UHCHAN */
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   968  			ti,sci-rm-range-rflow = <0x00>; /* GP RFLOW */
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   969  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   970  
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   971  		cpts@310d0000 {
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   972  			compatible = "ti,j721e-cpts";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   973  			reg = <0x00 0x310d0000 0x00 0x400>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   974  			reg-names = "cpts";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   975  			clocks = <&k3_clks 282 0>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   976  			clock-names = "cpts";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   977  			assigned-clocks = <&k3_clks 62 3>; /* CPTS_RFT_CLK */
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   978  			assigned-clock-parents = <&k3_clks 62 5>; /* MAIN_0_HSDIV6_CLK */
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   979  			interrupts-extended = <&main_navss_intr 391>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   980  			interrupt-names = "cpts";
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   981  			ti,cpts-periodic-outputs = <6>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   982  			ti,cpts-ext-ts-inputs = <8>;
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   983  		};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   984  	};
bebe2e3c9a30f9 Apurva Nandan       2023-03-14   985  
576b37b7c97f13 Siddharth Vadapalli 2023-04-25   986  	main_cpsw1: ethernet@c200000 {
576b37b7c97f13 Siddharth Vadapalli 2023-04-25   987  		compatible = "ti,j721e-cpsw-nuss";
576b37b7c97f13 Siddharth Vadapalli 2023-04-25   988  		reg = <0x00 0xc200000 0x00 0x200000>;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25   989  		reg-names = "cpsw_nuss";
576b37b7c97f13 Siddharth Vadapalli 2023-04-25   990  		ranges = <0x00 0x00 0x00 0xc200000 0x00 0x200000>;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25   991  		#address-cells = <2>;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25   992  		#size-cells = <2>;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25   993  		dma-coherent;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25   994  		clocks = <&k3_clks 62 0>;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25   995  		clock-names = "fck";
576b37b7c97f13 Siddharth Vadapalli 2023-04-25   996  		power-domains = <&k3_pds 62 TI_SCI_PD_EXCLUSIVE>;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25   997  
576b37b7c97f13 Siddharth Vadapalli 2023-04-25   998  		dmas = <&main_udmap 0xc640>,
576b37b7c97f13 Siddharth Vadapalli 2023-04-25   999  		       <&main_udmap 0xc641>,
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1000  		       <&main_udmap 0xc642>,
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1001  		       <&main_udmap 0xc643>,
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1002  		       <&main_udmap 0xc644>,
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1003  		       <&main_udmap 0xc645>,
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1004  		       <&main_udmap 0xc646>,
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1005  		       <&main_udmap 0xc647>,
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1006  		       <&main_udmap 0x4640>;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1007  		dma-names = "tx0", "tx1", "tx2", "tx3",
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1008  			    "tx4", "tx5", "tx6", "tx7",
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1009  			    "rx";
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1010  
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1011  		status = "disabled";
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1012  
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1013  		ethernet-ports {
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1014  			#address-cells = <1>;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1015  			#size-cells = <0>;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1016  
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1017  			main_cpsw1_port1: port@1 {
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1018  				reg = <1>;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1019  				label = "port1";
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1020  				phys = <&cpsw1_phy_gmii_sel 1>;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1021  				ti,mac-only;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1022  				status = "disabled";
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1023  			};
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1024  		};
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1025  
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1026  		main_cpsw1_mdio: mdio@f00 {
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1027  			compatible = "ti,cpsw-mdio", "ti,davinci_mdio";
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1028  			reg = <0x00 0xf00 0x00 0x100>;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1029  			#address-cells = <1>;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1030  			#size-cells = <0>;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1031  			clocks = <&k3_clks 62 0>;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1032  			clock-names = "fck";
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1033  			bus_freq = <1000000>;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1034  		};
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1035  
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1036  		cpts@3d000 {
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1037  			compatible = "ti,am65-cpts";
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1038  			reg = <0x00 0x3d000 0x00 0x400>;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1039  			clocks = <&k3_clks 62 3>;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1040  			clock-names = "cpts";
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1041  			interrupts-extended = <&gic500 GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1042  			interrupt-names = "cpts";
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1043  			ti,cpts-ext-ts-inputs = <4>;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1044  			ti,cpts-periodic-outputs = <2>;
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1045  		};
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1046  	};
576b37b7c97f13 Siddharth Vadapalli 2023-04-25  1047  
b8ef2e6c5f6071 Matt Ranostay       2023-05-15 @1048  	pcie0_rc: pcie@2900000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
