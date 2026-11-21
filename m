Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795303361;
	b=oaPkJynzH8tmh2qR62bbOy0ZkN8YL/oc2/REATRqKRet+DSOoFI70eTuNkaFebHO+7zS
	 8p7qVZd+059JE3Dy9bG0T4u1v5NSwrtNAjS5I8i4dYkM7EVocNFB2v7njCTArKii8OMsG
	 HWAT54Ek94dgZZ0yn3XpxZkFHYgw16gnCJZVTeD3HHRS15Djpqv7wpg7hR/Ai0Tk8Orok
	 7AJS/FRbDd38z2DN0qxBWbaGi43IEX71QgKkPecKgGwJitkYM0RRivvYAEjWPWhqIDCXj
	 N7A8xAz2DYzypfBzqYr1Sbk226YAdk3OlOggOXyjYG3PgWANVQMgGj0gjqrHz6lgwAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795303361;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=UC6II18BigQ10YSW7rruVoReR5Vi/1nTsgpplPD29bY=;
	b=KFxTbqf/HZYeCtuKZiIo9uvfv0pVyrVmb0ZS5QyTskyPUu2xsy/IMDVhhcd5qomQa8tr
	 Ee52XOVcdt176KpnADRaoNGHuEK00vo1AwJNXD7jM0Tc0rNE89wK8UJaT1uHUotC8MV3p
	 nthJxcyrLnLamyh2QSuG27rWU2mKrb84yggkGQz+rfcz5l31rGq4QcMczsxrCPXchyLUM
	 b19SJD712/nx6x+VAfUe+b1WIVzeSV7jjA/sSGbDqezxA4y4THDYpnqOd0bgvqQ7eGSwm
	 1N/b04iJD8lTfthLktGkuYlyoBm7SNjFijevVidfFPnyzLZUG5nd7IDEo46tuH2aJog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CH69wWkV;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06071606A320
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 23:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06071606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CH69wWkV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795303360; x=1826839360;
  h=date:from:to:cc:subject:message-id;
  bh=boqD/td3ECK/JueO0Ef+/Ddr+sY/trNmXABBlSbwisA=;
  b=CH69wWkVLo1eDXFsyEeeYCBO4n2Pgq/fnm0HBxkpJCFsq6Ba2EIKVvYH
   2kGrkcgwoooi3PLR3muNNd5VVOtYiqXiZSQlamv1MgdU+rzIxO1RKCqVs
   QsTZVEMx8RfakFSKf/j6h1tP0W/dYvKaO+LpjgCa4EMyQqDVkdocyvZ9c
   vs6TcgvVaLsQ1Q/anOcxfcQm3cnJnY3bX1abV+ZNN9JJXlyMRkJ6yKfvx
   mc4ofa+JZowBVcz4rn/RRsDti3gfZhLjxusuwMOfJtP9M3bzER7Yz1GUI
   7uJWUrp54jqmlb+whVKdxvDuWqrY3CmV0G4G2qSVGmQL/hutHy1WfDk7P
   g==;
X-CSE-ConnectionGUID: f7A3qObXSWWMXXEqPI5sZQ==
X-CSE-MsgGUID: XYYxkdvWR8O+ECUzVW2ZZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4040967"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4040967"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 15:22:39 -0800
X-CSE-ConnectionGUID: jFPicLuvRmuBXeldMDQ+7w==
X-CSE-MsgGUID: IeaONUWjTcuARPVcjs2+bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="10858959"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 21 Nov 2026 15:22:39 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUuPk-000000004PZ-0UYt;
	Sat, 21 Nov 2026 23:22:36 +0000
Date: Sun, 22 Nov 2026 00:22:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-li:imx/dt64 92/93]
 arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dtb: gpio@43810000
 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
Message-ID: <20261122001621.lHO6O5I8-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Leonardo Costa <leonardo.costa@toradex.com>
CC: Frank Li <Frank.Li@nxp.com>
CC: Francesco Dolcini <francesco.dolcini@toradex.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/dt64
head:   e32bda9845c5239c3b7605c465d61f3e2d350599
commit: feda8a3590ccfb9febbb70a95d763e7775b167a3 [92/93] arm64: dts: freescale: imx95-aquila: Add Lotus Carrier Board
:::::: branch date: 31 hours ago
:::::: commit date: 2 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261122/20261122001621.lHO6O5I8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122001621.lHO6O5I8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261122001621.lHO6O5I8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
