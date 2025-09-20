Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51391D7E5C
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Sep 2025 02:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758336062; cv=none; b=gz3eYj1NsNRgLJdbWSQ4hl92dFq7/ocAtXjqkBw5FsFH8mV+2WFtbNYKyFhGg4qPAg1LbpqxM6sB+5bUb+pBmu2DzOzZFzw+XcS3nDSG9y7xd+EWcGrBc4gWfLG/qGKvztxAlYej9f/6ym0Tkvix3SC8G9lekNVT61+qHvgNEOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758336062; c=relaxed/simple;
	bh=tpi7affaxNg2OFjdZVvnyeAipIeHX9+2nSCYG336Uf0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VDZcLOKk1OQGBod1SxeewnGasEsnqLKGS952jHoSLmbSSNghWntgS8ql7Be6f4yhtxC6IyyMh9d80L/UHCn8aNwTPxL/hMEOcvNnvDDyoYCaxsWXCdVU4FzOr4h8WOsF2apyQOECIUSWjpggIv3JsMWKDeIetO6AY/YVCsPwp5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bSLAzitz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSLAzitz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758336060; x=1789872060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tpi7affaxNg2OFjdZVvnyeAipIeHX9+2nSCYG336Uf0=;
  b=bSLAzitzVO+AdRCe2BbSSNr/y3Kd9AuHSQsF4VVaMAwYCvXHiOPflz2+
   /0y5qH5yrer9EldIHG04rEUQCseUzlOEhDYAZEk7KHRkE5gnT8BbfzbsJ
   2cHtA7QdNmgA3xUy08Ojb9dU5OWd6O9134oQP6FoGd8GK+dMlTVmj58b6
   oD/1OuAatH02pEqpCKqxPX17EkrAviUYE+oSCKO5xPtzPmmILW71S+0Vd
   mSTRDY0z1m6y7fQVVmqS2GmahSba6wINSwjPn/9abFKQHKBiEhTtHgpG3
   Oxuk1JMUm5kFHigVkZofZiBbktsVmc8TBh83OAz1llLzQ+TY7qPhDG5fN
   g==;
X-CSE-ConnectionGUID: Mq95YogdRkGLtTx4eDd/sA==
X-CSE-MsgGUID: GaAbrNkmS0GBJhPLgtu8QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="60837791"
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; 
   d="scan'208";a="60837791"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 19:41:00 -0700
X-CSE-ConnectionGUID: HmDOmAgJSsqJcVSn0XPSbw==
X-CSE-MsgGUID: qmdIkPt7S5ydlmYSdXtE7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; 
   d="scan'208";a="175792756"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Sep 2025 19:40:58 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uznWx-0004yp-2G;
	Sat, 20 Sep 2025 02:40:55 +0000
Date: Sat, 20 Sep 2025 10:40:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/3] arm64: dts: add Protonic PRT8ML board
Message-ID: <202509201033.EBlHijce-lkp@intel.com>
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
In-Reply-To: <20250918-imx8mp-prt8ml-v2-3-3d84b4fe53de@pengutronix.de>
References: <20250918-imx8mp-prt8ml-v2-3-3d84b4fe53de@pengutronix.de>
TO: Jonas Rebmann <jre@pengutronix.de>
TO: Andrew Lunn <andrew@lunn.ch>
TO: Vladimir Oltean <olteanv@gmail.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Shengjiu Wang <shengjiu.wang@nxp.com>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-sound@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: Jonas Rebmann <jre@pengutronix.de>
CC: David Jander <david@protonic.nl>
CC: Lucas Stach <l.stach@pengutronix.de>
CC: Oleksij Rempel <o.rempel@pengutronix.de>

Hi Jonas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ea21fa34164c9ea0a2a5b8714c7e36f54c7fb46e]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonas-Rebmann/dt-bindings-net-dsa-nxp-sja1105-Add-reset-gpios-property/20250918-202530
base:   ea21fa34164c9ea0a2a5b8714c7e36f54c7fb46e
patch link:    https://lore.kernel.org/r/20250918-imx8mp-prt8ml-v2-3-3d84b4fe53de%40pengutronix.de
patch subject: [PATCH v2 3/3] arm64: dts: add Protonic PRT8ML board
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250919 (https://download.01.org/0day-ci/archive/20250920/202509201033.EBlHijce-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509201033.EBlHijce-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509201033.EBlHijce-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: codec@11 (asahi-kasei,ak4458): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/asahi-kasei,ak4458.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: isp@32e10000 (fsl,imx8mp-isp): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[77, 6], [77, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: isp@32e20000 (fsl,imx8mp-isp): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[77, 6], [77, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
