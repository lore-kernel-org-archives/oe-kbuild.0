Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DC033C0
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jul 2024 02:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720837922; cv=none; b=fQ+bM9eJikbE7i693bt10he9S+RHUqHT7BtR6+Tu50XKB/9g6mpzEy602HypYJNsMT1fJDigw0tkytIHwNsK219heBOND5pjyBPUQxDNVOZocuUN7FX5RZdjSmVHBht960J77Z8gXmyXsjxuQGyq52eD7kIpxanA9SHd7Jnk9BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720837922; c=relaxed/simple;
	bh=tVj1EuuG/HDXsRiV6pa3ZVYtBTDC85AZip937idnazk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=omq6FWaI0cSw+68WL0/eBnLMKhbw5UqBDX58N7IYXX3eyhLpVNcGeO13eo8oZBUMHTobengGcUDzcBhpdc1QGdhoYGRwReYmuFgKEaHgKY+xXRb8dhtY0FY9xDFqeYjrhai4S3aQUQLDFW7pH/cTDnciErnVyKH6VnM+j4jiifE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bz0J2E4n; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bz0J2E4n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720837920; x=1752373920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tVj1EuuG/HDXsRiV6pa3ZVYtBTDC85AZip937idnazk=;
  b=bz0J2E4nBwOUAQPma3zcOS0bCNfDQ7cRv7A/JVthxLZ98REqbKpAPhNy
   7eSAOJcvMT8u0gj0NqIu8iDQZTTnon3KAuNCNKaVUg5PWAy24ET1TVIpK
   NgrIjU57kjvEZ9e6NsMLI1ih3D+OXJ68rDKKTgU06HB6uEnUoV50Z5ny9
   33qO5O20OZ8/qYOk+7K6QQ20vtymQhc00RM2Ie2mzeuBikWXdz1jiIc7h
   alxdj8JDgl+AAmIFHT8yKrZgZrkU59mdo9OibqXPrw4Xa7FMybdQo7DDa
   zIaCuLQ3hy4lcxpk8+suffC0Tm29x3nUp0fC910r1rtVUBFxGu44/OZR5
   g==;
X-CSE-ConnectionGUID: jLDHOzX3Tce+Kg4zHJaZeQ==
X-CSE-MsgGUID: bmd2hNvfSyidVeyvRqgZYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="17912053"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="17912053"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 19:32:00 -0700
X-CSE-ConnectionGUID: g02/hr49RzSNTeaq4dEYyw==
X-CSE-MsgGUID: tpmpDZqsRESF2TRwxJUsow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="49482364"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Jul 2024 19:31:59 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSSYG-000bZa-1o;
	Sat, 13 Jul 2024 02:31:56 +0000
Date: Sat, 13 Jul 2024 10:31:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-6.1 2/2]
 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: tas2563@4f: reg:
 [[79], [76]] is too long
Message-ID: <202407131006.uLEaI5y3-lkp@intel.com>
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
TO: Guenter Roeck <groeck@google.com>

Hi Rui,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   09072f31c4d2e6269ded7224e5af1964fbe0f481
commit: 09072f31c4d2e6269ded7224e5af1964fbe0f481 [2/2] CHROMIUM: arm64: dts: mediatek: mt8188-geralt-ciri: Modify tas2563 address channel
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arm64-randconfig-051-20240713 (https://download.01.org/0day-ci/archive/20240713/202407131006.uLEaI5y3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407131006.uLEaI5y3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407131006.uLEaI5y3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: rt5682s@1a: #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: rt5682s@1a: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: rt5682s@1a: 'MICVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: rt5682s@1a: 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: rt5682s@1a: 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: tas2563@4f: reg: [[79], [76]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: tas2563@4f: Unevaluated properties are not allowed ('reg', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pcie@112f0000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pcie@112f0000: Unevaluated properties are not allowed ('dsc-reset-gpios', 'pcie1v8-supply', 'pcie3v3-supply', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pcie@0,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pcie@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pcie@1,0: 'device_type' is a required property
--
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: hid_hx_common_spi@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: hid_hx_common_spi@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: hid_hx_common_spi@0: 'himax,firmware-name', 'himax,pid', 'himax_gpio_irq', 'irq_flag' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/thermal-sensor@11278000: failed to match any schema with compatible: ['mediatek,mt8188-lvts-mcu']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: es8326@19: 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8326.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: tas2563@4f: reg: [[79], [76]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: tas2563@4f: Unevaluated properties are not allowed ('reg', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pcie@112f0000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pcie@112f0000: Unevaluated properties are not allowed ('dsc-reset-gpios', 'pcie1v8-supply', 'pcie3v3-supply', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pcie@0,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pcie@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pcie@1,0: 'device_type' is a required property
--
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: hid_hx_common_spi@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: hid_hx_common_spi@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: hid_hx_common_spi@0: 'himax,firmware-name', 'himax,pid', 'himax_gpio_irq', 'irq_flag' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/thermal-sensor@11278000: failed to match any schema with compatible: ['mediatek,mt8188-lvts-mcu']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: es8326@19: 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8326.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: tas2563@4f: reg: [[79], [76]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: tas2563@4f: Unevaluated properties are not allowed ('reg', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pcie@112f0000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pcie@112f0000: Unevaluated properties are not allowed ('dsc-reset-gpios', 'pcie1v8-supply', 'pcie3v3-supply', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pcie@0,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pcie@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pcie@1,0: 'device_type' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: rt5682s@1a: #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: rt5682s@1a: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: rt5682s@1a: 'MICVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: rt5682s@1a: 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: rt5682s@1a: 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: tas2563@4f: reg: [[79], [76]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: tas2563@4f: Unevaluated properties are not allowed ('reg', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pcie@112f0000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pcie@112f0000: Unevaluated properties are not allowed ('dsc-reset-gpios', 'pcie1v8-supply', 'pcie3v3-supply', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pcie@0,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pcie@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pcie@1,0: 'device_type' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
