Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D203E15D1
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Aug 2024 06:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722924875; cv=none; b=GD7szxz8stNoKIaC1kKw+iRnFQw6E5KOoSrf8mEWPQZ5F6F72LPwtySOJnyS14ubuF/8zhAGKHdZTzTNYA3+zGPmDmeR/1+eg3xEkFlz/407p36EIRgt0AScWeH8q/FCcmf1PxgfWuJIoPbDl08hyVNbs3rF6CU+86g5xwwpuy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722924875; c=relaxed/simple;
	bh=R6MdPxGdv3aZfhlzU9kkpgj9x3ezWvE2EaL6WLvvsxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UMfJ4hBJOmw6Q1CQyzKW8KVIpIPIiazObO8QaofKL9StoEw92oMznyFC+CfmvI3CL7cwa20rLvQWHDpXIquChPsg9sPfgQSfwpUVjRMB+lJLpJ5RMB8ZXWWFv1glxp/8Gw2Yu/2fNTU4fXPXZPOuAhT0FTr51MC9J6JFQ9lny6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oo/FpIG9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oo/FpIG9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722924873; x=1754460873;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=R6MdPxGdv3aZfhlzU9kkpgj9x3ezWvE2EaL6WLvvsxc=;
  b=Oo/FpIG9sT37s6+m9r7+vON6oKyTlzkKoJ6ALfyHOcmnbrB9Tn92J5+u
   WUa3z4LkDnaeMDW4kYrchwzGZzrioEh6IkiTzKNMWZLtDtN0VwCAWCIL+
   KZDy+gVE2JH0LVXIwAA5eGbh29ChGWTjJhDF4KDZQuvj5I6dTy2dvHy1W
   UHQgURJOq9wvXGMq3Q45JYK5Mug7nK8U73Q2Sp9DZAdFsfur9a1mnMMY1
   8Mo36WulXBD6E9n/ur5lVMCFE8XsyFYs+T8d/DJSdrx7fKgDqHM3zTolp
   ueWb5eezS7dEOnO6kzyw4jz4I3uSLT0v1XTDq1GWptU0nOFvJSClC2Ao0
   A==;
X-CSE-ConnectionGUID: WKhHTgpdSA2sI2QlLEAAlQ==
X-CSE-MsgGUID: c7Z4YN1qT3WUBt3ae+Vy2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="21062318"
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="21062318"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 23:14:32 -0700
X-CSE-ConnectionGUID: SbX0WVFORPKfwAdtTlYTGg==
X-CSE-MsgGUID: fwlxD+IhRMS/8YpWlTPEnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="60533225"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 05 Aug 2024 23:14:30 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbDSg-0004DI-0V;
	Tue, 06 Aug 2024 06:14:26 +0000
Date: Tue, 6 Aug 2024 14:14:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:renesas-bsp/v6.1.102-2024-08-05--working 749/832]
 arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb:
 /soc/video@e6ef0000: failed to match any schema with compatible:
 ['renesas,vin-r8a779h0']
Message-ID: <202408061424.Pkb9eMiM-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Niklas Söderlund" <niklas.soderlund+renesas@ragnatech.se>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://github.com/morimoto/linux renesas-bsp/v6.1.102-2024-08-05--working
head:   d2286b6d46210b4f6686f30dde7c897ed7a09d7e
commit: e7621e14fc7a50fcf04373be62225797f8761c8c [749/832] arm64: dts: renesas: r8a779h0: Add video capture nodes
:::::: branch date: 28 hours ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20240805 (https://download.01.org/0day-ci/archive/20240806/202408061424.Pkb9eMiM-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408061424.Pkb9eMiM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408061424.Pkb9eMiM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:963.12-973.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:991.12-1001.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1019.12-1029.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1047.12-1057.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1075.12-1085.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1103.12-1113.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1131.12-1141.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1159.12-1169.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1736.12-1746.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6ef0000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6ef1000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6ef2000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6ef3000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6ef4000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6ef5000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6ef6000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6ef7000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6ef8000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6ef9000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6efa000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6efb000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6efc000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6efd000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6efe000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/video@e6eff000: failed to match any schema with compatible: ['renesas,vin-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/csi2@fe500000: failed to match any schema with compatible: ['renesas,r8a779h0-csi2']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/csi2@fe540000: failed to match any schema with compatible: ['renesas,r8a779h0-csi2']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/isp@fed00000: failed to match any schema with compatible: ['renesas,r8a779h0-isp']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/isp@fed20000: failed to match any schema with compatible: ['renesas,r8a779h0-isp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
