Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFF837AA98
	for <oe-kbuild@lists.linux.dev>; Tue, 26 May 2026 16:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779812738; cv=none; b=H2xHS5BuBt52JaAZVPvry5G4ZSYcy/gfc/OzLpXDr+Nm9wSEMFy954W53WCq5kprayUEEeJYUuCh74RXQ2xNqffQW8wz15tpBhHDsLaj5cfDwYXqBE+5HhGw4zKzFczKbHTu43PgkwBCt6bgT4d8bnGE/qv0oDQJEqbxlCTqa/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779812738; c=relaxed/simple;
	bh=rqqeRhvoOlabsu9YuQL5msHT9NwAzKseci6QTxailKo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dctjjZr6tvD0M7pkXmf3Ps3SmbJP1JfcTi3pyZlfi/UbkDr6EiOh1zBUyIzxArRxYIlfct95O14O8nEe2UR4qewoSK5JRwZdFTflDiNtgrzqGgsq+CaKoqBJ57dwGEV8MRCZS3Ga2lmtCcaK5bo5b8BkLQjBMivQ1qulPY6y2UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CkJO7+Yf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CkJO7+Yf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779812736; x=1811348736;
  h=date:from:to:cc:subject:message-id;
  bh=rqqeRhvoOlabsu9YuQL5msHT9NwAzKseci6QTxailKo=;
  b=CkJO7+YfYGPKSguDr9lv0ko25JZd7we1W2P5aVwO5iqFvIkDxvjOdLFY
   9INt8rDj+0/LuvoCxITghSYwkFuHoOfjEmLxFOcY64UV6JfdOTepOfVnq
   lDlHefNyD9i4h5rCh28jxyERO+A27u+L3PyM48vjcU0BySY70c1myrV2f
   VKEc9Ew3KGS06Jv5WUJEFT7Rz7W2qnZN1BcoWHMMJSIdVMgEnAZRoHI/g
   vdUiEOAvzCffISC2l1jy5lGQXj0Cl5FNtGuu4HideePQmyzJiIwEd818B
   H9D0UIlumeFL8izwHtSl6P2FqGxx3zkAwUz8ARAG6L/yjUrBIgnrMwIHs
   g==;
X-CSE-ConnectionGUID: CcihqYIcQV+L1icEFtBNcw==
X-CSE-MsgGUID: Fb774HdaTeCJCAexHbT/jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80603700"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="80603700"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 09:25:35 -0700
X-CSE-ConnectionGUID: 21vbt7vQRLC9L3XScHbC1A==
X-CSE-MsgGUID: E6WyMrzlQQOFepEX4pEuuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="240923683"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 26 May 2026 09:25:34 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRuay-00000000CS5-11kW;
	Tue, 26 May 2026 16:25:32 +0000
Date: Tue, 26 May 2026 18:25:18 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:mvebu/dt64 6/7]
 arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: /
 (marvell,armada7020-falcon-carrier): compatible: 'oneOf' conditional failed,
 one must be fixed:
Message-ID: <202605261812.LbdEubfG-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Elad Nachman <enachman@marvell.com>
CC: Gregory CLEMENT <gregory.clement@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git mvebu/dt64
head:   fcaf733ca526b69595ed1d227e2cc59ddd24eff7
commit: b3370479a5f7edf4baf0e307f1163f8fe9e09e17 [6/7] arm64: dts: a7k: add COM Express boards
:::::: branch date: 4 months ago
:::::: commit date: 4 months ago
config: arm64-randconfig-2055-20260524 (https://download.01.org/0day-ci/archive/20260526/202605261812.LbdEubfG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261812.LbdEubfG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605261812.LbdEubfG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:236.24-255.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:257.24-276.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: / (marvell,armada7020-falcon-carrier): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,armada7020-falcon-carrier', 'marvell,db-falcon-carrier', 'marvell,armada7020-cpu-module', 'marvell,armada7020', 'marvell,armada-ap806-dual', 'marvell,armada-ap806'] is too long
   	'marvell,armada7020' was expected
   	'marvell,armada7020-falcon-carrier' is not one of ['globalscale,mochabin', 'marvell,armada7040-db']
   	'marvell,armada8020' was expected
   	'marvell,armada7020-falcon-carrier' is not one of ['iei,puzzle-m801', 'marvell,armada8040-db', 'solidrun,clearfog-gt-8k']
   	'marvell,armada7020-falcon-carrier' is not one of ['marvell,armada8040-mcbin-doubleshot', 'marvell,armada8040-mcbin-singleshot']
   	'marvell,armada7020-falcon-carrier' is not one of ['marvell,armada-8080-db']
   	'marvell,cn9130' was expected
   	'marvell,cn9131' was expected
   	'marvell,cn9132' was expected
--
   	'solidrun,cn9130-sr-som' was expected
   	'solidrun,cn9132-sr-cex7' was expected
   	'marvell,armada-ap806' was expected
   	'marvell,armada-ap806-quad' was expected
   	'marvell,armada-ap810-octa' was expected
   	'marvell,armada-ap807' was expected
   	'marvell,cn9130-cpu-module' was expected
   	'marvell,cn9131-cpu-module' was expected
   	'marvell,armada-ap810' was expected
   	from schema $id: http://devicetree.org/schemas/arm/marvell/armada-7k-8k.yaml
>> arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: /: failed to match any schema with compatible: ['marvell,armada7020-falcon-carrier', 'marvell,db-falcon-carrier', 'marvell,armada7020-cpu-module', 'marvell,armada7020', 'marvell,armada-ap806-dual', 'marvell,armada-ap806']
>> arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: /: failed to match any schema with compatible: ['marvell,armada7020-falcon-carrier', 'marvell,db-falcon-carrier', 'marvell,armada7020-cpu-module', 'marvell,armada7020', 'marvell,armada-ap806-dual', 'marvell,armada-ap806']
>> arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: /: failed to match any schema with compatible: ['marvell,armada7020-falcon-carrier', 'marvell,db-falcon-carrier', 'marvell,armada7020-cpu-module', 'marvell,armada7020', 'marvell,armada-ap806-dual', 'marvell,armada-ap806']
   arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: crypto@800000 (marvell,armada-cp110-crypto): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,armada-cp110-crypto', 'inside-secure,safexcel-eip197b'] is too long

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
