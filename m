Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCAD19CD1E
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Jan 2025 09:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737278119; cv=none; b=b/Y1wDw7toA58N9GHD0eK328NAH2HGG+zUR95bBczOW+KkA//VHPmGlEuGq4Fj0pvjZybS0WhrNXVb2o/qrnxvtIHLFTvhLboKZJTsImZufb5Nd16xSYcweR0wiUL2xCNDRuhTgGk2xYv4iZ71JUzGwBNShW/PbByBqbOdiqQZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737278119; c=relaxed/simple;
	bh=KjRgd2ffyZv9JzsQDjafrbZVgobMvI3Kj6/Y+JJL9eU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VcpQ6LjH4G6iJy1GNln1NkFOngKRhVAOChzv9dhCYBKoBGMXQ303c3Lm26OJ9Ycpw7609QV9n1hjslax8+66/fDHuaVmByTiCpdBMBidhfEVmzjEHVdOBnFQE0liOCG8ae9MrqvICGIL66d5A07yjZab1lMKt+s0BCkN/2Akjgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O7DYpAeR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7DYpAeR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737278118; x=1768814118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KjRgd2ffyZv9JzsQDjafrbZVgobMvI3Kj6/Y+JJL9eU=;
  b=O7DYpAeRjcaeGGC5PTox9loYYk52at3oMrvAW5QBerNHVCXe9UHaI9Bv
   /9V0Xn9uIROXqoP1VbCDQTSpYh1/T4NeAqhNR6s+s1yo4bnPpPcL4rUi1
   KN1XlBG3qZI/YCCXeiJoMUjhUsAWbzy37wUfoKgS4FzzaAds56ATjlUBJ
   4B65mjSDmQhuunSiZkMNq1Tz1fgxyd7ZP8BlP22AayouO9ogPQxNBeyii
   +t3vhXlqkEm8jZbSoIWonY6EDcMm5qY9LnpQ+ic/h8yeDwVgrSu67Zorf
   EFSusbw+1AuESmyW4GufBvGd1H3ZAch4D5c25uPUb/7gH+SRPtreN1uHD
   A==;
X-CSE-ConnectionGUID: oDfqnpdoTXedIAh9SITwvg==
X-CSE-MsgGUID: Rsm7U2jYQqmZ8VjhGjF2Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="55213837"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="55213837"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 01:15:16 -0800
X-CSE-ConnectionGUID: X7Uvt0YhTvSSb+qlRq/gxg==
X-CSE-MsgGUID: k2MI2E4aTQqxOOsCIlvy8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="106159774"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Jan 2025 01:15:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZROj-000VHp-10;
	Sun, 19 Jan 2025 09:15:13 +0000
Date: Sun, 19 Jan 2025 17:14:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:mtk-wip 32/48]
 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtb: pinctrl@10005000:
 mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
Message-ID: <202501191728.sqFwemBM-lkp@intel.com>
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
TO: "Chen-Yu Tsai" <wenst@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-wip
head:   a2f8143f6e1e6b3d8dac24f675646fbfdfc03202
commit: 0af51b30f86abe42aae0c8598b5286c8ebf44faf [32/48] arm64: dts: mediatek: mt8183-kukui: Merge Krane device trees
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-053-20250117 (https://download.01.org/0day-ci/archive/20250119/202501191728.sqFwemBM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501191728.sqFwemBM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501191728.sqFwemBM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:245.17-261.4: Warning (unique_unit_address_if_enabled): /soc/dsi@14014000/panel@0: duplicate unit-address (also used in node /soc/dsi@14014000/panel2@0)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtb: pinctrl@10005000: mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtb: pinctrl@10005000: mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtb: pinctrl@10005000: panel-pins-default: 'panel-reset' does not match any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtb: pinctrl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'open_touch', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtb: dsi@14014000: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtb: dsi@14014000: ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtb: dsi@14014000: Unevaluated properties are not allowed ('panel2@0', 'ports' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3a227_max98357']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtb: bt-sco: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/linux,bt-sco.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
