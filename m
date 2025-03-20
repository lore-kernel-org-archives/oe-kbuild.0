Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0F01F8739
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Mar 2025 07:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742455432; cv=none; b=BEAewmMasrrUACgHqIu8ZkBMjR8DGwUylr8ZhBFwPRIHZg5r37xH3IPHGuo2CGPSzm4Js7DKDltBq8XBWC2Lx92L9dWJT+JQMMei57TKV5S9wM/zv+470KyctfhDsTcuCX2LgG3VdA/yArMDE1Tz3rkC/JeyNA2gzwV9Z5+s2Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742455432; c=relaxed/simple;
	bh=GKvn1ef8qw5PplLGIEpCezqbDM9Tiw+YpJKW7Fz+u7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ddX20vBIOKkKivxlOtcVQvnC1+laEt2QSlHNIP/4Z9Alqf5DAw8ribaE52XsGTox0VyDIrrdlGaf++oPuG+V234PSnsEhgWTksY7bZh+GBAWVse+iydZOZfGHtgfoIoIRjicELOTZhGYKDkoQ8rxWG0B0AXSMJsrmZCON3W8Huk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWv/PIQX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWv/PIQX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742455431; x=1773991431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GKvn1ef8qw5PplLGIEpCezqbDM9Tiw+YpJKW7Fz+u7M=;
  b=SWv/PIQXJyqS8OzeMPNyBLzIr5TJcVj0BKQ2VVB/1jZQERr9zpMrcbTv
   1jUU0QDGfe0KFRAbqdP6dI44V6HIMwEzEgJ134AsH07lLfEy1Kcv5Ca/1
   R4Trn9oAargMwSuW2F/JygLH1PgszD/rI+h/u++zbFNvn6a9D/Ju3iy97
   itG/MPhCiOLFc2Fgjg/J4oDIvzhqoe4M36dp3uw+NTO4U4Wvd1d+nMiM3
   deOFjCmkM2Ljg3qtvQDVGaos8xs7cvV4l2NLFlWzawoPqLqCHvrz8yA/N
   1dP6CMgIz5UdktSml51MMCXXpq48hDJMrYick8HcSXTM1ZTmQCY0SbPDr
   g==;
X-CSE-ConnectionGUID: be/TKxo6T9uFZmKgExGXJg==
X-CSE-MsgGUID: I8t6lXadR9KcikJWRHw31w==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43549557"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="43549557"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 00:23:50 -0700
X-CSE-ConnectionGUID: rXHR2d8ISbCK6se3lcKjQQ==
X-CSE-MsgGUID: k5PhrV6LSYSNtHtWQSeRrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="128216493"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 20 Mar 2025 00:23:49 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvAFm-0000HB-2K;
	Thu, 20 Mar 2025 07:23:46 +0000
Date: Thu, 20 Mar 2025 15:23:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-msiof-2025-03-18-2 3/11]
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: regulator-vcc-sdhi:
 'gpios' is a required property
Message-ID: <202503201534.xle7jx3T-lkp@intel.com>
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
TO: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-msiof-2025-03-18-2
head:   920e565f45c3b4a2065fdab49586b975b90f1712
commit: df1969bba83d97b1d9d0e36ccf1fad660f9c3967 [3/11] arm64: dts: renesas: r8a779g3: Add Renesas R-Car V4H Sparrow Hawk board support
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-052-20250319 (https://download.01.org/0day-ci/archive/20250320/202503201534.xle7jx3T-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503201534.xle7jx3T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503201534.xle7jx3T-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1357.12-1367.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1386.12-1396.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1415.12-1425.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1444.12-1454.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1473.12-1483.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1502.12-1512.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1531.12-1541.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1560.12-1570.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2244.12-2254.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: regulator-vcc-sdhi: 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: regulator-vcc-sdhi: Unevaluated properties are not allowed ('gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
