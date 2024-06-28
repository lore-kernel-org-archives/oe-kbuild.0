Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC7C14F98
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Jun 2024 01:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719538980; cv=none; b=Z1qIBztI5DQlkG2Gmk9uyr3ZCHd91bTkcN1qHBmufzXZD2dKldPWSikeVqQ7pzFq4oNAp8WMQYof1T2wXDu7o3vQn8PJ9hE564HEvAxJE/u4Un5Q0yJGb/JFObXwsKUyx9068de+lnK92B6UJAo8YTrh+X3ONTCw8YPWT5OekNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719538980; c=relaxed/simple;
	bh=cRxsBDnPwuoH8V5HiRsxH24J1wxYBjItkcxsR1wyTXI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QDs16GGgcTeqR41nhzXSMLLP8XG6o205KhCpGz9shI25ycGu3WBk+gGb4lLLJNs8HZ1gisV++wfDByR+FIFaP1WV2MeSKY/TQDUUvBShHTPMThtLCW+wEcvkq4JOatydhD8YEhrL3VIZTPn/y5e1pqvVDp9y//ka+yBOnRBF308=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NG94i6eW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NG94i6eW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719538978; x=1751074978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cRxsBDnPwuoH8V5HiRsxH24J1wxYBjItkcxsR1wyTXI=;
  b=NG94i6eWt54ggCKvKuyQg2I5xxUmQO8XvsbdmggF0ZGNf2MK/CKqo5TX
   BiMclALJth9uyS/UqOc+5uolMpQ1XcDQrzc5FZ/QGaC/LQXNcdu5IFHSy
   Pe7X+aAFqZPtFw6yobHzBcjQS/iwxswfoExOojPl2KobsQOEmplxYbkdQ
   2Vg4Gnri7RsGi4wVRfarAgfe5TTY0vMVbb63vYDUzfJvJtC9dlF0dV4O5
   1SzdWdoID5QfU2Nt9TQfitVtG5BHipAeUr0yArhTZQCHQYV7Bovp0Me70
   hFnwoEsEUqKVK+MK8qmySMPFuFLDh77LG42bv/G5o+vY/lWf/dR5RzEEb
   w==;
X-CSE-ConnectionGUID: hcysMRgIR42QYk4U7MopnQ==
X-CSE-MsgGUID: uxKk1qQCSWKx/w1qud3L7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="27327693"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="27327693"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 18:42:57 -0700
X-CSE-ConnectionGUID: EqDmZptSSQi79OLL3U1e4w==
X-CSE-MsgGUID: keGMgdEZQpOacVnmrsvcjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="44674268"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jun 2024 18:42:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sN0da-000GhG-09;
	Fri, 28 Jun 2024 01:42:54 +0000
Date: Fri, 28 Jun 2024 09:42:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 26/28]
 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb:
 /soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any schema
 with compatible: ['amlogic,g12a-audio-clkc']
Message-ID: <202406280928.yhYPjpBM-lkp@intel.com>
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
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   f2a524d9ef5b2cf9b06c4a59374bb5efbf697ba0
commit: afbd730d0f3ec9ec01dad32b3aed5e00ffe5b22b [26/28] kbuild: verify dtoverlay files against schema
:::::: branch date: 34 hours ago
:::::: commit date: 35 hours ago
config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/archive/20240628/202406280928.yhYPjpBM-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev2+g3b69bad
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280928.yhYPjpBM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406280928.yhYPjpBM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: /soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any schema with compatible: ['amlogic,g12a-audio-clkc']
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: /soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any schema with compatible: ['amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: /soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any schema with compatible: ['amlogic,g12a-audio-clkc']
   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: /soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any schema with compatible: ['amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: /soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any schema with compatible: ['amlogic,g12a-audio-clkc']
   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: /soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any schema with compatible: ['amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-ts050.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: /soc/bus@ff600000/bus@60000/clock-controller@0: failed to match any schema with compatible: ['amlogic,sm1-audio-clkc']
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: audio-controller@300: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: audio-controller@340: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: audio-controller@380: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: audio-controller@3c0: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: /soc/bus@ff600000/bus@60000/audio-controller@744: failed to match any schema with compatible: ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: /soc/bus@ff600000/bus@60000/audio-controller@744: failed to match any schema with compatible: ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: audio-controller-0: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: audio-controller-0: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: audio-controller-0: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: audio-controller-0: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: audio-controller-1: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: audio-controller-1: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: audio-controller-1: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: audio-controller-2: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: audio-controller-2: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: audio-controller-2: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l-ts050.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb: panel-lvds: port:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb: panel-lvds: Unevaluated properties are not allowed ('backlight', 'port', 'power-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtb: panel-lvds: port:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtb: panel-lvds: Unevaluated properties are not allowed ('backlight', 'port', 'power-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: sel-usb-hub-hog: {'output-low': True, 'gpio-hog': True, 'gpios': [[1, 0]], 'output-high': True, 'phandle': [[108]], '$nodename': ['sel-usb-hub-hog']} is valid under each of {'required': ['output-low']}, {'required': ['output-high']}
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: rst-usb-hub-hog: {'output-low': True, 'gpio-hog': True, 'gpios': [[13, 0]], 'output-high': True, 'line-name': ['RST_USB_HUB#'], 'phandle': [[152]], '$nodename': ['rst-usb-hub-hog']} is valid under each of {'required': ['output-low']}, {'required': ['output-high']}
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[126, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[126, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: dsi@30a00000: ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/nwl-dsi.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: dsi@30a00000: Unevaluated properties are not allowed ('ports', 'samsung,burst-clock-frequency', 'samsung,esc-clock-frequency' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/nwl-dsi.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: panel-lvds: port:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: panel-lvds: Unevaluated properties are not allowed ('backlight', 'port', 'power-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: /extcon-usbotg0: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtb: sensor@10: 'VANA-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtb: sensor@10: 'VDDL-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['gw,imx8mm-gw72xx-0x'] is too short
>> 	arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   		['gw,imx8mm-gw72xx-0x'] is too short
   		'gw,imx8mm-gw72xx-0x' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
   		'gw,imx8mm-gw72xx-0x' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
   	'gw,imx8mm-gw72xx-0x' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
   	'gw,imx8mm-gw72xx-0x' is not one of ['creative,x-fi3', 'fsl,imx23-evk', 'fsl,stmp378x-devb', 'olimex,imx23-olinuxino', 'sandisk,sansa_fuze_plus']
   	'gw,imx8mm-gw72xx-0x' is not one of ['fsl,imx25-pdk', 'karo,imx25-tx25']
   	'gw,imx8mm-gw72xx-0x' is not one of ['eukrea,mbimxsd25-baseboard']
   	'gw,imx8mm-gw72xx-0x' is not one of ['eukrea,mbimxsd25-baseboard-cmo-qvga', 'eukrea,mbimxsd25-baseboard-dvi-svga', 'eukrea,mbimxsd25-baseboard-dvi-vga']
   	'gw,imx8mm-gw72xx-0x' is not one of ['armadeus,imx27-apf27', 'fsl,imx27-pdk']
   	'armadeus,imx27-apf27dev' was expected
--
   	'gw,imx8mm-gw72xx-0x' is not one of ['fsl,ls2088a-qds', 'fsl,ls2088a-rdb']
   	'gw,imx8mm-gw72xx-0x' is not one of ['fsl,lx2160a-bluebox3', 'fsl,lx2160a-bluebox3-rev-a', 'fsl,lx2160a-qds', 'fsl,lx2160a-rdb', 'fsl,lx2162a-qds']
   	'gw,imx8mm-gw72xx-0x' is not one of ['solidrun,clearfog-cx', 'solidrun,honeycomb']
   	'gw,imx8mm-gw72xx-0x' is not one of ['solidrun,lx2162a-clearfog']
   	'gw,imx8mm-gw72xx-0x' is not one of ['tq,lx2160a-tqmlx2160a-mblx2160a']
   	'gw,imx8mm-gw72xx-0x' is not one of ['nxp,s32g274a-evb', 'nxp,s32g274a-rdb2']
   	'gw,imx8mm-gw72xx-0x' is not one of ['nxp,s32g399a-rdb3']
   	'gw,imx8mm-gw72xx-0x' is not one of ['fsl,s32v234-evb']
   	'gw,imx8mm-gw72xx-0x' is not one of ['traverse,ten64']
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtb: gpio@30230000: 'rs485_en' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/fsl-imx-gpio.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtb: rs485_en: $nodename:0: 'rs485_en' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['gw,imx8mm-gw72xx-0x'] is too short
>> 	arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   		['gw,imx8mm-gw72xx-0x'] is too short
   		'gw,imx8mm-gw72xx-0x' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
   		'gw,imx8mm-gw72xx-0x' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
   	'gw,imx8mm-gw72xx-0x' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
   	'gw,imx8mm-gw72xx-0x' is not one of ['creative,x-fi3', 'fsl,imx23-evk', 'fsl,stmp378x-devb', 'olimex,imx23-olinuxino', 'sandisk,sansa_fuze_plus']
   	'gw,imx8mm-gw72xx-0x' is not one of ['fsl,imx25-pdk', 'karo,imx25-tx25']
   	'gw,imx8mm-gw72xx-0x' is not one of ['eukrea,mbimxsd25-baseboard']
   	'gw,imx8mm-gw72xx-0x' is not one of ['eukrea,mbimxsd25-baseboard-cmo-qvga', 'eukrea,mbimxsd25-baseboard-dvi-svga', 'eukrea,mbimxsd25-baseboard-dvi-vga']
   	'gw,imx8mm-gw72xx-0x' is not one of ['armadeus,imx27-apf27', 'fsl,imx27-pdk']
   	'armadeus,imx27-apf27dev' was expected
--
   	'gw,imx8mm-gw72xx-0x' is not one of ['fsl,ls2088a-qds', 'fsl,ls2088a-rdb']
   	'gw,imx8mm-gw72xx-0x' is not one of ['fsl,lx2160a-bluebox3', 'fsl,lx2160a-bluebox3-rev-a', 'fsl,lx2160a-qds', 'fsl,lx2160a-rdb', 'fsl,lx2162a-qds']
   	'gw,imx8mm-gw72xx-0x' is not one of ['solidrun,clearfog-cx', 'solidrun,honeycomb']
   	'gw,imx8mm-gw72xx-0x' is not one of ['solidrun,lx2162a-clearfog']
   	'gw,imx8mm-gw72xx-0x' is not one of ['tq,lx2160a-tqmlx2160a-mblx2160a']
   	'gw,imx8mm-gw72xx-0x' is not one of ['nxp,s32g274a-evb', 'nxp,s32g274a-rdb2']
   	'gw,imx8mm-gw72xx-0x' is not one of ['nxp,s32g399a-rdb3']
   	'gw,imx8mm-gw72xx-0x' is not one of ['fsl,s32v234-evb']
   	'gw,imx8mm-gw72xx-0x' is not one of ['traverse,ten64']
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb: gpio@30230000: 'rs485_en', 'rs485_hd' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/fsl-imx-gpio.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb: rs485_hd: $nodename:0: 'rs485_hd' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb: rs485_en: $nodename:0: 'rs485_en' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['gw,imx8mm-gw72xx-0x'] is too short
>> 	arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   		['gw,imx8mm-gw72xx-0x'] is too short
   		'gw,imx8mm-gw72xx-0x' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
   		'gw,imx8mm-gw72xx-0x' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
   	'gw,imx8mm-gw72xx-0x' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
   	'gw,imx8mm-gw72xx-0x' is not one of ['creative,x-fi3', 'fsl,imx23-evk', 'fsl,stmp378x-devb', 'olimex,imx23-olinuxino', 'sandisk,sansa_fuze_plus']
   	'gw,imx8mm-gw72xx-0x' is not one of ['fsl,imx25-pdk', 'karo,imx25-tx25']
   	'gw,imx8mm-gw72xx-0x' is not one of ['eukrea,mbimxsd25-baseboard']
   	'gw,imx8mm-gw72xx-0x' is not one of ['eukrea,mbimxsd25-baseboard-cmo-qvga', 'eukrea,mbimxsd25-baseboard-dvi-svga', 'eukrea,mbimxsd25-baseboard-dvi-vga']
   	'gw,imx8mm-gw72xx-0x' is not one of ['armadeus,imx27-apf27', 'fsl,imx27-pdk']
   	'armadeus,imx27-apf27dev' was expected
--
   	'gw,imx8mm-gw72xx-0x' is not one of ['fsl,ls2088a-qds', 'fsl,ls2088a-rdb']
   	'gw,imx8mm-gw72xx-0x' is not one of ['fsl,lx2160a-bluebox3', 'fsl,lx2160a-bluebox3-rev-a', 'fsl,lx2160a-qds', 'fsl,lx2160a-rdb', 'fsl,lx2162a-qds']
   	'gw,imx8mm-gw72xx-0x' is not one of ['solidrun,clearfog-cx', 'solidrun,honeycomb']
   	'gw,imx8mm-gw72xx-0x' is not one of ['solidrun,lx2162a-clearfog']
   	'gw,imx8mm-gw72xx-0x' is not one of ['tq,lx2160a-tqmlx2160a-mblx2160a']
   	'gw,imx8mm-gw72xx-0x' is not one of ['nxp,s32g274a-evb', 'nxp,s32g274a-rdb2']
   	'gw,imx8mm-gw72xx-0x' is not one of ['nxp,s32g399a-rdb3']
   	'gw,imx8mm-gw72xx-0x' is not one of ['fsl,s32v234-evb']
   	'gw,imx8mm-gw72xx-0x' is not one of ['traverse,ten64']
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb: gpio@30230000: 'rs485_en', 'rs485_hd' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/fsl-imx-gpio.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb: rs485_hd: $nodename:0: 'rs485_hd' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb: rs485_en: $nodename:0: 'rs485_en' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-imx219.dtb: sensor@10: 'VANA-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-imx219.dtb: sensor@10: 'VDDL-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['gw,imx8mm-gw73xx-0x'] is too short
>> 	arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   		['gw,imx8mm-gw73xx-0x'] is too short
   		'gw,imx8mm-gw73xx-0x' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
   		'gw,imx8mm-gw73xx-0x' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
   	'gw,imx8mm-gw73xx-0x' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
   	'gw,imx8mm-gw73xx-0x' is not one of ['creative,x-fi3', 'fsl,imx23-evk', 'fsl,stmp378x-devb', 'olimex,imx23-olinuxino', 'sandisk,sansa_fuze_plus']
   	'gw,imx8mm-gw73xx-0x' is not one of ['fsl,imx25-pdk', 'karo,imx25-tx25']
   	'gw,imx8mm-gw73xx-0x' is not one of ['eukrea,mbimxsd25-baseboard']
   	'gw,imx8mm-gw73xx-0x' is not one of ['eukrea,mbimxsd25-baseboard-cmo-qvga', 'eukrea,mbimxsd25-baseboard-dvi-svga', 'eukrea,mbimxsd25-baseboard-dvi-vga']
   	'gw,imx8mm-gw73xx-0x' is not one of ['armadeus,imx27-apf27', 'fsl,imx27-pdk']
   	'armadeus,imx27-apf27dev' was expected
--
   	'gw,imx8mm-gw73xx-0x' is not one of ['fsl,ls2088a-qds', 'fsl,ls2088a-rdb']
   	'gw,imx8mm-gw73xx-0x' is not one of ['fsl,lx2160a-bluebox3', 'fsl,lx2160a-bluebox3-rev-a', 'fsl,lx2160a-qds', 'fsl,lx2160a-rdb', 'fsl,lx2162a-qds']
   	'gw,imx8mm-gw73xx-0x' is not one of ['solidrun,clearfog-cx', 'solidrun,honeycomb']
   	'gw,imx8mm-gw73xx-0x' is not one of ['solidrun,lx2162a-clearfog']
   	'gw,imx8mm-gw73xx-0x' is not one of ['tq,lx2160a-tqmlx2160a-mblx2160a']
   	'gw,imx8mm-gw73xx-0x' is not one of ['nxp,s32g274a-evb', 'nxp,s32g274a-rdb2']
   	'gw,imx8mm-gw73xx-0x' is not one of ['nxp,s32g399a-rdb3']
   	'gw,imx8mm-gw73xx-0x' is not one of ['fsl,s32v234-evb']
   	'gw,imx8mm-gw73xx-0x' is not one of ['traverse,ten64']
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtb: gpio@30230000: 'rs485_en' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/fsl-imx-gpio.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtb: rs485_en: $nodename:0: 'rs485_en' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs422.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['gw,imx8mm-gw73xx-0x'] is too short
>> 	arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs422.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   		['gw,imx8mm-gw73xx-0x'] is too short
   		'gw,imx8mm-gw73xx-0x' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
   		'gw,imx8mm-gw73xx-0x' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
   	'gw,imx8mm-gw73xx-0x' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
   	'gw,imx8mm-gw73xx-0x' is not one of ['creative,x-fi3', 'fsl,imx23-evk', 'fsl,stmp378x-devb', 'olimex,imx23-olinuxino', 'sandisk,sansa_fuze_plus']
   	'gw,imx8mm-gw73xx-0x' is not one of ['fsl,imx25-pdk', 'karo,imx25-tx25']
   	'gw,imx8mm-gw73xx-0x' is not one of ['eukrea,mbimxsd25-baseboard']
   	'gw,imx8mm-gw73xx-0x' is not one of ['eukrea,mbimxsd25-baseboard-cmo-qvga', 'eukrea,mbimxsd25-baseboard-dvi-svga', 'eukrea,mbimxsd25-baseboard-dvi-vga']
   	'gw,imx8mm-gw73xx-0x' is not one of ['armadeus,imx27-apf27', 'fsl,imx27-pdk']
   	'armadeus,imx27-apf27dev' was expected
--
   	'gw,imx8mm-gw73xx-0x' is not one of ['fsl,ls2088a-qds', 'fsl,ls2088a-rdb']
   	'gw,imx8mm-gw73xx-0x' is not one of ['fsl,lx2160a-bluebox3', 'fsl,lx2160a-bluebox3-rev-a', 'fsl,lx2160a-qds', 'fsl,lx2160a-rdb', 'fsl,lx2162a-qds']
   	'gw,imx8mm-gw73xx-0x' is not one of ['solidrun,clearfog-cx', 'solidrun,honeycomb']
   	'gw,imx8mm-gw73xx-0x' is not one of ['solidrun,lx2162a-clearfog']
   	'gw,imx8mm-gw73xx-0x' is not one of ['tq,lx2160a-tqmlx2160a-mblx2160a']
   	'gw,imx8mm-gw73xx-0x' is not one of ['nxp,s32g274a-evb', 'nxp,s32g274a-rdb2']
   	'gw,imx8mm-gw73xx-0x' is not one of ['nxp,s32g399a-rdb3']
   	'gw,imx8mm-gw73xx-0x' is not one of ['fsl,s32v234-evb']
   	'gw,imx8mm-gw73xx-0x' is not one of ['traverse,ten64']
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs422.dtb: gpio@30230000: 'rs485_en', 'rs485_hd' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/fsl-imx-gpio.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs422.dtb: rs485_hd: $nodename:0: 'rs485_hd' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs422.dtb: rs485_en: $nodename:0: 'rs485_en' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['gw,imx8mm-gw73xx-0x'] is too short
>> 	arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   		['gw,imx8mm-gw73xx-0x'] is too short
   		'gw,imx8mm-gw73xx-0x' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
   		'gw,imx8mm-gw73xx-0x' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
   	'gw,imx8mm-gw73xx-0x' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
   	'gw,imx8mm-gw73xx-0x' is not one of ['creative,x-fi3', 'fsl,imx23-evk', 'fsl,stmp378x-devb', 'olimex,imx23-olinuxino', 'sandisk,sansa_fuze_plus']
   	'gw,imx8mm-gw73xx-0x' is not one of ['fsl,imx25-pdk', 'karo,imx25-tx25']
   	'gw,imx8mm-gw73xx-0x' is not one of ['eukrea,mbimxsd25-baseboard']
   	'gw,imx8mm-gw73xx-0x' is not one of ['eukrea,mbimxsd25-baseboard-cmo-qvga', 'eukrea,mbimxsd25-baseboard-dvi-svga', 'eukrea,mbimxsd25-baseboard-dvi-vga']
   	'gw,imx8mm-gw73xx-0x' is not one of ['armadeus,imx27-apf27', 'fsl,imx27-pdk']
   	'armadeus,imx27-apf27dev' was expected
--
   	'gw,imx8mm-gw73xx-0x' is not one of ['fsl,ls2088a-qds', 'fsl,ls2088a-rdb']
   	'gw,imx8mm-gw73xx-0x' is not one of ['fsl,lx2160a-bluebox3', 'fsl,lx2160a-bluebox3-rev-a', 'fsl,lx2160a-qds', 'fsl,lx2160a-rdb', 'fsl,lx2162a-qds']
   	'gw,imx8mm-gw73xx-0x' is not one of ['solidrun,clearfog-cx', 'solidrun,honeycomb']
   	'gw,imx8mm-gw73xx-0x' is not one of ['solidrun,lx2162a-clearfog']
   	'gw,imx8mm-gw73xx-0x' is not one of ['tq,lx2160a-tqmlx2160a-mblx2160a']
   	'gw,imx8mm-gw73xx-0x' is not one of ['nxp,s32g274a-evb', 'nxp,s32g274a-rdb2']
   	'gw,imx8mm-gw73xx-0x' is not one of ['nxp,s32g399a-rdb3']
   	'gw,imx8mm-gw73xx-0x' is not one of ['fsl,s32v234-evb']
   	'gw,imx8mm-gw73xx-0x' is not one of ['traverse,ten64']
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb: gpio@30230000: 'rs485_en', 'rs485_hd' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/fsl-imx-gpio.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb: rs485_hd: $nodename:0: 'rs485_hd' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb: rs485_en: $nodename:0: 'rs485_en' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
--
   	'fsl,ls2080a' was expected
   	'fsl,ls2088a' was expected
   	'fsl,lx2160a' was expected
   	'solidrun,lx2160a-cex7' was expected
   	'solidrun,lx2162a-som' was expected
   	'tq,lx2160a-tqmlx2160a' was expected
   	'nxp,s32g2' was expected
   	'nxp,s32g3' was expected
   	'fsl,s32v234' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: /: failed to match any schema with compatible: ['gw,imx8mp-gw74xx', 'fsl,imx8mp']
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: sensor@10: 'VANA-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: sensor@10: 'VDDL-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[112, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[112, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
>> arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb: /soc@0/audio-codec@771c000: failed to match any schema with compatible: ['qcom,msm8916-wcd-digital-codec']
>> arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb: bridge@39: #sound-dai-cells:0:0: 0 was expected
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml#
>> arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-acc']
>> arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-acc']
>> arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
>> arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
>> arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb: /usb-id: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
--
>> arch/arm64/boot/dts/ti/k3-am654-gp-evm.dtb: display0: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
>> arch/arm64/boot/dts/ti/k3-am654-gp-evm.dtb: scm-conf@40f00000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am654-gp-evm.dtb: scm-conf@100000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am654-evm.dtb: scm-conf@40f00000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am654-evm.dtb: scm-conf@100000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
--
>> arch/arm64/boot/dts/ti/k3-j7200-evm.dtb: syscon@40f00000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
--
>> arch/arm64/boot/dts/ti/k3-j721e-evm.dtb: syscon@40f00000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-j721e-evm.dtb: serdes@5000000: phy@1:cdns,phy-type:0:0: 9 is not one of [2, 4]
   	from schema $id: http://devicetree.org/schemas/phy/phy-cadence-sierra.yaml#
--
>> arch/arm64/boot/dts/ti/k3-j721s2-evm.dtb: syscon@40f00000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-j721s2-evm.dtb: gpio@20: 'p15' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
>> arch/arm64/boot/dts/ti/k3-j721s2-evm.dtb: p15: $nodename:0: 'p15' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am654-idk.dtb: icssg1-eth: dmas: [[39, 49664], [39, 49665], [39, 49666], [39, 49667], [39, 49668], [39, 49669], [39, 49670], [39, 49671], [39, 16896], [39, 16897], [39, 16898], [39, 16899]] is too long
   	from schema $id: http://devicetree.org/schemas/net/ti,icssg-prueth.yaml#
>> arch/arm64/boot/dts/ti/k3-am654-idk.dtb: icssg0-eth: dmas: [[39, 49408], [39, 49409], [39, 49410], [39, 49411], [39, 49412], [39, 49413], [39, 49414], [39, 49415], [39, 16640], [39, 16641], [39, 16642], [39, 16643]] is too long
   	from schema $id: http://devicetree.org/schemas/net/ti,icssg-prueth.yaml#
>> arch/arm64/boot/dts/ti/k3-am654-idk.dtb: scm-conf@40f00000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am654-idk.dtb: scm-conf@100000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revA.dtb: zynqmp-firmware: 'nvmem-firmware' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revA.dtb: nvmem-firmware: Unevaluated properties are not allowed ('soc-revision@0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/xlnx,zynqmp-nvmem.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revA.dtb: fpga-full: $nodename:0: 'fpga-full' does not match '^fpga-region(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/fpga-region.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revA.dtb: remoteproc: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/xlnx,zynqmp-r5fss.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revA.dtb: remoteproc: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/xlnx,zynqmp-r5fss.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revA.dtb: remoteproc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/xlnx,zynqmp-r5fss.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revA.dtb: remoteproc: 'xlnx,tcm-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/xlnx,zynqmp-r5fss.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revA.dtb: remoteproc: 'r5f-0', 'r5f-1' do not match any of the regexes: '^r(.*)@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/remoteproc/xlnx,zynqmp-r5fss.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revB.dtb: zynqmp-firmware: 'nvmem-firmware' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revB.dtb: nvmem-firmware: Unevaluated properties are not allowed ('soc-revision@0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/xlnx,zynqmp-nvmem.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revB.dtb: fpga-full: $nodename:0: 'fpga-full' does not match '^fpga-region(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/fpga-region.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revB.dtb: remoteproc: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/xlnx,zynqmp-r5fss.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revB.dtb: remoteproc: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/xlnx,zynqmp-r5fss.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revB.dtb: remoteproc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/xlnx,zynqmp-r5fss.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revB.dtb: remoteproc: 'xlnx,tcm-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/xlnx,zynqmp-r5fss.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revB.dtb: remoteproc: 'r5f-0', 'r5f-1' do not match any of the regexes: '^r(.*)@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/remoteproc/xlnx,zynqmp-r5fss.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revA.dtb: zynqmp-firmware: 'nvmem-firmware' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revA.dtb: nvmem-firmware: Unevaluated properties are not allowed ('soc-revision@0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/xlnx,zynqmp-nvmem.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revA.dtb: fpga-full: $nodename:0: 'fpga-full' does not match '^fpga-region(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/fpga-region.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revA.dtb: remoteproc: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/xlnx,zynqmp-r5fss.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revA.dtb: remoteproc: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/xlnx,zynqmp-r5fss.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revA.dtb: remoteproc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/xlnx,zynqmp-r5fss.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revA.dtb: remoteproc: 'xlnx,tcm-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/xlnx,zynqmp-r5fss.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revA.dtb: remoteproc: 'r5f-0', 'r5f-1' do not match any of the regexes: '^r(.*)@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/remoteproc/xlnx,zynqmp-r5fss.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB.dtb: zynqmp-firmware: 'nvmem-firmware' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB.dtb: nvmem-firmware: Unevaluated properties are not allowed ('soc-revision@0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/xlnx,zynqmp-nvmem.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB.dtb: fpga-full: $nodename:0: 'fpga-full' does not match '^fpga-region(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/fpga-region.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB.dtb: remoteproc: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/xlnx,zynqmp-r5fss.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB.dtb: remoteproc: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/xlnx,zynqmp-r5fss.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB.dtb: remoteproc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/xlnx,zynqmp-r5fss.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB.dtb: remoteproc: 'xlnx,tcm-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/xlnx,zynqmp-r5fss.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB.dtb: remoteproc: 'r5f-0', 'r5f-1' do not match any of the regexes: '^r(.*)@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/remoteproc/xlnx,zynqmp-r5fss.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
