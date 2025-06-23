Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94900262FFD
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Jun 2025 15:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750693361; cv=none; b=GpXDnv1v083wS2nwahnpUnQW7/NUsu825Ljgw5Fajmy9nlrrDB939kM7jySkY4nZ7hFlbZbTgtYAzzE2WxHPmbN4Ms/xKwpWtf/aBa29S2qHwiiqrw0IIaSQYD9/aTV1czJP2dDTq1oPRqAvpA6EYcVERAZPWNTtjmSR1DdDghc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750693361; c=relaxed/simple;
	bh=QgypOf0c8PprSoW1OZNjOkFEjwjEH5k5UoMYZF3OSHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WKhzxU4FIiByaeQHHUvciLTSpKs3G4xhZnivFWyM1EHEOQ/EzsqFN5z3TfsFOJdO5K+lRjzQL2QWWXwmGbQJ1d4yBlEbP2odlxqlpx1eMgndfhaeL/+A6qgYH3EuEwzfH7mwWCGDqZL6gCKr1ydQ5DExLJ6rBpB8lTbGrHhkplI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQ3Ch0Ud; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQ3Ch0Ud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750693360; x=1782229360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QgypOf0c8PprSoW1OZNjOkFEjwjEH5k5UoMYZF3OSHo=;
  b=lQ3Ch0UdQfd5MmO3BetP2471lWIjj7cp3SqXBX1DtH0yzuYY42SZn9AI
   45lM/SRbByMhf/fIUa2i38Ani4Ctb5S3dTSDckyekuaCJhWQb9p1X646w
   +YzueHedLqszF0rElXiWVznznZLQMHy3sNb4MmwIx6EcNQFhMMRvchCG6
   x2sUKEgKQmQlPVqTPignpapzEPwD2XG5Mgvg+Ce8Sb0fJauCc1XKu2oNl
   IIR5Kop2xepbaVEHdKq3fHlzT+urDNloFZsjK5LO5Q7GPyImFlepBAW1c
   i8k0Pq75Gif1TCYWItnU2a1GveCKV8GTg7/OsjA+ovZRXLZUfXDNf0bzJ
   Q==;
X-CSE-ConnectionGUID: 6KjHBxQBQyOjPs1mzrq8BA==
X-CSE-MsgGUID: fnuY/2VdR5WIMj0hUoW+sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63173528"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="63173528"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 08:42:38 -0700
X-CSE-ConnectionGUID: M6YYwZnxQT6c1loPnuJSAw==
X-CSE-MsgGUID: FcYJD3QVSRCv5yTwSgc13w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="156008685"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Jun 2025 08:42:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTjJa-000P3O-2E;
	Mon, 23 Jun 2025 15:42:34 +0000
Date: Mon, 23 Jun 2025 23:42:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.17-armsoc/dts64 31/34]
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: gpu@ff700000
 (rockchip,rk3528-mali): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202506232356.SQO8Be9f-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Jonas Karlman <jonas@kwiboo.se>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.17-armsoc/dts64
head:   7f9509791507bd2aa89281d999cf0c8ad659f93d
commit: 6b88b8a640fa5d2169e0ce47b88dc30727fc1105 [31/34] arm64: dts: rockchip: Add GPU node for RK3528
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250622 (https://download.01.org/0day-ci/archive/20250623/202506232356.SQO8Be9f-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506232356.SQO8Be9f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506232356.SQO8Be9f-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:235.6-1087.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/power-management@ff600000: failed to match any schema with compatible: ['rockchip,rk3528-pmu', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/power-management@ff600000/power-controller: failed to match any schema with compatible: ['rockchip,rk3528-power-controller']
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: gpu@ff700000 (rockchip,rk3528-mali): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3528-mali', 'arm,mali-450'] is too short
   	'allwinner,sun8i-a23-mali' was expected
   	'rockchip,rk3528-mali' is not one of ['allwinner,sun4i-a10-mali', 'allwinner,sun7i-a20-mali', 'allwinner,sun8i-h3-mali', 'allwinner,sun8i-r40-mali', 'allwinner,sun50i-a64-mali', 'rockchip,rk3036-mali', 'rockchip,rk3066-mali', 'rockchip,rk3128-mali', 'rockchip,rk3188-mali', 'rockchip,rk3228-mali', 'samsung,exynos4210-mali', 'st,stih410-mali', 'stericsson,db8500-mali', 'xlnx,zynqmp-mali']
   	'rockchip,rk3528-mali' is not one of ['allwinner,sun50i-h5-mali', 'amlogic,meson8-mali', 'amlogic,meson8b-mali', 'amlogic,meson-gxbb-mali', 'amlogic,meson-gxl-mali', 'hisilicon,hi6220-mali', 'mediatek,mt7623-mali', 'rockchip,rk3328-mali']
   	'allwinner,sun7i-a20-mali' was expected
   	'arm,mali-400' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-utgard.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/gpu@ff700000: failed to match any schema with compatible: ['rockchip,rk3528-mali', 'arm,mali-450']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
