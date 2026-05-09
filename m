Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A542D8DD6
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 21:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778363917; cv=none; b=M8RdmUpJE+mQJEznmo+CXQGVpdII9d8+Cb8Vyi6i/W0R3+pIoOITg/wOdAxFAmpCYBXHetzntAizoXIJGf2YMMI2oGMWu0zbZCukBEenjk0z0FljEYgm7WDqqhfPemC5K1ZwHrN43N14xCHwn9eUuiEsUXALzAMAEYqjtas/m8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778363917; c=relaxed/simple;
	bh=iUjqb9lqIZ/rx6SHB+1FLn8b/L/snmlGIMuua0Ngz9k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UlmtpCOSA7RIw38n1f1/vyPgvzqEM8Bap/VZaN+H25RX980kC/jJV2klHyrkUsr4o2PR1feLRBEzJ1ysPdcV4Tn5G8y80EXSO88kPEw1Ax5tTCRnrQlXLqnHMlkGs9QYofy44gyxJRD4668ImhzKf5+35wtSDXN0BoycwCYJvZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJRxYwvG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJRxYwvG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778363914; x=1809899914;
  h=date:from:to:cc:subject:message-id;
  bh=iUjqb9lqIZ/rx6SHB+1FLn8b/L/snmlGIMuua0Ngz9k=;
  b=KJRxYwvGekcpKIKhHNaybFnuMwEXf7OZ91u6xPh2tAwdM7CLNZEvBCvz
   EwQnx7MLCYpXiP3/7onBwMRS2Kby3GvvKA9GhUcQl9cV2PQ4SWYnzpdmr
   rRaLF4z6q8hEPLBvjiweoPH7bV929yBBQP175G/zgQwY3NQKGvomI9HOc
   JWCQgTczRwYkfOhojTDhKcFso+cpEAR9FWEtA0MyaaJDuAg+n98s8BM+k
   yvyd6+9Z3NEzslN9lE4MJ6EfN0ecbGfOQV9UJT+atOlx5oge87HPpz8e+
   238YQRqGhA2R3Wiitw9dZh07yd3CVrXDzcCWGXYAEMHQ9TBYDW8QakTdV
   A==;
X-CSE-ConnectionGUID: DLjUweYuR1axYu/D5EyiGA==
X-CSE-MsgGUID: gn/AX/r7SQGzlewqrKk5ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="79155412"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="79155412"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 14:58:33 -0700
X-CSE-ConnectionGUID: +29PY2HEQK608f319iynkw==
X-CSE-MsgGUID: /zfH3m2cTqylB5VtZHIntA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="242084154"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 09 May 2026 14:58:32 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLpgr-000000007YH-3WuQ;
	Sat, 09 May 2026 21:58:29 +0000
Date: Sat, 09 May 2026 23:57:55 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/apm/apm-mustang.dtb: ethernet@17020000
 (apm,xgene-enet): Unevaluated properties are not allowed
 ('local-mac-address', 'phy-connection-type', 'phy-handle' were unexpected)
Message-ID: <202605092354.vqNx5spZ-lkp@intel.com>
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
head:   1bfaee9d3351b9b32a99766bbfb1f5baed60ddef
commit: 0b467f5a7f19853d8b7a920468d795e682442b80 dt-bindings: net: Convert apm,xgene-enet to DT schema
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260509/202605092354.vqNx5spZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605092354.vqNx5spZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0b467f5a7f19 ("dt-bindings: net: Convert apm,xgene-enet to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605092354.vqNx5spZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/pmu@78810000/pmucmc@7e8d0000: failed to match any schema with compatible: ['apm,xgene-pmu-mc']
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
