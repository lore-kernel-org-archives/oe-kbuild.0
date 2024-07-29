Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E092E15956E
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Jul 2024 15:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722267656; cv=none; b=GHtMJE5gMVZBKRulA95rmlXjYbOv6pQwkh6IQKTw9H0fnnPBkoJxFgHZA//TNDUP/JV+rhkKHvxaa6JrgN9nVjolpxJ1pJR7L8j7ErOgA+9R9HKPgPaLTmvTrg9Bs6kjOPMLxP+tTuYVGzso7WptYNXXCmSEyQKAWZNBgLRy7Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722267656; c=relaxed/simple;
	bh=w2hgFA3AUqqCzcsUkuao74s22pSy3KnkBJG7MN7tUxo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lZAwhpKcEcpz2FqRGZcs4msPIv/870w8SFCau9OLevLfy4jXemxwNF8rPG1wD7NolgAuDGdyKav9cWFGlwlw3wtFOUK+KPkoHukCScRbeuaqQ8fuqk0DkNBeA0Sc8GYpamlRHEzBh1eiiR4BWXYBLiaLlC8TJax53x938y3vbBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gt78egrP; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gt78egrP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722267654; x=1753803654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w2hgFA3AUqqCzcsUkuao74s22pSy3KnkBJG7MN7tUxo=;
  b=gt78egrPmZvkczdic5TwVXerf+R+hzONdK4KNz/nEvs7PCpgWZX1g8Pe
   NCze5dGLIu6mh7tDoEUkHeKyDSVaAXA0XO/BNeV3lMEmjQard39iw4iJK
   gYw+iQzd0QmAjKy+7JviPkHSrw+SAZHnBrndTsAIl1U9ltcvv/LW7ZbPk
   xhj2ACALwg6K+Du6gxBlf1syAmUf3Ui5nvOsSh87t/fDEeQjX0b+VgcYu
   E39huYe2YTNe89dS3uZxibkcDpbsFwNmldSO5wwRTw9PFCT0Mp/DfVT2j
   EpCpoXj2UBCzchdb5FXlW0buLxDlkgJmNpSCV5sDBLLXS54AMCBpkha0R
   Q==;
X-CSE-ConnectionGUID: BoHGTf1qTaSbeGYbJK9pEw==
X-CSE-MsgGUID: MGzHIc1OTVKz14uUdYI/2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="22938972"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="22938972"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 08:40:53 -0700
X-CSE-ConnectionGUID: 077/pteHR9+hDbavuMMEeQ==
X-CSE-MsgGUID: 8/OqmEioSvSanbw67AF45w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="53667582"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jul 2024 08:40:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYSUT-000ros-2h;
	Mon, 29 Jul 2024 15:40:49 +0000
Date: Mon, 29 Jul 2024 23:40:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-6.1 6/8]
 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb:
 hid-hx-common-spi@0: 'himax,pid', 'himax_gpio_irq', 'irq_flag' do not match
 any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202407292351.PlXcAArr-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   6a6abdc3abfa3a01c96fd357bc8d294b3173494c
commit: ef2ad3d3b59eab5e9686f241d1b1e44a788818f6 [6/8] CHROMIUM: arm64: dts: mt8188: Drop himax,firmware-name property
:::::: branch date: 8 hours ago
:::::: commit date: 13 hours ago
config: arm64-randconfig-051-20240729 (https://download.01.org/0day-ci/archive/20240729/202407292351.PlXcAArr-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240729/202407292351.PlXcAArr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407292351.PlXcAArr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: spi@11010000: 'dmas' is a dependency of 'dma-names'
   	from schema $id: http://devicetree.org/schemas/dma/dma.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: hid-hx-common-spi@0: 'vccd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: hid-hx-common-spi@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: hid-hx-common-spi@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: hid-hx-common-spi@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: hid-hx-common-spi@0: 'himax,pid', 'himax_gpio_irq', 'irq_flag' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/thermal-sensor@11278000: failed to match any schema with compatible: ['mediatek,mt8188-lvts-mcu']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: max98390@38: '#sound-dai-cells', 'maxim,dsm_param_name', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: max98390@39: '#sound-dai-cells', 'maxim,dsm_param_name', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: rt5682s@1a: #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: rt5682s@1a: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: spi@11010000: 'dmas' is a dependency of 'dma-names'
   	from schema $id: http://devicetree.org/schemas/dma/dma.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: hid-hx-common-spi@0: 'vccd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: hid-hx-common-spi@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: hid-hx-common-spi@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: hid-hx-common-spi@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: hid-hx-common-spi@0: 'himax,pid', 'himax_gpio_irq', 'irq_flag' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/thermal-sensor@11278000: failed to match any schema with compatible: ['mediatek,mt8188-lvts-mcu']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: max98390@38: '#sound-dai-cells', 'maxim,dsm_param_name', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: max98390@39: '#sound-dai-cells', 'maxim,dsm_param_name', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: es8326@19: 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8326.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pcie@112f0000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: spi@11010000: 'dmas' is a dependency of 'dma-names'
   	from schema $id: http://devicetree.org/schemas/dma/dma.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: hid-hx-common-spi@0: 'vccd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: hid-hx-common-spi@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: hid-hx-common-spi@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: hid-hx-common-spi@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: hid-hx-common-spi@0: 'himax,pid', 'himax_gpio_irq', 'irq_flag' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/thermal-sensor@11278000: failed to match any schema with compatible: ['mediatek,mt8188-lvts-mcu']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: max98390@38: '#sound-dai-cells', 'maxim,dsm_param_name', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: max98390@39: '#sound-dai-cells', 'maxim,dsm_param_name', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: es8326@19: 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8326.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pcie@112f0000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: spi@11010000: 'dmas' is a dependency of 'dma-names'
   	from schema $id: http://devicetree.org/schemas/dma/dma.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: hid-hx-common-spi@0: 'vccd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: hid-hx-common-spi@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: hid-hx-common-spi@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: hid-hx-common-spi@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: hid-hx-common-spi@0: 'himax,pid', 'himax_gpio_irq', 'irq_flag' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/thermal-sensor@11278000: failed to match any schema with compatible: ['mediatek,mt8188-lvts-mcu']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: max98390@38: '#sound-dai-cells', 'maxim,dsm_param_name', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: max98390@39: '#sound-dai-cells', 'maxim,dsm_param_name', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: rt5682s@1a: #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: rt5682s@1a: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: spi@11010000: 'dmas' is a dependency of 'dma-names'
   	from schema $id: http://devicetree.org/schemas/dma/dma.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: hid-hx-common-spi@0: 'vccd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: hid-hx-common-spi@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: hid-hx-common-spi@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: hid-hx-common-spi@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: hid-hx-common-spi@0: 'himax,pid', 'himax_gpio_irq', 'irq_flag' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/thermal-sensor@11278000: failed to match any schema with compatible: ['mediatek,mt8188-lvts-mcu']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: rt5682s@1a: #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: rt5682s@1a: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: rt5682s@1a: 'MICVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: rt5682s@1a: 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: spi@11010000: 'dmas' is a dependency of 'dma-names'
   	from schema $id: http://devicetree.org/schemas/dma/dma.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: hid-hx-common-spi@0: 'vccd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: hid-hx-common-spi@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: hid-hx-common-spi@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: hid-hx-common-spi@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: hid-hx-common-spi@0: 'himax,pid', 'himax_gpio_irq', 'irq_flag' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/thermal-sensor@11278000: failed to match any schema with compatible: ['mediatek,mt8188-lvts-mcu']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: es8326@19: 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8326.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: tas2563@4f: reg: [[79], [76]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: tas2563@4f: Unevaluated properties are not allowed ('reg', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pcie@112f0000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: spi@11010000: 'dmas' is a dependency of 'dma-names'
   	from schema $id: http://devicetree.org/schemas/dma/dma.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: hid-hx-common-spi@0: 'vccd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: hid-hx-common-spi@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: hid-hx-common-spi@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: hid-hx-common-spi@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: hid-hx-common-spi@0: 'himax,pid', 'himax_gpio_irq', 'irq_flag' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/thermal-sensor@11278000: failed to match any schema with compatible: ['mediatek,mt8188-lvts-mcu']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: es8326@19: 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8326.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: tas2563@4f: reg: [[79], [76]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: tas2563@4f: Unevaluated properties are not allowed ('reg', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pcie@112f0000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: spi@11010000: 'dmas' is a dependency of 'dma-names'
   	from schema $id: http://devicetree.org/schemas/dma/dma.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: hid-hx-common-spi@0: 'vccd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: hid-hx-common-spi@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: hid-hx-common-spi@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: hid-hx-common-spi@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: hid-hx-common-spi@0: 'himax,pid', 'himax_gpio_irq', 'irq_flag' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/thermal-sensor@11278000: failed to match any schema with compatible: ['mediatek,mt8188-lvts-mcu']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: rt5682s@1a: #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: rt5682s@1a: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: rt5682s@1a: 'MICVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: rt5682s@1a: 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
