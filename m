Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDFF1F4C8C
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Mar 2025 11:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742037697; cv=none; b=iZ8NYFLvMlcUR4tAL1EAof8diW9tnL4gfnK7tFrPta/jTaNKf3UymQmZuvzQgNupjMXoHKjfxnh/72uz16AdJX8X+tlzjUfeVWrSUkdFWoyH11afdoPHzIQZ52uQnuVMVQzrrlKjXV+Pjgick/xwCndqTNp5iWHSLFpjKmJmJDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742037697; c=relaxed/simple;
	bh=QvZdYQBkVECM5W/UV/A7M/jTR7PpK7Rs602hC9ACweg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ln84ViAFvhnN+ju7C9v+Vs8lXpuuLswAWgaHgPAg9dIyvk4cbynrUMSiFdgd0pPTS0LwxbvPtAnjhHXAjqX7AF/ItUSI3VJUD0lVGsi6AIEKdTaVchZBL3bBdMH0JhbWHaTNEvcmfeuAYogwPjHR+9DgEKAUJAsYe0letXvVV6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aiKkrioe; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aiKkrioe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742037696; x=1773573696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QvZdYQBkVECM5W/UV/A7M/jTR7PpK7Rs602hC9ACweg=;
  b=aiKkrioerdFc/g1I+ZkTppwwlaF3XmjZh/9W7MjgDwls3syUnhY+jgCx
   hJCxWOs1YYQ32oYU+QV45y96n7qZW/n6+fcUTNY2nlTUHD8VFmXipsDVy
   2uGsQ9V2Om/QjBiM/VzYQhy0kwyCdOEg7AcFQiPeLEIZ9OU3+wuTbcA4k
   6DmcNK6cA+BxwkGM/Uqa2y0tyiz9h1NLPLlN5jkF4iqCF8ZptBrMF1kVS
   HO8PnPEbOMCheQ8WoEsVIdnrEl7vM5PdN2rHA6VzstqA9tuAXBE30mVEw
   MnXdQkpIMI6OjoFI1afXPhxQxRV5u+q4zglblT/QhMHV2up4H8HlJHPHh
   A==;
X-CSE-ConnectionGUID: G6zXUPY7SiiccSNpZMzB6Q==
X-CSE-MsgGUID: HuOQVu8uTIWbNJSZirNTdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43365328"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="43365328"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 04:21:34 -0700
X-CSE-ConnectionGUID: /dDG8+J3TeuPOTW3CfeYwA==
X-CSE-MsgGUID: A1gFagyVSiuAk1TwOGC1Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="144700386"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 15 Mar 2025 04:21:32 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttPa5-000BIn-2K;
	Sat, 15 Mar 2025 11:21:29 +0000
Date: Sat, 15 Mar 2025 19:21:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-msiof-2025-03-14 7/8]
 arch/arm64/boot/dts/renesas/r8a779g3-lcb.dts:584.19-590.4: Warning
 (spi_bus_reg): /soc/spi@e6ea0000/port: missing or empty reg property
Message-ID: <202503151918.tLdE6zpv-lkp@intel.com>
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
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-msiof-2025-03-14
head:   4a682853dba80568b028cfd58b4b96bae534c280
commit: 010d136b642fbf45d827ae232e4a852d71d0d4d0 [7/8] hoge
:::::: branch date: 28 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-002-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151918.tLdE6zpv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151918.tLdE6zpv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503151918.tLdE6zpv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a779g3-lcb.dts:584.19-590.4: Warning (spi_bus_reg): /soc/spi@e6ea0000/port: missing or empty reg property
>> arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1262.24-1276.5: Warning (avoid_unnecessary_addr_size): /soc/spi@e6ea0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1357.12-1367.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1386.12-1396.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1415.12-1425.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1444.12-1454.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1473.12-1483.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1502.12-1512.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1531.12-1541.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1560.12-1570.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2244.12-2254.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +584 arch/arm64/boot/dts/renesas/r8a779g3-lcb.dts

e14526d8b470139 Marek Vasut       2025-02-25  575  
010d136b642fbf4 Kuninori Morimoto 2025-03-14  576  &msiof1 {
010d136b642fbf4 Kuninori Morimoto 2025-03-14  577  	pinctrl-0 = <&msiof1_pins>;
010d136b642fbf4 Kuninori Morimoto 2025-03-14  578  	pinctrl-names = "default";
e14526d8b470139 Marek Vasut       2025-02-25  579  
010d136b642fbf4 Kuninori Morimoto 2025-03-14  580  	compatible = "renesas,msiof-snd-r8a779g0",
010d136b642fbf4 Kuninori Morimoto 2025-03-14  581  		     "renesas,msiof-snd-rcar-gen4";
010d136b642fbf4 Kuninori Morimoto 2025-03-14  582  	status = "okay";
e14526d8b470139 Marek Vasut       2025-02-25  583  
010d136b642fbf4 Kuninori Morimoto 2025-03-14 @584  	msiof1_snd: port {
010d136b642fbf4 Kuninori Morimoto 2025-03-14  585  		msiof1_snd_endpoint: endpoint {
010d136b642fbf4 Kuninori Morimoto 2025-03-14  586  			remote-endpoint = <&da7212_endpoint>;
010d136b642fbf4 Kuninori Morimoto 2025-03-14  587  			bitclock-master;
010d136b642fbf4 Kuninori Morimoto 2025-03-14  588  			frame-master;
e14526d8b470139 Marek Vasut       2025-02-25  589  		};
e14526d8b470139 Marek Vasut       2025-02-25  590  	};
e14526d8b470139 Marek Vasut       2025-02-25  591  };
e14526d8b470139 Marek Vasut       2025-02-25  592  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
