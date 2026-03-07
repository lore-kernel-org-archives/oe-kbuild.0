Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFA0156661
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 12:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772885051; cv=none; b=jUPOgotfLpXWiS2Gn3Yp1ClyMR9m37KYEQ/rWM+CiP4fc8fF0uzT600R7rnWq1MdQHTT0BQFXxOkEOqG/xGwLuVoqLaNm99Shqxi8RGuUKDG1ALtoWJEWHDSLioLWOB9J5/lFtL6ddOLVGxdNOC4DIsLpvbxsnSzp0sWb+6RLKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772885051; c=relaxed/simple;
	bh=1c5qfK/Q+i43zuk4auCDYWVaiu8EsI6llHc4WONP6Do=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XMotI+TnkPgKq5bTQsRJnWsJdFkzIp/1C6WlkPM+tTOxMWAwqy6AqXPggCtgyexR+kYNgnLcrUjx62qvbOycxc3/yxecJJyZnu83jD9qF9K0sWRYP96yX7TspiVq+Hw3dpFM/jLT46zx9L+KRzwtBWK1q+krvFQ6NiKnVv3yT3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mILZ84Zu; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mILZ84Zu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772885050; x=1804421050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1c5qfK/Q+i43zuk4auCDYWVaiu8EsI6llHc4WONP6Do=;
  b=mILZ84ZumgDyrT7rXiapBSZ72BTIZjQSTdeHxCFGVBIfk2JnZG4ndlqq
   0jJumjgmt0BlPXPROc/fc/9w2BaMgFSUy7R3eC4CzFjISJUqoWRfJIVJr
   LPW5L/Hep01qgUXnx5fkLwGS1ulU6srtSCwz7ws/FPJNO3vfw4kYY8JZw
   0QhpEUppSdl0TtGihY86D/zwN4jVgoYetx5SvRM7Ru/YlpSnCcMryfsfp
   t6mp0IBBJbUSTSMSB+D2nIWej5YyQUPX4rB+hxWR4hb1U5BjUfxedEsm7
   aLhowhnZSau/sTfKQF3Aa6851AoMMBTowzdvnuvA3yt4t/oCtMFO17SyE
   Q==;
X-CSE-ConnectionGUID: fgvYRQAqTN+XEyUulg1l0w==
X-CSE-MsgGUID: hLT/aICuQVGY0y31xQ6dBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="96593854"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="96593854"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 04:04:09 -0800
X-CSE-ConnectionGUID: NE4SFJnDTxudgREl80e0GA==
X-CSE-MsgGUID: XvrHz7mSRIiJ71fwZ+o4sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="222036555"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 07 Mar 2026 04:04:08 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyqO6-000000002TN-2JZ2;
	Sat, 07 Mar 2026 12:04:06 +0000
Date: Sat, 7 Mar 2026 13:03:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/3] arm: dts: mediatek: mt7623: fix pinctrl
 controller node name
Message-ID: <202603071201.moEsVJRi-lkp@intel.com>
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
In-Reply-To: <20260305-mtk-fix-mt7623-pinctl-name-v2-2-a68854a51065@baylibre.com>
References: <20260305-mtk-fix-mt7623-pinctl-name-v2-2-a68854a51065@baylibre.com>
TO: David Lechner <dlechner@baylibre.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: David Lechner <dlechner@baylibre.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3f9cd19e764b782706dbaacc69e502099cb014ba]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Lechner/arm-dts-mediatek-mt7623-fix-pinctrl-child-node-names/20260306-092239
base:   3f9cd19e764b782706dbaacc69e502099cb014ba
patch link:    https://lore.kernel.org/r/20260305-mtk-fix-mt7623-pinctl-name-v2-2-a68854a51065%40baylibre.com
patch subject: [PATCH v2 2/3] arm: dts: mediatek: mt7623: fix pinctrl controller node name
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm-randconfig-2052-20260306 (https://download.01.org/0day-ci/archive/20260307/202603071201.moEsVJRi-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071201.moEsVJRi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603071201.moEsVJRi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/mediatek/mt7623.dtsi:765.3-767.36: Warning (interrupt_map): /pcie@1a140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:765.3-767.36: Warning (interrupt_map): /pcie@1a140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:765.3-767.36: Warning (interrupt_map): /pcie@1a140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:793.4-46: Warning (interrupt_map): /pcie@1a140000/pcie@0,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:804.4-46: Warning (interrupt_map): /pcie@1a140000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:815.4-46: Warning (interrupt_map): /pcie@1a140000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
>> arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: pinctrl@1000b000 (mediatek,mt7623-pinctrl): 'hdmi-default', 'hdmi_ddc-default' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /syscfg@10005000: failed to match any schema with compatible: ['mediatek,mt7623-pctl-a-syscfg', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7623-scpsys', 'mediatek,mt2701-scpsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7623-scpsys', 'mediatek,mt2701-scpsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: pwrap@1000d000 (mediatek,mt7623-pwrap): 'mt6323' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: pwrap@1000d000 (mediatek,mt7623-pwrap): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap'] is too long
   	['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap'] is too short
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt2701-pwrap', 'mediatek,mt6765-pwrap', 'mediatek,mt6779-pwrap', 'mediatek,mt6795-pwrap', 'mediatek,mt6797-pwrap', 'mediatek,mt6873-pwrap', 'mediatek,mt7622-pwrap', 'mediatek,mt8135-pwrap', 'mediatek,mt8173-pwrap', 'mediatek,mt8183-pwrap', 'mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap', 'mediatek,mt8365-pwrap', 'mediatek,mt8516-pwrap']
--
   arch/arm/boot/dts/mediatek/mt7623.dtsi:765.3-767.36: Warning (interrupt_map): /pcie@1a140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:765.3-767.36: Warning (interrupt_map): /pcie@1a140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:765.3-767.36: Warning (interrupt_map): /pcie@1a140000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:793.4-46: Warning (interrupt_map): /pcie@1a140000/pcie@0,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:804.4-46: Warning (interrupt_map): /pcie@1a140000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623.dtsi:815.4-46: Warning (interrupt_map): /pcie@1a140000/pcie@2,0:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@10200100, using 0 as fallback
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: / (bananapi,bpi-r2): fixedregulator@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: pinctrl@1000b000 (mediatek,mt7623-pinctrl): 'hdmi-default', 'hdmi_ddc-default', 'musb' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /syscfg@10005000: failed to match any schema with compatible: ['mediatek,mt7623-pctl-a-syscfg', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7623-scpsys', 'mediatek,mt2701-scpsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7623-scpsys', 'mediatek,mt2701-scpsys', 'syscon']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: pwrap@1000d000 (mediatek,mt7623-pwrap): 'mt6323' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: pwrap@1000d000 (mediatek,mt7623-pwrap): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap'] is too long
   	['mediatek,mt7623-pwrap', 'mediatek,mt2701-pwrap'] is too short
   	'mediatek,mt7623-pwrap' is not one of ['mediatek,mt2701-pwrap', 'mediatek,mt6765-pwrap', 'mediatek,mt6779-pwrap', 'mediatek,mt6795-pwrap', 'mediatek,mt6797-pwrap', 'mediatek,mt6873-pwrap', 'mediatek,mt7622-pwrap', 'mediatek,mt8135-pwrap', 'mediatek,mt8173-pwrap', 'mediatek,mt8183-pwrap', 'mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap', 'mediatek,mt8365-pwrap', 'mediatek,mt8516-pwrap']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
