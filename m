Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0201F8EE1
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Nov 2024 13:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730898270; cv=none; b=BN5hHDnvclVIiNWMGZ/d1vRcwKv27nlGiAEIsIrfL26yLJHqRcz9qdTw5Z8GEWTYxHqof4NczqaD2p1Z2qfdWldSuPGtwBn3DKdKEq+ksWnVMfp9VgS9DsPkHmF4Zos9/GXVBrT1yj2cUJOwo+mz6KTqSx+CqLIMWgSLaw2K9qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730898270; c=relaxed/simple;
	bh=mzY4xILYQLpy52xCLL7KzkRVW6cNTRtGcUZIbpOvDC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rn9b20pDyibqd1gBJ9djciajP9EPihJz0ggLe3ZzyxaUuPpoI2TP6ElE+19CYcXX4xD20PBhBYp2Q7OqVCHTfdzs5IB21NoNVo4X+rJhE5k9eH1qD6Eu9BIUDU3lrVRIKp3oIN8twW9cCsc7JATBGexPBiOcG8u5IMsTl0nqIDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+DVKT7z; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+DVKT7z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730898267; x=1762434267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mzY4xILYQLpy52xCLL7KzkRVW6cNTRtGcUZIbpOvDC4=;
  b=m+DVKT7zwEa/MVWcPAUrimJZv+dUsCRHoXvF7j1O9CUiqkkOK+tlH6Ky
   zzXJKYINJUsCi0jpl+uxgxVxPZ6BRRc4u5rzfBihe+S6JYpj2xyCHzD5u
   m1Nces0PzTm6+BQ7+vIEzxG+h71hEniK2AhFpGDv/+o4xig8IXvv4nqWY
   ah7VDZYHeCYiKlDfeiqoGrMnc+SkgYI+icZFEdDgNvJzJ0mvGxPJVA8ab
   R/44RPTb00RojYSFoa0gfkqyTSVosaDkyc881/SeTHO8j9B1TAy7tvfqX
   RbGI2PLiwQxhZpRKgLZP/uOeowtQdtRqwz/0WOv4dsMCsvEf+wNxc+g6j
   w==;
X-CSE-ConnectionGUID: amYxsvEWTQ2ovuJtyXEtIA==
X-CSE-MsgGUID: Qsj3FGwiS7Wuw0b1RD8Qfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48156044"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48156044"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 05:04:26 -0800
X-CSE-ConnectionGUID: gMT8uWllSy6+LHwVQlZbsw==
X-CSE-MsgGUID: Bp2+bRv3Q0CM5Z9bCrbPtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="115361796"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Nov 2024 05:02:47 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8fgK-000o7A-1q;
	Wed, 06 Nov 2024 13:02:44 +0000
Date: Wed, 6 Nov 2024 21:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: imx8mp: add interconnect for lcdif-hdmi
Message-ID: <202411062033.cDJiSNtH-lkp@intel.com>
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
In-Reply-To: <20241105101645.231608-1-m.felsch@pengutronix.de>
References: <20241105101645.231608-1-m.felsch@pengutronix.de>
TO: Marco Felsch <m.felsch@pengutronix.de>
TO: "robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: shawnguo@kernel.org
TO: "Sascha Hauer"" <s.hauer@pengutronix.de>
CC: kernel@pengutronix.de
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Marco,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.12-rc6 next-20241106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Felsch/arm64-dts-imx8mp-add-interconnect-for-lcdif-hdmi/20241105-182054
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20241105101645.231608-1-m.felsch%40pengutronix.de
patch subject: [PATCH] arm64: dts: imx8mp: add interconnect for lcdif-hdmi
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm64-randconfig-051-20241106 (https://download.01.org/0day-ci/archive/20241106/202411062033.cDJiSNtH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411062033.cDJiSNtH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411062033.cDJiSNtH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: /soc@0/bus@30800000/i2c@30ae0000/gpio@20: failed to match any schema with compatible: ['microchip,mcp23018']
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: panel: compatible:0: 'jenson,bl-jt60050-01a' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: panel: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: /panel: failed to match any schema with compatible: ['jenson,bl-jt60050-01a', 'panel-lvds']
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: blk-ctrl@32fc0000: interconnect-names:0: 'hrv' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: blk-ctrl@32fc0000: interconnect-names:1: 'lcdif-hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
