Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41D133CD1
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Aug 2024 06:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723185685; cv=none; b=GwLvsgrb9E9Q00Sp1YifvySYM2tEACwUp7tmgB3QIA7xPTk8CqNrmnLwwU2VAKJ+md0nke1UrkNo5CBWntatl8CmK+mrVJn3vhNkptOjR/HhNzVXSPiikt9qbdoxDolMfGzLpgnK3DQAPMfQYboKWWp+TsgXPryIiLYOJ3w4GrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723185685; c=relaxed/simple;
	bh=8TE38NRz/aicQUYxBTe7RaW7Kjf6MZwSOYUToRQfLu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oILxw6YOfSFbrQifd/KjFdkhMnPb4wFKHmE56q0PD7FBCyWGXe6g9rxTvVOaCTWEz/kG+1/ZLcJWl0+DReOTC6fZig2W+5Az0G5+gWRlKL1uKekS2cCGGRNudOsdrnOLtxpAgtkJd0afAwMEek1M/ZQQifI6nV47xJMUTD55+g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JzGcTSCO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JzGcTSCO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723185683; x=1754721683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8TE38NRz/aicQUYxBTe7RaW7Kjf6MZwSOYUToRQfLu8=;
  b=JzGcTSCO1OUhmPSyPl+GsAyvDLD7aMUbuDQOsjoCkpXmsVsYchMpinqd
   9lJX5lLJynaGgM/W+c6U6lLluepTH1T0ufVY3axMCwg46P0litzMpNIHr
   etfUbypvYom0FhLHZqQWLUv4k1FdtHwH5fpIWeDsXh277FZXhKbcOBCEC
   gEE/CabFPDpe345d0FUMvWcFsbDqNWO+OS968UdpQEowEc+7yVYmdxYDs
   po3l3N86APBrwIHfI+bojXAWnyZF1FDE1pYvapcMtoog1++tULpLaNW2x
   t1P9Rx44Y2eG1Ek7FBvCF3EMoy6L3WpCOd/+VGIugciAFpKuXtQXMBdet
   Q==;
X-CSE-ConnectionGUID: N/rZaoDHTCmCAuWd+v7WKg==
X-CSE-MsgGUID: mejz26YFTXWwBRW7Cq9n5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="46753112"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="46753112"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 23:41:22 -0700
X-CSE-ConnectionGUID: f4Zc7UVdT1OQzWajFD4Nhg==
X-CSE-MsgGUID: dhAkxX57RNmm3LcIkQKkeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="57429438"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 08 Aug 2024 23:41:21 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scJJP-0006yf-12;
	Fri, 09 Aug 2024 06:41:19 +0000
Date: Fri, 9 Aug 2024 14:40:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/3] arm64: dts: Add support for Kontron OSM-S i.MX8MP
 SoM and BL carrier board
Message-ID: <202408091454.Dse5LGMd-lkp@intel.com>
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
In-Reply-To: <20240807104137.558741-3-frieder@fris.de>
References: <20240807104137.558741-3-frieder@fris.de>
TO: Frieder Schrempf <frieder@fris.de>
TO: Conor Dooley <conor+dt@kernel.org>
TO: devicetree@vger.kernel.org
TO: imx@lists.linux.dev
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: linux-arm-kernel@lists.infradead.org
TO: linux-kernel@vger.kernel.org
TO: Rob Herring <robh@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Shawn Guo <shawnguo@kernel.org>
CC: Frieder Schrempf <frieder.schrempf@kontron.de>
CC: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: Fabio Estevam <festevam@gmail.com>
CC: Francesco Dolcini <francesco.dolcini@toradex.com>
CC: Gregor Herburger <gregor.herburger@ew.tq-group.com>
CC: Joao Paulo Goncalves <joao.goncalves@toradex.com>
CC: Parthiban Nallathambi <parthiban@linumiz.com>
CC: Peng Fan <peng.fan@nxp.com>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>

Hi Frieder,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on robh/for-next krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.11-rc2 next-20240808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frieder-Schrempf/dt-bindings-arm-fsl-Add-Kontron-i-MX8MP-OSM-S-based-boards/20240807-191042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20240807104137.558741-3-frieder%40fris.de
patch subject: [PATCH v2 2/3] arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240809/202408091454.Dse5LGMd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408091454.Dse5LGMd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408091454.Dse5LGMd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: /usbc: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
--
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['kontron,imx8mp-dl-osm-s', 'kontron,imx8mp-bl-osm-s', 'kontron,imx8mp-osm-s', 'fsl,imx8mp'] is too long
>> 	arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   		['kontron,imx8mp-dl-osm-s', 'kontron,imx8mp-bl-osm-s', 'kontron,imx8mp-osm-s', 'fsl,imx8mp'] is too long
   		'kontron,imx8mp-dl-osm-s' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
   		'kontron,imx8mp-dl-osm-s' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
   		'tq,imx8dxp-tqma8xdp' was expected
   		'tq,imx8qxp-tqma8xqp' was expected
   		'fsl,imx8dxp' was expected
   		'fsl,imx8qxp' was expected
   	'kontron,imx8mp-dl-osm-s' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
   	'kontron,imx8mp-dl-osm-s' is not one of ['creative,x-fi3', 'fsl,imx23-evk', 'fsl,stmp378x-devb', 'olimex,imx23-olinuxino', 'sandisk,sansa_fuze_plus']
   	'kontron,imx8mp-dl-osm-s' is not one of ['fsl,imx25-pdk', 'karo,imx25-tx25']
--
   	'tq,imx6dl-tqma6dl-b' was expected
   	'phytec,imx6ul-pcl063' was expected
   	'phytec,imx6ull-pcl063' was expected
   	'fsl,imx6ulz' was expected
   	'toradex,verdin-imx8mm' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'kontron,imx8mp-osm-s' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: /: failed to match any schema with compatible: ['kontron,imx8mp-dl-osm-s', 'kontron,imx8mp-bl-osm-s', 'kontron,imx8mp-osm-s', 'fsl,imx8mp']
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: panel: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: panel: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: panel: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: gpio@30230000: 'panel_rst', 'panel_stby' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/fsl-imx-gpio.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: panel_stby: $nodename:0: 'panel_stby' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: panel_rst: $nodename:0: 'panel_rst' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: gt911@5d: 'power-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/goodix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: /usbc: failed to match any schema with compatible: ['linux,extcon-usb-gpio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
