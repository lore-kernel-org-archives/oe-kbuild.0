Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAB015099D
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Aug 2024 19:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723143910; cv=none; b=NVtP1TWZcmjAEFL7I4zhFYDxi4Ea6S5kTZSYIxm3q/R4DjNigJ9qhPYZSQPo68NJuxmV/8F5tzj99WRivcqC2F6BXKm0u5oI+eP+9CKN91rKlhCN41L9d+iPzb7pDXcJ41eswqhDG0RIpACr+Iwo/WcYMmVT1uIyG94p9amC7pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723143910; c=relaxed/simple;
	bh=vbGGFoUoFnqrL+QlXvDUMLl84iqNdkrI1jIwOkUdtRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uhnrolOxcQyB30s+40dPPUVmjQknDFcK6kL354ga1CD6dS+xlhoySoW59JV7qq9Uc/Rk/fxDcpOPitS5Hd+UcyPHfQEqbwBoaCEaWsgwZ8cyy+tm8kUGq3vjB0v0J6g/TY5gQwd+82Ktvo8CiIwkcNATXlQXJH2ae697sGJbsgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDY6lNVn; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDY6lNVn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723143907; x=1754679907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vbGGFoUoFnqrL+QlXvDUMLl84iqNdkrI1jIwOkUdtRA=;
  b=XDY6lNVndku8fCUmX0YtOKcaQzTDCpq4UIpSC1giW6X4sSyh89a05Vkh
   k9QcMbIfa+kBB7lv/p/K0DA6Q8TSBKDujEfCjr1+xP7pt7S10gITKRipw
   /dDcBiJObiIRAam8cYowyMSHBRp+xFnwqjbr4tAWDh3yock69VUMWYFAt
   K7djG9WonC4dcGiBs54TAhpB0w5UoFmgElWkuW1pzmXbqlHXMP6qF2Mwb
   jlqifcHIqOYFrSb9QodW2zk/TBjvFoW1tBmcTwG92QoHAh8dTSjHl4S57
   61KSdmw1dEA99hPa7AIciDhETCzFZBoPLxPngNAX5NhQeuYVs2HJqh29w
   g==;
X-CSE-ConnectionGUID: a0eZoHZCSGaq+pykyybIDg==
X-CSE-MsgGUID: Y3YQbK/0SRqmou60QGnH8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21454900"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="21454900"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 12:05:05 -0700
X-CSE-ConnectionGUID: CVNe7vslRqi0dU9S8gR6NQ==
X-CSE-MsgGUID: +VRC1otpTHaCP4NJDhUGEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="62277981"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 08 Aug 2024 12:05:04 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sc8RZ-0006Qw-26;
	Thu, 08 Aug 2024 19:05:01 +0000
Date: Fri, 9 Aug 2024 03:04:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:sigh 6/12]
 arch/riscv/boot/dts/microchip/mpfs.dtsi:254.32-257.5: Warning
 (unique_unit_address_if_enabled): /soc/syscon@20002000: duplicate
 unit-address (also used in node /soc/clkcfg@20002000)
Message-ID: <202408090215.xuj4Estv-lkp@intel.com>
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
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git sigh
head:   fc1be45362668d3f677d26fee63f7eafbc10ff6d
commit: 034b9ba1e3e05b2f486a0d0284749f04d09f36a4 [6/12] describe new syscons and remove the extra reg regions from the mailbox
:::::: branch date: 4 hours ago
:::::: commit date: 5 hours ago
config: riscv-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240809/202408090215.xuj4Estv-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 4527fba9ad6bc682eceda603150bfaec65ec6916)
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090215.xuj4Estv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408090215.xuj4Estv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/microchip/mpfs.dtsi:254.32-257.5: Warning (unique_unit_address_if_enabled): /soc/syscon@20002000: duplicate unit-address (also used in node /soc/clkcfg@20002000)
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: /soc/syscon@20002000: failed to match any schema with compatible: ['microchip,mss-top-scb', 'syscon']
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: /soc/syscon@20003000: failed to match any schema with compatible: ['microchip,sysreg-scb', 'syscon']
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: /soc/syscon@37020000: failed to match any schema with compatible: ['microchip,control-scb', 'syscon', 'simple-mfd']
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: /soc/syscon@37020000/sensor: failed to match any schema with compatible: ['microchip,mpfs-tvs']
--
>> arch/riscv/boot/dts/microchip/mpfs.dtsi:254.32-257.5: Warning (unique_unit_address_if_enabled): /soc/syscon@20002000: duplicate unit-address (also used in node /soc/clkcfg@20002000)
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: /soc/syscon@20002000: failed to match any schema with compatible: ['microchip,mss-top-scb', 'syscon']
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: /soc/syscon@20003000: failed to match any schema with compatible: ['microchip,sysreg-scb', 'syscon']
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: /soc/syscon@37020000: failed to match any schema with compatible: ['microchip,control-scb', 'syscon', 'simple-mfd']
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: /soc/syscon@37020000/sensor: failed to match any schema with compatible: ['microchip,mpfs-tvs']
--
>> arch/riscv/boot/dts/microchip/mpfs.dtsi:254.32-257.5: Warning (unique_unit_address_if_enabled): /soc/syscon@20002000: duplicate unit-address (also used in node /soc/clkcfg@20002000)
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: /soc/syscon@20002000: failed to match any schema with compatible: ['microchip,mss-top-scb', 'syscon']
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: /soc/syscon@20003000: failed to match any schema with compatible: ['microchip,sysreg-scb', 'syscon']
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: /soc/syscon@37020000: failed to match any schema with compatible: ['microchip,control-scb', 'syscon', 'simple-mfd']
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: /soc/syscon@37020000/sensor: failed to match any schema with compatible: ['microchip,mpfs-tvs']
--
>> arch/riscv/boot/dts/microchip/mpfs.dtsi:254.32-257.5: Warning (unique_unit_address_if_enabled): /soc/syscon@20002000: duplicate unit-address (also used in node /soc/clkcfg@20002000)
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: /soc/syscon@20002000: failed to match any schema with compatible: ['microchip,mss-top-scb', 'syscon']
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: /soc/syscon@20003000: failed to match any schema with compatible: ['microchip,sysreg-scb', 'syscon']
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: /soc/syscon@37020000: failed to match any schema with compatible: ['microchip,control-scb', 'syscon', 'simple-mfd']
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: /soc/syscon@37020000/sensor: failed to match any schema with compatible: ['microchip,mpfs-tvs']
--
>> arch/riscv/boot/dts/microchip/mpfs.dtsi:254.32-257.5: Warning (unique_unit_address_if_enabled): /soc/syscon@20002000: duplicate unit-address (also used in node /soc/clkcfg@20002000)
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: /soc/syscon@20002000: failed to match any schema with compatible: ['microchip,mss-top-scb', 'syscon']
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: /soc/syscon@20003000: failed to match any schema with compatible: ['microchip,sysreg-scb', 'syscon']
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: /soc/syscon@37020000: failed to match any schema with compatible: ['microchip,control-scb', 'syscon', 'simple-mfd']
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: /soc/syscon@37020000/sensor: failed to match any schema with compatible: ['microchip,mpfs-tvs']
--
>> arch/riscv/boot/dts/microchip/mpfs.dtsi:254.32-257.5: Warning (unique_unit_address_if_enabled): /soc/syscon@20002000: duplicate unit-address (also used in node /soc/clkcfg@20002000)
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: /soc/syscon@20002000: failed to match any schema with compatible: ['microchip,mss-top-scb', 'syscon']
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: /soc/syscon@20003000: failed to match any schema with compatible: ['microchip,sysreg-scb', 'syscon']
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: /soc/syscon@37020000: failed to match any schema with compatible: ['microchip,control-scb', 'syscon', 'simple-mfd']
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: /soc/syscon@37020000/sensor: failed to match any schema with compatible: ['microchip,mpfs-tvs']

vim +254 arch/riscv/boot/dts/microchip/mpfs.dtsi

0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03    6  
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03    7  / {
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03    8  	#address-cells = <2>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03    9  	#size-cells = <2>;
fd86dd2a5dc5ff arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Krzysztof Kozlowski 2021-09-27   10  	model = "Microchip PolarFire SoC";
fd86dd2a5dc5ff arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Krzysztof Kozlowski 2021-09-27   11  	compatible = "microchip,mpfs";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   12  
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   13  	cpus {
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   14  		#address-cells = <1>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   15  		#size-cells = <0>;
79997eda0d31bc arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2023-11-26   16  		timebase-frequency = <1000000>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   17  
c5094f371008c5 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Conor Dooley        2022-02-14   18  		cpu0: cpu@0 {
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   19  			compatible = "sifive,e51", "sifive,rocket0", "riscv";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   20  			device_type = "cpu";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   21  			i-cache-block-size = <64>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   22  			i-cache-sets = <128>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   23  			i-cache-size = <16384>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   24  			reg = <0>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   25  			riscv,isa = "rv64imac";
561add0da6d3d0 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2023-10-09   26  			riscv,isa-base = "rv64i";
561add0da6d3d0 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2023-10-09   27  			riscv,isa-extensions = "i", "m", "a", "c", "zicntr", "zicsr", "zifencei",
561add0da6d3d0 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2023-10-09   28  					       "zihpm";
6546f920868e13 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Conor Dooley        2022-02-14   29  			clocks = <&clkcfg CLK_CPU>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   30  			status = "disabled";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   31  
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   32  			cpu0_intc: interrupt-controller {
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   33  				#interrupt-cells = <1>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   34  				compatible = "riscv,cpu-intc";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   35  				interrupt-controller;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   36  			};
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   37  		};
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   38  
c5094f371008c5 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Conor Dooley        2022-02-14   39  		cpu1: cpu@1 {
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   40  			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   41  			d-cache-block-size = <64>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   42  			d-cache-sets = <64>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   43  			d-cache-size = <32768>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   44  			d-tlb-sets = <1>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   45  			d-tlb-size = <32>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   46  			device_type = "cpu";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   47  			i-cache-block-size = <64>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   48  			i-cache-sets = <64>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   49  			i-cache-size = <32768>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   50  			i-tlb-sets = <1>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   51  			i-tlb-size = <32>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   52  			mmu-type = "riscv,sv39";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   53  			reg = <1>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   54  			riscv,isa = "rv64imafdc";
561add0da6d3d0 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2023-10-09   55  			riscv,isa-base = "rv64i";
561add0da6d3d0 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2023-10-09   56  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
561add0da6d3d0 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2023-10-09   57  					       "zifencei", "zihpm";
6546f920868e13 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Conor Dooley        2022-02-14   58  			clocks = <&clkcfg CLK_CPU>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   59  			tlb-split;
efa310ba00716d arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-06-29   60  			next-level-cache = <&cctrllr>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   61  			status = "okay";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   62  
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   63  			cpu1_intc: interrupt-controller {
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   64  				#interrupt-cells = <1>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   65  				compatible = "riscv,cpu-intc";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   66  				interrupt-controller;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   67  			};
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   68  		};
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   69  
c5094f371008c5 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Conor Dooley        2022-02-14   70  		cpu2: cpu@2 {
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   71  			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   72  			d-cache-block-size = <64>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   73  			d-cache-sets = <64>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   74  			d-cache-size = <32768>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   75  			d-tlb-sets = <1>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   76  			d-tlb-size = <32>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   77  			device_type = "cpu";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   78  			i-cache-block-size = <64>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   79  			i-cache-sets = <64>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   80  			i-cache-size = <32768>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   81  			i-tlb-sets = <1>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   82  			i-tlb-size = <32>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   83  			mmu-type = "riscv,sv39";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   84  			reg = <2>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   85  			riscv,isa = "rv64imafdc";
561add0da6d3d0 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2023-10-09   86  			riscv,isa-base = "rv64i";
561add0da6d3d0 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2023-10-09   87  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
561add0da6d3d0 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2023-10-09   88  					       "zifencei", "zihpm";
6546f920868e13 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Conor Dooley        2022-02-14   89  			clocks = <&clkcfg CLK_CPU>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   90  			tlb-split;
efa310ba00716d arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-06-29   91  			next-level-cache = <&cctrllr>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   92  			status = "okay";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   93  
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   94  			cpu2_intc: interrupt-controller {
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   95  				#interrupt-cells = <1>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   96  				compatible = "riscv,cpu-intc";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   97  				interrupt-controller;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   98  			};
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03   99  		};
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  100  
c5094f371008c5 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Conor Dooley        2022-02-14  101  		cpu3: cpu@3 {
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  102  			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  103  			d-cache-block-size = <64>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  104  			d-cache-sets = <64>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  105  			d-cache-size = <32768>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  106  			d-tlb-sets = <1>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  107  			d-tlb-size = <32>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  108  			device_type = "cpu";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  109  			i-cache-block-size = <64>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  110  			i-cache-sets = <64>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  111  			i-cache-size = <32768>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  112  			i-tlb-sets = <1>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  113  			i-tlb-size = <32>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  114  			mmu-type = "riscv,sv39";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  115  			reg = <3>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  116  			riscv,isa = "rv64imafdc";
561add0da6d3d0 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2023-10-09  117  			riscv,isa-base = "rv64i";
561add0da6d3d0 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2023-10-09  118  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
561add0da6d3d0 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2023-10-09  119  					       "zifencei", "zihpm";
6546f920868e13 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Conor Dooley        2022-02-14  120  			clocks = <&clkcfg CLK_CPU>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  121  			tlb-split;
efa310ba00716d arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-06-29  122  			next-level-cache = <&cctrllr>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  123  			status = "okay";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  124  
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  125  			cpu3_intc: interrupt-controller {
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  126  				#interrupt-cells = <1>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  127  				compatible = "riscv,cpu-intc";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  128  				interrupt-controller;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  129  			};
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  130  		};
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  131  
c5094f371008c5 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Conor Dooley        2022-02-14  132  		cpu4: cpu@4 {
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  133  			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  134  			d-cache-block-size = <64>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  135  			d-cache-sets = <64>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  136  			d-cache-size = <32768>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  137  			d-tlb-sets = <1>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  138  			d-tlb-size = <32>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  139  			device_type = "cpu";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  140  			i-cache-block-size = <64>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  141  			i-cache-sets = <64>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  142  			i-cache-size = <32768>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  143  			i-tlb-sets = <1>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  144  			i-tlb-size = <32>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  145  			mmu-type = "riscv,sv39";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  146  			reg = <4>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  147  			riscv,isa = "rv64imafdc";
561add0da6d3d0 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2023-10-09  148  			riscv,isa-base = "rv64i";
561add0da6d3d0 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2023-10-09  149  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
561add0da6d3d0 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2023-10-09  150  					       "zifencei", "zihpm";
6546f920868e13 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Conor Dooley        2022-02-14  151  			clocks = <&clkcfg CLK_CPU>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  152  			tlb-split;
efa310ba00716d arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-06-29  153  			next-level-cache = <&cctrllr>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  154  			status = "okay";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  155  			cpu4_intc: interrupt-controller {
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  156  				#interrupt-cells = <1>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  157  				compatible = "riscv,cpu-intc";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  158  				interrupt-controller;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  159  			};
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  160  		};
88d319c6abaeb3 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-07-05  161  
88d319c6abaeb3 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-07-05  162  		cpu-map {
88d319c6abaeb3 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-07-05  163  			cluster0 {
88d319c6abaeb3 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-07-05  164  				core0 {
88d319c6abaeb3 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-07-05  165  					cpu = <&cpu0>;
88d319c6abaeb3 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-07-05  166  				};
88d319c6abaeb3 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-07-05  167  
88d319c6abaeb3 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-07-05  168  				core1 {
88d319c6abaeb3 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-07-05  169  					cpu = <&cpu1>;
88d319c6abaeb3 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-07-05  170  				};
88d319c6abaeb3 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-07-05  171  
88d319c6abaeb3 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-07-05  172  				core2 {
88d319c6abaeb3 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-07-05  173  					cpu = <&cpu2>;
88d319c6abaeb3 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-07-05  174  				};
88d319c6abaeb3 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-07-05  175  
88d319c6abaeb3 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-07-05  176  				core3 {
88d319c6abaeb3 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-07-05  177  					cpu = <&cpu3>;
88d319c6abaeb3 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-07-05  178  				};
88d319c6abaeb3 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-07-05  179  
88d319c6abaeb3 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-07-05  180  				core4 {
88d319c6abaeb3 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-07-05  181  					cpu = <&cpu4>;
88d319c6abaeb3 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-07-05  182  				};
88d319c6abaeb3 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-07-05  183  			};
88d319c6abaeb3 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-07-05  184  		};
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  185  	};
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  186  
6deb9bf4580d53 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Conor Dooley        2022-04-13  187  	refclk: mssrefclk {
9d7b3078628f59 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Geert Uytterhoeven  2021-12-17  188  		compatible = "fixed-clock";
9d7b3078628f59 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Geert Uytterhoeven  2021-12-17  189  		#clock-cells = <0>;
9d7b3078628f59 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Geert Uytterhoeven  2021-12-17  190  	};
9d7b3078628f59 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Geert Uytterhoeven  2021-12-17  191  
9499e76de5d5ab arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Conor Dooley        2022-05-09  192  	syscontroller: syscontroller {
9499e76de5d5ab arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Conor Dooley        2022-05-09  193  		compatible = "microchip,mpfs-sys-controller";
9499e76de5d5ab arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Conor Dooley        2022-05-09  194  		mboxes = <&mbox 0>;
9499e76de5d5ab arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Conor Dooley        2022-05-09  195  	};
9499e76de5d5ab arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Conor Dooley        2022-05-09  196  
0678df8271820b arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2023-10-20  197  	scbclk: mssclkclk {
0678df8271820b arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2023-10-20  198  		compatible = "fixed-clock";
0678df8271820b arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2023-10-20  199  		#clock-cells = <0>;
0678df8271820b arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2023-10-20  200  		clock-frequency = <80000000>;
0678df8271820b arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2023-10-20  201  	};
0678df8271820b arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2023-10-20  202  
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  203  	soc {
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  204  		#address-cells = <2>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  205  		#size-cells = <2>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  206  		compatible = "simple-bus";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  207  		ranges;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  208  
c5094f371008c5 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Conor Dooley        2022-02-14  209  		cctrllr: cache-controller@2010000 {
0dec364ffeb614 arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-08-25  210  			compatible = "microchip,mpfs-ccache", "sifive,fu540-c000-ccache", "cache";
c5094f371008c5 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Conor Dooley        2022-02-14  211  			reg = <0x0 0x2010000 0x0 0x1000>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  212  			cache-block-size = <64>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  213  			cache-level = <2>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  214  			cache-sets = <1024>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  215  			cache-size = <2097152>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  216  			cache-unified;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  217  			interrupt-parent = <&plic>;
34fc9cc3aebe8b arch/riscv/boot/dts/microchip/mpfs.dtsi           Heinrich Schuchardt 2022-08-17  218  			interrupts = <1>, <3>, <4>, <2>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  219  		};
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  220  
c5094f371008c5 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Conor Dooley        2022-02-14  221  		clint: clint@2000000 {
73d3c441155146 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Krzysztof Kozlowski 2021-09-20  222  			compatible = "sifive,fu540-c000-clint", "sifive,clint0";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  223  			reg = <0x0 0x2000000 0x0 0xC000>;
e35b07a7df9b8a arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Geert Uytterhoeven  2021-12-17  224  			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
e35b07a7df9b8a arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Geert Uytterhoeven  2021-12-17  225  					      <&cpu1_intc 3>, <&cpu1_intc 7>,
e35b07a7df9b8a arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Geert Uytterhoeven  2021-12-17  226  					      <&cpu2_intc 3>, <&cpu2_intc 7>,
e35b07a7df9b8a arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Geert Uytterhoeven  2021-12-17  227  					      <&cpu3_intc 3>, <&cpu3_intc 7>,
e35b07a7df9b8a arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Geert Uytterhoeven  2021-12-17  228  					      <&cpu4_intc 3>, <&cpu4_intc 7>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  229  		};
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  230  
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  231  		plic: interrupt-controller@c000000 {
73d3c441155146 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Krzysztof Kozlowski 2021-09-20  232  			compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  233  			reg = <0x0 0xc000000 0x0 0x4000000>;
53abf98005a6bc arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Geert Uytterhoeven  2021-12-17  234  			#address-cells = <0>;
53abf98005a6bc arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Geert Uytterhoeven  2021-12-17  235  			#interrupt-cells = <1>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  236  			interrupt-controller;
e35b07a7df9b8a arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Geert Uytterhoeven  2021-12-17  237  			interrupts-extended = <&cpu0_intc 11>,
e35b07a7df9b8a arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Geert Uytterhoeven  2021-12-17  238  					      <&cpu1_intc 11>, <&cpu1_intc 9>,
e35b07a7df9b8a arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Geert Uytterhoeven  2021-12-17  239  					      <&cpu2_intc 11>, <&cpu2_intc 9>,
e35b07a7df9b8a arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Geert Uytterhoeven  2021-12-17  240  					      <&cpu3_intc 11>, <&cpu3_intc 9>,
e35b07a7df9b8a arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Geert Uytterhoeven  2021-12-17  241  					      <&cpu4_intc 11>, <&cpu4_intc 9>;
53abf98005a6bc arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Geert Uytterhoeven  2021-12-17  242  			riscv,ndev = <186>;
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  243  		};
0fa6107eca4186 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi Atish Patra         2021-03-03  244  
5e757deddd918e arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-06-03  245  		pdma: dma-controller@3000000 {
5669bb5a16a0b8 arch/riscv/boot/dts/microchip/mpfs.dtsi           Shravan Chippa      2023-12-08  246  			compatible = "microchip,mpfs-pdma", "sifive,pdma0";
5e757deddd918e arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-06-03  247  			reg = <0x0 0x3000000 0x0 0x8000>;
5e757deddd918e arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-06-03  248  			interrupt-parent = <&plic>;
5e757deddd918e arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-06-03  249  			interrupts = <5 6>, <7 8>, <9 10>, <11 12>;
5e757deddd918e arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-06-03  250  			dma-channels = <4>;
5e757deddd918e arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-06-03  251  			#dma-cells = <1>;
5e757deddd918e arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-06-03  252  		};
5e757deddd918e arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2022-06-03  253  
034b9ba1e3e05b arch/riscv/boot/dts/microchip/mpfs.dtsi           Conor Dooley        2024-08-08 @254  		mss_top_scb: syscon@20002000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
