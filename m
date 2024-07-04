Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F011B3730
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jul 2024 16:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720112335; cv=none; b=R1Gy2MXUCbi00uGxTTlqmb6foaShMVWyW2iO9aUJsFjGbiMhLDXaHso7wqwz5KZ3QOVN5jprvMScmxi1VoVsjWVzGBl6BDAwW2UAjMVauP0Q3v9sr+ZvcSw4yTris1vODxD83Qd2zZRs/XFwQBTg30mdpf+42LcoLpvgJjs5k7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720112335; c=relaxed/simple;
	bh=U8g6+IxkJn5M92Z8EbupsfDQJjqU0m3cinUj1UEpjdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C9ir3y+UZWyg/qaLK2W7VxG3f2awR6AbLiblla8kzBs700nWhmpyyL2ZHbBUyeVKvoCvBVCY5JEIcAwzDDRhOWlE3gCqG5yf/3d0l7oRAJtoEHpFeMyUKPmaSHrr/0+vNBp7F/tL62Q2v0kZ5R7o7cBzzBJlOPlnWMlbboZ5iyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=irqDIpH1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="irqDIpH1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720112329; x=1751648329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U8g6+IxkJn5M92Z8EbupsfDQJjqU0m3cinUj1UEpjdk=;
  b=irqDIpH1b/AeMmt6bBvWaQcLBEUSmqQE8cvgIFT28jUmfcCSQSO9Y9XA
   PiWeMG1O2eeqxnoIz1nT72MfUl6aXsp+FDRnHxnOlMIdvrA30kahEFDUU
   TZrqO2gFEjcW9eiI3ZzGgkQe2GCyq1LPUQQPXBTty5QIeH5CtYWzL0BOX
   1eJI/pIEXwWqd2EdKHJbWDReboy2fP0kpCkmSo39tnwzW8+TvHVmRyAgn
   cs3zN4b8kPUiDwmAaYVPzJo0yS8jZ7IOwA+KdNpDSjP33HdFRmti9RZMp
   LFRotM0uc0uMYs8V9n4FWNAuMw/eKd5M6zeFa34EmTvtevDXJtbWuFlE2
   g==;
X-CSE-ConnectionGUID: AnRcWL9CSIW947FGAfmTvg==
X-CSE-MsgGUID: ctw96qFcSSS9CD1GlUGVHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17222622"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17222622"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 09:58:46 -0700
X-CSE-ConnectionGUID: kSvBdxHzS7W1+HWQ8CAp7g==
X-CSE-MsgGUID: KtIast1qT6ysBAWcHuLkbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51247630"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Jul 2024 09:58:44 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPPn7-000RE2-2X;
	Thu, 04 Jul 2024 16:58:41 +0000
Date: Fri, 5 Jul 2024 00:58:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:renesas-bsp/v6.1.96-2024-07-03-GrayHawk-sound 10/751]
 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: lpass@62d87000:
 Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were
 unexpected)
Message-ID: <202407050016.xccdByAB-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://github.com/morimoto/linux renesas-bsp/v6.1.96-2024-07-03-GrayHawk-sound
head:   5fb5023c4d16f52cf76046ad3bf10266186d2101
commit: ec53e6e4b248830167008e951dbf6fb25b112299 [10/751] ASoC: dt-bindings: Reference common DAI properties
:::::: branch date: 
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20240702 (https://download.01.org/0day-ci/archive/20240705/202407050016.xccdByAB-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407050016.xccdByAB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407050016.xccdByAB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: sound: dai-link@0:cpu:sound-dai: [[260], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: sound: dai-link@1:cpu:sound-dai: [[260], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: sound: dai-link@5:cpu:sound-dai: [[260], [5]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: sound: dai-link@0:cpu:sound-dai: [[260], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: sound: dai-link@1:cpu:sound-dai: [[260], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: sound: dai-link@5:cpu:sound-dai: [[260], [5]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: sound: dai-link@0:cpu:sound-dai: [[260], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: sound: dai-link@1:cpu:sound-dai: [[260], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: sound: dai-link@5:cpu:sound-dai: [[260], [5]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: sound: dai-link@0:cpu:sound-dai: [[260], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: sound: dai-link@1:cpu:sound-dai: [[260], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: sound: dai-link@5:cpu:sound-dai: [[260], [5]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: sound: dai-link@0:cpu:sound-dai: [[262], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: sound: dai-link@0:codec:sound-dai: [[263], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: sound: dai-link@1:cpu:sound-dai: [[262], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: sound: dai-link@0:cpu:sound-dai: [[263], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: sound: dai-link@0:codec:sound-dai: [[264], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: sound: dai-link@1:cpu:sound-dai: [[263], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: sound: dai-link@0:cpu:sound-dai: [[262], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: sound: dai-link@0:codec:sound-dai: [[263], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: sound: dai-link@1:cpu:sound-dai: [[262], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: soc@0: opp-table-qup: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: soc@0: opp-table-qspi: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: proximity@28: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/proximity/semtech,sx9310.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: codec@1a: Unevaluated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: codec@1a: 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: codec@1a: 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: pinctrl@3500000: qup-spi0-cs-gpio: {'phandle': [[52]], 'pinmux': {'pins': ['gpio34', 'gpio35', 'gpio36'], 'function': ['qup00']}, 'pinmux-cs': {'pins': ['gpio37'], 'function': ['gpio']}, 'pinconf': {'pins': ['gpio34', 'gpio35', 'gpio36', 'gpio37'], 'drive-strength': [[2]], 'bias-disable': True}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: pinctrl@3500000: qup-spi1-cs-gpio: {'pinmux': {'pins': ['gpio0', 'gpio1', 'gpio2'], 'function': ['qup01']}, 'pinmux-cs': {'pins': ['gpio3'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: pinctrl@3500000: qup-spi3-cs-gpio: {'pinmux': {'pins': ['gpio38', 'gpio39', 'gpio40'], 'function': ['qup03']}, 'pinmux-cs': {'pins': ['gpio41'], 'function': ['gpio']}} is not of type 'array'
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: sound: dai-link@0:cpu:sound-dai: [[262], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: sound: dai-link@0:codec:sound-dai: [[263], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: sound: dai-link@1:cpu:sound-dai: [[262], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: soc@0: opp-table-qspi: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: soc@0: opp-table-qup: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: proximity@28: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/proximity/semtech,sx9310.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: codec@1a: Unevaluated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: codec@1a: 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: codec@1a: 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: pinctrl@3500000: qup-spi0-cs-gpio: {'phandle': [[52]], 'pinmux': {'pins': ['gpio34', 'gpio35', 'gpio36'], 'function': ['qup00']}, 'pinmux-cs': {'pins': ['gpio37'], 'function': ['gpio']}, 'pinconf': {'pins': ['gpio34', 'gpio35', 'gpio36', 'gpio37'], 'drive-strength': [[2]], 'bias-disable': True}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: pinctrl@3500000: qup-spi1-cs-gpio: {'pinmux': {'pins': ['gpio0', 'gpio1', 'gpio2'], 'function': ['qup01']}, 'pinmux-cs': {'pins': ['gpio3'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: pinctrl@3500000: qup-spi3-cs-gpio: {'pinmux': {'pins': ['gpio38', 'gpio39', 'gpio40'], 'function': ['qup03']}, 'pinmux-cs': {'pins': ['gpio41'], 'function': ['gpio']}} is not of type 'array'
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: sound: dai-link@0:cpu:sound-dai: [[260], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: sound: dai-link@0:codec:sound-dai: [[261], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: sound: dai-link@1:cpu:sound-dai: [[260], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: sound: dai-link@0:cpu:sound-dai: [[261], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: sound: dai-link@0:codec:sound-dai: [[262], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: sound: dai-link@1:cpu:sound-dai: [[261], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: sound: dai-link@0:cpu:sound-dai: [[261], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: sound: dai-link@0:codec:sound-dai: [[262], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: sound: dai-link@1:cpu:sound-dai: [[261], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: sound: dai-link@0:cpu:sound-dai: [[261], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: sound: dai-link@0:codec:sound-dai: [[262], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: sound: dai-link@1:cpu:sound-dai: [[261], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: sound: dai-link@0:cpu:sound-dai: [[261], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: sound: dai-link@0:codec:sound-dai: [[262], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: sound: dai-link@1:cpu:sound-dai: [[261], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: sound: dai-link@0:cpu:sound-dai: [[261], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: sound: dai-link@0:codec:sound-dai: [[262], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: sound: dai-link@1:cpu:sound-dai: [[261], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: sound: dai-link@0:cpu:sound-dai: [[261], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: sound: dai-link@0:codec:sound-dai: [[262], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: sound: dai-link@1:cpu:sound-dai: [[261], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: sound: dai-link@0:cpu:sound-dai: [[261], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: sound: dai-link@0:codec:sound-dai: [[262], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: sound: dai-link@1:cpu:sound-dai: [[261], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: sound: dai-link@0:cpu:sound-dai: [[260], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: sound: dai-link@0:codec:sound-dai: [[261], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: sound: dai-link@1:cpu:sound-dai: [[260], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: sound: dai-link@0:cpu:sound-dai: [[260], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: sound: dai-link@0:codec:sound-dai: [[261], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: sound: dai-link@1:cpu:sound-dai: [[260], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: sound: dai-link@0:cpu:sound-dai: [[260], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: sound: dai-link@0:codec:sound-dai: [[261], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: sound: dai-link@1:cpu:sound-dai: [[260], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: sound: dai-link@0:cpu:sound-dai: [[261], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: sound: dai-link@0:codec:sound-dai: [[262], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: sound: dai-link@1:cpu:sound-dai: [[261], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: sound: dai-link@0:cpu:sound-dai: [[260], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: sound: dai-link@0:codec:sound-dai: [[261], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: sound: dai-link@1:cpu:sound-dai: [[260], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: sound: dai-link@0:cpu:sound-dai: [[259], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: sound: dai-link@0:codec:sound-dai: [[260], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: sound: dai-link@1:cpu:sound-dai: [[259], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: sound: dai-link@0:cpu:sound-dai: [[259], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: sound: dai-link@0:codec:sound-dai: [[260], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: sound: dai-link@1:cpu:sound-dai: [[259], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: sound: dai-link@0:cpu:sound-dai: [[258], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: sound: dai-link@0:codec:sound-dai: [[259], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: sound: dai-link@1:cpu:sound-dai: [[258], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: panel@0: 'ports', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: sound: dai-link@0:cpu:sound-dai: [[259], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: sound: dai-link@0:codec:sound-dai: [[260], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: sound: dai-link@1:cpu:sound-dai: [[259], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: panel@0: 'ports', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: sound: dai-link@0:cpu:sound-dai: [[259], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: sound: dai-link@0:codec:sound-dai: [[260], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: sound: dai-link@1:cpu:sound-dai: [[259], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: panel@0: 'ports', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: sound: dai-link@0:cpu:sound-dai: [[259], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: sound: dai-link@0:codec:sound-dai: [[260], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: sound: dai-link@1:cpu:sound-dai: [[259], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: panel@0: 'ports', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: sound: dai-link@0:cpu:sound-dai: [[259], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: sound: dai-link@0:codec:sound-dai: [[260], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: sound: dai-link@1:cpu:sound-dai: [[259], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: sound: dai-link@0:cpu:sound-dai: [[258], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: sound: dai-link@0:codec:sound-dai: [[259], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: sound: dai-link@1:cpu:sound-dai: [[258], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: sound: dai-link@0:cpu:sound-dai: [[259], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: sound: dai-link@0:codec:sound-dai: [[260], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: sound: dai-link@1:cpu:sound-dai: [[259], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: sound: dai-link@0:cpu:sound-dai: [[258], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: sound: dai-link@0:codec:sound-dai: [[259], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: sound: dai-link@1:cpu:sound-dai: [[258], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: sound: dai-link@0:cpu:sound-dai: [[259], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: sound: dai-link@0:codec:sound-dai: [[260], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: sound: dai-link@1:cpu:sound-dai: [[259], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: sound: dai-link@0:cpu:sound-dai: [[262], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: sound: dai-link@0:codec:sound-dai: [[263], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: sound: dai-link@0:cpu:sound-dai: [[262], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: sound: dai-link@0:codec:sound-dai: [[263], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: sound: dai-link@0:cpu:sound-dai: [[262], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: sound: dai-link@0:codec:sound-dai: [[263], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: sound: dai-link@0:cpu:sound-dai: [[262], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: sound: dai-link@0:codec:sound-dai: [[263], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: sound: dai-link@0:cpu:sound-dai: [[262], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: sound: dai-link@0:codec:sound-dai: [[263], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: sound: dai-link@0:cpu:sound-dai: [[262], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: sound: dai-link@0:codec:sound-dai: [[263], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: panel@0: 'ports', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: sound: dai-link@0:cpu:sound-dai: [[258], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: sound: dai-link@0:codec:sound-dai: [[259], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: sound: dai-link@1:cpu:sound-dai: [[258], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: panel@0: 'ports', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: sound: dai-link@0:cpu:sound-dai: [[258], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: sound: dai-link@0:codec:sound-dai: [[259], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: sound: dai-link@1:cpu:sound-dai: [[258], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: panel@0: 'ports', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: sound: dai-link@0:cpu:sound-dai: [[260], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: sound: dai-link@0:codec:sound-dai: [[261], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: sound: dai-link@1:cpu:sound-dai: [[260], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: panel@0: 'ports', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: sound: dai-link@0:cpu:sound-dai: [[260], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: sound: dai-link@0:codec:sound-dai: [[261], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: sound: dai-link@1:cpu:sound-dai: [[260], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: panel@0: 'ports', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: sound: dai-link@0:cpu:sound-dai: [[260], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: sound: dai-link@0:codec:sound-dai: [[261], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: sound: dai-link@1:cpu:sound-dai: [[260], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: panel@0: 'ports', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: sound: dai-link@0:cpu:sound-dai: [[260], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: sound: dai-link@0:codec:sound-dai: [[261], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: sound: dai-link@1:cpu:sound-dai: [[260], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: soc@0: opp-table-qspi: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: soc@0: opp-table-qup: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: proximity@28: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/proximity/semtech,sx9310.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: codec@1a: Unevaluated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: codec@1a: 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: codec@1a: 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: pinctrl@3500000: qup-spi0-cs-gpio: {'phandle': [[52]], 'pinmux': {'pins': ['gpio34', 'gpio35', 'gpio36'], 'function': ['qup00']}, 'pinmux-cs': {'pins': ['gpio37'], 'function': ['gpio']}, 'pinconf': {'pins': ['gpio34', 'gpio35', 'gpio36', 'gpio37'], 'drive-strength': [[2]], 'bias-disable': True}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: pinctrl@3500000: qup-spi1-cs-gpio: {'pinmux': {'pins': ['gpio0', 'gpio1', 'gpio2'], 'function': ['qup01']}, 'pinmux-cs': {'pins': ['gpio3'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: pinctrl@3500000: qup-spi3-cs-gpio: {'pinmux': {'pins': ['gpio38', 'gpio39', 'gpio40'], 'function': ['qup03']}, 'pinmux-cs': {'pins': ['gpio41'], 'function': ['gpio']}} is not of type 'array'
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: panel@0: 'ports', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: sound: dai-link@0:cpu:sound-dai: [[260], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: sound: dai-link@0:codec:sound-dai: [[261], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: sound: dai-link@1:cpu:sound-dai: [[260], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: soc@0: opp-table-qup: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: soc@0: opp-table-qspi: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: proximity@28: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/proximity/semtech,sx9310.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: codec@1a: Unevaluated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: codec@1a: 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: codec@1a: 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: pinctrl@3500000: qup-spi0-cs-gpio: {'phandle': [[52]], 'pinmux': {'pins': ['gpio34', 'gpio35', 'gpio36'], 'function': ['qup00']}, 'pinmux-cs': {'pins': ['gpio37'], 'function': ['gpio']}, 'pinconf': {'pins': ['gpio34', 'gpio35', 'gpio36', 'gpio37'], 'drive-strength': [[2]], 'bias-disable': True}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: pinctrl@3500000: qup-spi1-cs-gpio: {'pinmux': {'pins': ['gpio0', 'gpio1', 'gpio2'], 'function': ['qup01']}, 'pinmux-cs': {'pins': ['gpio3'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: pinctrl@3500000: qup-spi3-cs-gpio: {'pinmux': {'pins': ['gpio38', 'gpio39', 'gpio40'], 'function': ['qup03']}, 'pinmux-cs': {'pins': ['gpio41'], 'function': ['gpio']}} is not of type 'array'
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: panel@0: 'ports', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: sound: dai-link@0:cpu:sound-dai: [[260], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: sound: dai-link@0:codec:sound-dai: [[261], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: sound: dai-link@1:cpu:sound-dai: [[260], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: sound: dai-link@0:cpu:sound-dai: [[261], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: sound: dai-link@0:codec:sound-dai: [[262], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: sound: dai-link@1:cpu:sound-dai: [[261], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: sound: dai-link@0:cpu:sound-dai: [[261], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: sound: dai-link@0:codec:sound-dai: [[262], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: sound: dai-link@1:cpu:sound-dai: [[261], [1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
