Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E620F36F8EA
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Aug 2026 19:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786821069; cv=none; b=i/aNbywgyAgH8j1ldbWtJclH0ny7jVKIVCgAEyRcCrKhB/CdhAK3YYKZ5TZ2zaqVUk4w0aooD7LGS2U4E2JRd3a1w6ERi4u57n1cEVmIuf1iusSfSO5mXuJgQObZo+BrT1aOxIDeziWg4I6S8vmkE9CtFSH+8hiJ0yG9iBuxHR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786821069; c=relaxed/simple;
	bh=NBoJ5Wi+oWSd+aqvbW5PVzXEPDbDOweui+qavV2LVLA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V3TtfyZY/bYosKAQXvHkRipgEv2RAfhZdD1PWGclUrHbgCZ9LNf4PyuXQAub/fBxbjEdDDMmz6f0QDT8iENejd6Yr8kHTKjGxDXbOwBpwEMvu2ncIMUBoaKzHtzSqfc+P7cz8pILl8Sk3JFew8XPFHQ+dVfuGD17yOynG3kXcdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RyrPlBRZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RyrPlBRZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786821067; x=1818357067;
  h=date:from:to:cc:subject:message-id;
  bh=NBoJ5Wi+oWSd+aqvbW5PVzXEPDbDOweui+qavV2LVLA=;
  b=RyrPlBRZfefd0NEn/XH4d+s0025gwHKnFmGZw419mqgQkA+eSDA2br8/
   OnshOuvxNdVJfiu+Xp3xuhN17b8QFUcoabHc6CxKltxNbUUtfuepgVdGz
   6IHBvPS1C+VAiS1DkOuX2dEqfOL+yyCtvw0D+O8kpNstENUQ9keJBAdJn
   rVCAqOtHcKoUZ+hCAuMftB3NZcojLvVLjybXbd92h15DiySwWeZNWpP8F
   0iFxuulBpG26vDfBbDVcz2azgXecrK2OHboud0fBBkbgN+aRKW0d5Xobp
   qH/rKR/9ENxr3oyR0Pgoy11o+vTW85cStTBdmBEIjv0g2q1uOGMRSFgLo
   Q==;
X-CSE-ConnectionGUID: +VCtOK6eQjW5Iy36kgY9bw==
X-CSE-MsgGUID: Zr0RFScPQOKA/w+QZHzPrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="86320973"
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="86320973"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 12:11:06 -0700
X-CSE-ConnectionGUID: 9IlwBJARTT2yJJdhtbmvLg==
X-CSE-MsgGUID: D2BmbIpZSfKkz5C14VjsoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="265129694"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 15 Aug 2026 12:11:05 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvJmZ-000000006Sj-1tQK;
	Sat, 15 Aug 2026 19:11:03 +0000
Date: Sat, 15 Aug 2026 21:10:38 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-li:imx/dt64-intend 148/152]
 arch/arm64/boot/dts/freescale/imx952-frdm.dtb: opp-500000000: opp-hz-real:
 b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array',
 'boolean', 'null'
Message-ID: <202608152118.4ArBvxe1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Joseph Guo <qijian.guo@nxp.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/dt64-intend
head:   825817212686334aa7c3c04d6e2797647ef7fa6e
commit: 1e951dec1fdf47462cffd0228bfbaad4ce072c34 [148/152] arm64: dts: freescale: add i.MX952 FRDM Board support device tree
:::::: branch date: 8 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2051-20260815 (https://download.01.org/0day-ci/archive/20260815/202608152118.4ArBvxe1-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project daa9d09970fed49996f42a8f7000b584f295991d)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608152118.4ArBvxe1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608152118.4ArBvxe1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx952.dtsi:343.6-1534.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/freescale/imx952-frdm.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx952-frdm.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx952-frdm.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
