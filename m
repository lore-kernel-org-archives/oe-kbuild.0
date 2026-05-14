Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA875175A68
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 06:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778741640; cv=none; b=koReTr1rYm94rWph7/JRRiWjO/R2xcYXcOyZIQfUtVTdYhsRveHY/UB5l5GXq+Z0t6QFnj9JBlXW7YXlWktYG8yFIBYnx1ix4GhU11pTgQ+zxaLUlTsFzBSwagyOt2vyjrqCtK8rDlY81z+ZVID3zKE6pbFzHoESihCP4dYY45U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778741640; c=relaxed/simple;
	bh=UlxgmXFTItkYMFeqW+5BsH8cFOBxsnpGqFhIRxIRKzA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d1OBr0HPb/poCC9mhZRzI4LWgGOvtRACcasxeWmriQBtHx2hW4lJX4ddFkdtD5A0ZH5l1Msz4Ag7w8KQrkA2FUb/Q9sIi/MJ70vsLKSNwwcpNicOPS0Oj6ksEx97bCzlZLV55zCELIDME4dYMItkNP8dPelTvooO1A1z9VTG0C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQjVlsBi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQjVlsBi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778741638; x=1810277638;
  h=date:from:to:cc:subject:message-id;
  bh=UlxgmXFTItkYMFeqW+5BsH8cFOBxsnpGqFhIRxIRKzA=;
  b=JQjVlsBinD9HxreCDUVW3mK798nrB9BpsqvOq73MEVQZU7LZSfwKv7gb
   WYBTV5qaQEVJJxvx+p3cV3EPcIYqsA4v8SN6hBkdtemsdAO1Qe5ubP3xf
   12bSOXPviW5Lx+A57/nq+YK2aTQd4rB/wnY2hvJmSwIFV/CakSUOrExnw
   MG0EoOusN7IlveO3+0hPTq06qQLM5uq4Rlomt8imEjh0hGacK7fH9yGSZ
   ysZig+1D4Q9iuiy40d9KqFE7X9CkhuWFS9eaUArhwEFlBD1q3bU4DODG9
   4GGvy1QSxzLJAo/UT7ROSw/fR42YwXwFqy3aw5yge+mDS1sLgg7wMoRsM
   Q==;
X-CSE-ConnectionGUID: i3RoFjmLRIGKXu7+r9oPig==
X-CSE-MsgGUID: ZHsAQxf8SqumNRdE2fGLNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="91140365"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="91140365"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 23:53:58 -0700
X-CSE-ConnectionGUID: Tkq87IXMS7GGNVrQytDvOg==
X-CSE-MsgGUID: GyxEV+GDS8GDwPmCvXrxbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="237441308"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 13 May 2026 23:53:56 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNPxA-000000008ld-1xL0;
	Thu, 14 May 2026 06:53:52 +0000
Date: Thu, 14 May 2026 08:53:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mediatek:v7.1-next/dts64 24/32]
 arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic
 (mediatek,mt6359): '#sound-dai-cells', 'vs1-ldo1-supply', 'vs1-ldo2-supply',
 'vs2-ldo1-supply', 'vs2-ldo2-supply', 'vsys-ldo1-supply', 'vsys-ldo2-supply',
 'vsys-smps-supply', 'vsys-vcore-supply'...
Message-ID: <202605140824.Wxi28uKf-lkp@intel.com>
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
TO: "Chen-Yu Tsai" <wenst@chromium.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v7.1-next/dts64
head:   7264d37c63139f2ce8c073ead1ed4409fbba12d6
commit: d33c57501113476e72a0d37f2ae0805f7ff38cb6 [24/32] arm64: dts: mediatek: mt8195-cherry: Add MT6359 PMIC supplies
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2055-20260512 (https://download.01.org/0day-ci/archive/20260514/202605140824.Wxi28uKf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140824.Wxi28uKf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605140824.Wxi28uKf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'vs1-ldo1-supply', 'vs1-ldo2-supply', 'vs2-ldo1-supply', 'vs2-ldo2-supply', 'vsys-ldo1-supply', 'vsys-ldo2-supply', 'vsys-smps-supply', 'vsys-vcore-supply', 'vsys-vgpu11-supply', 'vsys-vgpu12-supply', 'vsys-vmodem-supply', 'vsys-vpa-supply', 'vsys-vproc1-supply', 'vsys-vproc2-supply', 'vsys-vpu-supply', 'vsys-vs1-supply', 'vsys-vs2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: rt1019p (realtek,rt1019p): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'vs1-ldo1-supply', 'vs1-ldo2-supply', 'vs2-ldo1-supply', 'vs2-ldo2-supply', 'vsys-ldo1-supply', 'vsys-ldo2-supply', 'vsys-smps-supply', 'vsys-vcore-supply', 'vsys-vgpu11-supply', 'vsys-vgpu12-supply', 'vsys-vmodem-supply', 'vsys-vpa-supply', 'vsys-vproc1-supply', 'vsys-vproc2-supply', 'vsys-vpu-supply', 'vsys-vs1-supply', 'vsys-vs2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: rt1019p (realtek,rt1019p): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'vs1-ldo1-supply', 'vs1-ldo2-supply', 'vs2-ldo1-supply', 'vs2-ldo2-supply', 'vsys-ldo1-supply', 'vsys-ldo2-supply', 'vsys-smps-supply', 'vsys-vcore-supply', 'vsys-vgpu11-supply', 'vsys-vgpu12-supply', 'vsys-vmodem-supply', 'vsys-vpa-supply', 'vsys-vproc1-supply', 'vsys-vproc2-supply', 'vsys-vpu-supply', 'vsys-vs1-supply', 'vsys-vs2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: rt1019p (realtek,rt1019p): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'vs1-ldo1-supply', 'vs1-ldo2-supply', 'vs2-ldo1-supply', 'vs2-ldo2-supply', 'vsys-ldo1-supply', 'vsys-ldo2-supply', 'vsys-smps-supply', 'vsys-vcore-supply', 'vsys-vgpu11-supply', 'vsys-vgpu12-supply', 'vsys-vmodem-supply', 'vsys-vpa-supply', 'vsys-vproc1-supply', 'vsys-vproc2-supply', 'vsys-vpu-supply', 'vsys-vs1-supply', 'vsys-vs2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: rt1019p (realtek,rt1019p): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
