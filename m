Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F7218991E
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Aug 2025 06:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754114999; cv=none; b=mqsrYOVV3LeiRBwFlQE1cE/7RPqcpe0DlAI1WA4qnw0xfN31GavJSLjC73nv97DBcWIj2LULFInG99P0j8LpNVgUbesklE4bBGMecuS0mMrFzdbwjprpMNICdiq4tSpTriwH8iuL/h90K9AnRcSjrvpowTrWdb9Rrmu8QXrcjG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754114999; c=relaxed/simple;
	bh=I6JXLpoJTPzQA72rFKmDMUOcByXR9G5i4+q7xjfDJXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BbPm2u37iGXkStUG+E9HV4TJT5YjfaAJuWpWNzvtyRyKPLcJPcXlgM7MJX3Q3rFmqUtmzUX3By2EWYjNHn74/5rG7XPHC8RridFquA/V2kxOc0gmXife8E292Uv0quBjZrFsP0zk0csOV/NUC3egcGJ+SxrJwSqJtLSvjeb4y+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bv+zem4K; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bv+zem4K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754114997; x=1785650997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I6JXLpoJTPzQA72rFKmDMUOcByXR9G5i4+q7xjfDJXs=;
  b=Bv+zem4K+zWzR1hDpJPfz325dc++G9utOjpFZzVvZkZzFq0fNU2lDQmH
   8PtZ/KxnoMtEUYA9pSAqpfFUrmOBgp4OtgkQxGep7kbL0Bsa2yqzuhsqS
   90xHsp7D8KNILJvnBzzM50u0seoAJr8aJKf7bVuOfW8BM0GzsO7vDmCaT
   x4ZUOuQ66srC+C6yN1k7e4XXuCdP32a3TnHQVEDdfLRefW9y9FHkqph75
   pNOwt4xOkTnMPp0j2luW1jnkTjjMuFC4cUfX4Ki5iZ6pX/I5hZtH2ED4t
   ODE21UQ/Rd2BxSIk69vqcx0kim5B7ZTc/QG4hLXRGE0KZwKwP9u9Ql834
   A==;
X-CSE-ConnectionGUID: r12KWt5RSMq8phozrIHAUA==
X-CSE-MsgGUID: hzVG7CrIQdStdpvlBDqkKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56348847"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56348847"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 23:09:57 -0700
X-CSE-ConnectionGUID: DneK6Qd2S5aIOgs3PeXlFw==
X-CSE-MsgGUID: Yv0AWo7WQgGreT5RrDZl/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163656481"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 01 Aug 2025 23:09:55 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui5RJ-0001Nb-24;
	Sat, 02 Aug 2025 06:09:53 +0000
Date: Sat, 2 Aug 2025 08:09:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arc/boot/dts/vdk_axc003.dtsi:17.11-47.4: Warning
 (unit_address_vs_reg): /cpu_card: node has a reg or ranges property, but no
 unit name
Message-ID: <202508020859.ZzDH3jMO-lkp@intel.com>
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
config: arc-vdk_hs38_defconfig (https://download.01.org/0day-ci/archive/20250802/202508020859.ZzDH3jMO-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508020859.ZzDH3jMO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508020859.ZzDH3jMO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/skeleton_hs.dtsi:45.9-48.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arc/boot/dts/vdk_axc003.dtsi:17.11-47.4: Warning (unit_address_vs_reg): /cpu_card: node has a reg or ranges property, but no unit name
>> arch/arc/boot/dts/vdk_axc003.dtsi:30.29-34.5: Warning (unit_address_vs_reg): /cpu_card/archs-intc@cpu: node has a unit name, but no reg or ranges property
>> arch/arc/boot/dts/vdk_axs10x_mb.dtsi:9.16-111.4: Warning (unit_address_vs_reg): /axs10x_mb_vdk: node has a reg or ranges property, but no unit name
>> arch/arc/boot/dts/vdk_axc003.dtsi:24.22-28.5: Warning (simple_bus_reg): /cpu_card/core_clk: missing or empty reg/ranges property
>> arch/arc/boot/dts/vdk_axc003.dtsi:30.29-34.5: Warning (simple_bus_reg): /cpu_card/archs-intc@cpu: missing or empty reg/ranges property
>> arch/arc/boot/dts/vdk_axs10x_mb.dtsi:16.10-34.5: Warning (simple_bus_reg): /axs10x_mb_vdk/clocks: missing or empty reg/ranges property
>> arch/arc/boot/dts/vdk_axs10x_mb.dtsi:94.21-99.5: Warning (simple_bus_reg): /axs10x_mb_vdk/ps2@e0017400: simple-bus unit address format error, expected "17400"
>> arch/arc/boot/dts/vdk_axs10x_mb.dtsi:36.18-47.5: Warning (interrupt_provider): /axs10x_mb_vdk/ethernet@18000: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arc/boot/dts/vdk_hs38.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

vim +17 arch/arc/boot/dts/vdk_axc003.dtsi

2e8cd93877b2f9 Vineet Gupta 2016-01-19  11  
2924cd18c434c7 Ruud Derwig  2014-12-03  12  / {
2924cd18c434c7 Ruud Derwig  2014-12-03  13  	compatible = "snps,arc";
2924cd18c434c7 Ruud Derwig  2014-12-03  14  	#address-cells = <1>;
2924cd18c434c7 Ruud Derwig  2014-12-03  15  	#size-cells = <1>;
2924cd18c434c7 Ruud Derwig  2014-12-03  16  
2924cd18c434c7 Ruud Derwig  2014-12-03 @17  	cpu_card {
2924cd18c434c7 Ruud Derwig  2014-12-03  18  		compatible = "simple-bus";
2924cd18c434c7 Ruud Derwig  2014-12-03  19  		#address-cells = <1>;
2924cd18c434c7 Ruud Derwig  2014-12-03  20  		#size-cells = <1>;
2924cd18c434c7 Ruud Derwig  2014-12-03  21  
2924cd18c434c7 Ruud Derwig  2014-12-03  22  		ranges = <0x00000000 0xf0000000 0x10000000>;
2924cd18c434c7 Ruud Derwig  2014-12-03  23  
b3d6aba8bd92c2 Vineet Gupta 2016-01-01 @24  		core_clk: core_clk {
b3d6aba8bd92c2 Vineet Gupta 2016-01-01  25  			#clock-cells = <0>;
b3d6aba8bd92c2 Vineet Gupta 2016-01-01  26  			compatible = "fixed-clock";
b3d6aba8bd92c2 Vineet Gupta 2016-01-01  27  			clock-frequency = <50000000>;
b3d6aba8bd92c2 Vineet Gupta 2016-01-01  28  		};
b3d6aba8bd92c2 Vineet Gupta 2016-01-01  29  
9ba7648cc9b363 Vineet Gupta 2016-01-28 @30  		core_intc: archs-intc@cpu {

:::::: The code at line 17 was first introduced by commit
:::::: 2924cd18c434c79ee777dc63616a8505045d7509 ARCv2: [vdk] dts files and defconfig for HS38 VDK

:::::: TO: Ruud Derwig <rderwig@synopsys.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
