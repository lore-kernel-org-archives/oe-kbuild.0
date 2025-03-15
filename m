Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC591DDE9
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Mar 2025 19:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742067772; cv=none; b=rzB76GEWWevHSjbh7TfHODeEetfeobnn9buLGgUHf4Ol1MyHI72S83U2nCJs3wPGapgiCTixOSE78PQDD1uJyy6WKm5/jYFBeVttcRoRdikD/9DtIZf59WSH9S7UXb0JUPc7T/AjG/j7Iu7NBtHOdN6Fx8EoR71R7q6JCoVOoBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742067772; c=relaxed/simple;
	bh=wBURjV3qHE4NhZLC5PTnvOnZB5OXvpJWnanjJlfzRds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oNdwugCZNARYLfHMYMFLQxtyNzagr0bI5jROCBSucU3p7EzmgD2zlVrjoPn6IjEgIos/G6UPll7UOt9gzbl1HIQHtXHNbcFo6+bU0DxcikRUzLiKnYyfm3bQc8PrMrucV0HdcoauWveKCs041J8PxGXA2ahNT3mkuV/ZrmBze5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jwqdyyb+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jwqdyyb+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742067771; x=1773603771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wBURjV3qHE4NhZLC5PTnvOnZB5OXvpJWnanjJlfzRds=;
  b=jwqdyyb+FSzRozGYVTAph4m5RSgzOugVf2049yXJkYQ1O6ylOyFKglM/
   G02jtzz4c1ZmX59r2eXWxoJw1cTL8UroedIy985RP3trSwEzxvO8LGlJE
   b7XK3+0M8Lt5kNT/Ps0GJfC+mSoc8D42ylD7HrkFybFWePWhk3YBuIyjr
   Rxb7FrF05ar4WQ3lLfT3IXySuiwFrFgZY6bwf26gqXaUsqFSA1VxZMR/S
   R+53zRPyPsqsii85MOwJkij6/YnCk6r4S8OAV/U0QeGIT43OicZSxQFjj
   7UYkX9zlqKuirHnkco0+3BUbVKQdTnxVELDglyUmuX9KtlmC/ptCTQPXL
   A==;
X-CSE-ConnectionGUID: XifzsownTA6cBGE1th84+w==
X-CSE-MsgGUID: hjFiMxYKS8OpvJfEFrERQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="65663106"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="65663106"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 12:42:50 -0700
X-CSE-ConnectionGUID: HOPgJTqQScexTpErgTEkmw==
X-CSE-MsgGUID: t7lfOKbBSXW98nB6X0zjrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="122065485"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 15 Mar 2025 12:42:49 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttXPC-000Bbp-1R;
	Sat, 15 Mar 2025 19:42:46 +0000
Date: Sun, 16 Mar 2025 03:41:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-msiof-2025-03-14 2/8]
 arch/arm64/boot/dts/renesas/r8a779g3-lcb.dtb: can-phy0: compatible: 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <202503160353.w1php48g-lkp@intel.com>
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

tree:   https://github.com/morimoto/linux sound-msiof-2025-03-14
head:   4a682853dba80568b028cfd58b4b96bae534c280
commit: e14526d8b470139d7afaa2829f065ea40bb51e3c [2/8] FIXME: arm64: dts: renesas: r8a779g3: Add Renesas R-Car V4H LCB board support
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-053-20250315 (https://download.01.org/0day-ci/archive/20250316/202503160353.w1php48g-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503160353.w1php48g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503160353.w1php48g-lkp@intel.com/

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
>> arch/arm64/boot/dts/renesas/r8a779g3-lcb.dtb: can-phy0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,mcp2558fd', 'ti,tcan1042'] is too long
   	'microchip,mcp2558fd' is not one of ['microchip,ata6561']
   	'microchip,mcp2558fd' is not one of ['ti,tcan1042', 'ti,tcan1043', 'nxp,tjr1443']
   	from schema $id: http://devicetree.org/schemas/phy/ti,tcan104x-can.yaml#
   arch/arm64/boot/dts/renesas/r8a779g3-lcb.dtb: /can-phy0: failed to match any schema with compatible: ['microchip,mcp2558fd', 'ti,tcan1042']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
