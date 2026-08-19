Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F75A34753A
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Aug 2026 19:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787166254; cv=none; b=fkABRqL2BJ1bItObxweZUAzWA7pvh8TkDgPw6gzq6LB2tM0tWnTBtKhSzHdnWJ083rEoVjZaJjRO+svV9+YZDIrrs0IeWijUst6IVTiEZ8ylRU4evlODOzt374kiOQ2yA0bvvzzrzMF/oT1ApWktCSjC3wXf5xyiiqDXwCIoiRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787166254; c=relaxed/simple;
	bh=uzSS0GaSbv+ZltPVIQabX8KpLLLTMemP72LIt4yo1J8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q8JprDdR0JpCTROnH2z5ObHzFe/dtsclfzdeiVrNfmONKtWdUb/UM4EsykB4h9n8jMkGtnvykGVLrV4xRIUCnVrrWNbUTGrt9pFcPgIv5djO3anHf1eTF1bnBa1u27E8NSrBR6osY0+6Ae9VzXEvRZNQoZ0v6Y1JDZFPa5ut5eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYUI0nAH; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYUI0nAH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787166252; x=1818702252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uzSS0GaSbv+ZltPVIQabX8KpLLLTMemP72LIt4yo1J8=;
  b=bYUI0nAHohIMwckBq+AH75CdGn9lMfxc5xaUWz7H4Y0NemjBU8Uz6Of+
   blzk5kZS9f3WVg6a2w7sR/9ZfBkpN/kOVTEjG2YgkpwNHQgsPVJK2IoBa
   Mc5Yp9ZhwPii8q9iQe4AXL53AvKwo6u0rp4GbgRPaRqS5zb0S7Elxqun4
   eZ7JVy8R1t2duL0jOrt0Ee3XI1alzGL0jTIzKqCG/j0pC8c3hYgkYoFtb
   LMft8nyWCIqPw64FRAQmR+97ifbcCBGv634TGGY+S4rygJCz5HqsdJsA/
   WCov3/ju6USn57Bv5fGlY8NrAUNgiEgO8nj3kLokGYiyHgp4lLTLfNN1B
   g==;
X-CSE-ConnectionGUID: Uq/wuFmcRgepzlJL54oAOg==
X-CSE-MsgGUID: hEjICNciRgyqAhUctSIkaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87456250"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87456250"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 12:04:12 -0700
X-CSE-ConnectionGUID: mUuZvm5BTf61ptPMopF/tA==
X-CSE-MsgGUID: 0TywDiXTRbekVuGOl1E1rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="269155623"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 19 Aug 2026 12:04:11 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwla5-000000007OL-0M2k;
	Wed, 19 Aug 2026 19:04:09 +0000
Date: Wed, 19 Aug 2026 21:03:28 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/1] dt-bindings: soc: imx-iomuxc-gpr: allow bridge@18
 as child node
Message-ID: <202608192058.rVSS4MWn-lkp@intel.com>
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
In-Reply-To: <20260717201519.844259-1-Frank.Li@oss.nxp.com>
References: <20260717201519.844259-1-Frank.Li@oss.nxp.com>
TO: Frank.Li@oss.nxp.com
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Frank Li <Frank.Li@nxp.com>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Peng Fan <peng.fan@nxp.com>
TO: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
TO: "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>
TO: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
TO: open list <linux-kernel@vger.kernel.org>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk-dt/for-next soc/for-next linus/master v7.2 next-20260817]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li-oss-nxp-com/dt-bindings-soc-imx-iomuxc-gpr-allow-bridge-18-as-child-node/20260807-002716
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260717201519.844259-1-Frank.Li%40oss.nxp.com
patch subject: [PATCH v2 1/1] dt-bindings: soc: imx-iomuxc-gpr: allow bridge@18 as child node
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: arm-randconfig-2053-20260817 (https://download.01.org/0day-ci/archive/20260819/202608192058.rVSS4MWn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608192058.rVSS4MWn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608192058.rVSS4MWn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
>> arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): bridge@18:reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
>> arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): bridge@18:reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
>> arch/arm/boot/dts/nxp/imx/imx6sx-sdb-reva.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): bridge@18:reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-reva.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
>> arch/arm/boot/dts/nxp/imx/imx6sx-sdb-sai.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): bridge@18:reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-sai.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
>> arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): bridge@18:reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
>> arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): bridge@18:reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dtb: sai@21d4000 (fsl,imx6sx-sai): pinctrl-0: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
>> arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): bridge@18:reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
>> arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-basic.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): bridge@18:reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-basic.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
>> arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-extended.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): bridge@18:reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-extended.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
>> arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-full.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): bridge@18:reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-full.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
