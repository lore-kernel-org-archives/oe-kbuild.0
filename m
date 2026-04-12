Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF25E30DECE
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Apr 2026 21:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776030580; cv=none; b=GLNILcDNuSpjNQkj1BG6JHSWfzd6l/k4ruTHxyKiQ/fPTx2rtZQ2wFM3ImwMjsyARRr3Hmo1fGuTdBkTwXFtOds0FaJlSIvYo9cnh5hGR9zjpO4o9kC2gQ75hhhROhBk2P90mXOyuDJ0GqTI9NCEW16cJnc5pDpAsb6uCWHokD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776030580; c=relaxed/simple;
	bh=WzWEPOA4g0dEghjK/bq8il7i9Yz4sGDsTfI3rwQYq9w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dYSq/LeFwx+4HxdPENqr5OOG18iidbmXQprvBwHknqSHoo7iRS1GQxw7SUaFWA7YVldcF+xuKpZWj/46Sn3cYR0G8hc0D9boXe/KBBlKt8TZlW9aAKosaRJJ/GmdKQbdovIqE864noKyvnPZ9CW2hU7V5g4FGKFZAvYB6CHRlfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ick5iTCb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ick5iTCb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776030576; x=1807566576;
  h=date:from:to:cc:subject:message-id;
  bh=WzWEPOA4g0dEghjK/bq8il7i9Yz4sGDsTfI3rwQYq9w=;
  b=Ick5iTCbgg9kQRcpefAUji3j7w8kFjEo9MV6QJRPKjb9zHfTIIqSHC9N
   iVeaJCof663AKIvzLzNNdcTe3z9zeIR7eg48d4+Ia5Ejyc6fS1zGeXFvO
   6gAPP4LkeSMJMIyMlSH1BsvEGO1+lvLVwv0XzzZDr6R5ywiATckZ0dQjw
   KM2YfiV5nKOqCyaup9ybOv8PyWNhaVQ0BIPxE4HWMgomj+wlt+L8elsSD
   zltypYOPrTlXloYzFf+A/oxdF9ufB4fTB7AY4VxvIz5xm+Hk4gjZcpDZT
   ABllWbRvfhBX7KJcPlSbUaUmp02rWghgyFf/NEjEoitRKM13ZZVCSERon
   w==;
X-CSE-ConnectionGUID: Q3mDjI8XS42slX3O46AMlQ==
X-CSE-MsgGUID: LaAroxucTMaW25NaogTzkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="76877332"
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="76877332"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 14:49:36 -0700
X-CSE-ConnectionGUID: AvZ6uG0sRAqYuruecIdmzw==
X-CSE-MsgGUID: PJAdU6CuS0Kyc+qLpkkPFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="225333590"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 12 Apr 2026 14:49:35 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wC2gO-00000000BM9-2bBM;
	Sun, 12 Apr 2026 21:49:32 +0000
Date: Sun, 12 Apr 2026 23:48:44 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/nxp/imx/imx6dl-gw51xx.dtb:
 iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@4:endpoint:
 Unevaluated properties are not allowed ('bus-width' was unexpected)
Message-ID: <202604122330.d5p1vths-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Fabio Estevam <festevam@gmail.com>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9a9c8ce300cd3859cc87b408ef552cd697cc2ab7
commit: f679e54e6755c5602c0a31951370858bdc21c39a dt-bindings: soc: imx-iomuxc-gpr: Document the CSI mux
date:   6 months ago
:::::: branch date: 3 days ago
:::::: commit date: 6 months ago
config: arm-randconfig-2051-20260409 (https://download.01.org/0day-ci/archive/20260412/202604122330.d5p1vths-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260412/202604122330.d5p1vths-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f679e54e6755 ("dt-bindings: soc: imx-iomuxc-gpr: Document the CSI mux")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604122330.d5p1vths-lkp@intel.com/

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
