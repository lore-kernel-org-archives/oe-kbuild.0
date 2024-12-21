Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D29149C7D
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Dec 2024 18:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734804213; cv=none; b=BOPd77mxzoLHyhhfkLE6cL1xjiemSyZLkZvLgRDFKyCZ4UWc162MK4a5aIULWJZvhwFI8m+dBiqv60Z3QHboLS2SSVfv5uvl/Vzx4Cq906FDWsRhBlXLmCFm5rDsGuIslJt7uKrzK2/6MWhwsoK/7vq6xkrHpjemf9QfoYyyLvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734804213; c=relaxed/simple;
	bh=OJL+c+cF0x6B7givUuaWaJcGEwPXjbOl1PdpgDd6SZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TbufsI2ljD2CRe8wq3W9K5xzRwCF3IzDv8lVcj/HA2dXGwj43eP2SahpXyO27OS/X6YMF57Ycwf567BsK1PfsAJ9jI2qC24nspYcZBIej6c5jgNLq9Zi1mNRWPIlXoJMswEi9Ho8e/k9+NgTXDovPyM+/4OKqfAncJpjit5pMDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=det65RvA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="det65RvA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734804212; x=1766340212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OJL+c+cF0x6B7givUuaWaJcGEwPXjbOl1PdpgDd6SZU=;
  b=det65RvAGw0dDhd333FiEAMPICW04dS42arcD36wO0OQFKP8mR8UpuZw
   hRKChJr2ItGTsaZrXWw9EaOaihLOOULAwgOBw15zlVZ4c/DH7+JZbqbII
   Ubj60oRkTisbpSUibHclX6rV1CIOXMiC1+lQ2yZlvdUc9i7FwhgM4kOGi
   TtRtFvC3T/w9664pCE3OFj6FgvHIQV5oqiymMVgPgEEZu+KpV0gbQP+dJ
   9SFSRaU7DbSPb1iPgcUDqlHQ+DFdFbGotU7tXGv+j1AmSKvqBhy3zn4W8
   0ZUkYvFYQxH+0oNMur3FN847prTRkNlccz/QHwAmnBzmYGjWI/a6WrceV
   g==;
X-CSE-ConnectionGUID: DsaifyrZRmCbFVdqqeukTw==
X-CSE-MsgGUID: XhuPzFNgTQu3faR88wK9KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35219219"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35219219"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 10:03:29 -0800
X-CSE-ConnectionGUID: jKd0Ot5yQZ+woKBjJzDj6A==
X-CSE-MsgGUID: 7PQIJtyFSeWoCZJuQ7zDcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122097764"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Dec 2024 10:03:28 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP3oz-0002MR-1M;
	Sat, 21 Dec 2024 18:03:25 +0000
Date: Sun, 22 Dec 2024 02:03:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/6] arm64: dts: imx8mp: Configure dsp node for rproc
 usage
Message-ID: <202412220120.DaktyK7z-lkp@intel.com>
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
In-Reply-To: <20241210125338.104959-3-daniel.baluta@nxp.com>
References: <20241210125338.104959-3-daniel.baluta@nxp.com>
TO: Daniel Baluta <daniel.baluta@nxp.com>
TO: shawnguo@kernel.org
TO: s.hauer@pengutronix.de
TO: kernel@pengutronix.de
TO: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: festevam@gmail.com
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: frank.li@nxp.com
CC: aisheng.dong@nxp.com
CC: daniel.baluta@gmail.com
CC: laurentiu.mihalcea@nxp.com
CC: shengjiu.wang@nxp.com
CC: iuliana.prodan@nxp.com
CC: a.fatoum@pengutronix.de
CC: Daniel Baluta <daniel.baluta@nxp.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on abelvesa/clk/imx robh/for-next linus/master v6.13-rc3 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Baluta/arm64-dts-imx8mp-Add-mu2-root-clock/20241210-205708
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20241210125338.104959-3-daniel.baluta%40nxp.com
patch subject: [PATCH v3 2/6] arm64: dts: imx8mp: Configure dsp node for rproc usage
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: arm64-randconfig-051-20241221 (https://download.01.org/0day-ci/archive/20241222/202412220120.DaktyK7z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220120.DaktyK7z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412220120.DaktyK7z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: dsp@3b6e8000: memory-region: [[148]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: dsp@3b6e8000: memory-region: [[144]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: dsp@3b6e8000: memory-region: [[119]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: dsp@3b6e8000: memory-region: [[118]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: dsp@3b6e8000: memory-region: [[160]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: dsp@3b6e8000: memory-region: [[152]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: dsp@3b6e8000: memory-region: [[156]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: dsp@3b6e8000: memory-region: [[158]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: dsp@3b6e8000: memory-region: [[102]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: dsp@3b6e8000: memory-region: [[107]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: dsp@3b6e8000: memory-region: [[150]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: dsp@3b6e8000: memory-region: [[155]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: dsp@3b6e8000: memory-region: [[140]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: /soc@0/bus@30800000/i2c@30ae0000/gpio@20: failed to match any schema with compatible: ['microchip,mcp23018']
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: dsp@3b6e8000: memory-region: [[105]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: dsp@3b6e8000: memory-region: [[124]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: dsp@3b6e8000: memory-region: [[127]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: dsp@3b6e8000: memory-region: [[105]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: dsp@3b6e8000: memory-region: [[127]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: dsp@3b6e8000: memory-region: [[136]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: dsp@3b6e8000: memory-region: [[132]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: dsp@3b6e8000: memory-region: [[164]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: dsp@3b6e8000: memory-region: [[159]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: dsp@3b6e8000: memory-region: [[158]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: dsp@3b6e8000: memory-region: [[169]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: dsp@3b6e8000: memory-region: [[164]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: dsp@3b6e8000: memory-region: [[163]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: dsp@3b6e8000: memory-region: [[130]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: dsp@3b6e8000: memory-region: [[153]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: dsp@3b6e8000: memory-region: [[136]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
