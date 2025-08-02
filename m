Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59EB1AB6F1
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Aug 2025 06:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754114820; cv=none; b=iVy+XC2pQj3HVk+EynRoP/JU82E7z+AlXEwzfDJd3tt2OOE0SDb+eWZjoQlrD0MYzYAWnf2wqH66mBCSMeY/kykBd5taTRfH2BAqiAM/wVmnRFnZncwRrdz58ez+uT9GUzmaYalAU9+d3HEL1gByFhtn4XowdJ7WeXecrKm5CMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754114820; c=relaxed/simple;
	bh=/U9WCmLpBIE15Yd0FV+EPd8Mieq1IV6VsyHZPftTHss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ob1vFXlbc/VEIxPuTslYD9n9f88Wz9Xi/DVnD5uIbnFRxj7Slba7bBVro0qdRPB/pC8ikoYe1y+9ExSOub1DPnH1NAZ/tsIqk9qPLncBLKuSXuwFciMsbzV/GmhEa8Kiysdc9n0fkO8+FmO5R2bIne1XiC4HJR/a2M3EvzyltxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cXYSCxWx; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cXYSCxWx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754114818; x=1785650818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/U9WCmLpBIE15Yd0FV+EPd8Mieq1IV6VsyHZPftTHss=;
  b=cXYSCxWxUIMCBXbEa24b+hLVsBOVLUFakhloyDEAL5F76YTh0xv12df0
   K02LGHggCYOfFD+50wdVdMfQwb6pxbBf+s3NRGi1D6tv5fz62K58MWyC+
   mb/+wm+IPmf2WXWHfYfTFBq+Iv3UcLlcoXTGj2CzffrlyoRyTtzmLp6IU
   6kNYmGKqZtKS2FgI3JKUhOV/wxYYHDfZ7Y2RbPmms9uaqBmw9kar6X1ix
   sm/lyXSuZwyvzIR7xndOjhBpzbrsbcCHmgaAAd0crQGM+a9SlRxumS2AX
   bIsd5cWPdiadnD/KD+zCGIMqB+lbSlRp1DuhTTfCzZGVJsrp9eKa+w5QE
   Q==;
X-CSE-ConnectionGUID: vRnUHJD2RW2+qam2/sVZXQ==
X-CSE-MsgGUID: azhU5J29S8GYhBicRXE3rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67030635"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="67030635"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 23:06:57 -0700
X-CSE-ConnectionGUID: BXEugPxpTdm+dIe/OLxXFw==
X-CSE-MsgGUID: XomDM5MJTGmxEbnCGBSNGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168199870"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 01 Aug 2025 23:06:55 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui5OP-0001NX-1P;
	Sat, 02 Aug 2025 06:06:53 +0000
Date: Sat, 2 Aug 2025 08:05:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arc/boot/dts/nsimosci.dts:35.22-39.5: Warning (simple_bus_reg):
 /fpga/core_clk: missing or empty reg/ranges property
Message-ID: <202508020834.Pmwo2ZAZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: linux-snps-arc@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a6923c06a3b2e2c534ae28c53a7531e76cc95cfa
commit: 3b7f793acc13b6108452271b306d4aa94a3c4940 ARC: migrate to the generic rule for built-in DTB
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
config: arc-nsimosci_defconfig (https://download.01.org/0day-ci/archive/20250802/202508020834.Pmwo2ZAZ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508020834.Pmwo2ZAZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508020834.Pmwo2ZAZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/skeleton.dtsi:44.9-47.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arc/boot/dts/nsimosci.dts:35.22-39.5: Warning (simple_bus_reg): /fpga/core_clk: missing or empty reg/ranges property
>> arch/arc/boot/dts/nsimosci.dts:41.35-45.5: Warning (simple_bus_reg): /fpga/interrupt-controller: missing or empty reg/ranges property
>> arch/arc/boot/dts/nsimosci.dts:58.18-62.5: Warning (simple_bus_reg): /fpga/pguclk: missing or empty reg/ranges property
>> arch/arc/boot/dts/nsimosci.dts:71.21-76.5: Warning (simple_bus_reg): /fpga/ps2@f9001000: simple-bus unit address format error, expected "f9000400"
>> arch/arc/boot/dts/nsimosci.dts:84.16-86.5: Warning (simple_bus_reg): /fpga/pct: missing or empty reg/ranges property

vim +35 arch/arc/boot/dts/nsimosci.dts

a92a5d0dce5b02 Mischa Jonker  2013-04-18   8  
a92a5d0dce5b02 Mischa Jonker  2013-04-18   9  / {
618a9cd06dd471 Alexey Brodkin 2016-08-16  10  	model = "snps,nsimosci";
a92a5d0dce5b02 Mischa Jonker  2013-04-18  11  	compatible = "snps,nsimosci";
a92a5d0dce5b02 Mischa Jonker  2013-04-18  12  	#address-cells = <1>;
a92a5d0dce5b02 Mischa Jonker  2013-04-18  13  	#size-cells = <1>;
9ba7648cc9b363 Vineet Gupta   2016-01-28  14  	interrupt-parent = <&core_intc>;
a92a5d0dce5b02 Mischa Jonker  2013-04-18  15  
a92a5d0dce5b02 Mischa Jonker  2013-04-18  16  	chosen {
61fb4bfc010b0d Vineet Gupta   2014-04-05  17  		/* this is for console on PGU */
61fb4bfc010b0d Vineet Gupta   2014-04-05  18  		/* bootargs = "console=tty0 consoleblank=0"; */
61fb4bfc010b0d Vineet Gupta   2014-04-05  19  		/* this is for console on serial */
8ff3afc159f26e Alexey Brodkin 2018-01-18  20  		bootargs = "earlycon=uart8250,mmio32,0xf0000000,115200n8 console=tty0 console=ttyS0,115200n8 consoleblank=0 debug video=640x480-24 print-fatal-signals=1";
a92a5d0dce5b02 Mischa Jonker  2013-04-18  21  	};
a92a5d0dce5b02 Mischa Jonker  2013-04-18  22  
a92a5d0dce5b02 Mischa Jonker  2013-04-18  23  	aliases {
a92a5d0dce5b02 Mischa Jonker  2013-04-18  24  		serial0 = &uart0;
a92a5d0dce5b02 Mischa Jonker  2013-04-18  25  	};
a92a5d0dce5b02 Mischa Jonker  2013-04-18  26  
a92a5d0dce5b02 Mischa Jonker  2013-04-18  27  	fpga {
a92a5d0dce5b02 Mischa Jonker  2013-04-18  28  		compatible = "simple-bus";
a92a5d0dce5b02 Mischa Jonker  2013-04-18  29  		#address-cells = <1>;
a92a5d0dce5b02 Mischa Jonker  2013-04-18  30  		#size-cells = <1>;
a92a5d0dce5b02 Mischa Jonker  2013-04-18  31  
a92a5d0dce5b02 Mischa Jonker  2013-04-18  32  		/* child and parent address space 1:1 mapped */
a92a5d0dce5b02 Mischa Jonker  2013-04-18  33  		ranges;
a92a5d0dce5b02 Mischa Jonker  2013-04-18  34  
b3d6aba8bd92c2 Vineet Gupta   2016-01-01 @35  		core_clk: core_clk {
b3d6aba8bd92c2 Vineet Gupta   2016-01-01  36  			#clock-cells = <0>;
b3d6aba8bd92c2 Vineet Gupta   2016-01-01  37  			compatible = "fixed-clock";
b3d6aba8bd92c2 Vineet Gupta   2016-01-01  38  			clock-frequency = <20000000>;
b3d6aba8bd92c2 Vineet Gupta   2016-01-01  39  		};
b3d6aba8bd92c2 Vineet Gupta   2016-01-01  40  
9ba7648cc9b363 Vineet Gupta   2016-01-28 @41  		core_intc: interrupt-controller {
a92a5d0dce5b02 Mischa Jonker  2013-04-18  42  			compatible = "snps,arc700-intc";
a92a5d0dce5b02 Mischa Jonker  2013-04-18  43  			interrupt-controller;
a92a5d0dce5b02 Mischa Jonker  2013-04-18  44  			#interrupt-cells = <1>;
a92a5d0dce5b02 Mischa Jonker  2013-04-18  45  		};
a92a5d0dce5b02 Mischa Jonker  2013-04-18  46  
e8ef060b37c2d3 Vineet Gupta   2014-10-01  47  		uart0: serial@f0000000 {
6eda477b3c54b8 Mischa Jonker  2013-05-16  48  			compatible = "ns8250";
e8ef060b37c2d3 Vineet Gupta   2014-10-01  49  			reg = <0xf0000000 0x2000>;
a92a5d0dce5b02 Mischa Jonker  2013-04-18  50  			interrupts = <11>;
a92a5d0dce5b02 Mischa Jonker  2013-04-18  51  			clock-frequency = <3686400>;
a92a5d0dce5b02 Mischa Jonker  2013-04-18  52  			baud = <115200>;
a92a5d0dce5b02 Mischa Jonker  2013-04-18  53  			reg-shift = <2>;
a92a5d0dce5b02 Mischa Jonker  2013-04-18  54  			reg-io-width = <4>;
6eda477b3c54b8 Mischa Jonker  2013-05-16  55  			no-loopback-test = <1>;
a92a5d0dce5b02 Mischa Jonker  2013-04-18  56  		};
a92a5d0dce5b02 Mischa Jonker  2013-04-18  57  
830c6578481e3b Alexey Brodkin 2016-06-06 @58  		pguclk: pguclk {
830c6578481e3b Alexey Brodkin 2016-06-06  59  			#clock-cells = <0>;
830c6578481e3b Alexey Brodkin 2016-06-06  60  			compatible = "fixed-clock";
830c6578481e3b Alexey Brodkin 2016-06-06  61  			clock-frequency = <25175000>;
830c6578481e3b Alexey Brodkin 2016-06-06  62  		};
830c6578481e3b Alexey Brodkin 2016-06-06  63  
830c6578481e3b Alexey Brodkin 2016-06-06  64  		pgu@f9000000 {
830c6578481e3b Alexey Brodkin 2016-06-06  65  			compatible = "snps,arcpgu";
e8ef060b37c2d3 Vineet Gupta   2014-10-01  66  			reg = <0xf9000000 0x400>;
830c6578481e3b Alexey Brodkin 2016-06-06  67  			clocks = <&pguclk>;
830c6578481e3b Alexey Brodkin 2016-06-06  68  			clock-names = "pxlclk";
a92a5d0dce5b02 Mischa Jonker  2013-04-18  69  		};
a92a5d0dce5b02 Mischa Jonker  2013-04-18  70  
e8ef060b37c2d3 Vineet Gupta   2014-10-01 @71  		ps2: ps2@f9001000 {
a92a5d0dce5b02 Mischa Jonker  2013-04-18  72  			compatible = "snps,arc_ps2";
e8ef060b37c2d3 Vineet Gupta   2014-10-01  73  			reg = <0xf9000400 0x14>;
a92a5d0dce5b02 Mischa Jonker  2013-04-18  74  			interrupts = <13>;
a92a5d0dce5b02 Mischa Jonker  2013-04-18  75  			interrupt-names = "arc_ps2_irq";
a92a5d0dce5b02 Mischa Jonker  2013-04-18  76  		};
a92a5d0dce5b02 Mischa Jonker  2013-04-18  77  
e8ef060b37c2d3 Vineet Gupta   2014-10-01  78  		eth0: ethernet@f0003000 {
df420fd68811c9 Lada Trimasova 2016-03-14  79  			compatible = "ezchip,nps-mgt-enet";
e8ef060b37c2d3 Vineet Gupta   2014-10-01  80  			reg = <0xf0003000 0x44>;
df420fd68811c9 Lada Trimasova 2016-03-14  81  			interrupts = <7>;
a92a5d0dce5b02 Mischa Jonker  2013-04-18  82  		};
6227e9f0e9ee98 Alexey Brodkin 2016-10-31  83  
6227e9f0e9ee98 Alexey Brodkin 2016-10-31 @84  		arcpct0: pct {

:::::: The code at line 35 was first introduced by commit
:::::: b3d6aba8bd92c20b7748ccd82b6fab8ea5081066 ARC: [dts] Add clk feeding into timers to DTs

:::::: TO: Vineet Gupta <vgupta@synopsys.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
