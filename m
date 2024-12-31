Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E0419CCFC
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Dec 2024 17:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735665715; cv=none; b=WNyzIAfdNIhGBEu+xg70MSOwfzZ9HVNZ3bBCfw/vxP5qYBLjm2NE6xOzvev4z4HUxi5Z0KYzKOZ0e4Unb7i8gAH2QO8dRXt8ZmxuZlnQqYvpkbQsWfcZeVVg4/1TxWgPizp77UQnxE1EJIz458vKnpwPo1/QqTf6uVKFjfuGtgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735665715; c=relaxed/simple;
	bh=4m0kL0QCtRT1vkc+9J8Q9h71T9zIh0WCPCNKeqDdA0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q8TrG7JphGtTinmktnmjvuRn4tlCZvV0tMD7F1fFPYzrXx76nZc6dmwTB38B58bur1VZ7cE+gWqQIPse4BUg95hFE7JScz+4utYs+aOwAEjezNVml7J0cjq4SHEthpf/0hJhjzdGYgWrTmywiykprYqtdSC2G5SdDjDcNqBFI18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BngyUX9U; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BngyUX9U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735665713; x=1767201713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4m0kL0QCtRT1vkc+9J8Q9h71T9zIh0WCPCNKeqDdA0k=;
  b=BngyUX9UH+KlTp+Bnr3Bm4cuUqY5Lp6w3MS174Vc852wbmYSlOg6/R/W
   9WbcyDIlEbQOxnxW4pM2fLqdcmtn09wMZv3eSM1UG4vNJLL3ZEYEEt0k9
   szBuMB8A7832Z0XNW7BXAJOiqcWakcCpNFg7IAFKqPq1zv0BgrChdX+LF
   2HiAACT0fm4oU8vG9grdcXZAfDThW/jVhD8jppYDND1Jpph62mfvMYf5s
   vKG+5xufPQF3uKWDiYCWujWPP27PM4sScokZU6Lqlnsoq0rfAPF6lYrAA
   OZ3pRK2UyXgKve4a+aruW+2MGn271jJ+Pzai/iTInpUGSrSyx0xiqjIBC
   g==;
X-CSE-ConnectionGUID: cTnw78ESTwGLTUZ9K6vKSg==
X-CSE-MsgGUID: 1eUYNgSiTz6HaG+uEeMzbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="23534565"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="23534565"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 09:21:53 -0800
X-CSE-ConnectionGUID: JoemicK4RPKkV8rXtTK4uA==
X-CSE-MsgGUID: 8b93TLLbT1Wma9ukKfSwOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="101203792"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Dec 2024 09:21:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSfwD-0007IR-0L;
	Tue, 31 Dec 2024 17:21:49 +0000
Date: Wed, 1 Jan 2025 01:21:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chunkuang-hu:mediatek-drm-fixes 10/11]
 arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: edp-tx@1c500000:
 Unevaluated properties are not allowed ('aux-bus' was unexpected)
Message-ID: <202501010108.SaPoUgBf-lkp@intel.com>
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
TO: Fei Shao <fshao@chromium.org>
CC: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git mediatek-drm-fixes
head:   76aed5e00ff2625e0ec4b40c75f3514bdb27fae4
commit: 8fe3ee95da1bf42830e9b02c70f111b53ab65229 [10/11] dt-bindings: display: mediatek: dp: Reference common DAI properties
:::::: branch date: 26 hours ago
:::::: commit date: 27 hours ago
config: arm64-randconfig-051-20241231 (https://download.01.org/0day-ci/archive/20250101/202501010108.SaPoUgBf-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 319b89197348b7cad1215e235bdc7b5ec8f9b72c)
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501010108.SaPoUgBf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501010108.SaPoUgBf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic@34: #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a: Unevaluated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a: 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a: 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: edp-tx@1c500000: Unevaluated properties are not allowed ('aux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: rt1019p: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic: 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic@34: #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/i2c@11e02000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: edp-tx@1c500000: Unevaluated properties are not allowed ('aux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: rt1019p: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic: 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic@34: #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/i2c@11e02000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: edp-tx@1c500000: Unevaluated properties are not allowed ('aux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: rt1019p: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic@34: #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a: Unevaluated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a: 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a: 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: edp-tx@1c500000: Unevaluated properties are not allowed ('aux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: rt1019p: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
