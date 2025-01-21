Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66E42CAB
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Jan 2025 09:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737450515; cv=none; b=cuhBehNgNILyVYhM17ShdTbZypVJwaU5mAbdJ3wyzNeaSzenAEHgD1enL01nMjWe+kOum8Oqw3mHHW5hzSa/6dk1Hi1T2xmANrAwpNmyrVNyWOvrdqHFKifGbR/99Ypu9Rzs84T0G/i/iG6IIyjLeAso7yanSRWc9lw8a9M46/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737450515; c=relaxed/simple;
	bh=bVAW0mVSZOwHeS3j2QlQo+kOE/OcwjW0gOTa8CTJkwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tzjZZx+7Oz+qKMQpFVuj3ex4MAqEWza8+XAc/8Fr+59iUtMDqvOJ4qUnwce+pDeuTdIrPdzn90RJi32daaOLVohTg0D0jQumt2kugpmdrCvWYLfZTPL1XQJQq2mxfhR9JGNtc0neTcdo+hhhUIn4qdcd8x604kqWOTvbbADHLSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i5tXTTVd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i5tXTTVd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737450513; x=1768986513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bVAW0mVSZOwHeS3j2QlQo+kOE/OcwjW0gOTa8CTJkwk=;
  b=i5tXTTVdMXTJNnuseKd4H2AzJ7H4qHpU/dvi8bh7JrnNlS1C5mOMAMT/
   tfYOus6TrsvG6eJgb1eFT6DScnwjkYjN1L1Ebhn/VKLis1BCSRNznz4I4
   EtDkbT1xjqmuQkK1Tsxk7NJLmbRcU+fr/dNv4/bSjL+Fw3kClyvpSVcFu
   1XNhOeaa/pPtYeDlnIm/1D1HJFMvRuxbVrMxqT0ivlnxRHXUcxDJvdP8M
   unci6LZgjoEHAMcOGngr4s1QMO2Y9/e9pAYBMbvmEEltFHm9pKhkggLvn
   58BaV/zU3pE8HGyP+aryHKfkmMAi/5cjMhhERkWW6qNmZyLnfFsRR+7qf
   Q==;
X-CSE-ConnectionGUID: Z+UJlKUTQ6O4w2dQYtLaAQ==
X-CSE-MsgGUID: rDe6tdKBTKe2ALuQE+yvDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="41527463"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="41527463"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 01:08:33 -0800
X-CSE-ConnectionGUID: 2rCMLsucRk2nJUjkKQIHOg==
X-CSE-MsgGUID: zBkX8+eATaS65v58BfuHpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="111734726"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Jan 2025 01:08:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taAFK-000XsB-1C;
	Tue, 21 Jan 2025 09:08:30 +0000
Date: Tue, 21 Jan 2025 17:07:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:mtk-wip 32/48]
 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtb: pinctrl@10005000:
 mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
Message-ID: <202501211716.As0VcJqA-lkp@intel.com>
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
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-053-20250117 (https://download.01.org/0day-ci/archive/20250121/202501211716.As0VcJqA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501211716.As0VcJqA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501211716.As0VcJqA-lkp@intel.com/

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
