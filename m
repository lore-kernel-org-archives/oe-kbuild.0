Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD5F155330
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Dec 2024 09:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735290560; cv=none; b=Jr8PK38SHoEmVaf4pDyp5di+41rPRo4AykgWenUGi2ufK13Luk5An7PAq8J/oHKOduXSqvoRfWtt+9XSwcgtBZ945kdOWh4LdJGYQ5lj6CwdmqKmelXfT/BLuE+AMQ/X/EuFBoxuFdMcMCHlPmv1V7A2meqTdHR1OVfy8/9ZBBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735290560; c=relaxed/simple;
	bh=wdf+cshd28TzLdVBRAhF6+9LglrbUSbuCiguJwzNedQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JgV8eVW6yH79A9kiSrAjgU2ohqnBOWdtCcjQOSV9w5sV/wvcpKCksr5QtfoU1XikxYYbproC5zJjd3T6wuREbkeOLroW5GrRl0aJ2EVSdd7TmBCQTHdjKRcPX4DVSEzBn70lPBHX01WceM/8DLeKWsPSvaa8FQwDIPLhIKJGbsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IXkO6Uew; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IXkO6Uew"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735290555; x=1766826555;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wdf+cshd28TzLdVBRAhF6+9LglrbUSbuCiguJwzNedQ=;
  b=IXkO6Uewu+2zXsXOCn52RJFkIQLCtxDreTYsWmUW6k4BmIe4egl5qmoC
   31hzuwXunsMGiDO8ddjY6Lu+FHVnlmM7s/+O1B9xTBgliBfNKpcHl5an9
   p5yfrQCuev0yZNBn8niTqdsy6ABh0LwOvUSsPXO3sbtj5I5nmhNorQDhH
   wrT83utS/AHT26MMh2RmuNxTLVrWB3biUnWZQR8rQHTE2CTiHD7dI4YvC
   3zAK5b56B7LnR/juXgkMOgPtlR/mlYWjYQcTlja7BxJMv2j1Qoyq17mvA
   F+n7oKQWb4FksdUWUW0XgL5Ie5xvxFwpVx72KVzQrr0bKfs0787ZHHOT4
   A==;
X-CSE-ConnectionGUID: 5zW/8tZ4Snq+yD9VMrwGaQ==
X-CSE-MsgGUID: yOTKmkWRReGCaz4OddfzAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="34963698"
X-IronPort-AV: E=Sophos;i="6.12,268,1728975600"; 
   d="scan'208";a="34963698"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 01:09:13 -0800
X-CSE-ConnectionGUID: 0/yl4oJWQqGl+FVbIEWlsg==
X-CSE-MsgGUID: aIAkwE/uTKGCnVY1AeZjkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123389083"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Dec 2024 01:09:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tR6LE-00036w-2t;
	Fri, 27 Dec 2024 09:09:08 +0000
Date: Fri, 27 Dec 2024 17:08:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1051.12-1061.7: Warning
 (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has
 single child node 'endpoint@0', #address-cells/#size-cells are not necessary
Message-ID: <202412271622.KUGU5kSU-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Niklas Söderlund" <niklas.soderlund+renesas@ragnatech.se>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d6ef8b40d075c425f548002d2f35ae3f06e9cf96
commit: 5fea5b5571346981f060fd3b02658398048c3e91 arm64: dts: renesas: r8a779a0: Add and connect all CSI-2, ISP and VIN nodes
date:   3 years, 2 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 3 years, 2 months ago
config: arm64-randconfig-003-20241220 (https://download.01.org/0day-ci/archive/20241227/202412271622.KUGU5kSU-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412271622.KUGU5kSU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412271622.KUGU5kSU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1051.12-1061.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1079.12-1089.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1107.12-1117.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1135.12-1145.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1163.12-1173.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1191.12-1201.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1219.12-1229.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1247.12-1257.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779a0.dtsi:2284.12-2294.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779a0.dtsi:2450.12-2460.7: Warning (graph_child_address): /soc/isp@fed30000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +1051 arch/arm64/boot/dts/renesas/r8a779a0.dtsi

834c310f541839 Yoshihiro Shimoda  2020-09-10    11  
834c310f541839 Yoshihiro Shimoda  2020-09-10    12  / {
834c310f541839 Yoshihiro Shimoda  2020-09-10    13  	compatible = "renesas,r8a779a0";
834c310f541839 Yoshihiro Shimoda  2020-09-10    14  	#address-cells = <2>;
834c310f541839 Yoshihiro Shimoda  2020-09-10    15  	#size-cells = <2>;
834c310f541839 Yoshihiro Shimoda  2020-09-10    16  
34c0e3e1111bf0 Koji Matsuoka      2021-01-21    17  	aliases {
34c0e3e1111bf0 Koji Matsuoka      2021-01-21    18  		i2c0 = &i2c0;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21    19  		i2c1 = &i2c1;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21    20  		i2c2 = &i2c2;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21    21  		i2c3 = &i2c3;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21    22  		i2c4 = &i2c4;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21    23  		i2c5 = &i2c5;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21    24  		i2c6 = &i2c6;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21    25  	};
34c0e3e1111bf0 Koji Matsuoka      2021-01-21    26  
834c310f541839 Yoshihiro Shimoda  2020-09-10    27  	cpus {
834c310f541839 Yoshihiro Shimoda  2020-09-10    28  		#address-cells = <1>;
834c310f541839 Yoshihiro Shimoda  2020-09-10    29  		#size-cells = <0>;
834c310f541839 Yoshihiro Shimoda  2020-09-10    30  
834c310f541839 Yoshihiro Shimoda  2020-09-10    31  		a76_0: cpu@0 {
834c310f541839 Yoshihiro Shimoda  2020-09-10    32  			compatible = "arm,cortex-a76";
834c310f541839 Yoshihiro Shimoda  2020-09-10    33  			reg = <0>;
834c310f541839 Yoshihiro Shimoda  2020-09-10    34  			device_type = "cpu";
834c310f541839 Yoshihiro Shimoda  2020-09-10    35  			power-domains = <&sysc R8A779A0_PD_A1E0D0C0>;
834c310f541839 Yoshihiro Shimoda  2020-09-10    36  			next-level-cache = <&L3_CA76_0>;
834c310f541839 Yoshihiro Shimoda  2020-09-10    37  		};
834c310f541839 Yoshihiro Shimoda  2020-09-10    38  
834c310f541839 Yoshihiro Shimoda  2020-09-10    39  		L3_CA76_0: cache-controller-0 {
834c310f541839 Yoshihiro Shimoda  2020-09-10    40  			compatible = "cache";
834c310f541839 Yoshihiro Shimoda  2020-09-10    41  			power-domains = <&sysc R8A779A0_PD_A2E0D0>;
834c310f541839 Yoshihiro Shimoda  2020-09-10    42  			cache-unified;
834c310f541839 Yoshihiro Shimoda  2020-09-10    43  			cache-level = <3>;
834c310f541839 Yoshihiro Shimoda  2020-09-10    44  		};
834c310f541839 Yoshihiro Shimoda  2020-09-10    45  	};
834c310f541839 Yoshihiro Shimoda  2020-09-10    46  
834c310f541839 Yoshihiro Shimoda  2020-09-10    47  	extal_clk: extal {
834c310f541839 Yoshihiro Shimoda  2020-09-10    48  		compatible = "fixed-clock";
834c310f541839 Yoshihiro Shimoda  2020-09-10    49  		#clock-cells = <0>;
834c310f541839 Yoshihiro Shimoda  2020-09-10    50  		/* This value must be overridden by the board */
834c310f541839 Yoshihiro Shimoda  2020-09-10    51  		clock-frequency = <0>;
834c310f541839 Yoshihiro Shimoda  2020-09-10    52  	};
834c310f541839 Yoshihiro Shimoda  2020-09-10    53  
834c310f541839 Yoshihiro Shimoda  2020-09-10    54  	extalr_clk: extalr {
834c310f541839 Yoshihiro Shimoda  2020-09-10    55  		compatible = "fixed-clock";
834c310f541839 Yoshihiro Shimoda  2020-09-10    56  		#clock-cells = <0>;
834c310f541839 Yoshihiro Shimoda  2020-09-10    57  		/* This value must be overridden by the board */
834c310f541839 Yoshihiro Shimoda  2020-09-10    58  		clock-frequency = <0>;
834c310f541839 Yoshihiro Shimoda  2020-09-10    59  	};
834c310f541839 Yoshihiro Shimoda  2020-09-10    60  
834c310f541839 Yoshihiro Shimoda  2020-09-10    61  	pmu_a76 {
834c310f541839 Yoshihiro Shimoda  2020-09-10    62  		compatible = "arm,cortex-a76-pmu";
bbbf6db5a0b561 Yoshihiro Shimoda  2021-03-25    63  		interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
834c310f541839 Yoshihiro Shimoda  2020-09-10    64  	};
834c310f541839 Yoshihiro Shimoda  2020-09-10    65  
834c310f541839 Yoshihiro Shimoda  2020-09-10    66  	/* External SCIF clock - to be overridden by boards that provide it */
834c310f541839 Yoshihiro Shimoda  2020-09-10    67  	scif_clk: scif {
834c310f541839 Yoshihiro Shimoda  2020-09-10    68  		compatible = "fixed-clock";
834c310f541839 Yoshihiro Shimoda  2020-09-10    69  		#clock-cells = <0>;
834c310f541839 Yoshihiro Shimoda  2020-09-10    70  		clock-frequency = <0>;
834c310f541839 Yoshihiro Shimoda  2020-09-10    71  	};
834c310f541839 Yoshihiro Shimoda  2020-09-10    72  
834c310f541839 Yoshihiro Shimoda  2020-09-10    73  	soc: soc {
834c310f541839 Yoshihiro Shimoda  2020-09-10    74  		compatible = "simple-bus";
834c310f541839 Yoshihiro Shimoda  2020-09-10    75  		interrupt-parent = <&gic>;
834c310f541839 Yoshihiro Shimoda  2020-09-10    76  		#address-cells = <2>;
834c310f541839 Yoshihiro Shimoda  2020-09-10    77  		#size-cells = <2>;
834c310f541839 Yoshihiro Shimoda  2020-09-10    78  		ranges;
834c310f541839 Yoshihiro Shimoda  2020-09-10    79  
f4b30c0a03a9ed Hoang Vo           2020-12-18    80  		rwdt: watchdog@e6020000 {
f4b30c0a03a9ed Hoang Vo           2020-12-18    81  			compatible = "renesas,r8a779a0-wdt",
f4b30c0a03a9ed Hoang Vo           2020-12-18    82  				     "renesas,rcar-gen3-wdt";
f4b30c0a03a9ed Hoang Vo           2020-12-18    83  			reg = <0 0xe6020000 0 0x0c>;
f4b30c0a03a9ed Hoang Vo           2020-12-18    84  			clocks = <&cpg CPG_MOD 907>;
f4b30c0a03a9ed Hoang Vo           2020-12-18    85  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
f4b30c0a03a9ed Hoang Vo           2020-12-18    86  			resets = <&cpg 907>;
f4b30c0a03a9ed Hoang Vo           2020-12-18    87  			status = "disabled";
f4b30c0a03a9ed Hoang Vo           2020-12-18    88  		};
f4b30c0a03a9ed Hoang Vo           2020-12-18    89  
73feebad9e056c Ulrich Hecht       2021-01-12    90  		pfc: pin-controller@e6050000 {
73feebad9e056c Ulrich Hecht       2021-01-12    91  			compatible = "renesas,pfc-r8a779a0";
73feebad9e056c Ulrich Hecht       2021-01-12    92  			reg = <0 0xe6050000 0 0x16c>, <0 0xe6050800 0 0x16c>,
73feebad9e056c Ulrich Hecht       2021-01-12    93  			      <0 0xe6058000 0 0x16c>, <0 0xe6058800 0 0x16c>,
73feebad9e056c Ulrich Hecht       2021-01-12    94  			      <0 0xe6060000 0 0x16c>, <0 0xe6060800 0 0x16c>,
73feebad9e056c Ulrich Hecht       2021-01-12    95  			      <0 0xe6068000 0 0x16c>, <0 0xe6068800 0 0x16c>,
73feebad9e056c Ulrich Hecht       2021-01-12    96  			      <0 0xe6069000 0 0x16c>, <0 0xe6069800 0 0x16c>;
73feebad9e056c Ulrich Hecht       2021-01-12    97  		};
73feebad9e056c Ulrich Hecht       2021-01-12    98  
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14    99  		gpio0: gpio@e6058180 {
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   100  			compatible = "renesas,gpio-r8a779a0";
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   101  			reg = <0 0xe6058180 0 0x54>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   102  			interrupts = <GIC_SPI 832 IRQ_TYPE_LEVEL_HIGH>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   103  			clocks = <&cpg CPG_MOD 916>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   104  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   105  			resets =  <&cpg 916>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   106  			gpio-controller;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   107  			#gpio-cells = <2>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   108  			gpio-ranges = <&pfc 0 0 28>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   109  			interrupt-controller;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   110  			#interrupt-cells = <2>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   111  		};
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   112  
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   113  		gpio1: gpio@e6050180 {
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   114  			compatible = "renesas,gpio-r8a779a0";
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   115  			reg = <0 0xe6050180 0 0x54>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   116  			interrupts = <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   117  			clocks = <&cpg CPG_MOD 915>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   118  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   119  			resets =  <&cpg 915>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   120  			gpio-controller;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   121  			#gpio-cells = <2>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   122  			gpio-ranges = <&pfc 0 32 31>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   123  			interrupt-controller;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   124  			#interrupt-cells = <2>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   125  		};
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   126  
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   127  		gpio2: gpio@e6050980 {
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   128  			compatible = "renesas,gpio-r8a779a0";
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   129  			reg = <0 0xe6050980 0 0x54>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   130  			interrupts = <GIC_SPI 840 IRQ_TYPE_LEVEL_HIGH>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   131  			clocks = <&cpg CPG_MOD 915>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   132  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   133  			resets =  <&cpg 915>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   134  			gpio-controller;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   135  			#gpio-cells = <2>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   136  			gpio-ranges = <&pfc 0 64 25>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   137  			interrupt-controller;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   138  			#interrupt-cells = <2>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   139  		};
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   140  
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   141  		gpio3: gpio@e6058980 {
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   142  			compatible = "renesas,gpio-r8a779a0";
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   143  			reg = <0 0xe6058980 0 0x54>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   144  			interrupts = <GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   145  			clocks = <&cpg CPG_MOD 916>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   146  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   147  			resets =  <&cpg 916>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   148  			gpio-controller;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   149  			#gpio-cells = <2>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   150  			gpio-ranges = <&pfc 0 96 17>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   151  			interrupt-controller;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   152  			#interrupt-cells = <2>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   153  		};
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   154  
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   155  		gpio4: gpio@e6060180 {
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   156  			compatible = "renesas,gpio-r8a779a0";
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   157  			reg = <0 0xe6060180 0 0x54>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   158  			interrupts = <GIC_SPI 848 IRQ_TYPE_LEVEL_HIGH>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   159  			clocks = <&cpg CPG_MOD 917>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   160  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   161  			resets =  <&cpg 917>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   162  			gpio-controller;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   163  			#gpio-cells = <2>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   164  			gpio-ranges = <&pfc 0 128 27>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   165  			interrupt-controller;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   166  			#interrupt-cells = <2>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   167  		};
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   168  
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   169  		gpio5: gpio@e6060980 {
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   170  			compatible = "renesas,gpio-r8a779a0";
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   171  			reg = <0 0xe6060980 0 0x54>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   172  			interrupts = <GIC_SPI 852 IRQ_TYPE_LEVEL_HIGH>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   173  			clocks = <&cpg CPG_MOD 917>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   174  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   175  			resets =  <&cpg 917>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   176  			gpio-controller;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   177  			#gpio-cells = <2>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   178  			gpio-ranges = <&pfc 0 160 21>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   179  			interrupt-controller;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   180  			#interrupt-cells = <2>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   181  		};
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   182  
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   183  		gpio6: gpio@e6068180 {
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   184  			compatible = "renesas,gpio-r8a779a0";
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   185  			reg = <0 0xe6068180 0 0x54>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   186  			interrupts = <GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   187  			clocks = <&cpg CPG_MOD 918>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   188  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   189  			resets =  <&cpg 918>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   190  			gpio-controller;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   191  			#gpio-cells = <2>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   192  			gpio-ranges = <&pfc 0 192 21>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   193  			interrupt-controller;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   194  			#interrupt-cells = <2>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   195  		};
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   196  
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   197  		gpio7: gpio@e6068980 {
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   198  			compatible = "renesas,gpio-r8a779a0";
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   199  			reg = <0 0xe6068980 0 0x54>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   200  			interrupts = <GIC_SPI 860 IRQ_TYPE_LEVEL_HIGH>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   201  			clocks = <&cpg CPG_MOD 918>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   202  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   203  			resets =  <&cpg 918>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   204  			gpio-controller;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   205  			#gpio-cells = <2>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   206  			gpio-ranges = <&pfc 0 224 21>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   207  			interrupt-controller;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   208  			#interrupt-cells = <2>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   209  		};
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   210  
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   211  		gpio8: gpio@e6069180 {
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   212  			compatible = "renesas,gpio-r8a779a0";
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   213  			reg = <0 0xe6069180 0 0x54>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   214  			interrupts = <GIC_SPI 864 IRQ_TYPE_LEVEL_HIGH>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   215  			clocks = <&cpg CPG_MOD 918>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   216  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   217  			resets =  <&cpg 918>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   218  			gpio-controller;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   219  			#gpio-cells = <2>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   220  			gpio-ranges = <&pfc 0 256 21>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   221  			interrupt-controller;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   222  			#interrupt-cells = <2>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   223  		};
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   224  
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   225  		gpio9: gpio@e6069980 {
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   226  			compatible = "renesas,gpio-r8a779a0";
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   227  			reg = <0 0xe6069980 0 0x54>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   228  			interrupts = <GIC_SPI 868 IRQ_TYPE_LEVEL_HIGH>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   229  			clocks = <&cpg CPG_MOD 918>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   230  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   231  			resets =  <&cpg 918>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   232  			gpio-controller;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   233  			#gpio-cells = <2>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   234  			gpio-ranges = <&pfc 0 288 21>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   235  			interrupt-controller;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   236  			#interrupt-cells = <2>;
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   237  		};
dfacaef96cbf87 Geert Uytterhoeven 2021-01-14   238  
7e2a95d953534e Phong Hoang        2021-03-11   239  		cmt0: timer@e60f0000 {
7e2a95d953534e Phong Hoang        2021-03-11   240  			compatible = "renesas,r8a779a0-cmt0",
7e2a95d953534e Phong Hoang        2021-03-11   241  				     "renesas,rcar-gen3-cmt0";
7e2a95d953534e Phong Hoang        2021-03-11   242  			reg = <0 0xe60f0000 0 0x1004>;
7e2a95d953534e Phong Hoang        2021-03-11   243  			interrupts = <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH>,
7e2a95d953534e Phong Hoang        2021-03-11   244  				     <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH>;
7e2a95d953534e Phong Hoang        2021-03-11   245  			clocks = <&cpg CPG_MOD 910>;
7e2a95d953534e Phong Hoang        2021-03-11   246  			clock-names = "fck";
7e2a95d953534e Phong Hoang        2021-03-11   247  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
7e2a95d953534e Phong Hoang        2021-03-11   248  			resets = <&cpg 910>;
7e2a95d953534e Phong Hoang        2021-03-11   249  			status = "disabled";
7e2a95d953534e Phong Hoang        2021-03-11   250  		};
7e2a95d953534e Phong Hoang        2021-03-11   251  
7e2a95d953534e Phong Hoang        2021-03-11   252  		cmt1: timer@e6130000 {
7e2a95d953534e Phong Hoang        2021-03-11   253  			compatible = "renesas,r8a779a0-cmt1",
7e2a95d953534e Phong Hoang        2021-03-11   254  				     "renesas,rcar-gen3-cmt1";
7e2a95d953534e Phong Hoang        2021-03-11   255  			reg = <0 0xe6130000 0 0x1004>;
7e2a95d953534e Phong Hoang        2021-03-11   256  			interrupts = <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
7e2a95d953534e Phong Hoang        2021-03-11   257  				     <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
7e2a95d953534e Phong Hoang        2021-03-11   258  				     <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
7e2a95d953534e Phong Hoang        2021-03-11   259  				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
7e2a95d953534e Phong Hoang        2021-03-11   260  				     <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
7e2a95d953534e Phong Hoang        2021-03-11   261  				     <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>,
7e2a95d953534e Phong Hoang        2021-03-11   262  				     <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>,
7e2a95d953534e Phong Hoang        2021-03-11   263  				     <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>;
7e2a95d953534e Phong Hoang        2021-03-11   264  			clocks = <&cpg CPG_MOD 911>;
7e2a95d953534e Phong Hoang        2021-03-11   265  			clock-names = "fck";
7e2a95d953534e Phong Hoang        2021-03-11   266  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
7e2a95d953534e Phong Hoang        2021-03-11   267  			resets = <&cpg 911>;
7e2a95d953534e Phong Hoang        2021-03-11   268  			status = "disabled";
7e2a95d953534e Phong Hoang        2021-03-11   269  		};
7e2a95d953534e Phong Hoang        2021-03-11   270  
7e2a95d953534e Phong Hoang        2021-03-11   271  		cmt2: timer@e6140000 {
7e2a95d953534e Phong Hoang        2021-03-11   272  			compatible = "renesas,r8a779a0-cmt1",
7e2a95d953534e Phong Hoang        2021-03-11   273  				     "renesas,rcar-gen3-cmt1";
7e2a95d953534e Phong Hoang        2021-03-11   274  			reg = <0 0xe6140000 0 0x1004>;
7e2a95d953534e Phong Hoang        2021-03-11   275  			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
7e2a95d953534e Phong Hoang        2021-03-11   276  				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
7e2a95d953534e Phong Hoang        2021-03-11   277  				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
7e2a95d953534e Phong Hoang        2021-03-11   278  				     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
7e2a95d953534e Phong Hoang        2021-03-11   279  				     <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
7e2a95d953534e Phong Hoang        2021-03-11   280  				     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
7e2a95d953534e Phong Hoang        2021-03-11   281  				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
7e2a95d953534e Phong Hoang        2021-03-11   282  				     <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>;
7e2a95d953534e Phong Hoang        2021-03-11   283  			clocks = <&cpg CPG_MOD 912>;
7e2a95d953534e Phong Hoang        2021-03-11   284  			clock-names = "fck";
7e2a95d953534e Phong Hoang        2021-03-11   285  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
7e2a95d953534e Phong Hoang        2021-03-11   286  			resets = <&cpg 912>;
7e2a95d953534e Phong Hoang        2021-03-11   287  			status = "disabled";
7e2a95d953534e Phong Hoang        2021-03-11   288  		};
7e2a95d953534e Phong Hoang        2021-03-11   289  
7e2a95d953534e Phong Hoang        2021-03-11   290  		cmt3: timer@e6148000 {
7e2a95d953534e Phong Hoang        2021-03-11   291  			compatible = "renesas,r8a779a0-cmt1",
7e2a95d953534e Phong Hoang        2021-03-11   292  				     "renesas,rcar-gen3-cmt1";
7e2a95d953534e Phong Hoang        2021-03-11   293  			reg = <0 0xe6148000 0 0x1004>;
7e2a95d953534e Phong Hoang        2021-03-11   294  			interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
7e2a95d953534e Phong Hoang        2021-03-11   295  				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
7e2a95d953534e Phong Hoang        2021-03-11   296  				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
7e2a95d953534e Phong Hoang        2021-03-11   297  				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
7e2a95d953534e Phong Hoang        2021-03-11   298  				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
7e2a95d953534e Phong Hoang        2021-03-11   299  				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
7e2a95d953534e Phong Hoang        2021-03-11   300  				     <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>,
7e2a95d953534e Phong Hoang        2021-03-11   301  				     <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>;
7e2a95d953534e Phong Hoang        2021-03-11   302  			clocks = <&cpg CPG_MOD 913>;
7e2a95d953534e Phong Hoang        2021-03-11   303  			clock-names = "fck";
7e2a95d953534e Phong Hoang        2021-03-11   304  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
7e2a95d953534e Phong Hoang        2021-03-11   305  			resets = <&cpg 913>;
7e2a95d953534e Phong Hoang        2021-03-11   306  			status = "disabled";
7e2a95d953534e Phong Hoang        2021-03-11   307  		};
7e2a95d953534e Phong Hoang        2021-03-11   308  
834c310f541839 Yoshihiro Shimoda  2020-09-10   309  		cpg: clock-controller@e6150000 {
834c310f541839 Yoshihiro Shimoda  2020-09-10   310  			compatible = "renesas,r8a779a0-cpg-mssr";
834c310f541839 Yoshihiro Shimoda  2020-09-10   311  			reg = <0 0xe6150000 0 0x4000>;
834c310f541839 Yoshihiro Shimoda  2020-09-10   312  			clocks = <&extal_clk>, <&extalr_clk>;
834c310f541839 Yoshihiro Shimoda  2020-09-10   313  			clock-names = "extal", "extalr";
834c310f541839 Yoshihiro Shimoda  2020-09-10   314  			#clock-cells = <2>;
834c310f541839 Yoshihiro Shimoda  2020-09-10   315  			#power-domain-cells = <0>;
834c310f541839 Yoshihiro Shimoda  2020-09-10   316  			#reset-cells = <1>;
834c310f541839 Yoshihiro Shimoda  2020-09-10   317  		};
834c310f541839 Yoshihiro Shimoda  2020-09-10   318  
834c310f541839 Yoshihiro Shimoda  2020-09-10   319  		rst: reset-controller@e6160000 {
834c310f541839 Yoshihiro Shimoda  2020-09-10   320  			compatible = "renesas,r8a779a0-rst";
834c310f541839 Yoshihiro Shimoda  2020-09-10   321  			reg = <0 0xe6160000 0 0x4000>;
834c310f541839 Yoshihiro Shimoda  2020-09-10   322  		};
834c310f541839 Yoshihiro Shimoda  2020-09-10   323  
834c310f541839 Yoshihiro Shimoda  2020-09-10   324  		sysc: system-controller@e6180000 {
834c310f541839 Yoshihiro Shimoda  2020-09-10   325  			compatible = "renesas,r8a779a0-sysc";
834c310f541839 Yoshihiro Shimoda  2020-09-10   326  			reg = <0 0xe6180000 0 0x4000>;
834c310f541839 Yoshihiro Shimoda  2020-09-10   327  			#power-domain-cells = <1>;
834c310f541839 Yoshihiro Shimoda  2020-09-10   328  		};
834c310f541839 Yoshihiro Shimoda  2020-09-10   329  
eab605c59a1616 Geert Uytterhoeven 2021-06-23   330  		tsc: thermal@e6190000 {
eab605c59a1616 Geert Uytterhoeven 2021-06-23   331  			compatible = "renesas,r8a779a0-thermal";
eab605c59a1616 Geert Uytterhoeven 2021-06-23   332  			reg = <0 0xe6190000 0 0x200>,
eab605c59a1616 Geert Uytterhoeven 2021-06-23   333  			      <0 0xe6198000 0 0x200>,
eab605c59a1616 Geert Uytterhoeven 2021-06-23   334  			      <0 0xe61a0000 0 0x200>,
eab605c59a1616 Geert Uytterhoeven 2021-06-23   335  			      <0 0xe61a8000 0 0x200>,
eab605c59a1616 Geert Uytterhoeven 2021-06-23   336  			      <0 0xe61b0000 0 0x200>;
eab605c59a1616 Geert Uytterhoeven 2021-06-23   337  			clocks = <&cpg CPG_MOD 919>;
eab605c59a1616 Geert Uytterhoeven 2021-06-23   338  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
eab605c59a1616 Geert Uytterhoeven 2021-06-23   339  			resets = <&cpg 919>;
eab605c59a1616 Geert Uytterhoeven 2021-06-23   340  			#thermal-sensor-cells = <1>;
eab605c59a1616 Geert Uytterhoeven 2021-06-23   341  		};
eab605c59a1616 Geert Uytterhoeven 2021-06-23   342  
596e6e1c03cadf Phong Hoang        2021-03-05   343  		tmu0: timer@e61e0000 {
596e6e1c03cadf Phong Hoang        2021-03-05   344  			compatible = "renesas,tmu-r8a779a0", "renesas,tmu";
596e6e1c03cadf Phong Hoang        2021-03-05   345  			reg = <0 0xe61e0000 0 0x30>;
596e6e1c03cadf Phong Hoang        2021-03-05   346  			interrupts = <GIC_SPI 512 IRQ_TYPE_LEVEL_HIGH>,
596e6e1c03cadf Phong Hoang        2021-03-05   347  				     <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>,
596e6e1c03cadf Phong Hoang        2021-03-05   348  				     <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>;
596e6e1c03cadf Phong Hoang        2021-03-05   349  			clocks = <&cpg CPG_MOD 713>;
596e6e1c03cadf Phong Hoang        2021-03-05   350  			clock-names = "fck";
596e6e1c03cadf Phong Hoang        2021-03-05   351  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
596e6e1c03cadf Phong Hoang        2021-03-05   352  			resets = <&cpg 713>;
596e6e1c03cadf Phong Hoang        2021-03-05   353  			status = "disabled";
596e6e1c03cadf Phong Hoang        2021-03-05   354  		};
596e6e1c03cadf Phong Hoang        2021-03-05   355  
596e6e1c03cadf Phong Hoang        2021-03-05   356  		tmu1: timer@e6fc0000 {
596e6e1c03cadf Phong Hoang        2021-03-05   357  			compatible = "renesas,tmu-r8a779a0", "renesas,tmu";
596e6e1c03cadf Phong Hoang        2021-03-05   358  			reg = <0 0xe6fc0000 0 0x30>;
596e6e1c03cadf Phong Hoang        2021-03-05   359  			interrupts = <GIC_SPI 504 IRQ_TYPE_LEVEL_HIGH>,
596e6e1c03cadf Phong Hoang        2021-03-05   360  				     <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH>,
596e6e1c03cadf Phong Hoang        2021-03-05   361  				     <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
596e6e1c03cadf Phong Hoang        2021-03-05   362  			clocks = <&cpg CPG_MOD 714>;
596e6e1c03cadf Phong Hoang        2021-03-05   363  			clock-names = "fck";
596e6e1c03cadf Phong Hoang        2021-03-05   364  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
596e6e1c03cadf Phong Hoang        2021-03-05   365  			resets = <&cpg 714>;
596e6e1c03cadf Phong Hoang        2021-03-05   366  			status = "disabled";
596e6e1c03cadf Phong Hoang        2021-03-05   367  		};
596e6e1c03cadf Phong Hoang        2021-03-05   368  
596e6e1c03cadf Phong Hoang        2021-03-05   369  		tmu2: timer@e6fd0000 {
596e6e1c03cadf Phong Hoang        2021-03-05   370  			compatible = "renesas,tmu-r8a779a0", "renesas,tmu";
596e6e1c03cadf Phong Hoang        2021-03-05   371  			reg = <0 0xe6fd0000 0 0x30>;
596e6e1c03cadf Phong Hoang        2021-03-05   372  			interrupts = <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
596e6e1c03cadf Phong Hoang        2021-03-05   373  				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>,
596e6e1c03cadf Phong Hoang        2021-03-05   374  				     <GIC_SPI 510 IRQ_TYPE_LEVEL_HIGH>;
596e6e1c03cadf Phong Hoang        2021-03-05   375  			clocks = <&cpg CPG_MOD 715>;
596e6e1c03cadf Phong Hoang        2021-03-05   376  			clock-names = "fck";
596e6e1c03cadf Phong Hoang        2021-03-05   377  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
596e6e1c03cadf Phong Hoang        2021-03-05   378  			resets = <&cpg 715>;
596e6e1c03cadf Phong Hoang        2021-03-05   379  			status = "disabled";
596e6e1c03cadf Phong Hoang        2021-03-05   380  		};
596e6e1c03cadf Phong Hoang        2021-03-05   381  
596e6e1c03cadf Phong Hoang        2021-03-05   382  		tmu3: timer@e6fe0000 {
596e6e1c03cadf Phong Hoang        2021-03-05   383  			compatible = "renesas,tmu-r8a779a0", "renesas,tmu";
596e6e1c03cadf Phong Hoang        2021-03-05   384  			reg = <0 0xe6fe0000 0 0x30>;
596e6e1c03cadf Phong Hoang        2021-03-05   385  			interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
596e6e1c03cadf Phong Hoang        2021-03-05   386  				     <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
596e6e1c03cadf Phong Hoang        2021-03-05   387  				     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
596e6e1c03cadf Phong Hoang        2021-03-05   388  			clocks = <&cpg CPG_MOD 716>;
596e6e1c03cadf Phong Hoang        2021-03-05   389  			clock-names = "fck";
596e6e1c03cadf Phong Hoang        2021-03-05   390  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
596e6e1c03cadf Phong Hoang        2021-03-05   391  			resets = <&cpg 716>;
596e6e1c03cadf Phong Hoang        2021-03-05   392  			status = "disabled";
596e6e1c03cadf Phong Hoang        2021-03-05   393  		};
596e6e1c03cadf Phong Hoang        2021-03-05   394  
596e6e1c03cadf Phong Hoang        2021-03-05   395  		tmu4: timer@ffc00000 {
596e6e1c03cadf Phong Hoang        2021-03-05   396  			compatible = "renesas,tmu-r8a779a0", "renesas,tmu";
596e6e1c03cadf Phong Hoang        2021-03-05   397  			reg = <0 0xffc00000 0 0x30>;
596e6e1c03cadf Phong Hoang        2021-03-05   398  			interrupts = <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
596e6e1c03cadf Phong Hoang        2021-03-05   399  				     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
596e6e1c03cadf Phong Hoang        2021-03-05   400  				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>;
596e6e1c03cadf Phong Hoang        2021-03-05   401  			clocks = <&cpg CPG_MOD 717>;
596e6e1c03cadf Phong Hoang        2021-03-05   402  			clock-names = "fck";
596e6e1c03cadf Phong Hoang        2021-03-05   403  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
596e6e1c03cadf Phong Hoang        2021-03-05   404  			resets = <&cpg 717>;
596e6e1c03cadf Phong Hoang        2021-03-05   405  			status = "disabled";
596e6e1c03cadf Phong Hoang        2021-03-05   406  		};
596e6e1c03cadf Phong Hoang        2021-03-05   407  
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   408  		i2c0: i2c@e6500000 {
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   409  			compatible = "renesas,i2c-r8a779a0",
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   410  				     "renesas,rcar-gen3-i2c";
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   411  			reg = <0 0xe6500000 0 0x40>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   412  			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   413  			clocks = <&cpg CPG_MOD 518>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   414  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   415  			resets = <&cpg 518>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   416  			dmas = <&dmac1 0x91>, <&dmac1 0x90>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   417  			dma-names = "tx", "rx";
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   418  			i2c-scl-internal-delay-ns = <110>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   419  			#address-cells = <1>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   420  			#size-cells = <0>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   421  			status = "disabled";
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   422  		};
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   423  
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   424  		i2c1: i2c@e6508000 {
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   425  			compatible = "renesas,i2c-r8a779a0",
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   426  				     "renesas,rcar-gen3-i2c";
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   427  			reg = <0 0xe6508000 0 0x40>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   428  			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   429  			clocks = <&cpg CPG_MOD 519>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   430  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   431  			resets = <&cpg 519>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   432  			dmas = <&dmac1 0x93>, <&dmac1 0x92>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   433  			dma-names = "tx", "rx";
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   434  			i2c-scl-internal-delay-ns = <110>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   435  			#address-cells = <1>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   436  			#size-cells = <0>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   437  			status = "disabled";
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   438  		};
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   439  
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   440  		i2c2: i2c@e6510000 {
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   441  			compatible = "renesas,i2c-r8a779a0",
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   442  				     "renesas,rcar-gen3-i2c";
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   443  			reg = <0 0xe6510000 0 0x40>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   444  			interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   445  			clocks = <&cpg CPG_MOD 520>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   446  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   447  			resets = <&cpg 520>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   448  			dmas = <&dmac1 0x95>, <&dmac1 0x94>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   449  			dma-names = "tx", "rx";
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   450  			i2c-scl-internal-delay-ns = <110>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   451  			#address-cells = <1>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   452  			#size-cells = <0>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   453  			status = "disabled";
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   454  		};
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   455  
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   456  		i2c3: i2c@e66d0000 {
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   457  			compatible = "renesas,i2c-r8a779a0",
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   458  				     "renesas,rcar-gen3-i2c";
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   459  			reg = <0 0xe66d0000 0 0x40>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   460  			interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   461  			clocks = <&cpg CPG_MOD 521>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   462  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   463  			resets = <&cpg 521>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   464  			dmas = <&dmac1 0x97>, <&dmac1 0x96>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   465  			dma-names = "tx", "rx";
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   466  			i2c-scl-internal-delay-ns = <110>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   467  			#address-cells = <1>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   468  			#size-cells = <0>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   469  			status = "disabled";
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   470  		};
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   471  
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   472  		i2c4: i2c@e66d8000 {
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   473  			compatible = "renesas,i2c-r8a779a0",
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   474  				     "renesas,rcar-gen3-i2c";
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   475  			reg = <0 0xe66d8000 0 0x40>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   476  			interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   477  			clocks = <&cpg CPG_MOD 522>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   478  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   479  			resets = <&cpg 522>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   480  			dmas = <&dmac1 0x99>, <&dmac1 0x98>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   481  			dma-names = "tx", "rx";
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   482  			i2c-scl-internal-delay-ns = <110>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   483  			#address-cells = <1>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   484  			#size-cells = <0>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   485  			status = "disabled";
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   486  		};
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   487  
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   488  		i2c5: i2c@e66e0000 {
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   489  			compatible = "renesas,i2c-r8a779a0",
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   490  				     "renesas,rcar-gen3-i2c";
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   491  			reg = <0 0xe66e0000 0 0x40>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   492  			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   493  			clocks = <&cpg CPG_MOD 523>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   494  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   495  			resets = <&cpg 523>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   496  			dmas = <&dmac1 0x9b>, <&dmac1 0x9a>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   497  			dma-names = "tx", "rx";
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   498  			i2c-scl-internal-delay-ns = <110>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   499  			#address-cells = <1>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   500  			#size-cells = <0>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   501  			status = "disabled";
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   502  		};
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   503  
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   504  		i2c6: i2c@e66e8000 {
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   505  			compatible = "renesas,i2c-r8a779a0",
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   506  				     "renesas,rcar-gen3-i2c";
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   507  			reg = <0 0xe66e8000 0 0x40>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   508  			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   509  			clocks = <&cpg CPG_MOD 524>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   510  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   511  			resets = <&cpg 524>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   512  			dmas = <&dmac1 0x9d>, <&dmac1 0x9c>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   513  			dma-names = "tx", "rx";
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   514  			i2c-scl-internal-delay-ns = <110>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   515  			#address-cells = <1>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   516  			#size-cells = <0>;
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   517  			status = "disabled";
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   518  		};
34c0e3e1111bf0 Koji Matsuoka      2021-01-21   519  
088e6b23050487 Linh Phung         2021-01-21   520  		hscif0: serial@e6540000 {
088e6b23050487 Linh Phung         2021-01-21   521  			compatible = "renesas,hscif-r8a779a0",
088e6b23050487 Linh Phung         2021-01-21   522  				     "renesas,rcar-gen3-hscif", "renesas,hscif";
088e6b23050487 Linh Phung         2021-01-21   523  			reg = <0 0xe6540000 0 0x60>;
088e6b23050487 Linh Phung         2021-01-21   524  			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
088e6b23050487 Linh Phung         2021-01-21   525  			clocks = <&cpg CPG_MOD 514>,
088e6b23050487 Linh Phung         2021-01-21   526  				 <&cpg CPG_CORE R8A779A0_CLK_S1D2>,
088e6b23050487 Linh Phung         2021-01-21   527  				 <&scif_clk>;
088e6b23050487 Linh Phung         2021-01-21   528  			clock-names = "fck", "brg_int", "scif_clk";
088e6b23050487 Linh Phung         2021-01-21   529  			dmas = <&dmac1 0x31>, <&dmac1 0x30>;
088e6b23050487 Linh Phung         2021-01-21   530  			dma-names = "tx", "rx";
088e6b23050487 Linh Phung         2021-01-21   531  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
088e6b23050487 Linh Phung         2021-01-21   532  			resets = <&cpg 514>;
088e6b23050487 Linh Phung         2021-01-21   533  			status = "disabled";
088e6b23050487 Linh Phung         2021-01-21   534  		};
088e6b23050487 Linh Phung         2021-01-21   535  
088e6b23050487 Linh Phung         2021-01-21   536  		hscif1: serial@e6550000 {
088e6b23050487 Linh Phung         2021-01-21   537  			compatible = "renesas,hscif-r8a779a0",
088e6b23050487 Linh Phung         2021-01-21   538  				     "renesas,rcar-gen3-hscif", "renesas,hscif";
088e6b23050487 Linh Phung         2021-01-21   539  			reg = <0 0xe6550000 0 0x60>;
088e6b23050487 Linh Phung         2021-01-21   540  			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
088e6b23050487 Linh Phung         2021-01-21   541  			clocks = <&cpg CPG_MOD 515>,
088e6b23050487 Linh Phung         2021-01-21   542  				 <&cpg CPG_CORE R8A779A0_CLK_S1D2>,
088e6b23050487 Linh Phung         2021-01-21   543  				 <&scif_clk>;
088e6b23050487 Linh Phung         2021-01-21   544  			clock-names = "fck", "brg_int", "scif_clk";
088e6b23050487 Linh Phung         2021-01-21   545  			dmas = <&dmac1 0x33>, <&dmac1 0x32>;
088e6b23050487 Linh Phung         2021-01-21   546  			dma-names = "tx", "rx";
088e6b23050487 Linh Phung         2021-01-21   547  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
088e6b23050487 Linh Phung         2021-01-21   548  			resets = <&cpg 515>;
088e6b23050487 Linh Phung         2021-01-21   549  			status = "disabled";
088e6b23050487 Linh Phung         2021-01-21   550  		};
088e6b23050487 Linh Phung         2021-01-21   551  
088e6b23050487 Linh Phung         2021-01-21   552  		hscif2: serial@e6560000 {
088e6b23050487 Linh Phung         2021-01-21   553  			compatible = "renesas,hscif-r8a779a0",
088e6b23050487 Linh Phung         2021-01-21   554  				     "renesas,rcar-gen3-hscif", "renesas,hscif";
088e6b23050487 Linh Phung         2021-01-21   555  			reg = <0 0xe6560000 0 0x60>;
088e6b23050487 Linh Phung         2021-01-21   556  			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
088e6b23050487 Linh Phung         2021-01-21   557  			clocks = <&cpg CPG_MOD 516>,
088e6b23050487 Linh Phung         2021-01-21   558  				 <&cpg CPG_CORE R8A779A0_CLK_S1D2>,
088e6b23050487 Linh Phung         2021-01-21   559  				 <&scif_clk>;
088e6b23050487 Linh Phung         2021-01-21   560  			clock-names = "fck", "brg_int", "scif_clk";
088e6b23050487 Linh Phung         2021-01-21   561  			dmas = <&dmac1 0x35>, <&dmac1 0x34>;
088e6b23050487 Linh Phung         2021-01-21   562  			dma-names = "tx", "rx";
088e6b23050487 Linh Phung         2021-01-21   563  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
088e6b23050487 Linh Phung         2021-01-21   564  			resets = <&cpg 516>;
088e6b23050487 Linh Phung         2021-01-21   565  			status = "disabled";
088e6b23050487 Linh Phung         2021-01-21   566  		};
088e6b23050487 Linh Phung         2021-01-21   567  
088e6b23050487 Linh Phung         2021-01-21   568  		hscif3: serial@e66a0000 {
088e6b23050487 Linh Phung         2021-01-21   569  			compatible = "renesas,hscif-r8a779a0",
088e6b23050487 Linh Phung         2021-01-21   570  				     "renesas,rcar-gen3-hscif", "renesas,hscif";
088e6b23050487 Linh Phung         2021-01-21   571  			reg = <0 0xe66a0000 0 0x60>;
088e6b23050487 Linh Phung         2021-01-21   572  			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
088e6b23050487 Linh Phung         2021-01-21   573  			clocks = <&cpg CPG_MOD 517>,
088e6b23050487 Linh Phung         2021-01-21   574  				 <&cpg CPG_CORE R8A779A0_CLK_S1D2>,
088e6b23050487 Linh Phung         2021-01-21   575  				 <&scif_clk>;
088e6b23050487 Linh Phung         2021-01-21   576  			clock-names = "fck", "brg_int", "scif_clk";
088e6b23050487 Linh Phung         2021-01-21   577  			dmas = <&dmac1 0x37>, <&dmac1 0x36>;
088e6b23050487 Linh Phung         2021-01-21   578  			dma-names = "tx", "rx";
088e6b23050487 Linh Phung         2021-01-21   579  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
088e6b23050487 Linh Phung         2021-01-21   580  			resets = <&cpg 517>;
088e6b23050487 Linh Phung         2021-01-21   581  			status = "disabled";
088e6b23050487 Linh Phung         2021-01-21   582  		};
088e6b23050487 Linh Phung         2021-01-21   583  
5a633320f08b8c Tho Vu             2021-01-21   584  		avb0: ethernet@e6800000 {
5a633320f08b8c Tho Vu             2021-01-21   585  			compatible = "renesas,etheravb-r8a779a0",
5a633320f08b8c Tho Vu             2021-01-21   586  				     "renesas,etheravb-rcar-gen3";
5a633320f08b8c Tho Vu             2021-01-21   587  			reg = <0 0xe6800000 0 0x800>;
5a633320f08b8c Tho Vu             2021-01-21   588  			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   589  				     <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   590  				     <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   591  				     <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   592  				     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   593  				     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   594  				     <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   595  				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   596  				     <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   597  				     <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   598  				     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   599  				     <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   600  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   601  				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   602  				     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   603  				     <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   604  				     <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   605  				     <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   606  				     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   607  				     <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   608  				     <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   609  				     <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   610  				     <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   611  				     <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   612  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>;
5a633320f08b8c Tho Vu             2021-01-21   613  			interrupt-names = "ch0", "ch1", "ch2", "ch3",
5a633320f08b8c Tho Vu             2021-01-21   614  					  "ch4", "ch5", "ch6", "ch7",
5a633320f08b8c Tho Vu             2021-01-21   615  					  "ch8", "ch9", "ch10", "ch11",
5a633320f08b8c Tho Vu             2021-01-21   616  					  "ch12", "ch13", "ch14", "ch15",
5a633320f08b8c Tho Vu             2021-01-21   617  					  "ch16", "ch17", "ch18", "ch19",
5a633320f08b8c Tho Vu             2021-01-21   618  					  "ch20", "ch21", "ch22", "ch23",
5a633320f08b8c Tho Vu             2021-01-21   619  					  "ch24";
5a633320f08b8c Tho Vu             2021-01-21   620  			clocks = <&cpg CPG_MOD 211>;
56ed0b3b10fd28 Adam Ford          2021-02-24   621  			clock-names = "fck";
5a633320f08b8c Tho Vu             2021-01-21   622  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
5a633320f08b8c Tho Vu             2021-01-21   623  			resets = <&cpg 211>;
5a633320f08b8c Tho Vu             2021-01-21   624  			phy-mode = "rgmii";
5a633320f08b8c Tho Vu             2021-01-21   625  			rx-internal-delay-ps = <0>;
5a633320f08b8c Tho Vu             2021-01-21   626  			tx-internal-delay-ps = <0>;
5a633320f08b8c Tho Vu             2021-01-21   627  			#address-cells = <1>;
5a633320f08b8c Tho Vu             2021-01-21   628  			#size-cells = <0>;
5a633320f08b8c Tho Vu             2021-01-21   629  			status = "disabled";
5a633320f08b8c Tho Vu             2021-01-21   630  		};
5a633320f08b8c Tho Vu             2021-01-21   631  
5a633320f08b8c Tho Vu             2021-01-21   632  		avb1: ethernet@e6810000 {
5a633320f08b8c Tho Vu             2021-01-21   633  			compatible = "renesas,etheravb-r8a779a0",
5a633320f08b8c Tho Vu             2021-01-21   634  				     "renesas,etheravb-rcar-gen3";
5a633320f08b8c Tho Vu             2021-01-21   635  			reg = <0 0xe6810000 0 0x800>;
5a633320f08b8c Tho Vu             2021-01-21   636  			interrupts = <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   637  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   638  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   639  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   640  				     <GIC_SPI 285 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   641  				     <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   642  				     <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   643  				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   644  				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   645  				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   646  				     <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   647  				     <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   648  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   649  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   650  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   651  				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   652  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   653  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   654  				     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   655  				     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   656  				     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   657  				     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   658  				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   659  				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   660  				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
5a633320f08b8c Tho Vu             2021-01-21   661  			interrupt-names = "ch0", "ch1", "ch2", "ch3",
5a633320f08b8c Tho Vu             2021-01-21   662  					  "ch4", "ch5", "ch6", "ch7",
5a633320f08b8c Tho Vu             2021-01-21   663  					  "ch8", "ch9", "ch10", "ch11",
5a633320f08b8c Tho Vu             2021-01-21   664  					  "ch12", "ch13", "ch14", "ch15",
5a633320f08b8c Tho Vu             2021-01-21   665  					  "ch16", "ch17", "ch18", "ch19",
5a633320f08b8c Tho Vu             2021-01-21   666  					  "ch20", "ch21", "ch22", "ch23",
5a633320f08b8c Tho Vu             2021-01-21   667  					  "ch24";
5a633320f08b8c Tho Vu             2021-01-21   668  			clocks = <&cpg CPG_MOD 212>;
56ed0b3b10fd28 Adam Ford          2021-02-24   669  			clock-names = "fck";
5a633320f08b8c Tho Vu             2021-01-21   670  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
5a633320f08b8c Tho Vu             2021-01-21   671  			resets = <&cpg 212>;
5a633320f08b8c Tho Vu             2021-01-21   672  			phy-mode = "rgmii";
5a633320f08b8c Tho Vu             2021-01-21   673  			rx-internal-delay-ps = <0>;
5a633320f08b8c Tho Vu             2021-01-21   674  			tx-internal-delay-ps = <0>;
5a633320f08b8c Tho Vu             2021-01-21   675  			#address-cells = <1>;
5a633320f08b8c Tho Vu             2021-01-21   676  			#size-cells = <0>;
5a633320f08b8c Tho Vu             2021-01-21   677  			status = "disabled";
5a633320f08b8c Tho Vu             2021-01-21   678  		};
5a633320f08b8c Tho Vu             2021-01-21   679  
5a633320f08b8c Tho Vu             2021-01-21   680  		avb2: ethernet@e6820000 {
5a633320f08b8c Tho Vu             2021-01-21   681  			compatible = "renesas,etheravb-r8a779a0",
5a633320f08b8c Tho Vu             2021-01-21   682  				     "renesas,etheravb-rcar-gen3";
5a633320f08b8c Tho Vu             2021-01-21   683  			reg = <0 0xe6820000 0 0x1000>;
5a633320f08b8c Tho Vu             2021-01-21   684  			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   685  					<GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   686  					<GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   687  					<GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   688  					<GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   689  					<GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   690  					<GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   691  					<GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   692  					<GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   693  					<GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   694  					<GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   695  					<GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   696  					<GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   697  					<GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   698  					<GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   699  					<GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   700  					<GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   701  					<GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   702  					<GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   703  					<GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   704  					<GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   705  					<GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   706  					<GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   707  					<GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   708  					<GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>;
5a633320f08b8c Tho Vu             2021-01-21   709  			interrupt-names = "ch0", "ch1", "ch2", "ch3",
5a633320f08b8c Tho Vu             2021-01-21   710  					"ch4", "ch5", "ch6", "ch7",
5a633320f08b8c Tho Vu             2021-01-21   711  					"ch8", "ch9", "ch10", "ch11",
5a633320f08b8c Tho Vu             2021-01-21   712  					"ch12", "ch13", "ch14", "ch15",
5a633320f08b8c Tho Vu             2021-01-21   713  					"ch16", "ch17", "ch18", "ch19",
5a633320f08b8c Tho Vu             2021-01-21   714  					"ch20", "ch21", "ch22", "ch23",
5a633320f08b8c Tho Vu             2021-01-21   715  					"ch24";
5a633320f08b8c Tho Vu             2021-01-21   716  			clocks = <&cpg CPG_MOD 213>;
56ed0b3b10fd28 Adam Ford          2021-02-24   717  			clock-names = "fck";
5a633320f08b8c Tho Vu             2021-01-21   718  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
5a633320f08b8c Tho Vu             2021-01-21   719  			resets = <&cpg 213>;
5a633320f08b8c Tho Vu             2021-01-21   720  			phy-mode = "rgmii";
5a633320f08b8c Tho Vu             2021-01-21   721  			rx-internal-delay-ps = <0>;
5a633320f08b8c Tho Vu             2021-01-21   722  			tx-internal-delay-ps = <0>;
5a633320f08b8c Tho Vu             2021-01-21   723  			#address-cells = <1>;
5a633320f08b8c Tho Vu             2021-01-21   724  			#size-cells = <0>;
5a633320f08b8c Tho Vu             2021-01-21   725  			status = "disabled";
5a633320f08b8c Tho Vu             2021-01-21   726  		};
5a633320f08b8c Tho Vu             2021-01-21   727  
5a633320f08b8c Tho Vu             2021-01-21   728  		avb3: ethernet@e6830000 {
5a633320f08b8c Tho Vu             2021-01-21   729  			compatible = "renesas,etheravb-r8a779a0",
5a633320f08b8c Tho Vu             2021-01-21   730  				     "renesas,etheravb-rcar-gen3";
5a633320f08b8c Tho Vu             2021-01-21   731  			reg = <0 0xe6830000 0 0x1000>;
5a633320f08b8c Tho Vu             2021-01-21   732  			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   733  					<GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   734  					<GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   735  					<GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   736  					<GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   737  					<GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   738  					<GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   739  					<GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   740  					<GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   741  					<GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   742  					<GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   743  					<GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   744  					<GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   745  					<GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   746  					<GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   747  					<GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   748  					<GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   749  					<GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   750  					<GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   751  					<GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   752  					<GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   753  					<GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   754  					<GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   755  					<GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   756  					<GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
5a633320f08b8c Tho Vu             2021-01-21   757  			interrupt-names = "ch0", "ch1", "ch2", "ch3",
5a633320f08b8c Tho Vu             2021-01-21   758  					"ch4", "ch5", "ch6", "ch7",
5a633320f08b8c Tho Vu             2021-01-21   759  					"ch8", "ch9", "ch10", "ch11",
5a633320f08b8c Tho Vu             2021-01-21   760  					"ch12", "ch13", "ch14", "ch15",
5a633320f08b8c Tho Vu             2021-01-21   761  					"ch16", "ch17", "ch18", "ch19",
5a633320f08b8c Tho Vu             2021-01-21   762  					"ch20", "ch21", "ch22", "ch23",
5a633320f08b8c Tho Vu             2021-01-21   763  					"ch24";
5a633320f08b8c Tho Vu             2021-01-21   764  			clocks = <&cpg CPG_MOD 214>;
56ed0b3b10fd28 Adam Ford          2021-02-24   765  			clock-names = "fck";
5a633320f08b8c Tho Vu             2021-01-21   766  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
5a633320f08b8c Tho Vu             2021-01-21   767  			resets = <&cpg 214>;
5a633320f08b8c Tho Vu             2021-01-21   768  			phy-mode = "rgmii";
5a633320f08b8c Tho Vu             2021-01-21   769  			rx-internal-delay-ps = <0>;
5a633320f08b8c Tho Vu             2021-01-21   770  			tx-internal-delay-ps = <0>;
5a633320f08b8c Tho Vu             2021-01-21   771  			#address-cells = <1>;
5a633320f08b8c Tho Vu             2021-01-21   772  			#size-cells = <0>;
5a633320f08b8c Tho Vu             2021-01-21   773  			status = "disabled";
5a633320f08b8c Tho Vu             2021-01-21   774  		};
5a633320f08b8c Tho Vu             2021-01-21   775  
5a633320f08b8c Tho Vu             2021-01-21   776  		avb4: ethernet@e6840000 {
5a633320f08b8c Tho Vu             2021-01-21   777  			compatible = "renesas,etheravb-r8a779a0",
5a633320f08b8c Tho Vu             2021-01-21   778  				     "renesas,etheravb-rcar-gen3";
5a633320f08b8c Tho Vu             2021-01-21   779  			reg = <0 0xe6840000 0 0x1000>;
5a633320f08b8c Tho Vu             2021-01-21   780  			interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   781  					<GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   782  					<GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   783  					<GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   784  					<GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   785  					<GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   786  					<GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   787  					<GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   788  					<GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   789  					<GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   790  					<GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   791  					<GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   792  					<GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   793  					<GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   794  					<GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   795  					<GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   796  					<GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   797  					<GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   798  					<GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   799  					<GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   800  					<GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   801  					<GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   802  					<GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   803  					<GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   804  					<GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>;
5a633320f08b8c Tho Vu             2021-01-21   805  			interrupt-names = "ch0", "ch1", "ch2", "ch3",
5a633320f08b8c Tho Vu             2021-01-21   806  					"ch4", "ch5", "ch6", "ch7",
5a633320f08b8c Tho Vu             2021-01-21   807  					"ch8", "ch9", "ch10", "ch11",
5a633320f08b8c Tho Vu             2021-01-21   808  					"ch12", "ch13", "ch14", "ch15",
5a633320f08b8c Tho Vu             2021-01-21   809  					"ch16", "ch17", "ch18", "ch19",
5a633320f08b8c Tho Vu             2021-01-21   810  					"ch20", "ch21", "ch22", "ch23",
5a633320f08b8c Tho Vu             2021-01-21   811  					"ch24";
5a633320f08b8c Tho Vu             2021-01-21   812  			clocks = <&cpg CPG_MOD 215>;
56ed0b3b10fd28 Adam Ford          2021-02-24   813  			clock-names = "fck";
5a633320f08b8c Tho Vu             2021-01-21   814  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
5a633320f08b8c Tho Vu             2021-01-21   815  			resets = <&cpg 215>;
5a633320f08b8c Tho Vu             2021-01-21   816  			phy-mode = "rgmii";
5a633320f08b8c Tho Vu             2021-01-21   817  			rx-internal-delay-ps = <0>;
5a633320f08b8c Tho Vu             2021-01-21   818  			tx-internal-delay-ps = <0>;
5a633320f08b8c Tho Vu             2021-01-21   819  			#address-cells = <1>;
5a633320f08b8c Tho Vu             2021-01-21   820  			#size-cells = <0>;
5a633320f08b8c Tho Vu             2021-01-21   821  			status = "disabled";
5a633320f08b8c Tho Vu             2021-01-21   822  		};
5a633320f08b8c Tho Vu             2021-01-21   823  
5a633320f08b8c Tho Vu             2021-01-21   824  		avb5: ethernet@e6850000 {
5a633320f08b8c Tho Vu             2021-01-21   825  			compatible = "renesas,etheravb-r8a779a0",
5a633320f08b8c Tho Vu             2021-01-21   826  				     "renesas,etheravb-rcar-gen3";
5a633320f08b8c Tho Vu             2021-01-21   827  			reg = <0 0xe6850000 0 0x1000>;
5a633320f08b8c Tho Vu             2021-01-21   828  			interrupts = <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   829  					<GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   830  					<GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   831  					<GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   832  					<GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   833  					<GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   834  					<GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   835  					<GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   836  					<GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   837  					<GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   838  					<GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   839  					<GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   840  					<GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   841  					<GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   842  					<GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   843  					<GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   844  					<GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   845  					<GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   846  					<GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   847  					<GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   848  					<GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   849  					<GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   850  					<GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   851  					<GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
5a633320f08b8c Tho Vu             2021-01-21   852  					<GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>;
5a633320f08b8c Tho Vu             2021-01-21   853  			interrupt-names = "ch0", "ch1", "ch2", "ch3",
5a633320f08b8c Tho Vu             2021-01-21   854  					"ch4", "ch5", "ch6", "ch7",
5a633320f08b8c Tho Vu             2021-01-21   855  					"ch8", "ch9", "ch10", "ch11",
5a633320f08b8c Tho Vu             2021-01-21   856  					"ch12", "ch13", "ch14", "ch15",
5a633320f08b8c Tho Vu             2021-01-21   857  					"ch16", "ch17", "ch18", "ch19",
5a633320f08b8c Tho Vu             2021-01-21   858  					"ch20", "ch21", "ch22", "ch23",
5a633320f08b8c Tho Vu             2021-01-21   859  					"ch24";
5a633320f08b8c Tho Vu             2021-01-21   860  			clocks = <&cpg CPG_MOD 216>;
56ed0b3b10fd28 Adam Ford          2021-02-24   861  			clock-names = "fck";
5a633320f08b8c Tho Vu             2021-01-21   862  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
5a633320f08b8c Tho Vu             2021-01-21   863  			resets = <&cpg 216>;
5a633320f08b8c Tho Vu             2021-01-21   864  			phy-mode = "rgmii";
5a633320f08b8c Tho Vu             2021-01-21   865  			rx-internal-delay-ps = <0>;
5a633320f08b8c Tho Vu             2021-01-21   866  			tx-internal-delay-ps = <0>;
5a633320f08b8c Tho Vu             2021-01-21   867  			#address-cells = <1>;
5a633320f08b8c Tho Vu             2021-01-21   868  			#size-cells = <0>;
5a633320f08b8c Tho Vu             2021-01-21   869  			status = "disabled";
5a633320f08b8c Tho Vu             2021-01-21   870  		};
5a633320f08b8c Tho Vu             2021-01-21   871  
834c310f541839 Yoshihiro Shimoda  2020-09-10   872  		scif0: serial@e6e60000 {
834c310f541839 Yoshihiro Shimoda  2020-09-10   873  			compatible = "renesas,scif-r8a779a0",
834c310f541839 Yoshihiro Shimoda  2020-09-10   874  				     "renesas,rcar-gen3-scif", "renesas,scif";
834c310f541839 Yoshihiro Shimoda  2020-09-10   875  			reg = <0 0xe6e60000 0 64>;
834c310f541839 Yoshihiro Shimoda  2020-09-10   876  			interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
834c310f541839 Yoshihiro Shimoda  2020-09-10   877  			clocks = <&cpg CPG_MOD 702>,
834c310f541839 Yoshihiro Shimoda  2020-09-10   878  				 <&cpg CPG_CORE R8A779A0_CLK_S1D2>,
834c310f541839 Yoshihiro Shimoda  2020-09-10   879  				 <&scif_clk>;
834c310f541839 Yoshihiro Shimoda  2020-09-10   880  			clock-names = "fck", "brg_int", "scif_clk";
bff4e5dac9992b Wolfram Sang       2021-01-21   881  			dmas = <&dmac1 0x51>, <&dmac1 0x50>;
bff4e5dac9992b Wolfram Sang       2021-01-21   882  			dma-names = "tx", "rx";
834c310f541839 Yoshihiro Shimoda  2020-09-10   883  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
834c310f541839 Yoshihiro Shimoda  2020-09-10   884  			resets = <&cpg 702>;
834c310f541839 Yoshihiro Shimoda  2020-09-10   885  			status = "disabled";
834c310f541839 Yoshihiro Shimoda  2020-09-10   886  		};
834c310f541839 Yoshihiro Shimoda  2020-09-10   887  
bff4e5dac9992b Wolfram Sang       2021-01-21   888  		scif1: serial@e6e68000 {
bff4e5dac9992b Wolfram Sang       2021-01-21   889  			compatible = "renesas,scif-r8a779a0",
bff4e5dac9992b Wolfram Sang       2021-01-21   890  				     "renesas,rcar-gen3-scif", "renesas,scif";
bff4e5dac9992b Wolfram Sang       2021-01-21   891  			reg = <0 0xe6e68000 0 64>;
bff4e5dac9992b Wolfram Sang       2021-01-21   892  			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
bff4e5dac9992b Wolfram Sang       2021-01-21   893  			clocks = <&cpg CPG_MOD 703>,
bff4e5dac9992b Wolfram Sang       2021-01-21   894  				 <&cpg CPG_CORE R8A779A0_CLK_S1D2>,
bff4e5dac9992b Wolfram Sang       2021-01-21   895  				 <&scif_clk>;
bff4e5dac9992b Wolfram Sang       2021-01-21   896  			clock-names = "fck", "brg_int", "scif_clk";
bff4e5dac9992b Wolfram Sang       2021-01-21   897  			dmas = <&dmac1 0x53>, <&dmac1 0x52>;
bff4e5dac9992b Wolfram Sang       2021-01-21   898  			dma-names = "tx", "rx";
bff4e5dac9992b Wolfram Sang       2021-01-21   899  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
bff4e5dac9992b Wolfram Sang       2021-01-21   900  			resets = <&cpg 703>;
bff4e5dac9992b Wolfram Sang       2021-01-21   901  			status = "disabled";
bff4e5dac9992b Wolfram Sang       2021-01-21   902  		};
bff4e5dac9992b Wolfram Sang       2021-01-21   903  
bff4e5dac9992b Wolfram Sang       2021-01-21   904  		scif3: serial@e6c50000 {
bff4e5dac9992b Wolfram Sang       2021-01-21   905  			compatible = "renesas,scif-r8a779a0",
bff4e5dac9992b Wolfram Sang       2021-01-21   906  				     "renesas,rcar-gen3-scif", "renesas,scif";
bff4e5dac9992b Wolfram Sang       2021-01-21   907  			reg = <0 0xe6c50000 0 64>;
bff4e5dac9992b Wolfram Sang       2021-01-21   908  			interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
bff4e5dac9992b Wolfram Sang       2021-01-21   909  			clocks = <&cpg CPG_MOD 704>,
bff4e5dac9992b Wolfram Sang       2021-01-21   910  				 <&cpg CPG_CORE R8A779A0_CLK_S1D2>,
bff4e5dac9992b Wolfram Sang       2021-01-21   911  				 <&scif_clk>;
bff4e5dac9992b Wolfram Sang       2021-01-21   912  			clock-names = "fck", "brg_int", "scif_clk";
bff4e5dac9992b Wolfram Sang       2021-01-21   913  			dmas = <&dmac1 0x57>, <&dmac1 0x56>;
bff4e5dac9992b Wolfram Sang       2021-01-21   914  			dma-names = "tx", "rx";
bff4e5dac9992b Wolfram Sang       2021-01-21   915  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
bff4e5dac9992b Wolfram Sang       2021-01-21   916  			resets = <&cpg 704>;
bff4e5dac9992b Wolfram Sang       2021-01-21   917  			status = "disabled";
bff4e5dac9992b Wolfram Sang       2021-01-21   918  		};
bff4e5dac9992b Wolfram Sang       2021-01-21   919  
bff4e5dac9992b Wolfram Sang       2021-01-21   920  		scif4: serial@e6c40000 {
bff4e5dac9992b Wolfram Sang       2021-01-21   921  			compatible = "renesas,scif-r8a779a0",
bff4e5dac9992b Wolfram Sang       2021-01-21   922  				     "renesas,rcar-gen3-scif", "renesas,scif";
bff4e5dac9992b Wolfram Sang       2021-01-21   923  			reg = <0 0xe6c40000 0 64>;
bff4e5dac9992b Wolfram Sang       2021-01-21   924  			interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>;
bff4e5dac9992b Wolfram Sang       2021-01-21   925  			clocks = <&cpg CPG_MOD 705>,
bff4e5dac9992b Wolfram Sang       2021-01-21   926  				 <&cpg CPG_CORE R8A779A0_CLK_S1D2>,
bff4e5dac9992b Wolfram Sang       2021-01-21   927  				 <&scif_clk>;
bff4e5dac9992b Wolfram Sang       2021-01-21   928  			clock-names = "fck", "brg_int", "scif_clk";
bff4e5dac9992b Wolfram Sang       2021-01-21   929  			dmas = <&dmac1 0x59>, <&dmac1 0x58>;
bff4e5dac9992b Wolfram Sang       2021-01-21   930  			dma-names = "tx", "rx";
bff4e5dac9992b Wolfram Sang       2021-01-21   931  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
bff4e5dac9992b Wolfram Sang       2021-01-21   932  			resets = <&cpg 705>;
bff4e5dac9992b Wolfram Sang       2021-01-21   933  			status = "disabled";
bff4e5dac9992b Wolfram Sang       2021-01-21   934  		};
bff4e5dac9992b Wolfram Sang       2021-01-21   935  
bdd8b0053f4ff0 Duc Nguyen         2021-09-01   936  		tpu: pwm@e6e80000 {
bdd8b0053f4ff0 Duc Nguyen         2021-09-01   937  			compatible = "renesas,tpu-r8a779a0", "renesas,tpu";
bdd8b0053f4ff0 Duc Nguyen         2021-09-01   938  			reg = <0 0xe6e80000 0 0x148>;
bdd8b0053f4ff0 Duc Nguyen         2021-09-01   939  			interrupts = <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
bdd8b0053f4ff0 Duc Nguyen         2021-09-01   940  			clocks = <&cpg CPG_MOD 718>;
bdd8b0053f4ff0 Duc Nguyen         2021-09-01   941  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
bdd8b0053f4ff0 Duc Nguyen         2021-09-01   942  			resets = <&cpg 718>;
bdd8b0053f4ff0 Duc Nguyen         2021-09-01   943  			#pwm-cells = <3>;
bdd8b0053f4ff0 Duc Nguyen         2021-09-01   944  			status = "disabled";
bdd8b0053f4ff0 Duc Nguyen         2021-09-01   945  		};
bdd8b0053f4ff0 Duc Nguyen         2021-09-01   946  
896dd923ad26b9 Koji Matsuoka      2021-01-08   947  		msiof0: spi@e6e90000 {
896dd923ad26b9 Koji Matsuoka      2021-01-08   948  			compatible = "renesas,msiof-r8a779a0",
896dd923ad26b9 Koji Matsuoka      2021-01-08   949  				     "renesas,rcar-gen3-msiof";
896dd923ad26b9 Koji Matsuoka      2021-01-08   950  			reg = <0 0xe6e90000 0 0x0064>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   951  			interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   952  			clocks = <&cpg CPG_MOD 618>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   953  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   954  			resets = <&cpg 618>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   955  			dmas = <&dmac1 0x41>, <&dmac1 0x40>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   956  			dma-names = "tx", "rx";
896dd923ad26b9 Koji Matsuoka      2021-01-08   957  			#address-cells = <1>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   958  			#size-cells = <0>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   959  			status = "disabled";
896dd923ad26b9 Koji Matsuoka      2021-01-08   960  		};
896dd923ad26b9 Koji Matsuoka      2021-01-08   961  
896dd923ad26b9 Koji Matsuoka      2021-01-08   962  		msiof1: spi@e6ea0000 {
896dd923ad26b9 Koji Matsuoka      2021-01-08   963  			compatible = "renesas,msiof-r8a779a0",
896dd923ad26b9 Koji Matsuoka      2021-01-08   964  				     "renesas,rcar-gen3-msiof";
896dd923ad26b9 Koji Matsuoka      2021-01-08   965  			reg = <0 0xe6ea0000 0 0x0064>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   966  			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   967  			clocks = <&cpg CPG_MOD 619>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   968  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   969  			resets = <&cpg 619>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   970  			dmas = <&dmac1 0x43>, <&dmac1 0x42>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   971  			dma-names = "tx", "rx";
896dd923ad26b9 Koji Matsuoka      2021-01-08   972  			#address-cells = <1>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   973  			#size-cells = <0>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   974  			status = "disabled";
896dd923ad26b9 Koji Matsuoka      2021-01-08   975  		};
896dd923ad26b9 Koji Matsuoka      2021-01-08   976  
896dd923ad26b9 Koji Matsuoka      2021-01-08   977  		msiof2: spi@e6c00000 {
896dd923ad26b9 Koji Matsuoka      2021-01-08   978  			compatible = "renesas,msiof-r8a779a0",
896dd923ad26b9 Koji Matsuoka      2021-01-08   979  				     "renesas,rcar-gen3-msiof";
896dd923ad26b9 Koji Matsuoka      2021-01-08   980  			reg = <0 0xe6c00000 0 0x0064>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   981  			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   982  			clocks = <&cpg CPG_MOD 620>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   983  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   984  			resets = <&cpg 620>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   985  			dmas = <&dmac1 0x45>, <&dmac1 0x44>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   986  			dma-names = "tx", "rx";
896dd923ad26b9 Koji Matsuoka      2021-01-08   987  			#address-cells = <1>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   988  			#size-cells = <0>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   989  			status = "disabled";
896dd923ad26b9 Koji Matsuoka      2021-01-08   990  		};
896dd923ad26b9 Koji Matsuoka      2021-01-08   991  
896dd923ad26b9 Koji Matsuoka      2021-01-08   992  		msiof3: spi@e6c10000 {
896dd923ad26b9 Koji Matsuoka      2021-01-08   993  			compatible = "renesas,msiof-r8a779a0",
896dd923ad26b9 Koji Matsuoka      2021-01-08   994  				     "renesas,rcar-gen3-msiof";
896dd923ad26b9 Koji Matsuoka      2021-01-08   995  			reg = <0 0xe6c10000 0 0x0064>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   996  			interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   997  			clocks = <&cpg CPG_MOD 621>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   998  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
896dd923ad26b9 Koji Matsuoka      2021-01-08   999  			resets = <&cpg 621>;
896dd923ad26b9 Koji Matsuoka      2021-01-08  1000  			dmas = <&dmac1 0x47>, <&dmac1 0x46>;
896dd923ad26b9 Koji Matsuoka      2021-01-08  1001  			dma-names = "tx", "rx";
896dd923ad26b9 Koji Matsuoka      2021-01-08  1002  			#address-cells = <1>;
896dd923ad26b9 Koji Matsuoka      2021-01-08  1003  			#size-cells = <0>;
896dd923ad26b9 Koji Matsuoka      2021-01-08  1004  			status = "disabled";
896dd923ad26b9 Koji Matsuoka      2021-01-08  1005  		};
896dd923ad26b9 Koji Matsuoka      2021-01-08  1006  
896dd923ad26b9 Koji Matsuoka      2021-01-08  1007  		msiof4: spi@e6c20000 {
896dd923ad26b9 Koji Matsuoka      2021-01-08  1008  			compatible = "renesas,msiof-r8a779a0",
896dd923ad26b9 Koji Matsuoka      2021-01-08  1009  				     "renesas,rcar-gen3-msiof";
896dd923ad26b9 Koji Matsuoka      2021-01-08  1010  			reg = <0 0xe6c20000 0 0x0064>;
896dd923ad26b9 Koji Matsuoka      2021-01-08  1011  			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
896dd923ad26b9 Koji Matsuoka      2021-01-08  1012  			clocks = <&cpg CPG_MOD 622>;
896dd923ad26b9 Koji Matsuoka      2021-01-08  1013  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
896dd923ad26b9 Koji Matsuoka      2021-01-08  1014  			resets = <&cpg 622>;
896dd923ad26b9 Koji Matsuoka      2021-01-08  1015  			dmas = <&dmac1 0x49>, <&dmac1 0x48>;
896dd923ad26b9 Koji Matsuoka      2021-01-08  1016  			dma-names = "tx", "rx";
896dd923ad26b9 Koji Matsuoka      2021-01-08  1017  			#address-cells = <1>;
896dd923ad26b9 Koji Matsuoka      2021-01-08  1018  			#size-cells = <0>;
896dd923ad26b9 Koji Matsuoka      2021-01-08  1019  			status = "disabled";
896dd923ad26b9 Koji Matsuoka      2021-01-08  1020  		};
896dd923ad26b9 Koji Matsuoka      2021-01-08  1021  
896dd923ad26b9 Koji Matsuoka      2021-01-08  1022  		msiof5: spi@e6c28000 {
896dd923ad26b9 Koji Matsuoka      2021-01-08  1023  			compatible = "renesas,msiof-r8a779a0",
896dd923ad26b9 Koji Matsuoka      2021-01-08  1024  				     "renesas,rcar-gen3-msiof";
896dd923ad26b9 Koji Matsuoka      2021-01-08  1025  			reg = <0 0xe6c28000 0 0x0064>;
896dd923ad26b9 Koji Matsuoka      2021-01-08  1026  			interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>;
896dd923ad26b9 Koji Matsuoka      2021-01-08  1027  			clocks = <&cpg CPG_MOD 623>;
896dd923ad26b9 Koji Matsuoka      2021-01-08  1028  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
896dd923ad26b9 Koji Matsuoka      2021-01-08  1029  			resets = <&cpg 623>;
896dd923ad26b9 Koji Matsuoka      2021-01-08  1030  			dmas = <&dmac1 0x4b>, <&dmac1 0x4a>;
896dd923ad26b9 Koji Matsuoka      2021-01-08  1031  			dma-names = "tx", "rx";
896dd923ad26b9 Koji Matsuoka      2021-01-08  1032  			#address-cells = <1>;
896dd923ad26b9 Koji Matsuoka      2021-01-08  1033  			#size-cells = <0>;
896dd923ad26b9 Koji Matsuoka      2021-01-08  1034  			status = "disabled";
896dd923ad26b9 Koji Matsuoka      2021-01-08  1035  		};
896dd923ad26b9 Koji Matsuoka      2021-01-08  1036  
5fea5b55713469 Niklas Söderlund   2021-10-12  1037  		vin00: video@e6ef0000 {
5fea5b55713469 Niklas Söderlund   2021-10-12  1038  			compatible = "renesas,vin-r8a779a0";
5fea5b55713469 Niklas Söderlund   2021-10-12  1039  			reg = <0 0xe6ef0000 0 0x1000>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1040  			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1041  			clocks = <&cpg CPG_MOD 730>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1042  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1043  			resets = <&cpg 730>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1044  			renesas,id = <0>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1045  			status = "disabled";
5fea5b55713469 Niklas Söderlund   2021-10-12  1046  
5fea5b55713469 Niklas Söderlund   2021-10-12  1047  			ports {
5fea5b55713469 Niklas Söderlund   2021-10-12  1048  				#address-cells = <1>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1049  				#size-cells = <0>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1050  
5fea5b55713469 Niklas Söderlund   2021-10-12 @1051  				port@2 {
5fea5b55713469 Niklas Söderlund   2021-10-12  1052  					#address-cells = <1>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1053  					#size-cells = <0>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1054  
5fea5b55713469 Niklas Söderlund   2021-10-12  1055  					reg = <2>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1056  
5fea5b55713469 Niklas Söderlund   2021-10-12  1057  					vin00isp0: endpoint@0 {
5fea5b55713469 Niklas Söderlund   2021-10-12  1058  						reg = <0>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1059  						remote-endpoint = <&isp0vin00>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1060  					};
5fea5b55713469 Niklas Söderlund   2021-10-12  1061  				};
5fea5b55713469 Niklas Söderlund   2021-10-12  1062  			};
5fea5b55713469 Niklas Söderlund   2021-10-12  1063  		};
5fea5b55713469 Niklas Söderlund   2021-10-12  1064  
5fea5b55713469 Niklas Söderlund   2021-10-12  1065  		vin01: video@e6ef1000 {
5fea5b55713469 Niklas Söderlund   2021-10-12  1066  			compatible = "renesas,vin-r8a779a0";
5fea5b55713469 Niklas Söderlund   2021-10-12  1067  			reg = <0 0xe6ef1000 0 0x1000>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1068  			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1069  			clocks = <&cpg CPG_MOD 731>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1070  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1071  			resets = <&cpg 731>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1072  			renesas,id = <1>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1073  			status = "disabled";
5fea5b55713469 Niklas Söderlund   2021-10-12  1074  
5fea5b55713469 Niklas Söderlund   2021-10-12  1075  			ports {
5fea5b55713469 Niklas Söderlund   2021-10-12  1076  				#address-cells = <1>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1077  				#size-cells = <0>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1078  
5fea5b55713469 Niklas Söderlund   2021-10-12 @1079  				port@2 {
5fea5b55713469 Niklas Söderlund   2021-10-12  1080  					#address-cells = <1>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1081  					#size-cells = <0>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1082  
5fea5b55713469 Niklas Söderlund   2021-10-12  1083  					reg = <2>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1084  
5fea5b55713469 Niklas Söderlund   2021-10-12  1085  					vin01isp0: endpoint@0 {
5fea5b55713469 Niklas Söderlund   2021-10-12  1086  						reg = <0>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1087  						remote-endpoint = <&isp0vin01>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1088  					};
5fea5b55713469 Niklas Söderlund   2021-10-12  1089  				};
5fea5b55713469 Niklas Söderlund   2021-10-12  1090  			};
5fea5b55713469 Niklas Söderlund   2021-10-12  1091  		};
5fea5b55713469 Niklas Söderlund   2021-10-12  1092  
5fea5b55713469 Niklas Söderlund   2021-10-12  1093  		vin02: video@e6ef2000 {
5fea5b55713469 Niklas Söderlund   2021-10-12  1094  			compatible = "renesas,vin-r8a779a0";
5fea5b55713469 Niklas Söderlund   2021-10-12  1095  			reg = <0 0xe6ef2000 0 0x1000>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1096  			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1097  			clocks = <&cpg CPG_MOD 800>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1098  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1099  			resets = <&cpg 800>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1100  			renesas,id = <2>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1101  			status = "disabled";
5fea5b55713469 Niklas Söderlund   2021-10-12  1102  
5fea5b55713469 Niklas Söderlund   2021-10-12  1103  			ports {
5fea5b55713469 Niklas Söderlund   2021-10-12  1104  				#address-cells = <1>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1105  				#size-cells = <0>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1106  
5fea5b55713469 Niklas Söderlund   2021-10-12 @1107  				port@2 {
5fea5b55713469 Niklas Söderlund   2021-10-12  1108  					#address-cells = <1>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1109  					#size-cells = <0>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1110  
5fea5b55713469 Niklas Söderlund   2021-10-12  1111  					reg = <2>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1112  
5fea5b55713469 Niklas Söderlund   2021-10-12  1113  					vin02isp0: endpoint@0 {
5fea5b55713469 Niklas Söderlund   2021-10-12  1114  						reg = <0>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1115  						remote-endpoint = <&isp0vin02>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1116  					};
5fea5b55713469 Niklas Söderlund   2021-10-12  1117  				};
5fea5b55713469 Niklas Söderlund   2021-10-12  1118  			};
5fea5b55713469 Niklas Söderlund   2021-10-12  1119  		};
5fea5b55713469 Niklas Söderlund   2021-10-12  1120  
5fea5b55713469 Niklas Söderlund   2021-10-12  1121  		vin03: video@e6ef3000 {
5fea5b55713469 Niklas Söderlund   2021-10-12  1122  			compatible = "renesas,vin-r8a779a0";
5fea5b55713469 Niklas Söderlund   2021-10-12  1123  			reg = <0 0xe6ef3000 0 0x1000>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1124  			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1125  			clocks = <&cpg CPG_MOD 801>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1126  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1127  			resets = <&cpg 801>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1128  			renesas,id = <3>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1129  			status = "disabled";
5fea5b55713469 Niklas Söderlund   2021-10-12  1130  
5fea5b55713469 Niklas Söderlund   2021-10-12  1131  			ports {
5fea5b55713469 Niklas Söderlund   2021-10-12  1132  				#address-cells = <1>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1133  				#size-cells = <0>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1134  
5fea5b55713469 Niklas Söderlund   2021-10-12 @1135  				port@2 {
5fea5b55713469 Niklas Söderlund   2021-10-12  1136  					#address-cells = <1>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1137  					#size-cells = <0>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1138  
5fea5b55713469 Niklas Söderlund   2021-10-12  1139  					reg = <2>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1140  
5fea5b55713469 Niklas Söderlund   2021-10-12  1141  					vin03isp0: endpoint@0 {
5fea5b55713469 Niklas Söderlund   2021-10-12  1142  						reg = <0>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1143  						remote-endpoint = <&isp0vin03>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1144  					};
5fea5b55713469 Niklas Söderlund   2021-10-12  1145  				};
5fea5b55713469 Niklas Söderlund   2021-10-12  1146  			};
5fea5b55713469 Niklas Söderlund   2021-10-12  1147  		};
5fea5b55713469 Niklas Söderlund   2021-10-12  1148  
5fea5b55713469 Niklas Söderlund   2021-10-12  1149  		vin04: video@e6ef4000 {
5fea5b55713469 Niklas Söderlund   2021-10-12  1150  			compatible = "renesas,vin-r8a779a0";
5fea5b55713469 Niklas Söderlund   2021-10-12  1151  			reg = <0 0xe6ef4000 0 0x1000>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1152  			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1153  			clocks = <&cpg CPG_MOD 802>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1154  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1155  			resets = <&cpg 802>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1156  			renesas,id = <4>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1157  			status = "disabled";
5fea5b55713469 Niklas Söderlund   2021-10-12  1158  
5fea5b55713469 Niklas Söderlund   2021-10-12  1159  			ports {
5fea5b55713469 Niklas Söderlund   2021-10-12  1160  				#address-cells = <1>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1161  				#size-cells = <0>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1162  
5fea5b55713469 Niklas Söderlund   2021-10-12 @1163  				port@2 {
5fea5b55713469 Niklas Söderlund   2021-10-12  1164  					#address-cells = <1>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1165  					#size-cells = <0>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1166  
5fea5b55713469 Niklas Söderlund   2021-10-12  1167  					reg = <2>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1168  
5fea5b55713469 Niklas Söderlund   2021-10-12  1169  					vin04isp0: endpoint@0 {
5fea5b55713469 Niklas Söderlund   2021-10-12  1170  						reg = <0>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1171  						remote-endpoint = <&isp0vin04>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1172  					};
5fea5b55713469 Niklas Söderlund   2021-10-12  1173  				};
5fea5b55713469 Niklas Söderlund   2021-10-12  1174  			};
5fea5b55713469 Niklas Söderlund   2021-10-12  1175  		};
5fea5b55713469 Niklas Söderlund   2021-10-12  1176  
5fea5b55713469 Niklas Söderlund   2021-10-12  1177  		vin05: video@e6ef5000 {
5fea5b55713469 Niklas Söderlund   2021-10-12  1178  			compatible = "renesas,vin-r8a779a0";
5fea5b55713469 Niklas Söderlund   2021-10-12  1179  			reg = <0 0xe6ef5000 0 0x1000>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1180  			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1181  			clocks = <&cpg CPG_MOD 803>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1182  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1183  			resets = <&cpg 803>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1184  			renesas,id = <5>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1185  			status = "disabled";
5fea5b55713469 Niklas Söderlund   2021-10-12  1186  
5fea5b55713469 Niklas Söderlund   2021-10-12  1187  			ports {
5fea5b55713469 Niklas Söderlund   2021-10-12  1188  				#address-cells = <1>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1189  				#size-cells = <0>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1190  
5fea5b55713469 Niklas Söderlund   2021-10-12 @1191  				port@2 {
5fea5b55713469 Niklas Söderlund   2021-10-12  1192  					#address-cells = <1>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1193  					#size-cells = <0>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1194  
5fea5b55713469 Niklas Söderlund   2021-10-12  1195  					reg = <2>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1196  
5fea5b55713469 Niklas Söderlund   2021-10-12  1197  					vin05isp0: endpoint@0 {
5fea5b55713469 Niklas Söderlund   2021-10-12  1198  						reg = <0>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1199  						remote-endpoint = <&isp0vin05>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1200  					};
5fea5b55713469 Niklas Söderlund   2021-10-12  1201  				};
5fea5b55713469 Niklas Söderlund   2021-10-12  1202  			};
5fea5b55713469 Niklas Söderlund   2021-10-12  1203  		};
5fea5b55713469 Niklas Söderlund   2021-10-12  1204  
5fea5b55713469 Niklas Söderlund   2021-10-12  1205  		vin06: video@e6ef6000 {
5fea5b55713469 Niklas Söderlund   2021-10-12  1206  			compatible = "renesas,vin-r8a779a0";
5fea5b55713469 Niklas Söderlund   2021-10-12  1207  			reg = <0 0xe6ef6000 0 0x1000>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1208  			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1209  			clocks = <&cpg CPG_MOD 804>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1210  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1211  			resets = <&cpg 804>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1212  			renesas,id = <6>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1213  			status = "disabled";
5fea5b55713469 Niklas Söderlund   2021-10-12  1214  
5fea5b55713469 Niklas Söderlund   2021-10-12  1215  			ports {
5fea5b55713469 Niklas Söderlund   2021-10-12  1216  				#address-cells = <1>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1217  				#size-cells = <0>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1218  
5fea5b55713469 Niklas Söderlund   2021-10-12 @1219  				port@2 {
5fea5b55713469 Niklas Söderlund   2021-10-12  1220  					#address-cells = <1>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1221  					#size-cells = <0>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1222  
5fea5b55713469 Niklas Söderlund   2021-10-12  1223  					reg = <2>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1224  
5fea5b55713469 Niklas Söderlund   2021-10-12  1225  					vin06isp0: endpoint@0 {
5fea5b55713469 Niklas Söderlund   2021-10-12  1226  						reg = <0>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1227  						remote-endpoint = <&isp0vin06>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1228  					};
5fea5b55713469 Niklas Söderlund   2021-10-12  1229  				};
5fea5b55713469 Niklas Söderlund   2021-10-12  1230  			};
5fea5b55713469 Niklas Söderlund   2021-10-12  1231  		};
5fea5b55713469 Niklas Söderlund   2021-10-12  1232  
5fea5b55713469 Niklas Söderlund   2021-10-12  1233  		vin07: video@e6ef7000 {
5fea5b55713469 Niklas Söderlund   2021-10-12  1234  			compatible = "renesas,vin-r8a779a0";
5fea5b55713469 Niklas Söderlund   2021-10-12  1235  			reg = <0 0xe6ef7000 0 0x1000>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1236  			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1237  			clocks = <&cpg CPG_MOD 805>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1238  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1239  			resets = <&cpg 805>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1240  			renesas,id = <7>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1241  			status = "disabled";
5fea5b55713469 Niklas Söderlund   2021-10-12  1242  
5fea5b55713469 Niklas Söderlund   2021-10-12  1243  			ports {
5fea5b55713469 Niklas Söderlund   2021-10-12  1244  				#address-cells = <1>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1245  				#size-cells = <0>;
5fea5b55713469 Niklas Söderlund   2021-10-12  1246  
5fea5b55713469 Niklas Söderlund   2021-10-12 @1247  				port@2 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
