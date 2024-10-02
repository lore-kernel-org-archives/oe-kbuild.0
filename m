Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D351078F
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Oct 2024 03:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727839969; cv=none; b=pa4YtWbVrf71Oh3aZxjOF4sB7hYmbbMrr/jJ335ojyM7+lXewDwCZZOPf8LiNvau5Z+S9tnVkgkDEIdEyczJB5p+QyLqckk7LEk2c1Huq83CmLGZBUtpiZy3WsPGwEkGPoj4nUNsK1woNQm0h2vut/TUI9Vv27E2YuXVRoHgSKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727839969; c=relaxed/simple;
	bh=98DM57b6wG4vLHYEG6w8eAeTW5ERzwynVOx19YsAUbA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WZ4H6qpYIZ25DaSY/yq5zuR52zzCZz6zlXPyfA4KhqB0Lbkt/J5VWWeTaAPhQJlMmwTySQqqCZCpSEdfaGp2za7+sdZTLsNbPHBqS1R7aR+smSM7PWeBCaEsNg0NTuGNh57nGIeixsUKpeXYNSZPwsq68bJ02ogEzmmAkbAeutw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PUpXOU6T; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PUpXOU6T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727839967; x=1759375967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=98DM57b6wG4vLHYEG6w8eAeTW5ERzwynVOx19YsAUbA=;
  b=PUpXOU6TUYwDVqIcS64tB8AHuaDJ9WntImU1CcIdCKKOvc/8RGaYVFEh
   fr+y5wWuC4swl4Kxtd6Ijutct5mtF/UiLoM4oMAas+Sv8QK+bBLtNgYWW
   ibSukCdUaasXTDFr4xNe1YrOwnFio+6y+CExCO5mC7jNimgfnPUncv0Yx
   HZ3AUdfK+8snR18uk5fukI8mTFNUKFzNnj7YfNM/aKsVds4o568dlO2Q6
   QA/N7436bQ0KpzTo8BfYGa/zY3GS8VqWq7ovVxVGkPgD1vZKCFQt4Z3fC
   CkgciiXe5xbj1BruQ8J9AQBGh3UEQHokHeSXX1p7aNh+WepBdOf+x0u/G
   w==;
X-CSE-ConnectionGUID: BPQiWUBeRQmkdxz8hdgHRw==
X-CSE-MsgGUID: XGabVWJ8Qd+b3mDTE+zIJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26883713"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="26883713"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 20:32:46 -0700
X-CSE-ConnectionGUID: ANII7SalSlGTc2qxVRIc9w==
X-CSE-MsgGUID: 6Kblo/R9QuCfQbcDWrJpVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="111357728"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Oct 2024 20:32:46 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svq6V-000RVS-0r;
	Wed, 02 Oct 2024 03:32:43 +0000
Date: Wed, 2 Oct 2024 11:32:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-sound:for-6.13 11/21]
 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb:
 audio-codec@1c: realtek,jack-detect-source: 7 is not one of [0, 1, 2, 3, 4,
 5, 6]
Message-ID: <202410021128.iTJki1Z2-lkp@intel.com>
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
TO: Neil Armstrong <neil.armstrong@linaro.org>
CC: Mark Brown <broonie@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-6.13
head:   436bf27903ee56a242bcd373053dd8d1b5d17915
commit: eba5a0bac211075b9673139df42bab955e984fce [11/21] ASoC: dt-bindings: realtek,rt5640: Convert to dtschema
:::::: branch date: 14 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20241001 (https://download.01.org/0day-ci/archive/20241002/202410021128.iTJki1Z2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev4+g577c1ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021128.iTJki1Z2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410021128.iTJki1Z2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: gpio@2200000: 'gpio-ranges' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/nvidia,tegra186-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ahub@2900800: admaif@290f000: 'interconnect-names', 'interconnects', 'iommus' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra210-ahub.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: admaif@290f000: 'interconnect-names', 'interconnects', 'iommus' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra210-admaif.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: /bus@0/serial@31d0000: failed to match any schema with compatible: ['arm,sbsa-uart']
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: audio-codec@1c: realtek,jack-detect-source: 7 is not one of [0, 1, 2, 3, 4, 5, 6]
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: audio-codec@1c: Unevaluated properties are not allowed ('clock-names', 'clocks', 'port', 'realtek,jack-detect-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: hda@3510000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra234-hda'] is too short
   	'nvidia,tegra30-hda' was expected
   	'nvidia,tegra132-hda' was expected
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: hda@3510000: clock-names:1: 'hda2hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: hda@3510000: reset-names:1: 'hda2hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
--
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: gpio@2200000: 'gpio-ranges' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/nvidia,tegra186-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ahub@2900800: admaif@290f000: 'interconnect-names', 'interconnects', 'iommus' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra210-ahub.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: admaif@290f000: 'interconnect-names', 'interconnects', 'iommus' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra210-admaif.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: audio-codec@1c: realtek,jack-detect-source: 7 is not one of [0, 1, 2, 3, 4, 5, 6]
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: audio-codec@1c: Unevaluated properties are not allowed ('clock-names', 'clocks', 'port', 'realtek,jack-detect-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: /bus@0/serial@31d0000: failed to match any schema with compatible: ['arm,sbsa-uart']
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: hda@3510000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra234-hda'] is too short
   	'nvidia,tegra30-hda' was expected
   	'nvidia,tegra132-hda' was expected
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: hda@3510000: clock-names:1: 'hda2hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: hda@3510000: reset-names:1: 'hda2hdmi' was expected
--
>> arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: codec@1c: Unevaluated properties are not allowed ('clock-names', 'clocks', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
>> arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: codec@1c: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: /mbox@ff6b0000: failed to match any schema with compatible: ['rockchip,rk3368-mailbox']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
>> arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: rt5640@1c: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: rt5640@1c: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: syscon@ff770000: usb2phy@e450: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: syscon@ff770000: usb2phy@e450: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: usb2phy@e450: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
