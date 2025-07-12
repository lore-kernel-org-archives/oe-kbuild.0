Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B792C181
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Jul 2025 17:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752341708; cv=none; b=b/dQSUSNwtq1EyocNuMlTftXcSwfVuurBL5k9JnTQ3s1LGxbAupkq0YuCwkVvqoXYRYbf040mG6HkqSWrJBCa9bH/tZ/Npjd3DZLwdajYUy/JSMrXr992XoWOqeLYqOiizYt+HmK9RCfLL6YthHtngkgHQSY0rBcVLbXMrY8nSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752341708; c=relaxed/simple;
	bh=2DpFRnQ0IPivgZEayr18fgafhSE5vaeQyQcrQMfdbXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HU1fL2voLY1pCsb2PV6/wp9hQc96yRhZI72onfnr08IdGTr4RI1tzt4471Lksu3w9zE7hJ6UF1EfMo0gZIteUshEBgWergutvXptsAaqsQWaQBBPWZC2EzQ3f6JIZShfUz3wBNEPIpyRsOqiD0Pf92qBt6PU5PpHfF0JSzLgiH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lGSOHPw6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lGSOHPw6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752341707; x=1783877707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2DpFRnQ0IPivgZEayr18fgafhSE5vaeQyQcrQMfdbXs=;
  b=lGSOHPw6rWzbyjmbvM4JqApNeOkdTKbkD54MG/jSSIrhWJWh/r28sqgk
   tPeePFya7KX3q2ElRAgEqY5gfwwekvgj4NbNGBu4D7pvtjrGcxSq8qrBQ
   lsgY5dHjtzpdQgccIAl15UkrjHl5qUlldgomuJqfsi6x5X4Re6kS9IiE3
   ga7ljjQ/e2CuHBb0x94r5UCEope8cZzT9LQYsWt5C1H9yBPNF23RP8Vsv
   UME+3O43Zpyg+Bucz3VrvhATqbropdfQHwKqd5TLlsdEQUfNx+ah4MeMm
   MVXRcYpjipsCfAhT5mDWCz5NmeDWJ31CUIyCbV22GlTnuV0CYc0mwf1wk
   Q==;
X-CSE-ConnectionGUID: 5FlK+fYETreTwjGbKXGKIg==
X-CSE-MsgGUID: lBkdqEzZTsa9tcpGchFTBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="64862266"
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="64862266"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 10:35:06 -0700
X-CSE-ConnectionGUID: rqnIZJ6ZSFuSEtqa0d/nSQ==
X-CSE-MsgGUID: EY/QcINXQeaaZfpTX6Ek4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="156402820"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Jul 2025 10:35:05 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uae7r-0007Xv-08;
	Sat, 12 Jul 2025 17:35:03 +0000
Date: Sun, 13 Jul 2025 01:34:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.17-armsoc/dts64 55/56]
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dtb: camera@1a
 (sony,imx258): 'lens-focus', 'orientation', 'rotation' do not match any of
 the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202507130123.xyLbJ8Ms-lkp@intel.com>
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
TO: Olivier Benjamin <olivier.benjamin@bootlin.com>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Ondrej Jirman <megi@xff.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.17-armsoc/dts64
head:   b45f9f910aa28fc6151ac5d1ff107522b4a6b1af
commit: 9336eb829a18bba910620cb2e3fc55fcdd4aeecc [55/56] arm64: dts: rockchip: describe I2c Bus 1 and IMX258 world camera on PinePhone Pro
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: arm64-randconfig-051-20250712 (https://download.01.org/0day-ci/archive/20250713/202507130123.xyLbJ8Ms-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507130123.xyLbJ8Ms-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507130123.xyLbJ8Ms-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1984.9-1993.5: Warning (graph_child_address): /isp1@ff920000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1988.11-1992.6: Warning (graph_child_address): /isp1@ff920000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dtb: camera@1a (sony,imx258): 'lens-focus', 'orientation', 'rotation' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/sony,imx258.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
