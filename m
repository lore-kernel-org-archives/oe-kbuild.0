Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF45F30674A
	for <oe-kbuild@lists.linux.dev>; Fri, 22 May 2026 23:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779492041; cv=none; b=do8BZq52nJUGCXUI9KuQXr2ZoG5g7XbBa7YamNZsa4bmgrFzOLtfsmSSpq/qFpYtxpdfQOapVYlIwFrP3LNCqF4sDzRk/2PKi/O7KoJ3Zz34+3KOymuKzefSeL6qkp8HlOBbojpifpmZJPAwdKyO/Ir5EK4O2n9cBvuUc3kMqts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779492041; c=relaxed/simple;
	bh=qlbJ5ONIaBpMtBdd7Fsp4Y2UBQPVUEjjvh35YlcVDcI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=po1i6Z2B2rX/+rqgXGimi7r/fxAkHUnRzqZ/0GbfhV+7IpOx2gca3Ud2m9XeBVdr48w2PWbWEEUgFsEVy3SXDkvfkGrvuSdXB5YozUV4eMF8l+YNj0ohVA+oMdP50lejMoAkcd7oyUbw7tufVKvcNRMAIjNVWy3GDgqq1GsMfs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U88J6iEu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U88J6iEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779492038; x=1811028038;
  h=date:from:to:cc:subject:message-id;
  bh=qlbJ5ONIaBpMtBdd7Fsp4Y2UBQPVUEjjvh35YlcVDcI=;
  b=U88J6iEuU3DtdfwrELTDce3852+1k6rt1tKWELiY284I2bs1nfGGSeIl
   G2Xmn0Q/XfoABU3qPYbYRWs8yKZcVZpQ8kLXr4pArHdrHo5gDbiId6Hvq
   XxTMPcdycLyLTvBDmNDKEp/b3G7N7wc91CAyqTHeaEDU/MJd+xebIHKzE
   a2yrbmT77Lx4N0peugrjztX4+zvIE8cL8pll5exjfYp02vYzqZ61lm1p6
   1z0Ea7K3LCx5xcHe1+ZzSAkY4yH3dvwC1y6ZFS9w4rVgqA0AW1T8tPojA
   oJ0LED3BOnjxGqWS4NSZbPFd2z5sWy5ZxN4xayXl1xqHIGP9JWjhjp0yX
   w==;
X-CSE-ConnectionGUID: wBVbwZeTRki4j2l0K2dyBw==
X-CSE-MsgGUID: LcvLPwC5RiKfk5WP42IVYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80152562"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="80152562"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 16:20:35 -0700
X-CSE-ConnectionGUID: BQ6Cd6u8RI+eU1YPiloyIg==
X-CSE-MsgGUID: RI7+p1qkRWyFT0K4KxcfzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="271380321"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 22 May 2026 16:20:34 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQZAN-00000000BQz-0qHp;
	Fri, 22 May 2026 23:20:31 +0000
Date: Sat, 23 May 2026 01:19:49 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/freescale/imx8mp-ab2.dtb:
 blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of
 the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202605230125.E7Ba3VDm-lkp@intel.com>
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
TO: Marco Felsch <m.felsch@pengutronix.de>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Marco-Felsch/Revert-dt-bindings-display-bridge-ldb-Add-check-for-reg-and-reg-names/20260514-224818
head:   f8762e7c0c33fd7fc3007e398ffbed722c96a174
commit: f8762e7c0c33fd7fc3007e398ffbed722c96a174 arm64: dts: imx8mp: remove LDB reg and reg-names property
date:   8 days ago
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-2055-20260522 (https://download.01.org/0day-ci/archive/20260523/202605230125.E7Ba3VDm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605230125.E7Ba3VDm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605230125.E7Ba3VDm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-ab2.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-frdm.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-hummingboard-mate.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pro.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-hummingboard-ripple.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-hdmi.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1937.38-2037.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/blk-ctrl@32ec0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-a.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-b.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-ph128800t006-zhc01.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-etml1010g3dra.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-ph128800t006.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-ph128800t006.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-wlbt.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: blk-ctrl@32ec0000 (fsl,imx8mp-media-blk-ctrl): 'bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
