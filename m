Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B4A405F7
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Jan 2026 21:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767562237; cv=none; b=XvKQAkuVhtLKnK+hihJPQxYC9Qlpg78pf+oy8PCEhFobEFVTB7KmCkqZf/ggv93P7sXibIvTDiOMa/drE5fcNh9zxGp91D/i8/lfjmFzdeiBW6Z+wop1tWa6t3mbG2Z91H0vDqX4SQ/gr1xNgD/BFalkUBez3GcR4G9ZTuB32+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767562237; c=relaxed/simple;
	bh=BEARaloQKOxyfONYoUV8COLp2M8EAYycFJubjIgMDto=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LkVJ8V0kBShyiJAnkXsOoWJx3O8Y9HnbOMjMLHwkhK7yvyf9TWo5tgXTRx58K3i2H+luWxxAt05Aj8iRaW3VLdY5GBjZ3YMm3j7Os31HP+O5KkqB3uC4WW3my6M5fvhGqcJa+0BwS1Pf7viVX1zKc/wV2U0IZ6TB0nxnjlil1OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T2FVRpcM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T2FVRpcM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767562233; x=1799098233;
  h=date:from:to:cc:subject:message-id;
  bh=BEARaloQKOxyfONYoUV8COLp2M8EAYycFJubjIgMDto=;
  b=T2FVRpcM3uNnCn3j8eX6CPSQwSypdwKmQgagqEwBDvfIg0J5jYHqllTQ
   FBrxLlQmvc7t2mI7OcwCek1s98LmBvB41M5zcWE+vMSBY8Sy2CqFXJSBb
   o7bDWdR9CJr1GhXjNTlqCq1UfYtcfnguBVxsopVmekS+hcjxyJyGfijHy
   bH1fmHmfQNi+TWin5WsNaCtcaU0g/zSZ4vbI5XY1v9hJptzasDgBo+4HY
   MtTfp3qSzwRdk1SwEC1BiUmiDJEOWW/cDo4bD7FadtX8Y3nEw1XPQ643w
   46KdKYQJYTWl3uE1hPRoyjIzKZ77cAoIDiVyV35X5PJAYDclUDM02UAmU
   w==;
X-CSE-ConnectionGUID: YJxRqmsnSAqYN2NeipiGLA==
X-CSE-MsgGUID: +ggQ55HOQY2MSNNtLCTsDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68846117"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="68846117"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 13:30:31 -0800
X-CSE-ConnectionGUID: +5CmRFz4SBCroggVVya+ug==
X-CSE-MsgGUID: q2l9oJEXR8etB7VS7SpTOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="202716434"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 04 Jan 2026 13:30:30 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcVgB-000000000xR-36yO;
	Sun, 04 Jan 2026 21:30:27 +0000
Date: Sun, 04 Jan 2026 22:29:33 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:imx/dt-bindings 2/10]
 arch/arm/boot/dts/nxp/imx/imx6dl-gw51xx.dtb: iomuxc-gpr@20e0000
 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@4:endpoint: Unevaluated properties
 are not allowed ('bus-width' was unexpected)
Message-ID: <202601042246.VS3lxpYU-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Fabio Estevam <festevam@gmail.com>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git imx/dt-bindings
head:   5ffac985b5f4272c8fccb0ef58369724bd10cd8d
commit: f679e54e6755c5602c0a31951370858bdc21c39a [2/10] dt-bindings: soc: imx-iomuxc-gpr: Document the CSI mux
:::::: branch date: 7 weeks ago
:::::: commit date: 3 months ago
config: arm-randconfig-2052-20251223 (https://download.01.org/0day-ci/archive/20260104/202601042246.VS3lxpYU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e3ef26df85c317665a2c505a0d9bc179fe67bdaf)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260104/202601042246.VS3lxpYU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601042246.VS3lxpYU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6dl-gw51xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw51xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw51xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw51xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw51xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw51xx.dtb: ipu1_csi0_mux (video-mux): port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi1_mux:port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dtb: ipu1_csi1_mux (video-mux): port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi1_mux:port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dtb: ipu1_csi1_mux (video-mux): port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi1_mux:port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dtb: ipu1_csi1_mux (video-mux): port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dtb: ipu1_csi0_mux (video-mux): port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dtb: /soc/bus@2100000/i2c@21a8000/hdmi-receiver@48: failed to match any schema with compatible: ['nxp,tda19971']
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dtb: ipu1_csi0_mux (video-mux): port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6dl-sabreauto.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-sabreauto.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-sabreauto.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-sabreauto.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6dl-sabreauto.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-sabreauto.dtb: ipu1_csi0_mux (video-mux): port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6q-gw51xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw51xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw51xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw51xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6q-gw51xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw51xx.dtb: ipu1_csi0_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu2_csi1_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dtb: ipu2_csi1_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu2_csi1_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dtb: ipu2_csi1_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
>> arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu2_csi1_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: ipu1_csi0_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: ipu2_csi1_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: /soc/bus@2100000/i2c@21a8000/hdmi-receiver@48: failed to match any schema with compatible: ['nxp,tda19971']
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dtb: ipu1_csi0_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dtb: /soc/bus@2100000/i2c@21a8000/hdmi-receiver@48: failed to match any schema with compatible: ['nxp,tda19971']
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dtb: ipu1_csi0_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6q-sabreauto.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-sabreauto.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-sabreauto.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-sabreauto.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6q-sabreauto.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-sabreauto.dtb: ipu1_csi0_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dtb: ipu1_csi0_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: lcdif@2224000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dtb: lcdif@2224000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-reva.dtb: / (fsl,imx6sx-sdb-reva): regulator-pcie-gpio: {'compatible': ['regulator-fixed'], 'pinctrl-names': ['default'], 'pinctrl-0': [[79]], 'regulator-name': ['MPCIE_3V3'], 'regulator-min-microvolt': [[3300000]], 'regulator-max-microvolt': [[3300000]], 'gpio': [[43, 1, 0]], 'enable-active-high': True, 'phandle': 68} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-reva.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-reva.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6sx-sdb-reva.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-reva.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-reva.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-reva.dtb: lcdif@2224000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-sai.dtb: / (fsl,imx6sx-sdb): regulator-pcie-gpio: {'compatible': ['regulator-fixed'], 'pinctrl-names': ['default'], 'pinctrl-0': [[80]], 'regulator-name': ['MPCIE_3V3'], 'regulator-min-microvolt': [[3300000]], 'regulator-max-microvolt': [[3300000]], 'gpio': [[44, 1, 0]], 'enable-active-high': True, 'phandle': 69} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-sai.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-sai.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6sx-sdb-sai.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-sai.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-sai.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-sai.dtb: lcdif@2224000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtb: / (fsl,imx6sx-sdb): regulator-pcie-gpio: {'compatible': ['regulator-fixed'], 'pinctrl-names': ['default'], 'pinctrl-0': [[80]], 'regulator-name': ['MPCIE_3V3'], 'regulator-min-microvolt': [[3300000]], 'regulator-max-microvolt': [[3300000]], 'gpio': [[44, 1, 0]], 'enable-active-high': True, 'phandle': 69} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtb: lcdif@2224000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dtb: / (fsl,imx6sx-sdb): regulator-pcie-gpio: {'compatible': ['regulator-fixed'], 'pinctrl-names': ['default'], 'pinctrl-0': [[80]], 'regulator-name': ['MPCIE_3V3'], 'regulator-min-microvolt': [[3300000]], 'regulator-max-microvolt': [[3300000]], 'gpio': [[45, 1, 0]], 'enable-active-high': True, 'phandle': 69} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dtb: sai@21d4000 (fsl,imx6sx-sai): pinctrl-0: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dtb: lcdif@2224000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-basic.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-basic.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-basic.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-basic.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-basic.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-basic.dtb: lcdif@2224000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-extended.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-extended.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-extended.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-extended.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-extended.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-extended.dtb: lcdif@2224000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-full.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-full.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-full.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-full.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-full.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-full.dtb: lcdif@2224000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
