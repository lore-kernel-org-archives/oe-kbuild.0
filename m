Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AD918EB0
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Mar 2025 16:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742055422; cv=none; b=ao6qGaQ14YHTwlQ0vgdWuFPq9kpny7GwhN7/g8Iou7gQV0Cw/GvnC0f8CwwSG4ON/4856ydVt4W8XLcDNyajUdl4Gmkv8LWPk+pQzrMPWBkWc02YwChOtcVQ8i37G1xl0SOizpN16JL9p9j4UcU3FLh60XGGUdigNw64uAba0js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742055422; c=relaxed/simple;
	bh=2yL60vG1J76xqJ5O19bSU1GPAy/89vNhcjVy1epsuos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lq4CQBKHL81UlXWaXqIJ65GVEPlEUIzNfxNKX1m0/Q+Louhj53rrc+lkFm4KYs01YxHeHzXpZy++fQzsBgMjfAZYr00KeMIFNscxZOPLaLaZ6OQ/NKb2lM9HApzryQPOOLVElhrPQ4R9RHtvHToLW4LoZKIx980+da0RzT2ui4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fwsrEjr6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fwsrEjr6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742055420; x=1773591420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2yL60vG1J76xqJ5O19bSU1GPAy/89vNhcjVy1epsuos=;
  b=fwsrEjr6AjfGK8jjXyHDWolxpaoTdVBjPNhAanxAUhu3jxBlRFr9Dspc
   6zwoooPdPhWp1tCA2gMp6aYbQqbAdnFOqExf9moNRaIfXOtpG+gTjH1Of
   CG/ZyFWh+Z/L3KNuZu1HwBej8VwktE/xspvLniZr8BUnqhUN5/6k2dcWc
   97BaTp3bU9a4eDSlLskFgIcYYjpw3+YQJZORp9c4yyJXLUUcHqA0P8Npx
   sgEqR75u4XPdyJx74CGXjJAmW5HGxA9JORrtPdePUqyLeD3eNHlI7PVEq
   94x0ymQRF88jFz43Up1PHvozOYw0PWxFwQqkbABcsWDyh+iCm3tmBFPsJ
   g==;
X-CSE-ConnectionGUID: KUiqqAlyTMWjbW0yRBgDVQ==
X-CSE-MsgGUID: oGUkWMc8TLqPVYWJPJzyGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="42442762"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="42442762"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 09:16:59 -0700
X-CSE-ConnectionGUID: FcMTUW/PTF+1lP+i81HIhg==
X-CSE-MsgGUID: SqZM/cPkRhucPRJBR1+Bgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="121745846"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 15 Mar 2025 09:16:58 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttUC0-000BSN-00;
	Sat, 15 Mar 2025 16:16:56 +0000
Date: Sun, 16 Mar 2025 00:16:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-msiof-2025-03-14 2/8]
 arch/arm64/boot/dts/renesas/r8a779g3-lcb.dtb: /can-phy0: failed to match any
 schema with compatible: ['microchip,mcp2558fd', 'ti,tcan1042']
Message-ID: <202503160028.KGgYKQED-lkp@intel.com>
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
:::::: branch date: 33 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-052-20250315 (https://download.01.org/0day-ci/archive/20250316/202503160028.KGgYKQED-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503160028.KGgYKQED-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503160028.KGgYKQED-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1473.12-1483.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1502.12-1512.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1531.12-1541.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1560.12-1570.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2244.12-2254.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g3-lcb.dtb: can-phy0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,mcp2558fd', 'ti,tcan1042'] is too long
   	'microchip,mcp2558fd' is not one of ['microchip,ata6561']
   	'microchip,mcp2558fd' is not one of ['ti,tcan1042', 'ti,tcan1043', 'nxp,tjr1443']
   	from schema $id: http://devicetree.org/schemas/phy/ti,tcan104x-can.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-lcb.dtb: /can-phy0: failed to match any schema with compatible: ['microchip,mcp2558fd', 'ti,tcan1042']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
