Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD79C2D978C
	for <oe-kbuild@lists.linux.dev>; Fri,  8 May 2026 10:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778237397; cv=none; b=hYXeskamhvHrZ6PMxxjNn0VeOU7HPM4GuzVUVf3AG892kIuov8pYwU57nUeh/8OGV5i2Oub3JWAtFhfMSFSmzY3J7tvMnb7LRkvJKOKzivZgNC/3BC2PFa8j/HLlM+bQ6rwyehvETd6V3QsGZL4+CzULv1Rtsv8L03LYv0eaHOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778237397; c=relaxed/simple;
	bh=LAlDWTd2lfOuE9slf1wz4eCV8dreK6Av4rLcMZc8LSU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VAaWQMaWa+L8nnvuB8sA5qoMddlMiHByZXXKXal6YO0TqPLtA374zJ/3MWy3GMOvqwAOVAB4Saw7NwUKlAxdr5EMhoEC0vj4IuaAbZhngTcn5ZPeJSNaXuliSecbXuLR68B6I0srRFbuNDixyzwh2yUbvoCej0PRx1hks01PfTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YdJx+B8I; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YdJx+B8I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778237396; x=1809773396;
  h=date:from:to:cc:subject:message-id;
  bh=LAlDWTd2lfOuE9slf1wz4eCV8dreK6Av4rLcMZc8LSU=;
  b=YdJx+B8IJzq1SsTRQ01t2vPa0XRQnfs9213LusXYKqPrHTq307e7h4eb
   6quYbAXqn7ap2ySlpByKcCV8Iciy2MrvJ6jA4dV4E+v/lQIkQN78JiC1g
   X8ojWn+ZX6gx3m4eicG4Fn+PlEz0Uf+46wFZTSVurUplFKo6Z1Dbsbjt/
   HlwcvJrCL5233k0lmE/t6sx4DZhzzvh/c4oAVKeQCPI69MOhZ+fTk6DL8
   YS1kegRmaYQvclIdcYpEK4kBwsB5eo7QdFjfWrunQr3YY8JCulIY504/f
   j14EurVCxhp/PJiPk9/CJ8DnsNervXhfc33nSTrBEU4S+Od2jdAyCMyrs
   w==;
X-CSE-ConnectionGUID: X16UICbHTwmJ+E02AOi0+w==
X-CSE-MsgGUID: CpaakWhLTcCQkV3YknLFjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="89792588"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="89792588"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 03:49:55 -0700
X-CSE-ConnectionGUID: i2CEedAYSGO3iJDEjFZAQg==
X-CSE-MsgGUID: UB9NUmkbQ/S7/z0jGty0Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="236860325"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 08 May 2026 03:49:54 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLImF-0000000079F-3App;
	Fri, 08 May 2026 10:49:51 +0000
Date: Fri, 08 May 2026 12:49:49 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v7.2-armsoc/dts64 30/30]
 arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dtb: watchdog@ffac0000
 (rockchip,rk3528-wdt): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202605081214.tMY9PIvm-lkp@intel.com>
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
CC: linux-rockchip@lists.infradead.org
TO: Jonas Karlman <jonas@kwiboo.se>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v7.2-armsoc/dts64
head:   eb24b60553e0692cbbec2863ca31d2a56bff098d
commit: eb24b60553e0692cbbec2863ca31d2a56bff098d [30/30] arm64: dts: rockchip: Add watchdog node for RK3528
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arm64-randconfig-2055-20260507 (https://download.01.org/0day-ci/archive/20260508/202605081214.tMY9PIvm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605081214.tMY9PIvm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605081214.tMY9PIvm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:280.6-1284.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dtb: watchdog@ffac0000 (rockchip,rk3528-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3528-wdt', 'snps,dw-wdt'] is too long
   	'snps,dw-wdt' was expected
   	'rockchip,rk3528-wdt' is not one of ['rockchip,px30-wdt', 'rockchip,rk3066-wdt', 'rockchip,rk3128-wdt', 'rockchip,rk3188-wdt', 'rockchip,rk3228-wdt', 'rockchip,rk3288-wdt', 'rockchip,rk3308-wdt', 'rockchip,rk3328-wdt', 'rockchip,rk3368-wdt', 'rockchip,rk3399-wdt', 'rockchip,rk3506-wdt', 'rockchip,rk3562-wdt', 'rockchip,rk3568-wdt', 'rockchip,rk3576-wdt', 'rockchip,rk3588-wdt', 'rockchip,rv1108-wdt', 'rockchip,rv1126-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/snps,dw-wdt.yaml
>> arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dtb: /soc/watchdog@ffac0000: failed to match any schema with compatible: ['rockchip,rk3528-wdt', 'snps,dw-wdt']
--
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:280.6-1284.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dtb: watchdog@ffac0000 (rockchip,rk3528-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3528-wdt', 'snps,dw-wdt'] is too long
   	'snps,dw-wdt' was expected
   	'rockchip,rk3528-wdt' is not one of ['rockchip,px30-wdt', 'rockchip,rk3066-wdt', 'rockchip,rk3128-wdt', 'rockchip,rk3188-wdt', 'rockchip,rk3228-wdt', 'rockchip,rk3288-wdt', 'rockchip,rk3308-wdt', 'rockchip,rk3328-wdt', 'rockchip,rk3368-wdt', 'rockchip,rk3399-wdt', 'rockchip,rk3506-wdt', 'rockchip,rk3562-wdt', 'rockchip,rk3568-wdt', 'rockchip,rk3576-wdt', 'rockchip,rk3588-wdt', 'rockchip,rv1108-wdt', 'rockchip,rv1126-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/snps,dw-wdt.yaml
>> arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dtb: /soc/watchdog@ffac0000: failed to match any schema with compatible: ['rockchip,rk3528-wdt', 'snps,dw-wdt']
--
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:280.6-1284.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: watchdog@ffac0000 (rockchip,rk3528-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3528-wdt', 'snps,dw-wdt'] is too long
   	'snps,dw-wdt' was expected
   	'rockchip,rk3528-wdt' is not one of ['rockchip,px30-wdt', 'rockchip,rk3066-wdt', 'rockchip,rk3128-wdt', 'rockchip,rk3188-wdt', 'rockchip,rk3228-wdt', 'rockchip,rk3288-wdt', 'rockchip,rk3308-wdt', 'rockchip,rk3328-wdt', 'rockchip,rk3368-wdt', 'rockchip,rk3399-wdt', 'rockchip,rk3506-wdt', 'rockchip,rk3562-wdt', 'rockchip,rk3568-wdt', 'rockchip,rk3576-wdt', 'rockchip,rk3588-wdt', 'rockchip,rv1108-wdt', 'rockchip,rv1126-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/snps,dw-wdt.yaml
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/watchdog@ffac0000: failed to match any schema with compatible: ['rockchip,rk3528-wdt', 'snps,dw-wdt']
--
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:280.6-1284.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dtb: watchdog@ffac0000 (rockchip,rk3528-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3528-wdt', 'snps,dw-wdt'] is too long
   	'snps,dw-wdt' was expected
   	'rockchip,rk3528-wdt' is not one of ['rockchip,px30-wdt', 'rockchip,rk3066-wdt', 'rockchip,rk3128-wdt', 'rockchip,rk3188-wdt', 'rockchip,rk3228-wdt', 'rockchip,rk3288-wdt', 'rockchip,rk3308-wdt', 'rockchip,rk3328-wdt', 'rockchip,rk3368-wdt', 'rockchip,rk3399-wdt', 'rockchip,rk3506-wdt', 'rockchip,rk3562-wdt', 'rockchip,rk3568-wdt', 'rockchip,rk3576-wdt', 'rockchip,rk3588-wdt', 'rockchip,rv1108-wdt', 'rockchip,rv1126-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/snps,dw-wdt.yaml
>> arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dtb: /soc/watchdog@ffac0000: failed to match any schema with compatible: ['rockchip,rk3528-wdt', 'snps,dw-wdt']
--
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:280.6-1284.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dtb: watchdog@ffac0000 (rockchip,rk3528-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3528-wdt', 'snps,dw-wdt'] is too long
   	'snps,dw-wdt' was expected
   	'rockchip,rk3528-wdt' is not one of ['rockchip,px30-wdt', 'rockchip,rk3066-wdt', 'rockchip,rk3128-wdt', 'rockchip,rk3188-wdt', 'rockchip,rk3228-wdt', 'rockchip,rk3288-wdt', 'rockchip,rk3308-wdt', 'rockchip,rk3328-wdt', 'rockchip,rk3368-wdt', 'rockchip,rk3399-wdt', 'rockchip,rk3506-wdt', 'rockchip,rk3562-wdt', 'rockchip,rk3568-wdt', 'rockchip,rk3576-wdt', 'rockchip,rk3588-wdt', 'rockchip,rv1108-wdt', 'rockchip,rv1126-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/snps,dw-wdt.yaml
>> arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dtb: /soc/watchdog@ffac0000: failed to match any schema with compatible: ['rockchip,rk3528-wdt', 'snps,dw-wdt']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
