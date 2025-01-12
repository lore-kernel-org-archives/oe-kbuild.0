Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC70416C850
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Jan 2025 08:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736670227; cv=none; b=QK+Klr/vDVH+GKlm9sRmCS6pkPn094mcH1+YMeVXdr58ze8F/S6Zhoz/NAgTPwRY6kquGvr6GycHqHCF9Gh1iVnahgCd/1NdcBVN30gGJaGXEROGNhsFZtrqkEWi/Wh4mDagZztwlC94SwASCjMzgNUz6HHQJQ2lMdxufLGPqg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736670227; c=relaxed/simple;
	bh=PNdPCzlVDrW9636F+AcFkLGDQ4XiqDpY/wViolOEs9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LN3MjuzEdEVC846WWo9B/pRyt3oh0R7N/3UJBGnM1spWEDGXGRgPi+x4+377VNKPzxrA086wGOAPbeOYG2t5auY47DPTPBGNUisoMYO7sNXStcIDwb5myl5w3WrYzW5VB9eDbycO6SgupGfgpvDkD4at1MmEzsDu846ZCQ5M/YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMcsslgg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMcsslgg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736670222; x=1768206222;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PNdPCzlVDrW9636F+AcFkLGDQ4XiqDpY/wViolOEs9I=;
  b=lMcsslggE/XyeQ/5Egd99fox4S1WIcDbN4fM9glVjHQNOIaF/cZcePVL
   P2DUtKUYAkKpeMmzRPL2Ab8yC7C8+hQecAYSxbnX2SqVj58L/moGqkAot
   WSnpf/+WBEUaIJRN405Jb1dmuv4H4+JNuWCU177Uml7J+E4F8BSLstH0X
   Cmvf7O6jz42Rds+Q17uvpUtOhZbD6qcGGGn3Y4tXmHTA3KqQv653WP0CW
   caw+K4Tt+4omuITGoQ6Fn7pGuz+O1NGR0Pyi1x3sXc3t45LbAFVdOj4jP
   OLpEuxK4gR9SV1p7/kcH0dk6876yQfs8YN56nou0blApdCkSFw1PFpIta
   A==;
X-CSE-ConnectionGUID: gnHqov80RFyroZdOGaDApA==
X-CSE-MsgGUID: 4AL61f0eSFa4hKN4vqrc5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="62288680"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="62288680"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 00:23:41 -0800
X-CSE-ConnectionGUID: a05DsExTTTW+lwz3+OBoQw==
X-CSE-MsgGUID: RbLlv/muQXqFAt8u8RTAhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="103930526"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Jan 2025 00:23:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWtFw-000LiH-12;
	Sun, 12 Jan 2025 08:23:36 +0000
Date: Sun, 12 Jan 2025 16:22:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [joel-bmc:for-next 12/55]
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:614.27-619.7: Warning
 (unique_unit_address_if_enabled): /ahb/apb/lpc@1e789000/lpc-ctrl@80:
 duplicate unit-address (also used in node
 /ahb/apb/lpc@1e789000/lpc-snoop@80)
Message-ID: <202501121608.HySk70Sv-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Manojkiran Eda <manojkiran.eda@gmail.com>
CC: Andrew Jeffery <andrew@codeconstruct.com.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git for-next
head:   3540adcccc7179d243216bf488532a62c37d9007
commit: de43a841c9b6808ff0a0669cbef81cb26913d6f7 [12/55] ARM: dts: aspeed: Enable PECI and LPC snoop for IBM System1
:::::: branch date: 4 days ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-053-20250111 (https://download.01.org/0day-ci/archive/20250112/202501121608.HySk70Sv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501121608.HySk70Sv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501121608.HySk70Sv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:614.27-619.7: Warning (unique_unit_address_if_enabled): /ahb/apb/lpc@1e789000/lpc-ctrl@80: duplicate unit-address (also used in node /ahb/apb/lpc@1e789000/lpc-snoop@80)
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']

vim +614 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi

2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11    7  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11    8  / {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11    9  	model = "Aspeed BMC";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   10  	compatible = "aspeed,ast2600";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   11  	#address-cells = <1>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   12  	#size-cells = <1>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   13  	interrupt-parent = <&gic>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   14  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   15  	aliases {
9ee6d17b18804f arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-15   16  		i2c0 = &i2c0;
9ee6d17b18804f arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-15   17  		i2c1 = &i2c1;
9ee6d17b18804f arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-15   18  		i2c2 = &i2c2;
9ee6d17b18804f arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-15   19  		i2c3 = &i2c3;
9ee6d17b18804f arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-15   20  		i2c4 = &i2c4;
9ee6d17b18804f arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-15   21  		i2c5 = &i2c5;
9ee6d17b18804f arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-15   22  		i2c6 = &i2c6;
9ee6d17b18804f arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-15   23  		i2c7 = &i2c7;
9ee6d17b18804f arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-15   24  		i2c8 = &i2c8;
9ee6d17b18804f arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-15   25  		i2c9 = &i2c9;
9ee6d17b18804f arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-15   26  		i2c10 = &i2c10;
9ee6d17b18804f arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-15   27  		i2c11 = &i2c11;
9ee6d17b18804f arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-15   28  		i2c12 = &i2c12;
9ee6d17b18804f arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-15   29  		i2c13 = &i2c13;
9ee6d17b18804f arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-15   30  		i2c14 = &i2c14;
9ee6d17b18804f arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-15   31  		i2c15 = &i2c15;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16   32  		serial0 = &uart1;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16   33  		serial1 = &uart2;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16   34  		serial2 = &uart3;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16   35  		serial3 = &uart4;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   36  		serial4 = &uart5;
2aed40eeb446ed arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-02   37  		serial5 = &vuart1;
2aed40eeb446ed arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-02   38  		serial6 = &vuart2;
2fb4955ac2a90d arch/arm/boot/dts/aspeed-g6.dtsi        Potin Lai        2022-10-25   39  		mdio0 = &mdio0;
2fb4955ac2a90d arch/arm/boot/dts/aspeed-g6.dtsi        Potin Lai        2022-10-25   40  		mdio1 = &mdio1;
2fb4955ac2a90d arch/arm/boot/dts/aspeed-g6.dtsi        Potin Lai        2022-10-25   41  		mdio2 = &mdio2;
2fb4955ac2a90d arch/arm/boot/dts/aspeed-g6.dtsi        Potin Lai        2022-10-25   42  		mdio3 = &mdio3;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   43  	};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   44  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   45  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   46  	cpus {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   47  		#address-cells = <1>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   48  		#size-cells = <0>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   49  		enable-method = "aspeed,ast2600-smp";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   50  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   51  		cpu@f00 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   52  			compatible = "arm,cortex-a7";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   53  			device_type = "cpu";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   54  			reg = <0xf00>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   55  		};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   56  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   57  		cpu@f01 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   58  			compatible = "arm,cortex-a7";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   59  			device_type = "cpu";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   60  			reg = <0xf01>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   61  		};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   62  	};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   63  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   64  	timer {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   65  		compatible = "arm,armv7-timer";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   66  		interrupt-parent = <&gic>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   67  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   68  			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   69  			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   70  			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   71  		clocks = <&syscon ASPEED_CLK_HPLL>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   72  		arm,cpu-registers-not-fw-configured;
c998f40f2ae6a4 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2020-03-26   73  		always-on;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   74  	};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   75  
aac82707fa4593 arch/arm/boot/dts/aspeed-g6.dtsi        Troy Lee         2020-12-07   76  	edac: sdram@1e6e0000 {
aac82707fa4593 arch/arm/boot/dts/aspeed-g6.dtsi        Troy Lee         2020-12-07   77  		compatible = "aspeed,ast2600-sdram-edac", "syscon";
aac82707fa4593 arch/arm/boot/dts/aspeed-g6.dtsi        Troy Lee         2020-12-07   78  		reg = <0x1e6e0000 0x174>;
aac82707fa4593 arch/arm/boot/dts/aspeed-g6.dtsi        Troy Lee         2020-12-07   79  		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
aac82707fa4593 arch/arm/boot/dts/aspeed-g6.dtsi        Troy Lee         2020-12-07   80  	};
aac82707fa4593 arch/arm/boot/dts/aspeed-g6.dtsi        Troy Lee         2020-12-07   81  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   82  	ahb {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   83  		compatible = "simple-bus";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   84  		#address-cells = <1>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   85  		#size-cells = <1>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   86  		device_type = "soc";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   87  		ranges;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   88  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   89  		gic: interrupt-controller@40461000 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   90  			compatible = "arm,cortex-a7-gic";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   91  			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   92  			#interrupt-cells = <3>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   93  			interrupt-controller;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   94  			interrupt-parent = <&gic>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   95  			reg = <0x40461000 0x1000>,
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   96  			    <0x40462000 0x1000>,
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   97  			    <0x40464000 0x2000>,
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   98  			    <0x40466000 0x2000>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11   99  			};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  100  
62462a525b49e5 arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2023-01-04  101  		ahbc: bus@1e600000 {
62462a525b49e5 arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2023-01-04  102  			compatible = "aspeed,ast2600-ahbc", "syscon";
62462a525b49e5 arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2023-01-04  103  			reg = <0x1e600000 0x100>;
62462a525b49e5 arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2023-01-04  104  		};
62462a525b49e5 arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2023-01-04  105  
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  106  		fmc: spi@1e620000 {
651b79e8c9e208 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2022-05-09  107  			reg = <0x1e620000 0xc4>, <0x20000000 0x10000000>;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  108  			#address-cells = <1>;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  109  			#size-cells = <0>;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  110  			compatible = "aspeed,ast2600-fmc";
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  111  			clocks = <&syscon ASPEED_CLK_AHB>;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  112  			status = "disabled";
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  113  			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  114  			flash@0 {
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  115  				reg = < 0 >;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  116  				compatible = "jedec,spi-nor";
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  117  				spi-max-frequency = <50000000>;
4a92d02fce73af arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2022-05-09  118  				spi-rx-bus-width = <2>;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  119  				status = "disabled";
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  120  			};
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  121  			flash@1 {
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  122  				reg = < 1 >;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  123  				compatible = "jedec,spi-nor";
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  124  				spi-max-frequency = <50000000>;
4a92d02fce73af arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2022-05-09  125  				spi-rx-bus-width = <2>;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  126  				status = "disabled";
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  127  			};
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  128  			flash@2 {
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  129  				reg = < 2 >;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  130  				compatible = "jedec,spi-nor";
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  131  				spi-max-frequency = <50000000>;
4a92d02fce73af arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2022-05-09  132  				spi-rx-bus-width = <2>;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  133  				status = "disabled";
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  134  			};
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  135  		};
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  136  
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  137  		spi1: spi@1e630000 {
651b79e8c9e208 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2022-05-09  138  			reg = <0x1e630000 0xc4>, <0x30000000 0x10000000>;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  139  			#address-cells = <1>;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  140  			#size-cells = <0>;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  141  			compatible = "aspeed,ast2600-spi";
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  142  			clocks = <&syscon ASPEED_CLK_AHB>;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  143  			status = "disabled";
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  144  			flash@0 {
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  145  				reg = < 0 >;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  146  				compatible = "jedec,spi-nor";
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  147  				spi-max-frequency = <50000000>;
4a92d02fce73af arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2022-05-09  148  				spi-rx-bus-width = <2>;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  149  				status = "disabled";
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  150  			};
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  151  			flash@1 {
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  152  				reg = < 1 >;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  153  				compatible = "jedec,spi-nor";
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  154  				spi-max-frequency = <50000000>;
4a92d02fce73af arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2022-05-09  155  				spi-rx-bus-width = <2>;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  156  				status = "disabled";
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  157  			};
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  158  		};
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  159  
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  160  		spi2: spi@1e631000 {
651b79e8c9e208 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2022-05-09  161  			reg = <0x1e631000 0xc4>, <0x50000000 0x10000000>;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  162  			#address-cells = <1>;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  163  			#size-cells = <0>;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  164  			compatible = "aspeed,ast2600-spi";
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  165  			clocks = <&syscon ASPEED_CLK_AHB>;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  166  			status = "disabled";
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  167  			flash@0 {
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  168  				reg = < 0 >;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  169  				compatible = "jedec,spi-nor";
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  170  				spi-max-frequency = <50000000>;
4a92d02fce73af arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2022-05-09  171  				spi-rx-bus-width = <2>;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  172  				status = "disabled";
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  173  			};
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  174  			flash@1 {
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  175  				reg = < 1 >;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  176  				compatible = "jedec,spi-nor";
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  177  				spi-max-frequency = <50000000>;
4a92d02fce73af arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2022-05-09  178  				spi-rx-bus-width = <2>;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  179  				status = "disabled";
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  180  			};
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  181  			flash@2 {
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  182  				reg = < 2 >;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  183  				compatible = "jedec,spi-nor";
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  184  				spi-max-frequency = <50000000>;
4a92d02fce73af arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2022-05-09  185  				spi-rx-bus-width = <2>;
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  186  				status = "disabled";
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  187  			};
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  188  		};
51d5d1bf73b934 arch/arm/boot/dts/aspeed-g6.dtsi        Cédric Le Goater 2019-09-25  189  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  190  		mdio0: mdio@1e650000 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  191  			compatible = "aspeed,ast2600-mdio";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  192  			reg = <0x1e650000 0x8>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  193  			#address-cells = <1>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  194  			#size-cells = <0>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  195  			status = "disabled";
d29f8a6e42dbbe arch/arm/boot/dts/aspeed-g6.dtsi        Andrew Jeffery   2019-09-26  196  			pinctrl-names = "default";
d29f8a6e42dbbe arch/arm/boot/dts/aspeed-g6.dtsi        Andrew Jeffery   2019-09-26  197  			pinctrl-0 = <&pinctrl_mdio1_default>;
a8db203db05c52 arch/arm/boot/dts/aspeed-g6.dtsi        Dylan Hung       2022-04-27  198  			resets = <&syscon ASPEED_RESET_MII>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  199  		};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  200  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  201  		mdio1: mdio@1e650008 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  202  			compatible = "aspeed,ast2600-mdio";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  203  			reg = <0x1e650008 0x8>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  204  			#address-cells = <1>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  205  			#size-cells = <0>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  206  			status = "disabled";
d29f8a6e42dbbe arch/arm/boot/dts/aspeed-g6.dtsi        Andrew Jeffery   2019-09-26  207  			pinctrl-names = "default";
d29f8a6e42dbbe arch/arm/boot/dts/aspeed-g6.dtsi        Andrew Jeffery   2019-09-26  208  			pinctrl-0 = <&pinctrl_mdio2_default>;
a8db203db05c52 arch/arm/boot/dts/aspeed-g6.dtsi        Dylan Hung       2022-04-27  209  			resets = <&syscon ASPEED_RESET_MII>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  210  		};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  211  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  212  		mdio2: mdio@1e650010 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  213  			compatible = "aspeed,ast2600-mdio";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  214  			reg = <0x1e650010 0x8>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  215  			#address-cells = <1>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  216  			#size-cells = <0>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  217  			status = "disabled";
d29f8a6e42dbbe arch/arm/boot/dts/aspeed-g6.dtsi        Andrew Jeffery   2019-09-26  218  			pinctrl-names = "default";
d29f8a6e42dbbe arch/arm/boot/dts/aspeed-g6.dtsi        Andrew Jeffery   2019-09-26  219  			pinctrl-0 = <&pinctrl_mdio3_default>;
a8db203db05c52 arch/arm/boot/dts/aspeed-g6.dtsi        Dylan Hung       2022-04-27  220  			resets = <&syscon ASPEED_RESET_MII>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  221  		};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  222  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  223  		mdio3: mdio@1e650018 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  224  			compatible = "aspeed,ast2600-mdio";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  225  			reg = <0x1e650018 0x8>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  226  			#address-cells = <1>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  227  			#size-cells = <0>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  228  			status = "disabled";
d29f8a6e42dbbe arch/arm/boot/dts/aspeed-g6.dtsi        Andrew Jeffery   2019-09-26  229  			pinctrl-names = "default";
d29f8a6e42dbbe arch/arm/boot/dts/aspeed-g6.dtsi        Andrew Jeffery   2019-09-26  230  			pinctrl-0 = <&pinctrl_mdio4_default>;
a8db203db05c52 arch/arm/boot/dts/aspeed-g6.dtsi        Dylan Hung       2022-04-27  231  			resets = <&syscon ASPEED_RESET_MII>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  232  		};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  233  
342329720a2c3c arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Andrew Jeffery   2024-08-02  234  		mac0: ethernet@1e660000 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  235  			compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  236  			reg = <0x1e660000 0x180>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  237  			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  238  			clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  239  			status = "disabled";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  240  		};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  241  
342329720a2c3c arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Andrew Jeffery   2024-08-02  242  		mac1: ethernet@1e680000 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  243  			compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  244  			reg = <0x1e680000 0x180>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  245  			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  246  			clocks = <&syscon ASPEED_CLK_GATE_MAC2CLK>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  247  			status = "disabled";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  248  		};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  249  
342329720a2c3c arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Andrew Jeffery   2024-08-02  250  		mac2: ethernet@1e670000 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  251  			compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  252  			reg = <0x1e670000 0x180>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  253  			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  254  			clocks = <&syscon ASPEED_CLK_GATE_MAC3CLK>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  255  			status = "disabled";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  256  		};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  257  
342329720a2c3c arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Andrew Jeffery   2024-08-02  258  		mac3: ethernet@1e690000 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  259  			compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  260  			reg = <0x1e690000 0x180>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  261  			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  262  			clocks = <&syscon ASPEED_CLK_GATE_MAC4CLK>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  263  			status = "disabled";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  264  		};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  265  
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  266  		ehci0: usb@1e6a1000 {
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  267  			compatible = "aspeed,ast2600-ehci", "generic-ehci";
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  268  			reg = <0x1e6a1000 0x100>;
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  269  			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  270  			clocks = <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  271  			pinctrl-names = "default";
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  272  			pinctrl-0 = <&pinctrl_usb2ah_default>;
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  273  			status = "disabled";
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  274  		};
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  275  
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  276  		ehci1: usb@1e6a3000 {
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  277  			compatible = "aspeed,ast2600-ehci", "generic-ehci";
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  278  			reg = <0x1e6a3000 0x100>;
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  279  			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  280  			clocks = <&syscon ASPEED_CLK_GATE_USBPORT2CLK>;
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  281  			pinctrl-names = "default";
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  282  			pinctrl-0 = <&pinctrl_usb2bh_default>;
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  283  			status = "disabled";
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  284  		};
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  285  
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  286  		uhci: usb@1e6b0000 {
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  287  			compatible = "aspeed,ast2600-uhci", "generic-uhci";
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  288  			reg = <0x1e6b0000 0x100>;
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  289  			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  290  			#ports = <2>;
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  291  			clocks = <&syscon ASPEED_CLK_GATE_USBUHCICLK>;
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  292  			status = "disabled";
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  293  			/*
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  294  			 * No default pinmux, it will follow EHCI, use an
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  295  			 * explicit pinmux override if EHCI is not enabled.
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  296  			 */
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  297  		};
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  298  
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  299  		vhub: usb-vhub@1e6a0000 {
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  300  			compatible = "aspeed,ast2600-usb-vhub";
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  301  			reg = <0x1e6a0000 0x350>;
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  302  			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  303  			clocks = <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  304  			aspeed,vhub-downstream-ports = <7>;
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  305  			aspeed,vhub-generic-endpoints = <21>;
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  306  			pinctrl-names = "default";
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  307  			pinctrl-0 = <&pinctrl_usb2ad_default>;
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  308  			status = "disabled";
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  309  		};
3f796460ed2a1f arch/arm/boot/dts/aspeed-g6.dtsi        Tao Ren          2020-03-02  310  
c9cb67c3a650ef arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2022-05-18  311  		udc: usb@1e6a2000 {
c9cb67c3a650ef arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2022-05-18  312  			compatible = "aspeed,ast2600-udc";
c9cb67c3a650ef arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2022-05-18  313  			reg = <0x1e6a2000 0x300>;
c9cb67c3a650ef arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2022-05-18  314  			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
c9cb67c3a650ef arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2022-05-18  315  			clocks = <&syscon ASPEED_CLK_GATE_USBPORT2CLK>;
c9cb67c3a650ef arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2022-05-18  316  			pinctrl-names = "default";
c9cb67c3a650ef arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2022-05-18  317  			pinctrl-0 = <&pinctrl_usb2bd_default>;
c9cb67c3a650ef arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2022-05-18  318  			status = "disabled";
c9cb67c3a650ef arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2022-05-18  319  		};
c9cb67c3a650ef arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2022-05-18  320  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  321  		apb {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  322  			compatible = "simple-bus";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  323  			#address-cells = <1>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  324  			#size-cells = <1>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  325  			ranges;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  326  
a1a2990e6fea18 arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2022-08-18  327  			hace: crypto@1e6d0000 {
a1a2990e6fea18 arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2022-08-18  328  				compatible = "aspeed,ast2600-hace";
a1a2990e6fea18 arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2022-08-18  329  				reg = <0x1e6d0000 0x200>;
a1a2990e6fea18 arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2022-08-18  330  				interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
a1a2990e6fea18 arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2022-08-18  331  				clocks = <&syscon ASPEED_CLK_GATE_YCLK>;
a1a2990e6fea18 arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2022-08-18  332  				resets = <&syscon ASPEED_RESET_HACE>;
a1a2990e6fea18 arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2022-08-18  333  			};
a1a2990e6fea18 arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2022-08-18  334  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  335  			syscon: syscon@1e6e2000 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  336  				compatible = "aspeed,ast2600-scu", "syscon", "simple-mfd";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  337  				reg = <0x1e6e2000 0x1000>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  338  				ranges = <0 0x1e6e2000 0x1000>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  339  				#address-cells = <1>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  340  				#size-cells = <1>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  341  				#clock-cells = <1>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  342  				#reset-cells = <1>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  343  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  344  				pinctrl: pinctrl {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  345  					compatible = "aspeed,ast2600-pinctrl";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  346  				};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  347  
fe100b382c1c05 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2020-09-21  348  				silicon-id@14 {
fe100b382c1c05 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2020-09-21  349  					compatible = "aspeed,ast2600-silicon-id", "aspeed,silicon-id";
fe100b382c1c05 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2020-09-21  350  					reg = <0x14 0x4 0x5b0 0x8>;
fe100b382c1c05 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2020-09-21  351  				};
fe100b382c1c05 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2020-09-21  352  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  353  				smp-memram@180 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  354  					compatible = "aspeed,ast2600-smpmem";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  355  					reg = <0x180 0x40>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  356  				};
f9950ad2720513 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2020-01-15  357  
f9950ad2720513 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2020-01-15  358  				scu_ic0: interrupt-controller@560 {
f9950ad2720513 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2020-01-15  359  					#interrupt-cells = <1>;
f9950ad2720513 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2020-01-15  360  					compatible = "aspeed,ast2600-scu-ic0";
f9950ad2720513 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2020-01-15  361  					reg = <0x560 0x4>;
f9950ad2720513 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2020-01-15  362  					interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
f9950ad2720513 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2020-01-15  363  					interrupt-controller;
f9950ad2720513 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2020-01-15  364  				};
f9950ad2720513 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2020-01-15  365  
f9950ad2720513 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2020-01-15  366  				scu_ic1: interrupt-controller@570 {
f9950ad2720513 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2020-01-15  367  					#interrupt-cells = <1>;
f9950ad2720513 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2020-01-15  368  					compatible = "aspeed,ast2600-scu-ic1";
f9950ad2720513 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2020-01-15  369  					reg = <0x570 0x4>;
f9950ad2720513 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2020-01-15  370  					interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
f9950ad2720513 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2020-01-15  371  					interrupt-controller;
f9950ad2720513 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2020-01-15  372  				};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  373  			};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  374  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  375  			rng: hwrng@1e6e2524 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  376  				compatible = "timeriomem_rng";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  377  				reg = <0x1e6e2524 0x4>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  378  				period = <1>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  379  				quality = <100>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  380  			};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  381  
4fa40bfa255df3 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2022-03-02  382  			gfx: display@1e6e6000 {
4fa40bfa255df3 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2022-03-02  383  				compatible = "aspeed,ast2600-gfx", "syscon";
4fa40bfa255df3 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2022-03-02  384  				reg = <0x1e6e6000 0x1000>;
4fa40bfa255df3 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2022-03-02  385  				reg-io-width = <4>;
4fa40bfa255df3 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2022-03-02  386  				clocks = <&syscon ASPEED_CLK_GATE_D1CLK>;
4fa40bfa255df3 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2022-03-02  387  				resets = <&syscon ASPEED_RESET_GRAPHICS>;
4fa40bfa255df3 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2022-03-02  388  				syscon = <&syscon>;
4fa40bfa255df3 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2022-03-02  389  				status = "disabled";
4fa40bfa255df3 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2022-03-02  390  				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
4fa40bfa255df3 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2022-03-02  391  			};
4fa40bfa255df3 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2022-03-02  392  
eaad40466bd715 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2021-09-16  393  			adc0: adc@1e6e9000 {
eaad40466bd715 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2021-09-16  394  				compatible = "aspeed,ast2600-adc0";
eaad40466bd715 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2021-09-16  395  				reg = <0x1e6e9000 0x100>;
eaad40466bd715 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2021-09-16  396  				clocks = <&syscon ASPEED_CLK_APB2>;
eaad40466bd715 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2021-09-16  397  				resets = <&syscon ASPEED_RESET_ADC>;
eaad40466bd715 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2021-09-16  398  				interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
eaad40466bd715 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2021-09-16  399  				#io-channel-cells = <1>;
eaad40466bd715 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2021-09-16  400  				status = "disabled";
eaad40466bd715 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2021-09-16  401  			};
eaad40466bd715 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2021-09-16  402  
eaad40466bd715 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2021-09-16  403  			adc1: adc@1e6e9100 {
eaad40466bd715 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2021-09-16  404  				compatible = "aspeed,ast2600-adc1";
eaad40466bd715 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2021-09-16  405  				reg = <0x1e6e9100 0x100>;
eaad40466bd715 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2021-09-16  406  				clocks = <&syscon ASPEED_CLK_APB2>;
eaad40466bd715 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2021-09-16  407  				resets = <&syscon ASPEED_RESET_ADC>;
eaad40466bd715 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2021-09-16  408  				interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
eaad40466bd715 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2021-09-16  409  				#io-channel-cells = <1>;
eaad40466bd715 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2021-09-16  410  				status = "disabled";
eaad40466bd715 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2021-09-16  411  			};
eaad40466bd715 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2021-09-16  412  
fea289467608ff arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2021-11-17  413  			sbc: secure-boot-controller@1e6f2000 {
fea289467608ff arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2021-11-17  414  				compatible = "aspeed,ast2600-sbc";
fea289467608ff arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2021-11-17  415  				reg = <0x1e6f2000 0x1000>;
fea289467608ff arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2021-11-17  416  			};
fea289467608ff arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2021-11-17  417  
62462a525b49e5 arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2023-01-04  418  			acry: crypto@1e6fa000 {
62462a525b49e5 arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2023-01-04  419  				compatible = "aspeed,ast2600-acry";
62462a525b49e5 arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2023-01-04  420  				reg = <0x1e6fa000 0x400>, <0x1e710000 0x1800>;
62462a525b49e5 arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2023-01-04  421  				interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
62462a525b49e5 arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2023-01-04  422  				clocks = <&syscon ASPEED_CLK_GATE_RSACLK>;
62462a525b49e5 arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2023-01-04  423  				aspeed,ahbc = <&ahbc>;
62462a525b49e5 arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2023-01-04  424  			};
62462a525b49e5 arch/arm/boot/dts/aspeed-g6.dtsi        Neal Liu         2023-01-04  425  
32e62d1beab70d arch/arm/boot/dts/aspeed-g6.dtsi        Howard Chiu      2022-03-29  426  			video: video@1e700000 {
32e62d1beab70d arch/arm/boot/dts/aspeed-g6.dtsi        Howard Chiu      2022-03-29  427  				compatible = "aspeed,ast2600-video-engine";
32e62d1beab70d arch/arm/boot/dts/aspeed-g6.dtsi        Howard Chiu      2022-03-29  428  				reg = <0x1e700000 0x1000>;
32e62d1beab70d arch/arm/boot/dts/aspeed-g6.dtsi        Howard Chiu      2022-03-29  429  				clocks = <&syscon ASPEED_CLK_GATE_VCLK>,
32e62d1beab70d arch/arm/boot/dts/aspeed-g6.dtsi        Howard Chiu      2022-03-29  430  					 <&syscon ASPEED_CLK_GATE_ECLK>;
32e62d1beab70d arch/arm/boot/dts/aspeed-g6.dtsi        Howard Chiu      2022-03-29  431  				clock-names = "vclk", "eclk";
32e62d1beab70d arch/arm/boot/dts/aspeed-g6.dtsi        Howard Chiu      2022-03-29  432  				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
32e62d1beab70d arch/arm/boot/dts/aspeed-g6.dtsi        Howard Chiu      2022-03-29  433  				status = "disabled";
32e62d1beab70d arch/arm/boot/dts/aspeed-g6.dtsi        Howard Chiu      2022-03-29  434  			};
32e62d1beab70d arch/arm/boot/dts/aspeed-g6.dtsi        Howard Chiu      2022-03-29  435  
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  436  			gpio0: gpio@1e780000 {
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  437  				#gpio-cells = <2>;
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  438  				gpio-controller;
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  439  				compatible = "aspeed,ast2600-gpio";
886f82ce9f1f45 arch/arm/boot/dts/aspeed-g6.dtsi        Billy Tsai       2020-10-12  440  				reg = <0x1e780000 0x400>;
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  441  				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  442  				gpio-ranges = <&pinctrl 0 0 208>;
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  443  				ngpios = <208>;
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  444  				clocks = <&syscon ASPEED_CLK_APB2>;
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  445  				interrupt-controller;
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  446  				#interrupt-cells = <2>;
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  447  			};
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  448  
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  449  			sgpiom0: sgpiom@1e780500 {
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  450  				#gpio-cells = <2>;
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  451  				gpio-controller;
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  452  				compatible = "aspeed,ast2600-sgpiom";
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  453  				reg = <0x1e780500 0x100>;
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  454  				interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  455  				clocks = <&syscon ASPEED_CLK_APB2>;
96fd598e9c34cf arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Rob Herring      2024-02-13  456  				#interrupt-cells = <2>;
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  457  				interrupt-controller;
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  458  				bus-frequency = <12000000>;
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  459  				pinctrl-names = "default";
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  460  				pinctrl-0 = <&pinctrl_sgpm1_default>;
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  461  				status = "disabled";
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  462  			};
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  463  
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  464  			sgpiom1: sgpiom@1e780600 {
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  465  				#gpio-cells = <2>;
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  466  				gpio-controller;
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  467  				compatible = "aspeed,ast2600-sgpiom";
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  468  				reg = <0x1e780600 0x100>;
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  469  				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  470  				clocks = <&syscon ASPEED_CLK_APB2>;
96fd598e9c34cf arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Rob Herring      2024-02-13  471  				#interrupt-cells = <2>;
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  472  				interrupt-controller;
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  473  				bus-frequency = <12000000>;
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  474  				pinctrl-names = "default";
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  475  				pinctrl-0 = <&pinctrl_sgpm2_default>;
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  476  				status = "disabled";
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  477  			};
09eccdc9ebb533 arch/arm/boot/dts/aspeed-g6.dtsi        Steven Lee       2021-07-12  478  
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  479  			gpio1: gpio@1e780800 {
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  480  				#gpio-cells = <2>;
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  481  				gpio-controller;
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  482  				compatible = "aspeed,ast2600-gpio";
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  483  				reg = <0x1e780800 0x800>;
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  484  				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  485  				gpio-ranges = <&pinctrl 0 208 36>;
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  486  				ngpios = <36>;
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  487  				clocks = <&syscon ASPEED_CLK_APB1>;
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  488  				interrupt-controller;
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  489  				#interrupt-cells = <2>;
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  490  			};
8dbcb5b709b9fb arch/arm/boot/dts/aspeed-g6.dtsi        Rashmica Gupta   2019-08-22  491  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  492  			rtc: rtc@1e781000 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  493  				compatible = "aspeed,ast2600-rtc";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  494  				reg = <0x1e781000 0x18>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  495  				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  496  				status = "disabled";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  497  			};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  498  
3eca037f2dfce0 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-11-06  499  			timer: timer@1e782000 {
3eca037f2dfce0 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-11-06  500  				compatible = "aspeed,ast2600-timer";
3eca037f2dfce0 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-11-06  501  				reg = <0x1e782000 0x90>;
3eca037f2dfce0 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-11-06  502  				interrupts-extended = <&gic  GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
3eca037f2dfce0 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-11-06  503  						<&gic  GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
3eca037f2dfce0 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-11-06  504  						<&gic  GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
3eca037f2dfce0 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-11-06  505  						<&gic  GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
3eca037f2dfce0 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-11-06  506  						<&gic  GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
3eca037f2dfce0 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-11-06  507  						<&gic  GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
3eca037f2dfce0 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-11-06  508  						<&gic  GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
3eca037f2dfce0 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-11-06  509  						<&gic  GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
3eca037f2dfce0 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-11-06  510  				clocks = <&syscon ASPEED_CLK_APB1>;
3eca037f2dfce0 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-11-06  511  				clock-names = "PCLK";
c998f40f2ae6a4 arch/arm/boot/dts/aspeed-g6.dtsi        Eddie James      2020-03-26  512  				status = "disabled";
3eca037f2dfce0 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-11-06  513                          };
3eca037f2dfce0 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-11-06  514  
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  515  			uart1: serial@1e783000 {
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  516  				compatible = "ns16550a";
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  517  				reg = <0x1e783000 0x20>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  518  				reg-shift = <2>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  519  				reg-io-width = <4>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  520  				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  521  				clocks = <&syscon ASPEED_CLK_GATE_UART1CLK>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  522  				resets = <&lpc_reset 4>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  523  				no-loopback-test;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  524  				pinctrl-names = "default";
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  525  				pinctrl-0 = <&pinctrl_txd1_default &pinctrl_rxd1_default>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  526  				status = "disabled";
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  527  			};
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  528  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  529  			uart5: serial@1e784000 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  530  				compatible = "ns16550a";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  531  				reg = <0x1e784000 0x1000>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  532  				reg-shift = <2>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  533  				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  534  				clocks = <&syscon ASPEED_CLK_GATE_UART5CLK>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  535  				no-loopback-test;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  536  			};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  537  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  538  			wdt1: watchdog@1e785000 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  539  				compatible = "aspeed,ast2600-wdt";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  540  				reg = <0x1e785000 0x40>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  541  			};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  542  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  543  			wdt2: watchdog@1e785040 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  544  				compatible = "aspeed,ast2600-wdt";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  545  				reg = <0x1e785040 0x40>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  546  				status = "disabled";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  547  			};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  548  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  549  			wdt3: watchdog@1e785080 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  550  				compatible = "aspeed,ast2600-wdt";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  551  				reg = <0x1e785080 0x40>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  552  				status = "disabled";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  553  			};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  554  
56d71b5501342d arch/arm/boot/dts/aspeed-g6.dtsi        Andrew Jeffery   2019-12-03  555  			wdt4: watchdog@1e7850c0 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  556  				compatible = "aspeed,ast2600-wdt";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  557  				reg = <0x1e7850C0 0x40>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  558  				status = "disabled";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  559  			};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  560  
ac2743a7f6bd46 arch/arm/boot/dts/aspeed-g6.dtsi        Iwona Winiarska  2022-02-08  561  			peci0: peci-controller@1e78b000 {
ac2743a7f6bd46 arch/arm/boot/dts/aspeed-g6.dtsi        Iwona Winiarska  2022-02-08  562  				compatible = "aspeed,ast2600-peci";
ac2743a7f6bd46 arch/arm/boot/dts/aspeed-g6.dtsi        Iwona Winiarska  2022-02-08  563  				reg = <0x1e78b000 0x100>;
ac2743a7f6bd46 arch/arm/boot/dts/aspeed-g6.dtsi        Iwona Winiarska  2022-02-08  564  				interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
ac2743a7f6bd46 arch/arm/boot/dts/aspeed-g6.dtsi        Iwona Winiarska  2022-02-08  565  				clocks = <&syscon ASPEED_CLK_GATE_REF0CLK>;
ac2743a7f6bd46 arch/arm/boot/dts/aspeed-g6.dtsi        Iwona Winiarska  2022-02-08  566  				resets = <&syscon ASPEED_RESET_PECI>;
ac2743a7f6bd46 arch/arm/boot/dts/aspeed-g6.dtsi        Iwona Winiarska  2022-02-08  567  				cmd-timeout-ms = <1000>;
ac2743a7f6bd46 arch/arm/boot/dts/aspeed-g6.dtsi        Iwona Winiarska  2022-02-08  568  				clock-frequency = <1000000>;
ac2743a7f6bd46 arch/arm/boot/dts/aspeed-g6.dtsi        Iwona Winiarska  2022-02-08  569  				status = "disabled";
ac2743a7f6bd46 arch/arm/boot/dts/aspeed-g6.dtsi        Iwona Winiarska  2022-02-08  570  			};
ac2743a7f6bd46 arch/arm/boot/dts/aspeed-g6.dtsi        Iwona Winiarska  2022-02-08  571  
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  572  			lpc: lpc@1e789000 {
311bf0f18cd68f arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei, Wang   2021-03-19  573  				compatible = "aspeed,ast2600-lpc-v2", "simple-mfd", "syscon";
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  574  				reg = <0x1e789000 0x1000>;
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  575  				reg-io-width = <4>;
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  576  
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  577  				#address-cells = <1>;
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  578  				#size-cells = <1>;
311bf0f18cd68f arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei, Wang   2021-03-19  579  				ranges = <0x0 0x1e789000 0x1000>;
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  580  
fa4c8ec6feaa32 arch/arm/boot/dts/aspeed-g6.dtsi        Andrew Jeffery   2020-04-11  581  				kcs1: kcs@24 {
fa4c8ec6feaa32 arch/arm/boot/dts/aspeed-g6.dtsi        Andrew Jeffery   2020-04-11  582  					compatible = "aspeed,ast2500-kcs-bmc-v2";
fa4c8ec6feaa32 arch/arm/boot/dts/aspeed-g6.dtsi        Andrew Jeffery   2020-04-11  583  					reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  584  					interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
45cd8bbaaa18ab arch/arm/boot/dts/aspeed-g6.dtsi        Jae Hyun Yoo     2021-11-08  585  					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  586  					kcs_chan = <1>;
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  587  					status = "disabled";
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  588  				};
311bf0f18cd68f arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei, Wang   2021-03-19  589  
fa4c8ec6feaa32 arch/arm/boot/dts/aspeed-g6.dtsi        Andrew Jeffery   2020-04-11  590  				kcs2: kcs@28 {
fa4c8ec6feaa32 arch/arm/boot/dts/aspeed-g6.dtsi        Andrew Jeffery   2020-04-11  591  					compatible = "aspeed,ast2500-kcs-bmc-v2";
fa4c8ec6feaa32 arch/arm/boot/dts/aspeed-g6.dtsi        Andrew Jeffery   2020-04-11  592  					reg = <0x28 0x1>, <0x34 0x1>, <0x40 0x1>;
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  593  					interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
45cd8bbaaa18ab arch/arm/boot/dts/aspeed-g6.dtsi        Jae Hyun Yoo     2021-11-08  594  					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  595  					status = "disabled";
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  596  				};
311bf0f18cd68f arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei, Wang   2021-03-19  597  
fa4c8ec6feaa32 arch/arm/boot/dts/aspeed-g6.dtsi        Andrew Jeffery   2020-04-11  598  				kcs3: kcs@2c {
fa4c8ec6feaa32 arch/arm/boot/dts/aspeed-g6.dtsi        Andrew Jeffery   2020-04-11  599  					compatible = "aspeed,ast2500-kcs-bmc-v2";
fa4c8ec6feaa32 arch/arm/boot/dts/aspeed-g6.dtsi        Andrew Jeffery   2020-04-11  600  					reg = <0x2c 0x1>, <0x38 0x1>, <0x44 0x1>;
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  601  					interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
45cd8bbaaa18ab arch/arm/boot/dts/aspeed-g6.dtsi        Jae Hyun Yoo     2021-11-08  602  					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  603  					status = "disabled";
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  604  				};
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  605  
311bf0f18cd68f arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei, Wang   2021-03-19  606  				kcs4: kcs@114 {
fa4c8ec6feaa32 arch/arm/boot/dts/aspeed-g6.dtsi        Andrew Jeffery   2020-04-11  607  					compatible = "aspeed,ast2500-kcs-bmc-v2";
311bf0f18cd68f arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei, Wang   2021-03-19  608  					reg = <0x114 0x1>, <0x118 0x1>, <0x11c 0x1>;
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  609  					interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
45cd8bbaaa18ab arch/arm/boot/dts/aspeed-g6.dtsi        Jae Hyun Yoo     2021-11-08  610  					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  611  					status = "disabled";
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  612  				};
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  613  
311bf0f18cd68f arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei, Wang   2021-03-19 @614  				lpc_ctrl: lpc-ctrl@80 {
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  615  					compatible = "aspeed,ast2600-lpc-ctrl";
311bf0f18cd68f arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei, Wang   2021-03-19  616  					reg = <0x80 0x80>;
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  617  					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  618  					status = "disabled";
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  619  				};
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  620  
311bf0f18cd68f arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei, Wang   2021-03-19  621  				lpc_snoop: lpc-snoop@80 {
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  622  					compatible = "aspeed,ast2600-lpc-snoop";
311bf0f18cd68f arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei, Wang   2021-03-19  623  					reg = <0x80 0x80>;
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  624  					interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
d050d049f8b807 arch/arm/boot/dts/aspeed-g6.dtsi        John Wang        2020-12-02  625  					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  626  					status = "disabled";
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  627  				};
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  628  
311bf0f18cd68f arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei, Wang   2021-03-19  629  				lhc: lhc@a0 {
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  630  					compatible = "aspeed,ast2600-lhc";
311bf0f18cd68f arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei, Wang   2021-03-19  631  					reg = <0xa0 0x24 0xc8 0x8>;
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  632  				};
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  633  
311bf0f18cd68f arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei, Wang   2021-03-19  634  				lpc_reset: reset-controller@98 {
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  635  					compatible = "aspeed,ast2600-lpc-reset";
311bf0f18cd68f arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei, Wang   2021-03-19  636  					reg = <0x98 0x4>;
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  637  					#reset-cells = <1>;
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  638  				};
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  639  
f9241fe8b9652e arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei Wang    2021-09-27  640  				uart_routing: uart-routing@98 {
f9241fe8b9652e arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei Wang    2021-09-27  641  					compatible = "aspeed,ast2600-uart-routing";
f9241fe8b9652e arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei Wang    2021-09-27  642  					reg = <0x98 0x8>;
f9241fe8b9652e arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei Wang    2021-09-27  643  					status = "disabled";
f9241fe8b9652e arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei Wang    2021-09-27  644  				};
f9241fe8b9652e arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei Wang    2021-09-27  645  
311bf0f18cd68f arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei, Wang   2021-03-19  646  				ibt: ibt@140 {
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  647  					compatible = "aspeed,ast2600-ibt-bmc";
311bf0f18cd68f arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei, Wang   2021-03-19  648  					reg = <0x140 0x18>;
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  649  					interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
a350dc623e3678 arch/arm/boot/dts/aspeed-g6.dtsi        Jae Hyun Yoo     2021-11-08  650  					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  651  					status = "disabled";
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  652  				};
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  653  			};
12ce8bd361c728 arch/arm/boot/dts/aspeed-g6.dtsi        Brad Bishop      2019-09-25  654  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  655  			sdc: sdc@1e740000 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  656  				compatible = "aspeed,ast2600-sd-controller";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  657  				reg = <0x1e740000 0x100>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  658  				#address-cells = <1>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  659  				#size-cells = <1>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  660  				ranges = <0 0x1e740000 0x10000>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  661  				clocks = <&syscon ASPEED_CLK_GATE_SDCLK>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  662  				status = "disabled";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  663  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  664  				sdhci0: sdhci@1e740100 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  665  					compatible = "aspeed,ast2600-sdhci", "sdhci";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  666  					reg = <0x100 0x100>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  667  					interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  668  					sdhci,auto-cmd12;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  669  					clocks = <&syscon ASPEED_CLK_SDIO>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  670  					status = "disabled";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  671  				};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  672  
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  673  				sdhci1: sdhci@1e740200 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  674  					compatible = "aspeed,ast2600-sdhci", "sdhci";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  675  					reg = <0x200 0x100>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  676  					interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  677  					sdhci,auto-cmd12;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  678  					clocks = <&syscon ASPEED_CLK_SDIO>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  679  					status = "disabled";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  680  				};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  681  			};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  682  
311b57f051eac4 arch/arm/boot/dts/aspeed-g6.dtsi        Andrew Jeffery   2019-08-27  683  			emmc_controller: sdc@1e750000 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  684  				compatible = "aspeed,ast2600-sd-controller";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  685  				reg = <0x1e750000 0x100>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  686  				#address-cells = <1>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  687  				#size-cells = <1>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  688  				ranges = <0 0x1e750000 0x10000>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  689  				clocks = <&syscon ASPEED_CLK_GATE_EMMCCLK>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  690  				status = "disabled";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  691  
311b57f051eac4 arch/arm/boot/dts/aspeed-g6.dtsi        Andrew Jeffery   2019-08-27  692  				emmc: sdhci@1e750100 {
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  693  					compatible = "aspeed,ast2600-sdhci";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  694  					reg = <0x100 0x100>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  695  					sdhci,auto-cmd12;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  696  					interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  697  					clocks = <&syscon ASPEED_CLK_EMMC>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  698  					pinctrl-names = "default";
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  699  					pinctrl-0 = <&pinctrl_emmc_default>;
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  700  				};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  701  			};
9ee6d17b18804f arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-15  702  
2aed40eeb446ed arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-02  703  			vuart1: serial@1e787000 {
2aed40eeb446ed arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-02  704  				compatible = "aspeed,ast2500-vuart";
2aed40eeb446ed arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-02  705  				reg = <0x1e787000 0x40>;
2aed40eeb446ed arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-02  706  				reg-shift = <2>;
2aed40eeb446ed arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-02  707  				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
2aed40eeb446ed arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-02  708  				clocks = <&syscon ASPEED_CLK_APB1>;
2aed40eeb446ed arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-02  709  				no-loopback-test;
2aed40eeb446ed arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-02  710  				status = "disabled";
2aed40eeb446ed arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-02  711  			};
2aed40eeb446ed arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-02  712  
dda28c0952a976 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Joel Stanley     2023-06-20  713  			vuart3: serial@1e787800 {
dda28c0952a976 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Joel Stanley     2023-06-20  714  				compatible = "aspeed,ast2500-vuart";
dda28c0952a976 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Joel Stanley     2023-06-20  715  				reg = <0x1e787800 0x40>;
dda28c0952a976 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Joel Stanley     2023-06-20  716  				reg-shift = <2>;
dda28c0952a976 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Joel Stanley     2023-06-20  717  				interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
dda28c0952a976 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Joel Stanley     2023-06-20  718  				clocks = <&syscon ASPEED_CLK_APB2>;
dda28c0952a976 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Joel Stanley     2023-06-20  719  				no-loopback-test;
dda28c0952a976 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Joel Stanley     2023-06-20  720  				status = "disabled";
dda28c0952a976 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Joel Stanley     2023-06-20  721  			};
dda28c0952a976 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Joel Stanley     2023-06-20  722  
2aed40eeb446ed arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-02  723  			vuart2: serial@1e788000 {
2aed40eeb446ed arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-02  724  				compatible = "aspeed,ast2500-vuart";
2aed40eeb446ed arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-02  725  				reg = <0x1e788000 0x40>;
2aed40eeb446ed arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-02  726  				reg-shift = <2>;
2aed40eeb446ed arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-02  727  				interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
2aed40eeb446ed arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-02  728  				clocks = <&syscon ASPEED_CLK_APB1>;
2aed40eeb446ed arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-02  729  				no-loopback-test;
2aed40eeb446ed arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-02  730  				status = "disabled";
2aed40eeb446ed arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-02  731  			};
2aed40eeb446ed arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-02  732  
dda28c0952a976 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Joel Stanley     2023-06-20  733  			vuart4: serial@1e788800 {
dda28c0952a976 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Joel Stanley     2023-06-20  734  				compatible = "aspeed,ast2500-vuart";
dda28c0952a976 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Joel Stanley     2023-06-20  735  				reg = <0x1e788800 0x40>;
dda28c0952a976 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Joel Stanley     2023-06-20  736  				reg-shift = <2>;
dda28c0952a976 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Joel Stanley     2023-06-20  737  				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
dda28c0952a976 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Joel Stanley     2023-06-20  738  				clocks = <&syscon ASPEED_CLK_APB2>;
dda28c0952a976 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Joel Stanley     2023-06-20  739  				no-loopback-test;
dda28c0952a976 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Joel Stanley     2023-06-20  740  				status = "disabled";
dda28c0952a976 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Joel Stanley     2023-06-20  741  			};
dda28c0952a976 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Joel Stanley     2023-06-20  742  
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  743  			uart2: serial@1e78d000 {
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  744  				compatible = "ns16550a";
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  745  				reg = <0x1e78d000 0x20>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  746  				reg-shift = <2>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  747  				reg-io-width = <4>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  748  				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  749  				clocks = <&syscon ASPEED_CLK_GATE_UART2CLK>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  750  				resets = <&lpc_reset 5>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  751  				no-loopback-test;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  752  				pinctrl-names = "default";
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  753  				pinctrl-0 = <&pinctrl_txd2_default &pinctrl_rxd2_default>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  754  				status = "disabled";
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  755  			};
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  756  
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  757  			uart3: serial@1e78e000 {
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  758  				compatible = "ns16550a";
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  759  				reg = <0x1e78e000 0x20>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  760  				reg-shift = <2>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  761  				reg-io-width = <4>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  762  				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  763  				clocks = <&syscon ASPEED_CLK_GATE_UART3CLK>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  764  				resets = <&lpc_reset 6>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  765  				no-loopback-test;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  766  				pinctrl-names = "default";
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  767  				pinctrl-0 = <&pinctrl_txd3_default &pinctrl_rxd3_default>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  768  				status = "disabled";
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  769  			};
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  770  
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  771  			uart4: serial@1e78f000 {
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  772  				compatible = "ns16550a";
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  773  				reg = <0x1e78f000 0x20>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  774  				reg-shift = <2>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  775  				reg-io-width = <4>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  776  				interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  777  				clocks = <&syscon ASPEED_CLK_GATE_UART4CLK>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  778  				resets = <&lpc_reset 7>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  779  				no-loopback-test;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  780  				pinctrl-names = "default";
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  781  				pinctrl-0 = <&pinctrl_txd4_default &pinctrl_rxd4_default>;
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  782  				status = "disabled";
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  783  			};
c0d3e181d78223 arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-10-16  784  
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  785  			uart6: serial@1e790000 {
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  786  				compatible = "ns16550a";
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  787  				reg = <0x1e790000 0x20>;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  788  				reg-shift = <2>;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  789  				reg-io-width = <4>;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  790  				interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  791  				clocks = <&syscon ASPEED_CLK_GATE_UART6CLK>;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  792  				no-loopback-test;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  793  				pinctrl-names = "default";
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  794  				pinctrl-0 = <&pinctrl_uart6_default>;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  795  
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  796  				status = "disabled";
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  797  			};
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  798  
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  799  			uart7: serial@1e790100 {
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  800  				compatible = "ns16550a";
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  801  				reg = <0x1e790100 0x20>;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  802  				reg-shift = <2>;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  803  				reg-io-width = <4>;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  804  				interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  805  				clocks = <&syscon ASPEED_CLK_GATE_UART7CLK>;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  806  				no-loopback-test;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  807  				pinctrl-names = "default";
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  808  				pinctrl-0 = <&pinctrl_uart7_default>;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  809  
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  810  				status = "disabled";
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  811  			};
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  812  
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  813  			uart8: serial@1e790200 {
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  814  				compatible = "ns16550a";
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  815  				reg = <0x1e790200 0x20>;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  816  				reg-shift = <2>;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  817  				reg-io-width = <4>;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  818  				interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  819  				clocks = <&syscon ASPEED_CLK_GATE_UART8CLK>;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  820  				no-loopback-test;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  821  				pinctrl-names = "default";
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  822  				pinctrl-0 = <&pinctrl_uart8_default>;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  823  
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  824  				status = "disabled";
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  825  			};
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  826  
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  827  			uart9: serial@1e790300 {
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  828  				compatible = "ns16550a";
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  829  				reg = <0x1e790300 0x20>;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  830  				reg-shift = <2>;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  831  				reg-io-width = <4>;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  832  				interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  833  				clocks = <&syscon ASPEED_CLK_GATE_UART9CLK>;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  834  				no-loopback-test;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  835  				pinctrl-names = "default";
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  836  				pinctrl-0 = <&pinctrl_uart9_default>;
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  837  
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  838  				status = "disabled";
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  839  			};
e360b84c3366d0 arch/arm/boot/dts/aspeed-g6.dtsi        Ken Chen         2022-08-05  840  
9ee6d17b18804f arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-15  841  			i2c: bus@1e78a000 {
9ee6d17b18804f arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-15  842  				compatible = "simple-bus";
9ee6d17b18804f arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-15  843  				#address-cells = <1>;
9ee6d17b18804f arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-15  844  				#size-cells = <1>;
9ee6d17b18804f arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-15  845  				ranges = <0 0x1e78a000 0x1000>;
9ee6d17b18804f arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-15  846  			};
9ee6d17b18804f arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-15  847  
413200017b8e5a arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-12-24  848  			fsim0: fsi@1e79b000 {
dba3e7743e8987 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Eddie James      2024-02-15  849  				#interrupt-cells = <1>;
413200017b8e5a arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-12-24  850  				compatible = "aspeed,ast2600-fsi-master", "fsi-master";
413200017b8e5a arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-12-24  851  				reg = <0x1e79b000 0x94>;
413200017b8e5a arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-12-24  852  				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
413200017b8e5a arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-12-24  853  				pinctrl-names = "default";
413200017b8e5a arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-12-24  854  				pinctrl-0 = <&pinctrl_fsi1_default>;
413200017b8e5a arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-12-24  855  				clocks = <&syscon ASPEED_CLK_GATE_FSICLK>;
dba3e7743e8987 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Eddie James      2024-02-15  856  				interrupt-controller;
413200017b8e5a arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-12-24  857  				status = "disabled";
413200017b8e5a arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-12-24  858  			};
413200017b8e5a arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-12-24  859  
413200017b8e5a arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-12-24  860  			fsim1: fsi@1e79b100 {
dba3e7743e8987 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Eddie James      2024-02-15  861  				#interrupt-cells = <1>;
413200017b8e5a arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-12-24  862  				compatible = "aspeed,ast2600-fsi-master", "fsi-master";
413200017b8e5a arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-12-24  863  				reg = <0x1e79b100 0x94>;
413200017b8e5a arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-12-24  864  				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
413200017b8e5a arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-12-24  865  				pinctrl-names = "default";
413200017b8e5a arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-12-24  866  				pinctrl-0 = <&pinctrl_fsi2_default>;
413200017b8e5a arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-12-24  867  				clocks = <&syscon ASPEED_CLK_GATE_FSICLK>;
dba3e7743e8987 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi Eddie James      2024-02-15  868  				interrupt-controller;
413200017b8e5a arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-12-24  869  				status = "disabled";
413200017b8e5a arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-12-24  870  			};
7d4f0b0df7c5ec arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei Wang    2023-03-20  871  
7d4f0b0df7c5ec arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei Wang    2023-03-20  872  			udma: dma-controller@1e79e000 {
7d4f0b0df7c5ec arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei Wang    2023-03-20  873  				compatible = "aspeed,ast2600-udma";
7d4f0b0df7c5ec arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei Wang    2023-03-20  874  				reg = <0x1e79e000 0x1000>;
7d4f0b0df7c5ec arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei Wang    2023-03-20  875  				interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
7d4f0b0df7c5ec arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei Wang    2023-03-20  876  				dma-channels = <28>;
7d4f0b0df7c5ec arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei Wang    2023-03-20  877  				#dma-cells = <1>;
7d4f0b0df7c5ec arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei Wang    2023-03-20  878  				status = "disabled";
7d4f0b0df7c5ec arch/arm/boot/dts/aspeed-g6.dtsi        Chia-Wei Wang    2023-03-20  879  			};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  880  		};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  881  	};
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  882  };
2ca5646b5c2fdb arch/arm/boot/dts/aspeed-g6.dtsi        Joel Stanley     2019-09-11  883  

:::::: The code at line 614 was first introduced by commit
:::::: 311bf0f18cd68f55a8ffd30089ccb74a2318b86d ARM: dts: Remove LPC BMC and Host partitions

:::::: TO: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
:::::: CC: Joel Stanley <joel@jms.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
