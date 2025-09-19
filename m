Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D588F30DEC6
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Sep 2025 10:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758277958; cv=none; b=jPeP0caV9lQOVJsDZTe1pwT62WeXYwXzOl6R1sAUaGyVsH5+/iJxkS76S7OJvjFJfBz3V23FI4Q75VDiROJq8CAvEdJGTW7XddFulPhoXh7U4ndTHHEu5IRTsFCQUiboqSOJrYAuA7GmIl5bmz6itPeyePPi9qV3JQ3xb1AwoAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758277958; c=relaxed/simple;
	bh=+kbMOBLkpU0ZKskhP1S/IWT7hjLzwlYbZ+Nxi2p/0Po=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CMFXu02gWeCesXb8/O+nEjTo8l9rULsGy49VRJxxdBA+Ok4TplNNGQpZH1lZ9rcHcldhqSZhXgx8OhB2eOVO+mluZpxF3I59E569E411YsL6/o6mFQid7mdVBYX2N7DDncetH6Bcfgqzz5eyH2Vzzw9v5nh7bGkN9R8EqDw3EWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bt98VV6n; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bt98VV6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758277957; x=1789813957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+kbMOBLkpU0ZKskhP1S/IWT7hjLzwlYbZ+Nxi2p/0Po=;
  b=Bt98VV6nk8zloKl8dpyISPacJdiB9m3NM6G9WKqcSbp+hqBdB6ieiver
   Ng72vRhOH22+9Qgn/FB4eadAzeKat7/pP9gc2S6LnayJv1NZDTgxDHsAa
   /JuuMOUpLcMtEw03RcziU6O/wnqgrLGlr3FprZzH2SXjoy/SFdLr9AVOX
   7bETvPbcjgYUmAU9kQlbbLHIkVxby8Cy2k6+s5Fu5MTr1OOmfwB1yBrB4
   EsbLwMg+wCnfjtM5GPvUH70bCuQsVl0AZKeWZauRzkb8ICXiNMlLMt+5G
   Os9bUXwcoBRutMqvHT15MtM4igV39vJAL+KXQRKxqe2VEasK632K5ePHH
   g==;
X-CSE-ConnectionGUID: A+TNQ+YgSY6NvhER2aIUQA==
X-CSE-MsgGUID: Q2W+dwycTh2prl6mhZFzEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64426490"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64426490"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 03:32:37 -0700
X-CSE-ConnectionGUID: 8D87wdylSwaP2phH7hRK+g==
X-CSE-MsgGUID: DK/fmhWdQ9GPAJoSrxgu2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="176248162"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 19 Sep 2025 03:32:35 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uzYPp-000000003Jd-1SAc;
	Fri, 19 Sep 2025 10:32:33 +0000
Date: Fri, 19 Sep 2025 12:32:18 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/3] arm64: dts: add Protonic PRT8ML board
Message-ID: <202509191221.mdXrrnBi-lkp@intel.com>
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
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-2051-20250919 (https://download.01.org/0day-ci/archive/20250919/202509191221.mdXrrnBi-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509191221.mdXrrnBi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509191221.mdXrrnBi-lkp@intel.com/

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
