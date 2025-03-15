Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB661DFED
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Mar 2025 15:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742052815; cv=none; b=UyLW6zz0hL10ipq+R/x4S3iwXUuL1FvDrhk25LGd+vPNxSEY5oxvnRWIBv9Kc1/JQn3WMy706HihK9Zk6dxTTgjL/77TN0s5b8Z+zn1zNGxkyYT98IAmvFF942ktolY81Cj7V49kS6Cexhxk/ENY1gS7MrI8rVg2cDOBTH24iLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742052815; c=relaxed/simple;
	bh=TsNKpfUzuK2juLZJakgTZEMn3jp37yCLjU/jCqBFK4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IrYu1Aj7dh//LVuuCoLZy8dQ91im3J7VtbvYQliIPvywvUbVbo5VsQMaE32/N9GAQwkzCIMafdufgwv+qO6cC7UWNGToR156D0bszB6sVWW+fLOYW9GLVG1xvP5mXKoi8zkjgcwLmOQnqAEPbmSq+AibOZKMv7iY57YnL9ViiVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LEdaZ2IW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LEdaZ2IW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742052813; x=1773588813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TsNKpfUzuK2juLZJakgTZEMn3jp37yCLjU/jCqBFK4g=;
  b=LEdaZ2IWkPLA0aIHuGhjsq2BhLlOYDjKHP49krwMiBcNHkwM66scQusr
   CYuGdFbcQrupnUt6hZ5IYi4eFiTW7yqBjn8GFpqpWH4IjIwRbpLacb5j1
   WcboP9EIKe3Jq/S/HHXNZX5GMMnIO7ZDp+tEa84aFY7GkTa5eC9F80K/V
   cUIb9AokdWbFplxA7PRuft2HFBBq9WaXVlpIfTtr3RB4vK5TLPgAnEKX8
   rQP8ri0bmFD6Le9aVsaWAG16QIwKHC2xUBG+u38XVSKiX4keuCfu34o+3
   NOAtAeff+RJ9e5y8xUMNXa0V915IRcVy/YIMlCAS+qZIEM2SsmTJJHvVY
   Q==;
X-CSE-ConnectionGUID: bgMp+B8yQVGlU2XJlC+OsQ==
X-CSE-MsgGUID: A0YBYdMDRdC/dtwzbAuwLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="43065286"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="43065286"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 08:33:33 -0700
X-CSE-ConnectionGUID: a8v74GIXR0GzSe4bLETQpw==
X-CSE-MsgGUID: fQ0i/QCYSvWSPfIGUNRJhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="126410882"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 15 Mar 2025 08:33:32 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttTVx-000BPj-1z;
	Sat, 15 Mar 2025 15:33:29 +0000
Date: Sat, 15 Mar 2025 23:33:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-msiof-2025-03-14 7/8]
 arch/arm64/boot/dts/renesas/r8a779g3-lcb.dtb: spi@e6ea0000: Unevaluated
 properties are not allowed ('port' was unexpected)
Message-ID: <202503152314.tbuASZ1o-lkp@intel.com>
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
:::::: branch date: 33 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250315 (https://download.01.org/0day-ci/archive/20250315/202503152314.tbuASZ1o-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 87916f8c32ebd8e284091db9b70339df57fd1e90)
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503152314.tbuASZ1o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503152314.tbuASZ1o-lkp@intel.com/

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
>> arch/arm64/boot/dts/renesas/r8a779g3-lcb.dtb: spi@e6ea0000: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/renesas,sh-msiof.yaml#
   arch/arm64/boot/dts/renesas/r8a779g3-lcb.dtb: can-phy0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,mcp2558fd', 'ti,tcan1042'] is too long
   	'microchip,mcp2558fd' is not one of ['microchip,ata6561']
   	'microchip,mcp2558fd' is not one of ['ti,tcan1042', 'ti,tcan1043', 'nxp,tjr1443']
   	from schema $id: http://devicetree.org/schemas/phy/ti,tcan104x-can.yaml#
   arch/arm64/boot/dts/renesas/r8a779g3-lcb.dtb: /can-phy0: failed to match any schema with compatible: ['microchip,mcp2558fd', 'ti,tcan1042']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
