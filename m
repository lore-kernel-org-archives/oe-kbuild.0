Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC35D2690E0
	for <oe-kbuild@lists.linux.dev>; Thu, 15 May 2025 18:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747335432; cv=none; b=crjQxOguRicK0Z8IKAJqT5Ntm/x21nhBPoW4oeEb5WqBewS9q3oI/fBxP2yxVDKUxLQOpNjH/0m49ZOxgLOiP39OgmDAILL6MJw9iOXGQIb2P7aRX9ah709z0gjvKcKYW6K77M/gbrquErsSMsM7xgBeJZTe80QEWSTDXku9cQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747335432; c=relaxed/simple;
	bh=IYL7EdfHAM81Q1gdxcYzuPiDjRJkbelHfay8ERqG8KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rFLZz2WkFwu0HqicsirTJIj09XGYwCQFLv4qBc6F1p6vOaAz5TFpcnQry4u6WJ0DWa9xpUnyPpoHiW1ZHyRqCmmFfVpFnqkw6UULotGKSPIVwpOI5iMWyDQVvpONeOwvKfu+AWeB0dLuNxqjkh5+AuMEGGUWkUpSmgsBQrT/2lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C7cNF20w; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C7cNF20w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747335431; x=1778871431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IYL7EdfHAM81Q1gdxcYzuPiDjRJkbelHfay8ERqG8KQ=;
  b=C7cNF20w53mLaR1IDiuFY9khVsl1OZdgBaZv4rFmE8tasVFmv1PozmCF
   DEjgUosLULiHaH3xVNuYoUn1RrtgSO4bQGigmKS9ShvjxH5DC/mISgX4l
   v7hma+k8kosgHrARwHNOeLArnjgr3CTRDE2hF3LWbjaUnb7uuLQrk3qhJ
   zIWZraI/DknGwtmTeHZmFNfMXlknpKMFVm+ueqTgMRgLIw78unA50oeoK
   TSKD26SfzwbNjV3FawIx1n8YJiF3P2FOG3IsREfObhNWV5swps6gO5V1Q
   pN+SBhvzGSQOU6oBA3LjFLMFXHA2PrvVh+bQD8TrSL4slY6KtWfZCL6Gy
   Q==;
X-CSE-ConnectionGUID: e5+EcTixTtijMZqiGCe5FA==
X-CSE-MsgGUID: 3Kgjyv5+RCSTx3WYs1Lx4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60629868"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="60629868"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 11:57:10 -0700
X-CSE-ConnectionGUID: Zf7sOAgfSm68UMrkOu9b0A==
X-CSE-MsgGUID: 41C3NqSKQIy4QC+0r+EidA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="138334655"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa006.jf.intel.com with ESMTP; 15 May 2025 11:57:09 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFdlS-0000Ib-1q;
	Thu, 15 May 2025 18:57:06 +0000
Date: Fri, 16 May 2025 02:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.16-armsoc/dts64 49/86]
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: i2c@ffa58000
 (rockchip,rk3528-i2c): Unevaluated properties are not allowed ('compatible'
 was unexpected)
Message-ID: <202505160234.7II6wU1t-lkp@intel.com>
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
TO: Yao Zi <ziyao@disroot.org>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Jonas Karlman <jonas@kwiboo.se>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.16-armsoc/dts64
head:   1631cbdb808963354ef6b6454bc617cd15f90718
commit: 101fe8b5627c68b3f2f941266e26ac355131e2fe [49/86] arm64: dts: rockchip: Add onboard EEPROM for Radxa E20C
:::::: branch date: 6 hours ago
:::::: commit date: 10 days ago
config: arm64-randconfig-2051-20250514 (https://download.01.org/0day-ci/archive/20250516/202505160234.7II6wU1t-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505160234.7II6wU1t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505160234.7II6wU1t-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	['rockchip,rk3528-i2c', 'rockchip,rk3399-i2c'] is too long
   	'rockchip,rv1108-i2c' was expected
   	'rockchip,rk3066-i2c' was expected
   	'rockchip,rk3188-i2c' was expected
   	'rockchip,rk3228-i2c' was expected
   	'rockchip,rk3288-i2c' was expected
   	'rockchip,rk3399-i2c' was expected
   	'rockchip,rk3528-i2c' is not one of ['rockchip,rk3036-i2c', 'rockchip,rk3128-i2c', 'rockchip,rk3368-i2c']
   	'rockchip,rk3528-i2c' is not one of ['rockchip,px30-i2c', 'rockchip,rk3308-i2c', 'rockchip,rk3328-i2c', 'rockchip,rk3562-i2c', 'rockchip,rk3568-i2c', 'rockchip,rk3576-i2c', 'rockchip,rk3588-i2c', 'rockchip,rv1126-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-rk3x.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: i2c@ffa58000 (rockchip,rk3528-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-rk3x.yaml#
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/i2c@ffa58000: failed to match any schema with compatible: ['rockchip,rk3528-i2c', 'rockchip,rk3399-i2c']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: i2c@ffa60000 (rockchip,rk3528-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3528-i2c', 'rockchip,rk3399-i2c'] is too long
   	'rockchip,rv1108-i2c' was expected
   	'rockchip,rk3066-i2c' was expected
   	'rockchip,rk3188-i2c' was expected
   	'rockchip,rk3228-i2c' was expected
   	'rockchip,rk3288-i2c' was expected
   	'rockchip,rk3399-i2c' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
