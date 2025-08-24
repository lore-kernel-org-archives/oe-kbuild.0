Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953C821348
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Aug 2025 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756042471; cv=none; b=Hghg9NA7M0M7y0rxlGVZMHNVVkRJH0AsgsyiBszr40tBETlB2svNIUqxtmH2+K/nOPi5gz4nr5appg/6/gYLGbaUve1jC0Yab+hJeYNGxsGXQhaNuLkVutm7Lefc4da8kLxXOmLXyShKg7kKtYg4abOLbeke3GzUBdY6KuNuBP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756042471; c=relaxed/simple;
	bh=RqJzdQhJMXA0f3LV9XnjnvnL4wpiSlUAQv9+TNoUjeM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LbOLOCYoyhG49NlVA944J2rRlG4JGCFrwmCwFHPWF+FBTBlf7l5zPdUccFYWdni0/r0Mh2eyUPtvbnmebSpwUpMRHO9vs4VQV24LZ9j8ww84cwt59y/K13jnnM1H1nYff4rgTaEAa/+YXtopnIecUF/xs2qTwGn1ycO0kZzJQ9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8aIxfWa; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8aIxfWa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756042470; x=1787578470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RqJzdQhJMXA0f3LV9XnjnvnL4wpiSlUAQv9+TNoUjeM=;
  b=N8aIxfWaptTm4CGX9wI7+ksVOz1gJdYjzYstg97EL143amNvNvKFADZA
   4pnYhoUQF6Y1r2pSjSFfqu5JvNzn1RJ3JoUj82u8hDUVGnYuiQAhKhoNz
   4BzeXZquZFC2k149vM2rRNfX77BfDQIxMz2PYgcbHBC46JfAzeq7v0qCF
   Idet3vob/d0MKGhK374Sb+8Fd4fb5R5a0aPm2u+K1uIE7aKHQhq75qpJb
   jY//DU6VFITf/BjOlKWr3EQv/QVaKNJnwhE1Qfpea4jw0qqA6OOWdvF4R
   AvFOaEi+ns45yexj/saDGvx3UbyTmLj5bY4LpFeJdREaubVyLrnA2DaMd
   w==;
X-CSE-ConnectionGUID: hR7WS/OpT/2BetKSP38VTg==
X-CSE-MsgGUID: 4/wALsc7Sb2BUtlZ5ueJuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58193739"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58193739"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 06:34:29 -0700
X-CSE-ConnectionGUID: 32tSegxcQHecj6zNsqEyhQ==
X-CSE-MsgGUID: NHkxWTLpQoWuDcghX6xhjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168998944"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 Aug 2025 06:34:28 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqArZ-000N0R-2k;
	Sun, 24 Aug 2025 13:34:25 +0000
Date: Sun, 24 Aug 2025 21:33:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.18-armsoc/dts64 18/29]
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: adc@ffae0000
 (rockchip,rk3528-saradc): 'power-domains' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202508242108.UzfqMWyx-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.18-armsoc/dts64
head:   b3d7fb3fb2227259aa2fc54916cc808614f3ac24
commit: 178879625f0f10ff708728087d91a5fe79990ce2 [18/29] arm64: dts: rockchip: Enable more power domains for RK3528
:::::: branch date: 3 hours ago
:::::: commit date: 7 hours ago
config: arm64-randconfig-052-20250824 (https://download.01.org/0day-ci/archive/20250824/202508242108.UzfqMWyx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508242108.UzfqMWyx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508242108.UzfqMWyx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:240.6-1136.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/syscon@ff348000: failed to match any schema with compatible: ['rockchip,rk3528-pipe-phy-grf', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: adc@ffae0000 (rockchip,rk3528-saradc): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/rockchip-saradc.yaml#
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/phy@ffdc0000: failed to match any schema with compatible: ['rockchip,rk3528-naneng-combphy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
