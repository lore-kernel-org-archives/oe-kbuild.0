Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8812282FA
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Jun 2025 22:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748815415; cv=none; b=igzDU/OxO+KdxQCO/t/HQWFADOXnzPrRb5xeTBoLNSW/Ac+6GPw9zLJELpOanaGucoiCHYZBZZeBcNOdxEcxmFl76oBB1kBlMwb9oEP5CGeMQlkRIhbVi8RpAb+S1IfJ2emE00EvUzE+PiR2ft9UGCXUTCbAblJI9zZRR2c/Ync=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748815415; c=relaxed/simple;
	bh=j0oW6JP6V/KvpVwn8Se2FZog7s6GDck9Q5dsvlVZmpg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mJa4FNpY2bCGVL9sgnUKr4/azFjwQ2P878HqTALYVBKmwZqXibm8Y0DcHLKayxEhJoBtJd+8TTUG6VF0okL0X69OltQW0TsHnpQNEAU5wIRARwGjw1nQzvxBac/Da1EniDRpMDv3OvTUnRDyglU9e5FkctYS1hTtS2tFo1klYu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GYB1/heJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GYB1/heJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748815412; x=1780351412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j0oW6JP6V/KvpVwn8Se2FZog7s6GDck9Q5dsvlVZmpg=;
  b=GYB1/heJmdyM6S/4++rlCszvQmxGPS+B8VFINBi7OGaCmjHzckWt5M8r
   aXs+i5nh7yeROLLyVHCf56jtmrl/pOxDwhjAOM+j3iHLLjxECpIoYFOKM
   1MrsAVCTJA88AnfSRU59xjDgolJ927IVl3IOWj+Q3uEIMIxHLOlhJoLiZ
   l+PQeITO8gPJQeDAeCH2rmust3uNhmI3KEUF4sJ4imk79cM+OGzwyx6M8
   FOZxlidwG9LvBfn37xrJMu35mPLYJbHft1TZvhPtBTCJsYAWRKMSrSKSa
   8FXxqJ5hjQXoT+mCbbotaTjJQkhQJdVYWEeG9Mu7n4MXBbt7dX8n+7FF0
   A==;
X-CSE-ConnectionGUID: VmY8Ux9LT7O89mEoDsvXNA==
X-CSE-MsgGUID: e+GXQIJuSquMs3reRy1JXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="38457994"
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; 
   d="scan'208";a="38457994"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2025 15:03:31 -0700
X-CSE-ConnectionGUID: RgU4qWNbQaygMAZyi5Oshg==
X-CSE-MsgGUID: QGc6qPJTSFCKEXPL6ID4og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,201,1744095600"; 
   d="scan'208";a="144355637"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Jun 2025 15:03:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLqm7-000Z5Q-0i;
	Sun, 01 Jun 2025 22:03:27 +0000
Date: Mon, 2 Jun 2025 06:03:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/1] dt-bindings: input: touchscreen: convert tsc2007.txt
 to yaml format
Message-ID: <202506020548.cTZcvD8X-lkp@intel.com>
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
In-Reply-To: <20250529193241.793678-1-Frank.Li@nxp.com>
References: <20250529193241.793678-1-Frank.Li@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>
TO: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
TO: open list <linux-kernel@vger.kernel.org>
CC: imx@lists.linux.dev

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus robh/for-next krzk-dt/for-next linus/master v6.15 next-20250530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dt-bindings-input-touchscreen-convert-tsc2007-txt-to-yaml-format/20250530-033447
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20250529193241.793678-1-Frank.Li%40nxp.com
patch subject: [PATCH 1/1] dt-bindings: input: touchscreen: convert tsc2007.txt to yaml format
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-052-20250530 (https://download.01.org/0day-ci/archive/20250602/202506020548.cTZcvD8X-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250602/202506020548.cTZcvD8X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506020548.cTZcvD8X-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: /capture_subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: /tz-interrupt-controller@fffc000: failed to match any schema with compatible: ['fsl,imx53-tzic', 'fsl,tzic']
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: /tz-interrupt-controller@fffc000: failed to match any schema with compatible: ['fsl,imx53-tzic', 'fsl,tzic']
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: /soc/ipu@18000000: failed to match any schema with compatible: ['fsl,imx53-ipu']
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: /soc/bus@50000000/bridge@53f00000: failed to match any schema with compatible: ['fsl,imx53-aipstz']
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: /soc/bus@50000000/iomuxc-gpr@53fa8000: failed to match any schema with compatible: ['fsl,imx53-iomuxc-gpr', 'syscon']
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: /soc/bus@50000000/ldb@53fa8008: failed to match any schema with compatible: ['fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: /soc/bus@50000000/i2c@53fec000/edt-ft5x06@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
>> arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: tsc2007@48 (ti,tsc2007): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: /soc/bus@60000000/bridge@63f00000: failed to match any schema with compatible: ['fsl,imx53-aipstz']
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: efuse@63f98000 (fsl,imx53-iim): compatible: ['fsl,imx53-iim', 'fsl,imx27-iim', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/nvmem/imx-iim.yaml#
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: /soc/bus@60000000/tigerp@63fa0000: failed to match any schema with compatible: ['fsl,imx53-tigerp', 'fsl,imx51-tigerp']
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: /soc/bus@60000000/tigerp@63fa0000: failed to match any schema with compatible: ['fsl,imx53-tigerp', 'fsl,imx51-tigerp']
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: /soc/bus@60000000/nand@63fdb000: failed to match any schema with compatible: ['fsl,imx53-nand']
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: /soc/bus@60000000/tve@63ff0000: failed to match any schema with compatible: ['fsl,imx53-tve']
   arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
--
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6dl-comtft.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6dl-comtft.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6dl-comtft.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6dl-comtft.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6dl-comtft.dtb: /soc/bus@2100000/i2c@21a8000/edt-ft5x06@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
>> arch/arm/boot/dts/nxp/imx/imx6dl-tx6dl-comtft.dtb: tsc2007@48 (ti,tsc2007): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6dl-comtft.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6dl-comtft.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6dl-comtft.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6dl-comtft.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6dl-comtft.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6dl-comtft.dtb: gpio-keys (gpio-keys): 'power' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6dl-comtft.dtb: /sound: failed to match any schema with compatible: ['karo,imx6qdl-tx6-sgtl5000', 'simple-audio-card']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6dl-comtft.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
--
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034.dtb: /soc/bus@2100000/i2c@21a8000/edt-ft5x06@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
>> arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034.dtb: tsc2007@48 (ti,tsc2007): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034.dtb: gpio-keys (gpio-keys): 'power' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034.dtb: /sound: failed to match any schema with compatible: ['karo,imx6qdl-tx6-sgtl5000', 'simple-audio-card']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
--
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034-mb7.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034-mb7.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034-mb7.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034-mb7.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034-mb7.dtb: /soc/bus@2100000/i2c@21a8000/edt-ft5x06@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
>> arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034-mb7.dtb: tsc2007@48 (ti,tsc2007): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034-mb7.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034-mb7.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034-mb7.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034-mb7.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034-mb7.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034-mb7.dtb: gpio-keys (gpio-keys): 'power' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034-mb7.dtb: /sound: failed to match any schema with compatible: ['karo,imx6qdl-tx6-sgtl5000', 'simple-audio-card']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034-mb7.dtb: lcd-panel (edt,et057090dhu): Unevaluated properties are not allowed ('pixelclk-active' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-801x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-801x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-801x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-801x.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-801x.dtb: /soc/bus@2100000/i2c@21a8000/edt-ft5x06@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
>> arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-801x.dtb: tsc2007@48 (ti,tsc2007): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-801x.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-801x.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-801x.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-801x.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-801x.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-801x.dtb: gpio-keys (gpio-keys): 'power' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-801x.dtb: /sound: failed to match any schema with compatible: ['karo,imx6qdl-tx6-sgtl5000', 'simple-audio-card']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-801x.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
--
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-80xx-mb7.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-80xx-mb7.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-80xx-mb7.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-80xx-mb7.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-80xx-mb7.dtb: /soc/bus@2100000/i2c@21a8000/edt-ft5x06@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
>> arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-80xx-mb7.dtb: tsc2007@48 (ti,tsc2007): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-80xx-mb7.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-80xx-mb7.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-80xx-mb7.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-80xx-mb7.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-80xx-mb7.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-80xx-mb7.dtb: gpio-keys (gpio-keys): 'power' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-80xx-mb7.dtb: /sound: failed to match any schema with compatible: ['karo,imx6qdl-tx6-sgtl5000', 'simple-audio-card']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-80xx-mb7.dtb: lcd-panel (edt,et057090dhu): Unevaluated properties are not allowed ('pixelclk-active' was unexpected)
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:56.9-74.4: Warning (avoid_unnecessary_addr_size): /clocks: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:907.28-915.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033.dtb: /soc/bus@2100000/i2c@21a8000/edt-ft5x06@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
>> arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033.dtb: tsc2007@48 (ti,tsc2007): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033.dtb: gpio-keys (gpio-keys): 'power' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033.dtb: /sound: failed to match any schema with compatible: ['karo,imx6qdl-tx6-sgtl5000', 'simple-audio-card']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:56.9-74.4: Warning (avoid_unnecessary_addr_size): /clocks: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:907.28-915.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033-mb7.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033-mb7.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033-mb7.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033-mb7.dtb: /soc/bus@2100000/i2c@21a8000/edt-ft5x06@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
>> arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033-mb7.dtb: tsc2007@48 (ti,tsc2007): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033-mb7.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033-mb7.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033-mb7.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033-mb7.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033-mb7.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033-mb7.dtb: gpio-keys (gpio-keys): 'power' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033-mb7.dtb: /sound: failed to match any schema with compatible: ['karo,imx6qdl-tx6-sgtl5000', 'simple-audio-card']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033-mb7.dtb: lcd-panel (edt,et057090dhu): Unevaluated properties are not allowed ('pixelclk-active' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-811x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-811x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-811x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-811x.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-811x.dtb: /soc/bus@2100000/i2c@21a8000/edt-ft5x06@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
>> arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-811x.dtb: tsc2007@48 (ti,tsc2007): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-811x.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-811x.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-811x.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-811x.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-811x.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-811x.dtb: gpio-keys (gpio-keys): 'power' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-811x.dtb: /sound: failed to match any schema with compatible: ['karo,imx6qdl-tx6-sgtl5000', 'simple-audio-card']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-811x.dtb: /lvds0-panel: failed to match any schema with compatible: ['nlt,nl12880bc20-spwg-24']
--
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-81xx-mb7.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-81xx-mb7.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-81xx-mb7.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-81xx-mb7.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-81xx-mb7.dtb: /soc/bus@2100000/i2c@21a8000/edt-ft5x06@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
>> arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-81xx-mb7.dtb: tsc2007@48 (ti,tsc2007): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-81xx-mb7.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-81xx-mb7.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-81xx-mb7.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-81xx-mb7.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-81xx-mb7.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-81xx-mb7.dtb: gpio-keys (gpio-keys): 'power' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-81xx-mb7.dtb: /sound: failed to match any schema with compatible: ['karo,imx6qdl-tx6-sgtl5000', 'simple-audio-card']
   arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-81xx-mb7.dtb: /lvds0-panel: failed to match any schema with compatible: ['edt,etml1010g0dka']
--
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010.dtb: /soc/bus@2100000/i2c@21a8000/edt-ft5x06@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
>> arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010.dtb: tsc2007@48 (ti,tsc2007): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010.dtb: gpio-keys (gpio-keys): 'power' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010.dtb: /sound: failed to match any schema with compatible: ['karo,imx6qdl-tx6-sgtl5000', 'simple-audio-card']
--
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010-comtft.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010-comtft.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010-comtft.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010-comtft.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010-comtft.dtb: /soc/bus@2100000/i2c@21a8000/edt-ft5x06@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
>> arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010-comtft.dtb: tsc2007@48 (ti,tsc2007): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010-comtft.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010-comtft.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010-comtft.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010-comtft.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010-comtft.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010-comtft.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010-comtft.dtb: gpio-keys (gpio-keys): 'power' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010-comtft.dtb: /sound: failed to match any schema with compatible: ['karo,imx6qdl-tx6-sgtl5000', 'simple-audio-card']
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:56.9-74.4: Warning (avoid_unnecessary_addr_size): /clocks: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:907.28-915.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1036-mb7.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1036-mb7.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1036-mb7.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1036-mb7.dtb: /soc/bus@2100000/i2c@21a8000/edt-ft5x06@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
>> arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1036-mb7.dtb: tsc2007@48 (ti,tsc2007): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1036-mb7.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1036-mb7.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1036-mb7.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1036-mb7.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1036-mb7.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1036-mb7.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1036-mb7.dtb: gpio-keys (gpio-keys): 'power' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1036-mb7.dtb: /sound: failed to match any schema with compatible: ['karo,imx6qdl-tx6-sgtl5000', 'simple-audio-card']
--
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-10x0-mb7.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-10x0-mb7.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-10x0-mb7.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-10x0-mb7.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-10x0-mb7.dtb: /soc/bus@2100000/i2c@21a8000/edt-ft5x06@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
>> arch/arm/boot/dts/nxp/imx/imx6q-tx6q-10x0-mb7.dtb: tsc2007@48 (ti,tsc2007): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-10x0-mb7.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-10x0-mb7.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-10x0-mb7.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-10x0-mb7.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-10x0-mb7.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-10x0-mb7.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-10x0-mb7.dtb: gpio-keys (gpio-keys): 'power' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-10x0-mb7.dtb: /sound: failed to match any schema with compatible: ['karo,imx6qdl-tx6-sgtl5000', 'simple-audio-card']
--
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-11x0-mb7.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-11x0-mb7.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-11x0-mb7.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-11x0-mb7.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-11x0-mb7.dtb: /soc/bus@2100000/i2c@21a8000/edt-ft5x06@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
>> arch/arm/boot/dts/nxp/imx/imx6q-tx6q-11x0-mb7.dtb: tsc2007@48 (ti,tsc2007): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-11x0-mb7.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-11x0-mb7.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-11x0-mb7.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-11x0-mb7.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-11x0-mb7.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-11x0-mb7.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-11x0-mb7.dtb: gpio-keys (gpio-keys): 'power' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-tx6q-11x0-mb7.dtb: /sound: failed to match any schema with compatible: ['karo,imx6qdl-tx6-sgtl5000', 'simple-audio-card']
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:56.9-74.4: Warning (avoid_unnecessary_addr_size): /clocks: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:907.28-915.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037.dtb: /soc/bus@2100000/i2c@21a8000/edt-ft5x06@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
>> arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037.dtb: tsc2007@48 (ti,tsc2007): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037.dtb: /soc/bus@2100000/pre@21c8000: failed to match any schema with compatible: ['fsl,imx6qp-pre']
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037.dtb: /soc/bus@2100000/pre@21c9000: failed to match any schema with compatible: ['fsl,imx6qp-pre']
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037.dtb: /soc/bus@2100000/pre@21ca000: failed to match any schema with compatible: ['fsl,imx6qp-pre']
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037.dtb: /soc/bus@2100000/pre@21cb000: failed to match any schema with compatible: ['fsl,imx6qp-pre']
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037.dtb: /soc/bus@2100000/prg@21cc000: failed to match any schema with compatible: ['fsl,imx6qp-prg']
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037.dtb: /soc/bus@2100000/prg@21cd000: failed to match any schema with compatible: ['fsl,imx6qp-prg']
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6qp-ipu', 'fsl,imx6q-ipu']
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:56.9-74.4: Warning (avoid_unnecessary_addr_size): /clocks: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:907.28-915.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037-mb7.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037-mb7.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037-mb7.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037-mb7.dtb: /soc/bus@2100000/i2c@21a8000/edt-ft5x06@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
>> arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037-mb7.dtb: tsc2007@48 (ti,tsc2007): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037-mb7.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037-mb7.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037-mb7.dtb: /soc/bus@2100000/pre@21c8000: failed to match any schema with compatible: ['fsl,imx6qp-pre']
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037-mb7.dtb: /soc/bus@2100000/pre@21c9000: failed to match any schema with compatible: ['fsl,imx6qp-pre']
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037-mb7.dtb: /soc/bus@2100000/pre@21ca000: failed to match any schema with compatible: ['fsl,imx6qp-pre']
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037-mb7.dtb: /soc/bus@2100000/pre@21cb000: failed to match any schema with compatible: ['fsl,imx6qp-pre']
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037-mb7.dtb: /soc/bus@2100000/prg@21cc000: failed to match any schema with compatible: ['fsl,imx6qp-prg']
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037-mb7.dtb: /soc/bus@2100000/prg@21cd000: failed to match any schema with compatible: ['fsl,imx6qp-prg']
   arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037-mb7.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6qp-ipu', 'fsl,imx6q-ipu']
--
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: / (karo,imx6ul-tx6ul): i2c-gpio: {'compatible': ['i2c-gpio'], '#address-cells': 1, '#size-cells': 0, 'pinctrl-names': ['default'], 'pinctrl-0': [[68]], 'sda-gpios': [[46, 1, 0]], 'scl-gpios': [[46, 0, 0]], 'clock-frequency': 400000, 'status': ['okay'], 'rtc@68': {'compatible': ['dallas,ds1339'], 'reg': [[104]], 'status': ['disabled']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: /soc/bus@2100000/i2c@21a4000/polytouch@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
>> arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: touchscreen@48 (ti,tsc2007): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): 'disp0', 'display', 'lcd-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: /sound: failed to match any schema with compatible: ['karo,imx6ul-tx6ul-sgtl5000', 'simple-audio-card']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
