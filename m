Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527151;
	b=PCv3LONmpoU4FrJaZRROFyT52Xpt34bX2FHh/SezQvsuBzNZvUMygIAaTTYVvs3xri3O
	 stGOv79kxIL+gYwBJc+c4xEsf8wGTldlheRzwKA2aCIFIUeeH7Y87X3CwZ//xqPN7hXDh
	 /EKI7y9ZeaNLDaRHBCruXKOrVzGFOZFJIVDJWREuz2NnCJ/8EXvsiAtkkLixe2vuLsb5M
	 AXBt2MphwAlxT/lUQlM4zn3PDC5q90yhIH9oXMd52MfBXhWofkdWcaVzADk+E78KrmQ60
	 0E0juvZxNCmHNWRB2NGu17jTmUs6MELqoIrS+AGtG/27i+ZaN/4NyLg4cj/0t6n+kAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527151;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=nfXhSqvJb+ZSjQdoH2VZaTsIebnWKr41oH8xBMVMINc=;
	b=unsz845tx2gVoxXhLCrwtoQL/s6WoFzX9+MOtkuTyzEI+iMX8whhVLcMslKU41Po9q3f
	 ZsClmcJe8Mohop86XxzitOmjBq1jDVKkwtDaW/0+L3AU1p7AG9rzn8+F2Gvw+D6D8v1t0
	 5ylyq3Zjuyl5OY8haQEoMZ7Cn+efhxglqVP/LpZAiWAkef/rMrgg/6oBND9x/NDD2XK9w
	 3tgVd9b5pNSJPOLXkEXPIMaeNHFGRELwU60KDjt5NP5K2QQwPd3Yv6p2+oxHLyfYV2Tsu
	 2viA4mbw1BokmLDFSUTNcHzb2Z4IJGSxEXspwwKTzAodNY++mOz4TDFx1pLYUpwnvAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=klL4TuIz;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D275B606A31E
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Nov 2026 13:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D275B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=klL4TuIz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795527150; x=1827063150;
  h=date:from:to:cc:subject:message-id;
  bh=Ee9CAZSx68SphLqzWIhz3Z8fKFv8wQQzulFogHDGzeA=;
  b=klL4TuIzffuB46JoLynqX/HbtRvg1W3+7ojVcNlnc/ChYFF0LHAK/Gaq
   v5u+EPmPOLOM1WSZNnfGp7bcQ28fS+oMMJIdVeaTFTX6pPtS0hwqpfPt1
   2IE7+TAfX27+bA+/1DysyiY5AZXgqZ42UviStYpJHlFUUPRQgIMMaKt+B
   sM9DZ+3TesYJzDSs+DmRlmAVHWcuqmdpzv3AiJ+O7B4fl6CS0bqfdvW9k
   pS941Vyx48Ckd2miiIoP7j+cAd5NdrBIMKLcDkJ+Srds5bTW+T69wRHyj
   9/oGze0jdYGhDVkT8L2DbZcEVnHFmbiu9RzybclqUh0hHzaWt7HqB1NYk
   g==;
X-CSE-ConnectionGUID: bM3nrqABT+O1dn5/lx0hHQ==
X-CSE-MsgGUID: 9gYLOtQxQE+aVtVBFOrAJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4272654"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4272654"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 05:32:30 -0800
X-CSE-ConnectionGUID: ayYKoMoPTnOyLea6jEfYnA==
X-CSE-MsgGUID: kyoBJFk7SKWHVxhW4WKynw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="13358025"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 24 Nov 2026 05:32:28 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVqdF-000000005Cb-0NOo;
	Tue, 24 Nov 2026 13:32:25 +0000
Date: Tue, 24 Nov 2026 14:31:41 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-li:imx/dt64 96/125]
 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17cb,1107):
 'vddaon-supply' is a required property
Message-ID: <20261124142225.oSpR9anc-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Vitor Soares <vitor.soares@toradex.com>
CC: Frank Li <Frank.Li@nxp.com>
CC: Francesco Dolcini <francesco.dolcini@toradex.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/dt64
head:   65f8b4684f2bb651f3e5168da9b237a31fed25b5
commit: 8a03967da41f55b803d31a6c5b5052bc35346eb6 [96/125] arm64: dts: freescale: imx95-aquila: Add ath12k calibration variant
:::::: branch date: 15 hours ago
:::::: commit date: 16 hours ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261124/20261124142225.oSpR9anc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261124/20261124142225.oSpR9anc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261124142225.oSpR9anc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: gpio@43850000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: gpio@47400000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: gpio@47400000 (fsl,imx95-gpio): clocks: [[24, 54]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17cb,1107): 'qcom,calibration-variant' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17cb,1107): 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17cb,1107): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17cb,1107): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17cb,1107): 'vddrfacmn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17cb,1107): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17cb,1107): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17cb,1107): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17cb,1107): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17cb,1107): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
--
   arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: gpio@43850000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: gpio@47400000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: gpio@47400000 (fsl,imx95-gpio): clocks: [[24, 54]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: wifi@0 (pci17cb,1107): 'qcom,calibration-variant' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: wifi@0 (pci17cb,1107): 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: wifi@0 (pci17cb,1107): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: wifi@0 (pci17cb,1107): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: wifi@0 (pci17cb,1107): 'vddrfacmn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: wifi@0 (pci17cb,1107): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: wifi@0 (pci17cb,1107): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: wifi@0 (pci17cb,1107): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: wifi@0 (pci17cb,1107): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: wifi@0 (pci17cb,1107): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
--
   arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dtb: gpio@43850000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dtb: gpio@47400000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dtb: gpio@47400000 (fsl,imx95-gpio): clocks: [[24, 54]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dtb: wifi@0 (pci17cb,1107): 'qcom,calibration-variant' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dtb: wifi@0 (pci17cb,1107): 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dtb: wifi@0 (pci17cb,1107): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dtb: wifi@0 (pci17cb,1107): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dtb: wifi@0 (pci17cb,1107): 'vddrfacmn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dtb: wifi@0 (pci17cb,1107): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dtb: wifi@0 (pci17cb,1107): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dtb: wifi@0 (pci17cb,1107): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dtb: wifi@0 (pci17cb,1107): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dtb: wifi@0 (pci17cb,1107): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
--
   arch/arm64/boot/dts/freescale/imx95-aquila-dev-uart4-mcu.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-dev-uart4-mcu.dtb: gpio@43850000 (fsl,imx95-gpio): clocks: [[24, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-dev-uart4-mcu.dtb: gpio@47400000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-dev-uart4-mcu.dtb: gpio@47400000 (fsl,imx95-gpio): clocks: [[24, 54]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-dev-uart4-mcu.dtb: wifi@0 (pci17cb,1107): 'qcom,calibration-variant' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev-uart4-mcu.dtb: wifi@0 (pci17cb,1107): 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev-uart4-mcu.dtb: wifi@0 (pci17cb,1107): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev-uart4-mcu.dtb: wifi@0 (pci17cb,1107): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev-uart4-mcu.dtb: wifi@0 (pci17cb,1107): 'vddrfacmn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev-uart4-mcu.dtb: wifi@0 (pci17cb,1107): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev-uart4-mcu.dtb: wifi@0 (pci17cb,1107): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev-uart4-mcu.dtb: wifi@0 (pci17cb,1107): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev-uart4-mcu.dtb: wifi@0 (pci17cb,1107): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev-uart4-mcu.dtb: wifi@0 (pci17cb,1107): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
