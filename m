Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B038020EB
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Jun 2024 04:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717821310; cv=none; b=RztJDZJhGiRRim7FS37dj489EgfVWvjXd9GCLCKM6YZMCRuKw/fPWDgvziA2dVqDXBtPLRQLx8//TBiPWHYjNOSM2Qt16w7EQBA3DhBcKALagXvFxjt8gqvSXhChP6E0kR/9bwtzHOzg67IdZ3omoy1PKorYEFA6x48K0ayxrIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717821310; c=relaxed/simple;
	bh=3t4gPmlSZNV8k6e3gElhm5D3OSTI2yuSVRJN/QqcOdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TZynRM9OPUimimeb9Yhghk0GLELkxTm0uW+5jLGQBNmAbA/06rZmDppcILT3+aNJnlGo7g9KlGWjtH74W4Rg6XLYxokMCOM41xSKLiaJxy/Dawue27bdy9nnJ4/R/ON7pKBHeZnrE61VbWrPS+C/71XEZUb4VENoqyoPKQ678sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IWlrlWTS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IWlrlWTS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717821308; x=1749357308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3t4gPmlSZNV8k6e3gElhm5D3OSTI2yuSVRJN/QqcOdg=;
  b=IWlrlWTSdBNV7LGzGoCKVz1Uuruu6j/KSBb1Je809jJf8+8dFQTV2+dv
   VgQ3VByGnGvx/pYN+03w0YXs9OlQY0IsDddrI9AbCaHKX0j6LbIIJHo/4
   KYHFmN63pV+nJ0IaR8KrG64+lCS4NFBd+xyitEsCoeE5vJlriYpv+JlXK
   ipJ0ySdHsr+pZwrFT4uUB3VxHg2VcSf2Y+eyqTmaUseewEtXTEoZCYZlW
   e+Be1CelaLjme7iJ8X9kEu9tyEHw3GH3b7G2wDlFxuHe078nkyc9lT90Y
   1/5UK0ygTO9viE1N1CINIf2DH56jBOnI66cydxEAs1fHL0uq6Sf2l1R3S
   w==;
X-CSE-ConnectionGUID: NCKpqZhZSRqPF3TJP6ndCw==
X-CSE-MsgGUID: sBVikSzaQd6A7s6gJdc5Og==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25129909"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="25129909"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 21:35:08 -0700
X-CSE-ConnectionGUID: JXNUGP91TS2ggd70ZSCmmA==
X-CSE-MsgGUID: vsF3u845RniJOb7f8ZmL0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="38606135"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Jun 2024 21:35:07 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFnnE-00010Y-37;
	Sat, 08 Jun 2024 04:35:04 +0000
Date: Sat, 8 Jun 2024 12:34:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-ak4619-for-v6.1-2024-06-03 3383/17202]   also
 defined at
 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi:304.9-307.3
Message-ID: <202406081259.aHS1Am7U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem:   also defined at arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi:304.9-307.3"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

tree:   https://github.com/morimoto/linux sound-ak4619-for-v6.1-2024-06-03
head:   fcb2c815fbf0f03847caecb88b5f1da7d72c7123
commit: 54891d5e1a52a0d22fc6d00b88fc28abd7264fdb [3383/17202] arm64: dts: renesas: r8a779g0: white-hawk: Enable PCIe Host ch0
:::::: branch date: 5 days ago
:::::: commit date: 1 year, 4 months ago
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081259.aHS1Am7U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406081259.aHS1Am7U-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1799.30-1866.5: Warning (simple_bus_reg): /soc/sound@ec540000: simple-bus unit address format error, expected "ec5a0000"
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:713.25-743.5: Warning (unique_unit_address): /soc/pcie@e65d0000: duplicate unit-address (also used in node /soc/pcie-ep@e65d0000)
>>   also defined at arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi:304.9-307.3
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:745.25-775.5: Warning (unique_unit_address): /soc/pcie@e65d8000: duplicate unit-address (also used in node /soc/pcie-ep@e65d8000)
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1295.12-1305.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1323.12-1333.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1351.12-1361.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1379.12-1389.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1407.12-1417.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1435.12-1445.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1463.12-1473.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1491.12-1501.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2046.12-2056.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
