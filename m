Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2145517F6
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Jun 2024 05:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998403; cv=none; b=XU4TAiEc+V3acRd0DfwrpkxKNhrnrjdb56pV16XofpLAmdVmP3nqobcrbPUR8LFKdMV2N5whvCoITzKr/HmYL/khheRUslUheIZybd6P0j7zEFuU2mAxQZ7qKKLzcHKIYw3NeRMLBWCQisfeM+13elvjpMvTKb3Zv1bKHiNa8gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998403; c=relaxed/simple;
	bh=1iIk+TLlBkLMNZgFYR/AtH3ZgHH1PLxYLCMmQ4M2VQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GG0LhbV+fzl5dqTLYNNIUPpVyj2hnWUnOMCliVE5CCmBPxP6CoLeSnPvuaErzixpw79t0XftJmdoe3h8cq2xjtdn7sjvkzUk71bILrMbbGtSkDz96728MbhOuYOVSVOHkoGwgOCb+Ce3uzqeNGggMNyKJGOtglu8eHKfJuAss8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jiFotoSe; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jiFotoSe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717998401; x=1749534401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1iIk+TLlBkLMNZgFYR/AtH3ZgHH1PLxYLCMmQ4M2VQo=;
  b=jiFotoSeIx8tqV1ijsw06KXtDwGk4ZTb2ugTZMP6c8SwIIfA360bxiqy
   VNx2hyqo+2gS9yOHhEtMHqaMJjiuxqOTO3F75u04yTcDnEEMdbOU+k39s
   k9clZYdJWlD9q1w60QO2RJbX8d7ocDcG41z+aRgKZAXVuH0xt83MKxMJw
   NVxW17Vav0J/RdjDOZTd8d+QOe0kt4LScw6UZqyZjHZzTjG0tsh9pKcpV
   rEs47MAzYCPHGL6wMZvYnkgQm7ZYNshBs9qocL1xEfJ0Yz7tkV/bA+L5A
   bFP4ZWNEsGdLInRO0L94pjr5cJBooHVo5+DE+FboJvc4TiOTnNajDsqi5
   g==;
X-CSE-ConnectionGUID: eqhNAdw+S8uFIO2E2fef4Q==
X-CSE-MsgGUID: gxDD0XyXTDCTYkkskWBknQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14795841"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="14795841"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 22:46:41 -0700
X-CSE-ConnectionGUID: sjMHGuv1Qm2CmZKc7Nyn5g==
X-CSE-MsgGUID: kPnbLSQsSRqANyeHTQKrFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="38879923"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Jun 2024 22:46:40 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGXrZ-0001sz-1D;
	Mon, 10 Jun 2024 05:46:37 +0000
Date: Mon, 10 Jun 2024 13:46:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arc/boot/dts/axc003.dtsi:85.16-90.5: Warning
 (interrupt_provider): /cpu_card/pct: '#interrupt-cells' found, but node is
 not an interrupt provider
Message-ID: <202406101359.E0zuYgP7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only scripts/Makefile.* file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Rob Herring <robh@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   83a7eefedc9b56fe7bfeff13b6c7356688ffa670
commit: a8528f7f31abf792f188d3f397b15aae7ed8564c dtc: Enable dtc interrupt_provider check
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20240610/202406101359.E0zuYgP7-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406101359.E0zuYgP7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406101359.E0zuYgP7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/axc003.dtsi:17.11-91.4: Warning (unit_address_vs_reg): /cpu_card: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/axc003.dtsi:45.29-49.5: Warning (unit_address_vs_reg): /cpu_card/archs-intc@cpu: node has a unit name, but no reg or ranges property
   arch/arc/boot/dts/axc003.dtsi:101.12-117.4: Warning (unit_address_vs_reg): /axs10x_mb: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/axc003.dtsi:24.24-28.5: Warning (simple_bus_reg): /cpu_card/input-clk: missing or empty reg/ranges property
   arch/arc/boot/dts/axc003.dtsi:45.29-49.5: Warning (simple_bus_reg): /cpu_card/archs-intc@cpu: missing or empty reg/ranges property
   arch/arc/boot/dts/axc003.dtsi:85.16-90.5: Warning (simple_bus_reg): /cpu_card/pct: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:33.10-64.5: Warning (simple_bus_reg): /axs10x_mb/clocks: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:233.20-241.5: Warning (simple_bus_reg): /axs10x_mb/connector: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:318.18-328.5: Warning (simple_bus_reg): /axs10x_mb/sound_playback: missing or empty reg/ranges property
>> arch/arc/boot/dts/axc003.dtsi:85.16-90.5: Warning (interrupt_provider): /cpu_card/pct: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arc/boot/dts/axc003.dtsi:102.18-104.5: Warning (interrupt_provider): /axs10x_mb/ethernet@18000: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arc/boot/dts/axs103.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
   arch/arc/boot/dts/axc003_idu.dtsi:45.29-49.5: Warning (unit_address_vs_reg): /cpu_card/archs-intc@cpu: node has a unit name, but no reg or ranges property
   arch/arc/boot/dts/axc003_idu.dtsi:108.12-124.4: Warning (unit_address_vs_reg): /axs10x_mb: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/axc003_idu.dtsi:24.24-28.5: Warning (simple_bus_reg): /cpu_card/input-clk: missing or empty reg/ranges property
   arch/arc/boot/dts/axc003_idu.dtsi:45.29-49.5: Warning (simple_bus_reg): /cpu_card/archs-intc@cpu: missing or empty reg/ranges property
   arch/arc/boot/dts/axc003_idu.dtsi:51.38-56.5: Warning (simple_bus_reg): /cpu_card/idu-interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/axc003_idu.dtsi:92.16-97.5: Warning (simple_bus_reg): /cpu_card/pct: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:33.10-64.5: Warning (simple_bus_reg): /axs10x_mb/clocks: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:233.20-241.5: Warning (simple_bus_reg): /axs10x_mb/connector: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:318.18-328.5: Warning (simple_bus_reg): /axs10x_mb/sound_playback: missing or empty reg/ranges property
>> arch/arc/boot/dts/axc003_idu.dtsi:92.16-97.5: Warning (interrupt_provider): /cpu_card/pct: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arc/boot/dts/axc003_idu.dtsi:109.18-111.5: Warning (interrupt_provider): /axs10x_mb/ethernet@18000: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arc/boot/dts/axs103_idu.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
   arch/arc/boot/dts/skeleton_hs.dtsi:45.9-48.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/haps_hs.dts:31.7-98.4: Warning (unit_address_vs_reg): /fpga: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/haps_hs.dts:40.22-44.5: Warning (simple_bus_reg): /fpga/core_clk: missing or empty reg/ranges property
   arch/arc/boot/dts/haps_hs.dts:46.35-50.5: Warning (simple_bus_reg): /fpga/interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/haps_hs.dts:63.16-67.5: Warning (simple_bus_reg): /fpga/pct: missing or empty reg/ranges property
>> arch/arc/boot/dts/haps_hs.dts:63.16-67.5: Warning (interrupt_provider): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arc/boot/dts/haps_hs.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
   arch/arc/boot/dts/skeleton_hs.dtsi:45.9-48.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/nsimosci_hs.dts:35.22-39.5: Warning (simple_bus_reg): /fpga/core_clk: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs.dts:41.40-45.5: Warning (simple_bus_reg): /fpga/core-interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs.dts:58.18-62.5: Warning (simple_bus_reg): /fpga/pguclk: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs.dts:71.21-76.5: Warning (simple_bus_reg): /fpga/ps2@f9001000: simple-bus unit address format error, expected "f9000400"
   arch/arc/boot/dts/nsimosci_hs.dts:84.16-88.5: Warning (simple_bus_reg): /fpga/pct: missing or empty reg/ranges property
>> arch/arc/boot/dts/nsimosci_hs.dts:84.16-88.5: Warning (interrupt_provider): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arc/boot/dts/nsimosci_hs.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
   arch/arc/boot/dts/skeleton_hs_idu.dtsi:57.9-60.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/nsimosci_hs_idu.dts:33.22-37.5: Warning (simple_bus_reg): /fpga/core_clk: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs_idu.dts:39.40-43.5: Warning (simple_bus_reg): /fpga/core-interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs_idu.dts:45.38-50.5: Warning (simple_bus_reg): /fpga/idu-interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs_idu.dts:64.18-68.5: Warning (simple_bus_reg): /fpga/pguclk: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs_idu.dts:77.21-83.5: Warning (simple_bus_reg): /fpga/ps2@f9001000: simple-bus unit address format error, expected "f9000400"
   arch/arc/boot/dts/nsimosci_hs_idu.dts:92.16-96.5: Warning (simple_bus_reg): /fpga/pct: missing or empty reg/ranges property
>> arch/arc/boot/dts/nsimosci_hs_idu.dts:92.16-96.5: Warning (interrupt_provider): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
   arch/arc/boot/dts/skeleton_hs.dtsi:45.9-48.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/vdk_axc003.dtsi:17.11-47.4: Warning (unit_address_vs_reg): /cpu_card: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/vdk_axc003.dtsi:30.29-34.5: Warning (unit_address_vs_reg): /cpu_card/archs-intc@cpu: node has a unit name, but no reg or ranges property
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:9.16-111.4: Warning (unit_address_vs_reg): /axs10x_mb_vdk: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/vdk_axc003.dtsi:24.22-28.5: Warning (simple_bus_reg): /cpu_card/core_clk: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axc003.dtsi:30.29-34.5: Warning (simple_bus_reg): /cpu_card/archs-intc@cpu: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:16.10-34.5: Warning (simple_bus_reg): /axs10x_mb_vdk/clocks: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:94.21-99.5: Warning (simple_bus_reg): /axs10x_mb_vdk/ps2@e0017400: simple-bus unit address format error, expected "17400"
>> arch/arc/boot/dts/vdk_axs10x_mb.dtsi:36.18-47.5: Warning (interrupt_provider): /axs10x_mb_vdk/ethernet@18000: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arc/boot/dts/vdk_hs38.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
   arch/arc/boot/dts/skeleton_hs_idu.dtsi:57.9-60.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/vdk_axc003_idu.dtsi:18.11-55.4: Warning (unit_address_vs_reg): /cpu_card: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/vdk_axc003_idu.dtsi:31.29-35.5: Warning (unit_address_vs_reg): /cpu_card/archs-intc@cpu: node has a unit name, but no reg or ranges property
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:9.16-111.4: Warning (unit_address_vs_reg): /axs10x_mb_vdk: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/vdk_axc003_idu.dtsi:25.22-29.5: Warning (simple_bus_reg): /cpu_card/core_clk: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axc003_idu.dtsi:31.29-35.5: Warning (simple_bus_reg): /cpu_card/archs-intc@cpu: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axc003_idu.dtsi:37.38-42.5: Warning (simple_bus_reg): /cpu_card/idu-interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:16.10-34.5: Warning (simple_bus_reg): /axs10x_mb_vdk/clocks: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:94.21-99.5: Warning (simple_bus_reg): /axs10x_mb_vdk/ps2@e0017400: simple-bus unit address format error, expected "17400"
>> arch/arc/boot/dts/vdk_axs10x_mb.dtsi:36.18-47.5: Warning (interrupt_provider): /axs10x_mb_vdk/ethernet@18000: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

vim +85 arch/arc/boot/dts/axc003.dtsi

2e8cd93877b2f9 Vineet Gupta    2016-01-19   11  
5fa2daaa8d8223 Vineet Gupta    2015-03-09   12  / {
5fa2daaa8d8223 Vineet Gupta    2015-03-09   13  	compatible = "snps,arc";
f862b31514bad6 Eugeniy Paltsev 2017-06-26   14  	#address-cells = <2>;
f862b31514bad6 Eugeniy Paltsev 2017-06-26   15  	#size-cells = <2>;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   16  
5fa2daaa8d8223 Vineet Gupta    2015-03-09   17  	cpu_card {
5fa2daaa8d8223 Vineet Gupta    2015-03-09   18  		compatible = "simple-bus";
5fa2daaa8d8223 Vineet Gupta    2015-03-09   19  		#address-cells = <1>;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   20  		#size-cells = <1>;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   21  
f862b31514bad6 Eugeniy Paltsev 2017-06-26   22  		ranges = <0x00000000 0x0 0xf0000000 0x10000000>;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   23  
f6a09bace0bb95 Eugeniy Paltsev 2017-08-14   24  		input_clk: input-clk {
b3d6aba8bd92c2 Vineet Gupta    2016-01-01   25  			#clock-cells = <0>;
b3d6aba8bd92c2 Vineet Gupta    2016-01-01   26  			compatible = "fixed-clock";
f6a09bace0bb95 Eugeniy Paltsev 2017-08-14   27  			clock-frequency = <33333333>;
f6a09bace0bb95 Eugeniy Paltsev 2017-08-14   28  		};
f6a09bace0bb95 Eugeniy Paltsev 2017-08-14   29  
f6a09bace0bb95 Eugeniy Paltsev 2017-08-14   30  		core_clk: core-clk@80 {
f6a09bace0bb95 Eugeniy Paltsev 2017-08-14   31  			compatible = "snps,axs10x-arc-pll-clock";
f6a09bace0bb95 Eugeniy Paltsev 2017-08-14   32  			reg = <0x80 0x10>, <0x100 0x10>;
f6a09bace0bb95 Eugeniy Paltsev 2017-08-14   33  			#clock-cells = <0>;
f6a09bace0bb95 Eugeniy Paltsev 2017-08-14   34  			clocks = <&input_clk>;
fbd1cec57064aa Eugeniy Paltsev 2017-12-09   35  
fbd1cec57064aa Eugeniy Paltsev 2017-12-09   36  			/*
fbd1cec57064aa Eugeniy Paltsev 2017-12-09   37  			 * Set initial core pll output frequency to 90MHz.
fbd1cec57064aa Eugeniy Paltsev 2017-12-09   38  			 * It will be applied at the core pll driver probing
fbd1cec57064aa Eugeniy Paltsev 2017-12-09   39  			 * on early boot.
fbd1cec57064aa Eugeniy Paltsev 2017-12-09   40  			 */
fbd1cec57064aa Eugeniy Paltsev 2017-12-09   41  			assigned-clocks = <&core_clk>;
fbd1cec57064aa Eugeniy Paltsev 2017-12-09   42  			assigned-clock-rates = <90000000>;
b3d6aba8bd92c2 Vineet Gupta    2016-01-01   43  		};
b3d6aba8bd92c2 Vineet Gupta    2016-01-01   44  
9ba7648cc9b363 Vineet Gupta    2016-01-28  @45  		core_intc: archs-intc@cpu {
5fa2daaa8d8223 Vineet Gupta    2015-03-09   46  			compatible = "snps,archs-intc";
5fa2daaa8d8223 Vineet Gupta    2015-03-09   47  			interrupt-controller;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   48  			#interrupt-cells = <1>;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   49  		};
5fa2daaa8d8223 Vineet Gupta    2015-03-09   50  
5fa2daaa8d8223 Vineet Gupta    2015-03-09   51  		/*
5fa2daaa8d8223 Vineet Gupta    2015-03-09   52  		 * this GPIO block ORs all interrupts on CPU card (creg,..)
5fa2daaa8d8223 Vineet Gupta    2015-03-09   53  		 * to uplink only 1 IRQ to ARC core intc
5fa2daaa8d8223 Vineet Gupta    2015-03-09   54  		 */
ef4c54c340de47 Alexey Brodkin  2019-01-24   55  		dw-apb-gpio@2000 {
5fa2daaa8d8223 Vineet Gupta    2015-03-09   56  			compatible = "snps,dw-apb-gpio";
5fa2daaa8d8223 Vineet Gupta    2015-03-09   57  			reg = < 0x2000 0x80 >;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   58  			#address-cells = <1>;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   59  			#size-cells = <0>;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   60  
5fa2daaa8d8223 Vineet Gupta    2015-03-09   61  			ictl_intc: gpio-controller@0 {
5fa2daaa8d8223 Vineet Gupta    2015-03-09   62  				compatible = "snps,dw-apb-gpio-port";
5fa2daaa8d8223 Vineet Gupta    2015-03-09   63  				gpio-controller;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   64  				#gpio-cells = <2>;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   65  				snps,nr-gpios = <30>;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   66  				reg = <0>;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   67  				interrupt-controller;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   68  				#interrupt-cells = <2>;
9ba7648cc9b363 Vineet Gupta    2016-01-28   69  				interrupt-parent = <&core_intc>;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   70  				interrupts = <25>;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   71  			};
5fa2daaa8d8223 Vineet Gupta    2015-03-09   72  		};
5fa2daaa8d8223 Vineet Gupta    2015-03-09   73  
ef4c54c340de47 Alexey Brodkin  2019-01-24   74  		debug_uart: dw-apb-uart@5000 {
5fa2daaa8d8223 Vineet Gupta    2015-03-09   75  			compatible = "snps,dw-apb-uart";
5fa2daaa8d8223 Vineet Gupta    2015-03-09   76  			reg = <0x5000 0x100>;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   77  			clock-frequency = <33333000>;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   78  			interrupt-parent = <&ictl_intc>;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   79  			interrupts = <2 4>;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   80  			baud = <115200>;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   81  			reg-shift = <2>;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   82  			reg-io-width = <4>;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   83  		};
5fa2daaa8d8223 Vineet Gupta    2015-03-09   84  
5fa2daaa8d8223 Vineet Gupta    2015-03-09  @85  		arcpct0: pct {
5fa2daaa8d8223 Vineet Gupta    2015-03-09   86  			compatible = "snps,archs-pct";
5fa2daaa8d8223 Vineet Gupta    2015-03-09   87  			#interrupt-cells = <1>;
9ba7648cc9b363 Vineet Gupta    2016-01-28   88  			interrupt-parent = <&core_intc>;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   89  			interrupts = <20>;
5fa2daaa8d8223 Vineet Gupta    2015-03-09   90  		};
5fa2daaa8d8223 Vineet Gupta    2015-03-09   91  	};
5fa2daaa8d8223 Vineet Gupta    2015-03-09   92  
678c8110d23c0a Eugeniy Paltsev 2018-07-30   93  	/*
678c8110d23c0a Eugeniy Paltsev 2018-07-30   94  	 * Mark DMA peripherals connected via IOC port as dma-coherent. We do
678c8110d23c0a Eugeniy Paltsev 2018-07-30   95  	 * it via overlay because peripherals defined in axs10x_mb.dtsi are
678c8110d23c0a Eugeniy Paltsev 2018-07-30   96  	 * used for both AXS101 and AXS103 boards and only AXS103 has IOC (so
678c8110d23c0a Eugeniy Paltsev 2018-07-30   97  	 * only AXS103 board has HW-coherent DMA peripherals)
678c8110d23c0a Eugeniy Paltsev 2018-07-30   98  	 * We don't need to mark pgu@17000 as dma-coherent because it uses
678c8110d23c0a Eugeniy Paltsev 2018-07-30   99  	 * external DMA buffer located outside of IOC aperture.
678c8110d23c0a Eugeniy Paltsev 2018-07-30  100  	 */
678c8110d23c0a Eugeniy Paltsev 2018-07-30 @101  	axs10x_mb {
ef4c54c340de47 Alexey Brodkin  2019-01-24 @102  		ethernet@18000 {

:::::: The code at line 85 was first introduced by commit
:::::: 5fa2daaa8d8223d06fcdba171a7a668dc8e8b179 ARCv2: [axs103] Support ARC SDP FPGA platform for HS38x cores

:::::: TO: Vineet Gupta <vgupta@synopsys.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
