Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BE7157E9F
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Oct 2024 09:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728379431; cv=none; b=MVPyxs+lbJ8WLdKxbaJyqE6oNwGeXA1+ohP1ILPprP/2SLGRER628kPuGl4LEOfafs1X5VaHNqU6kOnXDsxHmGAHpaRjTAojo4MLaiNskGdHDaD4RRUX3VYQONVl6e2zHD/UaabS0/zc4F43ckAR4R5Qq48DJlH6NwgL40DxXUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728379431; c=relaxed/simple;
	bh=ZTrfxjpBtEsBHBym/Gg5xxvdfXGRbHUe9PyO3WGhWzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SHGvGUPZ8/2XQ3T1I5Ool0sWkpqhiYlcSHPQOWY99no4pzaxvVwkGZFn1iicMzyHWwzI9CCsqeeyFSD+V7/uMF2jWBxAwvlT5qhjDi5dxnDbdZYf/swM6VI1SNcpwdovOv/lEwpps8n9/GCw41x8KmiNY76v/DoJIoyl6je+MOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dyGIky/H; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dyGIky/H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728379429; x=1759915429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZTrfxjpBtEsBHBym/Gg5xxvdfXGRbHUe9PyO3WGhWzQ=;
  b=dyGIky/HLzflsXYHUKn3y3clTIeisUG2kaAGeMQt7/45FOFJfzQ+zTDo
   MyY1z9LAP5bI6W2sRTVbEE/MgmlUwnxjK7/oPsV91wKI7sDzN3oGpmGZA
   8i8l15uc7YbE2TooptrvTft1lLKXvfuYitHZyp1NjL2sjpSRRa9Opat36
   /jmXp3l3gl0DH27mD/DF5FXiTQhkF0qwUeSuyubN99W1tLy+TVWlz1YT/
   apUotqGkooJFgRJTzQcvq9p8D7hEz+rAks7lN7TthHgePcXf8mh8NZoqn
   u4mj2xDhokw3/nAhKyjCm++vNYe3gNeUtW+TEGlMz5pytG/w7VzkwI8Wr
   w==;
X-CSE-ConnectionGUID: BwUUadJhQBCTCn9amfzxyw==
X-CSE-MsgGUID: GJpd4QgnR8KfyQb3mN8HAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="31345332"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="31345332"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 02:23:49 -0700
X-CSE-ConnectionGUID: Po5DNlTCTY6LsnXsVB1qbw==
X-CSE-MsgGUID: OAO3uEEoQ7qYLpKUToihyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="80758760"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Oct 2024 02:23:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy6RV-0006BS-0t;
	Tue, 08 Oct 2024 09:23:45 +0000
Date: Tue, 8 Oct 2024 17:23:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/8] ARM: dts: socfpga: fix dtschema issues
Message-ID: <202410081724.bHrzMAnC-lkp@intel.com>
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
In-Reply-To: <20241007133115.1482619-2-l.rubusch@gmail.com>
References: <20241007133115.1482619-2-l.rubusch@gmail.com>
TO: Lothar Rubusch <l.rubusch@gmail.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: dinguyen@kernel.org
TO: marex@denx.de
TO: s.trumtrar@pengutronix.de
CC: l.rubusch@gmail.com
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Lothar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.12-rc2 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lothar-Rubusch/ARM-dts-socfpga-fix-dtschema-issues/20241007-213514
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241007133115.1482619-2-l.rubusch%40gmail.com
patch subject: [PATCH 1/8] ARM: dts: socfpga: fix dtschema issues
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm-randconfig-001-20241008 (https://download.01.org/0day-ci/archive/20241008/202410081724.bHrzMAnC-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410081724.bHrzMAnC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410081724.bHrzMAnC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:90.15-96.5: Warning (simple_bus_reg): /soc/fpga-region: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:563.40-567.5: Warning (simple_bus_reg): /soc/stmmac-axi-config: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:714.18-732.5: Warning (simple_bus_reg): /soc/eccmgr: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:823.13-827.5: Warning (simple_bus_reg): /soc/sdramedac: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:934.19-938.5: Warning (simple_bus_reg): /soc/usbphy: missing or empty reg/ranges property
--
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi:83.15-89.5: Warning (simple_bus_reg): /soc/fpga-region: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi:422.40-426.5: Warning (simple_bus_reg): /soc/stmmac-axi-config: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi:693.18-766.5: Warning (simple_bus_reg): /soc/eccmgr: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi:872.19-876.5: Warning (simple_bus_reg): /soc/usbphy: missing or empty reg/ranges property
--
>> arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:90.15-96.5: Warning (simple_bus_reg): /soc/fpga-region: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:563.40-567.5: Warning (simple_bus_reg): /soc/stmmac-axi-config: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:714.18-732.5: Warning (simple_bus_reg): /soc/eccmgr: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:823.13-827.5: Warning (simple_bus_reg): /soc/sdramedac: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:934.19-938.5: Warning (simple_bus_reg): /soc/usbphy: missing or empty reg/ranges property
--
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi:83.15-89.5: Warning (simple_bus_reg): /soc/fpga-region: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi:422.40-426.5: Warning (simple_bus_reg): /soc/stmmac-axi-config: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi:693.18-766.5: Warning (simple_bus_reg): /soc/eccmgr: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi:872.19-876.5: Warning (simple_bus_reg): /soc/usbphy: missing or empty reg/ranges property
--
>> arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:90.15-96.5: Warning (simple_bus_reg): /soc/fpga-region: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:563.40-567.5: Warning (simple_bus_reg): /soc/stmmac-axi-config: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:714.18-732.5: Warning (simple_bus_reg): /soc/eccmgr: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:823.13-827.5: Warning (simple_bus_reg): /soc/sdramedac: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:934.19-938.5: Warning (simple_bus_reg): /soc/usbphy: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dts:51.22-72.4: Warning (avoid_unnecessary_addr_size): /soc/i2c@ffc04000/stmpe811@41: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +90 arch/arm/boot/dts/intel/socfpga/socfpga.dtsi

66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18   7  
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18   8  / {
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18   9  	#address-cells = <1>;
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  10  	#size-cells = <1>;
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  11  
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  12  	aliases {
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  13  		serial0 = &uart0;
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  14  		serial1 = &uart1;
c2ad284412e495 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2013-02-11  15  		timer0 = &timer0;
c2ad284412e495 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2013-02-11  16  		timer1 = &timer1;
c2ad284412e495 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2013-02-11  17  		timer2 = &timer2;
c2ad284412e495 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2013-02-11  18  		timer3 = &timer3;
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  19  	};
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  20  
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  21  	cpus {
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  22  		#address-cells = <1>;
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  23  		#size-cells = <0>;
ebbce1bbc4f25c arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2015-05-22  24  		enable-method = "altr,socfpga-smp";
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  25  
e3e6dba1af55cf arch/arm/boot/dts/socfpga.dtsi               Florian Vaussard    2017-03-06  26  		cpu0: cpu@0 {
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  27  			compatible = "arm,cortex-a9";
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  28  			device_type = "cpu";
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  29  			reg = <0>;
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  30  			next-level-cache = <&L2>;
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  31  		};
e3e6dba1af55cf arch/arm/boot/dts/socfpga.dtsi               Florian Vaussard    2017-03-06  32  		cpu1: cpu@1 {
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  33  			compatible = "arm,cortex-a9";
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  34  			device_type = "cpu";
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  35  			reg = <1>;
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  36  			next-level-cache = <&L2>;
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  37  		};
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  38  	};
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  39  
34869353774bc6 arch/arm/boot/dts/socfpga.dtsi               Florian Vaussard    2017-03-06  40  	pmu: pmu@ff111000 {
34869353774bc6 arch/arm/boot/dts/socfpga.dtsi               Florian Vaussard    2017-03-06  41  		compatible = "arm,cortex-a9-pmu";
34869353774bc6 arch/arm/boot/dts/socfpga.dtsi               Florian Vaussard    2017-03-06  42  		interrupt-parent = <&intc>;
34869353774bc6 arch/arm/boot/dts/socfpga.dtsi               Florian Vaussard    2017-03-06  43  		interrupts = <0 176 4>, <0 177 4>;
34869353774bc6 arch/arm/boot/dts/socfpga.dtsi               Florian Vaussard    2017-03-06  44  		interrupt-affinity = <&cpu0>, <&cpu1>;
34869353774bc6 arch/arm/boot/dts/socfpga.dtsi               Florian Vaussard    2017-03-06  45  		reg = <0xff111000 0x1000>,
34869353774bc6 arch/arm/boot/dts/socfpga.dtsi               Florian Vaussard    2017-03-06  46  		      <0xff113000 0x1000>;
34869353774bc6 arch/arm/boot/dts/socfpga.dtsi               Florian Vaussard    2017-03-06  47  	};
34869353774bc6 arch/arm/boot/dts/socfpga.dtsi               Florian Vaussard    2017-03-06  48  
c9bdd50d2019f7 arch/arm/boot/dts/socfpga.dtsi               Krzysztof Kozlowski 2022-04-07  49  	intc: interrupt-controller@fffed000 {
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  50  		compatible = "arm,cortex-a9-gic";
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  51  		#interrupt-cells = <3>;
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  52  		interrupt-controller;
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  53  		reg = <0xfffed000 0x1000>,
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  54  		      <0xfffec100 0x100>;
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  55  	};
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  56  
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  57  	soc {
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  58  		#address-cells = <1>;
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  59  		#size-cells = <1>;
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  60  		compatible = "simple-bus";
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  61  		device_type = "soc";
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  62  		interrupt-parent = <&intc>;
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  63  		ranges;
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  64  
13d9169e228ba8 arch/arm/boot/dts/intel/socfpga/socfpga.dtsi Lothar Rubusch      2024-10-07  65  		bus {
2ef7d5f342c12c arch/arm/boot/dts/socfpga.dtsi               Masahiro Yamada     2016-03-09  66  			compatible = "simple-bus";
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  67  			#address-cells = <1>;
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  68  			#size-cells = <1>;
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  69  			ranges;
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  70  
13d9169e228ba8 arch/arm/boot/dts/intel/socfpga/socfpga.dtsi Lothar Rubusch      2024-10-07  71  			pdma: dma-controller@ffe01000 {
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  72  				compatible = "arm,pl330", "arm,primecell";
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  73  				reg = <0xffe01000 0x1000>;
18d561990a8c5b arch/arm/boot/dts/socfpga.dtsi               Steffen Trumtrar    2014-04-02  74  				interrupts = <0 104 4>,
18d561990a8c5b arch/arm/boot/dts/socfpga.dtsi               Steffen Trumtrar    2014-04-02  75  					     <0 105 4>,
18d561990a8c5b arch/arm/boot/dts/socfpga.dtsi               Steffen Trumtrar    2014-04-02  76  					     <0 106 4>,
18d561990a8c5b arch/arm/boot/dts/socfpga.dtsi               Steffen Trumtrar    2014-04-02  77  					     <0 107 4>,
18d561990a8c5b arch/arm/boot/dts/socfpga.dtsi               Steffen Trumtrar    2014-04-02  78  					     <0 108 4>,
18d561990a8c5b arch/arm/boot/dts/socfpga.dtsi               Steffen Trumtrar    2014-04-02  79  					     <0 109 4>,
18d561990a8c5b arch/arm/boot/dts/socfpga.dtsi               Steffen Trumtrar    2014-04-02  80  					     <0 110 4>,
18d561990a8c5b arch/arm/boot/dts/socfpga.dtsi               Steffen Trumtrar    2014-04-02  81  					     <0 111 4>;
0d8abbfd96e6eb arch/arm/boot/dts/socfpga.dtsi               Padmavathi Venna    2013-03-04  82  				#dma-cells = <1>;
672ef909e9b109 arch/arm/boot/dts/socfpga.dtsi               Steffen Trumtrar    2014-01-08  83  				clocks = <&l4_main_clk>;
672ef909e9b109 arch/arm/boot/dts/socfpga.dtsi               Steffen Trumtrar    2014-01-08  84  				clock-names = "apb_pclk";
1c909b2dfe6a21 arch/arm/boot/dts/socfpga.dtsi               Simon Goldschmidt   2019-01-29  85  				resets = <&rst DMA_RESET>;
d8c1ccac448fd2 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2019-07-30  86  				reset-names = "dma";
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  87  			};
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  88  		};
66314223aa5e86 arch/arm/boot/dts/socfpga.dtsi               Dinh Nguyen         2012-07-18  89  
13d9169e228ba8 arch/arm/boot/dts/intel/socfpga/socfpga.dtsi Lothar Rubusch      2024-10-07 @90  		fpga-region {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
