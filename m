Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2633F811F1
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Jun 2024 22:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719612735; cv=none; b=mloQCYmpX3IqGmY2pawoDQulwztiQ4tIbZzqOIK6IVIPhActuULYJ1Ck2O3VaXJCafnSbuIbT+3hD4nRATFl4rjhEZtbbNdaqLlqgVLzunFcpSXP5DDTOf9MWOii/8OSpFjXOju4rhr8VS8vO+7D1rjnb+uh87z1DiDqbxonwfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719612735; c=relaxed/simple;
	bh=nMYLJr6pNYZPfQqwflQVcKtvARoMOaFv1GS3e1aaR3E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=doZ1PcqqnM80a059BPyPx1agvvDXRYZqkYDteu9OtVX3wOLVIwxPCcoDckD4h1FDYP8jhDFdE6txOgU1Z35m8wk9p6MzGLusapLSi/qmyupK1cvsF8OjU1LIDWGEc1Wdb92BCHu9H5LevW9UtECaHF8ohfLnL0gPvSan84G8Ass=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JMKvEOQ0; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JMKvEOQ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719612733; x=1751148733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nMYLJr6pNYZPfQqwflQVcKtvARoMOaFv1GS3e1aaR3E=;
  b=JMKvEOQ0vPyBz5Q6AegudUJAxDvAaW6ZzSXREGKvLKPJzZZErSDvA8cr
   ZkqG61L47efd1bmG8pP82ktmfHJUDIWoiDmIy9fOZLbL8ll/7Tn/Mpcuq
   ++RvPXZ3GasBP6+rjAtihD/WjrKeFfUhpYfjUqnQkwAvckdZ4X6YtbJvz
   cg6cjfEyJPeMtgpmEk+lo3Uaa6soz6GCwygtmkl63enF8qZ0dUFikt1Fp
   OjinpMbiRG9pfniZbzPgGr2XYZQgkrqAPtuQYOm2l9aVcWjVPrwLrpbBE
   EFxLy+WcUh7EV00tjKQ4zlvoreOHMdCWJQMsq2iRQvS/OZN7s5RjMNEsF
   g==;
X-CSE-ConnectionGUID: aKfE32L7RAmpcfY1vuj4hg==
X-CSE-MsgGUID: dtTDTUMZQ9qT6sd6DJVRmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="20629924"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="20629924"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 15:08:42 -0700
X-CSE-ConnectionGUID: 4q8CHfUiR5Oy1TUZPBLdkw==
X-CSE-MsgGUID: 1ZoAWk3iQc+NH02hs1VLmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="44906718"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Jun 2024 15:08:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNJlm-000IXM-1p;
	Fri, 28 Jun 2024 22:08:38 +0000
Date: Sat, 29 Jun 2024 06:08:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 8324/9027]
 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb:
 /soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any schema
 with compatible: ['amlogic,g12a-tohdmitx']
Message-ID: <202406290626.4ZLQwbao-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only scripts/Makefile.* file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   642a16ca7994a50d7de85715996a8ce171a5bdfb
commit: afbd730d0f3ec9ec01dad32b3aed5e00ffe5b22b [8324/9027] kbuild: verify dtoverlay files against schema
:::::: branch date: 28 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20240629 (https://download.01.org/0day-ci/archive/20240629/202406290626.4ZLQwbao-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240629/202406290626.4ZLQwbao-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406290626.4ZLQwbao-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: /soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any schema with compatible: ['amlogic,g12a-audio-clkc']
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: /soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any schema with compatible: ['amlogic,g12a-tohdmitx']
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: /soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any schema with compatible: ['amlogic,g12a-audio-clkc']
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: /soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any schema with compatible: ['amlogic,g12a-tohdmitx']
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: /soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any schema with compatible: ['amlogic,g12a-audio-clkc']
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: /soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any schema with compatible: ['amlogic,g12a-tohdmitx']
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: /soc/bus@ff600000/bus@60000/clock-controller@0: failed to match any schema with compatible: ['amlogic,sm1-audio-clkc']
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: audio-controller@300: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: audio-controller@340: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: audio-controller@380: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: audio-controller@3c0: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: /soc/bus@ff600000/bus@60000/audio-controller@744: failed to match any schema with compatible: ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: /soc/bus@ff600000/bus@60000/audio-controller@744: failed to match any schema with compatible: ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: audio-controller-0: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: audio-controller-0: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: audio-controller-0: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: audio-controller-0: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-x-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-x-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-x-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-x-panel-aa104xd12.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-x-panel-aa104xd12.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-xs-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-xs-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-xs-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-xs-panel-aa104xd12.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-xs-panel-aa104xd12.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs-panel-aa104xd12.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs-panel-aa104xd12.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x-panel-aa104xd12.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x-panel-aa104xd12.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs-panel-aa104xd12.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs-panel-aa104xd12.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: /soc/i2c@e6500000/codec@1a: failed to match any schema with compatible: ['dlg,da7212']
--
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs-panel-aa104xd12.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs-panel-aa104xd12.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
--
>> arch/arm64/boot/dts/renesas/r9a07g054l2-smarc-cru-csi-ov5645.dtb: flash@0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['micron,mt25qu512a', 'jedec,spi-nor'] is too long
   	'micron,mt25qu512a' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'micron,mt25qu512a' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g054l2-smarc-cru-csi-ov5645.dtb: flash@0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g054l2-smarc-cru-csi-ov5645.dtb: /soc/spi@10060000/flash@0: failed to match any schema with compatible: ['micron,mt25qu512a', 'jedec,spi-nor']
   arch/arm64/boot/dts/renesas/r9a07g054l2-smarc-cru-csi-ov5645.dtb: mmc@11c00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,sdhi-r9a07g054', 'renesas,rcar-gen3-sdhi'] is too long
   	'renesas,sdhi-r9a07g054' is not one of ['renesas,sdhi-mmc-r8a77470', 'renesas,sdhi-r7s72100', 'renesas,sdhi-r7s9210', 'renesas,sdhi-r8a73a4', 'renesas,sdhi-r8a7740', 'renesas,sdhi-sh73a0']
   	'renesas,sdhi-r9a07g054' is not one of ['renesas,sdhi-r8a7778', 'renesas,sdhi-r8a7779']
   	'renesas,sdhi-r9a07g054' is not one of ['renesas,sdhi-r8a7742', 'renesas,sdhi-r8a7743', 'renesas,sdhi-r8a7744', 'renesas,sdhi-r8a7745', 'renesas,sdhi-r8a77470', 'renesas,sdhi-r8a7790', 'renesas,sdhi-r8a7791', 'renesas,sdhi-r8a7792', 'renesas,sdhi-r8a7793', 'renesas,sdhi-r8a7794']
   	'renesas,sdhi-r9a07g054' is not one of ['renesas,sdhi-r8a774a1', 'renesas,sdhi-r8a774b1', 'renesas,sdhi-r8a774c0', 'renesas,sdhi-r8a774e1', 'renesas,sdhi-r8a7795', 'renesas,sdhi-r8a7796', 'renesas,sdhi-r8a77961', 'renesas,sdhi-r8a77965', 'renesas,sdhi-r8a77970', 'renesas,sdhi-r8a77980', 'renesas,sdhi-r8a77990', 'renesas,sdhi-r8a77995']
   	'renesas,sdhi-r9a07g054' is not one of ['renesas,sdhi-r8a779a0', 'renesas,sdhi-r8a779f0', 'renesas,sdhi-r8a779g0', 'renesas,sdhi-r8a779h0']
   	'renesas,rcar-gen1-sdhi' was expected
   	'renesas,rcar-gen2-sdhi' was expected
   	'renesas,rcar-gen4-sdhi' was expected
--
>> arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs-panel-aa104xd12.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs-panel-aa104xd12.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs-panel-aa104xd12.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs-panel-aa104xd12.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
