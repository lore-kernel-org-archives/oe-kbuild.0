Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01822C11C2
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Sep 2025 07:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757662053; cv=none; b=jeLf6z7eEbgS0KlF6amloJYgwjif0vczpBb4XxpMuK25ZDGMICAR/xNvC/HdTzg01bG/xTZd4dqnilrkY62TfPWRLn6Dnjq4D6+FYHvFIyp/dJ2s87+7/OLy8VsNyVQxh9wd5hO4kNRv4cLQee7fPF26RBt1+t2bOLM6rGZgKr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757662053; c=relaxed/simple;
	bh=z9EpCSrsRbJ5GP8RANrpgcB1jwPa+00DfjJhSMjtLno=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WRkU/4JX+g3jRnv6mKO+co/XpADMYRia5yHd0zLBfPeeAbfhkANWf59tm7vVHk5dLO1kovjDQSro+7XUKsHlp9nbaxI4CdY9ErLgWAki0vXEKG8cwgPWawQ/TvwhL3p3Jo3ySy84Wtw6TLZh+jqOvG3hJ6LcrcwEeVd9Hbt+VmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bNW4vPvT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bNW4vPvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757662051; x=1789198051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z9EpCSrsRbJ5GP8RANrpgcB1jwPa+00DfjJhSMjtLno=;
  b=bNW4vPvTD3A/9qchVBVLmWVOY5wG5fjlSehrZUWomG1GHl6cc35X3Zg7
   Uvaxf41oeJ730zMZOH01p74yKpYe/K6yy34sG6fgTi5xsC7q1p0cQRxot
   xoWKBg1JBjn3Zux0xhi17PUm8bXzNcihQ6sMaeP7UyNGApKpVaOvLQ7p/
   ywXMXpGVWRrPbnTsNhgUfpaOValXMKFEX0khATrd+o+aKaEWPbJdzrrSd
   zPeI1sTBQX1179H6pFqTtMaahVG4qHaXPMzMIUmIa78gKES6k3GJOan7c
   Yjg79mkqF3aOUIUO37d+pYNzzF0j9ol1e1c5Fc86A5MubUM115SrWKjCz
   A==;
X-CSE-ConnectionGUID: MoYlC9TITnyLj3Mqorvamw==
X-CSE-MsgGUID: 8OmUHWTZTt6df05MhytBiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="59941182"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="59941182"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 00:27:30 -0700
X-CSE-ConnectionGUID: NI8B87nCSKikV61dM5zSgA==
X-CSE-MsgGUID: J49Yt6TgRJiWA7v8Qn9geg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="178216750"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 12 Sep 2025 00:27:29 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwyBr-0000tw-05;
	Fri, 12 Sep 2025 07:27:27 +0000
Date: Fri, 12 Sep 2025 15:27:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/4] dt-bindings: net: dsa: nxp,sja1105: Add reset-gpios
 property
Message-ID: <202509121544.xjMW31ah-lkp@intel.com>
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
In-Reply-To: <20250910-imx8mp-prt8ml-v1-1-fd04aed15670@pengutronix.de>
References: <20250910-imx8mp-prt8ml-v1-1-fd04aed15670@pengutronix.de>
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

Hi Jonas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d34bbb45b57c90a5c1bcac5f327df79ddfbfe957]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonas-Rebmann/dt-bindings-net-dsa-nxp-sja1105-Add-reset-gpios-property/20250910-203727
base:   d34bbb45b57c90a5c1bcac5f327df79ddfbfe957
patch link:    https://lore.kernel.org/r/20250910-imx8mp-prt8ml-v1-1-fd04aed15670%40pengutronix.de
patch subject: [PATCH 1/4] dt-bindings: net: dsa: nxp,sja1105: Add reset-gpios property
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-051-20250911 (https://download.01.org/0day-ci/archive/20250912/202509121544.xjMW31ah-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250912/202509121544.xjMW31ah-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509121544.xjMW31ah-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:907.28-915.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dtb: switch@0 (nxp,sja1105q): Unevaluated properties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/nxp,sja1105.yaml#
   arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dtb: cpu@2 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dtb: cpu@3 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
--
>> arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: switch@0 (nxp,sja1105q): Unevaluated properties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/nxp,sja1105.yaml#
   arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: mmc@1 (prt,prtt1c-wfm200): $nodename:0: 'mmc@1' does not match '^wifi(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/wireless/silabs,wfx.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
