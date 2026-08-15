Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C000B3D5C38
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Aug 2026 17:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786815607; cv=none; b=kAieYdqRmTuYOS2qoX9xZw4tucjiKRCjGqw0xs6g7+FASRFLNqD3teE0Ui+dzo9gX4LBcXrie4uqkCJFSHrRndfaY6fYx2P7S26lGzkFX2+mwSCOEQN28LYoScDpVV2bCdLW2kvWe1wH3iGKo1V2d6QuJWAbxApoBbIFmGqwmAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786815607; c=relaxed/simple;
	bh=ljCD544lOvNBKsiM0JoHjV7FFBHKL3EXA6JPXPLW3oc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WFIK178cS4sP9oT0JubSpa/tu2CX+On2x3mcf1KfEHomNH+xSc0wNNnhKoScGHkykwdCoGlXBConcovb7w3l40pOSXXyucnW9E41F/+CAbEH5o5tpssQMDQvIRs2ErnV8/aasGuPRdnPr1ea3F87cxYRR4XZ5QFK2ld6PkoYTeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JvCnmgJJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvCnmgJJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786815606; x=1818351606;
  h=date:from:to:cc:subject:message-id;
  bh=ljCD544lOvNBKsiM0JoHjV7FFBHKL3EXA6JPXPLW3oc=;
  b=JvCnmgJJ0h3+ssxEIHkObgKBe3DGN3BvUenB3GPTfv3W0zX4gBcAOLsY
   3uRYMKo87eNLw05lwvvn398ursQ+MEjHr3jyqFEtGmMvjlNN0nnD5bveB
   gkQStIo5UY3W0p3a6M4aZ14mK37HMnUyyjYQtJ1jlkhcYiDwmY7C0PuUi
   pPYB+y8FE5Vs50M0t63yIds0qHt59cTDTPrPD35G4VDqMdmpsLaIJ5soc
   BiLnw0qGrQ7sWZfr2zQH3Ovt5LaferteCOOnGRYtWZ+hky/8Rz7sO6pdM
   qZOubq8E2cEiJAnCwjld64xxZ2R2GhAlG6oqRyXguoYiIXLGrs45iYLAb
   Q==;
X-CSE-ConnectionGUID: 8WseX45nTS+3e2b7SmGpyQ==
X-CSE-MsgGUID: wmk6GL0mRoG/Jkt/GIuI7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="91172989"
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="91172989"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 10:40:05 -0700
X-CSE-ConnectionGUID: mslhK6A+Q+Su5qomT9C2Sg==
X-CSE-MsgGUID: rb5sif48Roqq70NjkG0TvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="289314067"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 15 Aug 2026 10:40:04 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvIMT-000000006Qv-3fkn;
	Sat, 15 Aug 2026 17:40:01 +0000
Date: Sat, 15 Aug 2026 19:39:28 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/apm/apm-mustang.dtb: ethernet@17020000
 (apm,xgene-enet): Unevaluated properties are not allowed
 ('local-mac-address', 'phy-connection-type', 'phy-handle' were unexpected)
Message-ID: <202608151911.xzLjSuxN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Jacob Keller <jacob.e.keller@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3eb40771c00a8488fa6ed2cc1fe203477908bf38
commit: 0b467f5a7f19853d8b7a920468d795e682442b80 dt-bindings: net: Convert apm,xgene-enet to DT schema
date:   11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-2054-20260813 (https://download.01.org/0day-ci/archive/20260815/202608151911.xzLjSuxN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608151911.xzLjSuxN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0b467f5a7f19 ("dt-bindings: net: Convert apm,xgene-enet to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608151911.xzLjSuxN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/mailbox@10540000: failed to match any schema with compatible: ['apm,xgene-slimpro-mbox']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/i2cslimpro: failed to match any schema with compatible: ['apm,xgene-slimpro-i2c']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/hwmonslimpro: failed to match any schema with compatible: ['apm,xgene-slimpro-hwmon']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: mmc@1c000000 (arasan,sdhci-4.9a): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/rtc@10510000: failed to match any schema with compatible: ['apm,xgene-rtc']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/mdio@17020000: failed to match any schema with compatible: ['apm,xgene-mdio-rgmii']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: ethernet@17020000 (apm,xgene-enet): phy-handle:0: [36, 37] is too long
   	from schema $id: http://devicetree.org/schemas/net/apm,xgene-enet.yaml
>> arch/arm64/boot/dts/apm/apm-mustang.dtb: ethernet@17020000 (apm,xgene-enet): Unevaluated properties are not allowed ('local-mac-address', 'phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/apm,xgene-enet.yaml
   arch/arm64/boot/dts/apm/apm-mustang.dtb: ethernet@17020000 (apm,xgene-enet): phy-handle:0: [36, 37] is too long
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/dma@1f270000: failed to match any schema with compatible: ['apm,xgene-storm-dma']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
