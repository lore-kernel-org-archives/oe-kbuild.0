Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993B71946B
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Nov 2024 06:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732689986; cv=none; b=AMP2hM0HMY11OpKp4Sem0U/zjcEzcs/4uxthze62Si/FTeqIk0ghsabpz12hVvQlcn27rLJIa5y710jdSBOlgoi0l83+wWdTE4PX0Rn9t0wP8v8pWXHRAm6nXM2ZMMqt4gFs3h2+RrXDGY7oaagqXJEEMI4JYn4C9STjan+xn14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732689986; c=relaxed/simple;
	bh=h63DEEF497gFo386iyQgeTo7ZFSu7S/9Pv8/DCP8Elw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dUjsOxKkZHxLSiJFQRFUCeYSnXmrNZRdGEMB/h8J1dVG6qdcih1x49G5xYN6Y4fZ3gIE/p+CW6cQuUPqzeS4VEUixLcxB+auwaRHBecH7OyZWIPhMe1uVWKdaWI9947IM/G4C5ni/toYSQ0TxIJSgBL7nu9Nn/wJY8KZsFGpcik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ex3aLCT4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ex3aLCT4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732689981; x=1764225981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h63DEEF497gFo386iyQgeTo7ZFSu7S/9Pv8/DCP8Elw=;
  b=Ex3aLCT4NZoiFillbcizRmF9s6kpx68jUvZH7K/J5vy0EOmTgEQc5/FK
   WmWsQiklCdJaPV+spgc7sXPAHiNQ3m5EnhoXd/tcD7hE5M90VCg4Dh1IN
   tsAlOpWA/NLL/0wm0nOc9ajuwnAVX6LBHrFo6huPCYveSCdyKi7xeATon
   oI3EFknMsccbU/5X8sbAhUfyGj8ID6D5+QyZrRJVFQLF6uuoxAc60hQ9h
   TYZN/6osQ+fdN4LQ06DFAEavjk/4cOF31hEO0dwq2pX9wnubjwUFNEssi
   RhkYGJ+IhjUbCU8gfhJVQHPOLJtjQ292GKZVJOJkJPIzqQ8Ul77ADNaId
   A==;
X-CSE-ConnectionGUID: U6la0o2AQtqmrNTFdk5TJQ==
X-CSE-MsgGUID: 5HnmQdKpSoOtn/dU7viD+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36665698"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="36665698"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 22:46:21 -0800
X-CSE-ConnectionGUID: KCqqSqByQXaOzQWXhM7CtA==
X-CSE-MsgGUID: KXsBmmvQQpKVPfZ/aM8iOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="96916574"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Nov 2024 22:46:18 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGBoW-0007mh-0O;
	Wed, 27 Nov 2024 06:46:16 +0000
Date: Wed, 27 Nov 2024 14:46:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: mediatek: Add MT8186 Starmie
 Chromebooks
Message-ID: <202411271401.ZYrBphxT-lkp@intel.com>
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
In-Reply-To: <20241122104938.1437925-2-wmacek@chromium.org>
References: <20241122104938.1437925-2-wmacek@chromium.org>
TO: Wojciech Macek <wmacek@chromium.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: "Chen-Yu Tsai" <wenst@chromium.org>
TO: Rafal Milecki <rafal@milecki.pl>
TO: "Hsin-Yi Wang" <hsinyi@chromium.org>
TO: Sean Wang <sean.wang@mediatek.com>
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-mediatek@lists.infradead.org
CC: Wojciech Macek <wmacek@chromium.org>

Hi Wojciech,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.12 next-20241126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wojciech-Macek/dt-bindings-arm-mediatek-Add-MT8186-Starmie-Chromebooks/20241125-121351
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241122104938.1437925-2-wmacek%40chromium.org
patch subject: [PATCH v1 1/2] dt-bindings: arm: mediatek: Add MT8186 Starmie Chromebooks
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20241125 (https://download.01.org/0day-ci/archive/20241127/202411271401.ZYrBphxT-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411271401.ZYrBphxT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411271401.ZYrBphxT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt2712-evb', 'mediatek,mt2712']
>> arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt2712-evb', 'mediatek,mt2712']
   arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt2712-scpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: /pcie@112ff000: failed to match any schema with compatible: ['mediatek,mt2712-pcie']
   arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: /pcie@11700000: failed to match any schema with compatible: ['mediatek,mt2712-pcie']
--
>> arch/arm64/boot/dts/mediatek/mt6755-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt6755-evb', 'mediatek,mt6755']
>> arch/arm64/boot/dts/mediatek/mt6755-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt6755-evb', 'mediatek,mt6755']
   arch/arm64/boot/dts/mediatek/mt6755-evb.dtb: intpol-controller@10200620: $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt6779-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt6779-evb', 'mediatek,mt6779']
>> arch/arm64/boot/dts/mediatek/mt6779-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt6779-evb', 'mediatek,mt6779']
   arch/arm64/boot/dts/mediatek/mt6779-evb.dtb: intpol-controller@c53a650: $nodename:0: 'intpol-controller@c53a650' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt6779-evb.dtb: /soc/clock-controller@11210000: failed to match any schema with compatible: ['mediatek,mt6779-audio', 'syscon']
--
>> arch/arm64/boot/dts/mediatek/mt6795-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt6795-evb', 'mediatek,mt6795']
>> arch/arm64/boot/dts/mediatek/mt6795-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt6795-evb', 'mediatek,mt6795']
   arch/arm64/boot/dts/mediatek/mt6795-evb.dtb: syscon@10006000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-evb.dtb: timer@10008000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6795-timer', 'mediatek,mt6577-timer'] is too long
   	'mediatek,mt6795-timer' is not one of ['mediatek,mt6577-timer', 'mediatek,mt6765-timer', 'mediatek,mt6795-systimer']
   	'mediatek,mt6795-timer' is not one of ['mediatek,mt2701-timer', 'mediatek,mt6580-timer', 'mediatek,mt6582-timer', 'mediatek,mt6589-timer', 'mediatek,mt7623-timer', 'mediatek,mt8127-timer', 'mediatek,mt8135-timer', 'mediatek,mt8173-timer', 'mediatek,mt8516-timer']
   	'mediatek,mt6795-timer' is not one of ['mediatek,mt7629-timer', 'mediatek,mt8183-timer', 'mediatek,mt8186-timer', 'mediatek,mt8188-timer', 'mediatek,mt8192-timer', 'mediatek,mt8195-timer', 'mediatek,mt8365-systimer']
   	'mediatek,mt6765-timer' was expected
   	from schema $id: http://devicetree.org/schemas/timer/mediatek,timer.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-evb.dtb: /soc/timer@10008000: failed to match any schema with compatible: ['mediatek,mt6795-timer', 'mediatek,mt6577-timer']
--
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: /: failed to match any schema with compatible: ['sony,xperia-m5', 'mediatek,mt6795']
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: /: failed to match any schema with compatible: ['sony,xperia-m5', 'mediatek,mt6795']
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: syscon@10006000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: timer@10008000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6795-timer', 'mediatek,mt6577-timer'] is too long
   	'mediatek,mt6795-timer' is not one of ['mediatek,mt6577-timer', 'mediatek,mt6765-timer', 'mediatek,mt6795-systimer']
   	'mediatek,mt6795-timer' is not one of ['mediatek,mt2701-timer', 'mediatek,mt6580-timer', 'mediatek,mt6582-timer', 'mediatek,mt6589-timer', 'mediatek,mt7623-timer', 'mediatek,mt8127-timer', 'mediatek,mt8135-timer', 'mediatek,mt8173-timer', 'mediatek,mt8516-timer']
   	'mediatek,mt6795-timer' is not one of ['mediatek,mt7629-timer', 'mediatek,mt8183-timer', 'mediatek,mt8186-timer', 'mediatek,mt8188-timer', 'mediatek,mt8192-timer', 'mediatek,mt8195-timer', 'mediatek,mt8365-systimer']
   	'mediatek,mt6765-timer' was expected
   	from schema $id: http://devicetree.org/schemas/timer/mediatek,timer.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: /soc/timer@10008000: failed to match any schema with compatible: ['mediatek,mt6795-timer', 'mediatek,mt6577-timer']
--
>> arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt6797-evb', 'mediatek,mt6797']
>> arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt6797-evb', 'mediatek,mt6797']
   arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: pinctrl@10005000: 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'i2c7', 'uart0', 'uart1' do not match any of the regexes: '-[0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt6779-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt6797-scpsys']
   arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: intpol-controller@10200620: $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: /: failed to match any schema with compatible: ['archermind,mt6797-x20-dev', 'mediatek,mt6797']
>> arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: /: failed to match any schema with compatible: ['archermind,mt6797-x20-dev', 'mediatek,mt6797']
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: pinctrl@10005000: 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'i2c7', 'uart0', 'uart1' do not match any of the regexes: '-[0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt6779-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt6797-scpsys']
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: intpol-controller@10200620: $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: i2c@11008000: Unevaluated properties are not allowed ('id' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: i2c@1100e000: Unevaluated properties are not allowed ('id' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: i2c@11010000: Unevaluated properties are not allowed ('id' was unexpected)
--
>> arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: /: failed to match any schema with compatible: ['mediatek,mt7622-rfb1', 'mediatek,mt7622']
>> arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: /: failed to match any schema with compatible: ['mediatek,mt7622-rfb1', 'mediatek,mt7622']
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: pwrap@10001000: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: /pwrap@10001000/regulators: failed to match any schema with compatible: ['mediatek,mt6380-regulator']
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7622-scpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: pinctrl@10211000: reg: [[0, 270602240, 0, 4096], [0, 268455936, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: pinctrl@10211000: reg-names:0: 'eint' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: pinctrl@10211000: reg-names: ['base', 'eint'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r64', 'mediatek,mt7622']
>> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r64', 'mediatek,mt7622']
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pwrap@10001000: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: /pwrap@10001000/regulators: failed to match any schema with compatible: ['mediatek,mt6380-regulator']
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7622-scpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000: reg: [[0, 270602240, 0, 4096], [0, 268455936, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000: reg-names:0: 'eint' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000: reg-names: ['base', 'eint'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /: failed to match any schema with compatible: ['cudy,wr3000-v1', 'mediatek,mt7981b']
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /: failed to match any schema with compatible: ['cudy,wr3000-v1', 'mediatek,mt7981b']
--
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: /: failed to match any schema with compatible: ['openwrt,one', 'mediatek,mt7981b']
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: /: failed to match any schema with compatible: ['openwrt,one', 'mediatek,mt7981b']
--
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: /: failed to match any schema with compatible: ['xiaomi,ax3000t', 'mediatek,mt7981b']
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: /: failed to match any schema with compatible: ['xiaomi,ax3000t', 'mediatek,mt7981b']
--
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:431.19-445.5: Warning (simple_bus_reg): /soc/t-phy: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts:98.10-154.4: Warning (avoid_unnecessary_addr_size): /soc/spi@1100a000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dtb: /: failed to match any schema with compatible: ['acelink,ew-7886cax', 'mediatek,mt7986a']
>> arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dtb: /: failed to match any schema with compatible: ['acelink,ew-7886cax', 'mediatek,mt7986a']
   arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dtb: crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dtb: crypto@10320000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:431.19-445.5: Warning (simple_bus_reg): /soc/t-phy: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r3', 'mediatek,mt7986a']
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r3', 'mediatek,mt7986a']
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: crypto@10320000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: switch@31: 'interrupts' is a dependency of 'interrupt-controller'
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:431.19-445.5: Warning (simple_bus_reg): /soc/t-phy: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r3mini', 'mediatek,mt7986a']
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r3mini', 'mediatek,mt7986a']
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: crypto@10320000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:431.19-445.5: Warning (simple_bus_reg): /soc/t-phy: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7986a-rfb.dtb: /: failed to match any schema with compatible: ['mediatek,mt7986a-rfb', 'mediatek,mt7986a']
>> arch/arm64/boot/dts/mediatek/mt7986a-rfb.dtb: /: failed to match any schema with compatible: ['mediatek,mt7986a-rfb', 'mediatek,mt7986a']
   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dtb: crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dtb: crypto@10320000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:431.19-445.5: Warning (simple_bus_reg): /soc/t-phy: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7986b-rfb.dtb: /: failed to match any schema with compatible: ['mediatek,mt7986b-rfb', 'mediatek,mt7986b']
>> arch/arm64/boot/dts/mediatek/mt7986b-rfb.dtb: /: failed to match any schema with compatible: ['mediatek,mt7986b-rfb', 'mediatek,mt7986b']
   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dtb: crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dtb: crypto@10320000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r4', 'mediatek,mt7988a']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r4', 'mediatek,mt7988a']
--
>> arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: /: failed to match any schema with compatible: ['mediatek,mt8167-pumpkin', 'mediatek,mt8167']
>> arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: /: failed to match any schema with compatible: ['mediatek,mt8167-pumpkin', 'mediatek,mt8167']
   arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: syscfg-pctl@10005000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: pinctrl@1000b000: 'ethernet', 'gpiodefault', 'i2c0', 'i2c2' do not match any of the regexes: 'pinctrl-[0-9]+', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi:926.13-1137.4: Warning (avoid_unnecessary_addr_size): /soc/pwrap@1000d000/pmic: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   marvell,wakeup-pin: size (2) error for type uint32
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /: failed to match any schema with compatible: ['google,elm-rev8', 'google,elm-rev7', 'google,elm-rev6', 'google,elm-rev5', 'google,elm-rev4', 'google,elm-rev3', 'google,elm', 'mediatek,mt8173']
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /: failed to match any schema with compatible: ['google,elm-rev8', 'google,elm-rev7', 'google,elm-rev6', 'google,elm-rev5', 'google,elm-rev4', 'google,elm-rev3', 'google,elm', 'mediatek,mt8173']
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /: failed to match any schema with compatible: ['google,elm-rev8', 'google,elm-rev7', 'google,elm-rev6', 'google,elm-rev5', 'google,elm-rev4', 'google,elm-rev3', 'google,elm', 'mediatek,mt8173']
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /: failed to match any schema with compatible: ['google,elm-rev8', 'google,elm-rev7', 'google,elm-rev6', 'google,elm-rev5', 'google,elm-rev4', 'google,elm-rev3', 'google,elm', 'mediatek,mt8173']
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /: failed to match any schema with compatible: ['google,elm-rev8', 'google,elm-rev7', 'google,elm-rev6', 'google,elm-rev5', 'google,elm-rev4', 'google,elm-rev3', 'google,elm', 'mediatek,mt8173']
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /: failed to match any schema with compatible: ['google,elm-rev8', 'google,elm-rev7', 'google,elm-rev6', 'google,elm-rev5', 'google,elm-rev4', 'google,elm-rev3', 'google,elm', 'mediatek,mt8173']
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /: failed to match any schema with compatible: ['google,elm-rev8', 'google,elm-rev7', 'google,elm-rev6', 'google,elm-rev5', 'google,elm-rev4', 'google,elm-rev3', 'google,elm', 'mediatek,mt8173']
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /: failed to match any schema with compatible: ['google,elm-rev8', 'google,elm-rev7', 'google,elm-rev6', 'google,elm-rev5', 'google,elm-rev4', 'google,elm-rev3', 'google,elm', 'mediatek,mt8173']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: power-controller@10001000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: power-controller@10003000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pinctrl@1000b000: 'aud_i2s2', 'gpio-line-names', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'trackpad_irq', 'usb', 'xxx' do not match any of the regexes: 'pinctrl-[0-9]+', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6397']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/pwrap@1000d000/pmic/mt6397clock: failed to match any schema with compatible: ['mediatek,mt6397-clk']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator: buck_vpca15: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi:926.13-1137.4: Warning (avoid_unnecessary_addr_size): /soc/pwrap@1000d000/pmic: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   marvell,wakeup-pin: size (2) error for type uint32
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /: failed to match any schema with compatible: ['google,hana-rev6', 'google,hana-rev5', 'google,hana-rev4', 'google,hana-rev3', 'google,hana', 'mediatek,mt8173']
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /: failed to match any schema with compatible: ['google,hana-rev6', 'google,hana-rev5', 'google,hana-rev4', 'google,hana-rev3', 'google,hana', 'mediatek,mt8173']
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /: failed to match any schema with compatible: ['google,hana-rev6', 'google,hana-rev5', 'google,hana-rev4', 'google,hana-rev3', 'google,hana', 'mediatek,mt8173']
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /: failed to match any schema with compatible: ['google,hana-rev6', 'google,hana-rev5', 'google,hana-rev4', 'google,hana-rev3', 'google,hana', 'mediatek,mt8173']
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /: failed to match any schema with compatible: ['google,hana-rev6', 'google,hana-rev5', 'google,hana-rev4', 'google,hana-rev3', 'google,hana', 'mediatek,mt8173']
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /: failed to match any schema with compatible: ['google,hana-rev6', 'google,hana-rev5', 'google,hana-rev4', 'google,hana-rev3', 'google,hana', 'mediatek,mt8173']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: power-controller@10001000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: power-controller@10003000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: pinctrl@1000b000: 'aud_i2s2', 'gpio-line-names', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'trackpad_irq', 'usb', 'xxx' do not match any of the regexes: 'pinctrl-[0-9]+', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6397']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/pwrap@1000d000/pmic/mt6397clock: failed to match any schema with compatible: ['mediatek,mt6397-clk']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator: buck_vpca15: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi:926.13-1137.4: Warning (avoid_unnecessary_addr_size): /soc/pwrap@1000d000/pmic: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   marvell,wakeup-pin: size (2) error for type uint32
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /: failed to match any schema with compatible: ['google,hana-rev7', 'mediatek,mt8173']
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /: failed to match any schema with compatible: ['google,hana-rev7', 'mediatek,mt8173']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: power-controller@10001000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: power-controller@10003000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: pinctrl@1000b000: 'aud_i2s2', 'gpio-line-names', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'trackpad_irq', 'usb', 'xxx' do not match any of the regexes: 'pinctrl-[0-9]+', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6397']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/pwrap@1000d000/pmic/mt6397clock: failed to match any schema with compatible: ['mediatek,mt6397-clk']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator: buck_vpca15: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt8173-evb', 'mediatek,mt8173']
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt8173-evb', 'mediatek,mt8173']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: power-controller@10001000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: power-controller@10003000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: pinctrl@1000b000: 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'spi0', 'usb_iddig_pull_down', 'usb_iddig_pull_up', 'xxx' do not match any of the regexes: 'pinctrl-[0-9]+', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: pwrap@1000d000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6397']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator: buck_vpca15: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
--
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt8183-evb', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt8183-evb', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: pinctrl@10005000: 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'pwm1', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: dsi@14014000: 'port' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1825.22-1837.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@14014000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /: failed to match any schema with compatible: ['google,burnet', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /: failed to match any schema with compatible: ['google,burnet', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1825.22-1837.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@14014000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /: failed to match any schema with compatible: ['google,cozmo', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /: failed to match any schema with compatible: ['google,cozmo', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1825.22-1837.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@14014000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /: failed to match any schema with compatible: ['google,damu', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /: failed to match any schema with compatible: ['google,damu', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1825.22-1837.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@14014000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /: failed to match any schema with compatible: ['google,fennel-sku1', 'google,fennel', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /: failed to match any schema with compatible: ['google,fennel-sku1', 'google,fennel', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /: failed to match any schema with compatible: ['google,fennel-sku1', 'google,fennel', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1825.22-1837.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@14014000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /: failed to match any schema with compatible: ['google,fennel-sku6', 'google,fennel', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /: failed to match any schema with compatible: ['google,fennel-sku6', 'google,fennel', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /: failed to match any schema with compatible: ['google,fennel-sku6', 'google,fennel', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1825.22-1837.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@14014000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /: failed to match any schema with compatible: ['google,fennel-sku7', 'google,fennel', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /: failed to match any schema with compatible: ['google,fennel-sku7', 'google,fennel', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /: failed to match any schema with compatible: ['google,fennel-sku7', 'google,fennel', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1825.22-1837.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@14014000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /: failed to match any schema with compatible: ['google,fennel-sku0', 'google,fennel', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /: failed to match any schema with compatible: ['google,fennel-sku0', 'google,fennel', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /: failed to match any schema with compatible: ['google,fennel-sku0', 'google,fennel', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1825.22-1837.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@14014000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /: failed to match any schema with compatible: ['google,fennel-sku2', 'google,fennel', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /: failed to match any schema with compatible: ['google,fennel-sku2', 'google,fennel', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /: failed to match any schema with compatible: ['google,fennel-sku2', 'google,fennel', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1825.22-1837.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@14014000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /: failed to match any schema with compatible: ['google,juniper-sku16', 'google,juniper', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /: failed to match any schema with compatible: ['google,juniper-sku16', 'google,juniper', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /: failed to match any schema with compatible: ['google,juniper-sku16', 'google,juniper', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1825.22-1837.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@14014000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /: failed to match any schema with compatible: ['google,kappa', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /: failed to match any schema with compatible: ['google,kappa', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1825.22-1837.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@14014000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /: failed to match any schema with compatible: ['google,juniper-sku17', 'google,juniper', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /: failed to match any schema with compatible: ['google,juniper-sku17', 'google,juniper', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /: failed to match any schema with compatible: ['google,juniper-sku17', 'google,juniper', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1825.22-1837.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@14014000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /: failed to match any schema with compatible: ['google,makomo-sku0', 'google,makomo', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /: failed to match any schema with compatible: ['google,makomo-sku0', 'google,makomo', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /: failed to match any schema with compatible: ['google,makomo-sku0', 'google,makomo', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1825.22-1837.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@14014000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /: failed to match any schema with compatible: ['google,makomo-sku1', 'google,makomo', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /: failed to match any schema with compatible: ['google,makomo-sku1', 'google,makomo', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /: failed to match any schema with compatible: ['google,makomo-sku1', 'google,makomo', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1825.22-1837.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@14014000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /: failed to match any schema with compatible: ['google,willow-sku0', 'google,willow', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /: failed to match any schema with compatible: ['google,willow-sku0', 'google,willow', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /: failed to match any schema with compatible: ['google,willow-sku0', 'google,willow', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1825.22-1837.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@14014000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /: failed to match any schema with compatible: ['google,willow-sku1', 'google,willow', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /: failed to match any schema with compatible: ['google,willow-sku1', 'google,willow', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /: failed to match any schema with compatible: ['google,willow-sku1', 'google,willow', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /: failed to match any schema with compatible: ['google,kakadu-rev3', 'google,kakadu-rev2', 'google,kakadu', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /: failed to match any schema with compatible: ['google,kakadu-rev3', 'google,kakadu-rev2', 'google,kakadu', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /: failed to match any schema with compatible: ['google,kakadu-rev3', 'google,kakadu-rev2', 'google,kakadu', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /: failed to match any schema with compatible: ['google,kakadu-rev3', 'google,kakadu-rev2', 'google,kakadu', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /: failed to match any schema with compatible: ['google,kakadu-rev3-sku22', 'google,kakadu-rev2-sku22', 'google,kakadu', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /: failed to match any schema with compatible: ['google,kakadu-rev3-sku22', 'google,kakadu-rev2-sku22', 'google,kakadu', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /: failed to match any schema with compatible: ['google,kakadu-rev3-sku22', 'google,kakadu-rev2-sku22', 'google,kakadu', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /: failed to match any schema with compatible: ['google,kakadu-rev3-sku22', 'google,kakadu-rev2-sku22', 'google,kakadu', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /: failed to match any schema with compatible: ['google,kodama-sku16', 'google,kodama', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /: failed to match any schema with compatible: ['google,kodama-sku16', 'google,kodama', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /: failed to match any schema with compatible: ['google,kodama-sku16', 'google,kodama', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /: failed to match any schema with compatible: ['google,kodama-sku272', 'google,kodama', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /: failed to match any schema with compatible: ['google,kodama-sku272', 'google,kodama', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /: failed to match any schema with compatible: ['google,kodama-sku272', 'google,kodama', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /: failed to match any schema with compatible: ['google,kodama-sku288', 'google,kodama', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /: failed to match any schema with compatible: ['google,kodama-sku288', 'google,kodama', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /: failed to match any schema with compatible: ['google,kodama-sku288', 'google,kodama', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /: failed to match any schema with compatible: ['google,kodama-sku32', 'google,kodama', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /: failed to match any schema with compatible: ['google,kodama-sku32', 'google,kodama', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /: failed to match any schema with compatible: ['google,kodama-sku32', 'google,kodama', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /: failed to match any schema with compatible: ['google,krane-sku0', 'google,krane', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /: failed to match any schema with compatible: ['google,krane-sku0', 'google,krane', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /: failed to match any schema with compatible: ['google,krane-sku0', 'google,krane', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /: failed to match any schema with compatible: ['google,krane-sku176', 'google,krane', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /: failed to match any schema with compatible: ['google,krane-sku176', 'google,krane', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /: failed to match any schema with compatible: ['google,krane-sku176', 'google,krane', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@10005000: mmc1-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /: failed to match any schema with compatible: ['mediatek,mt8183-pumpkin', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /: failed to match any schema with compatible: ['mediatek,mt8183-pumpkin', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: cci: 'proc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/mediatek,cci.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: pinctrl@10005000: mmc0-pins-default:pins_clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: pinctrl@10005000: mmc0-pins-uhs:pins_clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: pinctrl@10005000: mmc0-pins-uhs:pins_ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: pinctrl@10005000: mmc1-pins-default:pins_cmd_dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: /: failed to match any schema with compatible: ['google,steelix-sku393219', 'google,steelix-sku393216', 'google,steelix', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: /: failed to match any schema with compatible: ['google,steelix-sku393219', 'google,steelix-sku393216', 'google,steelix', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: /: failed to match any schema with compatible: ['google,steelix-sku393219', 'google,steelix-sku393216', 'google,steelix', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: /: failed to match any schema with compatible: ['google,steelix-sku393219', 'google,steelix-sku393216', 'google,steelix', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: dp-bridge@5c: 'extcon' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: /: failed to match any schema with compatible: ['google,steelix-sku393220', 'google,steelix-sku393217', 'google,steelix', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: /: failed to match any schema with compatible: ['google,steelix-sku393220', 'google,steelix-sku393217', 'google,steelix', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: /: failed to match any schema with compatible: ['google,steelix-sku393220', 'google,steelix-sku393217', 'google,steelix', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: /: failed to match any schema with compatible: ['google,steelix-sku393220', 'google,steelix-sku393217', 'google,steelix', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: dp-bridge@5c: 'extcon' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: /: failed to match any schema with compatible: ['google,steelix-sku393221', 'google,steelix-sku393218', 'google,steelix', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: /: failed to match any schema with compatible: ['google,steelix-sku393221', 'google,steelix-sku393218', 'google,steelix', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: /: failed to match any schema with compatible: ['google,steelix-sku393221', 'google,steelix-sku393218', 'google,steelix', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: /: failed to match any schema with compatible: ['google,steelix-sku393221', 'google,steelix-sku393218', 'google,steelix', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: dp-bridge@5c: 'extcon' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: /: failed to match any schema with compatible: ['google,steelix-sku196609', 'google,steelix-sku196608', 'google,steelix', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: /: failed to match any schema with compatible: ['google,steelix-sku196609', 'google,steelix-sku196608', 'google,steelix', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: /: failed to match any schema with compatible: ['google,steelix-sku196609', 'google,steelix-sku196608', 'google,steelix', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: /: failed to match any schema with compatible: ['google,steelix-sku196609', 'google,steelix-sku196608', 'google,steelix', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: dp-bridge@5c: 'extcon' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: /: failed to match any schema with compatible: ['google,steelix-sku131072', 'google,steelix', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: /: failed to match any schema with compatible: ['google,steelix-sku131072', 'google,steelix', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: /: failed to match any schema with compatible: ['google,steelix-sku131072', 'google,steelix', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: dp-bridge@5c: 'extcon' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: /: failed to match any schema with compatible: ['google,steelix-sku131073', 'google,steelix', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: /: failed to match any schema with compatible: ['google,steelix-sku131073', 'google,steelix', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: /: failed to match any schema with compatible: ['google,steelix-sku131073', 'google,steelix', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: dp-bridge@5c: 'extcon' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: /: failed to match any schema with compatible: ['google,tentacruel-sku327681', 'google,tentacruel', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: /: failed to match any schema with compatible: ['google,tentacruel-sku327681', 'google,tentacruel', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: /: failed to match any schema with compatible: ['google,tentacruel-sku327681', 'google,tentacruel', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: dp-bridge@5c: 'extcon' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: /: failed to match any schema with compatible: ['google,tentacruel-sku327683', 'google,tentacruel', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: /: failed to match any schema with compatible: ['google,tentacruel-sku327683', 'google,tentacruel', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: /: failed to match any schema with compatible: ['google,tentacruel-sku327683', 'google,tentacruel', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: dp-bridge@5c: 'extcon' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt8186-evb', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt8186-evb', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-evb.dtb: cci: 'proc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/mediatek,cci.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt8188-evb', 'mediatek,mt8188']
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt8188-evb', 'mediatek,mt8188']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: syscon@10006000: power-controller:power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scpsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: /: failed to match any schema with compatible: ['google,hayato-rev1', 'google,hayato', 'mediatek,mt8192']
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: /: failed to match any schema with compatible: ['google,hayato-rev1', 'google,hayato', 'mediatek,mt8192']
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: /: failed to match any schema with compatible: ['google,hayato-rev1', 'google,hayato', 'mediatek,mt8192']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: /soc/pwrap@10026000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: /soc/pwrap@10026000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: syscon@11210000: 'mt8192-afe-pcm' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pcm: clocks: [[59, 0], [59, 7], [59, 8], [59, 6], [59, 21], [59, 1], [59, 2], [59, 4], [59, 3], [59, 5], [59, 9], [59, 10], [59, 18], [59, 19], [59, 20], [59, 22], [59, 23], [59, 24], [59, 25], [59, 26], [23, 47], [23, 58], [22, 27], [22, 28], [22, 72], [22, 47], [22, 101], [22, 48], [22, 105], [22, 43], [22, 103], [22, 44], [22, 107], [22, 59], [22, 60], [22, 61], [22, 62], [22, 63], [22, 64], [22, 65], [22, 66], [22, 67], [22, 68], [22, 142], [22, 143], [22, 144], [22, 145], [22, 146], [22, 147], [22, 148], [22, 149], [22, 150], [22, 151], [22, 152], [22, 55], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pcm: clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pcm: clock-names:4: 'aud_infra_26m_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: /: failed to match any schema with compatible: ['google,hayato-rev5-sku2', 'google,hayato-sku2', 'google,hayato', 'mediatek,mt8192']
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: /: failed to match any schema with compatible: ['google,hayato-rev5-sku2', 'google,hayato-sku2', 'google,hayato', 'mediatek,mt8192']
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: /: failed to match any schema with compatible: ['google,hayato-rev5-sku2', 'google,hayato-sku2', 'google,hayato', 'mediatek,mt8192']
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: /: failed to match any schema with compatible: ['google,hayato-rev5-sku2', 'google,hayato-sku2', 'google,hayato', 'mediatek,mt8192']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: /soc/pwrap@10026000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: /soc/pwrap@10026000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: syscon@11210000: 'mt8192-afe-pcm' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: mt8192-afe-pcm: clocks: [[56, 0], [56, 7], [56, 8], [56, 6], [56, 21], [56, 1], [56, 2], [56, 4], [56, 3], [56, 5], [56, 9], [56, 10], [56, 18], [56, 19], [56, 20], [56, 22], [56, 23], [56, 24], [56, 25], [56, 26], [23, 47], [23, 58], [22, 27], [22, 28], [22, 72], [22, 47], [22, 101], [22, 48], [22, 105], [22, 43], [22, 103], [22, 44], [22, 107], [22, 59], [22, 60], [22, 61], [22, 62], [22, 63], [22, 64], [22, 65], [22, 66], [22, 67], [22, 68], [22, 142], [22, 143], [22, 144], [22, 145], [22, 146], [22, 147], [22, 148], [22, 149], [22, 150], [22, 151], [22, 152], [22, 55], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: mt8192-afe-pcm: clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: mt8192-afe-pcm: clock-names:4: 'aud_infra_26m_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: /: failed to match any schema with compatible: ['google,spherion-rev3', 'google,spherion-rev2', 'google,spherion-rev1', 'google,spherion-rev0', 'google,spherion', 'mediatek,mt8192']
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: /: failed to match any schema with compatible: ['google,spherion-rev3', 'google,spherion-rev2', 'google,spherion-rev1', 'google,spherion-rev0', 'google,spherion', 'mediatek,mt8192']
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: /: failed to match any schema with compatible: ['google,spherion-rev3', 'google,spherion-rev2', 'google,spherion-rev1', 'google,spherion-rev0', 'google,spherion', 'mediatek,mt8192']
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: /: failed to match any schema with compatible: ['google,spherion-rev3', 'google,spherion-rev2', 'google,spherion-rev1', 'google,spherion-rev0', 'google,spherion', 'mediatek,mt8192']
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: /: failed to match any schema with compatible: ['google,spherion-rev3', 'google,spherion-rev2', 'google,spherion-rev1', 'google,spherion-rev0', 'google,spherion', 'mediatek,mt8192']
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: /: failed to match any schema with compatible: ['google,spherion-rev3', 'google,spherion-rev2', 'google,spherion-rev1', 'google,spherion-rev0', 'google,spherion', 'mediatek,mt8192']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: /soc/pwrap@10026000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: /soc/pwrap@10026000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: syscon@11210000: 'mt8192-afe-pcm' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: mt8192-afe-pcm: clocks: [[56, 0], [56, 7], [56, 8], [56, 6], [56, 21], [56, 1], [56, 2], [56, 4], [56, 3], [56, 5], [56, 9], [56, 10], [56, 18], [56, 19], [56, 20], [56, 22], [56, 23], [56, 24], [56, 25], [56, 26], [23, 47], [23, 58], [22, 27], [22, 28], [22, 72], [22, 47], [22, 101], [22, 48], [22, 105], [22, 43], [22, 103], [22, 44], [22, 107], [22, 59], [22, 60], [22, 61], [22, 62], [22, 63], [22, 64], [22, 65], [22, 66], [22, 67], [22, 68], [22, 142], [22, 143], [22, 144], [22, 145], [22, 146], [22, 147], [22, 148], [22, 149], [22, 150], [22, 151], [22, 152], [22, 55], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: mt8192-afe-pcm: clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: mt8192-afe-pcm: clock-names:4: 'aud_infra_26m_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: /: failed to match any schema with compatible: ['google,spherion-rev4', 'google,spherion', 'mediatek,mt8192']
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: /: failed to match any schema with compatible: ['google,spherion-rev4', 'google,spherion', 'mediatek,mt8192']
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: /: failed to match any schema with compatible: ['google,spherion-rev4', 'google,spherion', 'mediatek,mt8192']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: /soc/pwrap@10026000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: /soc/pwrap@10026000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: syscon@11210000: 'mt8192-afe-pcm' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: mt8192-afe-pcm: clocks: [[56, 0], [56, 7], [56, 8], [56, 6], [56, 21], [56, 1], [56, 2], [56, 4], [56, 3], [56, 5], [56, 9], [56, 10], [56, 18], [56, 19], [56, 20], [56, 22], [56, 23], [56, 24], [56, 25], [56, 26], [23, 47], [23, 58], [22, 27], [22, 28], [22, 72], [22, 47], [22, 101], [22, 48], [22, 105], [22, 43], [22, 103], [22, 44], [22, 107], [22, 59], [22, 60], [22, 61], [22, 62], [22, 63], [22, 64], [22, 65], [22, 66], [22, 67], [22, 68], [22, 142], [22, 143], [22, 144], [22, 145], [22, 146], [22, 147], [22, 148], [22, 149], [22, 150], [22, 151], [22, 152], [22, 55], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: mt8192-afe-pcm: clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: mt8192-afe-pcm: clock-names:4: 'aud_infra_26m_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt8192-evb', 'mediatek,mt8192']
>> arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt8192-evb', 'mediatek,mt8192']
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: /soc/pwrap@10026000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: /soc/pwrap@10026000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: syscon@11210000: 'mt8192-afe-pcm' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: mt8192-afe-pcm: clocks: [[45, 0], [45, 7], [45, 8], [45, 6], [45, 21], [45, 1], [45, 2], [45, 4], [45, 3], [45, 5], [45, 9], [45, 10], [45, 18], [45, 19], [45, 20], [45, 22], [45, 23], [45, 24], [45, 25], [45, 26], [23, 47], [23, 58], [22, 27], [22, 28], [22, 72], [22, 47], [22, 101], [22, 48], [22, 105], [22, 43], [22, 103], [22, 44], [22, 107], [22, 59], [22, 60], [22, 61], [22, 62], [22, 63], [22, 64], [22, 65], [22, 66], [22, 67], [22, 68], [22, 142], [22, 143], [22, 144], [22, 145], [22, 146], [22, 147], [22, 148], [22, 149], [22, 150], [22, 151], [22, 152], [22, 55], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: mt8192-afe-pcm: clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: mt8192-afe-pcm: clock-names:4: 'aud_infra_26m_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /: failed to match any schema with compatible: ['google,tomato-rev1', 'google,tomato', 'mediatek,mt8195']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /: failed to match any schema with compatible: ['google,tomato-rev1', 'google,tomato', 'mediatek,mt8195']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /: failed to match any schema with compatible: ['google,tomato-rev1', 'google,tomato', 'mediatek,mt8195']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: syscon@10001000: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic@34: #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/i2c@11e02000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /: failed to match any schema with compatible: ['google,tomato-rev2', 'google,tomato', 'mediatek,mt8195']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /: failed to match any schema with compatible: ['google,tomato-rev2', 'google,tomato', 'mediatek,mt8195']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /: failed to match any schema with compatible: ['google,tomato-rev2', 'google,tomato', 'mediatek,mt8195']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: syscon@10001000: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic@34: #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/i2c@11e02000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /: failed to match any schema with compatible: ['google,tomato-rev4', 'google,tomato-rev3', 'google,tomato', 'mediatek,mt8195']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /: failed to match any schema with compatible: ['google,tomato-rev4', 'google,tomato-rev3', 'google,tomato', 'mediatek,mt8195']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /: failed to match any schema with compatible: ['google,tomato-rev4', 'google,tomato-rev3', 'google,tomato', 'mediatek,mt8195']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /: failed to match any schema with compatible: ['google,tomato-rev4', 'google,tomato-rev3', 'google,tomato', 'mediatek,mt8195']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: syscon@10001000: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic@34: #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a: #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /: failed to match any schema with compatible: ['mediatek,mt8195-demo', 'mediatek,mt8195']
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /: failed to match any schema with compatible: ['mediatek,mt8195-demo', 'mediatek,mt8195']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: syscon@10001000: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: pmic@34: charger:usb-otg-vbus-regulator: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: charger: usb-otg-vbus-regulator: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/supply/mt6360_charger.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt8195-evb', 'mediatek,mt8195']
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt8195-evb', 'mediatek,mt8195']
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: syscon@10001000: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: display@14f06000: clocks: [[30, 14], [30, 43], [30, 44]] is too long
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,split.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: mutex@1c101000: 'clock-names', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: /: failed to match any schema with compatible: ['mediatek,mt8365-evk', 'mediatek,mt8365']
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: /: failed to match any schema with compatible: ['mediatek,mt8365-evk', 'mediatek,mt8365']
   arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic: 'adc' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: /: failed to match any schema with compatible: ['mediatek,mt8395-evk', 'mediatek,mt8395', 'mediatek,mt8195']
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: /: failed to match any schema with compatible: ['mediatek,mt8395-evk', 'mediatek,mt8395', 'mediatek,mt8195']
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: /: failed to match any schema with compatible: ['mediatek,mt8395-evk', 'mediatek,mt8395', 'mediatek,mt8195']
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: syscon@10001000: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: eth-phy0@1: Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: eth-phy0@1: $nodename:0: 'eth-phy0@1' does not match '^ethernet-phy(@[a-f0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /: failed to match any schema with compatible: ['mediatek,mt8390-evk', 'mediatek,mt8390', 'mediatek,mt8188']
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /: failed to match any schema with compatible: ['mediatek,mt8390-evk', 'mediatek,mt8390', 'mediatek,mt8188']
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /: failed to match any schema with compatible: ['mediatek,mt8390-evk', 'mediatek,mt8390', 'mediatek,mt8188']
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: syscon@10006000: power-controller:power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scpsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: /: failed to match any schema with compatible: ['kontron,3-5-sbc-i1200', 'mediatek,mt8395', 'mediatek,mt8195']
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: /: failed to match any schema with compatible: ['kontron,3-5-sbc-i1200', 'mediatek,mt8395', 'mediatek,mt8195']
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: /: failed to match any schema with compatible: ['kontron,3-5-sbc-i1200', 'mediatek,mt8395', 'mediatek,mt8195']
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: syscon@10001000: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: regulator: 'BUCK1', 'BUCK2', 'LDO1', 'LDO2', 'LDO3', 'LDO5', 'LDO6', 'LDO7' do not match any of the regexes: '^buck[12]$', '^ldo[123567]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6360-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: /: failed to match any schema with compatible: ['radxa,nio-12l', 'mediatek,mt8395', 'mediatek,mt8195']
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: /: failed to match any schema with compatible: ['radxa,nio-12l', 'mediatek,mt8395', 'mediatek,mt8195']
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: /: failed to match any schema with compatible: ['radxa,nio-12l', 'mediatek,mt8395', 'mediatek,mt8195']
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: syscon@10001000: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: display@14f06000: clocks: [[34, 14], [34, 43], [34, 44]] is too long
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,split.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dtb: /: failed to match any schema with compatible: ['mediatek,mt8516']
   arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dtb: topckgen@10000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8516-topckgen', 'syscon'] is too long
   	['mediatek,mt8516-topckgen', 'syscon'] is too short
   	'mediatek,mt7623-topckgen' was expected
   	'mediatek,mt8516-topckgen' is not one of ['mediatek,mt2701-topckgen', 'mediatek,mt2712-topckgen', 'mediatek,mt6765-topckgen', 'mediatek,mt6779-topckgen', 'mediatek,mt6795-topckgen', 'mediatek,mt7629-topckgen', 'mediatek,mt7981-topckgen', 'mediatek,mt7986-topckgen', 'mediatek,mt7988-mcusys', 'mediatek,mt7988-topckgen', 'mediatek,mt8167-topckgen', 'mediatek,mt8183-topckgen']
   	'mediatek,mt2701-topckgen' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,topckgen.yaml#
   arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dtb: apmixedsys@10018000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8516-apmixedsys', 'syscon'] is too long
   	['mediatek,mt8516-apmixedsys', 'syscon'] is too short

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
